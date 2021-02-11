Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F002319477
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:28:26 +0100 (CET)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIZd-0008RM-Fq
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:28:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lAITh-0003ci-Qc; Thu, 11 Feb 2021 15:22:17 -0500
Received: from relay64.bu.edu ([128.197.228.104]:55124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lAITf-0004ae-Py; Thu, 11 Feb 2021 15:22:17 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 11BKKlmT031012
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 11 Feb 2021 15:20:51 -0500
Date: Thu, 11 Feb 2021 15:20:47 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/sd/sdhci: Do not modify BlockSizeRegister if
 transaction in progress
Message-ID: <20210211202047.pmt7rgpvtwggho6x@mozz.bu.edu>
References: <20210208193450.2689517-1-f4bug@amsat.org>
 <20210211170439.fex2yoc74yaa3rof@mozz.bu.edu>
 <7bb7f415-e6b6-a694-59a8-2d362c970205@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bb7f415-e6b6-a694-59a8-2d362c970205@amsat.org>
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@163.com>,
 qemu-devel@nongnu.org, Prasad J Pandit <ppandit@redhat.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210211 2045, Philippe Mathieu-Daudé wrote:
> Hi Alexander,
> 
> On 2/11/21 6:04 PM, Alexander Bulekov wrote:
> > On 210208 2034, Philippe Mathieu-Daudé wrote:
> >> Per the "SD Host Controller Simplified Specification Version 2.00"
> >> spec. 'Table 2-4 : Block Size Register':
> >>
> >>   Transfer Block Size [...] can be accessed only if no
> >>   transaction is executing (i.e., after a transaction has stopped).
> >>   Read operations during transfers may return an invalid value,
> >>   and write operations shall be ignored.
> >>
> >> Transactions will update 'data_count', so do not modify 'blksize'
> >> and 'blkcnt' when 'data_count' is used. This fixes:
> >>
> >> $ cat << EOF | qemu-system-x86_64 -qtest stdio -monitor none \
> >>                -nographic -serial none -M pc-q35-5.0 \
> >>                -device sdhci-pci,sd-spec-version=3 \
> >>                -device sd-card,drive=mydrive \
> >>                -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive
> >>   outl 0xcf8 0x80001810
> >>   outl 0xcfc 0xe1068000
> >>   outl 0xcf8 0x80001814
> >>   outl 0xcf8 0x80001804
> >>   outw 0xcfc 0x7
> >>   outl 0xcf8 0x8000fa20
> >>   write 0xe106802c 0x1 0x0f
> >>   write 0xe1068004 0xc 0x2801d10101fffffbff28a384
> >>   write 0xe106800c 0x1f 0x9dacbbcad9e8f7061524334251606f7e8d9cabbac9d8e7f60514233241505f
> >>   write 0xe1068003 0x28 0x80d000251480d000252280d000253080d000253e80d000254c80d000255a80d000256880d0002576
> >>   write 0xe1068003 0x1 0xfe
> >>   EOF
> >>   =================================================================
> >>   ==2686219==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61500003bb00 at pc 0x55ab469f456c bp 0x7ffee71be330 sp 0x7ffee71bdae0
> >>   WRITE of size 4 at 0x61500003bb00 thread T0
> >>       #0 0x55ab469f456b in __asan_memcpy (qemu-system-i386+0x1cea56b)
> >>       #1 0x55ab483dc396 in stl_he_p include/qemu/bswap.h:353:5
> >>       #2 0x55ab483af5e4 in stn_he_p include/qemu/bswap.h:546:1
> >>       #3 0x55ab483aeb4b in flatview_read_continue softmmu/physmem.c:2839:13
> >>       #4 0x55ab483b0705 in flatview_read softmmu/physmem.c:2877:12
> >>       #5 0x55ab483b028e in address_space_read_full softmmu/physmem.c:2890:18
> >>       #6 0x55ab483b1294 in address_space_rw softmmu/physmem.c:2918:16
> >>       #7 0x55ab479374a2 in dma_memory_rw_relaxed include/sysemu/dma.h:88:12
> >>       #8 0x55ab47936f50 in dma_memory_rw include/sysemu/dma.h:127:12
> >>       #9 0x55ab4793665f in dma_memory_read include/sysemu/dma.h:145:12
> >>       #10 0x55ab4792f176 in sdhci_sdma_transfer_multi_blocks hw/sd/sdhci.c:639:13
> >>       #11 0x55ab4793dc9d in sdhci_write hw/sd/sdhci.c:1129:17
> >>       #12 0x55ab483f8db8 in memory_region_write_accessor softmmu/memory.c:491:5
> >>       #13 0x55ab483f868a in access_with_adjusted_size softmmu/memory.c:552:18
> >>       #14 0x55ab483f6da5 in memory_region_dispatch_write softmmu/memory.c:1501:16
> >>       #15 0x55ab483c3b11 in flatview_write_continue softmmu/physmem.c:2774:23
> >>       #16 0x55ab483b0eb6 in flatview_write softmmu/physmem.c:2814:14
> >>       #17 0x55ab483b0a3e in address_space_write softmmu/physmem.c:2906:18
> >>       #18 0x55ab48465c56 in qtest_process_command softmmu/qtest.c:654:9
> >>
> >>   0x61500003bb00 is located 0 bytes to the right of 512-byte region [0x61500003b900,0x61500003bb00)
> >>   allocated by thread T0 here:
> >>       #0 0x55ab469f58a7 in calloc (qemu-system-i386+0x1ceb8a7)
> >>       #1 0x7f21d678f9b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
> >>       #2 0x55ab479530ed in sdhci_pci_realize hw/sd/sdhci-pci.c:36:5
> >>       #3 0x55ab476f102a in pci_qdev_realize hw/pci/pci.c:2108:9
> >>       #4 0x55ab48baaad2 in device_set_realized hw/core/qdev.c:761:13
> >>
> >>   SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-system-i386+0x1cea56b) in __asan_memcpy
> >>   Shadow bytes around the buggy address:
> >>     0x0c2a7ffff710: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> >>     0x0c2a7ffff720: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>     0x0c2a7ffff730: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>     0x0c2a7ffff740: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>     0x0c2a7ffff750: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>   =>0x0c2a7ffff760:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> >>     0x0c2a7ffff770: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
> >>     0x0c2a7ffff780: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
> >>     0x0c2a7ffff790: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
> >>     0x0c2a7ffff7a0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
> >>     0x0c2a7ffff7b0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> >>   Shadow byte legend (one shadow byte represents 8 application bytes):
> >>     Addressable:           00
> >>     Heap left redzone:       fa
> >>     Freed heap region:       fd
> >>   ==2686219==ABORTING
> >>
> >> Fixes: CVE-2020-17380
> >> Fixes: CVE-2020-25085
> >> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > 
> > I applied this along with <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
> > "hw/sd: sdhci: Do not transfer any data when command fails"
> > 
> > I ran through the entire OSS-Fuzz corpus, and could not reproduce the
> > crash.
> 
> Thanks for your testing, it is helpful!
> 
> However I am a bit confused, because Bin's patch is supposed to
> replace mine. Are you saying Bin's patch doesn't fix the problem?

Ah I misunderstood.

> 
> Could you test this patch without Bin's one?
> 

Wow - Applying only this one, there is still a crash. Applying only
Bin's, there is still a crash. Applying both - no crash ..
Here's a reproducer for crashing with this patch applied. I'll post the
other reproducer in the thread for Bin's patch.

-Alex

cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest -nographic \
-m 512M -nodefaults -device sdhci-pci,sd-spec-version=3 \
-drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
-device sd-card,drive=mydrive -qtest stdio
outl 0xcf8 0x80001013
outl 0xcfc 0x5a
outl 0xcf8 0x80001001
outl 0xcfc 0x06000000
write 0x5a00002c 0x1 0x05
write 0x5a00000f 0x1 0x37
write 0x5a00000a 0x1 0x01
write 0x5a00000f 0x1 0x29
outl 0xcf8 0x80001012
outb 0xcfc 0x1
write 0x5a01000f 0x1 0x02
write 0x5a01000f 0x1 0x03
outl 0xcfc 0x5a55
write 0x5a550005 0x1 0x02
write 0x5a550028 0x1 0x10
write 0x0 0x1 0x21
write 0x6 0x1 0x55
write 0x7 0x1 0x5a
write 0x5a55000a 0x1 0x20
write 0x5a55000c 0x1 0x11
write 0x5a55000e 0x1 0x20
write 0x5a55000f 0x1 0x06
EOF


==768748==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x615000031880 at pc 0x5651b619d4e8 bp 0x7ffff8e7acb0 sp 0x7ffff8e7aca8
WRITE of size 1 at 0x615000031880 thread T0
    #0 0x5651b619d4e7 in sdhci_write_dataport /home/alxndr/Development/qemu/build/../hw/sd/sdhci.c:560:39
    #1 0x5651b619d4e7 in sdhci_write /home/alxndr/Development/qemu/build/../hw/sd/sdhci.c:1178:13
    #2 0x5651b6d6a46c in memory_region_write_accessor /home/alxndr/Development/qemu/build/../softmmu/memory.c:491:5
    #3 0x5651b6d69f6b in access_with_adjusted_size /home/alxndr/Development/qemu/build/../softmmu/memory.c:552:18
    #4 0x5651b6d69770 in memory_region_dispatch_write /home/alxndr/Development/qemu/build/../softmmu/memory.c
    #5 0x5651b71385cb in flatview_write_continue /home/alxndr/Development/qemu/build/../softmmu/physmem.c:2776:23
    #6 0x5651b712dd1b in flatview_write /home/alxndr/Development/qemu/build/../softmmu/physmem.c:2816:14
    #7 0x5651b712dd1b in address_space_write /home/alxndr/Development/qemu/build/../softmmu/physmem.c:2908:18
    #8 0x5651b618d042 in dma_memory_rw_relaxed /home/alxndr/Development/qemu/include/sysemu/dma.h:88:12
    #9 0x5651b618d042 in dma_memory_rw /home/alxndr/Development/qemu/include/sysemu/dma.h:127:12
    #10 0x5651b618d042 in dma_memory_write /home/alxndr/Development/qemu/include/sysemu/dma.h:163:12
    #11 0x5651b618d042 in sdhci_do_adma /home/alxndr/Development/qemu/build/../hw/sd/sdhci.c:783:21
    #12 0x5651b6185251 in sdhci_data_transfer /home/alxndr/Development/qemu/build/../hw/sd/sdhci.c
    #13 0x5651b6199a31 in sdhci_send_command /home/alxndr/Development/qemu/build/../hw/sd/sdhci.c:374:9
    #14 0x5651b6199a31 in sdhci_write /home/alxndr/Development/qemu/build/../hw/sd/sdhci.c:1174:9
    #15 0x5651b6d6a46c in memory_region_write_accessor /home/alxndr/Development/qemu/build/../softmmu/memory.c:491:5
...


> > 
> > Tested-by: Alexander Bulekov <alxndr@bu.edu>
> > Thanks


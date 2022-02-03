Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9707A4A7F47
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 07:26:13 +0100 (CET)
Received: from localhost ([::1]:38606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFVZM-0007hg-9C
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 01:26:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>)
 id 1nFVTY-0006P9-Iw; Thu, 03 Feb 2022 01:20:13 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:56816)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>)
 id 1nFVTV-0002uW-2n; Thu, 03 Feb 2022 01:20:12 -0500
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 8F49972C905;
 Thu,  3 Feb 2022 09:20:06 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id 8BC3C4A46F0;
 Thu,  3 Feb 2022 09:20:05 +0300 (MSK)
Date: Thu, 3 Feb 2022 09:20:05 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2] 9pfs: Fix segfault in do_readdir_many caused by
 struct dirent overread
Message-ID: <20220203062005.chsjk5bb3pftlapn@altlinux.org>
References: <20220128223326.927132-1-vt@altlinux.org>
 <2369945.Qq089p3Et8@silver>
 <20220203045540.3wmae6mp7cnjtzxm@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20220203045540.3wmae6mp7cnjtzxm@altlinux.org>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-stable@nongnu.org, "Dmitry V. Levin" <ldv@altlinux.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 07:55:41AM +0300, Vitaly Chikunov wrote:
> Christian,
> 
> On Wed, Feb 02, 2022 at 05:55:45PM +0100, Christian Schoenebeck wrote:
> > On Freitag, 28. Januar 2022 23:33:26 CET Vitaly Chikunov wrote:
> > > `struct dirent' returned from readdir(3) could be shorter than
> > > `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> > > into unallocated page causing SIGSEGV. Example stack trace:
> > > 
> > >  #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 +
> > > 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64
> > > + 0x4982e9) #2  0x0000555555eb7983 coroutine_trampoline
> > > (/usr/bin/qemu-system-x86_64 + 0x963983) #3  0x00007ffff73e0be0 n/a (n/a +
> > > 0x0)
> > > 
> > > While fixing, provide a helper for any future `struct dirent' cloning.
> > > 
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> > > Cc: qemu-stable@nongnu.org
> > > Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> > > ---
> > > Tested on x86-64 Linux.
> > 
> > I was too optimistic. Looks like this needs more work. With this patch applied
> > the 9p test cases [1] are crashing now:
> > 
> > $ gdb --args tests/qtest/qos-test -m slow
> > ...
> > # Start of flush tests
> > ok 50 /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/flush/success
> > ok 51 /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/flush/ignored
> > # End of flush tests
> > # Start of readdir tests
> 
> I changed implementation from the one using dent->d_reclen to the one using
> strlen(dent->d_name) and it's passed readdir tests, but failed later:
> 
>   # Start of readdir tests
>   ok 53 /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/readdir/basic
>   ok 54 /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/readdir/split_512
>   ok 55 /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/readdir/split_256
>   ok 56 /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/synth/readdir/split_128
>   # End of readdir tests
>   # End of synth tests
>   # Start of local tests
>   # starting QEMU: exec x86_64-softmmu/qemu-system-x86_64 -qtest unix:/tmp/qtest-2822967.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-2822967.qmp,id=char0 -mon chardev=char0,mode=control -display none -M pc  -fsdev local,id=fsdev0,path='/usr/src/RPM/BUILD/qemu-6.2.0/build-dynamic/qtest-9p-local-NpcZCR',security_model=mapped-xattr -device virtio-9p-pci,fsdev=fsdev0,addr=04.0,mount_tag=qtest -accel qtest
>   # GLib-DEBUG: setenv()/putenv() are not thread-safe and should not be used after threads are created
>   ok 57 /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-9p-pci/virtio-9p/virtio-9p-tests/local/config
>   Received response 7 (RLERROR) instead of 73 (RMKDIR)
>   Rlerror has errno 95 (Operation not supported)
>   **
>   ERROR:../tests/qtest/virtio-9p-test.c:305:v9fs_req_recv: assertion failed (hdr.id == id): (7 == 73)
>   Bail out! ERROR:../tests/qtest/virtio-9p-test.c:305:v9fs_req_recv: assertion failed (hdr.id == id): (7 == 73)
>   Aborted

I added some debugging output and in the bug case `d_reclen` is 0. Thus
this is not readdir's struct dirent, but something else (test-only
simulated dirent without accounting that we now have d_reclen logic).

This maybe related to the other bug in 

  static void synth_direntry(V9fsSynthNode *node,
				  struct dirent *entry, off_t off)
  {
      strcpy(entry->d_name, node->name);
      entry->d_ino = node->attr->inode;
      entry->d_off = off + 1;
  }

Where `d_reclen` is not updated.

Thanks,


> 
> Thanks,
> 
> > Broken pipe
> > 
> > Thread 1 "qos-test" received signal SIGABRT, Aborted.
> > __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> > 50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
> > (gdb) bt
> > #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> > #1  0x00007ffff7b7d537 in __GI_abort () at abort.c:79
> > #2  0x00005555555ba495 in qtest_client_socket_recv_line (s=0x5555557663c0) at ../tests/qtest/libqtest.c:503
> > #3  0x00005555555ba5b3 in qtest_rsp_args (s=0x5555557663c0, expected_args=2) at ../tests/qtest/libqtest.c:523
> > #4  0x00005555555bbdb4 in qtest_clock_rsp (s=0x5555557663c0) at ../tests/qtest/libqtest.c:970
> > #5  0x00005555555bbe55 in qtest_clock_step (s=0x5555557663c0, step=100) at ../tests/qtest/libqtest.c:985
> > #6  0x00005555555cdc21 in qvirtio_wait_used_elem (qts=0x5555557663c0, d=0x555555779b48, vq=0x5555557b0480, desc_idx=8, len=0x0, timeout_us=10000000)
> >     at ../tests/qtest/libqos/virtio.c:220
> > #7  0x00005555555ae79f in v9fs_req_wait_for_reply (req=0x5555557899a0, len=0x0) at ../tests/qtest/virtio-9p-test.c:278
> > #8  0x00005555555b03bf in fs_readdir (obj=0x555555779bb0, data=0x0, t_alloc=0x5555557448b8) at ../tests/qtest/virtio-9p-test.c:851
> > #9  0x00005555555990c4 in run_one_test (arg=0x5555557ac600) at ../tests/qtest/qos-test.c:182
> > #10 0x00007ffff7f02b9e in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #11 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #12 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #13 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #14 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #15 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #16 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #17 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #18 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #19 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #20 0x00007ffff7f0299b in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #21 0x00007ffff7f0308a in g_test_run_suite () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #22 0x00007ffff7f030a1 in g_test_run () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> > #23 0x00005555555995a3 in main (argc=1, argv=0x7fffffffe508, envp=0x7fffffffe528) at ../tests/qtest/qos-test.c:338
> > (gdb)
> > 
> > [1] https://wiki.qemu.org/Documentation/9p#Test_Cases
> > 
> > Best regards,
> > Christian Schoenebeck
> > 
> > 


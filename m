Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB822F0BC4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 05:22:01 +0100 (CET)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyoiN-0003M8-KM
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 23:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kyoh7-0002u3-SA
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:20:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:38338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kyoh5-0000eO-7Q
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:20:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kyoh2-0006Pr-UH
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:20:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E32DB2E8047
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:20:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 Jan 2021 04:09:00 -0000
From: Alexander Bulekov <1910941@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr cwmyung
X-Launchpad-Bug-Reporter: Cheol-Woo,Myung (cwmyung)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <161033323107.21336.4834306381083745301.malonedeb@wampee.canonical.com>
Message-Id: <161033814017.22168.8409169910657111242.malone@wampee.canonical.com>
Subject: [Bug 1910941] Re: Assertion `addr < cache->len && 2 <= cache->len -
 addr' in virtio-blk
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 4d96563ed7162de0765764b10e0bcac5e57799b0
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1910941 <1910941@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is OSS-Fuzz Issue 26797

=3D=3D=3D Reproducer =3D=3D=3D
cat << EOF | ./qemu-system-i386 -machine q35 \
-device virtio-blk,drive=3Ddisk0 \
-drive file=3Dnull-co://,id=3Ddisk0,if=3Dnone,format=3Draw \
-serial none -monitor none -qtest stdio -nographic =

outl 0xcf8 0x80001890
outl 0xcfc 0x4
outl 0xcf8 0x8000188a
outl 0xcfc 0xd4624
outl 0xcf8 0x80001894
outl 0xcfc 0x20000002
outl 0xcf8 0x80001889
outl 0xcfc 0x18000000
outl 0xcf8 0x80001896
outl 0xcfc 0x0
outl 0xcf8 0x8000188c
outw 0xcfc 0x20
outl 0xcf8 0x80001894
outl 0xcfc 0x1
outl 0xcf8 0x8000188c
outw 0xcfc 0x1c
outl 0xcf8 0x80001895
outl 0xcfc 0x0
outl 0xcf8 0x80001889
outl 0xcfc 0x18000000
outl 0xcf8 0x80001894
outl 0xcfc 0x40
outl 0xcf8 0x8000188c
outw 0xcfc 0x14
outl 0xcf8 0x80001894
outl 0xcfc 0x1004
EOF

=3D=3D=3D Stack Trace =3D=3D=3D
qemu-fuzz-i386-target-generic-fuzz-virtio-blk: /src/qemu/include/exec/memor=
y_ldst_cached.h.inc:88: void address_space_stw_le_cached(MemoryRegionCache =
*, hwaddr, uint32_t, MemTxAttrs, MemTxResult *): Assertion `addr < cache->l=
en && 2 <=3D cache->len - addr' failed.

=3D=3D2382430=3D=3D ERROR: libFuzzer: deadly signal
#8 address_space_stw_le_cached /src/qemu/include/exec/memory_ldst_cached.h.=
inc:88:5
#9 stw_le_phys_cached /src/qemu/include/exec/memory_ldst_phys.h.inc:121:5
#10 virtio_stw_phys_cached /src/qemu/include/hw/virtio/virtio-access.h:196:9
#11 vring_set_avail_event /src/qemu/hw/virtio/virtio.c:429:5
#12 virtio_queue_split_set_notification /src/qemu/hw/virtio/virtio.c:438:9
#13 virtio_queue_set_notification /src/qemu/hw/virtio/virtio.c:499:9
#14 virtio_blk_handle_vq /src/qemu/hw/block/virtio-blk.c:795:13
#15 virtio_blk_data_plane_handle_output /src/qemu/hw/block/dataplane/virtio=
-blk.c:165:12
#16 virtio_queue_notify_aio_vq /src/qemu/hw/virtio/virtio.c:2326:15
#17 virtio_queue_host_notifier_aio_read /src/qemu/hw/virtio/virtio.c:3533:9
#18 aio_dispatch_handler /src/qemu/util/aio-posix.c:329:9
#19 aio_dispatch_handlers /src/qemu/util/aio-posix.c:372:20
#20 aio_dispatch /src/qemu/util/aio-posix.c:382:5
#21 aio_ctx_dispatch /src/qemu/util/async.c:306:5
#22 g_main_context_dispatch
#23 glib_pollfds_poll /src/qemu/util/main-loop.c:232:9
#24 os_host_main_loop_wait /src/qemu/util/main-loop.c:255:5
#25 main_loop_wait /src/qemu/util/main-loop.c:531:11
#26 flush_events /src/qemu/tests/qtest/fuzz/fuzz.c:49:9
#27 generic_fuzz /src/qemu/tests/qtest/fuzz/generic_fuzz.c:683:17

https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D2qemu-fuzz-i386
-target-generic-fuzz-virtio-blk:
/src/qemu/include/exec/memory_ldst_cached.h.inc:88: void
address_space_stw_le_cached(MemoryRegionCache *, hwaddr, uint32_t,
MemTxAttrs, MemTxResult *): Assertion `addr < cache->len && 2 <=3D
cache->len - addr' failed.6797

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910941

Title:
  Assertion `addr < cache->len && 2 <=3D cache->len - addr' in virtio-blk

Status in QEMU:
  New

Bug description:
  Hello,

  Using hypervisor fuzzer, hyfuzz, I found an assertion failure through
  virtio-blk emulator.

  A malicious guest user/process could use this flaw to abort the QEMU
  process on the host, resulting in a denial of service.

  This was found in version 5.2.0 (master)

  ```

  qemu-system-i386: /home/cwmyung/prj/hyfuzz/src/qemu-master/include/exec/m=
emory_ldst_cached.h.inc:88: void address_space_stw_le_cached(MemoryRegionCa=
che *, hwaddr, uint32_t, MemTxAttrs, MemTxResult *): Assertion `addr < cach=
e->len && 2 <=3D cache->len - addr' failed.
  [1]    1877 abort (core dumped)  /home/cwmyung/prj/hyfuzz/src/qemu-master=
/build/i386-softmmu/qemu-system-i386

  Program terminated with signal SIGABRT, Aborted.
  #0  0x00007f71cc171f47 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdep=
s/unix/sysv/linux/raise.c:51
  #1  0x00007f71cc1738b1 in __GI_abort () at abort.c:79
  #2  0x00007f71cc16342a in __assert_fail_base (fmt=3D0x7f71cc2eaa38 "%s%s%=
s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3Dassertion@entry=3D0x5653=
7b324230 "addr < cache->len && 2 <=3D cache->len - addr", file=3Dfile@entry=
=3D0x56537b32425c "/home/cwmyung/prj/hyfuzz/src/qemu-master/include/exec/me=
mory_ldst_cached.h.inc", line=3Dline@entry=3D0x58, function=3Dfunction@entr=
y=3D0x56537b3242ab "void address_space_stw_le_cached(MemoryRegionCache *, h=
waddr, uint32_t, MemTxAttrs, MemTxResult *)") at assert.c:92
  #3  0x00007f71cc1634a2 in __GI___assert_fail (assertion=3D0x56537b324230 =
"addr < cache->len && 2 <=3D cache->len - addr", file=3D0x56537b32425c "/ho=
me/cwmyung/prj/hyfuzz/src/qemu-master/include/exec/memory_ldst_cached.h.inc=
", line=3D0x58, function=3D0x56537b3242ab "void address_space_stw_le_cached=
(MemoryRegionCache *, hwaddr, uint32_t, MemTxAttrs, MemTxResult *)") at ass=
ert.c:101
  #4  0x000056537af3c917 in address_space_stw_le_cached (attrs=3D..., resul=
t=3D<optimized out>, cache=3D<optimized out>, addr=3D<optimized out>, val=
=3D<optimized out>) at /home/cwmyung/prj/hyfuzz/src/qemu-master/include/exe=
c/memory_ldst_cached.h.inc:88
  #5  0x000056537af3c917 in stw_le_phys_cached (cache=3D<optimized out>, ad=
dr=3D<optimized out>, val=3D<optimized out>) at /home/cwmyung/prj/hyfuzz/sr=
c/qemu-master/include/exec/memory_ldst_phys.h.inc:121
  #6  0x000056537af3c917 in virtio_stw_phys_cached (vdev=3D<optimized out>,=
 cache=3D<optimized out>, pa=3D<optimized out>, value=3D<optimized out>) at=
 /home/cwmyung/prj/hyfuzz/src/qemu-master/include/hw/virtio/virtio-access.h=
:196
  #7  0x000056537af2b809 in vring_set_avail_event (vq=3D<optimized out>, va=
l=3D0x0) at ../hw/virtio/virtio.c:429
  #8  0x000056537af2b809 in virtio_queue_split_set_notification (vq=3D<opti=
mized out>, enable=3D<optimized out>) at ../hw/virtio/virtio.c:438
  #9  0x000056537af2b809 in virtio_queue_set_notification (vq=3D<optimized =
out>, enable=3D0x1) at ../hw/virtio/virtio.c:499
  #10 0x000056537b07ce1c in virtio_blk_handle_vq (s=3D0x56537d6bb3a0, vq=3D=
0x56537d6c0680) at ../hw/block/virtio-blk.c:795
  #11 0x000056537af3eb4d in virtio_queue_notify_aio_vq (vq=3D0x56537d6c0680=
) at ../hw/virtio/virtio.c:2326
  #12 0x000056537af3ba04 in virtio_queue_host_notifier_aio_read (n=3D<optim=
ized out>) at ../hw/virtio/virtio.c:3533
  #13 0x000056537b20901c in aio_dispatch_handler (ctx=3D0x56537c4179f0, nod=
e=3D0x7f71a810b370) at ../util/aio-posix.c:329
  #14 0x000056537b20838c in aio_dispatch_handlers (ctx=3D<optimized out>) a=
t ../util/aio-posix.c:372
  #15 0x000056537b20838c in aio_dispatch (ctx=3D0x56537c4179f0) at ../util/=
aio-posix.c:382
  #16 0x000056537b1f99cb in aio_ctx_dispatch (source=3D0x2, callback=3D0x7f=
fc8add9f90, user_data=3D0x0) at ../util/async.c:306
  #17 0x00007f71d1c10417 in g_main_context_dispatch () at /usr/lib/x86_64-l=
inux-gnu/libglib-2.0.so.0
  #18 0x000056537b1f1bab in glib_pollfds_poll () at ../util/main-loop.c:232
  #19 0x000056537b1f1bab in os_host_main_loop_wait (timeout=3D<optimized ou=
t>) at ../util/main-loop.c:255
  #20 0x000056537b1f1bab in main_loop_wait (nonblocking=3D<optimized out>) =
at ../util/main-loop.c:531
  #21 0x000056537af879d7 in qemu_main_loop () at ../softmmu/runstate.c:720
  #22 0x000056537a928a3b in main (argc=3D<optimized out>, argc@entry=3D0x15=
, argv=3D<optimized out>, argv@entry=3D0x7ffc8adda718, envp=3D<optimized ou=
t>) at ../softmmu/main.c:50
  #23 0x00007f71cc154b97 in __libc_start_main (main=3D0x56537a928a30 <main>=
, argc=3D0x15, argv=3D0x7ffc8adda718, init=3D<optimized out>, fini=3D<optim=
ized out>, rtld_fini=3D<optimized out>, stack_end=3D0x7ffc8adda708) at ../c=
su/libc-start.c:310
  #24 0x000056537a92894a in _start ()

  ```

  To reproduce this issue, please run the QEMU with the following
  command line.

  ```

  # To reproduce this issue, please run the QEMU process with the
  following command line.

  $ qemu-system-i386 -m 512  -drive
  file=3Dhyfuzz.img,index=3D0,media=3Ddisk,format=3Draw -device virtio-blk-
  pci,drive=3Ddrive0,id=3Dvirtblk0,num-queues=3D4 -drive
  file=3Ddisk.img,if=3Dnone,id=3Ddrive0

  ```

  Please let me know if I can provide any further info.

  Thank you.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910941/+subscriptions


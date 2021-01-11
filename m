Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B249C2F0B3D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 03:56:28 +0100 (CET)
Received: from localhost ([::1]:55636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kynNb-0003iw-D9
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 21:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kynMr-0003Gh-1u
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 21:55:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:59548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kynMo-0008Ca-9e
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 21:55:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kynMm-000143-ET
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 02:55:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6A3542E8137
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 02:55:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 Jan 2021 02:47:10 -0000
From: "Cheol-Woo,Myung" <1910941@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cwmyung
X-Launchpad-Bug-Reporter: Cheol-Woo,Myung (cwmyung)
X-Launchpad-Bug-Modifier: Cheol-Woo,Myung (cwmyung)
Message-Id: <161033323107.21336.4834306381083745301.malonedeb@wampee.canonical.com>
Subject: [Bug 1910941] [NEW] Assertion `addr < cache->len && 2 <= cache->len -
 addr' in virtio-blk
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 365b068f8d3ea5ebda09a9621457df76627e3c69
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

Public bug reported:

Hello,

Using hypervisor fuzzer, hyfuzz, I found an assertion failure through
virtio-blk emulator.

A malicious guest user/process could use this flaw to abort the QEMU
process on the host, resulting in a denial of service.

This was found in version 5.2.0 (master)

```

qemu-system-i386: /home/cwmyung/prj/hyfuzz/src/qemu-master/include/exec/mem=
ory_ldst_cached.h.inc:88: void address_space_stw_le_cached(MemoryRegionCach=
e *, hwaddr, uint32_t, MemTxAttrs, MemTxResult *): Assertion `addr < cache-=
>len && 2 <=3D cache->len - addr' failed.
[1]    1877 abort (core dumped)  /home/cwmyung/prj/hyfuzz/src/qemu-master/b=
uild/i386-softmmu/qemu-system-i386

Program terminated with signal SIGABRT, Aborted.
#0  0x00007f71cc171f47 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdeps/=
unix/sysv/linux/raise.c:51
#1  0x00007f71cc1738b1 in __GI_abort () at abort.c:79
#2  0x00007f71cc16342a in __assert_fail_base (fmt=3D0x7f71cc2eaa38 "%s%s%s:=
%u: %s%sAssertion `%s' failed.\n%n", assertion=3Dassertion@entry=3D0x56537b=
324230 "addr < cache->len && 2 <=3D cache->len - addr", file=3Dfile@entry=
=3D0x56537b32425c "/home/cwmyung/prj/hyfuzz/src/qemu-master/include/exec/me=
mory_ldst_cached.h.inc", line=3Dline@entry=3D0x58, function=3Dfunction@entr=
y=3D0x56537b3242ab "void address_space_stw_le_cached(MemoryRegionCache *, h=
waddr, uint32_t, MemTxAttrs, MemTxResult *)") at assert.c:92
#3  0x00007f71cc1634a2 in __GI___assert_fail (assertion=3D0x56537b324230 "a=
ddr < cache->len && 2 <=3D cache->len - addr", file=3D0x56537b32425c "/home=
/cwmyung/prj/hyfuzz/src/qemu-master/include/exec/memory_ldst_cached.h.inc",=
 line=3D0x58, function=3D0x56537b3242ab "void address_space_stw_le_cached(M=
emoryRegionCache *, hwaddr, uint32_t, MemTxAttrs, MemTxResult *)") at asser=
t.c:101
#4  0x000056537af3c917 in address_space_stw_le_cached (attrs=3D..., result=
=3D<optimized out>, cache=3D<optimized out>, addr=3D<optimized out>, val=3D=
<optimized out>) at /home/cwmyung/prj/hyfuzz/src/qemu-master/include/exec/m=
emory_ldst_cached.h.inc:88
#5  0x000056537af3c917 in stw_le_phys_cached (cache=3D<optimized out>, addr=
=3D<optimized out>, val=3D<optimized out>) at /home/cwmyung/prj/hyfuzz/src/=
qemu-master/include/exec/memory_ldst_phys.h.inc:121
#6  0x000056537af3c917 in virtio_stw_phys_cached (vdev=3D<optimized out>, c=
ache=3D<optimized out>, pa=3D<optimized out>, value=3D<optimized out>) at /=
home/cwmyung/prj/hyfuzz/src/qemu-master/include/hw/virtio/virtio-access.h:1=
96
#7  0x000056537af2b809 in vring_set_avail_event (vq=3D<optimized out>, val=
=3D0x0) at ../hw/virtio/virtio.c:429
#8  0x000056537af2b809 in virtio_queue_split_set_notification (vq=3D<optimi=
zed out>, enable=3D<optimized out>) at ../hw/virtio/virtio.c:438
#9  0x000056537af2b809 in virtio_queue_set_notification (vq=3D<optimized ou=
t>, enable=3D0x1) at ../hw/virtio/virtio.c:499
#10 0x000056537b07ce1c in virtio_blk_handle_vq (s=3D0x56537d6bb3a0, vq=3D0x=
56537d6c0680) at ../hw/block/virtio-blk.c:795
#11 0x000056537af3eb4d in virtio_queue_notify_aio_vq (vq=3D0x56537d6c0680) =
at ../hw/virtio/virtio.c:2326
#12 0x000056537af3ba04 in virtio_queue_host_notifier_aio_read (n=3D<optimiz=
ed out>) at ../hw/virtio/virtio.c:3533
#13 0x000056537b20901c in aio_dispatch_handler (ctx=3D0x56537c4179f0, node=
=3D0x7f71a810b370) at ../util/aio-posix.c:329
#14 0x000056537b20838c in aio_dispatch_handlers (ctx=3D<optimized out>) at =
../util/aio-posix.c:372
#15 0x000056537b20838c in aio_dispatch (ctx=3D0x56537c4179f0) at ../util/ai=
o-posix.c:382
#16 0x000056537b1f99cb in aio_ctx_dispatch (source=3D0x2, callback=3D0x7ffc=
8add9f90, user_data=3D0x0) at ../util/async.c:306
#17 0x00007f71d1c10417 in g_main_context_dispatch () at /usr/lib/x86_64-lin=
ux-gnu/libglib-2.0.so.0
#18 0x000056537b1f1bab in glib_pollfds_poll () at ../util/main-loop.c:232
#19 0x000056537b1f1bab in os_host_main_loop_wait (timeout=3D<optimized out>=
) at ../util/main-loop.c:255
#20 0x000056537b1f1bab in main_loop_wait (nonblocking=3D<optimized out>) at=
 ../util/main-loop.c:531
#21 0x000056537af879d7 in qemu_main_loop () at ../softmmu/runstate.c:720
#22 0x000056537a928a3b in main (argc=3D<optimized out>, argc@entry=3D0x15, =
argv=3D<optimized out>, argv@entry=3D0x7ffc8adda718, envp=3D<optimized out>=
) at ../softmmu/main.c:50
#23 0x00007f71cc154b97 in __libc_start_main (main=3D0x56537a928a30 <main>, =
argc=3D0x15, argv=3D0x7ffc8adda718, init=3D<optimized out>, fini=3D<optimiz=
ed out>, rtld_fini=3D<optimized out>, stack_end=3D0x7ffc8adda708) at ../csu=
/libc-start.c:310
#24 0x000056537a92894a in _start ()

```

To reproduce this issue, please run the QEMU with the following command
line.

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

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "attachment.tar.gz"
   https://bugs.launchpad.net/bugs/1910941/+attachment/5451586/+files/attac=
hment.tar.gz

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


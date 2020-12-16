Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967302DBD40
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:04:54 +0100 (CET)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSjt-0007gg-6P
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpSgA-0006Bj-S1
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:01:08 -0500
Received: from indium.canonical.com ([91.189.90.7]:56658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpSg7-00042M-9t
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:01:02 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kpSg3-0006jJ-Ix
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 09:00:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8E7B02E8047
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 09:00:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Dec 2020 08:54:35 -0000
From: Gaoning Pan <1908369@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hades0506
X-Launchpad-Bug-Reporter: Gaoning Pan (hades0506)
X-Launchpad-Bug-Modifier: Gaoning Pan (hades0506)
Message-Id: <160810887564.16424.16206895369407245317.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1908369] [NEW] heap-use-after-free in in nic_reset
 ../hw/net/eepro100.c:616
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 56cc448746f7abfbf97a581b0d4dd73646f543da
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1908369 <1908369@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,

An heap-use-after-free issue was found in hw/net/eepro100.c:616 in
latest version 5.2.0.

This issue was found when I was debugging Qemu in monitor. When I attach
An eepro100 NIC, and reload the snapshot, the use-after-free triggers.

Qemu boot command is as follows:
./qemu-5.2.0-rc4/build/qemu-system-x86_64 -enable-kvm -boot c -m 2G -drive =
format=3Dqcow2,file=3D./ubuntu.img -display none -monitor stdio
(qemu) device_add i82559a,id=3Deepro
(qemu) device_del eepro
(qemu) savevm tag0
(qemu) loadvm tag0


Backtrace is as follows:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D32048=3D=3DERROR: AddressSanitizer: heap-use-after-free on address 0x=
6280000449f0 at pc 0x7f751f5eed1a bp 0x7ffcd01f2cf0 sp 0x7ffcd01f2498
WRITE of size 8 at 0x6280000449f0 thread T0
    #0 0x7f751f5eed19  (/usr/lib/x86_64-linux-gnu/libasan.so.4+0x5ed19)
    #1 0x55948f3c9287 in nic_reset ../hw/net/eepro100.c:616
    #2 0x5594900f481a in qemu_devices_reset ../hw/core/reset.c:69
    #3 0x55948fae72e7 in pc_machine_reset ../hw/i386/pc.c:1615
    #4 0x55948fda10af in qemu_system_reset ../softmmu/vl.c:1405
    #5 0x55948f1ce8ed in load_snapshot ../migration/savevm.c:3008
    #6 0x55948f7420e9 in hmp_loadvm ../monitor/hmp-cmds.c:1133
    #7 0x55948f7e4319 in handle_hmp_command ../monitor/hmp.c:1100
    #8 0x55948f7dbf1f in monitor_command_cb ../monitor/hmp.c:47
    #9 0x559490599854 in readline_handle_byte ../util/readline.c:408
    #10 0x55948f7e635a in monitor_read ../monitor/hmp.c:1340
    #11 0x5594900c25c5 in qemu_chr_be_write_impl ../chardev/char.c:201
    #12 0x5594900c266b in qemu_chr_be_write ../chardev/char.c:213
    #13 0x5594900df9ce in fd_chr_read ../chardev/char-fd.c:68
    #14 0x55949011f217 in qio_channel_fd_source_dispatch ../io/channel-watc=
h.c:84
    #15 0x7f751e056284 in g_main_context_dispatch (/usr/lib/x86_64-linux-gn=
u/libglib-2.0.so.0+0x4c284)
    #16 0x559490580e97 in glib_pollfds_poll ../util/main-loop.c:221
    #17 0x559490580fb3 in os_host_main_loop_wait ../util/main-loop.c:244
    #18 0x55949058124f in main_loop_wait ../util/main-loop.c:520
    #19 0x55948fda1e53 in qemu_main_loop ../softmmu/vl.c:1678
    #20 0x55948f183c76 in main ../softmmu/main.c:50
    #21 0x7f751a8e3b96 in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x21b96)
    #22 0x55948f183b69 in _start (/home/zjusvn/qemu5-hypervisor/qemu-5.2.0-=
rc4/build/qemu-system-x86_64+0x19c6b69)

0x6280000449f0 is located 2288 bytes inside of 15616-byte region [0x6280000=
44100,0x628000047e00)
freed by thread T1 here:
    #0 0x7f751f66e7a8 in __interceptor_free (/usr/lib/x86_64-linux-gnu/liba=
san.so.4+0xde7a8)
    #1 0x5594900ade06 in object_finalize ../qom/object.c:689
    #2 0x5594900b04fe in object_unref ../qom/object.c:1183
    #3 0x5594900eae68 in bus_free_bus_child ../hw/core/qdev.c:56
    #4 0x55949055d2d7 in call_rcu_thread ../util/rcu.c:281
    #5 0x5594905ad296 in qemu_thread_start ../util/qemu-thread-posix.c:521
    #6 0x7f751acba6da in start_thread (/lib/x86_64-linux-gnu/libpthread.so.=
0+0x76da)

previously allocated by thread T0 here:
    #0 0x7f751f66eb40 in __interceptor_malloc (/usr/lib/x86_64-linux-gnu/li=
basan.so.4+0xdeb40)
    #1 0x7f751e05bab8 in g_malloc (/usr/lib/x86_64-linux-gnu/libglib-2.0.so=
.0+0x51ab8)
    #2 0x5594900ae04f in object_new ../qom/object.c:744
    #3 0x5594900ec0c3 in qdev_new ../hw/core/qdev.c:154
    #4 0x55948f37b084 in qdev_device_add ../softmmu/qdev-monitor.c:654
    #5 0x55948f37c36d in qmp_device_add ../softmmu/qdev-monitor.c:805
    #6 0x55948f37cd40 in hmp_device_add ../softmmu/qdev-monitor.c:916
    #7 0x55948f7e4319 in handle_hmp_command ../monitor/hmp.c:1100
    #8 0x55948f7dbf1f in monitor_command_cb ../monitor/hmp.c:47
    #9 0x559490599854 in readline_handle_byte ../util/readline.c:408
    #10 0x55948f7e635a in monitor_read ../monitor/hmp.c:1340
    #11 0x5594900c25c5 in qemu_chr_be_write_impl ../chardev/char.c:201
    #12 0x5594900c266b in qemu_chr_be_write ../chardev/char.c:213
    #13 0x5594900df9ce in fd_chr_read ../chardev/char-fd.c:68
    #14 0x55949011f217 in qio_channel_fd_source_dispatch ../io/channel-watc=
h.c:84
    #15 0x7f751e056284 in g_main_context_dispatch (/usr/lib/x86_64-linux-gn=
u/libglib-2.0.so.0+0x4c284)

Thread T1 created by T0 here:
    #0 0x7f751f5c7d2f in __interceptor_pthread_create (/usr/lib/x86_64-linu=
x-gnu/libasan.so.4+0x37d2f)
    #1 0x5594905ad673 in qemu_thread_create ../util/qemu-thread-posix.c:558
    #2 0x55949055d8f0 in rcu_init_complete ../util/rcu.c:379
    #3 0x55949055dab9 in rcu_init ../util/rcu.c:435
    #4 0x55949068e5dc in __libc_csu_init (/home/zjusvn/qemu5-hypervisor/qem=
u-5.2.0-rc4/build/qemu-system-x86_64+0x2ed15dc)

SUMMARY: AddressSanitizer: heap-use-after-free (/usr/lib/x86_64-linux-gnu/l=
ibasan.so.4+0x5ed19)
Shadow bytes around the buggy address:
  0x0c50800008e0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  0x0c50800008f0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  0x0c5080000900: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  0x0c5080000910: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  0x0c5080000920: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
=3D>0x0c5080000930: fd fd fd fd fd fd fd fd fd fd fd fd fd fd[fd]fd
  0x0c5080000940: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  0x0c5080000950: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  0x0c5080000960: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  0x0c5080000970: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  0x0c5080000980: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07
  Heap left redzone:       fa
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Container overflow:      fc
  Array cookie:            ac
  Intra object redzone:    bb
  ASan internal:           fe
  Left alloca redzone:     ca
  Right alloca redzone:    cb
=3D=3D32048=3D=3DABORTING


Thanks.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908369

Title:
  heap-use-after-free in in nic_reset ../hw/net/eepro100.c:616

Status in QEMU:
  New

Bug description:
  Hello,

  An heap-use-after-free issue was found in hw/net/eepro100.c:616 in
  latest version 5.2.0.

  This issue was found when I was debugging Qemu in monitor. When I
  attach An eepro100 NIC, and reload the snapshot, the use-after-free
  triggers.

  Qemu boot command is as follows:
  ./qemu-5.2.0-rc4/build/qemu-system-x86_64 -enable-kvm -boot c -m 2G -driv=
e format=3Dqcow2,file=3D./ubuntu.img -display none -monitor stdio
  (qemu) device_add i82559a,id=3Deepro
  (qemu) device_del eepro
  (qemu) savevm tag0
  (qemu) loadvm tag0

  =

  Backtrace is as follows:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D32048=3D=3DERROR: AddressSanitizer: heap-use-after-free on address =
0x6280000449f0 at pc 0x7f751f5eed1a bp 0x7ffcd01f2cf0 sp 0x7ffcd01f2498
  WRITE of size 8 at 0x6280000449f0 thread T0
      #0 0x7f751f5eed19  (/usr/lib/x86_64-linux-gnu/libasan.so.4+0x5ed19)
      #1 0x55948f3c9287 in nic_reset ../hw/net/eepro100.c:616
      #2 0x5594900f481a in qemu_devices_reset ../hw/core/reset.c:69
      #3 0x55948fae72e7 in pc_machine_reset ../hw/i386/pc.c:1615
      #4 0x55948fda10af in qemu_system_reset ../softmmu/vl.c:1405
      #5 0x55948f1ce8ed in load_snapshot ../migration/savevm.c:3008
      #6 0x55948f7420e9 in hmp_loadvm ../monitor/hmp-cmds.c:1133
      #7 0x55948f7e4319 in handle_hmp_command ../monitor/hmp.c:1100
      #8 0x55948f7dbf1f in monitor_command_cb ../monitor/hmp.c:47
      #9 0x559490599854 in readline_handle_byte ../util/readline.c:408
      #10 0x55948f7e635a in monitor_read ../monitor/hmp.c:1340
      #11 0x5594900c25c5 in qemu_chr_be_write_impl ../chardev/char.c:201
      #12 0x5594900c266b in qemu_chr_be_write ../chardev/char.c:213
      #13 0x5594900df9ce in fd_chr_read ../chardev/char-fd.c:68
      #14 0x55949011f217 in qio_channel_fd_source_dispatch ../io/channel-wa=
tch.c:84
      #15 0x7f751e056284 in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x4c284)
      #16 0x559490580e97 in glib_pollfds_poll ../util/main-loop.c:221
      #17 0x559490580fb3 in os_host_main_loop_wait ../util/main-loop.c:244
      #18 0x55949058124f in main_loop_wait ../util/main-loop.c:520
      #19 0x55948fda1e53 in qemu_main_loop ../softmmu/vl.c:1678
      #20 0x55948f183c76 in main ../softmmu/main.c:50
      #21 0x7f751a8e3b96 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x21b96)
      #22 0x55948f183b69 in _start (/home/zjusvn/qemu5-hypervisor/qemu-5.2.=
0-rc4/build/qemu-system-x86_64+0x19c6b69)

  0x6280000449f0 is located 2288 bytes inside of 15616-byte region [0x62800=
0044100,0x628000047e00)
  freed by thread T1 here:
      #0 0x7f751f66e7a8 in __interceptor_free (/usr/lib/x86_64-linux-gnu/li=
basan.so.4+0xde7a8)
      #1 0x5594900ade06 in object_finalize ../qom/object.c:689
      #2 0x5594900b04fe in object_unref ../qom/object.c:1183
      #3 0x5594900eae68 in bus_free_bus_child ../hw/core/qdev.c:56
      #4 0x55949055d2d7 in call_rcu_thread ../util/rcu.c:281
      #5 0x5594905ad296 in qemu_thread_start ../util/qemu-thread-posix.c:521
      #6 0x7f751acba6da in start_thread (/lib/x86_64-linux-gnu/libpthread.s=
o.0+0x76da)

  previously allocated by thread T0 here:
      #0 0x7f751f66eb40 in __interceptor_malloc (/usr/lib/x86_64-linux-gnu/=
libasan.so.4+0xdeb40)
      #1 0x7f751e05bab8 in g_malloc (/usr/lib/x86_64-linux-gnu/libglib-2.0.=
so.0+0x51ab8)
      #2 0x5594900ae04f in object_new ../qom/object.c:744
      #3 0x5594900ec0c3 in qdev_new ../hw/core/qdev.c:154
      #4 0x55948f37b084 in qdev_device_add ../softmmu/qdev-monitor.c:654
      #5 0x55948f37c36d in qmp_device_add ../softmmu/qdev-monitor.c:805
      #6 0x55948f37cd40 in hmp_device_add ../softmmu/qdev-monitor.c:916
      #7 0x55948f7e4319 in handle_hmp_command ../monitor/hmp.c:1100
      #8 0x55948f7dbf1f in monitor_command_cb ../monitor/hmp.c:47
      #9 0x559490599854 in readline_handle_byte ../util/readline.c:408
      #10 0x55948f7e635a in monitor_read ../monitor/hmp.c:1340
      #11 0x5594900c25c5 in qemu_chr_be_write_impl ../chardev/char.c:201
      #12 0x5594900c266b in qemu_chr_be_write ../chardev/char.c:213
      #13 0x5594900df9ce in fd_chr_read ../chardev/char-fd.c:68
      #14 0x55949011f217 in qio_channel_fd_source_dispatch ../io/channel-wa=
tch.c:84
      #15 0x7f751e056284 in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x4c284)

  Thread T1 created by T0 here:
      #0 0x7f751f5c7d2f in __interceptor_pthread_create (/usr/lib/x86_64-li=
nux-gnu/libasan.so.4+0x37d2f)
      #1 0x5594905ad673 in qemu_thread_create ../util/qemu-thread-posix.c:5=
58
      #2 0x55949055d8f0 in rcu_init_complete ../util/rcu.c:379
      #3 0x55949055dab9 in rcu_init ../util/rcu.c:435
      #4 0x55949068e5dc in __libc_csu_init (/home/zjusvn/qemu5-hypervisor/q=
emu-5.2.0-rc4/build/qemu-system-x86_64+0x2ed15dc)

  SUMMARY: AddressSanitizer: heap-use-after-free (/usr/lib/x86_64-linux-gnu=
/libasan.so.4+0x5ed19)
  Shadow bytes around the buggy address:
    0x0c50800008e0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c50800008f0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c5080000900: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c5080000910: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c5080000920: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  =3D>0x0c5080000930: fd fd fd fd fd fd fd fd fd fd fd fd fd fd[fd]fd
    0x0c5080000940: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c5080000950: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c5080000960: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c5080000970: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c5080000980: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  Shadow byte legend (one shadow byte represents 8 application bytes):
    Addressable:           00
    Partially addressable: 01 02 03 04 05 06 07
    Heap left redzone:       fa
    Freed heap region:       fd
    Stack left redzone:      f1
    Stack mid redzone:       f2
    Stack right redzone:     f3
    Stack after return:      f5
    Stack use after scope:   f8
    Global redzone:          f9
    Global init order:       f6
    Poisoned by user:        f7
    Container overflow:      fc
    Array cookie:            ac
    Intra object redzone:    bb
    ASan internal:           fe
    Left alloca redzone:     ca
    Right alloca redzone:    cb
  =3D=3D32048=3D=3DABORTING

  =

  Thanks.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908369/+subscriptions


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDA9321BD9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:51:14 +0100 (CET)
Received: from localhost ([::1]:49514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDUP-0008Bl-RC
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lEDKX-0007o0-Gb
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:41:01 -0500
Received: from indium.canonical.com ([91.189.90.7]:36838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lEDKR-0005De-7F
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:41:01 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lEDKO-0001E0-LK
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 15:40:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 73E462E80FC
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 15:40:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Feb 2021 15:34:39 -0000
From: Maya <1916501@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mrashish
X-Launchpad-Bug-Reporter: Maya (mrashish)
X-Launchpad-Bug-Modifier: Maya (mrashish)
Message-Id: <161400808000.28728.8511381080583624216.malonedeb@soybean.canonical.com>
Subject: [Bug 1916501] [NEW] qemu-img convert segfaults with specific URL
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bbfee60eef9f7fd8d30b24b3f53e75656e4d5fb0"; Instance="production"
X-Launchpad-Hash: f0b407869081d031559aec045c98b023aaba2c23
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1916501 <1916501@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Using what is currently the latest git: (commit
00d8ba9e0d62ea1c7459c25aeabf9c8bb7659462, Date:   Sun Feb 21 19:52:58
2021 +0000)

$ ./build/qemu-img convert -f qcow2 -O raw https://download.cirros-cloud.ne=
t/0.4.0/cirros-0.4.0-x86_64-disk.img out.img
Segmentation fault (core dumped)


Backtrace for convenience:
qemu: qemu_mutex_lock_impl: Invalid argument

Thread 1 "qemu-img" received signal SIGABRT, Aborted.
0x00007ffff77c59d5 in raise () from /lib64/libc.so.6
(gdb) bt
#0  0x00007ffff77c59d5 in raise () from /lib64/libc.so.6
#1  0x00007ffff77ae8a4 in abort () from /lib64/libc.so.6
#2  0x00005555556705b2 in error_exit (err=3D<optimized out>, msg=3Dmsg@entr=
y=3D0x5555556b69a0 <__func__.31> "qemu_mutex_lock_impl") at ../util/qemu-th=
read-posix.c:37
#3  0x0000555555670945 in qemu_mutex_lock_impl (mutex=3D0x555555ae3758, fil=
e=3D0x5555556827a2 "../block/curl.c", line=3D406) at ../util/qemu-thread-po=
six.c:81
#4  0x000055555559a05b in curl_multi_do (arg=3D0x555555aad2a0) at ../block/=
curl.c:406
#5  0x000055555566193a in aio_dispatch_handler (ctx=3Dctx@entry=3D0x5555557=
37790, node=3D0x555555b14150) at ../util/aio-posix.c:329
#6  0x0000555555662072 in aio_dispatch_handlers (ctx=3D0x555555737790) at .=
./util/aio-posix.c:372
#7  aio_dispatch (ctx=3D0x555555737790) at ../util/aio-posix.c:382
#8  0x000055555564442e in aio_ctx_dispatch (source=3D<optimized out>, callb=
ack=3D<optimized out>, user_data=3D<optimized out>) at ../util/async.c:306
#9  0x00007ffff7cfda9f in g_main_context_dispatch () from /lib64/libglib-2.=
0.so.0
#10 0x000055555566f2c8 in glib_pollfds_poll () at ../util/main-loop.c:232
#11 os_host_main_loop_wait (timeout=3D4397000000) at ../util/main-loop.c:255
#12 main_loop_wait (nonblocking=3Dnonblocking@entry=3D0) at ../util/main-lo=
op.c:531
#13 0x0000555555581edd in convert_do_copy (s=3D0x7fffffffd3a0) at ../qemu-i=
mg.c:2139
#14 img_convert (argc=3D<optimized out>, argv=3D<optimized out>) at ../qemu=
-img.c:2738
#15 0x00005555555783b1 in main (argc=3D7, argv=3D<optimized out>) at ../qem=
u-img.c:5536

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916501

Title:
  qemu-img convert segfaults with specific URL

Status in QEMU:
  New

Bug description:
  Using what is currently the latest git: (commit
  00d8ba9e0d62ea1c7459c25aeabf9c8bb7659462, Date:   Sun Feb 21 19:52:58
  2021 +0000)

  $ ./build/qemu-img convert -f qcow2 -O raw https://download.cirros-cloud.=
net/0.4.0/cirros-0.4.0-x86_64-disk.img out.img
  Segmentation fault (core dumped)

  =

  Backtrace for convenience:
  qemu: qemu_mutex_lock_impl: Invalid argument

  Thread 1 "qemu-img" received signal SIGABRT, Aborted.
  0x00007ffff77c59d5 in raise () from /lib64/libc.so.6
  (gdb) bt
  #0  0x00007ffff77c59d5 in raise () from /lib64/libc.so.6
  #1  0x00007ffff77ae8a4 in abort () from /lib64/libc.so.6
  #2  0x00005555556705b2 in error_exit (err=3D<optimized out>, msg=3Dmsg@en=
try=3D0x5555556b69a0 <__func__.31> "qemu_mutex_lock_impl") at ../util/qemu-=
thread-posix.c:37
  #3  0x0000555555670945 in qemu_mutex_lock_impl (mutex=3D0x555555ae3758, f=
ile=3D0x5555556827a2 "../block/curl.c", line=3D406) at ../util/qemu-thread-=
posix.c:81
  #4  0x000055555559a05b in curl_multi_do (arg=3D0x555555aad2a0) at ../bloc=
k/curl.c:406
  #5  0x000055555566193a in aio_dispatch_handler (ctx=3Dctx@entry=3D0x55555=
5737790, node=3D0x555555b14150) at ../util/aio-posix.c:329
  #6  0x0000555555662072 in aio_dispatch_handlers (ctx=3D0x555555737790) at=
 ../util/aio-posix.c:372
  #7  aio_dispatch (ctx=3D0x555555737790) at ../util/aio-posix.c:382
  #8  0x000055555564442e in aio_ctx_dispatch (source=3D<optimized out>, cal=
lback=3D<optimized out>, user_data=3D<optimized out>) at ../util/async.c:306
  #9  0x00007ffff7cfda9f in g_main_context_dispatch () from /lib64/libglib-=
2.0.so.0
  #10 0x000055555566f2c8 in glib_pollfds_poll () at ../util/main-loop.c:232
  #11 os_host_main_loop_wait (timeout=3D4397000000) at ../util/main-loop.c:=
255
  #12 main_loop_wait (nonblocking=3Dnonblocking@entry=3D0) at ../util/main-=
loop.c:531
  #13 0x0000555555581edd in convert_do_copy (s=3D0x7fffffffd3a0) at ../qemu=
-img.c:2139
  #14 img_convert (argc=3D<optimized out>, argv=3D<optimized out>) at ../qe=
mu-img.c:2738
  #15 0x00005555555783b1 in main (argc=3D7, argv=3D<optimized out>) at ../q=
emu-img.c:5536

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1916501/+subscriptions


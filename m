Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD63ADCDE
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:38:58 +0200 (CEST)
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lupEX-0003uV-MJ
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup29-0008Sw-93
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:45658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup24-0002ou-Cs
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lup20-0003g3-OW
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:26:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 391A22E8232
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Jun 2021 04:17:25 -0000
From: Launchpad Bug Tracker <1813398@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bugdal janitor nsz th-huth
X-Launchpad-Bug-Reporter: Szabolcs Nagy (nsz)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154851076407.2082.8506477460504942900.malonedeb@wampee.canonical.com>
Message-Id: <162416264585.7948.16813272351307031795.malone@loganberry.canonical.com>
Subject: [Bug 1813398] Re: qemu user calls malloc after fork in multi-threaded
 process
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: e5eab67a038d3dad093090fcabdd5161172fecdd
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
Reply-To: Bug 1813398 <1813398@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1813398

Title:
  qemu user calls malloc after fork in multi-threaded process

Status in QEMU:
  Expired

Bug description:
  qemu user may hang in malloc on a musl based system because
  it calls malloc after fork (in a pthread_atfork handler)
  in the child process.

  this is undefined behaviour since the parent process is
  multi-threaded and only as-safe functions may be called
  in the child then. (if malloc/free is called concurrently
  with fork the malloc state will be corrupted in the child,
  it works on glibc because glibc takes the malloc locks
  before the fork syscall, but that breaks the as-safety of
  fork and thus non-conforming to posix)

  discussed at
  https://www.openwall.com/lists/musl/2019/01/26/1

  the bug is hard to reproduce (requires the call_rcu thread
  to call free concurrently with do_fork in the main thread),
  this one is observed with qemu-arm 3.1.0 running on x86_64
  executing an arm busybox sh:

  (gdb) bt
  #0  malloc (n=3D<optimized out>, n@entry=3D9) at src/malloc/malloc.c:306
  #1  0x0000000060184ad3 in g_malloc (n_bytes=3Dn_bytes@entry=3D9) at gmem.=
c:99
  #2  0x000000006018bcab in g_strdup (str=3D<optimized out>, str@entry=3D0x=
60200abf "call_rcu") at gstrfuncs.c:363
  #3  0x000000006016e31d in qemu_thread_create (thread=3Dthread@entry=3D0x7=
ffe367d1870, name=3Dname@entry=3D0x60200abf "call_rcu", =

      start_routine=3Dstart_routine@entry=3D0x60174c00 <call_rcu_thread>, a=
rg=3Darg@entry=3D0x0, mode=3Dmode@entry=3D1)
      at /home/pmos/build/src/qemu-3.1.0/util/qemu-thread-posix.c:526
  #4  0x0000000060174b99 in rcu_init_complete () at /home/pmos/build/src/qe=
mu-3.1.0/util/rcu.c:327
  #5  0x00000000601c4fac in __fork_handler (who=3D1) at src/thread/pthread_=
atfork.c:26
  #6  0x00000000601be8db in fork () at src/process/fork.c:33
  #7  0x000000006009d191 in do_fork (env=3D0x627aaed0, flags=3Dflags@entry=
=3D17, newsp=3Dnewsp@entry=3D0, parent_tidptr=3Dparent_tidptr@entry=3D0, =

      newtls=3Dnewtls@entry=3D0, child_tidptr=3Dchild_tidptr@entry=3D0) at =
/home/pmos/build/src/qemu-3.1.0/linux-user/syscall.c:5528
  #8  0x00000000600af894 in do_syscall1 (cpu_env=3Dcpu_env@entry=3D0x627aae=
d0, num=3Dnum@entry=3D2, arg1=3Darg1@entry=3D0, arg2=3Darg2@entry=3D-870019=
2, =

      arg3=3D<optimized out>, arg4=3D8, arg5=3D1015744, arg6=3D-74144, arg7=
=3D0, arg8=3D0) at /home/pmos/build/src/qemu-3.1.0/linux-user/syscall.c:7042
  #9  0x00000000600a835c in do_syscall (cpu_env=3Dcpu_env@entry=3D0x627aaed=
0, num=3D2, arg1=3D0, arg2=3D-8700192, arg3=3D<optimized out>, =

      arg4=3D<optimized out>, arg5=3D1015744, arg6=3D-74144, arg7=3D0, arg8=
=3D0) at /home/pmos/build/src/qemu-3.1.0/linux-user/syscall.c:11533
  #10 0x00000000600c265f in cpu_loop (env=3Denv@entry=3D0x627aaed0) at /hom=
e/pmos/build/src/qemu-3.1.0/linux-user/arm/cpu_loop.c:360
  #11 0x00000000600417a2 in main (argc=3D<optimized out>, argv=3D0x7ffe367d=
57b8, envp=3D<optimized out>)
      at /home/pmos/build/src/qemu-3.1.0/linux-user/main.c:819

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1813398/+subscriptions


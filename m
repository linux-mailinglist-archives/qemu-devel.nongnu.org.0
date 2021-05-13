Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A91537F92C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 15:52:25 +0200 (CEST)
Received: from localhost ([::1]:60442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhBlH-0004AI-Ui
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 09:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhBjo-0003Te-5O
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:50:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:39624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhBjk-0004Ox-1P
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:50:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhBjg-0000iS-IO
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 13:50:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6FD942E8189
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 13:50:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 13:44:38 -0000
From: Valentin David <1915531@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth valentin.david
X-Launchpad-Bug-Reporter: Valentin David (valentin.david)
X-Launchpad-Bug-Modifier: Valentin David (valentin.david)
References: <161314621308.23829.886419770057464275.malonedeb@chaenomeles.canonical.com>
Message-Id: <162091347819.15930.16109615832731068595.malone@soybean.canonical.com>
Subject: [Bug 1915531] Re: qemu-user child process hangs when forking due to
 glib allocation
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 38f8c61b149bd159fdce6d7a7430ffca2ffacf67
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1915531 <1915531@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Re-opened as https://gitlab.com/qemu-project/qemu/-/issues/285

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #285
   https://gitlab.com/qemu-project/qemu/-/issues/285

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915531

Title:
  qemu-user child process hangs when forking due to glib allocation

Status in QEMU:
  Incomplete

Bug description:
  I and others have recently been using qemu-user for RISCV64 extensively. =
We have had many hangs. We have found that hangs happen in process with mul=
tiple threads and forking. For example
  `cargo` (a tool for the Rust compiler).

  It does not matter if there are a lot of calls to fork. What seems to
  matter most is that there are many threads running. So this happens
  more often on a CPU with a massive number of cores, and if nothing
  else is really running. The hang happens in the child process of the
  fork.

  To reproduce the problem, I have attached an example of C++ program to
  run through qemu-user.

  Here are the stacks of the child processes that hanged. This is for
  qemu c973f06521b07af0f82893b75a1d55562fffb4b5 with glib 2.66.4

  -------
  Thread 1:
  #0  syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
  #1  0x00007f54e190c77c in g_mutex_lock_slowpath (mutex=3Dmutex@entry=3D0x=
7f54e1dc7600 <allocator+96>) at ../glib/gthread-posix.c:1462
  #2  0x00007f54e190d222 in g_mutex_lock (mutex=3Dmutex@entry=3D0x7f54e1dc7=
600 <allocator+96>) at ../glib/gthread-posix.c:1486
  #3  0x00007f54e18e39f2 in magazine_cache_pop_magazine (countp=3D0x7f54280=
e6638, ix=3D2) at ../glib/gslice.c:769
  #4  thread_memory_magazine1_reload (ix=3D2, tmem=3D0x7f54280e6600) at ../=
glib/gslice.c:845
  #5  g_slice_alloc (mem_size=3Dmem_size@entry=3D40) at ../glib/gslice.c:10=
58
  #6  0x00007f54e18f06fa in g_tree_node_new (value=3D0x7f54d4066540 <code_g=
en_buffer+419091>, key=3D0x7f54d4066560 <code_gen_buffer+419123>) at ../gli=
b/gtree.c:517
  #7  g_tree_insert_internal (tree=3D0x555556aed800, key=3D0x7f54d4066560 <=
code_gen_buffer+419123>, value=3D0x7f54d4066540 <code_gen_buffer+419091>, r=
eplace=3D0) at ../glib/gtree.c:517
  #8  0x00007f54e186b755 in tcg_tb_insert (tb=3D0x7f54d4066540 <code_gen_bu=
ffer+419091>) at ../tcg/tcg.c:534
  #9  0x00007f54e1820545 in tb_gen_code (cpu=3D0x7f54980b4b60, pc=3D2749064=
07438, cs_base=3D0, flags=3D24832, cflags=3D-16252928) at ../accel/tcg/tran=
slate-all.c:2118
  #10 0x00007f54e18034a5 in tb_find (cpu=3D0x7f54980b4b60, last_tb=3D0x7f54=
d4066440 <code_gen_buffer+418835>, tb_exit=3D0, cf_mask=3D524288) at ../acc=
el/tcg/cpu-exec.c:462
  #11 0x00007f54e1803bd9 in cpu_exec (cpu=3D0x7f54980b4b60) at ../accel/tcg=
/cpu-exec.c:818
  #12 0x00007f54e1735a4c in cpu_loop (env=3D0x7f54980bce40) at ../linux-use=
r/riscv/cpu_loop.c:37
  #13 0x00007f54e1844b22 in clone_func (arg=3D0x7f5402f3b080) at ../linux-u=
ser/syscall.c:6422
  #14 0x00007f54e191950a in start_thread (arg=3D<optimized out>) at pthread=
_create.c:477
  #15 0x00007f54e19a52a3 in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

  Thread 2:
  #1  0x00007f54e18a8d6e in qemu_futex_wait (f=3D0x7f54e1dc7038 <rcu_call_r=
eady_event>, val=3D4294967295) at /var/home/valentin/repos/qemu/include/qem=
u/futex.h:29
  #2  0x00007f54e18a8f32 in qemu_event_wait (ev=3D0x7f54e1dc7038 <rcu_call_=
ready_event>) at ../util/qemu-thread-posix.c:460
  #3  0x00007f54e18c0196 in call_rcu_thread (opaque=3D0x0) at ../util/rcu.c=
:258
  #4  0x00007f54e18a90eb in qemu_thread_start (args=3D0x7f5428244930) at ..=
/util/qemu-thread-posix.c:521
  #5  0x00007f54e191950a in start_thread (arg=3D<optimized out>) at pthread=
_create.c:477
  #6  0x00007f54e19a52a3 in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95
  -------

  Thread 1 seems to be the really hanged process.

  The problem is that glib is used in many places. Allocations are done
  through g_slice. g_slice has a global state that is not fork safe.

  So even though the cpu thread is set to exclusive before forking, it
  is not enough. Because there are other uses of glib data structures
  that are not part of the cpu loop (I think). So it seems not to be
  synchronized by `start_exclusive`, `end_exclusive`.

  So if one of the use of glib data structure is used during the fork,
  an allocation might lock a mutex in g_slice.

  When the cpu loop resumes in forked process, then the use of any glib
  data structure might just hang on a locked mutex in g_slice.

  So as a work-around we have starting using is setting environment
  `G_SLICE=3Dalways-malloc`. This resolves the hangs.

  I have opened an issue upstream:
  https://gitlab.gnome.org/GNOME/glib/-/issues/2326

  As fork documentation says, the child should be async-signal-safe.
  However, glibc's malloc is safe in fork child even though it is not
  async-signal-safe. So it is not that obvious where the responsability
  is. Should glib handle this case like malloc does? Or should qemu not
  use glib in the fork child?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915531/+subscriptions


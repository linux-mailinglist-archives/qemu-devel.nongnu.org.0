Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B3A2DC825
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 22:08:43 +0100 (CET)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpe2L-00046f-BL
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 16:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpe0K-0002aw-UO
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:06:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:44342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpe0B-0006e8-7x
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:06:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kpe08-0006dM-Ky
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 21:06:24 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9DC6E2E813C
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 21:06:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Dec 2020 20:56:49 -0000
From: =?utf-8?q?Andreas_K=2E_H=C3=BCttel?= <1906193@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dilfridge
X-Launchpad-Bug-Reporter: =?utf-8?q?Andreas_K=2E_H=C3=BCttel_=28dilfridge?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Andreas_K=2E_H=C3=BCttel_=28dilfridge?=
 =?utf-8?q?=29?=
References: <160669515259.21126.12178770886175022752.malonedeb@gac.canonical.com>
Message-Id: <160815220976.15056.16804692011989580462.malone@soybean.canonical.com>
Subject: [Bug 1906193] Re: riscv32 user mode emulation: fork return values
 broken
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a68a6d599c812dd1dd335307d9c5c017c50ba81b"; Instance="production"
X-Launchpad-Hash: c7793feeeea39781e280fcc94c62051a5b63da0d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Reply-To: Bug 1906193 <1906193@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here's the (abbreviated) output of strace'ing qemu:

farino ~ # strace -f /usr/bin/qemu-riscv32 /chroot/riscv-ilp32/tmp/wait-tes=
t-short
execve("/usr/bin/qemu-riscv32", ["/usr/bin/qemu-riscv32", "/chroot/riscv-il=
p32/tmp/wait-tes"...], 0x7ffd95fb1330 /* 40 vars */) =3D 0

[...]

[pid 16569] uname({sysname=3D"Linux", nodename=3D"farino", ...}) =3D 0
[pid 16569] lstat("/chroot", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...})=
 =3D 0
[pid 16569] lstat("/chroot/riscv-ilp32", {st_mode=3DS_IFDIR|S_ISGID|0755, s=
t_size=3D4096, ...}) =3D 0
[pid 16569] lstat("/chroot/riscv-ilp32/tmp", {st_mode=3DS_IFDIR|S_ISVTX|077=
7, st_size=3D4096, ...}) =3D 0
[pid 16569] lstat("/chroot/riscv-ilp32/tmp/wait-test-short", {st_mode=3DS_I=
FREG|0755, st_size=3D445632, ...}) =3D 0
[pid 16569] mmap(0x413f1000, 135168, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_=
FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x413f1000
[pid 16569] mprotect(0x413eb000, 8192, PROT_READ) =3D 0
[pid 16569] rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
[pid 16569] clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CH=
ILD_SETTID|SIGCHLD, child_tidptr=3D0x1339710) =3D 16571
strace: Process 16571 attached
[pid 16571] set_robust_list(0x1339720, 24 <unfinished ...>
[pid 16569] rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
[pid 16571] <... set_robust_list resumed>) =3D 0
[pid 16569] rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
[pid 16571] rt_sigprocmask(SIG_SETMASK, ~[ILL FPE SEGV RTMIN RT_1], ~[KILL =
STOP RTMIN RT_1], 8) =3D 0
[pid 16571] rt_sigprocmask(SIG_BLOCK, ~[], ~[ILL FPE KILL SEGV STOP RTMIN R=
T_1], 8) =3D 0
[pid 16571] clone(child_stack=3D0x7fe5b73871f0, flags=3DCLONE_VM|CLONE_FS|C=
LONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARE=
NT_SETTID|CLONE_CHILD_CLEARTID, parent_tid=3D[16572], tls=3D0x7fe5b7387640,=
 child_tidptr=3D0x7fe5b7387910) =3D 16572
[pid 16571] rt_sigprocmask(SIG_SETMASK, ~[ILL FPE KILL SEGV STOP RTMIN RT_1=
], NULL, 8) =3D 0
[pid 16571] rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1], NULL, 8) =
=3D 0
[pid 16571] gettid()                    =3D 16571
[pid 16571] rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
[pid 16571] rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
[pid 16569] waitid(P_ALL, -1,  <unfinished ...>
[pid 16571] exit_group(42)              =3D ?
strace: Process 16572 attached
[pid 16572] +++ exited with 42 +++
[pid 16571] +++ exited with 42 +++
[pid 16569] <... waitid resumed>{si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, =
si_pid=3D16571, si_uid=3D0, si_status=3D42, si_utime=3D3472328296226648184,=
 si_stime=3D3475143045726351408}, WEXITED, NULL) =3D 0
[pid 16569] --- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=
=3D16571, si_uid=3D0, si_status=3D42, si_utime=3D0, si_stime=3D0} ---
[pid 16569] statx(1, "", AT_STATX_SYNC_AS_STAT|AT_EMPTY_PATH, STATX_BASIC_S=
TATS, {stx_mask=3DSTATX_BASIC_STATS|STATX_MNT_ID, stx_attributes=3D0, stx_m=
ode=3DS_IFCHR|0600, stx_size=3D0, ...}) =3D 0
[pid 16569] write(1, "child wants to return 42 (0x2A),"..., 74child wants t=
o return 42 (0x2A), parent received 40 (0x28), difference -2
) =3D 74
[pid 16569] brk(0x13c1000)              =3D 0x13c1000
[pid 16569] brk(0x13c0000)              =3D 0x13c0000
[pid 16569] exit_group(0)               =3D ?
[pid 16570] <... futex resumed>)        =3D ?
[pid 16570] +++ exited with 0 +++
+++ exited with 0 +++

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906193

Title:
  riscv32 user mode emulation: fork return values broken

Status in QEMU:
  New

Bug description:
  When running in a chroot with riscv32 (on x86_64; qemu git master as
  of today):

  The following short program forks; the child immediately returns with
  exit(42). The parent checks for the return value - and obtains 40!

  gcc-10.2

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  #include <stdlib.h>
  #include <unistd.h>
  #include <stdio.h>
  #include <sys/wait.h>

  main(c, v)
       int c;
       char **v;
  {
    pid_t pid, p;
    int s, i, n;

    s =3D 0;
    pid =3D fork();
    if (pid =3D=3D 0)
      exit(42);

    /* wait for the process */
    p =3D wait(&s);
    if (p !=3D pid)
      exit (255);

    if (WIFEXITED(s))
    {
       int r=3DWEXITSTATUS(s);
       if (r!=3D42) {
        printf("child wants to return %i (0x%X), parent received %i (0x%X),=
 difference %i\n",42,42,r,r,r-42);
       }
    }
  }
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  (riscv-ilp32 chroot) farino /tmp # ./wait-test-short =

  child wants to return 42 (0x2A), parent received 40 (0x28), difference -2

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  (riscv-ilp32 chroot) farino /tmp # gcc --version
  gcc (Gentoo 10.2.0-r1 p2) 10.2.0
  Copyright (C) 2020 Free Software Foundation, Inc.
  Dies ist freie Software; die Kopierbedingungen stehen in den Quellen. Es
  gibt KEINE Garantie; auch nicht f=C3=BCr MARKTG=C3=84NGIGKEIT oder F=C3=
=9CR SPEZIELLE ZWECKE.

  (riscv-ilp32 chroot) farino /tmp # ld --version
  GNU ld (Gentoo 2.34 p6) 2.34.0
  Copyright (C) 2020 Free Software Foundation, Inc.
  This program is free software; you may redistribute it under the terms of
  the GNU General Public License version 3 or (at your option) a later vers=
ion.
  This program has absolutely no warranty.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906193/+subscriptions


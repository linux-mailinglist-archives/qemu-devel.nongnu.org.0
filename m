Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404852B67DA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:51:59 +0100 (CET)
Received: from localhost ([::1]:54330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2Kq-0005wW-TX
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kf2Jq-00053p-RL
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:50:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:60206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kf2Jo-0006us-El
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:50:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kf2Jg-000663-8e
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 14:50:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3FDD92E805D
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 14:50:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2020 14:39:34 -0000
From: Peter Maydell <1904210@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: k1eee pmaydell
X-Launchpad-Bug-Reporter: Wang Zhongwei (k1eee)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <160527852783.476.2473984132248883691.malonedeb@chaenomeles.canonical.com>
Message-Id: <160562397477.26986.7619077276839258285.malone@chaenomeles.canonical.com>
Subject: [Bug 1904210] Re: Crashed with 'uncaught target signal SIGILL' while
 program has registered by signal(SIGILL, handler)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: de68c24e2e9b8e20a73871ba4d54fe8e9fb15e7e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 09:50:44
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1904210 <1904210@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This binary doesn't execute on a real Arm CPU (it takes a SIGTRAP when
it executes the first 'udf 1' insn), so I suspect it's never been tested
on anything except QEMU and it happened to rely on incorrect older
signal handling emulation in previous QEMU versions.

As far as I can see the binary executes an illegal insn ("udf 1"), which
causes a SIGILL on QEMU; execution continues inside the SIGILL handler
and the binary then executes another "udf 1". Since the SIGILL signal is
still blocked we can't invoke the handler again and so this time around
it's fatal.

If you still think QEMU has a bug in here, please provide more details
of exactly what the guest program does and where QEMU diverges from real
Arm Linux kernel behaviour.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904210

Title:
  Crashed with 'uncaught target signal SIGILL' while program has
  registered by signal(SIGILL, handler)

Status in QEMU:
  New

Bug description:
  This binary is an CTF reverse challenge binary, it registers signal
  handler via 'signal(SIGILL, 0x1193D);' while 0x1193D is the SIGILL
  handler.

  Please see the attachment, the file 'repair' is the binary i mentioned
  above, the file 'qemu-arm' is an old version qemu at 2.5.0, and it
  seems an official release (not modified).

  Which means, it could be a bug in recent release.

  You need to input 'flag{' to the stdin to let the binary execute the
  illegal instruction at 0x10A68.

  In 2.5.0 version the -strace logs:
  116 uname(0xf6ffed40) =3D 0
  116 brk(NULL) =3D 0x0009f000
  116 brk(0x0009fd00) =3D 0x0009fd00
  116 readlink("/proc/self/exe",0xf6ffde78,4096) =3D 21
  116 brk(0x000c0d00) =3D 0x000c0d00
  116 brk(0x000c1000) =3D 0x000c1000
  116 access("/etc/ld.so.nohwcap",F_OK) =3D -1 errno=3D2 (No such file or d=
irectory)
  116 rt_sigaction(SIGILL,0xf6ffec48,0xf6ffecd4) =3D 0
  116 fstat64(1,0xf6ffe8e8) =3D 0
  116 ioctl(1,21505,-151000980,-151000924,652480,640808) =3D 0
  116 fstat64(0,0xf6ffe7d0) =3D 0
  116 ioctl(0,21505,-151001260,-151001204,652480,641152) =3D 0
  116 write(1,0xa5548,6)input: =3D 6
  116 read(0,0xa6550,4096)flag{
   =3D 6
  116 write(1,0xa5548,7)wrong!
   =3D 7
  116 _llseek(0,4294967295,4294967295,0xf6ffee18,SEEK_CUR) =3D -1 errno=3D2=
9 (Illegal seek)
  116 exit_group(0)

  In 2.11.1, it shows:
  113 uname(0xfffeed30) =3D 0
  113 brk(NULL) =3D 0x0009f000
  113 brk(0x0009fd00) =3D 0x0009fd00
  113 readlink("/proc/self/exe",0xfffede68,4096) =3D 21
  113 brk(0x000c0d00) =3D 0x000c0d00
  113 brk(0x000c1000) =3D 0x000c1000
  113 access("/etc/ld.so.nohwcap",F_OK) =3D -1 errno=3D2 (No such file or d=
irectory)
  113 rt_sigaction(SIGILL,0xfffeec38,0xfffeecc4) =3D 0
  113 fstat64(1,0xfffee8d8) =3D 0
  113 ioctl(1,21505,-71588,-71532,652480,640808) =3D 0
  113 fstat64(0,0xfffee7c0) =3D 0
  113 ioctl(0,21505,-71868,-71812,652480,641152) =3D 0
  113 write(1,0xa5548,6)input: =3D 6
  113 read(0,0xa6550,4096)flag{
   =3D 6
  --- SIGILL {si_signo=3DSIGILL, si_code=3D2, si_addr=3D0x00010a68} ---
  --- SIGILL {si_signo=3DSIGILL, si_code=3D2, si_addr=3D0x0001182c} ---
  qemu: uncaught target signal 4 (Illegal instruction) - core dumped
  Illegal instruction (core dumped)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904210/+subscriptions


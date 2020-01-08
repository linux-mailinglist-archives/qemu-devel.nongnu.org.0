Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7555C134B0C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 19:58:17 +0100 (CET)
Received: from localhost ([::1]:48090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipGX2-0001EN-Fx
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 13:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ipGUV-0006pT-Tj
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 13:55:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ipGUU-0000Ll-Nc
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 13:55:39 -0500
Received: from indium.canonical.com ([91.189.90.7]:39620)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ipGUU-0000KR-I8
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 13:55:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ipGUT-0008La-LM
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 18:55:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9D3102E806B
 for <qemu-devel@nongnu.org>; Wed,  8 Jan 2020 18:55:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jan 2020 18:49:16 -0000
From: Aleksandar Markovic <1858461@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aladjev-andrew amarkovic pmaydell
X-Launchpad-Bug-Reporter: puchuu (aladjev-andrew)
X-Launchpad-Bug-Modifier: Aleksandar Markovic (amarkovic)
References: <157833123209.15024.12557979334447840996.malonedeb@wampee.canonical.com>
Message-Id: <157850935641.27774.918715209442438715.malone@chaenomeles.canonical.com>
Subject: [Bug 1858461] Re: Please refactor linux-user/mips/cpu_loop.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: e4c0e486aa650be01fd1fed3a554f76614aa1020
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1858461 <1858461@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also, can you please add more info on "emerge" problem, so that I can
repro it with the current QEMU. I would prefer to know the roots cause,
rather than just accept that the problem disappeared.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1858461

Title:
  Please refactor linux-user/mips/cpu_loop.c

Status in QEMU:
  New

Bug description:
  Hello. I am working with qemu on test images. I've added a new syscall
  (436) to qemu but received ENOSYS from mips application.

  Please open "linux-user/mips/cpu_loop.c". I've added at the end of
  "mips_syscall_args" the following:

  ```
  MIPS_SYS(sys_getdents64_x32, 3)
  ```

  But

  ```
  syscall_num =3D env->active_tc.gpr[2] - 4000;
  if (syscall_num >=3D sizeof(mips_syscall_args)) {
    ret =3D -TARGET_ENOSYS;
  ```

  returns -TARGET_ENOSYS

  We can see that "linux-user/mips/cpu_loop.c" differs a lot from
  "linux-user/arm/cpu_loop.c". Arm has it's own "ARM_NR_BASE" and etc.

  Can you please refactor mips cpu loop in the same way as arm? Thank
  you.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1858461/+subscriptions


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C0F2F0516
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:29:53 +0100 (CET)
Received: from localhost ([::1]:53004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySMS-0004O3-UV
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIn-0007p2-N0
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:05 -0500
Received: from indium.canonical.com ([91.189.90.7]:40558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIk-0000gq-0B
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:04 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySIh-0000E0-W0
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:26:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D0C3E2E8147
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:45 -0000
From: Launchpad Bug Tracker <1738434@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: boleg janitor th-huth
X-Launchpad-Bug-Reporter: Oleg Boyarchuk (boleg)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151335284270.18775.11956593413249795656.malonedeb@chaenomeles.canonical.com>
Message-Id: <161025226611.18863.958358089086065369.malone@loganberry.canonical.com>
Subject: [Bug 1738434] Re: CALL FWORD PTR [ESP] handled incorrectly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: cf43fb94349544cbf9a299713532726f37e77502
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
Reply-To: Bug 1738434 <1738434@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1738434

Title:
  CALL FWORD PTR [ESP] handled incorrectly

Status in QEMU:
  Expired

Bug description:
  To keep the story short, this 32-bit code crashes on 64-bit Windows
  whereas it works fine on real system and VMware:

      push 33h
      push offset _far_call
      call fword ptr[esp]
      jmp _ret
  _far_call:
      retf
  _ret:

  32-bit code running under WoW64 on 64-bit Windows has the ability to
  switch to the 64-bit mode via so called "Heaven's gate". In order to
  do that you have to make a far call/jmp by 0x33 selector how the code
  snippet above shows. QEMU throws an access violation exception whereas
  the code snippet runs with no problems on real CPU and VMware. By the
  way, this code works fine under QEMU, I hope it gives you a hint where
  to look:

      push 23h
      push offset _far_call
      call fword ptr[esp]
      jmp _ret
  _far_call:
      retf
  _ret:

  0x23 is a default 32-bit selector for 32-bit processes running under
  WoW64.

  Environment:
  QEMU: 2.10.93, command line: qemu-system-x86_64.exe -m 2G -snapshot -cdro=
m full_path_to_iso fullP_path_to_img
  Guest OS: Windows 7 x64 SP1 build 7601 or Windows 10 version 1709 build 1=
6299.19
  Host OS: Windows 10 x64 version 1703 build 15063.786

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1738434/+subscriptions


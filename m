Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22F93565F3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 10:02:10 +0200 (CEST)
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU38b-0004yi-IY
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 04:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lU37R-0004ZL-7g
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 04:00:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:40550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lU37O-0003ml-Rh
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 04:00:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lU37L-0008Fg-Qk
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 08:00:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B5CBC2E8026
 for <qemu-devel@nongnu.org>; Wed,  7 Apr 2021 08:00:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Apr 2021 07:53:31 -0000
From: JIANG Muhui <1922887@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: JIANG Muhui (muhui)
Message-Id: <161778201158.26656.2798489764705445614.malonedeb@wampee.canonical.com>
Subject: [Bug 1922887] [NEW] STR in Thumb 32 decode problem
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: d87e1e5ff44add8cfc5c161883785d0cff0834dc
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
Reply-To: Bug 1922887 <1922887@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi

It seems that QEMU does not have a proper check on the STR instruction
in Thumb32 mode.

Specifically, the machine code is 0xf84f0ddd, which is 0b1111 1000 0100 111=
1 0000 1101 1101 1101. =

This is an STR (immediate, Thumb) instruction with a T4 encoding scheme.

The symbols is

Rn =3D 1111
Rt =3D 0000
P =3D 1
U =3D 0
W =3D 1

The decode ASL is below:

if P =3D=3D =E2=80=981=E2=80=99 && U =3D=3D =E2=80=981=E2=80=99 && W =3D=3D=
 =E2=80=980=E2=80=99 then SEE STRT;
if Rn =3D=3D =E2=80=981101=E2=80=99 && P =3D=3D =E2=80=981=E2=80=99 && U =
=3D=3D =E2=80=980=E2=80=99 && W =3D=3D =E2=80=981=E2=80=99 && imm8 =3D=3D =
=E2=80=9800000100=E2=80=99 then SEE PUSH;
if Rn =3D=3D =E2=80=981111=E2=80=99 || (P =3D=3D =E2=80=980=E2=80=99 && W =
=3D=3D =E2=80=980=E2=80=99) then UNDEFINED;
t =3D UInt(Rt); n =3D UInt(Rn); imm32 =3D ZeroExtend(imm8, 32);
index =3D (P =3D=3D =E2=80=981=E2=80=99); add =3D (U =3D=3D =E2=80=981=E2=
=80=99); wback =3D (W =3D=3D =E2=80=981=E2=80=99);
if t =3D=3D 15 || (wback && n =3D=3D t) then UNPREDICTABLE;

When Rn =3D=3D 1111, it should be an undefined instruction, which should
raise SEGILL signal. However, it seems that QEMU does not check this
constraint, which should be a bug. Many thanks

Regards
Muhui

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922887

Title:
  STR in Thumb 32 decode problem

Status in QEMU:
  New

Bug description:
  Hi

  It seems that QEMU does not have a proper check on the STR instruction
  in Thumb32 mode.

  Specifically, the machine code is 0xf84f0ddd, which is 0b1111 1000 0100 1=
111 0000 1101 1101 1101. =

  This is an STR (immediate, Thumb) instruction with a T4 encoding scheme.

  The symbols is

  Rn =3D 1111
  Rt =3D 0000
  P =3D 1
  U =3D 0
  W =3D 1

  The decode ASL is below:

  if P =3D=3D =E2=80=981=E2=80=99 && U =3D=3D =E2=80=981=E2=80=99 && W =3D=
=3D =E2=80=980=E2=80=99 then SEE STRT;
  if Rn =3D=3D =E2=80=981101=E2=80=99 && P =3D=3D =E2=80=981=E2=80=99 && U =
=3D=3D =E2=80=980=E2=80=99 && W =3D=3D =E2=80=981=E2=80=99 && imm8 =3D=3D =
=E2=80=9800000100=E2=80=99 then SEE PUSH;
  if Rn =3D=3D =E2=80=981111=E2=80=99 || (P =3D=3D =E2=80=980=E2=80=99 && W=
 =3D=3D =E2=80=980=E2=80=99) then UNDEFINED;
  t =3D UInt(Rt); n =3D UInt(Rn); imm32 =3D ZeroExtend(imm8, 32);
  index =3D (P =3D=3D =E2=80=981=E2=80=99); add =3D (U =3D=3D =E2=80=981=E2=
=80=99); wback =3D (W =3D=3D =E2=80=981=E2=80=99);
  if t =3D=3D 15 || (wback && n =3D=3D t) then UNPREDICTABLE;

  When Rn =3D=3D 1111, it should be an undefined instruction, which should
  raise SEGILL signal. However, it seems that QEMU does not check this
  constraint, which should be a bug. Many thanks

  Regards
  Muhui

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922887/+subscriptions


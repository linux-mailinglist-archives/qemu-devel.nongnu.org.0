Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7469358AB1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:03:04 +0200 (CEST)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUY3b-0001SO-Qe
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lUY1l-0000WA-DB
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 13:01:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lUY1h-0001aM-UL
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 13:01:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lUY1e-0004uK-4J
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 17:01:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 27C4C2E8172
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 17:01:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Apr 2021 16:51:47 -0000
From: Peter Maydell <1922887@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui pmaydell
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <161778201158.26656.2798489764705445614.malonedeb@wampee.canonical.com>
Message-Id: <161790070740.10458.55491234868153456.malone@soybean.canonical.com>
Subject: [Bug 1922887] Re: STR in Thumb 32 decode problem
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f3c8a1aed7c0b9bc4f5601dbf2698b30e1ab66f1"; Instance="production"
X-Launchpad-Hash: c2668033fb0779217e5e0f07cc8b9ad1282db41b
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
Reply-To: Bug 1922887 <1922887@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch sent to list: if you could test it against whatever your test case wa=
s that would be helpful.
https://patchew.org/QEMU/20210408162402.5822-1-peter.maydell@linaro.org/

PS: out of interest, why/how were you checking should-UNDEF cases ?


** Changed in: qemu
       Status: New =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922887

Title:
  STR in Thumb 32 decode problem

Status in QEMU:
  In Progress

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


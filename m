Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33963F7052
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:24:41 +0200 (CEST)
Received: from localhost ([::1]:46834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInH6-00017P-JY
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDK-00012E-RG
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:46 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:43232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDJ-0008Sn-5Q
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:46 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 018E23F7C2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876044;
 bh=5J5Sgs9s1wUsUD0i1Pg9RMcEbAD+BQdXSqA7RTxof50=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=iU13ZP7VLVu1g+T4Ix9tgKXOAw48bOLeS/e0agKYcLFfwgI71nDOFg/vSYqzt62bR
 ZXSn/bWjk6dNBOQswlmjaO70EtnA6Z6vIn2hFoU+5l7x/tKMRd+Uo7BloH0iMYFiD2
 by5nQHrlZcyAV+j1nSHxHmQGj5avkqOJkNZhqqnOSL2/LCjbnsLl2LSdho+hzGpu6V
 o8tR/SAlUbJBvIbKH6CdUxvjhgHUBiPrV+Ski0PeGjhwH19gEpoToumF1QF+n1HncA
 zlbO75n0q6V6XmsP1yDbnCTVTbXafqpjV91mSpuHUf2fNiIJupsWLCbpLWAcimOK6K
 z9l1Jm1JPunmw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E624E2E816E
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:12:45 -0000
From: Thomas Huth <1922887@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui pmaydell th-huth
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161778201158.26656.2798489764705445614.malonedeb@wampee.canonical.com>
Message-Id: <162987556669.10640.6263984381539780893.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1922887] Re: STR in Thumb 32 decode problem
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: b74c1a4696606743bd14b860bc1a9f2f0b4265b6
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922887

Title:
  STR in Thumb 32 decode problem

Status in QEMU:
  Fix Released

Bug description:
  Hi

  It seems that QEMU does not have a proper check on the STR instruction
  in Thumb32 mode.

  Specifically, the machine code is 0xf84f0ddd, which is 0b1111 1000 0100 1=
111 0000 1101 1101 1101.=20
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183C3F7063
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:29:41 +0200 (CEST)
Received: from localhost ([::1]:36864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInLr-0005AN-9B
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInI7-0006KA-PS
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:25:43 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:39432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInI6-00048e-2O
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:25:43 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 0434B3F720
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876340;
 bh=Th2D2IpgMH5jEID838gV6ow3CG+34X47ZjOXixWVkpY=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=ZbgqIvMWX7ONOGgbCsOQ0EJUJXnhofQkTmH4SV25IuKNpQzthFwnyGmBMNJ+mG9aS
 4jl1dx5cfDk7kMFWjkLe4FRlegGhj9rjELXuK3s8mApOv3Gmv4tnyi/Yc8D3Ge5wC9
 OvjH3uugqJ1AzzEW6ocvVrCOM9c3I9q9TlUWkKoshG3v++mFzWhS8nLzRaJk6EqLL8
 D0wlfhUPkdEin/NfdbqXYZLjxlxlMpEJegm/AsKsQuFGgUrLgR5wWeSikDd5r8WOp9
 at8aCGYruAyoddVFUX0epXNGOc48BGOJ2HjdO57qhy7yhZ4IoW2/ztflq9UFaS0oVb
 RqdZjKPt5cBJg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F1ECC2E8139
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:25:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:18:32 -0000
From: Thomas Huth <1923629@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=frankchang0125@gmail.com; 
X-Launchpad-Bug-Tags: riscv vector
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 frankchang0125 tony-cole
X-Launchpad-Bug-Reporter: Tony Cole (tony-cole)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161832726983.9430.3755052950345832110.malonedeb@chaenomeles.canonical.com>
Message-Id: <162987591341.16167.2833824027594585075.launchpad@gac.canonical.com>
Subject: [Bug 1923629] Re: RISC-V Vector Instruction vssub.vv not saturating
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: a5eed2f50ae1bf7ef34e37b79843c8bc870fe3f8
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1923629 <1923629@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923629

Title:
  RISC-V Vector Instruction vssub.vv not saturating

Status in QEMU:
  Fix Released

Bug description:
  I noticed doing a negate ( 0 =E2=80=93 0x80000000 ) using vssub.vv produc=
es an
  incorrect result of 0x80000000 (should saturate to 0x7FFFFFFF).

  Here is the bit of the code:

  		vmv.v.i		v16, 0
  		=E2=80=A6
  8f040457	vssub.vv	v8,v16,v8

  I believe the instruction encoding is correct (vssub.vv with vd =3D v8,
  vs2 =3D v16, rs1 =3D v8), but the result does not saturate in QEMU.

  I=E2=80=99ve just tested with what I think is the latest branch (
  https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v7 commit 26 Feb
  2021: 1151361fa7d45cc90d69086ccf1a4d8397931811 ) and the problem still
  exists.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923629/+subscriptions



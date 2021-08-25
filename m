Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BB63F7047
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:23:09 +0200 (CEST)
Received: from localhost ([::1]:38370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInFb-0003tA-Vw
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDJ-0000zj-IO
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:45 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:43148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDH-0008Qh-TS
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:45 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id DB71B3F7CD
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876041;
 bh=trLM3Jw2zkvnryaWl8HF7Bm+Y9KuiVMoRQdZ8QWo6TQ=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=fehNrefAoQNsaU317HVTfJAtjfEZpBhJ42VYVNkdJ/73hH8fGdZm9ABNMMzyjapGP
 ei4mY1Kg/4w/lT+if+uaNRqkGJcuT1Alcz6kAgN/nkl/FUG3kwr6ffhUvAVJy2xazj
 pF4tqdoWFRAOdNpcJTv3T/1BOEMsqiksuaxmL5bWsnHS/CuBL/5mIQD8S1u2AGzfMT
 o7DYnRSjfrHSg0xpiODW0gA/u8H8iNDPQLuplmlzHpYtwDjdIXQPS6FCLSOdr8ZarB
 tI4bS+HvDvZta+Gu9LQ6wE13mWfuo+IzPL4en0vpHgTH21PZz8+4drL4n6WYkbXfpk
 fQ47DkRZtfJpA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 201852E8187
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:11:52 -0000
From: Thomas Huth <1925512@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui rth th-huth
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161909962601.31655.7052824363126074861.malonedeb@soybean.canonical.com>
Message-Id: <162987551369.11941.12847280937209574948.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1925512] Re: UNDEFINED case for instruction BLX
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: b89f21c68fbe2a93e87e144281a2e4ca1086c2b9
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
Reply-To: Bug 1925512 <1925512@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1925512

Title:
  UNDEFINED case for instruction BLX

Status in QEMU:
  Fix Released

Bug description:
  Hi

  I refer to the instruction BLX imm (T2 encoding) in ARMv7 (Thumb
  mode).

  11110 S imm10H  11 J1 0 J2 imm10L H

 =20
  if H =3D=3D '1' then UNDEFINED;
  I1 =3D NOT(J1 EOR S);  I2 =3D NOT(J2 EOR S);  imm32 =3D SignExtend(S:I1:I=
2:imm10H:imm10L:'00', 32);
  targetInstrSet =3D InstrSet_A32;
  if InITBlock() && !LastInITBlock() then UNPREDICTABLE;

  According to the manual, if H equals to 1, this instruction should be
  an UNDEFINED instruction. However, it seems QEMU does not check this
  constraint in function trans_BLX_i. Thanks

  Regards
  Muhui

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1925512/+subscriptions



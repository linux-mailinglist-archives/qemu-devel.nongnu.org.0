Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE0391C75
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:52:37 +0200 (CEST)
Received: from localhost ([::1]:48392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llvpk-0001bX-Ih
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llvo5-000093-3Y
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:50:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:57380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llvo3-000343-3U
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:50:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llvny-0002N5-TA
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:50:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 72F6E2E819E
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:50:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 May 2021 15:38:55 -0000
From: Thomas Huth <1925512@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui rth th-huth
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161909962601.31655.7052824363126074861.malonedeb@soybean.canonical.com>
Message-Id: <162204353554.32457.2253520551010705228.malone@wampee.canonical.com>
Subject: [Bug 1925512] Re: UNDEFINED case for instruction BLX
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="802ed26817d1cdd050553dbe99cc8a3cad1a3bc7"; Instance="production"
X-Launchpad-Hash: f49b3dc26262bacb4bfb6becd616dde4ad40ee02
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
Reply-To: Bug 1925512 <1925512@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patches from Richard have now been merged (see https://gitlab.com
/qemu-project/qemu/-/commit/c1438d6c02eae03c and the following commits).
Thus marking this as "Fix committed" now.

** Changed in: qemu
       Status: In Progress =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1925512

Title:
  UNDEFINED case for instruction BLX

Status in QEMU:
  Fix Committed

Bug description:
  Hi

  I refer to the instruction BLX imm (T2 encoding) in ARMv7 (Thumb
  mode).

  11110 S imm10H  11 J1 0 J2 imm10L H

  =

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


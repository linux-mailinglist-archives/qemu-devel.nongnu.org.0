Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08524360396
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 09:42:12 +0200 (CEST)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWwdX-0001hF-DZ
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 03:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWwca-00018E-Ue
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 03:41:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:53994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWwcX-0002tI-Ef
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 03:41:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lWwcV-0008W5-93
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 07:40:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 410FB2E8157
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 07:40:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Apr 2021 07:31:04 -0000
From: Frank Chang <1923629@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided;
 assignee=frankchang0125@gmail.com; 
X-Launchpad-Bug-Tags: riscv vector
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 frankchang0125 tony-cole
X-Launchpad-Bug-Reporter: Tony Cole (tony-cole)
X-Launchpad-Bug-Modifier: Frank Chang (frankchang0125)
References: <161832726983.9430.3755052950345832110.malonedeb@chaenomeles.canonical.com>
Message-Id: <161847186460.28384.4417965053936211792.malone@soybean.canonical.com>
Subject: [Bug 1923629] Re: RISC-V Vector Instruction vssub.vv not saturating
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="929bdb49da44562d032228b8f93c5c598dae8678"; Instance="production"
X-Launchpad-Hash: 15d3f37489582a934441a81f3d6acf1c6a6d6829
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
Reply-To: Bug 1923629 <1923629@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This should be a quick fix, we will run couple tests again to ensure the
fix doesn't break anything. Thanks~

** Changed in: qemu
     Assignee: (unassigned) =3D> Frank Chang (frankchang0125)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923629

Title:
  RISC-V Vector Instruction vssub.vv not saturating

Status in QEMU:
  New

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


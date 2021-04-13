Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CB35E2EC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 17:32:47 +0200 (CEST)
Received: from localhost ([::1]:56796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWL1y-0002d6-Lx
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 11:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWL0B-0001g2-FE
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:30:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:50456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWL02-0001uA-4r
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:30:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lWKzz-0005u8-Fm
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 15:30:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6DD0A2E8162
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 15:30:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Apr 2021 15:21:09 -0000
From: Tony Cole <1923629@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: riscv vector
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: tony-cole
X-Launchpad-Bug-Reporter: Tony Cole (tony-cole)
X-Launchpad-Bug-Modifier: Tony Cole (tony-cole)
Message-Id: <161832726983.9430.3755052950345832110.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1923629] [NEW] RISC-V Vector Instruction vssub.vv not saturating
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f3c8a1aed7c0b9bc4f5601dbf2698b30e1ab66f1"; Instance="production"
X-Launchpad-Hash: 6dd35d11b44faaba2fe96442806d76a8f7aa996b
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
Reply-To: Bug 1923629 <1923629@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I noticed doing a negate ( 0 =E2=80=93 0x80000000 ) using vssub.vv produces=
 an
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

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: riscv vector

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


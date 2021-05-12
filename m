Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFC837F03D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 02:07:04 +0200 (CEST)
Received: from localhost ([::1]:46452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgysZ-0006dI-FC
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 20:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgyrD-0005p6-Lq
 for qemu-devel@nongnu.org; Wed, 12 May 2021 20:05:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:50312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgyrB-00066B-Nu
 for qemu-devel@nongnu.org; Wed, 12 May 2021 20:05:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgyr9-00044C-EC
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 00:05:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 63F182E8081
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 00:05:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 23:58:12 -0000
From: Alistair Francis <1923629@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=frankchang0125@gmail.com; 
X-Launchpad-Bug-Tags: riscv vector
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 frankchang0125 tony-cole
X-Launchpad-Bug-Reporter: Tony Cole (tony-cole)
X-Launchpad-Bug-Modifier: Alistair Francis (alistair2323)
References: <161832726983.9430.3755052950345832110.malonedeb@chaenomeles.canonical.com>
Message-Id: <162086389306.7741.14757087677875306986.malone@gac.canonical.com>
Subject: [Bug 1923629] Re: RISC-V Vector Instruction vssub.vv not saturating
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 3d6740cd11606372a421ee52c993efdf1fb3b5dc
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

This was fixed by commit:

commit 65606f21243a796537bfe4708720a9bf4bb50169
Author: LIU Zhiwei <zhiwei_liu@c-sky.com>
Date:   Fri Feb 12 23:02:21 2021 +0800

    target/riscv: Fixup saturate subtract function
    =

    The overflow predication ((a - b) ^ a) & (a ^ b) & INT64_MIN is right.
    However, when the predication is ture and a is 0, it should return maxi=
mum.
    =

    Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
    Message-id: 20210212150256.885-4-zhiwei_liu@c-sky.com
    Signed-off-by: Alistair Francis <alistair.francis@wdc.com>


The fix will be in the QEMU 6.1 release.

** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923629

Title:
  RISC-V Vector Instruction vssub.vv not saturating

Status in QEMU:
  Fix Committed

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


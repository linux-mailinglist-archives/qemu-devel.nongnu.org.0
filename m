Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702163686EB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 21:06:58 +0200 (CEST)
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZefB-0004pu-Ic
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 15:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZedR-0003Cn-Hw
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:05:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:33158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZedM-00029G-T4
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:05:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZedI-0003St-MO
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 19:05:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6A57D2E81D5
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 19:04:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 16:06:33 -0000
From: Richard Henderson <1925512@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui rth
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <161909962601.31655.7052824363126074861.malonedeb@soybean.canonical.com>
Message-Id: <161910759397.22705.81151015614471460.malone@gac.canonical.com>
Subject: [Bug 1925512] Re: UNDEFINED case for instruction BLX
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: f66345618db5621075722ec13f42dec8e166eb9d
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
Reply-To: Bug 1925512 <1925512@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's right there in trans_BLX_i:

    if (s->thumb && (a->imm & 2)) {
        return false;
    }


** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1925512

Title:
  UNDEFINED case for instruction BLX

Status in QEMU:
  Invalid

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


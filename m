Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2002C110C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 17:52:06 +0100 (CET)
Received: from localhost ([::1]:35056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khF4O-0003FU-Te
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 11:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khF31-0002jF-7Z
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 11:50:39 -0500
Received: from indium.canonical.com ([91.189.90.7]:42760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khF2y-0001Tp-U7
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 11:50:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khF2w-0002Tf-TH
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 16:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CEAC82E813D
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 16:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2020 16:41:15 -0000
From: Michael Peter <1905297@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: michaelpeter
X-Launchpad-Bug-Reporter: Michael Peter (michaelpeter)
X-Launchpad-Bug-Modifier: Michael Peter (michaelpeter)
Message-Id: <160614967524.17013.9714069541645314856.malonedeb@wampee.canonical.com>
Subject: [Bug 1905297] [NEW] Zynq7000 UART clock reset initialization
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: ac9ce25f7974bdcc98b2ffc2c7d53ae287c99b85
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
Reply-To: Bug 1905297 <1905297@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,

we have come across a strange behavior in the Zynq7000 model of Qemu
that seems to have been  introduced between 5.0.0 and 5.1.0.


The reset values of the SLCR register, in particular those for UART_CLK_CTR=
L, are such that
the UARTs should find functional clocks. Up to 5.0.0 this was also the beha=
vior that was
implemented in QEMU.

Starting in 5.1.0, we found that - despite correct reset values [1] - the U=
ARTs are non-functional
upon reset. Some investigation revealed that the cause for that is that the=
 corresponding
clocks are not properly initialized.

Between 5.0.0 and 5.1.0, there are three commits  that touch the Zynq
UART clocks [2]. The last of them [3] triggers the faulty behavior.

Attached is a patch that applies 5.2.0-rc2 and yields a functional UART. We=
 surmise that the
underlying device release issue runs much deeper, so it is only meant to id=
entify the issue.


[1] hw/misc/zynq_slcr.c
      static void zynq_slcr_reset_init(Object *obj, ResetType type)
       s->regs[R_UART_CLK_CTRL]  =3D 0x00003F03;
[2] 38867cb7ec90..5b49a34c6800
[3] commit 5b49a34c6800d0cb917f959d8e75e5775f0fac3f (refs/bisect/bad)
      Author: Damien Hedde <damien.hedde@greensocs.com>
      Date:   Mon Apr 6 15:52:50 2020 +0200

** Affects: qemu
     Importance: Undecided
         Status: New

** Patch added: "0001-Initialize-Zynq7000-UART-clocks-on-reset.patch"
   https://bugs.launchpad.net/bugs/1905297/+attachment/5437267/+files/0001-=
Initialize-Zynq7000-UART-clocks-on-reset.patch

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905297

Title:
  Zynq7000 UART clock reset initialization

Status in QEMU:
  New

Bug description:
  Hello,

  we have come across a strange behavior in the Zynq7000 model of Qemu
  that seems to have been  introduced between 5.0.0 and 5.1.0.

  =

  The reset values of the SLCR register, in particular those for UART_CLK_C=
TRL, are such that
  the UARTs should find functional clocks. Up to 5.0.0 this was also the be=
havior that was
  implemented in QEMU.

  Starting in 5.1.0, we found that - despite correct reset values [1] - the=
 UARTs are non-functional
  upon reset. Some investigation revealed that the cause for that is that t=
he corresponding
  clocks are not properly initialized.

  Between 5.0.0 and 5.1.0, there are three commits  that touch the Zynq
  UART clocks [2]. The last of them [3] triggers the faulty behavior.

  Attached is a patch that applies 5.2.0-rc2 and yields a functional UART. =
We surmise that the
  underlying device release issue runs much deeper, so it is only meant to =
identify the issue.


  [1] hw/misc/zynq_slcr.c
        static void zynq_slcr_reset_init(Object *obj, ResetType type)
         s->regs[R_UART_CLK_CTRL]  =3D 0x00003F03;
  [2] 38867cb7ec90..5b49a34c6800
  [3] commit 5b49a34c6800d0cb917f959d8e75e5775f0fac3f (refs/bisect/bad)
        Author: Damien Hedde <damien.hedde@greensocs.com>
        Date:   Mon Apr 6 15:52:50 2020 +0200

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905297/+subscriptions


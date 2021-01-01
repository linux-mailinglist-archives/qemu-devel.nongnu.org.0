Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780E42E853A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 18:57:13 +0100 (CET)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvOfn-0003ob-Kh
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 12:57:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kvOeM-00034J-Rc
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 12:55:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:52384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kvOeK-0002j5-PV
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 12:55:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kvOeH-0002iQ-IU
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 17:55:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7FBDB2E813A
 for <qemu-devel@nongnu.org>; Fri,  1 Jan 2021 17:55:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 01 Jan 2021 17:50:11 -0000
From: Bruce Merry <1909823@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bmerry
X-Launchpad-Bug-Reporter: Bruce Merry (bmerry)
X-Launchpad-Bug-Modifier: Bruce Merry (bmerry)
Message-Id: <160952341194.5646.9883047582696050309.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1909823] [NEW] RDPMC check on PCE is backwards
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: 85040c3b31ad5bf0b27178b4173c84290b394f89
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
Reply-To: Bug 1909823 <1909823@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

At [this
line](https://github.com/qemu/qemu/blob/75ee62ac606bfc9eb59310b9446df3434bf=
6e8c2/target/i386/tcg/misc_helper.c#L225)
the check on CR4_PCE_MASK is backwards: it's raising an exception if the
flag is set (and CPL !=3D 0) rather than if the flag is clear.

It's low priority at the moment because the instruction isn't
implemented, so you get an illegal opcode exception when expecting a
GPF, or vice versa, but it's a time bomb for if it is ever implemented.

The Intel docs also indicate that CR0.PE influences the protection; I
don't know if that's already reflected in env->hflags & HF_CPL_MASK.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909823

Title:
  RDPMC check on PCE is backwards

Status in QEMU:
  New

Bug description:
  At [this
  line](https://github.com/qemu/qemu/blob/75ee62ac606bfc9eb59310b9446df3434=
bf6e8c2/target/i386/tcg/misc_helper.c#L225)
  the check on CR4_PCE_MASK is backwards: it's raising an exception if
  the flag is set (and CPL !=3D 0) rather than if the flag is clear.

  It's low priority at the moment because the instruction isn't
  implemented, so you get an illegal opcode exception when expecting a
  GPF, or vice versa, but it's a time bomb for if it is ever
  implemented.

  The Intel docs also indicate that CR0.PE influences the protection; I
  don't know if that's already reflected in env->hflags & HF_CPL_MASK.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909823/+subscriptions


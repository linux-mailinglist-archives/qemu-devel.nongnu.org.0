Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC1C323AF8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:02:39 +0100 (CET)
Received: from localhost ([::1]:45726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErwE-0002FK-Oe
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lErv1-0001i0-Id
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:01:23 -0500
Received: from indium.canonical.com ([91.189.90.7]:36368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lEruz-0005Ji-IZ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:01:23 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lErux-0006yA-D3
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 11:01:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5EB002E813B
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 11:01:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Feb 2021 10:53:18 -0000
From: Peter Maydell <1914535@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: avevad pmaydell
X-Launchpad-Bug-Reporter: Vadim Averin (avevad)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <161241593716.24579.2543593740941156934.malonedeb@wampee.canonical.com>
Message-Id: <161416399861.28697.5879554400594894333.malone@chaenomeles.canonical.com>
Subject: [Bug 1914535] Re: PL110 8-bit mode is not emulated correctly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f759833f01c7f0b01b31b10cf317a55893ebb0ad"; Instance="production"
X-Launchpad-Hash: 2639a537f52351f66060d0686087413b2d944022
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
Reply-To: Bug 1914535 <1914535@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think unless you can either (a) show that QEMU is behaving differently
from the real hardware or (b) point at what bit of the hardware
documentation QEMU's implementation is not following, then this doesn't
really sound like it's a bug in QEMU.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914535

Title:
  PL110 8-bit mode is not emulated correctly

Status in QEMU:
  New

Bug description:
  When the emulated pl110/pl111 is switched programmatically to 8-bit
  color depth mode, the display is drawn green and blue, but the real
  PL110 displays grayscale in 8-bit mode.

  The bug appears in qemu-system-arm version 3.1.0 (Debian
  1:3.1+dfsg-8+deb10u8) and qemu-system-arm version 5.2.50
  (v5.2.0-1579-g99ae0cd90d).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914535/+subscriptions


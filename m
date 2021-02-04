Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFFD30EC00
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 06:27:18 +0100 (CET)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7XAi-0002CK-LN
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 00:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7X9F-0001iP-7c
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 00:25:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:51746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7X9C-000491-Hv
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 00:25:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l7X96-0002TP-9O
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 05:25:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 41B372E8010
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 05:25:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Feb 2021 05:18:57 -0000
From: Vadim Averin <1914535@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: avevad
X-Launchpad-Bug-Reporter: Vadim Averin (avevad)
X-Launchpad-Bug-Modifier: Vadim Averin (avevad)
Message-Id: <161241593716.24579.2543593740941156934.malonedeb@wampee.canonical.com>
Subject: [Bug 1914535] [NEW] PL110 8-bit mode is not emulated correctly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: ece1392061d7f7a2c90eb91598e813ec5abf530b
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
Reply-To: Bug 1914535 <1914535@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

When the emulated pl110/pl111 is switched programmatically to 8-bit
color depth mode, the display is drawn green and blue, but the real
PL110 displays grayscale in 8-bit mode.

The bug appears in qemu-system-arm version 3.1.0 (Debian
1:3.1+dfsg-8+deb10u8) and qemu-system-arm version 5.2.50
(v5.2.0-1579-g99ae0cd90d).

** Affects: qemu
     Importance: Undecided
         Status: New

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


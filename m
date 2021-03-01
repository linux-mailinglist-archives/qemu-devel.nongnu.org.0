Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B7328DCF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 20:19:11 +0100 (CET)
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGo4V-0004Ue-05
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 14:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGo16-0003s8-AN
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 14:15:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:43846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGo14-0002Rb-Hw
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 14:15:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lGo11-0000aL-Sv
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 19:15:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D90B82E8152
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 19:15:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Mar 2021 19:07:49 -0000
From: Iris Johnson <1913344@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: modwizcode
X-Launchpad-Bug-Reporter: Iris Johnson (modwizcode)
X-Launchpad-Bug-Modifier: Iris Johnson (modwizcode)
References: <161169274433.14547.17841565794451082949.malonedeb@wampee.canonical.com>
Message-Id: <161462566978.25487.15936574446601738244.launchpad@gac.canonical.com>
Subject: [Bug 1913344] Re:  Exynos4210 UART peripheral data loss
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cd61f0bfc5208dd4b58a15e953892eaabba1e0b8"; Instance="production"
X-Launchpad-Hash: 67300aa150ea985715e2856dbe8babc69d83c36d
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
Reply-To: Bug 1913344 <1913344@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913344

Title:
   Exynos4210 UART peripheral data loss

Status in QEMU:
  Fix Committed

Bug description:
  Currently the Exynos4210 UART (hw/char/exynos4210_uart.c) incorrectly
  reports however many empty bytes are available in the FIFO when
  queried for receive capacity. However this peripheral supports a
  polled mode where only a single byte can be submitted at a time and
  the FIFO is unused, meaning that in polled mode data is lost since
  it's written into the FIFO and the polling code in FIFO disabled mode
  only returns the value in the RX data register.

  Even worse, potentially enabling the FIFO without a FIFO reset will
  create a weird situation where data is already in the FIFO whenever
  data came in faster than the polling could pick it up (which is
  basically always).

  This change obscured the issue in
  https://bugs.launchpad.net/qemu/+bug/1913341, which instead presented
  as strange data loss until I locally resolved this issue.

  I have a patch ready for the bug and will submit it later today, I'm
  just filing for clarity.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913344/+subscriptions


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9926236E92E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:52:20 +0200 (CEST)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4HJ-000674-AX
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc4GE-0005X1-SL
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:51:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:37644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc4GD-0007tK-4e
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:51:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lc4GB-0006qr-JX
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:51:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 929842E8157
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:51:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Apr 2021 10:45:17 -0000
From: Thomas Huth <1904954@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ethernet lan lan9118 networking
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alfred2g pmaydell
X-Launchpad-Bug-Reporter: alfred gedeon (alfred2g)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160584191813.16356.9445911921619079194.malonedeb@chaenomeles.canonical.com>
Message-Id: <161969311761.11308.1056147195491949369.launchpad@soybean.canonical.com>
Subject: [Bug 1904954] Re: lan9118 bug peeked received message size not equal
 to actual received message size
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: a298179f7f1e76425f44f8676aa87071873dc787
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
Reply-To: Bug 1904954 <1904954@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags removed: netwroking
** Tags added: networking

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904954

Title:
  lan9118 bug peeked received message size not equal to actual received
  message size

Status in QEMU:
  Fix Committed

Bug description:
  peeked message size is not equal to read message size

  Bug in the code at line:
  https://github.com/qemu/qemu/blob/master/hw/net/lan9118.c#L1209

  s->tx_status_fifo_head should be s->rx_status_fifo_head

  Could also be a security bug, as the user could allocate a buffer of
  size peeked data smaller than the actual packet received, which could
  cause a buffer overflow.

  Thanks,

  Alfred

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904954/+subscriptions


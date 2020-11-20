Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD292BA16D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 05:22:44 +0100 (CET)
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfxwY-0003Mn-L4
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 23:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfxv4-0002uy-5f
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 23:21:10 -0500
Received: from indium.canonical.com ([91.189.90.7]:39922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfxud-0002Ks-JQ
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 23:21:09 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfxub-0002tV-D7
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 04:20:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5F5A02E813E
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 04:20:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2020 04:08:18 -0000
From: alfred gedeon <1904954@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ethernet lan lan9118 netwroking
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alfred2g
X-Launchpad-Bug-Reporter: alfred gedeon (alfred2g)
X-Launchpad-Bug-Modifier: alfred gedeon (alfred2g)
References: <160584191813.16356.9445911921619079194.malonedeb@chaenomeles.canonical.com>
Message-Id: <160584529925.24958.18431032884067308323.launchpad@wampee.canonical.com>
Subject: [Bug 1904954] Re: lan9118 bug peeking receive massage size not equal
 to received message size
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 2520dc8cf66c1dd0296c1199efd459bbbc9d63b3
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

** Description changed:

  peeked message size is not equal to read message size
  =

  Bug in the code at line:
  https://github.com/qemu/qemu/blob/master/hw/net/lan9118.c#L1209
  =

  s->tx_status_fifo_head should be s->rx_status_fifo_head
  =

+ Could also be a security bug, as the user could allocate a buffer of
+ size peeked data smaller than the actual packet received, which could
+ cause a buffer overflow and its attaks.
+ =

  Thanks,
  =

  Alfred

** Description changed:

  peeked message size is not equal to read message size
  =

  Bug in the code at line:
  https://github.com/qemu/qemu/blob/master/hw/net/lan9118.c#L1209
  =

  s->tx_status_fifo_head should be s->rx_status_fifo_head
  =

  Could also be a security bug, as the user could allocate a buffer of
  size peeked data smaller than the actual packet received, which could
- cause a buffer overflow and its attaks.
+ cause a buffer overflow.
  =

  Thanks,
  =

  Alfred

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904954

Title:
  lan9118 bug peeking receive massage size not equal to received message
  size

Status in QEMU:
  New

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


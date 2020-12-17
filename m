Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BCD2DC9E3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 01:21:30 +0100 (CET)
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kph2u-0001Q4-UE
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 19:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kph1V-0000vd-6I
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 19:20:01 -0500
Received: from indium.canonical.com ([91.189.90.7]:40840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kph1T-0003mz-5S
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 19:20:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kph1Q-0006iX-Qr
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 00:19:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C1B022E813C
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 00:19:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Dec 2020 00:02:31 -0000
From: "Darrin M. Gorski" <1213196@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 5qk3gg6cp81roqqbfsitohb98stjiq5g darringorski
X-Launchpad-Bug-Reporter: Nathaniel Filardo (5qk3gg6cp81roqqbfsitohb98stjiq5g)
X-Launchpad-Bug-Modifier: Darrin M. Gorski (darringorski)
References: <20130816180742.32647.79496.malonedeb@chaenomeles.canonical.com>
Message-Id: <160816335136.3817.11813133528707664229.malone@gac.canonical.com>
Subject: [Bug 1213196] Re: -serial tcp should hang up when DTR goes low
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a68a6d599c812dd1dd335307d9c5c017c50ba81b"; Instance="production"
X-Launchpad-Hash: a726a45773b9e4ab1229e8d5cb3ded2c76761e5b
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
Reply-To: Bug 1213196 <1213196@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sent in a patch for this.

https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg04658.html

DTR controls the socket.

DCD reflects the state of the socket.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1213196

Title:
  -serial tcp should hang up when DTR goes low

Status in QEMU:
  New

Bug description:
  In keeping with the spirit of serial modem control signals, de-
  asserting DTR should cause the TCP connection to break; asserting DTR
  should cause QEMU to initiate a new connection or for it to accept
  another (in server mode; this may involve waiting for one to arrive,
  too).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1213196/+subscriptions


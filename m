Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B507278706
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 10:11:27 +0200 (CEST)
Received: from localhost ([::1]:50366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs0kg-0001oA-FO
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 04:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43479)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hs0kB-0001P3-Ki
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 04:10:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hs0kA-0000Sc-GS
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 04:10:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:58330)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hs0kA-0000Rp-BE
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 04:10:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hs0k8-0007nd-Ca
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 08:10:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5C2F82E80CB
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 08:10:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jul 2019 07:59:16 -0000
From: elmarco <marcandre.lureau@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hugelgupf marcandre-lureau
X-Launchpad-Bug-Reporter: Chris Koch (hugelgupf)
X-Launchpad-Bug-Modifier: elmarco (marcandre-lureau)
References: <156438177001.5960.9261076941599056117.malonedeb@soybean.canonical.com>
Message-Id: <156438715697.11796.5957890622881397734.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: bdcf93f44b4917cad0acbc3f9526ed9b56dc0baa
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1838228] Re: Slirp Broadcast traffic
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
Reply-To: Bug 1838228 <1838228@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

slirp has been moved to a standalone project, can you report here:
https://gitlab.freedesktop.org/slirp/libslirp/issues

I don't have an answer off the top of my head, but I would suggest
looking/tweaking at the network mask. And for the receive side,
debugging from sorecvfrom().

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838228

Title:
  Slirp Broadcast traffic

Status in QEMU:
  New

Bug description:
  Hi all,

  Version: QEMU emulator version 3.1.0 (Debian 1:3.1+dfsg-7+build1)

  I'm running some DHCP traffic to a *custom* DHCP server with user-mode
  networking in QEMU. I'm using port 30067 for the server, so this does
  not conflict with the built-in DHCP server.

  DHCP broadcasts to and from the server, and I'm observing issues with
  both sending and receiving packets.

  Firstly, from the VM, a packet sent to IPv4 x.x.x.2:30067 (gateway)
  makes it to the server, but a packet sent to 255.255.255.255 does not.
  I'd suspect that Slirp has to support sending to the broadcast IP
  address? Or is this something I can turn on with a configuration
  option? (My QEMU version too old?)

  Secondly, the source address in a DHCP IPv4 packet must be 0.0.0.0 (by
  RFC). That means that any return packet will have 0.0.0.0 swapped in
  as its destination address. However, that packet doesn't make it into
  the VM at all. I know that if you deliver this packet to Linux, a raw
  socket will spit it back out. The packets' destination address should
  not prevent the packet from being delivered to the right VM, since
  Slirp (should?) know exactly which VM the session belongs to. (It's a
  proxy, not a router.)

  WDYT? Did I miss some configuration options or use too old a version?

  Thanks,
  Chris

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838228/+subscriptions


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA34E1401
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 10:22:41 +0200 (CEST)
Received: from localhost ([::1]:57078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNBui-0007Vf-Ot
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 04:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46976)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iNBou-0005OS-1O
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:16:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iNBos-0005bT-3m
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:16:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:42064)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iNBoo-0005Te-GW
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:16:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iNBol-0002Gi-4w
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:16:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 11C7C2E80C8
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:16:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Oct 2019 07:58:43 -0000
From: Thomas Huth <1192464@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bk-rakesh th-huth
X-Launchpad-Bug-Reporter: bk.rakesh (bk-rakesh)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20130619071409.29504.88410.malonedeb@wampee.canonical.com>
Message-Id: <157181752333.22114.1821230983583297846.malone@wampee.canonical.com>
Subject: [Bug 1192464] Re: udp checksum computed as 0 not converted to 0xffff, 
 from guest os that share a common linux bridge among multiple guest os
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="186023fa645d8be19d403a76064f0643f510db2f";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a0f56c1de7779be7de8c4847a39ccdc6c98c04ec
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1192464 <1192464@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Triaging old buck tickets ... can you still reproduce this issue with
the latest version of QEMU? Is it only happening with e1000 or also with
other NICs? What kind of network backend are you using (--netdev user ?
tap ? ....). Could you please provide the full command line that you use
to run QEMU? Thanks!

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1192464

Title:
  udp checksum computed as 0 not converted to 0xffff, from guest os that
  share a common linux bridge among multiple guest os

Status in QEMU:
  Incomplete

Bug description:
  UDP checksum computed as '0' during transmission of packets that uses
  e1000 NIC in the Guest as well as emulated h/w in the qemu layer, That
  needs to be converted to 0xffff, This occurs only when Hardware
  checksum offload is been set in the guest OS NIC and made it as a
  transmitter. The guest O.S use the N/W interface that is been shared
  to the linux brige created in the host (used source=3D<bridge>) in the
  xml tags of libvirt.

  As per RFC768(http://tools.ietf.org/html/rfc768 [^]), If the computed
  checksum is zero, it is transmitted as all ones (the equivalent in
  one's complement arithmetic). An all zero transmitted checksum value
  means that the transmitter generated no checksum (for debugging or for
  higher level protocols that don't care).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1192464/+subscriptions


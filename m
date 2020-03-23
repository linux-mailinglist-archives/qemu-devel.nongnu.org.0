Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E3818FE87
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 21:16:58 +0100 (CET)
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGTVI-0000Ae-TC
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 16:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jGTU1-0007Jb-Br
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 16:15:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jGTU0-0001fx-3H
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 16:15:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:36670)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jGTTz-0001fa-Td
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 16:15:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jGTTy-0006Kd-Dc
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 20:15:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6149E2E806B
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 20:15:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Mar 2020 20:10:23 -0000
From: dkg <dkg@fifthhorseman.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dkg0
X-Launchpad-Bug-Reporter: dkg (dkg0)
X-Launchpad-Bug-Modifier: dkg (dkg0)
Message-Id: <158499422385.10961.5853987871982902669.malonedeb@soybean.canonical.com>
Subject: [Bug 1868617] [NEW] multiseat: route different spice tablet events to
 distinct vdagents
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 0372f9822f51af208526b892bfc69af339b03ebc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1868617 <1868617@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

docs/multiseat.txt says:

> Note on spice: Spice handles multihead just fine.  But it can't do
> multiseat.  For tablet events the event source is sent to the spice
> agent.  But qemu can't figure it, so it can't do input routing.
> Fixing this needs a new or extended input interface between
> libspice-server and qemu.  For keyboard events it is even worse:  The
> event source isn't included in the spice protocol, so the wire
> protocol must be extended to support this.

I'm not sure exactly what "can't figure it" means, but it looks to me
like qemu can't route incoming tablet events from a spice client to
distinct vdagent channels.

I think this part of the process can be fixed within qemu.  I've
reported https://gitlab.freedesktop.org/spice/spice-gtk/issues/121 to
address the issues with the keyboard interface at the protocol level.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1868617

Title:
  multiseat: route different spice tablet events to distinct vdagents

Status in QEMU:
  New

Bug description:
  docs/multiseat.txt says:

  > Note on spice: Spice handles multihead just fine.  But it can't do
  > multiseat.  For tablet events the event source is sent to the spice
  > agent.  But qemu can't figure it, so it can't do input routing.
  > Fixing this needs a new or extended input interface between
  > libspice-server and qemu.  For keyboard events it is even worse:  The
  > event source isn't included in the spice protocol, so the wire
  > protocol must be extended to support this.

  I'm not sure exactly what "can't figure it" means, but it looks to me
  like qemu can't route incoming tablet events from a spice client to
  distinct vdagent channels.

  I think this part of the process can be fixed within qemu.  I've
  reported https://gitlab.freedesktop.org/spice/spice-gtk/issues/121 to
  address the issues with the keyboard interface at the protocol level.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1868617/+subscriptions


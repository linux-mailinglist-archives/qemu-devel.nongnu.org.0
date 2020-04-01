Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A97F19A914
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 12:02:06 +0200 (CEST)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJaCC-0000k1-R1
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 06:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jJaB9-0008Ro-1m
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 06:01:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jJaB6-0007xS-KP
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 06:00:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:55630)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jJaB6-0007t0-DG
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 06:00:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jJaB4-0001qe-NA
 for <qemu-devel@nongnu.org>; Wed, 01 Apr 2020 10:00:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AE1502E8105
 for <qemu-devel@nongnu.org>; Wed,  1 Apr 2020 10:00:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Apr 2020 09:55:22 -0000
From: Tobias Witek <1870098@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: twitek
X-Launchpad-Bug-Reporter: Tobias Witek (twitek)
X-Launchpad-Bug-Modifier: Tobias Witek (twitek)
Message-Id: <158573492237.25129.5161164490189934653.malonedeb@soybean.canonical.com>
Subject: [Bug 1870098] [NEW] [block/vpc] cynamic disk header: off-by-one error
 for "num_bat_entries"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a296f04231dee355be5db73cc878b9e21689a253";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: e371a18d49bfd25c32ac02cdadd1148c8fc90737
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
Reply-To: Bug 1870098 <1870098@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

In current qemu versions (observed in 5.0.0-rc1 as well as
2833ad487cfff7dc33703e4731b75facde1c561e), disk headers for dynamic VPCs
are written with an incorrect "block allocation table entries" value.

https://www.microsoft.com/en-us/download/details.aspx?id=3D23850 (the
corresponding spec) states that:

"Max Table Entries
This field holds the maximum entries present in the BAT. This should be equ=
al to the number of blocks in the disk (that is, the disk size divided by t=
he block size)."

Inside the qemu code, the value is "disk size divided by the block size
*plus one*".

Calculating "num_bat_entries" as "total_sectors/(block_size / 512)"
*should* fix the issue.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1870098

Title:
  [block/vpc] cynamic disk header: off-by-one error for
  "num_bat_entries"

Status in QEMU:
  New

Bug description:
  In current qemu versions (observed in 5.0.0-rc1 as well as
  2833ad487cfff7dc33703e4731b75facde1c561e), disk headers for dynamic
  VPCs are written with an incorrect "block allocation table entries"
  value.

  https://www.microsoft.com/en-us/download/details.aspx?id=3D23850 (the
  corresponding spec) states that:

  "Max Table Entries
  This field holds the maximum entries present in the BAT. This should be e=
qual to the number of blocks in the disk (that is, the disk size divided by=
 the block size)."

  Inside the qemu code, the value is "disk size divided by the block
  size *plus one*".

  Calculating "num_bat_entries" as "total_sectors/(block_size / 512)"
  *should* fix the issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1870098/+subscriptions


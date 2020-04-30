Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AB21BFA35
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 15:52:55 +0200 (CEST)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU9cU-0005Q2-LU
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 09:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49930)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU9TX-0001hv-3e
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:45:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU9R1-0000Oc-DP
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:43:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:33388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jU9R0-0000No-Op
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:41:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jU9Qz-0005tF-1v
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:41:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 02BE72E810D
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:41:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2020 13:32:05 -0000
From: Laurent Vivier <Laurent@vivier.eu>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kwolf-redhat laurent-vivier twitek
X-Launchpad-Bug-Reporter: Tobias Witek (twitek)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <158573492237.25129.5161164490189934653.malonedeb@soybean.canonical.com>
Message-Id: <158825352507.5900.17681780920821938079.malone@soybean.canonical.com>
Subject: [Bug 1870098] Re: [block/vpc] dynamic disk header: off-by-one error
 for "num_bat_entries"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 1e7b9e9279967025aaead996c89914e2f0afeeae
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 09:35:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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

Fixed here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D3f6de653b946


** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1870098

Title:
  [block/vpc] dynamic disk header: off-by-one error for
  "num_bat_entries"

Status in QEMU:
  Fix Released

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


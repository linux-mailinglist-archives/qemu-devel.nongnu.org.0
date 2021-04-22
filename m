Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B759D367F8E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 13:27:45 +0200 (CEST)
Received: from localhost ([::1]:52214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZXUm-0004qZ-Sw
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 07:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZXTU-0004Gm-QH
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 07:26:26 -0400
Received: from indium.canonical.com ([91.189.90.7]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZXTS-0002Xf-6F
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 07:26:24 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZXTQ-0002pu-MF
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 11:26:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A3F092E8050
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 11:26:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 11:13:49 -0000
From: Max Reitz <1563931@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth xanclic zeenix
X-Launchpad-Bug-Reporter: Zeeshan Ali (zeenix)
X-Launchpad-Bug-Modifier: Max Reitz (xanclic)
References: <20160330153436.30911.26305.malonedeb@gac.canonical.com>
Message-Id: <161909002926.32215.4007610530815445659.malone@soybean.canonical.com>
Subject: [Bug 1563931] Re: qemu-img should allow resizing image with snapshots
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 3c6d7df0c4c9d9e146f4254c28991228f540d86c
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
Reply-To: Bug 1563931 <1563931@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implemented in 7fa140abf69675b7b83af32de.  Note that every internal
snapshot has a disk size associated with it, though, so applying a
snapshot from when the image had a different size means the image size
will be reverted to what it was as the time of the snapshot.

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1563931

Title:
  qemu-img should allow resizing image with snapshots

Status in QEMU:
  Fix Released

Bug description:
  Currently it's not possible to resize a disk image with qemu-img if
  image in question has snapshots associated. I'm not entirely sure this
  is technically possible but if it is, it would be really nice to
  support that.

  $ qemu-img --version
  qemu-img version 2.4.1 (qemu-2.4.1-8.fc23), Copyright (c) 2004-2008 Fabri=
ce Bellard

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1563931/+subscriptions


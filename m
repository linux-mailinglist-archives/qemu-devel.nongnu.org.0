Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090C231D794
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 11:36:33 +0100 (CET)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCKC8-0002Dy-44
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 05:36:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lCKBQ-0001nm-1k
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:35:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:48840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lCKBN-0002Gp-Sx
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:35:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lCKBL-0002I2-2L
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 10:35:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 100152E8024
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 10:35:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Feb 2021 10:29:21 -0000
From: Thomas Huth <1815445@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ggardet jnsnow
X-Launchpad-Bug-Reporter: Guillaume Gardet (ggardet)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154988507422.19358.16245527010669752237.malonedeb@soybean.canonical.com>
Message-Id: <161355776224.5337.4735547068770662802.launchpad@gac.canonical.com>
Subject: [Bug 1815445] Re: change and eject commands are not working on an
 overlay
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b3a93345a124168b715ec9ae0945884caa15f58f"; Instance="production"
X-Launchpad-Hash: 34832be3ef70b5ed5617acb4037503f2bd126c1f
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
Reply-To: Bug 1815445 <1815445@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1815445

Title:
  change and eject commands are not working on an overlay

Status in QEMU:
  Incomplete

Bug description:
  From qemu monitor, 'change' and 'eject' commands are not working on a CD =
overlay.
  'info block' returns:
    cd0-overlay0: /home/guillaume/test/cd0-overlay0 (qcow2)
      Attached to:      cd0-device
      Removable device: not locked, tray closed
      Cache mode:       writeback, ignore flushes
      Backing file:     /home/guillaume/test.iso (chain depth: 1)

  But 'eject cd0-overlay0' returns:
    Device 'cd0-overlay0' not found
  I also tried 'cd0-device' and 'cd0'.

  Same problem with 'change' command.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1815445/+subscriptions


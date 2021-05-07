Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A43C37658E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:51:03 +0200 (CEST)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezwb-0002xH-Ut
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lezhr-0005YP-GT
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:35:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:37854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lezhp-0005NN-BV
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:35:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lezhm-0002Xp-0X
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 12:35:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EE35B2E8195
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 12:35:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 12:30:28 -0000
From: Eric Blake <1884831@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake th-huth tobias-hunger
X-Launchpad-Bug-Reporter: TobiasHunger (tobias-hunger)
X-Launchpad-Bug-Modifier: Eric Blake (eblake)
References: <159294358125.13789.3860026407311199131.malonedeb@wampee.canonical.com>
Message-Id: <162039062901.6177.17779935471683066697.malone@wampee.canonical.com>
Subject: [Bug 1884831] Re: qemu-nbd fails to discard bigger chunks
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 0fa966cfd14c1b5d6debc489ccf0317cfe312016
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
Reply-To: Bug 1884831 <1884831@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 890cbccb0 included in upstream release 5.1.0.

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884831

Title:
  qemu-nbd fails to discard bigger chunks

Status in QEMU:
  Fix Released

Bug description:
  This report is moved from systemd to here:
  https://github.com/systemd/systemd/issues/16242

  A qemu-nbd device reports that it can discard a lot of bytes:

  cat /sys/block/nbd0/queue/discard_max_bytes
  2199023255040

  And indeed, discard works with small images:

  $ qemu-img create -f qcow2 /tmp/image.img 2M
  $ sudo qemu-nbd --connect=3D/dev/nbd0 /tmp/image.img
  $ sudo blkdiscard /dev/nbd0

  but not for bigger ones (still smaller than discard_max_bytes):

  $ qemu-img create -f qcow2 /tmp/image.img 5G
  $ sudo qemu-nbd --connect=3D/dev/nbd0 /tmp/image.img
  $ sudo blkdiscard /dev/nbd0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884831/+subscriptions


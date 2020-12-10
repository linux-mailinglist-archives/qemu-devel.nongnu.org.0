Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DAD2D5669
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:15:12 +0100 (CET)
Received: from localhost ([::1]:36912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knI2Y-0005nT-No
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHpN-0002AD-1O
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:01:33 -0500
Received: from indium.canonical.com ([91.189.90.7]:60204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHpB-0000jF-K1
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:01:32 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knHpA-0004hz-DA
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:01:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 621EE2E813E
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:01:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 08:48:46 -0000
From: Thomas Huth <1838658@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange gson pmaydell prlw1 th-huth
X-Launchpad-Bug-Reporter: Patrick Welche (prlw1)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156467368424.6955.5535032657029646608.malonedeb@soybean.canonical.com>
Message-Id: <160759012612.31246.2584347515254966347.malone@soybean.canonical.com>
Subject: [Bug 1838658] Re: qemu 4.0.0 broken by glib update
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: c2a099edce08394dd21a23606737650e2088e656
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
Reply-To: Bug 1838658 <1838658@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Released with QEMU v5.2.0.

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838658

Title:
  qemu 4.0.0 broken by glib update

Status in QEMU:
  Fix Released

Bug description:
  In brief, an install CD will successfully boot with qemu 4.0.0 built with=
 glib 2.58.3, but freeze during boot with qemu 4.0.0 built with glib 2.60.0=
. I tracked it down to glib's GHashTable improvements. qemu is happy with a=
 glib built from
  ```
   git checkout -f 2.60.4
   git revert --no-edit 86c6f7e2b..3bed8a13b
   git revert --no-edit 75f8ec1df9b48b0c3a13a9125f2c7d7c5adf5159
   git revert --no-edit 603fb5958..d3074a748
   git revert --no-edit 0b45ddc55..0600dd322
  ```
  When the GHashTable improvements were committed, there was already a pree=
mptive note about any breakage being due to using private implementation de=
tails, hence mentioning it here rather than with glib.

  For the full saga, see: http://gnats.netbsd.org/54310

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838658/+subscriptions


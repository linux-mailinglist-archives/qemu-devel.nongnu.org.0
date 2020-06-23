Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEB620630A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 23:18:03 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnqIs-0006W7-Fn
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 17:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jnqHu-0005jL-It
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 17:17:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:56568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jnqHr-00042H-Gh
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 17:17:02 -0400
Received: from gac.canonical.com ([91.189.90.20])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jnqHp-0005Vo-FO
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 21:16:57 +0000
Received: from gac.canonical.com (localhost [IPv6:::1])
 by gac.canonical.com (Postfix) with ESMTPS id 65FC85C04DA
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 21:16:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2020 21:16:56 -0000
From: Launchpad Bug Tracker <1884831@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake tobias-hunger
X-Launchpad-Bug-Reporter: TobiasHunger (tobias-hunger)
X-Launchpad-Bug-Modifier: Eric Blake (eblake)
References: <159294358125.13789.3860026407311199131.malonedeb@wampee.canonical.com>
Subject: [Bug 1884831] [NEW] qemu-nbd fails to discard bigger chunks
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Message-Id: <159294701710.25289.6165876669234081304.launchpad@gac.canonical.com>
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="appserver-secrets-lazr.conf"
X-Launchpad-Hash: bb26ecca4b654f587f65fd15590279b89ed8d1dd
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 16:25:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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

You have been subscribed to a public bug:

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

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

qemu-nbd fails to discard bigger chunks
https://bugs.launchpad.net/bugs/1884831
You received this bug notification because you are a member of qemu-devel-m=
l, which is subscribed to QEMU.


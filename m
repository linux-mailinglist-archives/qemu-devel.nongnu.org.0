Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530862F2728
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:38:16 +0100 (CET)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBRf-00074r-DM
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBJf-00061B-Js
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:29:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:52846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBJc-0002KH-DV
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:29:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBJb-00054b-5B
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:29:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 14D142E8144
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:29:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:22 -0000
From: Launchpad Bug Tracker <786208@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor nelhage th-huth
X-Launchpad-Bug-Reporter: Nelson Elhage (nelhage)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20110521152806.22761.57475.malonedeb@wampee.canonical.com>
Message-Id: <161042504317.10246.18138567573791133887.malone@loganberry.canonical.com>
Subject: [Bug 786208] Re: Missing checks for non-existent device in
 ide_exec_cmd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: a5d56a2840ff35fb6aef63cafcdb5e56b72cb8fa
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
Reply-To: Bug 786208 <786208@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/786208

Title:
  Missing checks for non-existent device in ide_exec_cmd

Status in QEMU:
  Expired

Bug description:
  Several calls in the ide_exec_cmd handler are missing checks for
  (!s->bs) or similar, resulting in NULL pointer dereferences, divide-
  by-zero, or possibly other badness if the guest performs operations on
  a non-existent IDE master.

  For example, the WIN_READ_NATIVE_MAX command does a 'ide_set_sector(s,
  s->nb_sectors - 1);', which does 'cyl =3D sector_num / (s->heads *
  s->sectors);', which will fail with a divide-by-zero if heads =3D
  sectors =3D 0.

  And WIN_MULTREAD also does not check for s->bs, but does a
  'ide_sector_read(s);', which will do 'bdrv_read(s->bs, sector_num,
  s->io_buffer, n);' on a NULL s->bs, leading to a segfault.

  I do not *believe* that a malicious guest can do anything more than
  cause a crash with these bugs.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/786208/+subscriptions


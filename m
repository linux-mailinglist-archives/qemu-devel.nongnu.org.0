Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35DD3A3C02
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 08:26:12 +0200 (CEST)
Received: from localhost ([::1]:59270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lracN-0002p0-Do
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 02:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrabC-000293-2q
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:24:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:47466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrab9-0003xw-Kc
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:24:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lrab4-0002KK-H1
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 06:24:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7319D2E8192
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 06:24:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Jun 2021 06:12:15 -0000
From: Thomas Huth <391880@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu-kvm; component=main; 
 status=Confirmed; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kirkland nbaum
X-Launchpad-Bug-Reporter: Nathan Baum (nbaum)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
X-Launchpad-Bug-Duplicate: 391879
References: <20090625001609.12141.93410.malonedeb@gandwana.canonical.com>
Message-Id: <162339193588.28809.12105484705024317549.launchpad@gac.canonical.com>
Subject: [Bug 391880] Re: migrate exec hangs for several minutes if the pipe
 is closed before all its data is written
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: c63f848b02aef57e2fb0b0a31e0051b9eb79de37
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
Reply-To: Bug 391880 <391880@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 391879 ***
    https://bugs.launchpad.net/bugs/391879

** No longer affects: qemu

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/391880

Title:
  migrate exec hangs for several minutes if the pipe is closed before
  all its data is written

Status in qemu-kvm package in Ubuntu:
  Confirmed

Bug description:
  Binary package hint: kvm

  Using

    migrate "exec:true"

  in the monitor hangs the VM for several minutes. What I expect is that
  the VM stops attempting to migrate after the pipe has been closed.

  Indicating a background migrate with -d doesn't help. Presumably the
  migration is not backgrounded until a certain amount of data is
  written to the pipe, or the migration times out. What I expect is that
  the migration is backgrounded immediately.

  =3D=3D Version information

  $ lsb_release -rd
  Description: Ubuntu 9.04
  Release: 9.04

  $ apt-cache policy kvm
  kvm:
    Installed: 1:84+dfsg-0ubuntu11
    Candidate: 1:84+dfsg-0ubuntu11
    Version table:
   *** 1:84+dfsg-0ubuntu11 0
          500 http://gb.archive.ubuntu.com jaunty/main Packages
          100 /var/lib/dpkg/status

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu/+source/qemu-kvm/+bug/391880/+subscriptio=
ns


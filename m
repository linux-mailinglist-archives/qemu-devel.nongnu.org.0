Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985083B9B99
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 06:40:58 +0200 (CEST)
Received: from localhost ([::1]:37242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzAz3-00018o-Mx
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 00:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAl9-0000zg-Mx
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:43646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAks-0002cP-6j
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzAke-00053j-UJ
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 04:26:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7534E2E826F
 for <qemu-devel@nongnu.org>; Fri,  2 Jul 2021 04:25:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jul 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1783437@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fahe janitor th-huth
X-Launchpad-Bug-Reporter: Fabian (fahe)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153247670930.31632.15065752803528835886.malonedeb@chaenomeles.canonical.com>
Message-Id: <162519943698.31921.5133309425493873694.malone@loganberry.canonical.com>
Subject: [Bug 1783437] Re: read-modify-write page faults error code has write
 bit unset
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 46c00a9407f33a8e006804de187318f859c78614
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
Reply-To: Bug 1783437 <1783437@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1783437

Title:
  read-modify-write page faults error code has write bit unset

Status in QEMU:
  Expired

Bug description:
  Consider the attached C file, which does a read-modify-write of the
  form `add [mem], reg`, where `mem` points to a non-present page. In
  the resulting page fault, the W/R bit is not set, while real hardware
  does set this bit.

  % gcc -m32 qemu-bug1.c&& ./a.out && qemu-i386 ./a.out
  page fault: addr=3D0x70000000 err=3D0x6
  page fault: addr=3D0x70000000 err=3D0x4

  Tested on the qemu-3.0.0-rc1 release.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1783437/+subscriptions


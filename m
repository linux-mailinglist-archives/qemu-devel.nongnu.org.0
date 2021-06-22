Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B363AFC67
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 07:05:37 +0200 (CEST)
Received: from localhost ([::1]:58578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYbQ-0006Fa-KK
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 01:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4G-000343-2e
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:20 -0400
Received: from indium.canonical.com ([91.189.90.7]:58892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4D-0000Uf-Ti
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:19 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY4B-0003uH-Qy
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:15 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BB1C32E8086
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:18:52 -0000
From: Launchpad Bug Tracker <1574346@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor luto-mit th-huth
X-Launchpad-Bug-Reporter: Andy Lutomirski (luto-mit)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160424174546.5288.30510.malonedeb@chaenomeles.canonical.com>
Message-Id: <162433553298.20423.1340431066590334915.malone@loganberry.canonical.com>
Subject: [Bug 1574346] Re: TCG: mov to segment register is incorrectly
 emulated for AMD CPUs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: fc4ce0da5c65fdac5c2d3ea7bd7225c223dd55a1
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
Reply-To: Bug 1574346 <1574346@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1574346

Title:
  TCG: mov to segment register is incorrectly emulated for AMD CPUs

Status in QEMU:
  Expired

Bug description:
  In TCG mode, the effect of:

  xorl %eax, %eax
  movl %eax, %gs

  is to mark the GS segment unusable and set its base to zero.  After
  doing this, reading MSR_GS_BASE will return zero and using a GS prefix
  in long mode will treat the GS base as zero.

  This is correct for Intel CPUs but is incorrect for AMD CPUs.  On an
  AMD CPU, writing 0 to %gs using mov, pop, or (I think) lgs will leave
  the base unchanged.

  To make it easier to use TCG to validate behavior on different CPUs,
  please consider changing the TCG behavior to match actual CPU behavior
  when emulating an AMD CPU.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1574346/+subscriptions


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E5A23F7A2
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Aug 2020 14:47:31 +0200 (CEST)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k4OG2-0006Rl-UO
	for lists+qemu-devel@lfdr.de; Sat, 08 Aug 2020 08:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k4OEB-0005PA-B0
 for qemu-devel@nongnu.org; Sat, 08 Aug 2020 08:45:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:37722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k4OE9-0007TF-7D
 for qemu-devel@nongnu.org; Sat, 08 Aug 2020 08:45:35 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k4OE7-0005Gx-5u
 for <qemu-devel@nongnu.org>; Sat, 08 Aug 2020 12:45:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 026352E8025
 for <qemu-devel@nongnu.org>; Sat,  8 Aug 2020 12:45:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2020 12:30:37 -0000
From: Thomas Huth <812398@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Triaged; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mmu ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth till-straumann
X-Launchpad-Bug-Reporter: till (till-straumann)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20110718161723.13916.57921.malonedeb@soybean.canonical.com>
Message-Id: <159688983839.21521.470424559552315772.launchpad@chaenomeles.canonical.com>
Subject: [Bug 812398] Re: powerpc 7450 MMU initialization broken
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 80b79ccbee796b2d5a1ffc37141f46830bc346e8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/08 03:59:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 812398 <812398@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> Triaged

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/812398

Title:
  powerpc 7450 MMU initialization broken

Status in QEMU:
  Triaged

Bug description:
  The 7540 family of PPCs' MMU can update TLBs using hardware search
  (like a 604 or 7400) but also using a software algorithm. The
  mechanism used is defined by HID0[STEN].

  By default (CPU reset) HID0 is set to 0x80000000 (BTW; another small bug,=
 qemu doesn't set the hardwired MSB), hence
  the software-table lookup feature is *disabled*. However, the default (an=
d immutable) 'mmu_model' for this CPU family is POWERC_MMU_SOFT_74XX which =
choses the soft TLB replacement scheme.

  To fix this:

  1) the initial mmu_model for the 7450 family (includes 7441, 7445, 7451, =
7455, 7457, 7447, 7448) should be: POWERPC_MMU_32B
  2) when HID0[STEN] is written then the mmu_model should be changed accord=
ingly (I'm not familiar enough with the qemu internal state to judge if any=
 cached state would have to be updated).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/812398/+subscriptions


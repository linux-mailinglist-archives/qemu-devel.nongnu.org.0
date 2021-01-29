Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB07F308744
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:12:36 +0100 (CET)
Received: from localhost ([::1]:60440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PpT-000441-Q7
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5PoH-0003U5-7S
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:11:21 -0500
Received: from indium.canonical.com ([91.189.90.7]:48686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5PoB-0001pt-Jy
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:11:20 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l5Po9-0004ey-H0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 09:11:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 740622E813D
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 09:11:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Jan 2021 08:54:11 -0000
From: Thomas Huth <1294227@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cdall jnsnow m-smarduch pmaydell th-huth
X-Launchpad-Bug-Reporter: Mario Smarduch (m-smarduch)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140318172403.30474.3932.malonedeb@soybean.canonical.com>
Message-Id: <161191045135.7685.1299030882895936670.malone@gac.canonical.com>
Subject: [Bug 1294227] Re: migration wrong handling of KVM_GET_DIRTY_LOG ioctl
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: 543b1ff5f9c5e4020c32ae0fd7f3d1ecfa59be40
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
Reply-To: Bug 1294227 <1294227@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yet another try to fix this issue:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07557.html

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1294227

Title:
  migration wrong handling of KVM_GET_DIRTY_LOG ioctl

Status in QEMU:
  Confirmed

Bug description:
  In the code below kvm_vm_ioctl(...) can return --errno !=3D -1 from ioctl=
 call,  but return only checks for -1. =

  Found during KVM-ARM migration which apperead to go through but was actua=
lly failing getting =

  memslot dirty bitmap.

  static int kvm_physical_sync_dirty_bitmap(....)
  {
   ....
   if(kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) =3D=3D -1) {
     - err out
   }
   ... continue
  }

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1294227/+subscriptions


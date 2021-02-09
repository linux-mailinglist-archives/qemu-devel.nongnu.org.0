Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0EE3151D9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:42:36 +0100 (CET)
Received: from localhost ([::1]:38760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UDr-0003Ms-2t
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9UBJ-0001uD-Nq
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:39:57 -0500
Received: from indium.canonical.com ([91.189.90.7]:51920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9UBG-0008QU-EN
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:39:57 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l9UBE-0007MQ-Ab
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 14:39:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 420DD2E813C
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 14:39:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Feb 2021 14:25:49 -0000
From: Thomas Huth <1294227@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cdall jnsnow m-smarduch pmaydell th-huth
X-Launchpad-Bug-Reporter: Mario Smarduch (m-smarduch)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140318172403.30474.3932.malonedeb@soybean.canonical.com>
Message-Id: <161288074981.32602.298079002675624484.malone@gac.canonical.com>
Subject: [Bug 1294227] Re: migration wrong handling of KVM_GET_DIRTY_LOG ioctl
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: c3d66de0f9a60ba34fab9911755e43d64698840e
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
Reply-To: Bug 1294227 <1294227@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch has been merged here:
https://gitlab.com/qemu-project/qemu/-/commit/38e0b7904eca7cd32

** Changed in: qemu
       Status: Confirmed =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1294227

Title:
  migration wrong handling of KVM_GET_DIRTY_LOG ioctl

Status in QEMU:
  Fix Committed

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


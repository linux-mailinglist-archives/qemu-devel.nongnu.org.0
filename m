Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC80936F79D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:11:30 +0200 (CEST)
Received: from localhost ([::1]:43968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPBK-0003rO-3c
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcP61-0008VD-5O
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:06:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:59772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcP5z-0000Qw-Fr
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:06:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcP5y-0008Vf-7B
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:05:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2E9512E815A
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:05:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:54:36 -0000
From: Thomas Huth <1294227@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cdall jnsnow m-smarduch pmaydell th-huth
X-Launchpad-Bug-Reporter: Mario Smarduch (m-smarduch)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140318172403.30474.3932.malonedeb@soybean.canonical.com>
Message-Id: <161977287739.13825.5984271101510312596.launchpad@wampee.canonical.com>
Subject: [Bug 1294227] Re: migration wrong handling of KVM_GET_DIRTY_LOG ioctl
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 844fe63e4f9b17446f81179661f26025dadd1f65
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

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1294227

Title:
  migration wrong handling of KVM_GET_DIRTY_LOG ioctl

Status in QEMU:
  Fix Released

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


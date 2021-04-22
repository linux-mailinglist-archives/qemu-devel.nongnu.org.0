Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93D9367B4A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:43:44 +0200 (CEST)
Received: from localhost ([::1]:35012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZU00-00024f-0W
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTxp-00005u-IP
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:41:29 -0400
Received: from indium.canonical.com ([91.189.90.7]:42328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTxl-0002lB-Iq
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:41:29 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTxh-0007wO-RL
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:41:21 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4EB252E816C
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:41:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:34:50 -0000
From: Thomas Huth <1843941@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: rbd
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fflorensa gsoneill jdillaman th-huth
X-Launchpad-Bug-Reporter: Gregory O'Neill (gsoneill)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156840017982.27082.9691017826426087373.malonedeb@soybean.canonical.com>
Message-Id: <161907689084.6464.1598544138563724941.malone@chaenomeles.canonical.com>
Subject: [Bug 1843941] Re: RBD Namespaces are not supported
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 63ea6567bd716016e73edca57d3b75626683b9de
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
Reply-To: Bug 1843941 <1843941@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch had been included here:
https://gitlab.com/qemu-project/qemu/-/commit/19ae9ae01471552

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843941

Title:
  RBD Namespaces are not supported

Status in QEMU:
  Fix Released

Bug description:
  Ceph Nautilus (v14.2.0) introduced the Namespaces concept for RADOS
  Block Devices. This provides a logical separation within a RADOS Pool
  for RBD images which enables granular access control. See
  https://docs.ceph.com/docs/nautilus/releases/nautilus/ for additional
  details.

  librados and librbd support this, however qemu does not. The rbd man
  page defines how rbd images within a namespace can be referenced.
  https://docs.ceph.com/docs/nautilus/man/8/rbd/#image-snap-group-and-
  journal-specs

  Adding support for RBD namespaces would be beneficial for security and
  reducing the impact of a hypervisor being compromised and putting an
  entire Ceph pool or cluster at risk.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843941/+subscriptions


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D8C3755C8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:39:15 +0200 (CEST)
Received: from localhost ([::1]:37652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lef9m-0003rp-56
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lef6R-000218-N2
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:35:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:53834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lef6J-0000A6-N9
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:35:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lef6G-0004uj-JW
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 14:35:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 924252E804C
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 14:35:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 14:30:08 -0000
From: Thomas Huth <1875762@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: stefanha th-huth vorteil-alan
X-Launchpad-Bug-Reporter: Alan Murtagh (vorteil-alan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158811390770.10067.14727390581808721252.malonedeb@soybean.canonical.com>
Message-Id: <162031140815.4369.1604950724412255150.malone@gac.canonical.com>
Subject: [Bug 1875762] Re: Poor disk performance on sparse VMDKs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 559604f75d973a88b3c00f4e66b5d5768161e39e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1875762 <1875762@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, I'm closing this now, since this is the expected behavior according
to Stefan's description.

** Changed in: qemu
       Status: New =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1875762

Title:
  Poor disk performance on sparse VMDKs

Status in QEMU:
  Won't Fix

Bug description:
  Found in QEMU 4.1, and reproduced on master.

  QEMU appears to suffer from remarkably poor disk performance when
  writing to sparse-extent VMDKs. Of course it's to be expected that
  allocation takes time and sparse VMDKs peform worse than allocated
  VMDKs, but surely not on the orders of magnitude I'm observing. On my
  system, the fully allocated write speeds are approximately 1.5GB/s,
  while the fully sparse write speeds can be as low as 10MB/s. I've
  noticed that adding "cache unsafe" reduces the issue dramatically,
  bringing speeds up to around 750MB/s. I don't know if this is still
  slow or if this perhaps reveals a problem with the default caching
  method.

  To reproduce the issue I've attached two 4GiB VMDKs. Both are
  completely empty and both are technically sparse-extent VMDKs, but one
  is 100% pre-allocated and the other is 100% unallocated. If you attach
  these VMDKs as second and third disks to an Ubuntu VM running on QEMU
  (with KVM) and measure their write performance (using dd to write to
  /dev/sdb and /dev/sdc for example) the difference in write speeds is
  clear.

  For what it's worth, the flags I'm using that relate to the VMDK are
  as follows:

  `-drive if=3Dnone,file=3Dsparse.vmdk,id=3Dhd0,format=3Dvmdk -device virti=
o-
  scsi-pci,id=3Dscsi -device scsi-hd,drive=3Dhd0`

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1875762/+subscriptions


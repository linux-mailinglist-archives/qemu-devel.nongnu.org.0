Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B822C2D3B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:47:03 +0100 (CET)
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbT5-0006bk-0S
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbIK-0003n2-Vu
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:35:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:35438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbID-0003Pt-Ex
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:35:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khbIA-00077O-CU
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:35:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 46D952E8148
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:35:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2020 16:27:38 -0000
From: Thomas Huth <1771042@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: convolvatron fjoe stefanha
X-Launchpad-Bug-Reporter: eric hoffman (convolvatron)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152625681679.27592.11833589256802380892.malonedeb@wampee.canonical.com>
Message-Id: <160623525951.30224.5773283652433922327.launchpad@wampee.canonical.com>
Subject: [Bug 1771042] Re: dataplane interrupt handler doesn't support msi
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 67e0eca5157baec933b1b9527cd0a52510fb7032
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
Reply-To: Bug 1771042 <1771042@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1771042

Title:
  dataplane interrupt handler doesn't support msi

Status in QEMU:
  Invalid

Bug description:
  hw/block/dataplane/virtio-blk.c commit
  1010cadf62332017648abee0d7a3dc7f2eef9632

  in the function notify_guest_bh, the function virtio_notify_irqfd is call=
ed
  to deliver the interrupt corresponding to the vq

  however, without the dataplane, hw/block/virtio_blk_req_complete calls
  virtio_notify to deliver the interrupt (immediately). this goes though
  a slightly more involved path that calls virtio_pci_notify which includes
  a case to handle msi interrupts.

  so, msi interrupts with block devices aren't serviced when using dataplane
  batching.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1771042/+subscriptions


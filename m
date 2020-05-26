Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46001C6603
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 04:51:34 +0200 (CEST)
Received: from localhost ([::1]:48432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWA9l-0000Tw-8Z
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 22:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jWA8o-0008Uy-TZ
 for qemu-devel@nongnu.org; Tue, 05 May 2020 22:50:34 -0400
Received: from indium.canonical.com ([91.189.90.7]:40630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jWA8n-00087O-Gq
 for qemu-devel@nongnu.org; Tue, 05 May 2020 22:50:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jWA8l-00062e-EE
 for <qemu-devel@nongnu.org>; Wed, 06 May 2020 02:50:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6821B2E8104
 for <qemu-devel@nongnu.org>; Wed,  6 May 2020 02:50:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 06 May 2020 02:43:28 -0000
From: xuan <1877015@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: xavier-ding
X-Launchpad-Bug-Reporter: xuan (xavier-ding)
X-Launchpad-Bug-Modifier: xuan (xavier-ding)
Message-Id: <158873300816.14142.15664636500998863138.malonedeb@gac.canonical.com>
Subject: [Bug 1877015] [NEW] virtio only support packed ring size power of 2
 between 256 and 1024
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 99d89655fb9b7ba7feaed518721cf59845aab8ad
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 22:50:31
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1877015 <1877015@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Issue discription=EF=BC=9A
When QEMU starts with "-device virtio-net-pci,netdev=3Dnetdev0,mac=3D52:54:=
00:00:00:01,disable-modern=3Dfalse,mrg_rxbuf=3Don,rx_queue_size=3D1025,tx_q=
ueue_size=3D1025,mq=3Don,vectors=3D15,packed=3Don"

It raises error: Invalid rx_queue_size (=3D 1025), must be a power of 2
between 256 and 1024

Analysis:
According to virtio1.1 spec, the packed queue size value does not have to b=
e a power of 2.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877015

Title:
  virtio only support packed ring size power of 2 between 256 and 1024

Status in QEMU:
  New

Bug description:
  Issue discription=EF=BC=9A
  When QEMU starts with "-device virtio-net-pci,netdev=3Dnetdev0,mac=3D52:5=
4:00:00:00:01,disable-modern=3Dfalse,mrg_rxbuf=3Don,rx_queue_size=3D1025,tx=
_queue_size=3D1025,mq=3Don,vectors=3D15,packed=3Don"

  It raises error: Invalid rx_queue_size (=3D 1025), must be a power of 2
  between 256 and 1024

  Analysis:
  According to virtio1.1 spec, the packed queue size value does not have to=
 be a power of 2.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877015/+subscriptions


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DBB364FB0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 03:07:19 +0200 (CEST)
Received: from localhost ([::1]:50074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYerF-000408-R7
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 21:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYepd-0003Tw-2G
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 21:05:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:35626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYepb-00031n-7O
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 21:05:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYepZ-0005oY-5n
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 01:05:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2759E2E8157
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 01:05:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 00:56:13 -0000
From: David Tomaschik <1925094@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: matir
X-Launchpad-Bug-Reporter: David Tomaschik (matir)
X-Launchpad-Bug-Modifier: David Tomaschik (matir)
Message-Id: <161888017396.16822.14585960363575040225.malonedeb@wampee.canonical.com>
Subject: [Bug 1925094] [NEW] DISCARD support for Crypto Block Devices
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: c6c46b865669617c3b5717b9e5821bf0b069e465
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
Reply-To: Bug 1925094 <1925094@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

It appears that running `fstrim` or similar is useless when the VM is on
a LUKS-encrypted device using QEMU's native LUKS support.

Looking at the source, it seems that block/crypto.c lacks an
implementation for bdrv_co_pdiscard, which probably needs to delegate to
a per-crypto type discard helper.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1925094

Title:
  DISCARD support for Crypto Block Devices

Status in QEMU:
  New

Bug description:
  It appears that running `fstrim` or similar is useless when the VM is
  on a LUKS-encrypted device using QEMU's native LUKS support.

  Looking at the source, it seems that block/crypto.c lacks an
  implementation for bdrv_co_pdiscard, which probably needs to delegate
  to a per-crypto type discard helper.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1925094/+subscriptions


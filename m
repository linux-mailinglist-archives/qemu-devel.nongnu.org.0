Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832852EC75C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 01:36:38 +0100 (CET)
Received: from localhost ([::1]:42480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxJI5-0002bo-1q
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 19:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxJH6-0002B5-Kd
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 19:35:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:37314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxJH4-0006r8-Fb
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 19:35:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxJH2-0002p0-Co
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 00:35:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5FB412E8135
 for <qemu-devel@nongnu.org>; Thu,  7 Jan 2021 00:35:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 07 Jan 2021 00:26:37 -0000
From: cinap_lenrek <1901359@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cinaplenrek
X-Launchpad-Bug-Reporter: cinap_lenrek (cinaplenrek)
X-Launchpad-Bug-Modifier: cinap_lenrek (cinaplenrek)
References: <160358192028.26978.16757353407676731946.malonedeb@wampee.canonical.com>
Message-Id: <160997919768.5056.8613380969208139408.malone@chaenomeles.canonical.com>
Subject: [Bug 1901359] Re: ignore bit 0 in pci CONFIG_ADDRESS register write
 for Type 1 access
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: b69c977f1916081ca7c28d01a7c7414987c27219
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
Reply-To: Bug 1901359 <1901359@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

is anybody home?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1901359

Title:
  ignore bit 0 in pci CONFIG_ADDRESS register write for Type 1 access

Status in QEMU:
  New

Bug description:
  I'v recently stumbled upon a bug in the Plan9 PCI config space access
  routines for config mode #1.

  The code used to set bit 0 in the CONFIG_ADDRESS register for a Type 1
  access.

  This was most likely a misreading of the PCI local bus specification
  on our side.

  However, in the PCI local bus specification 3.0, it states the
  following:

  > 3.2.2.3.2 Software Generation of Configuration Transactions
  > ...
  > For Type 1 translations, the host bridge directly copies the contents o=
f the
  > CONFIG_ADDRESS register (excluding bits 31 and 0) onto the PCI AD lines=
 during the
  > address phase of a configuration transaction making sure that AD[1::0] =
is "01".

  note the: "excluding bits 31 and 0"

  What happens in qemu instead is that it uses bit 0 of the CONFIG_ADDRESS
  register as part of the register offset (when it probably should ignore i=
t)
  when translating from Type 1 to Type 0 address. So once it reaches the de=
vice
  behind the bridge the register address is off by one.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1901359/+subscriptions


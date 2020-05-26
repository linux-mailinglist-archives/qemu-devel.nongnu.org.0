Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557B21BFA2E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 15:52:22 +0200 (CEST)
Received: from localhost ([::1]:49770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU9bx-0004TY-9m
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 09:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48616)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU9OT-0001nD-6U
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:40:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU9Lm-0007OS-V1
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:38:24 -0400
Received: from indium.canonical.com ([91.189.90.7]:60240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jU9Lm-0007Nf-Fo
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:35:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jU9Lk-0005Bv-Pw
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:35:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A8DCC2E8111
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:35:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2020 13:29:15 -0000
From: Laurent Vivier <Laurent@vivier.eu>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kawakami-k laurent-vivier rth
X-Launchpad-Bug-Reporter: Kentaro Kawakami (kawakami-k)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <158168561076.14835.7019812774701035317.malonedeb@soybean.canonical.com>
Message-Id: <158825335644.11959.17980474868531607295.launchpad@wampee.canonical.com>
Subject: [Bug 1863247] Re: AArch64 EXT instruction for V register does not
 clear MSB side bits
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 9f828e339a7c861abc687999686975071e139106
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 09:35:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1863247 <1863247@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863247

Title:
  AArch64 EXT instruction for V register does not clear MSB side bits

Status in QEMU:
  Fix Released

Bug description:
  On AArch64 CPU with SVE register, there seems to be a bug in the
  operation when executing EXT instruction to V registers. Bits above
  the 128 bits of the SVE register must be cleared to 0, but qemu-
  aarch64 seems to hold the value.

  Example
  ext v0.16b, v1.16b v2.16b, 8

  After executing above instruction, (N-1) to 128 bits of z0 register
  must be 0, where N is SVE register width.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863247/+subscriptions


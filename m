Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAA22B3329
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 10:16:51 +0100 (CET)
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keE9S-0001Xw-8W
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 04:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1keE8M-0008CM-RX
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 04:15:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:48606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1keE8K-0000ip-Bc
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 04:15:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1keE8H-0005ua-Rq
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 09:15:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CD8102E80EA
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 09:15:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2020 09:06:22 -0000
From: Takumi Nakamura <1904317@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chapuni
X-Launchpad-Bug-Reporter: Takumi Nakamura (chapuni)
X-Launchpad-Bug-Modifier: Takumi Nakamura (chapuni)
Message-Id: <160543118215.29327.13808899207251644228.malonedeb@wampee.canonical.com>
Subject: [Bug 1904317] [NEW] cpu feature selection is not affected to guest 's
 cpuid with whpx
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: 1a5ce775706b9f56b235268e0f07aad00d4d654c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 03:40:43
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1904317 <1904317@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

On windows with -accel whpx, "-cpu" is ignored without any messages.
Guest recognizes features as same as host's.

Confirmed on v5.2.0-rc1.

I suggest qemu may do,

- Warn with incompatible -cpu options were given.
- Enhance cpuid handling.

Background:
I was investigated mmio and block copy issue in Linux kernel.
I met a problem that Linux went ill for touching mmio with whpx. (not with =
tcg)
I suspect erms(enhanced rep movs) might trigger.
I tried to mask erms on qemu with -feature,erms, but it was ineffective.

At last, I disabled erms manually, to tweak whpx-all.c to mask erms in
cpuid.

FYI, qemu with whpx from/to mmio, "rep movsb" does byte access regardless o=
f erms.
Linux kernel tends to choose not "rep movsq" but "rep movsb" with erms.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904317

Title:
  cpu feature selection is not affected to guest 's cpuid with whpx

Status in QEMU:
  New

Bug description:
  On windows with -accel whpx, "-cpu" is ignored without any messages.
  Guest recognizes features as same as host's.

  Confirmed on v5.2.0-rc1.

  I suggest qemu may do,

  - Warn with incompatible -cpu options were given.
  - Enhance cpuid handling.

  Background:
  I was investigated mmio and block copy issue in Linux kernel.
  I met a problem that Linux went ill for touching mmio with whpx. (not wit=
h tcg)
  I suspect erms(enhanced rep movs) might trigger.
  I tried to mask erms on qemu with -feature,erms, but it was ineffective.

  At last, I disabled erms manually, to tweak whpx-all.c to mask erms in
  cpuid.

  FYI, qemu with whpx from/to mmio, "rep movsb" does byte access regardless=
 of erms.
  Linux kernel tends to choose not "rep movsq" but "rep movsb" with erms.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904317/+subscriptions


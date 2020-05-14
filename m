Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60DE1D34CA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 17:16:48 +0200 (CEST)
Received: from localhost ([::1]:60306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZFbL-0002h1-SJ
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 11:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jZFLu-0002hQ-4K
 for qemu-devel@nongnu.org; Thu, 14 May 2020 11:00:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:37650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jZFLs-0006Cr-RC
 for qemu-devel@nongnu.org; Thu, 14 May 2020 11:00:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jZFLq-0000BC-QV
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 15:00:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C529D2E80E7
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 15:00:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2020 14:52:10 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1878628@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
Message-Id: <158946793086.21783.444088944852561068.malonedeb@wampee.canonical.com>
Subject: [Bug 1878628] [NEW] linux-user/mmap build failure using Clang 10
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0385b538081bc4718df6fb844a3afc89729c94ce";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6fedd2ff811cdabc457f79b63af2f8479c76076e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 11:00:47
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
Reply-To: Bug 1878628 <1878628@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

When building with Clang 10 on Fedora 32, we get:

    CC      linux-user/mmap.o
  linux-user/mmap.c:720:49: error: result of comparison 'unsigned long' > 1=
8446744073709551615 is always false [-Werror,-Wtautological-type-limit-comp=
are]
          if ((unsigned long)host_addr + new_size > (abi_ulong)-1) {
              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878628

Title:
  linux-user/mmap build failure using Clang 10

Status in QEMU:
  New

Bug description:
  When building with Clang 10 on Fedora 32, we get:

      CC      linux-user/mmap.o
    linux-user/mmap.c:720:49: error: result of comparison 'unsigned long' >=
 18446744073709551615 is always false [-Werror,-Wtautological-type-limit-co=
mpare]
            if ((unsigned long)host_addr + new_size > (abi_ulong)-1) {
                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878628/+subscriptions


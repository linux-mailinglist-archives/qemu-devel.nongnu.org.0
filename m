Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A0F1C2B90
	for <lists+qemu-devel@lfdr.de>; Sun,  3 May 2020 13:07:00 +0200 (CEST)
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVCSZ-00064F-6n
	for lists+qemu-devel@lfdr.de; Sun, 03 May 2020 07:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jVCMo-0004tA-Li
 for qemu-devel@nongnu.org; Sun, 03 May 2020 07:01:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:60300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jVCMn-0000G5-6l
 for qemu-devel@nongnu.org; Sun, 03 May 2020 07:01:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jVCMj-0004FA-KR
 for <qemu-devel@nongnu.org>; Sun, 03 May 2020 11:00:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 938DC2E8030
 for <qemu-devel@nongnu.org>; Sun,  3 May 2020 11:00:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 03 May 2020 10:49:45 -0000
From: Manuel Reimer <manuel.reimer@gmx.de>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: manuel-reimer
X-Launchpad-Bug-Reporter: Manuel Reimer (manuel-reimer)
X-Launchpad-Bug-Modifier: Manuel Reimer (manuel-reimer)
Message-Id: <158850298589.4878.18034033813424107508.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1876568] [NEW] "semtimedop" implementation missing in qemu?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: ba46f840cdf7e218f1070815c5f23856bccf6bb9
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/03 07:00:57
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
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
Reply-To: Bug 1876568 <1876568@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I was trying to do an ARMv6 cross compile with qemu-user-static when I
ran into this:

https://travis-ci.com/github/VDR4Arch/vdr4arch/jobs/326884620#L1596

I was close to giving up when I found the following:

https://github.com/osrf/multiarch-docker-image-generation/issues/36

Most important comment may be this one:

https://github.com/osrf/multiarch-docker-image-
generation/issues/36#issuecomment-610626796

> The "correct" way to fix this does seem to be to implement semtimedop
in qemu.

I don't know how much involved the people, discussing there, are in the
qemu development but I thought it may be a good idea to bring this to
your attention. If this is already fixed (I haven't found any bug about
"semtimedop"), then please just close this one and tell me in which
version the fix will be included.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1876568

Title:
  "semtimedop" implementation missing in qemu?

Status in QEMU:
  New

Bug description:
  I was trying to do an ARMv6 cross compile with qemu-user-static when I
  ran into this:

  https://travis-ci.com/github/VDR4Arch/vdr4arch/jobs/326884620#L1596

  I was close to giving up when I found the following:

  https://github.com/osrf/multiarch-docker-image-generation/issues/36

  Most important comment may be this one:

  https://github.com/osrf/multiarch-docker-image-
  generation/issues/36#issuecomment-610626796

  > The "correct" way to fix this does seem to be to implement
  semtimedop in qemu.

  I don't know how much involved the people, discussing there, are in
  the qemu development but I thought it may be a good idea to bring this
  to your attention. If this is already fixed (I haven't found any bug
  about "semtimedop"), then please just close this one and tell me in
  which version the fix will be included.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1876568/+subscriptions


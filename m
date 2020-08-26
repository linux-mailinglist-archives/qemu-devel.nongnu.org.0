Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D7825296B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 10:46:35 +0200 (CEST)
Received: from localhost ([::1]:40340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAr4k-0006HG-4X
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 04:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kAr3u-0005ip-1C
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 04:45:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:56432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kAr3r-0001Lj-FC
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 04:45:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kAr3p-0002OX-4f
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 08:45:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 189762E80E9
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 08:45:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2020 08:36:00 -0000
From: Mike Gelfand <1893010@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mike.dld
X-Launchpad-Bug-Reporter: Mike Gelfand (mike.dld)
X-Launchpad-Bug-Modifier: Mike Gelfand (mike.dld)
Message-Id: <159843096085.1469.8304847352897420087.malonedeb@wampee.canonical.com>
Subject: [Bug 1893010] [NEW] qemu linux-user doesn't support OFD fcntl locks
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: 3d0cb5728c543c0f586f0c89631345933b758e30
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 03:55:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1893010 <1893010@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

"Open file description locks (non-POSIX)", as they are described in
fcntl(2) man page, aren't supported by qemu-user  and attempting to use
those results in EINVAL. I'm on Gentoo with latest QEMU version
currently available (5.0.0-r2), and trying to emulate ppc64 and s390x on
x86_64.

Looking at linux-user/syscall.c, I'm guessing the issue is in (at least)
`target_to_host_fcntl_cmd` where switch reaches the default clause as
there're no cases for F_OFD_SETLK / F_OFD_SETLKW / F_OFD_GETLK.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1893010

Title:
  qemu linux-user doesn't support OFD fcntl locks

Status in QEMU:
  New

Bug description:
  "Open file description locks (non-POSIX)", as they are described in
  fcntl(2) man page, aren't supported by qemu-user  and attempting to
  use those results in EINVAL. I'm on Gentoo with latest QEMU version
  currently available (5.0.0-r2), and trying to emulate ppc64 and s390x
  on x86_64.

  Looking at linux-user/syscall.c, I'm guessing the issue is in (at
  least) `target_to_host_fcntl_cmd` where switch reaches the default
  clause as there're no cases for F_OFD_SETLK / F_OFD_SETLKW /
  F_OFD_GETLK.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1893010/+subscriptions


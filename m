Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D9220AED7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 11:16:42 +0200 (CEST)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jokTR-00087m-Eq
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 05:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jokSV-0007J5-0W
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 05:15:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:57244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jokSS-0005Z2-UQ
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 05:15:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jokSQ-0007WH-UJ
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 09:15:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DEB742E8105
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 09:15:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2020 09:10:32 -0000
From: Peter Maydell <1885247@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aleksandar-markovic pmaydell
X-Launchpad-Bug-Reporter: Aleksandar Markovic (aleksandar-markovic)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <159315507826.13901.17398620572438937429.malonedeb@wampee.canonical.com>
Message-Id: <159316263226.25927.9225015689961058162.malone@gac.canonical.com>
Subject: [Bug 1885247] Re: Build error in Intel 32-bit hosts
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: d919e4ff4fa7b585b2f66b596160422827a5545d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:10:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1885247 <1885247@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I suspect an extra uintptr_t cast will fix this:

p =3D (void *)(uintptr_t)(((uintptr_t)iter->map & TARGET_PAGE_MASK) |
off_in_page);

Which looks kind of ugly but then the code is taking a host void*
(iter->map), casting it to integer to do arithmetic on and then wanting
to get it back to a void* which is inherently going to result in a mess
of casting...

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1885247

Title:
  Build error in Intel 32-bit hosts

Status in QEMU:
  New

Bug description:
  The code base is on master, checked out on Thursday June25th 2020,
  0250c595c9d. The build procedure:

  $ mkdir build-gcc
  $ cd build-gcc
  $ ../configure
  $ make

  The build error message is:

    CC      x86_64-softmmu/hw/hyperv/hyperv.o
    CC      x86_64-softmmu/hw/hyperv/hyperv_testdev.o
    CC      x86_64-softmmu/hw/hyperv/vmbus.o
  /home/rtrk/Build/qemu-master/hw/hyperv/vmbus.c: In function =E2=80=98gpad=
l_iter_io=E2=80=99:
  /home/rtrk/Build/qemu-master/hw/hyperv/vmbus.c:386:13: error: cast to poi=
nter from integer of different size [-Werror=3Dint-to-pointer-cast]
           p =3D (void *)(((uintptr_t)iter->map & TARGET_PAGE_MASK) | off_i=
n_page);
               ^
  cc1: all warnings being treated as errors
  make[1]: *** [/home/rtrk/Build/qemu-master/rules.mak:69: hw/hyperv/vmbus.=
o] Error 1
  make: *** [Makefile:527: x86_64-softmmu/all] Error 2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1885247/+subscriptions


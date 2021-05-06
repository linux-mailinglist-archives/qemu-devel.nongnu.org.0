Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA203375564
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:08:20 +0200 (CEST)
Received: from localhost ([::1]:55028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leefr-0008MR-5u
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leeel-0007vF-Ps
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:07:11 -0400
Received: from indium.canonical.com ([91.189.90.7]:47642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leeej-0008Hf-TI
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:07:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leeeh-0007eU-Ta
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 14:07:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DCEA52E8135
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 14:07:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 13:50:52 -0000
From: Peter Maydell <1875702@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=Laurent@vivier.eu; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: agl pmaydell th-huth
X-Launchpad-Bug-Reporter: agl (agl)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <158809456539.8338.16342287412940632416.malonedeb@chaenomeles.canonical.com>
Message-Id: <162030905211.3318.1726994770382244446.malone@gac.canonical.com>
Subject: [Bug 1875702] Re: madvise reports success,
 but doesn't implement WIPEONFORK.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 7d65e0fa1ac16fd8bfe20fcb274a09db1090b6fd
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1875702 <1875702@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Still relevant. See also bug #1926521 -- MADV_DONTNEED is another
madvise() value that can't be ignored as "just a hint".


** Changed in: qemu
       Status: Incomplete =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1875702

Title:
  madvise reports success, but doesn't implement WIPEONFORK.

Status in QEMU:
  Confirmed

Bug description:
  The implementation of madvise (linux-user/syscall.c:11331, tag
  v5.0.0-rc4) always returns zero (i.e. success). However, an
  application requesting (at least) MADV_WIPEONFORK may need to know
  whether the call was actually successful. If not (because the kernel
  doesn't support WIPEONFORK) then it will need to take other measures
  to provide fork-safety (such as drawing entropy from the kernel in
  every case). But, if the application believes that WIPEONFORK is
  supported (because madvise returned zero), but it actually isn't (as
  in qemu), then it may forego those protections on the assumption that
  WIPEONFORK will provide fork-safety.

  Roughly, the comment in qemu that says "This is a hint, so ignoring
  and returning success is ok." is no longer accurate in the presence of
  MADV_WIPEONFORK.

  (This is not purely academic: BoringSSL is planning on acting in this
  way. We found the qemu behaviour in pre-release testing and are
  planning on making an madvise call with advice=3D-1 first to test
  whether unknown advice values actually produce EINVAL.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1875702/+subscriptions


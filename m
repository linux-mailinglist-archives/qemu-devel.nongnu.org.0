Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E533B31B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:57:37 +0100 (CET)
Received: from localhost ([::1]:57114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLmmt-00079e-OV
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lLmlH-0005qs-MZ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:55:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:34832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lLmlF-0003Bx-QI
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:55:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lLmlE-0000pU-2L
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 12:55:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 109992E815D
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 12:55:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Mar 2021 12:45:44 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <1918302@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=alex.bennee@linaro.org; 
X-Launchpad-Bug-Tags: arm semihosting
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee pmaydell statham-arm
X-Launchpad-Bug-Reporter: Simon Tatham (statham-arm)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <161530383644.26074.10419563158373925479.malonedeb@gac.canonical.com>
Message-Id: <161581234442.3544.11083081800830363320.malone@chaenomeles.canonical.com>
Subject: [Bug 1918302] Re: qemu-system-arm segfaults while servicing
 SYS_HEAPINFO
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d4fcb062545ed29d3cd7773e52e43615e042623f"; Instance="production"
X-Launchpad-Hash: 672e6aa9f3804bce05852e23c5d9655dbb81e9dc
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1918302 <1918302@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think this was fixed earlier by:

commit 095f8c029319b79cce487e3b566cd826b93da3e6
Author: Keith Packard <keithp@keithp.com>
Date:   Fri Jan 8 22:42:51 2021 +0000

    semihosting: Support SYS_HEAPINFO when env->boot_info is not set

    env->boot_info is only set in some ARM startup paths, so we cannot
    rely on it to support the SYS_HEAPINFO semihosting function. When not
    available, fallback to finding a RAM memory region containing the
    current stack and use the base of that.

    Signed-off-by: Keith Packard <keithp@keithp.com>
    Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
    Message-Id: <20210107170717.2098982-5-keithp@keithp.com>
    Message-Id: <20210108224256.2321-16-alex.bennee@linaro.org>

Not withstanding the other fix to the ARG usage.

** Changed in: qemu
       Status: New =3D> In Progress

** Changed in: qemu
     Assignee: (unassigned) =3D> Alex Benn=C3=A9e (ajbennee)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1918302

Title:
  qemu-system-arm segfaults while servicing SYS_HEAPINFO

Status in QEMU:
  In Progress

Bug description:
  I compiled QEMU version 5.2.0 from source on Ubuntu 18.04, and tried
  to use it to run the attached bare-metal Arm hello-world image, using
  the command line

  qemu-system-arm -M microbit -semihosting -nographic -device
  loader,file=3Dhello.hex

  The result was that qemu-system-arm itself died of a segfault.
  Compiling it for debugging, the location of the segfault was in
  target/arm/arm-semi.c, in the case handler for the semihosting call
  TARGET_SYS_HEAPINFO, on line 1020 which assigns to 'rambase':

              const struct arm_boot_info *info =3D env->boot_info;
              target_ulong rambase =3D info->loader_start;

  and the problem seems to be that 'info', aka env->boot_info, is NULL
  in this context.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1918302/+subscriptions


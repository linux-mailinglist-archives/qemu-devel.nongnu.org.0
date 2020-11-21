Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E2C2BC2A1
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 00:21:56 +0100 (CET)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgcCZ-0000bE-8q
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 18:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgcBN-00007E-Nw
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:20:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:55510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgcBL-0006Qe-H9
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:20:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgcBI-00089F-RI
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:20:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CC8852E813A
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:20:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 23:15:05 -0000
From: Peter Maydell <1668041@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nyh pmaydell rokuyama th-huth
X-Launchpad-Bug-Reporter: Nadav Har'El (nyh)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20170226112349.20229.38263.malonedeb@gac.canonical.com>
Message-Id: <160600050575.32454.15404689652575428398.malone@chaenomeles.canonical.com>
Subject: [Bug 1668041] Re: x86 Floating point exceptions - incorrect support?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 0a7ae667445ac2198b68cfb807b8ca9d1f1b7b43
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
Reply-To: Bug 1668041 <1668041@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bug still present as of commit 7fbd7e710323c8f4c (just before 5.2
release); tested with a Linux guest in system emulation and with Linux
usermode.

The underlying problem is that we don't properly implement trapping FP
exceptions; see the final paragraph in the commit message for commit
418b0f93d12a1589d50.


** Changed in: qemu
       Status: Incomplete =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1668041

Title:
  x86 Floating point exceptions - incorrect support?

Status in QEMU:
  Confirmed

Bug description:
  It seems that qemu does not correctly emulate the x86 support for
  optionally causing a floating-point exception (#FP) when, for example,
  dividing by zero. Reports such as:

  https://github.com/cloudius-systems/osv/issues/855
  http://stackoverflow.com/questions/15134189/qemu-div-by-zero-mxcsr-regist=
er

  suggest that setting the exception mask in the fpu cw or mxcsr (e.g.,
  using a function like feenableexcept() in the guest OS) does not
  generate floating point exceptions on divide by zero. The problem only
  happens on pure QEMU - when a QEMU/KVM combination is used, the actual
  hardware does the floating point work, and does throw the exception on
  divide by zero if so requested.

  Looking at the qemu (2.8.0) source code, it seems to me it really
  lacks support for generating fpu exceptions: For example,
  helper_fdiv() in target-i386/fpu_helper.c, when it notices the divisor
  is zero, seems to set the divide-by-zero exception bit, but doesn't
  seem to check whether it needs to trigger an exception (when the right
  bits on the x87 or SSE control words are enabled).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1668041/+subscriptions


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C0B381156
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 22:02:08 +0200 (CEST)
Received: from localhost ([::1]:55972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhe0d-0003Ln-8s
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 16:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdzN-0002ay-Uu
 for qemu-devel@nongnu.org; Fri, 14 May 2021 16:00:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:49720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhdzM-00006E-9m
 for qemu-devel@nongnu.org; Fri, 14 May 2021 16:00:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhdzK-0007xl-UZ
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 20:00:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C32762E8186
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 20:00:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 May 2021 19:55:06 -0000
From: Bruno Haible <1912934@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bruno-clisp th-huth
X-Launchpad-Bug-Reporter: Bruno Haible (bruno-clisp)
X-Launchpad-Bug-Modifier: Bruno Haible (bruno-clisp)
References: <161147764119.28788.10484645020687886149.malonedeb@soybean.canonical.com>
Message-Id: <162102210695.1637.8011684145245493053.malone@wampee.canonical.com>
Subject: [Bug 1912934] Re: QEMU emulation of fmadds instruction on powerpc64le
 is buggy
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 369d61b91bc5f49ce75ea49f123461094d713b17
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
Reply-To: Bug 1912934 <1912934@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The situation is still the same in QEMU 6.0.0.

$ powerpc64le-linux-gnu-gcc-5 test-fmadds.c -static
$ ~/inst-qemu/6.0.0/bin/qemu-ppc64le ./a.out ; echo $?
32


** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912934

Title:
  QEMU emulation of fmadds instruction on powerpc64le is buggy

Status in QEMU:
  New

Bug description:
  The attached program test-fmadds.c tests the fmadds instruction on
  powerpc64le.

  Result on real hardware (POWER8E processor):
  $ ./a.out ; echo $?
  0

  Result in Alpine Linux 3.13/powerpcle, emulated by QEMU 5.0.0 on Ubuntu 1=
6.04:
  $ ./a.out ; echo $?
  32

  Result in Debian 8.6.0/ppc64el, emulated by QEMU 2.9.0 on Ubuntu 16.04:
  $ ./a.out ; echo $?
  32

  Through 'nm --dynamic qemu-system-ppc64 | grep fma' I can see that
  QEMU is NOT using the fmaf() or fma() function from the host system's
  libc; this function is working fine in glibc of the host system (see
  https://www.gnu.org/software/gnulib/manual/html_node/fmaf.html ).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912934/+subscriptions


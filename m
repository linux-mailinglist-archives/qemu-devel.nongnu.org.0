Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C59A2C2E60
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:24:08 +0100 (CET)
Received: from localhost ([::1]:57074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khc2x-0005WW-Dd
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbkv-0003T2-Nh
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:05:30 -0500
Received: from indium.canonical.com ([91.189.90.7]:40950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbkt-0008PI-JH
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:05:29 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khbkr-0002D7-R3
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 17:05:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 969932E813F
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 17:05:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2020 16:49:38 -0000
From: Thomas Huth <1605123@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: leni536 th-huth
X-Launchpad-Bug-Reporter: Lenard Szolnoki (leni536)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160721083616.745.90271.malonedeb@gac.canonical.com>
Message-Id: <160623657813.8423.18360775348783941919.malone@gac.canonical.com>
Subject: [Bug 1605123] Re: PEXT returns wrong values,
 seemingly switches arguments
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 6a59b698da2d8300ef03a0d26e7197930365bef0
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
Reply-To: Bug 1605123 <1605123@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo sent a patch here:
https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05700.html

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1605123

Title:
  PEXT returns wrong values, seemingly switches arguments

Status in QEMU:
  New

Bug description:
  Hi,

  I fiddled with BMI2 instructions and discovered that pext instructions
  emulated with "qemu-x86_64 -cpu Haswell" return the wrong value. It
  seemingly switches up its arguments. I suspect that the error is around t=
he
  gen_helper_pext(...) call in target-i386/translate.c. I checked helper_pe=
xt
  in target-i386/int_helper.c and it works fine.

  I ran my program on a CPU with BMI2 instruction set too, and it indeed
  returns different values.

  I didn't check pdep, it could have the same problem.

  $ qemu-x86_64 --version
  qemu-x86_64 version 2.6.50 (v2.6.0-2095-ge66b05e-dirty), Copyright (c) 20=
03-2008 Fabrice Bellard

  $ uname -a
  Linux lenard-hp 4.3.0-1-amd64 #1 SMP Debian 4.3.5-1 (2016-02-06) x86_64 G=
NU/Linux

  I compiled the attached file with the command line "gcc -o main -g
  -mbmi2 main.c".

  $ gcc --version
  gcc (Debian 5.4.0-6) 5.4.0 20160609

  Best regards,
  L=C3=A9n=C3=A1rd Szolnoki

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1605123/+subscriptions


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DE62BC2A4
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 00:36:29 +0100 (CET)
Received: from localhost ([::1]:39996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgcQe-00083d-05
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 18:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgcPE-00075z-S3
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:35:00 -0500
Received: from indium.canonical.com ([91.189.90.7]:56178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgcPA-0002rr-6t
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:35:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgcP7-0000T7-Ut
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:34:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DB4532E813D
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:34:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 23:21:50 -0000
From: Peter Maydell <645662@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arno-wagner pmaydell th-huth wagner-tansi
X-Launchpad-Bug-Reporter: Arno Wagner (wagner-tansi)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20100923002702.20683.97345.malonedeb@soybean.canonical.com>
Message-Id: <160600091066.32168.576608806302061569.malone@chaenomeles.canonical.com>
Subject: [Bug 645662] Re: QEMU x87 emulation of trig and other complex ops is
 only at 64-bit precision, not 80-bit
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 0883d38ccc8676a7a17c220582fe39c508aca5e6
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
Reply-To: Bug 645662 <645662@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For 5.1 (commits 1f18a1e6ab8368a4, 5eebc49d2d0aa5fc7e,
5ef396e2ba865f34a, eca30647fc078f4) we reimplemented FPATAN, FYL2X,
FYL2XP1, FPREM, FPREM1, F2XM1 to do proper 80-bit precision operations.
However the trig operations FPTAN, FSINCOS, FSIN, FCOS are still
implemented as naive "convert to host double and use host C library
functions".

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/645662

Title:
  QEMU x87 emulation of trig and other complex ops is only at 64-bit
  precision, not 80-bit

Status in QEMU:
  Confirmed

Bug description:
  When doing the regression tests for Python 3.1.2 with Qemu 0.12.5, (Linux=
 version 2.6.26-2-686 (Debian 2.6.26-25lenny1)),
  gcc (Debian 4.3.2-1.1) 4.3.2, Python compiled from sources within qemu,
  3 math tests fail, apparently because the floating point unit is buggy. Q=
meu was compiled from original sources
  on Debian Lenny with kernel  2.6.34.6 from kernel.org, gcc  (Debian 4.3.2=
-1.1) 4.3. =


  Regression testing errors:

  test_cmath
  test test_cmath failed -- Traceback (most recent call last):
    File "/root/tools/python3/Python-3.1.2/Lib/test/test_cmath.py", line 36=
4, in
      self.fail(error_message)
  AssertionError: acos0034: acos(complex(-1.0000000000000002, 0.0))
  Expected: complex(3.141592653589793, -2.1073424255447014e-08)
  Received: complex(3.141592653589793, -2.1073424338879928e-08)
  Received value insufficiently close to expected value.

  =

  test_float
  test test_float failed -- Traceback (most recent call last):
    File "/root/tools/python3/Python-3.1.2/Lib/test/test_float.py", line 47=
9, in
      self.assertEqual(s, repr(float(s)))
  AssertionError: '8.72293771110361e+25' !=3D '8.722937711103609e+25'

  =

  test_math
  test test_math failed -- multiple errors occurred; run in verbose mode fo=
r deta

  =3D>

  runtests.sh -v test_math

  le01:~/tools/python3/Python-3.1.2# ./runtests.sh -v test_math
  test_math BAD
   1 BAD
   0 GOOD
   0 SKIPPED
   1 total
  le01:~/tools/python3/Python-3.1.2#

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/645662/+subscriptions


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E636F78E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:07:11 +0200 (CEST)
Received: from localhost ([::1]:35288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcP78-00009S-73
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcP1e-0004r7-LC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:01:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:59354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcP1c-0006Pg-3O
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:01:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcP1a-00085Q-AS
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:01:26 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4AE562E815D
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:01:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:52:38 -0000
From: Thomas Huth <1908551@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nsz rth th-huth
X-Launchpad-Bug-Reporter: Szabolcs Nagy (nsz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160822351418.3694.12914163160887636672.malonedeb@gac.canonical.com>
Message-Id: <161977275871.12168.548450493746512335.malone@soybean.canonical.com>
Subject: [Bug 1908551] Re: aarch64 SVE emulation breaks strnlen and strrchr
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 830679850fd24b53fb03205b963e38b219ee7425
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
Reply-To: Bug 1908551 <1908551@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://gitlab.com/qemu-project/qemu/-/commit/70acaafef2e053a3

** Changed in: qemu
       Status: Confirmed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908551

Title:
  aarch64 SVE emulation breaks strnlen and strrchr

Status in QEMU:
  Fix Released

Bug description:
  arm optimized-routines have sve string functions with test code.

  the test worked up until recently: with qemu-5.2.0 i see

  $ qemu-aarch64 build/bin/test/strnlen
  PASS strnlen
  PASS __strnlen_aarch64
  __strnlen_aarch64_sve (0x490fa0, 32) len 32 returned 64, expected 32
  input: "abcdefghijklmnopqrstuvwxyz\{|}~\x7f\x80"
  __strnlen_aarch64_sve (0x490fa0, 32) len 33 returned 64, expected 32
  input: "abcdefghijklmnopqrstuvwxyz\{|}~\x7f\x80a"
  __strnlen_aarch64_sve (0x490fa0, 33) len 33 returned 64, expected 33
  input: "abcdefghijklmnopqrstuvwxyz\{|}~\x7f\x80a"
  __strnlen_aarch64_sve (0x490fa0, 32) len 34 returned 64, expected 32
  input: "abcdefghijklmnopqrstuvwxyz\{|}~\x7f\x80ab"
  __strnlen_aarch64_sve (0x490fa0, 33) len 34 returned 64, expected 33
  input: "abcdefghijklmnopqrstuvwxyz\{|}~\x7f\x80ab"
  __strnlen_aarch64_sve (0x490fa0, 34) len 34 returned 64, expected 34
  input: "abcdefghijklmnopqrstuvwxyz\{|}~\x7f\x80ab"
  __strnlen_aarch64_sve (0x490fa0, 32) len 35 returned 64, expected 32
  input: "abcdefghijklmnopqrstuvwxyz\{|}~\x7f\x80a\x00c"
  __strnlen_aarch64_sve (0x490fa0, 33) len 35 returned 64, expected 33
  input: "abcdefghijklmnopqrstuvwxyz\{|}~\x7f\x80ab\x00"
  __strnlen_aarch64_sve (0x490fa0, 34) len 35 returned 64, expected 34
  input: "abcdefghijklmnopqrstuvwxyz\{|}~\x7f\x80abc"
  __strnlen_aarch64_sve (0x490fa0, 35) len 35 returned 64, expected 35
  input: "abcdefghijklmnopqrstuvwxyz\{|}~\x7f\x80abc"
  FAIL __strnlen_aarch64_sve

  however the test passes with

  qemu-aarch64 -cpu max,sve-max-vq=3D2

  there should be nothing vector length specific in the code.

  i haven't debugged it further, to reproduce the issue clone
  https://github.com/ARM-software/optimized-routines

  and run 'make build/bin/test/strnlen' with a config.mk like

  SUBS =3D string
  ARCH =3D aarch64
  CROSS_COMPILE =3D aarch64-none-linux-gnu-
  CC =3D $(CROSS_COMPILE)gcc
  CFLAGS =3D -std=3Dc99 -pipe -O3
  CFLAGS +=3D -march=3Darmv8.2-a+sve
  EMULATOR =3D qemu-aarch64

  (native compilation works too, and you can run 'make check' to
  run all string tests) this will build a static linked executable
  into build/bin/test. if you want a smaller test case edit
  string/test/strnlen.c

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908551/+subscriptions


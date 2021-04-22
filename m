Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2064D367A50
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 08:56:55 +0200 (CEST)
Received: from localhost ([::1]:48084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTGg-0004em-8Z
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 02:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTFg-0004AT-6i
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:55:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:32944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTFd-0000RX-Tb
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:55:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTFc-00027y-DA
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 06:55:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 626D52E815B
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 06:55:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 06:46:13 -0000
From: Ryan Houdek <1828867@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: tcg testcase x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fex-emu sonicadvance1 th-huth
X-Launchpad-Bug-Reporter: Sonicadvance1@gmail.com (sonicadvance1)
X-Launchpad-Bug-Modifier: Ryan Houdek (fex-emu)
References: <155776862725.26593.3375928624162381326.malonedeb@soybean.canonical.com>
Message-Id: <161907397345.9461.15783578450252750515.malone@wampee.canonical.com>
Subject: [Bug 1828867] Re: QEmu translation is incorrect when using REX in
 combination with LAHF/SAHF
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: ac0eb69f0b27400f34a07c52c2ddf8b4d3311a2e
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
Reply-To: Bug 1828867 <1828867@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is still relevant.

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1828867

Title:
  QEmu translation is incorrect when using REX in combination with
  LAHF/SAHF

Status in QEMU:
  New

Bug description:
  When translating code that is using LAHF and SAHF in combination with the=
 REX prefix then qemu translates incorrectly.
  These two instructions only ever use the AH register. Contrary to other i=
nstructions where if you use REX + high bit offsets then it'll pull in rsp =
and a few other registers.
  On hardware the REX prefix doesn't effect behaviour of these instructions=
 at all.
  QEMU incorrectly selects RSP as the register of choice here due to this c=
ombination of REX + AH register usage.

  I've attached a patch that is super terrible just so I can work around
  the issue locally and to sort of show off how it is to be "fixed"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1828867/+subscriptions


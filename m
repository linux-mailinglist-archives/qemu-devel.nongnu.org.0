Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB423C3A64
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 06:31:34 +0200 (CEST)
Received: from localhost ([::1]:48238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2R7t-0003cY-IL
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 00:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2R3B-0000sa-Pk
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 00:26:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:36078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2R3A-0000fJ-5x
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 00:26:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2R36-00065I-FI
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 04:26:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 765662E837B
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 04:26:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Jul 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1785734@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fahe janitor rth th-huth
X-Launchpad-Bug-Reporter: Fabian (fahe)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153360624183.17489.10217918293787091045.malonedeb@soybean.canonical.com>
Message-Id: <162597703757.19787.657529345469071988.malone@loganberry.canonical.com>
Subject: [Bug 1785734] Re: movdqu partial write at page boundary
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 8fc975081cc36c07e1cc008ca5354139e20ef0e6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1785734 <1785734@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1785734

Title:
  movdqu partial write at page boundary

Status in QEMU:
  Expired

Bug description:
  In TCG mode, when a 16-byte write instruction (such as movdqu) is
  executed at a page boundary and causes a page fault, a partial write
  is executed in the first page. See the attached code for an example.

  Tested on the qemu-3.0.0-rc1 release.

  % gcc -m32 qemu-bug2.c && ./a.out && echo && qemu-i386 ./a.out
  [snip]
  page fault: addr=3D0x70001000 err=3D0x7
  *(0x70000ff8+ 0) =3D aa
  *(0x70000ff8+ 1) =3D aa
  *(0x70000ff8+ 2) =3D aa
  *(0x70000ff8+ 3) =3D aa
  *(0x70000ff8+ 4) =3D aa
  *(0x70000ff8+ 5) =3D aa
  *(0x70000ff8+ 6) =3D aa
  *(0x70000ff8+ 7) =3D aa
  *(0x70000ff8+ 8) =3D 55
  *(0x70000ff8+ 9) =3D 55
  *(0x70000ff8+10) =3D 55
  *(0x70000ff8+11) =3D 55
  *(0x70000ff8+12) =3D 55
  *(0x70000ff8+13) =3D 55
  *(0x70000ff8+14) =3D 55
  *(0x70000ff8+15) =3D 55

  [snip]
  page fault: addr=3D0x70001000 err=3D0x6
  *(0x70000ff8+ 0) =3D 77
  *(0x70000ff8+ 1) =3D 66
  *(0x70000ff8+ 2) =3D 55
  *(0x70000ff8+ 3) =3D 44
  *(0x70000ff8+ 4) =3D 33
  *(0x70000ff8+ 5) =3D 22
  *(0x70000ff8+ 6) =3D 11
  *(0x70000ff8+ 7) =3D 0
  *(0x70000ff8+ 8) =3D 55
  *(0x70000ff8+ 9) =3D 55
  *(0x70000ff8+10) =3D 55
  *(0x70000ff8+11) =3D 55
  *(0x70000ff8+12) =3D 55
  *(0x70000ff8+13) =3D 55
  *(0x70000ff8+14) =3D 55
  *(0x70000ff8+15) =3D 55

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1785734/+subscriptions


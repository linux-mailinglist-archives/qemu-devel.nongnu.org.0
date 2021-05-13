Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BC237F8CE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 15:32:29 +0200 (CEST)
Received: from localhost ([::1]:43964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhBRz-0000Xd-Pa
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 09:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhBQU-00089p-N4
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:30:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:35022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhBQS-0000hc-EP
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:30:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhBQQ-00053b-7s
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 13:30:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1333C2E813A
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 13:30:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 13:23:09 -0000
From: Mingye Wang <1912107@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: feature-request linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: artoria2e5 th-huth
X-Launchpad-Bug-Reporter: Mingye Wang (artoria2e5)
X-Launchpad-Bug-Modifier: Mingye Wang (artoria2e5)
References: <161090862069.30717.14713485848942415507.malonedeb@chaenomeles.canonical.com>
Message-Id: <162091219001.782.14726072358038403800.launchpad@wampee.canonical.com>
Subject: [Bug 1912107] Re: Option to constrain linux-user exec() to emulated
 CPU only
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 6e30fb29956dbf4ae12aba7348e348cb985f23bf
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
Reply-To: Bug 1912107 <1912107@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> Confirmed

** Changed in: qemu
       Status: Confirmed =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912107

Title:
  Option to constrain linux-user exec() to emulated CPU only

Status in QEMU:
  New

Bug description:
  When trying to reproduce a bug someone reported on an actual AMD K10[1], =
=E2=80=8BI tried to directly throw `qemu_x86-64 -cpu =

  =E2=80=8Bphenom path/to/wrongly-labelled-instruction-set/gcc 1.c` at the =
problem, but failed to get an "illegal instruction" as expected. A quick in=
vestigation reveals that the error is actually caused by one of gcc's child=
 processess, and that the said process is being ran directly on the host. A=
 similar problem happens with trying to call stuff with /usr/bin/env.

   =E2=80=8B[1]: https://github.com/Homebrew/brew/issues/1034

  Since both the host and the guest are x86_64, I deemed binfmt
  inapplicable to my case. I believe that QEMU should offer a way to
  modify exec() and other spawning syscalls so that execution remains on
  an emulated CPU in such a case. Call it an extra layer of binfmt, if
  you must.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912107/+subscriptions


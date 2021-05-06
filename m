Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0B7375898
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:41:21 +0200 (CEST)
Received: from localhost ([::1]:58676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leh3v-0005Mu-Kz
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1legkM-0003zH-2j
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:21:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:50346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1legkI-00026U-G3
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:21:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1legkE-0007zU-FO
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 16:20:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6D6FA2E81AE
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 16:20:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 16:10:38 -0000
From: Thomas Huth <1882497@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier th-huth voltagex
X-Launchpad-Bug-Reporter: Adam Baxter (voltagex)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159159970619.31789.307920822254818587.malonedeb@gac.canonical.com>
Message-Id: <162031743819.3580.466063336324105244.malone@gac.canonical.com>
Subject: [Bug 1882497] Re: Missing 'cmp' utility makes build take 10 times as
 long
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: f8d73911612768fa2090e5fda10aa67994892c06
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
Reply-To: Bug 1882497 <1882497@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Does this problem still persist with the latest version of QEMU (since
we switched the build system mostly to meson now)?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1882497

Title:
  Missing 'cmp' utility makes build take 10 times as long

Status in QEMU:
  Incomplete

Bug description:
  I have been doing some work cross compiling qemu for Windows using a
  minimal Fedora container. Recently I started hitting some timeouts on
  the CI service and noticed a build of all targets was going over 1
  hour.

  It seems like the 'cmp' utility from diffutils is used somewhere in
  the process and if it's missing, either a configure or a make gets run
  way too many times - I'll try to pull logs from the CI system at some
  stage soon.

  Could a warning or error be added if cmp is missing?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1882497/+subscriptions


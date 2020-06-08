Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89AD1F134E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 09:11:44 +0200 (CEST)
Received: from localhost ([::1]:38478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiBwd-0006HR-BP
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 03:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jiBvk-0005ql-9T
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 03:10:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:41334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jiBvi-00044c-IM
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 03:10:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jiBvg-0002cY-AT
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 07:10:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 13A802E80E7
 for <qemu-devel@nongnu.org>; Mon,  8 Jun 2020 07:10:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2020 07:01:46 -0000
From: Adam Baxter <1882497@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: voltagex
X-Launchpad-Bug-Reporter: Adam Baxter (voltagex)
X-Launchpad-Bug-Modifier: Adam Baxter (voltagex)
Message-Id: <159159970619.31789.307920822254818587.malonedeb@gac.canonical.com>
Subject: [Bug 1882497] [NEW] Missing 'cmp' utility makes build take 10 times
 as long
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ef9fc486e875d54078fa61cf91e898b895125d89";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 9be4efd1fb1e08cd5e0288dd566a2767d31e7d65
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 02:30:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

Public bug reported:

I have been doing some work cross compiling qemu for Windows using a
minimal Fedora container. Recently I started hitting some timeouts on
the CI service and noticed a build of all targets was going over 1 hour.

It seems like the 'cmp' utility from diffutils is used somewhere in the
process and if it's missing, either a configure or a make gets run way
too many times - I'll try to pull logs from the CI system at some stage
soon.

Could a warning or error be added if cmp is missing?

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1882497

Title:
  Missing 'cmp' utility makes build take 10 times as long

Status in QEMU:
  New

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


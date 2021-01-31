Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E823309962
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 01:22:14 +0100 (CET)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l60VI-0002dP-RO
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 19:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l60Tt-00024q-4Z
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 19:20:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:51768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l60Tp-0002Hw-Gk
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 19:20:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l60Tm-0002MA-Rq
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 00:20:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CBB0B2E800F
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 00:20:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 Jan 2021 00:11:08 -0000
From: Dirk A Niggemann <1913913@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dniggema
X-Launchpad-Bug-Reporter: Dirk A Niggemann (dniggema)
X-Launchpad-Bug-Modifier: Dirk A Niggemann (dniggema)
Message-Id: <161205186910.7685.15364607958324067276.malonedeb@gac.canonical.com>
Subject: [Bug 1913913] [NEW] i386-linux-user returns -1 in sigcontext->trapno 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: 9dd492c76a082b4697200c36f71f8dbe7609aeac
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
Reply-To: Bug 1913913 <1913913@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

QEMU development version, git commit
74208cd252c5da9d867270a178799abd802b9338. Behaviour has been noted in
5.2.0 generally.

Certain 16-bit windows programs crash WINE under QEMU linux-user with:

0084:err:seh:segv_handler Got unexpected trap -1
wine: Unhandled illegal instruction at address 00006D65 (thread 0084), star=
ting debugger...

They run correctly on native i386.

Upon further inspection,it becomes clear these programs are failing at
addresses where they are making DOS calls (int 21h ie CD 21 for
instance).

It is also clear that WINE is expecting an exception/signal at this
point, to patch in the actual int21h handling code inside WINE.

However, wine uses sigcontext output extensively to do its structured
exception handling. sigcontext->trapno being set to -1 seems to confuse
it, causing it to treat the exception as an actual unhandled error.

I do not know if exception_index is being left at -1 due to the case of
privileged instructions being executed in 16-bit ldts not being handled
specifically, or if there is some other illegal instruction case causing
this.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913913

Title:
  i386-linux-user returns -1 in sigcontext->trapno

Status in QEMU:
  New

Bug description:
  QEMU development version, git commit
  74208cd252c5da9d867270a178799abd802b9338. Behaviour has been noted in
  5.2.0 generally.

  Certain 16-bit windows programs crash WINE under QEMU linux-user with:

  0084:err:seh:segv_handler Got unexpected trap -1
  wine: Unhandled illegal instruction at address 00006D65 (thread 0084), st=
arting debugger...

  They run correctly on native i386.

  Upon further inspection,it becomes clear these programs are failing at
  addresses where they are making DOS calls (int 21h ie CD 21 for
  instance).

  It is also clear that WINE is expecting an exception/signal at this
  point, to patch in the actual int21h handling code inside WINE.

  However, wine uses sigcontext output extensively to do its structured
  exception handling. sigcontext->trapno being set to -1 seems to
  confuse it, causing it to treat the exception as an actual unhandled
  error.

  I do not know if exception_index is being left at -1 due to the case
  of privileged instructions being executed in 16-bit ldts not being
  handled specifically, or if there is some other illegal instruction
  case causing this.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913913/+subscriptions


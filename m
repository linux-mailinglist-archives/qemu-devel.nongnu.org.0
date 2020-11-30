Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474662C8807
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 16:32:32 +0100 (CET)
Received: from localhost ([::1]:38474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjlAE-0006wN-R9
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 10:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjl9D-0006Ic-PZ
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:31:27 -0500
Received: from indium.canonical.com ([91.189.90.7]:34392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjl9B-0004YC-Jk
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:31:27 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kjl98-0002NE-SI
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 15:31:23 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D6E882E8173
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 15:31:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 30 Nov 2020 15:25:26 -0000
From: Richard Henderson <1699567@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anatol danb91 rth th-huth
X-Launchpad-Bug-Reporter: Anatol Pomozov (anatol)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <149806751311.22103.16824316715266267682.malonedeb@soybean.canonical.com>
Message-Id: <160674992680.7948.18363491375261058847.malone@soybean.canonical.com>
Subject: [Bug 1699567] Re: Qemu does not force SSE data alignment
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="12d09381f8e8eee3115395875b132e165fa96574"; Instance="production"
X-Launchpad-Hash: 8f48f8d74f0f5c859c77f7671a1474b723ec61c4
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
Reply-To: Bug 1699567 <1699567@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yep.  Long-standing bug.

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1699567

Title:
  Qemu does not force SSE data alignment

Status in QEMU:
  Confirmed

Bug description:
  I have an OS that tries to use SSE operations. It works fine in qemu.
  But it crashes when I try to run the OS at the host cpu using KVM.

  The instruction that crahes with #GP(0) is
   movaps ADDR,%xmm0

  The documentation says ADDR has to be 16-bytes alignment otherwise #GP
  is generated. And indeed the problem was with the data alignment.
  After adjusting it at my side the OS works fine both with Qemu and
  KVM.

  It would be great if QEMU followed specification more closely and
  forced SSE data alignment requirements. It will help to catch
  alignment issues early and debug it easier.

  =

  $ qemu-system-x86_64 -version
  QEMU emulator version 2.9.50 (v2.9.0-1363-g95eef1c68b)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1699567/+subscriptions


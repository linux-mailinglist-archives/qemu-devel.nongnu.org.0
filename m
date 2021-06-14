Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1DA3A72C6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 02:02:53 +0200 (CEST)
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lswXc-0005Im-Ko
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 20:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lswVr-00040T-NB
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 20:01:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:43866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lswVp-0008Ro-KN
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 20:01:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lswVm-0001Pd-SV
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:00:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D5B532E8085
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:00:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Jun 2021 23:51:38 -0000
From: Alexander Bulekov <1892761@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <159828509705.1974.10240334178612192608.malonedeb@chaenomeles.canonical.com>
Message-Id: <162371469824.17812.11971599419890054889.malone@gac.canonical.com>
Subject: [Bug 1892761] Re: Heap-use-after-free through double-fetch in ehci
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: c3f42f1ba562b513371f3506856df5b9f4437b5c
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
Reply-To: Bug 1892761 <1892761@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No. If we figure out some way to consistently reproduce double-fetches
in a non-fuzzer build, I'll report the issue again, but this can
probably be closed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892761

Title:
  Heap-use-after-free through double-fetch in ehci

Status in QEMU:
  Incomplete

Bug description:
  Hello,
  I don't have a qtest reproducer for this crash because it involves a DMA =
double-fetch, and I don't think we can reproduce those with qtest.

  Instead, I attached the pseudo-qtest trace produced by the fuzzer, along =
with some trace events.
  The lines annotated with [DMA] are write commands that were triggered by =
a callback from a DMA read by the device. The lines annotated with [DOUBLE-=
FETCH] are DMA accesses that hit the same address more than once (possible =
double-fetches).

  I am still thinking of nicer ways of presenting this trace and providing =
a reproducer.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892761/+subscriptions


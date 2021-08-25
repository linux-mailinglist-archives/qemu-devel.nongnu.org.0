Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487913F7049
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:23:15 +0200 (CEST)
Received: from localhost ([::1]:39046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInFi-0004Ks-8e
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDR-0001Oq-Rs
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:53 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:38690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDP-00006p-8V
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:53 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id EB3773F7AC
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876045;
 bh=d9QP5WEfYNdwDvOECgQfRl2x7ViBGJlQqKrbdgT8eDU=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=lzQuqPqbsiAhNmCyLRpq4lV5HNXMyojulPuBxAl0VVm32kcfP0ehXs/7l9GATCCGh
 t3IQr0BNeAZ8FLgpdYB4ilN/4Q1hOWJqTtKQQWvZLgI4k6UIBiRI0bbMFvVqSQK1VF
 9oRlSZaBwhJ3KgO7n8RHszQFPVqNuIuLdsRlE/gtnpoSv4i6rIxhkEzu7Ttg9+bYId
 Hh84m4nyBmUztAUFGzuHoPciBqxDB18oRT7mC/II2+MvsbjH0rc3voORb/8AGthG7e
 7dcKT4DN027PBcg1dH7/rSHAppfgCwhi/yCUOKnWJJ4seDtSNzcf3OlTdHVyVG7h1o
 vmUzCKbQAsn9w==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3C8792E8189
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:12:58 -0000
From: Thomas Huth <1905356@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui rth th-huth
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160619430337.31223.17547021210606740630.malonedeb@chaenomeles.canonical.com>
Message-Id: <162987557945.15882.2657321279490524063.launchpad@gac.canonical.com>
Subject: [Bug 1905356] Re: No check for unaligned data access in ARM32
 instructions
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 86b7ed533b75ab643fb0d346843c07fde908c915
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1905356 <1905356@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905356

Title:
  No check for unaligned data access in ARM32 instructions

Status in QEMU:
  Fix Released

Bug description:
  hi

  According to the ARM documentation, there are alignment requirements
  of load/store instructions.  Alignment fault should be raised if the
  alignment check is failed. However, it seems that QEMU doesn't
  implement this, which is against the documentation of ARM. For
  example, the instruction LDRD/STRD/LDREX/STREX must check the address
  is word alignment no matter what value the SCTLR.A is.

  I attached a testcase, which contains an instruction at VA 0x10240:
  ldrd r0,[pc.#1] in the main function. QEMU can successfully load the
  data in the unaligned address. The test is done in QEMU 5.1.0. I can
  provide more testcases for the other instructions if you need. Many
  thanks.

  To patch this, we need a check while we translate the instruction to
  tcg. If the address is unaligned, a signal number (i.e., SIGBUS)
  should be raised.

  Regards
  Muhui

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905356/+subscriptions



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4F33473D3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:43:27 +0100 (CET)
Received: from localhost ([::1]:38262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOz6s-0007nR-Ac
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOz4X-0006vg-CS
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:41:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:49264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOz4R-0003hS-6U
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:41:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lOz4P-0005nA-0G
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 08:40:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EE0482E8157
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 08:40:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Mar 2021 08:35:37 -0000
From: Yao Aili <1921082@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: yaoaili
X-Launchpad-Bug-Reporter: Yao Aili (yaoaili)
X-Launchpad-Bug-Modifier: Yao Aili (yaoaili)
Message-Id: <161657493730.24559.14872462058003243751.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1921082] [NEW] VM crash when process broadcast MCE
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 43b71295bfaae02f7e889f96bfba8dfb203fc9c5
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
Reply-To: Bug 1921082 <1921082@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

When i do memory SRAR test for VM, I meet the following issue:

My VM has 16 vCPU, I will inject one UE error to memory which is accessed b=
y VM, Then host MCE is raised and SIGBUS is send to VM, and qemu take contr=
ol.
Qemu will check the broadcast attribute by following  cpu_x86_support_mca_b=
roadcast();  =


Then Qemu may inject MCE to all vCPU, as vCPU is just one process for
HOST, we can't guarantee all the vCPUs will enter MCE hander in 1S sync
time, and the VM may panic.

This issue will be easily fixed by expand monarch_timeout configuration,
but the exact monarch_timeout can't be easily got, as it will depand on
the num of vCPUs and current system schedule status.

I am wondering why VM need broadcast attribute for MCE, When qeme
process MCE event form host, it will always be signaled for one vCPU? If
so, why does qemu need boradcast the MCE event to all vCPUs?

Can weu just deliver LMCE to one specifc vCPU and make this behavior
default?

If anything wrong, Please point out.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921082

Title:
  VM crash when process broadcast MCE

Status in QEMU:
  New

Bug description:
  When i do memory SRAR test for VM, I meet the following issue:

  My VM has 16 vCPU, I will inject one UE error to memory which is accessed=
 by VM, Then host MCE is raised and SIGBUS is send to VM, and qemu take con=
trol.
  Qemu will check the broadcast attribute by following  cpu_x86_support_mca=
_broadcast();  =


  Then Qemu may inject MCE to all vCPU, as vCPU is just one process for
  HOST, we can't guarantee all the vCPUs will enter MCE hander in 1S
  sync time, and the VM may panic.

  This issue will be easily fixed by expand monarch_timeout
  configuration, but the exact monarch_timeout can't be easily got, as
  it will depand on the num of vCPUs and current system schedule status.

  I am wondering why VM need broadcast attribute for MCE, When qeme
  process MCE event form host, it will always be signaled for one vCPU?
  If so, why does qemu need boradcast the MCE event to all vCPUs?

  Can weu just deliver LMCE to one specifc vCPU and make this behavior
  default?

  If anything wrong, Please point out.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921082/+subscriptions


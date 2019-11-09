Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D19F5FE0
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Nov 2019 16:17:05 +0100 (CET)
Received: from localhost ([::1]:37224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iTSU4-0001wQ-KU
	for lists+qemu-devel@lfdr.de; Sat, 09 Nov 2019 10:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iTSSf-0001SO-IH
 for qemu-devel@nongnu.org; Sat, 09 Nov 2019 10:15:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iTSSd-00082b-TB
 for qemu-devel@nongnu.org; Sat, 09 Nov 2019 10:15:37 -0500
Received: from indium.canonical.com ([91.189.90.7]:41288)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iTSSd-00080q-NN
 for qemu-devel@nongnu.org; Sat, 09 Nov 2019 10:15:35 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iTSSc-0000pD-2J
 for <qemu-devel@nongnu.org>; Sat, 09 Nov 2019 15:15:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 086D42E8005
 for <qemu-devel@nongnu.org>; Sat,  9 Nov 2019 15:15:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Nov 2019 15:06:09 -0000
From: tm <1851939@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: riscv
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: tm42
X-Launchpad-Bug-Reporter: tm (tm42)
X-Launchpad-Bug-Modifier: tm (tm42)
Message-Id: <157331196915.22967.16737072842793038356.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1851939] [NEW] RISC-V mstatus TSR bit not correctly implemented
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5aa4722c46a3ff33cf220c72002fb7f9dfc7801f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1851939 <1851939@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi,

since qemu 4.1.0 the TSR bit in mstatus register is supported. But it
does not allow for executing sret in m-mode.

>From the RISC-V specifications:
"When TSR=3D1, attempts to execute SRET while executing in S-mode will rais=
e an illegal instruction
exception. When TSR=3D0, this operation is permitted in S-mode."

This means an exception should only be raised when executing in S-mode, but=
 not in M-mode, hence you should change the condition in helper_sret (targe=
t/riscv/op_helper.c) from:
     if (env->priv_ver >=3D PRIV_VERSION_1_10_0 &&
          get_field(env->mstatus, MSTATUS_TSR))
to:
     if (env->priv_ver >=3D PRIV_VERSION_1_10_0 &&
          get_field(env->mstatus, MSTATUS_TSR) && !(env->priv >=3D PRV_M))

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: riscv

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1851939

Title:
  RISC-V mstatus TSR bit not correctly implemented

Status in QEMU:
  New

Bug description:
  Hi,

  since qemu 4.1.0 the TSR bit in mstatus register is supported. But it
  does not allow for executing sret in m-mode.

  From the RISC-V specifications:
  "When TSR=3D1, attempts to execute SRET while executing in S-mode will ra=
ise an illegal instruction
  exception. When TSR=3D0, this operation is permitted in S-mode."

  This means an exception should only be raised when executing in S-mode, b=
ut not in M-mode, hence you should change the condition in helper_sret (tar=
get/riscv/op_helper.c) from:
       if (env->priv_ver >=3D PRIV_VERSION_1_10_0 &&
            get_field(env->mstatus, MSTATUS_TSR))
  to:
       if (env->priv_ver >=3D PRIV_VERSION_1_10_0 &&
            get_field(env->mstatus, MSTATUS_TSR) && !(env->priv >=3D PRV_M))

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1851939/+subscriptions


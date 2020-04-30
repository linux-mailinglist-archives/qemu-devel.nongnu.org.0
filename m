Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171441BFD7E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 16:13:18 +0200 (CEST)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU9wD-0004IB-0i
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 10:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU9b6-0003sk-56
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:51:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU9b5-0001hG-JW
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:51:27 -0400
Received: from indium.canonical.com ([91.189.90.7]:36532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jU9b5-0000v2-1x
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:51:27 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jU9aq-0007oP-9V
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:51:12 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 42A672E802D
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:51:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2020 13:37:33 -0000
From: Laurent Vivier <Laurent@vivier.eu>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: riscv
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier tm42
X-Launchpad-Bug-Reporter: tm (tm42)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <157331196915.22967.16737072842793038356.malonedeb@chaenomeles.canonical.com>
Message-Id: <158825385367.3631.15208170450377096980.malone@chaenomeles.canonical.com>
Subject: [Bug 1851939] Re: RISC-V mstatus TSR bit not correctly implemented
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 640eca23ed899d822f8a9d2bf6c9c1798634d6b0
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 09:35:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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

Fixed here:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Ded5abf46b3c4


** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1851939

Title:
  RISC-V mstatus TSR bit not correctly implemented

Status in QEMU:
  Fix Released

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


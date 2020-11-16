Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B453C2B4FEB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:38:04 +0100 (CET)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejO7-0000pj-Of
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kej7j-0007w3-JZ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:21:09 -0500
Received: from indium.canonical.com ([91.189.90.7]:41934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kej7h-0002t9-6t
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:21:07 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kej7d-0001F3-GM
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 18:21:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A3E682E817C
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 18:20:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2020 18:14:11 -0000
From: Thomas Huth <1759333@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Triaged; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hvf x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fbn7331 roolebo th-huth
X-Launchpad-Bug-Reporter: Fa Bi (fbn7331)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152217002978.21179.18362367542097684091.malonedeb@wampee.canonical.com>
Message-Id: <160555045328.26926.10901841438006172442.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1759333] Re: Illegal Instruction with HVF when encountering SSE
 instructions in the emulator
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: f5e82bdfe4245d02dae59bfab2f87c2cfa9f7d1b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:11:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1759333 <1759333@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> Triaged

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1759333

Title:
  Illegal Instruction with HVF when encountering SSE instructions in the
  emulator

Status in QEMU:
  Triaged

Bug description:
  The latest version of QEMU doesn't seem to support emulated SSE instructi=
ons with HVF acceleration on macOS.
  The decoder will treat SSE instructions as invalid, get the instruction s=
izes wrong and quickly crash the guest OS because of illegal instructions.
  After having a quick look at target/i386/hvf/x86_decode.c, it seems that =
SSE instruction emulation isn't implemented in the current version of the x=
86 emulator.

  A way to reproduce the issue is to run a macOS 10.13 guest with HVF
  acceleration enabled, this will crash in the guest once it's loading
  up the GUI (and also print a "Unimplemented handler" warning from
  target/i386/hvf/x86_emu.c).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1759333/+subscriptions


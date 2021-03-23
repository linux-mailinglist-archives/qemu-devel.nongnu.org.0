Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982FB346BFB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:17:38 +0100 (CET)
Received: from localhost ([::1]:52640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpLF-00082a-Bk
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOpEx-0007t0-Ic
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:11:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:42308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOpEv-0000r1-JW
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:11:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lOpEt-0001mz-F3
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 22:11:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5FF022E8163
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 22:11:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Mar 2021 22:02:14 -0000
From: Alistair Francis <1915027@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 superleaf1995
X-Launchpad-Bug-Reporter: superleaf1995 (superleaf1995)
X-Launchpad-Bug-Modifier: Alistair Francis (alistair2323)
References: <161279694044.12775.4779161531525908683.malonedeb@soybean.canonical.com>
Message-Id: <161653693429.20106.15224677154013166487.malone@wampee.canonical.com>
Subject: [Bug 1915027] Re: RISC-V 64, CPUs do ilegal 0x00 write with SMP
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 4f3662e7d054eda31beb08ed17b288d10fbee8ca
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
Reply-To: Bug 1915027 <1915027@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even with -smp 1 you will see the same errors. The problem is because
there is nothing to run after OpenSBI jumps to the next stage.

If you load a kernel you will not see the error messages.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915027

Title:
  RISC-V 64, CPUs do ilegal 0x00 write with SMP

Status in QEMU:
  Invalid

Bug description:
  When QEMU is runt like this:

  qemu-system-riscv64 -d unimp,guest_errors -smp 8

  Other harts will do a illegal write on address 0x00.

  This could be mostly (i think) because the initial assembly code is
  only loaded on the first hart and the others do a mess because there
  is no code to execute.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915027/+subscriptions


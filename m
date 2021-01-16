Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE42F8B46
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 05:35:59 +0100 (CET)
Received: from localhost ([::1]:47082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0dJe-000716-K0
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 23:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0dAS-0007vC-8i
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 23:26:28 -0500
Received: from indium.canonical.com ([91.189.90.7]:47574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0dAQ-0006D1-6u
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 23:26:28 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0dAM-0002EQ-Na
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:26:22 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6A2FA2E815B
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:26:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 Jan 2021 04:17:50 -0000
From: Launchpad Bug Tracker <1699867@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anatol janitor th-huth
X-Launchpad-Bug-Reporter: Anatol Pomozov (anatol)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <149815632727.3205.9408286229805240743.malonedeb@chaenomeles.canonical.com>
Message-Id: <161077067036.27726.4164130919986705958.malone@loganberry.canonical.com>
Subject: [Bug 1699867] Re: x86_64 qemu crashes at far call into long-mode
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 543d2c3c278dac69c2f18b4f94e5833be1d703cf
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
Reply-To: Bug 1699867 <1699867@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1699867

Title:
  x86_64 qemu crashes at far call into long-mode

Status in QEMU:
  Expired

Bug description:
  I am experimenting with this OS https://github.com/phil-opp/blog_os
  and spotted a weird behavior with qemu.

  I am looking at code that does transition from 32bit mode to 64bit
  mode. Right now it does 'jmp $SELECTOR,64bitfunction'.
  https://github.com/phil-
  opp/blog_os/blob/557c6a58ea11e31685b9d014d307002d64df5c22/src/arch/x86_64=
/boot.asm#L32

  This code works fine with qemu/kvm/vmware.

  To transition from 32 to 64 bit code it is possible to use 'call'
  operation. So I am trying to replace that code with 'call
  $SELECTOR,64bitfunction'. It works fine with kvm and wmware. But it
  fails with Qemu emulation. See the interrup debug log attached. qemu
  crashes at 10302c (far call mnemonic).

  =

    103016:       e8 18 00 00 00          callq  103033 <set_up_page_tables>
    10301b:       e8 5c 00 00 00          callq  10307c <enable_paging>
    103020:       e8 ec 00 00 00          callq  103111 <set_up_SSE>
    103025:       0f 01 15 28 00 10 00    lgdt   0x100028(%rip)        # 20=
3054 <GCC_except_table2+0xdb5f8>
    10302c:       9a                      (bad)  =

    10302d:       40 31 10                rex xor %edx,(%rax)
    103030:       00 08                   add    %cl,(%rax)

  =

  As the code works at hardware I expect it to work with qemu. Thus current=
 qemu behavior looks like a bug.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1699867/+subscriptions


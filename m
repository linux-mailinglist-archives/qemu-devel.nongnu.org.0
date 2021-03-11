Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F16337CFB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:55:44 +0100 (CET)
Received: from localhost ([::1]:58418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQTH-000884-EP
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lKQOR-0003xl-Nj
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:50:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:53256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lKQON-0007iP-Rp
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:50:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lKQOL-0000YE-5N
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 18:50:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 26DB32E815A
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 18:50:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Mar 2021 18:45:24 -0000
From: Peter Maydell <1918149@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: galli-leo
X-Launchpad-Bug-Reporter: Leonardo (galli-leo)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <161521552307.29654.2972591810140156041.malonedeb@wampee.canonical.com>
Message-Id: <161548832475.16419.6507070775603900329.launchpad@wampee.canonical.com>
Subject: [Bug 1918149] Re: qemu-user reports wrong fault_addr in signal handler
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d4fcb062545ed29d3cd7773e52e43615e042623f"; Instance="production"
X-Launchpad-Hash: 3f631ffb65ad1d47465e1d631840b89e3c45f2b8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1918149 <1918149@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: linux-user

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1918149

Title:
  qemu-user reports wrong fault_addr in signal handler

Status in QEMU:
  New

Bug description:
  When a SEGV signal occurs and si_addr of the info struct is nil, qemu
  still tries to translate the address from host to guest
  (handle_cpu_signal in accel/tcg/user-exec.c). This means, that the
  actual signal handler, will receive a fault_addr that is something
  like 0xffffffffbf709000.

  I was able to get this to happen, by branching to a non canonical address=
 on aarch64.
  I used 5.2 (commit: 553032db17). However, building from source, this only=
 seems to happen, if I use the same configure flags as the debian build:

  ../configure --static --target-list=3Daarch64-linux-user --disable-
  system --enable-trace-backends=3Dsimple --disable-linux-io-uring
  --disable-pie --extra-cflags=3D"-fstack-protector-strong -Wformat
  -Werror=3Dformat-security -Wdate-time -D_FORTIFY_SOURCE=3D2"  --extra-
  ldflags=3D"-Wl,-z,relro -Wl,--as-needed"

  Let me know, if you need more details.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1918149/+subscriptions


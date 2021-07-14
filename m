Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05B23C7D90
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 06:31:31 +0200 (CEST)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3WYU-00023T-Qq
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 00:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3WUe-0004BK-K3
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:27:32 -0400
Received: from indium.canonical.com ([91.189.90.7]:52090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3WUd-0003n6-2j
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 00:27:32 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3WUZ-00070M-NO
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:27:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 320E02E854E
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:26:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Jul 2021 04:17:21 -0000
From: Launchpad Bug Tracker <1918149@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: galli-leo janitor th-huth
X-Launchpad-Bug-Reporter: Leonardo (galli-leo)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161521552307.29654.2972591810140156041.malonedeb@wampee.canonical.com>
Message-Id: <162623624174.32682.11832246798693352029.malone@loganberry.canonical.com>
Subject: [Bug 1918149] Re: qemu-user reports wrong fault_addr in signal handler
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="48411ad9fd448ca55fc57f9555fc375624a85324"; Instance="production"
X-Launchpad-Hash: 5b83301d732dc3247bfed622e648e7fdbe216884
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1918149

Title:
  qemu-user reports wrong fault_addr in signal handler

Status in QEMU:
  Expired

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



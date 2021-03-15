Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5028833C8B8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 22:48:15 +0100 (CET)
Received: from localhost ([::1]:42828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLv4Q-0005oD-Bm
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 17:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lLv1z-0004gn-6j
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:45:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:59926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lLv1v-0005lT-Gj
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:45:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lLv1t-0002OK-3T
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 21:45:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 17DB92E8157
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 21:45:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Mar 2021 21:36:36 -0000
From: Apteryx <1919253@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: maxco
X-Launchpad-Bug-Reporter: Apteryx (maxco)
X-Launchpad-Bug-Modifier: Apteryx (maxco)
Message-Id: <161584419612.2428.15389834064757426371.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1919253] [NEW] QEMU doesn't build reproducibly anymore in 5.2.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d4fcb062545ed29d3cd7773e52e43615e042623f"; Instance="production"
X-Launchpad-Hash: 11cb74f3a5694fae6fd44e265081a44bee51479b
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
Reply-To: Bug 1919253 <1919253@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

It used to be that building QEMU 5.1.0 twice in a row, using Guix, would
result in bit-for-bit identical results.

Starting with 5.2.0, this is no longer true.  Here's a summary of which
files have non-determinism:

Here's a summary of the differing files:

$ diff -r /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0{,-check}
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-aarch64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-aarch64 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-aarch64_be and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-che=
ck/bin/qemu-aarch64_be differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-alpha and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-alpha differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-arm and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin/=
qemu-arm differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-armeb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-armeb differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-cris and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin=
/qemu-cris differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-edid and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin=
/qemu-edid differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-ga and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin/q=
emu-ga differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-hppa and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin=
/qemu-hppa differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-i386 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin=
/qemu-i386 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-img and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin/=
qemu-img differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-io and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin/q=
emu-io differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-keymap and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-keymap differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-m68k and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin=
/qemu-m68k differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-microblaze and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-che=
ck/bin/qemu-microblaze differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-microblazeel and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-microblazeel differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-mips and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin=
/qemu-mips differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-mips64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-mips64 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-mips64el and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/bin/qemu-mips64el differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-mipsel and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-mipsel differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-mipsn32 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-mipsn32 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-mipsn32el and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-mipsn32el differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-nbd and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin/=
qemu-nbd differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-nios2 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-nios2 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-or1k and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin=
/qemu-or1k differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-ppc and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin/=
qemu-ppc differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-ppc64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-ppc64 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-ppc64le and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-ppc64le differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-pr-helper and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-pr-helper differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-riscv32 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-riscv32 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-riscv64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-riscv64 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-s390x and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-s390x differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-sh4 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin/=
qemu-sh4 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-sh4eb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-sh4eb differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-sparc and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-sparc differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-sparc32plus and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-sparc32plus differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-sparc64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-sparc64 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-storage-daemon and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-storage-daemon differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-aarch64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-aarch64 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-alpha and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-alpha differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-arm and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-che=
ck/bin/qemu-system-arm differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-avr and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-che=
ck/bin/qemu-system-avr differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-cris and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-system-cris differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-hppa and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-system-hppa differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-i386 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-system-i386 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-m68k and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-system-m68k differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-microblaze and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.=
2.0-check/bin/qemu-system-microblaze differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-microblazeel and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-=
5.2.0-check/bin/qemu-system-microblazeel differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-mips and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-system-mips differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-mips64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-mips64 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-mips64el and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.=
0-check/bin/qemu-system-mips64el differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-mipsel and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-mipsel differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-moxie and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-moxie differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-nios2 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-nios2 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-or1k and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-system-or1k differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-ppc and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-che=
ck/bin/qemu-system-ppc differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-ppc64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-ppc64 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-riscv32 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-riscv32 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-riscv64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-riscv64 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-rx and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-system-rx differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-s390x and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-s390x differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-sh4 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-che=
ck/bin/qemu-system-sh4 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-sh4eb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-sh4eb differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-sparc and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-sparc differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-sparc64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-sparc64 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-tricore and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-tricore differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-x86_64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-x86_64 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-xtensa and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-xtensa differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-system-xtensaeb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.=
0-check/bin/qemu-system-xtensaeb differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-x86_64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-x86_64 differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-xtensa and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-xtensa differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/qem=
u-xtensaeb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/bin/qemu-xtensaeb differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/libexec=
/qemu-bridge-helper and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.=
2.0-check/libexec/qemu-bridge-helper differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/libexec=
/vhost-user-gpu and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/libexec/vhost-user-gpu differ
Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/libexec=
/virtiofsd and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/libexec/virtiofsd differ

Attached is a sample log of diffoscope for the qemu-aarch64 binary.

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "xz compressed diffoscope output"
   https://bugs.launchpad.net/bugs/1919253/+attachment/5476911/+files/qemu-=
5.2.0-qemu-aarch64.diffoscope.log.xz

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1919253

Title:
  QEMU doesn't build reproducibly anymore in 5.2.0

Status in QEMU:
  New

Bug description:
  It used to be that building QEMU 5.1.0 twice in a row, using Guix,
  would result in bit-for-bit identical results.

  Starting with 5.2.0, this is no longer true.  Here's a summary of
  which files have non-determinism:

  Here's a summary of the differing files:

  $ diff -r /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0{,-check}
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-aarch64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-aarch64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-aarch64_be and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-aarch64_be differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-alpha and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-alpha differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-arm and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-arm differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-armeb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-armeb differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-cris and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-cris differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-edid and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-edid differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-ga and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin=
/qemu-ga differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-hppa and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-hppa differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-i386 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-i386 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-img and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-img differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-io and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bin=
/qemu-io differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-keymap and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/bin/qemu-keymap differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-m68k and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-m68k differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-microblaze and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-microblaze differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-microblazeel and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-microblazeel differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-mips and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-mips differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-mips64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/bin/qemu-mips64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-mips64el and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-che=
ck/bin/qemu-mips64el differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-mipsel and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/bin/qemu-mipsel differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-mipsn32 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-mipsn32 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-mipsn32el and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-mipsn32el differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-nbd and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-nbd differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-nios2 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-nios2 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-or1k and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/b=
in/qemu-or1k differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-ppc and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-ppc differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-ppc64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-ppc64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-ppc64le and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-ppc64le differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-pr-helper and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-pr-helper differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-riscv32 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-riscv32 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-riscv64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-riscv64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-s390x and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-s390x differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-sh4 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/bi=
n/qemu-sh4 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-sh4eb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-sh4eb differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-sparc and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check/=
bin/qemu-sparc differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-sparc32plus and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-sparc32plus differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-sparc64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-chec=
k/bin/qemu-sparc64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-storage-daemon and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2=
.0-check/bin/qemu-storage-daemon differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-aarch64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2=
.0-check/bin/qemu-system-aarch64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-alpha and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-alpha differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-arm and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-arm differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-avr and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-avr differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-cris and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-cris differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-hppa and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-hppa differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-i386 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-i386 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-m68k and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-m68k differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-microblaze and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-=
5.2.0-check/bin/qemu-system-microblaze differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-microblazeel and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qem=
u-5.2.0-check/bin/qemu-system-microblazeel differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-mips and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-mips differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-mips64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.=
0-check/bin/qemu-system-mips64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-mips64el and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.=
2.0-check/bin/qemu-system-mips64el differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-mipsel and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.=
0-check/bin/qemu-system-mipsel differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-moxie and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-moxie differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-nios2 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-nios2 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-or1k and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-=
check/bin/qemu-system-or1k differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-ppc and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-ppc differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-ppc64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-ppc64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-riscv32 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2=
.0-check/bin/qemu-system-riscv32 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-riscv64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2=
.0-check/bin/qemu-system-riscv64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-rx and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-ch=
eck/bin/qemu-system-rx differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-s390x and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-s390x differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-sh4 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-c=
heck/bin/qemu-system-sh4 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-sh4eb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-sh4eb differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-sparc and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0=
-check/bin/qemu-system-sparc differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-sparc64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2=
.0-check/bin/qemu-system-sparc64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-tricore and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2=
.0-check/bin/qemu-system-tricore differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-x86_64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.=
0-check/bin/qemu-system-x86_64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-xtensa and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.=
0-check/bin/qemu-system-xtensa differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-system-xtensaeb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.=
2.0-check/bin/qemu-system-xtensaeb differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-x86_64 and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/bin/qemu-x86_64 differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-xtensa and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-check=
/bin/qemu-xtensa differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/bin/q=
emu-xtensaeb and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-che=
ck/bin/qemu-xtensaeb differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/libex=
ec/qemu-bridge-helper and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-=
5.2.0-check/libexec/qemu-bridge-helper differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/libex=
ec/vhost-user-gpu and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.=
0-check/libexec/vhost-user-gpu differ
  Binary files /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0/libex=
ec/virtiofsd and /gnu/store/l286mbanw78qgbn54gs5j23qm0v9abhw-qemu-5.2.0-che=
ck/libexec/virtiofsd differ

  Attached is a sample log of diffoscope for the qemu-aarch64 binary.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1919253/+subscriptions


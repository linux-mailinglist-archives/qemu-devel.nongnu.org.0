Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644AF2DAE57
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 14:55:22 +0100 (CET)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpAnR-0006z7-GU
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 08:55:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpAjk-0003Tt-Gz
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:51:33 -0500
Received: from indium.canonical.com ([91.189.90.7]:42716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpAji-0008Fp-7C
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:51:32 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kpAje-0002Ob-Vl
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 13:51:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CB0162E813C
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 13:51:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Dec 2020 13:43:52 -0000
From: Qiuhao Li <1890333@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr qiuhao th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Qiuhao Li (qiuhao)
References: <159656782458.2385.15174533675764579105.malonedeb@gac.canonical.com>
Message-Id: <160803983261.6033.15194685908875344875.malone@gac.canonical.com>
Subject: [Bug 1890333] Re: [OSS-Fuzz] Issue 26797:
 qemu:qemu-fuzz-i386-target-generic-fuzz-virtio-blk: ASSERT: addr < cache->len
 && 2 <= cache->len - addr
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: a2de2e6b82c038d3ddc2b5624add5cc5ce517be2
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
Reply-To: Bug 1890333 <1890333@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

It seems while the minimized producer doesn't fail the assertion now,
the original reproducer provided by OSS-Fuzz[1] can still crash the
latest QEMU (1758428, Dec 12, built with --enable-sanitizers --enable-
fuzzing). Could anyone check if they trigger different bugs?

Tested on:
  Ubuntu: 20.04.1 5.4.0-58-generic x86_64
  clang: 10.0.0-4ubuntu1
  glibc: 2.31-0ubuntu9.1
  libglib2.0-dev: 2.64.3-1~ubuntu20.04.1

[1] https://bugs.launchpad.net/qemu/+bug/1890333/comments/1

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890333

Title:
  [OSS-Fuzz]  Issue 26797: qemu:qemu-fuzz-i386-target-generic-fuzz-
  virtio-blk: ASSERT: addr < cache->len && 2 <=3D cache->len - addr

Status in QEMU:
  Fix Released

Bug description:
  Hello,
  Reproducer:
  cat << EOF | ./i386-softmmu/qemu-system-i386 \
  -drive id=3Dmydrive,file=3Dnull-co://,size=3D2M,format=3Draw,if=3Dnone \
  -device virtio-blk,drive=3Dmydrive \
  -nodefaults -qtest stdio -nographic
  outl 0xcf8 0x80001001
  outl 0xcfc 0x6574c1ff
  outl 0xcf8 0x8000100e
  outl 0xcfc 0xefe5e1e
  outl 0xe86 0x3aff9090
  outl 0xe84 0x3aff9090
  outl 0xe8e 0xe
  EOF

  qemu-system-i386: /home/alxndr/Development/qemu/general-fuzz/include/exec=
/memory_ldst_cached.inc.h:88: void address_space_stw_le_cached(MemoryRegion=
Cache *, hwaddr, uint32_t, MemTxAttrs, MemTxResult *): Assertion `addr < ca=
che->len && 2 <=3D cache->len - addr' failed.
  Aborted

  I can trigger similar assertions with other VIRTIO devices, as-well.
  I reported this at some point in Message-ID: <20200511033001.dzvtbdhl3oz5=
pgiy@mozz.bu.edu> but never created a Launchpad issue...
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890333/+subscriptions


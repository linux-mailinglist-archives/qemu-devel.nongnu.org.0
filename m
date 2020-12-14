Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364D82D9803
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 13:32:51 +0100 (CET)
Received: from localhost ([::1]:41836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kon22-0004FG-Af
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 07:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kon0I-0002mm-Du
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 07:31:06 -0500
Received: from indium.canonical.com ([91.189.90.7]:50774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kon0E-0000uf-3v
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 07:31:02 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kon0C-0002TJ-Ah
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:30:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4FF072E813C
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:30:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Dec 2020 12:17:27 -0000
From: Qiuhao Li <1908062@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: qiuhao
X-Launchpad-Bug-Reporter: Qiuhao Li (qiuhao)
X-Launchpad-Bug-Modifier: Qiuhao Li (qiuhao)
Message-Id: <160794824793.5567.9855788232054277622.malonedeb@gac.canonical.com>
Subject: [Bug 1908062] [NEW] qemu-system-i386 virtio-vga: Assertion in
 address_space_stw_le_cached failed again
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 4c2aecba34cec0f3d8fc22b0d6f1efeb661dcd93
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
Reply-To: Bug 1908062 <1908062@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

When I was fuzzing virtio-vga device of the latest QEMU (1758428, Dec
12, built with --enable-sanitizers --enable-fuzzing), an assertion
failed in include/exec/memory_ldst_cached.h.inc.

--[ Reproducer

cat << EOF | ./build/i386-softmmu/qemu-system-i386 -machine accel=3Dqtest \
-machine q35 -display none -nodefaults -device virtio-vga -qtest stdio
outl 0xcf8 0x8000081c
outb 0xcfc 0xc3
outl 0xcf8 0x80000804
outb 0xcfc 0x06
write 0xc300001024 0x2 0x0040
write 0xc300001028 0x1 0x5a
write 0xc30000101c 0x1 0x01
writel 0xc30000100c 0x20000000
write 0xc300001016 0x3 0x80a080
write 0xc300003002 0x1 0x80
write 0x5c 0x1 0x10
EOF

--[ Output

=3D=3D35337=3D=3DWARNING: ASan doesn't fully support makecontext/swapcontex=
t functions and may produce false positives in some cases!
[I 1607946348.442865] OPENED
[R +0.059305] outl 0xcf8 0x8000081c
OK
[S +0.059326] OK
[R +0.059338] outb 0xcfc 0xc3
OK
[S +0.059355] OK
[R +0.059363] outl 0xcf8 0x80000804
OK
[S +0.059369] OK
[R +0.059381] outb 0xcfc 0x06
OK
[S +0.061094] OK
[R +0.061107] write 0xc300001024 0x2 0x0040
OK
[S +0.061120] OK
[R +0.061127] write 0xc300001028 0x1 0x5a
OK
[S +0.061135] OK
[R +0.061142] write 0xc30000101c 0x1 0x01
OK
[S +0.061158] OK
[R +0.061167] writel 0xc30000100c 0x20000000
OK
[S +0.061212] OK
[R +0.061222] write 0xc300001016 0x3 0x80a080
OK
[S +0.061231] OK
[R +0.061238] write 0xc300003002 0x1 0x80
OK
[S +0.061247] OK
[R +0.061253] write 0x5c 0x1 0x10
OK
[S +0.061403] OK
qemu-system-i386: /home/qiuhao/hack/qemu/include/exec/memory_ldst_cached.h.=
inc:88: void address_space_stw_le_cached(MemoryRegionCache *, hwaddr, uint3=
2_t, MemTxAttrs, MemTxResult *): Assertion `addr < cache->len && 2 <=3D cac=
he->len - addr' failed.

--[ Environment

Ubuntu 20.04.1 5.4.0-58-generic x86_64
clang: 10.0.0-4ubuntu1
glibc: 2.31-0ubuntu9.1
libglib2.0-dev: 2.64.3-1~ubuntu20.04.1

--[ Note

Alexander Bulekov found the same assertion failure on 2020-08-04,
https://bugs.launchpad.net/qemu/+bug/1890333, and it had been fixed in
commit 2d69eba5fe52045b2c8b0d04fd3806414352afc1.

Fam Zheng found the same assertion failure on 2018-09-29,
https://bugs.launchpad.net/qemu/+bug/1795148, and it had been fixed in
commit db812c4073c77c8a64db8d6663b3416a587c7b4a.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908062

Title:
  qemu-system-i386 virtio-vga: Assertion in address_space_stw_le_cached
  failed again

Status in QEMU:
  New

Bug description:
  When I was fuzzing virtio-vga device of the latest QEMU (1758428, Dec
  12, built with --enable-sanitizers --enable-fuzzing), an assertion
  failed in include/exec/memory_ldst_cached.h.inc.

  --[ Reproducer

  cat << EOF | ./build/i386-softmmu/qemu-system-i386 -machine accel=3Dqtest=
 \
  -machine q35 -display none -nodefaults -device virtio-vga -qtest stdio
  outl 0xcf8 0x8000081c
  outb 0xcfc 0xc3
  outl 0xcf8 0x80000804
  outb 0xcfc 0x06
  write 0xc300001024 0x2 0x0040
  write 0xc300001028 0x1 0x5a
  write 0xc30000101c 0x1 0x01
  writel 0xc30000100c 0x20000000
  write 0xc300001016 0x3 0x80a080
  write 0xc300003002 0x1 0x80
  write 0x5c 0x1 0x10
  EOF

  --[ Output

  =3D=3D35337=3D=3DWARNING: ASan doesn't fully support makecontext/swapcont=
ext functions and may produce false positives in some cases!
  [I 1607946348.442865] OPENED
  [R +0.059305] outl 0xcf8 0x8000081c
  OK
  [S +0.059326] OK
  [R +0.059338] outb 0xcfc 0xc3
  OK
  [S +0.059355] OK
  [R +0.059363] outl 0xcf8 0x80000804
  OK
  [S +0.059369] OK
  [R +0.059381] outb 0xcfc 0x06
  OK
  [S +0.061094] OK
  [R +0.061107] write 0xc300001024 0x2 0x0040
  OK
  [S +0.061120] OK
  [R +0.061127] write 0xc300001028 0x1 0x5a
  OK
  [S +0.061135] OK
  [R +0.061142] write 0xc30000101c 0x1 0x01
  OK
  [S +0.061158] OK
  [R +0.061167] writel 0xc30000100c 0x20000000
  OK
  [S +0.061212] OK
  [R +0.061222] write 0xc300001016 0x3 0x80a080
  OK
  [S +0.061231] OK
  [R +0.061238] write 0xc300003002 0x1 0x80
  OK
  [S +0.061247] OK
  [R +0.061253] write 0x5c 0x1 0x10
  OK
  [S +0.061403] OK
  qemu-system-i386: /home/qiuhao/hack/qemu/include/exec/memory_ldst_cached.=
h.inc:88: void address_space_stw_le_cached(MemoryRegionCache *, hwaddr, uin=
t32_t, MemTxAttrs, MemTxResult *): Assertion `addr < cache->len && 2 <=3D c=
ache->len - addr' failed.

  --[ Environment

  Ubuntu 20.04.1 5.4.0-58-generic x86_64
  clang: 10.0.0-4ubuntu1
  glibc: 2.31-0ubuntu9.1
  libglib2.0-dev: 2.64.3-1~ubuntu20.04.1

  --[ Note

  Alexander Bulekov found the same assertion failure on 2020-08-04,
  https://bugs.launchpad.net/qemu/+bug/1890333, and it had been fixed in
  commit 2d69eba5fe52045b2c8b0d04fd3806414352afc1.

  Fam Zheng found the same assertion failure on 2018-09-29,
  https://bugs.launchpad.net/qemu/+bug/1795148, and it had been fixed in
  commit db812c4073c77c8a64db8d6663b3416a587c7b4a.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908062/+subscriptions


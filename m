Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0151401B4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 03:13:52 +0100 (CET)
Received: from localhost ([::1]:51370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isH8x-00081f-FV
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 21:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49063)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1isH7R-0006nR-IC
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 21:12:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1isH7Q-0003GG-0i
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 21:12:17 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:35001 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1isH7P-0003DU-QS
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 21:12:15 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id C90371A20F6;
 Fri, 17 Jan 2020 03:12:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id AAFD01A207E;
 Fri, 17 Jan 2020 03:12:11 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] linux-user: Fix some issues in termbits.h files 
Date: Fri, 17 Jan 2020 03:11:53 +0100
Message-Id: <1579227117-6310-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent@vivier.eu, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This series is a spin-off of v5 of earlier series "linux-user: Misc
patches for 5.0", that became too large to manage. I will submit the
rest of that large series separately.

Files linux-user/<target>/termbits.h seem to be in a very bad shape:
unsynchronized with kernel, containing wrong elements expressed in
terms of host instead of target, many being updated wrt kernel
content at various times, and on top of that all contain visually
very ugly combinations of tabs and spaces.

This series attempts to fix great majority of issues in termbits.

Alpha's and mips' termbits.h were in the worst shape, missing large
bits and pieces, and for them as complete as possible synchronization
with kernel code is done - this constitutes the first two patches.

Xtensa's termbits.h contained the most elements wrongly expressed in
terms of host instead of target, and that is the reason the changes
in this file are placed in a separate, third, patch. Previous "R-B"
given by Max Filippov was transferred to this patch only.

The fourth patch fixes remaining elements wrongly expressed in
terms of host instead of target.

As an additional note, structures "serial_iso7816" and "serial_rs485"
(at times mentioned as the third argument of certain ioctls) are
platform-independant in kernel, and do not need "target_" variant
in QEMU. Also, structure "winsize" (also appearing as the third
ioctl's argument at times) is defined at multiple places in kernel
(for several architectures) in kernel, but all such definitions are
identical, and, therefore, it also does not need "target_" variant
in QEMU.

A checkpatch warning related to "#if 0" in patch 2 is benign, and
should be ignored.

Aleksandar Markovic (4):
  linux-user: alpha: Synchronize termbits.h with kernel
  linux-user: mips: Synchronize termbits.h with kernel
  linux-user: xtensa: Fix some constants in termbits.h
  linux-user: Fix some constants in remaining termbits.h

 linux-user/aarch64/termbits.h    |   4 +-
 linux-user/alpha/termbits.h      |  82 ++++++++++++++--
 linux-user/arm/termbits.h        |   4 +-
 linux-user/cris/termbits.h       |   4 +-
 linux-user/hppa/termbits.h       |   4 +-
 linux-user/i386/termbits.h       |   4 +-
 linux-user/m68k/termbits.h       |   4 +-
 linux-user/microblaze/termbits.h |   4 +-
 linux-user/mips/termbits.h       | 140 ++++++++++++++++----------
 linux-user/nios2/termbits.h      |   4 +-
 linux-user/openrisc/termbits.h   |  14 +--
 linux-user/ppc/termbits.h        |   4 +-
 linux-user/riscv/termbits.h      |   4 +-
 linux-user/s390x/termbits.h      |  26 ++---
 linux-user/sh4/termbits.h        |   4 +-
 linux-user/sparc/termbits.h      |   4 +-
 linux-user/sparc64/termbits.h    |   4 +-
 linux-user/tilegx/termbits.h     |  12 ++-
 linux-user/x86_64/termbits.h     |  26 +++--
 linux-user/xtensa/termbits.h     | 207 +++++++++++++++++++++------------------
 20 files changed, 353 insertions(+), 206 deletions(-)

-- 
2.7.4



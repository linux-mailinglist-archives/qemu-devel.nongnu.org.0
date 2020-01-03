Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB0312FEAD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 23:21:31 +0100 (CET)
Received: from localhost ([::1]:57328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inVJy-0000OD-C9
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 17:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1inVHp-0006yj-9J
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 17:19:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1inVHn-0007zU-Qr
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 17:19:16 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:53068 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1inVHn-0003ps-HZ
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 17:19:15 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 066EA1A21A7;
 Fri,  3 Jan 2020 23:18:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id E0FD11A1F94;
 Fri,  3 Jan 2020 23:18:09 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/12] linux-user: Misc patches for 5.0 
Date: Fri,  3 Jan 2020 23:17:50 +0100
Message-Id: <1578089882-3587-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

This series is a collection of patches I recently accumulated.

v2->v3:

  - added support for seven floppy-drive-related ioctls
  - added support for three kcov-related ioctls

v1->v2:

  - fixed a constant in xtensa's termbits.h that was missed in v1
  - redid syscall numbers for mips o32
  - minor formatting and wording changes

Aleksandar Markovic (12):
  linux-user: Fix some constants in termbits.h
  linux-user: mips: Update syscall numbers to kernel 5.5 rc3 level
  linux-user: Add support for FS_IOC_<GET|SET>VERSION ioctls
  linux-user: Add support for FS_IOC32_<GET|SET>FLAGS ioctls
  linux-user: Add support for FS_IOC32_<GET|SET>VERSION ioctls
  linux-user: Add support for FS_IOC_FS<GET|SET>XATTR ioctls
  linux-user: Add support for FD<SETEMSGTRESH|SETMAXERRS|GETMAXERRS>
    ioctls
  linux-user: Add support for FDFMT<BEG|TRK|END> ioctls
  linux-user: Add support for FDGETFDCSTAT ioctl
  configure: Detect kcov support and introduce CONFIG_KCOV
  linux-user: Add support for KCOV_<ENABLE|DISABLE> ioctls
  linux-user: Add support for KCOV_INIT_TRACE ioctl

 configure                        |  21 ++++++
 linux-user/aarch64/termbits.h    |   4 +-
 linux-user/alpha/termbits.h      |  10 +--
 linux-user/arm/termbits.h        |   4 +-
 linux-user/cris/termbits.h       |   4 +-
 linux-user/hppa/termbits.h       |   4 +-
 linux-user/i386/termbits.h       |   4 +-
 linux-user/ioctls.h              |  27 +++++++
 linux-user/m68k/termbits.h       |   4 +-
 linux-user/microblaze/termbits.h |   4 +-
 linux-user/mips/cpu_loop.c       |  69 +++++++++++++++++
 linux-user/mips/syscall_nr.h     |  45 +++++++++++
 linux-user/mips/termbits.h       |   4 +-
 linux-user/mips64/syscall_nr.h   |  13 ++++
 linux-user/nios2/termbits.h      |   4 +-
 linux-user/openrisc/termbits.h   |   6 +-
 linux-user/ppc/termbits.h        |   4 +-
 linux-user/riscv/termbits.h      |   4 +-
 linux-user/s390x/termbits.h      |  26 ++++---
 linux-user/sh4/termbits.h        |   4 +-
 linux-user/sparc/termbits.h      |   4 +-
 linux-user/sparc64/termbits.h    |   4 +-
 linux-user/syscall.c             |   3 +
 linux-user/syscall_defs.h        |  43 ++++++++++-
 linux-user/syscall_types.h       |  24 ++++++
 linux-user/x86_64/termbits.h     |   6 +-
 linux-user/xtensa/termbits.h     | 156 ++++++++++++++++++++++-----------------
 27 files changed, 383 insertions(+), 122 deletions(-)

-- 
2.7.4



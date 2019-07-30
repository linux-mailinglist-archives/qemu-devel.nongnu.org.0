Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB937B2B9
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 20:55:47 +0200 (CEST)
Received: from localhost ([::1]:35798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsXHm-0007ok-L4
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 14:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49977)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hsXGY-0006gD-M2
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 14:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hsXGX-0001AY-EY
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 14:54:30 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:35253 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hsXGX-0008SD-7l
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 14:54:29 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 7235D1A221D;
 Tue, 30 Jul 2019 20:53:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4175D1A2194;
 Tue, 30 Jul 2019 20:53:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 Jul 2019 20:53:12 +0200
Message-Id: <1564512798-25527-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v3 0/6] target/mips: Misc patches for
 4.2
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
Cc: arikalo@wavecomp.com, sw@weilnetz.de, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This series includes misc MIPS patches intended to be integrated after
4.1 release.

v2->v3:

  - corrected the patch on WatchHi to include "mi" field
  - corrected the patch on WatchHi to bump VMStateDescription version

v1->v2:

  - fixed checkpatch warnings
  - added four new patches on various topics

Aleksandar Markovic (2):
  tests/tcg: target/mips: Add optional printing of more detailed failure
    info
  tests/tcg: target/mips: Fix target configurations for MSA tests

Yongbok Kim (4):
  target/mips: Add support for DSPRAM
  target/mips: Amend CP0 WatchHi register implementation
  target/mips: Implement Global Invalidate TLB instruction
  target/mips: Add emulation of CRC32 instructions

 default-configs/mips-softmmu-common.mak            |   1 +
 disas/mips.c                                       |  10 +
 hw/mips/cps.c                                      |  28 +-
 hw/misc/Makefile.objs                              |   1 +
 hw/misc/mips_dspram.c                              | 153 ++++
 include/hw/mips/cps.h                              |   2 +
 include/hw/misc/mips_dspram.h                      |  46 ++
 target/mips/cpu.h                                  |  11 +-
 target/mips/helper.c                               |  24 +-
 target/mips/helper.h                               |   7 +
 target/mips/internal.h                             |   4 +-
 target/mips/machine.c                              |   6 +-
 target/mips/op_helper.c                            | 181 +++-
 target/mips/translate.c                            | 142 +++-
 target/mips/translate_init.inc.c                   |   2 +
 tests/tcg/mips/include/test_utils_128.h            |  23 +-
 .../mips/user/ase/msa/test_msa_compile_32r5eb.sh   | 917 +++++++++++++++++++++
 .../mips/user/ase/msa/test_msa_compile_32r5el.sh   | 917 +++++++++++++++++++++
 .../mips/user/ase/msa/test_msa_compile_32r6eb.sh   | 643 ---------------
 .../mips/user/ase/msa/test_msa_compile_32r6el.sh   | 643 ---------------
 tests/tcg/mips/user/ase/msa/test_msa_run_32r5eb.sh | 371 +++++++++
 tests/tcg/mips/user/ase/msa/test_msa_run_32r5el.sh | 371 +++++++++
 tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh | 371 ---------
 tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh | 371 ---------
 24 files changed, 3182 insertions(+), 2063 deletions(-)
 create mode 100644 hw/misc/mips_dspram.c
 create mode 100644 include/hw/misc/mips_dspram.h
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile_32r5eb.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile_32r5el.sh
 delete mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile_32r6eb.sh
 delete mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile_32r6el.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run_32r5eb.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run_32r5el.sh
 delete mode 100644 tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh
 delete mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh

-- 
2.7.4



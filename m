Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACEB5BA5B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 13:08:47 +0200 (CEST)
Received: from localhost ([::1]:57136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhuAu-0006VK-77
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 07:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41132)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hhu8D-0004sy-OI
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:05:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hhu8C-000762-Kg
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:05:57 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:48935 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hhu8C-000676-D9
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:05:56 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 3AD181A1FE0;
 Mon,  1 Jul 2019 13:04:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 200501A1E44;
 Mon,  1 Jul 2019 13:04:51 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org,
	arikalo@wavecomp.com
Date: Mon,  1 Jul 2019 13:04:33 +0200
Message-Id: <1561979080-26195-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 0/7] target/mips: Mips improvements for 4.1
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
Cc: amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

A collection of misc MIPS improvements that would be nice to be
integrated into 4.1.

Aleksandar Markovic (7):
  tcg/tests: target/mips: Amend MSA fixed point multiply tests
  tcg/tests: target/mips: Amend MSA integer multiply tests
  target/mips: Correct comments in msa_helper.c
  target/mips: Correct comments in translate.c
  tcg/tests: target/mips: Correct MSA test compilation and execution
    order
  target/mips: Unroll loops for MSA float max/min instructions
  target/mips: Correct helper for MSA FCLASS.<W|D> instructions

 target/mips/msa_helper.c                           | 244 ++++++++++-----
 target/mips/translate.c                            | 347 +++++++++++++--------
 tests/tcg/mips/include/wrappers_msa.h              |  16 +
 .../ase/msa/fixed-multiply/test_msa_madd_q_h.c     | 216 +++++++++++++
 .../ase/msa/fixed-multiply/test_msa_madd_q_w.c     | 216 +++++++++++++
 .../ase/msa/fixed-multiply/test_msa_maddr_q_h.c    | 216 +++++++++++++
 .../ase/msa/fixed-multiply/test_msa_maddr_q_w.c    | 216 +++++++++++++
 .../ase/msa/fixed-multiply/test_msa_msub_q_h.c     | 216 +++++++++++++
 .../ase/msa/fixed-multiply/test_msa_msub_q_w.c     | 216 +++++++++++++
 .../ase/msa/fixed-multiply/test_msa_msubr_q_h.c    | 216 +++++++++++++
 .../ase/msa/fixed-multiply/test_msa_msubr_q_w.c    | 216 +++++++++++++
 .../user/ase/msa/int-multiply/test_msa_maddv_b.c   | 224 ++++++-------
 .../user/ase/msa/int-multiply/test_msa_maddv_d.c   | 214 ++++++-------
 .../user/ase/msa/int-multiply/test_msa_maddv_h.c   | 224 ++++++-------
 .../user/ase/msa/int-multiply/test_msa_maddv_w.c   | 224 ++++++-------
 .../user/ase/msa/int-multiply/test_msa_msubv_b.c   | 224 ++++++-------
 .../user/ase/msa/int-multiply/test_msa_msubv_d.c   | 224 ++++++-------
 .../user/ase/msa/int-multiply/test_msa_msubv_h.c   | 224 ++++++-------
 .../user/ase/msa/int-multiply/test_msa_msubv_w.c   | 224 ++++++-------
 .../mips/user/ase/msa/test_msa_compile_32r6eb.sh   |  32 +-
 .../mips/user/ase/msa/test_msa_compile_32r6el.sh   |  32 +-
 .../mips/user/ase/msa/test_msa_compile_64r6eb.sh   |  32 +-
 .../mips/user/ase/msa/test_msa_compile_64r6el.sh   |  32 +-
 tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh |  16 +-
 tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh |  16 +-
 tests/tcg/mips/user/ase/msa/test_msa_run_64r6eb.sh |  16 +-
 tests/tcg/mips/user/ase/msa/test_msa_run_64r6el.sh |  16 +-
 27 files changed, 3165 insertions(+), 1144 deletions(-)
 create mode 100644 tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_madd_q_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_madd_q_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_maddr_q_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_maddr_q_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_msub_q_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_msub_q_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_msubr_q_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/fixed-multiply/test_msa_msubr_q_w.c

-- 
2.7.4



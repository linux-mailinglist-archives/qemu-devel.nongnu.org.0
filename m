Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E9C5CF1F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 14:07:16 +0200 (CEST)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiHZ3-00052m-87
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 08:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36003)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hiHKG-0001DA-6N
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:51:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hiHKE-0006u3-Ub
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:51:56 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:40745 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hiHKE-0005HV-Mp
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:51:54 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 5FB2B1A2183;
 Tue,  2 Jul 2019 13:50:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id A7CF61A219E;
 Tue,  2 Jul 2019 13:50:29 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org,
	arikalo@wavecomp.com
Date: Tue,  2 Jul 2019 13:50:06 +0200
Message-Id: <1562068213-11307-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v2 0/7] target/mips: Misc improvements for 4.1
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
  tcg/tests: target/mips: Correct MSA test compilation and execution
    order
  target/mips: Correct comments in translate.c
  target/mips: Correct comments in msa_helper.c
  target/mips: Unroll loops for MSA float max/min instructions
  target/mips: Correct helper for MSA FCLASS.<W|D> instructions

 target/mips/msa_helper.c                           | 260 +++++++----
 target/mips/translate.c                            | 497 +++++++++++++--------
 tests/tcg/mips/include/wrappers_msa.h              |  16 +
 .../ase/msa/fixed-multiply/test_msa_madd_q_h.c     | 216 +++++++++
 .../ase/msa/fixed-multiply/test_msa_madd_q_w.c     | 216 +++++++++
 .../ase/msa/fixed-multiply/test_msa_maddr_q_h.c    | 216 +++++++++
 .../ase/msa/fixed-multiply/test_msa_maddr_q_w.c    | 216 +++++++++
 .../ase/msa/fixed-multiply/test_msa_msub_q_h.c     | 216 +++++++++
 .../ase/msa/fixed-multiply/test_msa_msub_q_w.c     | 216 +++++++++
 .../ase/msa/fixed-multiply/test_msa_msubr_q_h.c    | 216 +++++++++
 .../ase/msa/fixed-multiply/test_msa_msubr_q_w.c    | 216 +++++++++
 .../user/ase/msa/int-multiply/test_msa_maddv_b.c   | 224 +++++-----
 .../user/ase/msa/int-multiply/test_msa_maddv_d.c   | 214 ++++-----
 .../user/ase/msa/int-multiply/test_msa_maddv_h.c   | 224 +++++-----
 .../user/ase/msa/int-multiply/test_msa_maddv_w.c   | 224 +++++-----
 .../user/ase/msa/int-multiply/test_msa_msubv_b.c   | 224 +++++-----
 .../user/ase/msa/int-multiply/test_msa_msubv_d.c   | 224 +++++-----
 .../user/ase/msa/int-multiply/test_msa_msubv_h.c   | 224 +++++-----
 .../user/ase/msa/int-multiply/test_msa_msubv_w.c   | 224 +++++-----
 .../mips/user/ase/msa/test_msa_compile_32r6eb.sh   |  32 +-
 .../mips/user/ase/msa/test_msa_compile_32r6el.sh   |  32 +-
 .../mips/user/ase/msa/test_msa_compile_64r6eb.sh   |  32 +-
 .../mips/user/ase/msa/test_msa_compile_64r6el.sh   |  32 +-
 tests/tcg/mips/user/ase/msa/test_msa_run_32r6eb.sh |  16 +-
 tests/tcg/mips/user/ase/msa/test_msa_run_32r6el.sh |  16 +-
 tests/tcg/mips/user/ase/msa/test_msa_run_64r6eb.sh |  16 +-
 tests/tcg/mips/user/ase/msa/test_msa_run_64r6el.sh |  16 +-
 27 files changed, 3262 insertions(+), 1213 deletions(-)
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



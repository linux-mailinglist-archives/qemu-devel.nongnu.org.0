Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9915637772
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 17:10:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYu27-0001jQ-Lo
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 11:10:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYtzw-0000eL-BY
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 11:08:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYtzu-0005yh-0N
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 11:08:12 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:50696 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hYtzt-0003l9-J8
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 11:08:09 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id EB1A81A210F;
	Thu,  6 Jun 2019 17:06:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id CF09D1A1F80;
	Thu,  6 Jun 2019 17:06:51 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 17:06:33 +0200
Message-Id: <1559833603-29660-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v2 00/10] Amend and clean up MSA support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This series contains various refactorings and cleanups of MSA
support.

Improve support for logic instructions, add tests for shift
and FP max/min instructions, add reseting all MSA registers
before running tests, improve code style, outline future
organization.

v2->v3:

  - address Aleksandar Rikalo's feedback

v1->v2:

  - tranfer "README" patch from another series to this one
  - add FP max/min tests
  - add reset_msa_registers()
  - move some tests to a better location

Aleksandar Markovic (10):
  target/mips: Fix space-related format issues im msa_helper.c
  target/mips: Fix block-comment-related issues im msa_helper.c
  target/mips: Outline places for future MSA helpers
  target/mips: Unroll loops in helpers for MSA logic instructions
  tests/tcg: target/mips: Amend and rearrange MSA wrappers
  tests/tcg: target/mips: Add tests for MSA shift instructions
  tests/tcg: target/mips: Move four tests to a better location
  tests/tcg: target/mips: Add utility function reset_msa_registers()
  tests/tcg: target/mips: Add tests for MSA FP max/min instructions
  tests/tcg: target/mips: Add README for MSA tests

 target/mips/msa_helper.c                           | 252 +++++++++--
 tests/tcg/mips/include/wrappers_msa.h              | 466 +++++++++++++------
 tests/tcg/mips/user/ase/msa/README                 |  20 +
 .../mips/user/ase/msa/bit-count/test_msa_nloc_b.c  |   2 +
 .../mips/user/ase/msa/bit-count/test_msa_nloc_d.c  |   2 +
 .../mips/user/ase/msa/bit-count/test_msa_nloc_h.c  |   2 +
 .../mips/user/ase/msa/bit-count/test_msa_nloc_w.c  |   2 +
 .../mips/user/ase/msa/bit-count/test_msa_nlzc_b.c  |   2 +
 .../mips/user/ase/msa/bit-count/test_msa_nlzc_d.c  |   2 +
 .../mips/user/ase/msa/bit-count/test_msa_nlzc_h.c  |   2 +
 .../mips/user/ase/msa/bit-count/test_msa_nlzc_w.c  |   2 +
 .../mips/user/ase/msa/bit-count/test_msa_pcnt_b.c  |   2 +
 .../mips/user/ase/msa/bit-count/test_msa_pcnt_d.c  |   2 +
 .../mips/user/ase/msa/bit-count/test_msa_pcnt_h.c  |   2 +
 .../mips/user/ase/msa/bit-count/test_msa_pcnt_w.c  |   2 +
 .../mips/user/ase/msa/bit-set/test_msa_bclr_b.c    |   2 +
 .../mips/user/ase/msa/bit-set/test_msa_bclr_d.c    |   2 +
 .../mips/user/ase/msa/bit-set/test_msa_bclr_h.c    |   2 +
 .../mips/user/ase/msa/bit-set/test_msa_bclr_w.c    |   2 +
 .../mips/user/ase/msa/bit-set/test_msa_bneg_b.c    |   2 +
 .../mips/user/ase/msa/bit-set/test_msa_bneg_d.c    |   2 +
 .../mips/user/ase/msa/bit-set/test_msa_bneg_h.c    |   2 +
 .../mips/user/ase/msa/bit-set/test_msa_bneg_w.c    |   2 +
 .../mips/user/ase/msa/bit-set/test_msa_bset_b.c    |   2 +
 .../mips/user/ase/msa/bit-set/test_msa_bset_d.c    |   2 +
 .../mips/user/ase/msa/bit-set/test_msa_bset_h.c    |   2 +
 .../mips/user/ase/msa/bit-set/test_msa_bset_w.c    |   2 +
 .../test_msa_mul_q_h.c                             |   2 +
 .../test_msa_mul_q_w.c                             |   2 +
 .../test_msa_mulr_q_h.c                            |   2 +
 .../test_msa_mulr_q_w.c                            |   2 +
 .../user/ase/msa/float-max-min/test_msa_fmax_a_d.c | 155 +++++++
 .../user/ase/msa/float-max-min/test_msa_fmax_a_w.c | 155 +++++++
 .../user/ase/msa/float-max-min/test_msa_fmax_d.c   | 155 +++++++
 .../user/ase/msa/float-max-min/test_msa_fmax_w.c   | 155 +++++++
 .../user/ase/msa/float-max-min/test_msa_fmin_a_d.c | 155 +++++++
 .../user/ase/msa/float-max-min/test_msa_fmin_a_w.c | 155 +++++++
 .../user/ase/msa/float-max-min/test_msa_fmin_d.c   | 155 +++++++
 .../user/ase/msa/float-max-min/test_msa_fmin_w.c   | 155 +++++++
 .../mips/user/ase/msa/int-add/test_msa_add_a_b.c   |   2 +
 .../mips/user/ase/msa/int-add/test_msa_add_a_d.c   |   2 +
 .../mips/user/ase/msa/int-add/test_msa_add_a_h.c   |   2 +
 .../mips/user/ase/msa/int-add/test_msa_add_a_w.c   |   2 +
 .../mips/user/ase/msa/int-add/test_msa_adds_a_b.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_adds_a_d.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_adds_a_h.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_adds_a_w.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_adds_s_b.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_adds_s_d.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_adds_s_h.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_adds_s_w.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_adds_u_b.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_adds_u_d.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_adds_u_h.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_adds_u_w.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_addv_b.c    |   2 +
 .../mips/user/ase/msa/int-add/test_msa_addv_d.c    |   2 +
 .../mips/user/ase/msa/int-add/test_msa_addv_h.c    |   2 +
 .../mips/user/ase/msa/int-add/test_msa_addv_w.c    |   2 +
 .../mips/user/ase/msa/int-add/test_msa_hadd_s_d.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_hadd_s_h.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_hadd_s_w.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_hadd_u_d.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_hadd_u_h.c  |   2 +
 .../mips/user/ase/msa/int-add/test_msa_hadd_u_w.c  |   2 +
 .../user/ase/msa/int-average/test_msa_ave_s_b.c    |   2 +
 .../user/ase/msa/int-average/test_msa_ave_s_d.c    |   2 +
 .../user/ase/msa/int-average/test_msa_ave_s_h.c    |   2 +
 .../user/ase/msa/int-average/test_msa_ave_s_w.c    |   2 +
 .../user/ase/msa/int-average/test_msa_ave_u_b.c    |   2 +
 .../user/ase/msa/int-average/test_msa_ave_u_d.c    |   2 +
 .../user/ase/msa/int-average/test_msa_ave_u_h.c    |   2 +
 .../user/ase/msa/int-average/test_msa_ave_u_w.c    |   2 +
 .../user/ase/msa/int-average/test_msa_aver_s_b.c   |   2 +
 .../user/ase/msa/int-average/test_msa_aver_s_d.c   |   2 +
 .../user/ase/msa/int-average/test_msa_aver_s_h.c   |   2 +
 .../user/ase/msa/int-average/test_msa_aver_s_w.c   |   2 +
 .../user/ase/msa/int-average/test_msa_aver_u_b.c   |   2 +
 .../user/ase/msa/int-average/test_msa_aver_u_d.c   |   2 +
 .../user/ase/msa/int-average/test_msa_aver_u_h.c   |   2 +
 .../user/ase/msa/int-average/test_msa_aver_u_w.c   |   2 +
 .../mips/user/ase/msa/int-compare/test_msa_ceq_b.c |   2 +
 .../mips/user/ase/msa/int-compare/test_msa_ceq_d.c |   2 +
 .../mips/user/ase/msa/int-compare/test_msa_ceq_h.c |   2 +
 .../mips/user/ase/msa/int-compare/test_msa_ceq_w.c |   2 +
 .../user/ase/msa/int-compare/test_msa_cle_s_b.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_cle_s_d.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_cle_s_h.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_cle_s_w.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_cle_u_b.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_cle_u_d.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_cle_u_h.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_cle_u_w.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_clt_s_b.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_clt_s_d.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_clt_s_h.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_clt_s_w.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_clt_u_b.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_clt_u_d.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_clt_u_h.c    |   2 +
 .../user/ase/msa/int-compare/test_msa_clt_u_w.c    |   2 +
 .../user/ase/msa/int-divide/test_msa_div_s_b.c     |   2 +
 .../user/ase/msa/int-divide/test_msa_div_s_d.c     |   2 +
 .../user/ase/msa/int-divide/test_msa_div_s_h.c     |   2 +
 .../user/ase/msa/int-divide/test_msa_div_s_w.c     |   2 +
 .../user/ase/msa/int-divide/test_msa_div_u_b.c     |   2 +
 .../user/ase/msa/int-divide/test_msa_div_u_d.c     |   2 +
 .../user/ase/msa/int-divide/test_msa_div_u_h.c     |   2 +
 .../user/ase/msa/int-divide/test_msa_div_u_w.c     |   2 +
 .../ase/msa/int-dot-product/test_msa_dotp_s_d.c    |   2 +
 .../ase/msa/int-dot-product/test_msa_dotp_s_h.c    |   2 +
 .../ase/msa/int-dot-product/test_msa_dotp_s_w.c    |   2 +
 .../ase/msa/int-dot-product/test_msa_dotp_u_d.c    |   2 +
 .../ase/msa/int-dot-product/test_msa_dotp_u_h.c    |   2 +
 .../ase/msa/int-dot-product/test_msa_dotp_u_w.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_max_a_b.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_max_a_d.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_max_a_h.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_max_a_w.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_max_s_b.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_max_s_d.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_max_s_h.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_max_s_w.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_max_u_b.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_max_u_d.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_max_u_h.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_max_u_w.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_min_a_b.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_min_a_d.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_min_a_h.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_min_a_w.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_min_s_b.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_min_s_d.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_min_s_h.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_min_s_w.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_min_u_b.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_min_u_d.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_min_u_h.c    |   2 +
 .../user/ase/msa/int-max-min/test_msa_min_u_w.c    |   2 +
 .../user/ase/msa/int-modulo/test_msa_mod_s_b.c     |   2 +
 .../user/ase/msa/int-modulo/test_msa_mod_s_d.c     |   2 +
 .../user/ase/msa/int-modulo/test_msa_mod_s_h.c     |   2 +
 .../user/ase/msa/int-modulo/test_msa_mod_s_w.c     |   2 +
 .../user/ase/msa/int-modulo/test_msa_mod_u_b.c     |   2 +
 .../user/ase/msa/int-modulo/test_msa_mod_u_d.c     |   2 +
 .../user/ase/msa/int-modulo/test_msa_mod_u_h.c     |   2 +
 .../user/ase/msa/int-modulo/test_msa_mod_u_w.c     |   2 +
 .../user/ase/msa/int-multiply/test_msa_mulv_b.c    |   2 +
 .../user/ase/msa/int-multiply/test_msa_mulv_d.c    |   2 +
 .../user/ase/msa/int-multiply/test_msa_mulv_h.c    |   2 +
 .../user/ase/msa/int-multiply/test_msa_mulv_w.c    |   2 +
 .../user/ase/msa/int-subtract/test_msa_asub_s_b.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_asub_s_d.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_asub_s_h.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_asub_s_w.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_asub_u_b.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_asub_u_d.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_asub_u_h.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_asub_u_w.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_hsub_s_d.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_hsub_s_h.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_hsub_s_w.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_hsub_u_d.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_hsub_u_h.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_hsub_u_w.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_subs_s_b.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_subs_s_d.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_subs_s_h.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_subs_s_w.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_subs_u_b.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_subs_u_d.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_subs_u_h.c  |   2 +
 .../user/ase/msa/int-subtract/test_msa_subs_u_w.c  |   2 +
 .../ase/msa/int-subtract/test_msa_subsus_u_b.c     |   2 +
 .../ase/msa/int-subtract/test_msa_subsus_u_d.c     |   2 +
 .../ase/msa/int-subtract/test_msa_subsus_u_h.c     |   2 +
 .../ase/msa/int-subtract/test_msa_subsus_u_w.c     |   2 +
 .../ase/msa/int-subtract/test_msa_subsuu_s_b.c     |   2 +
 .../ase/msa/int-subtract/test_msa_subsuu_s_d.c     |   2 +
 .../ase/msa/int-subtract/test_msa_subsuu_s_h.c     |   2 +
 .../ase/msa/int-subtract/test_msa_subsuu_s_w.c     |   2 +
 .../user/ase/msa/int-subtract/test_msa_subv_b.c    |   2 +
 .../user/ase/msa/int-subtract/test_msa_subv_d.c    |   2 +
 .../user/ase/msa/int-subtract/test_msa_subv_h.c    |   2 +
 .../user/ase/msa/int-subtract/test_msa_subv_w.c    |   2 +
 .../user/ase/msa/interleave/test_msa_ilvev_b.c     |   2 +
 .../user/ase/msa/interleave/test_msa_ilvev_d.c     |   2 +
 .../user/ase/msa/interleave/test_msa_ilvev_h.c     |   2 +
 .../user/ase/msa/interleave/test_msa_ilvev_w.c     |   2 +
 .../mips/user/ase/msa/interleave/test_msa_ilvl_b.c |   2 +
 .../mips/user/ase/msa/interleave/test_msa_ilvl_d.c |   2 +
 .../mips/user/ase/msa/interleave/test_msa_ilvl_h.c |   2 +
 .../mips/user/ase/msa/interleave/test_msa_ilvl_w.c |   2 +
 .../user/ase/msa/interleave/test_msa_ilvod_b.c     |   2 +
 .../user/ase/msa/interleave/test_msa_ilvod_d.c     |   2 +
 .../user/ase/msa/interleave/test_msa_ilvod_h.c     |   2 +
 .../user/ase/msa/interleave/test_msa_ilvod_w.c     |   2 +
 .../mips/user/ase/msa/interleave/test_msa_ilvr_b.c |   2 +
 .../mips/user/ase/msa/interleave/test_msa_ilvr_d.c |   2 +
 .../mips/user/ase/msa/interleave/test_msa_ilvr_h.c |   2 +
 .../mips/user/ase/msa/interleave/test_msa_ilvr_w.c |   2 +
 tests/tcg/mips/user/ase/msa/logic/test_msa_and_v.c |   2 +
 tests/tcg/mips/user/ase/msa/logic/test_msa_nor_v.c |   2 +
 tests/tcg/mips/user/ase/msa/logic/test_msa_or_v.c  |   2 +
 tests/tcg/mips/user/ase/msa/logic/test_msa_xor_v.c |   2 +
 .../tcg/mips/user/ase/msa/pack/test_msa_pckev_b.c  |   2 +
 .../tcg/mips/user/ase/msa/pack/test_msa_pckev_d.c  |   2 +
 .../tcg/mips/user/ase/msa/pack/test_msa_pckev_h.c  |   2 +
 .../tcg/mips/user/ase/msa/pack/test_msa_pckev_w.c  |   2 +
 .../tcg/mips/user/ase/msa/pack/test_msa_pckod_b.c  |   2 +
 .../tcg/mips/user/ase/msa/pack/test_msa_pckod_d.c  |   2 +
 .../tcg/mips/user/ase/msa/pack/test_msa_pckod_h.c  |   2 +
 .../tcg/mips/user/ase/msa/pack/test_msa_pckod_w.c  |   2 +
 tests/tcg/mips/user/ase/msa/pack/test_msa_vshf_b.c |   2 +
 tests/tcg/mips/user/ase/msa/pack/test_msa_vshf_d.c |   2 +
 tests/tcg/mips/user/ase/msa/pack/test_msa_vshf_h.c |   2 +
 tests/tcg/mips/user/ase/msa/pack/test_msa_vshf_w.c |   2 +
 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_b.c | 155 +++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_d.c | 155 +++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_h.c | 155 +++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_w.c | 155 +++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_b.c | 155 +++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_d.c | 155 +++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_h.c | 155 +++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_w.c | 155 +++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srar_b.c  | 155 +++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srar_d.c  | 155 +++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srar_h.c  | 155 +++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srar_w.c  | 155 +++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_b.c | 155 +++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_d.c | 155 +++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_h.c | 155 +++++++
 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_w.c | 155 +++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srlr_b.c  | 155 +++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srlr_d.c  | 155 +++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srlr_h.c  | 155 +++++++
 .../tcg/mips/user/ase/msa/shift/test_msa_srlr_w.c  | 155 +++++++
 tests/tcg/mips/user/ase/msa/test_msa_compile.sh    | 498 +++++++++++++++++++++
 tests/tcg/mips/user/ase/msa/test_msa_run.sh        | 209 +++++++++
 239 files changed, 6025 insertions(+), 172 deletions(-)
 create mode 100644 tests/tcg/mips/user/ase/msa/README
 rename tests/tcg/mips/user/ase/msa/{int-multiply => fixed-multiply}/test_msa_mul_q_h.c (99%)
 rename tests/tcg/mips/user/ase/msa/{int-multiply => fixed-multiply}/test_msa_mul_q_w.c (99%)
 rename tests/tcg/mips/user/ase/msa/{int-multiply => fixed-multiply}/test_msa_mulr_q_h.c (99%)
 rename tests/tcg/mips/user/ase/msa/{int-multiply => fixed-multiply}/test_msa_mulr_q_w.c (99%)
 create mode 100644 tests/tcg/mips/user/ase/msa/float-max-min/test_msa_fmax_a_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/float-max-min/test_msa_fmax_a_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/float-max-min/test_msa_fmax_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/float-max-min/test_msa_fmax_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/float-max-min/test_msa_fmin_a_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/float-max-min/test_msa_fmin_a_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/float-max-min/test_msa_fmin_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/float-max-min/test_msa_fmin_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sll_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_sra_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srar_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srar_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srar_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srar_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srl_w.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srlr_b.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srlr_d.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srlr_h.c
 create mode 100644 tests/tcg/mips/user/ase/msa/shift/test_msa_srlr_w.c
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_compile.sh
 create mode 100755 tests/tcg/mips/user/ase/msa/test_msa_run.sh

-- 
2.7.4



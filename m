Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4053D37D3B5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:01:01 +0200 (CEST)
Received: from localhost ([::1]:37946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgu6O-0008E5-4N
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu1i-0005L2-04; Wed, 12 May 2021 14:56:10 -0400
Received: from [201.28.113.2] (port=32220 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu1e-0007c5-Pe; Wed, 12 May 2021 14:56:09 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:55:59 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id C1FC98000C2;
 Wed, 12 May 2021 15:55:58 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 00/31] Base for adding PowerPC 64-bit instructions
Date: Wed, 12 May 2021 15:54:10 -0300
Message-Id: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:55:59.0201 (UTC)
 FILETIME=[725F7510:01D74760]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

This series provides the basic infrastructure for adding the new 32/64-bit
instructions in Power ISA 3.1 to target/ppc.

v4:
- Rebase on ppc-for-6.1;
- Fold do_ldst_D and do_ldst_X;
- Add tcg_const_tl, used to share do_ldst_D and do_ldst_X code;
- Unfold prefixed and non-prefixed loads/stores/addi to let non-prefixed insns use the non-prefixed formats;
- PNOP invalid suffixes;
- setbc/setbcr/stnbc/setnbcr implemented;
- cfuged/vcfuged implemented;
- addpcis moved to decodetree.

v3:
- More changes for decodetree.
- Cleanup exception/is_jmp logic to the point exception is removed.
- Fold in Luis' isa check for prefixed insn support.
- Share trans_* between prefixed and non-prefixed instructions.
- Use macros to minimize the trans_* boilerplate.
- Fix decode mistake for STHX/STHXU.

v2:
- Store current pc in ctx instead of insn_size
- Use separate decode files for 32- and 64-bit instructions
- Improvements to the exception/is_jmp logic
- Use translator_loop_temp_check()
- Moved logic to prevent translation from crossing page boundaries
- Additional instructions using decodetree: addis, pnop, loads/stores
- Added check for prefixed insn support in cpu flags

Matheus Ferst (6):
  target/ppc: Introduce gen_icount_io_start
  TCG: add tcg_constant_tl
  target/ppc: Implement setbc/setbcr/stnbc/setnbcr instructions
  target/ppc: Implement cfuged instruction
  target/ppc: Implement vcfuged instruction
  target/ppc: Move addpcis to decodetree

Richard Henderson (25):
  target/ppc: Add cia field to DisasContext
  target/ppc: Split out decode_legacy
  target/ppc: Move DISAS_NORETURN setting into gen_exception*
  target/ppc: Remove special case for POWERPC_SYSCALL
  target/ppc: Remove special case for POWERPC_EXCP_TRAP
  target/ppc: Simplify gen_debug_exception
  target/ppc: Introduce DISAS_{EXIT,CHAIN}{,_UPDATE}
  target/ppc: Replace POWERPC_EXCP_SYNC with DISAS_EXIT
  target/ppc: Remove unnecessary gen_io_end calls
  target/ppc: Replace POWERPC_EXCP_STOP with DISAS_EXIT_UPDATE
  target/ppc: Replace POWERPC_EXCP_BRANCH with DISAS_NORETURN
  target/ppc: Remove DisasContext.exception
  target/ppc: Move single-step check to ppc_tr_tb_stop
  target/ppc: Tidy exception vs exit_tb
  target/ppc: Mark helper_raise_exception* as noreturn
  target/ppc: Use translator_loop_temp_check
  target/ppc: Introduce macros to check isa extensions
  target/ppc: Move page crossing check to ppc_tr_translate_insn
  target/ppc: Add infrastructure for prefixed insns
  target/ppc: Move ADDI, ADDIS to decodetree, implement PADDI
  target/ppc: Implement PNOP
  target/ppc: Move D/DS/X-form integer loads to decodetree
  target/ppc: Implement prefixed integer load instructions
  target/ppc: Move D/DS/X-form integer stores to decodetree
  target/ppc: Implement prefixed integer store instructions

 include/tcg/tcg-op.h                       |   2 +
 linux-user/ppc/cpu_loop.c                  |   6 -
 target/ppc/cpu.h                           |   5 +-
 target/ppc/helper.h                        |   5 +-
 target/ppc/insn32.decode                   | 112 +++
 target/ppc/insn64.decode                   | 123 +++
 target/ppc/int_helper.c                    |  39 +
 target/ppc/meson.build                     |   9 +
 target/ppc/translate.c                     | 829 ++++++++-------------
 target/ppc/translate/fixedpoint-impl.c.inc | 243 ++++++
 target/ppc/translate/vector-impl.c.inc     |  50 ++
 11 files changed, 877 insertions(+), 546 deletions(-)
 create mode 100644 target/ppc/insn32.decode
 create mode 100644 target/ppc/insn64.decode
 create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc
 create mode 100644 target/ppc/translate/vector-impl.c.inc

-- 
2.25.1



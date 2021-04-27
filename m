Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C92D36CA46
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:23:43 +0200 (CEST)
Received: from localhost ([::1]:42068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRR0-0003hT-BC
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRLX-0001D5-O4; Tue, 27 Apr 2021 13:18:03 -0400
Received: from [201.28.113.2] (port=48284 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRLV-00023I-UW; Tue, 27 Apr 2021 13:18:03 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 27 Apr 2021 14:16:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 7A94480139F;
 Tue, 27 Apr 2021 14:16:51 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 00/15] Base for adding PowerPC 64-bit instructions
Date: Tue, 27 Apr 2021 14:16:34 -0300
Message-Id: <20210427171649.364699-1-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Apr 2021 17:16:52.0089 (UTC)
 FILETIME=[1D6BEE90:01D73B89]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org,
 Luis Pires <luis.pires@eldorado.org.br>, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series provides the basic infrastructure for adding the new 32/64-bit
instructions in Power ISA 3.1 to target/ppc.

It starts by changing decodetree.py to support 64-bit instructions,
then changes the target/ppc code to allow 32- and 64-bit instructions
to be decoded using decodetree, and finishes by adding the implementation
for an initial group of instructions to demonstrate the new approach:
- addis/addis/paddi
- pnop
- integer loads/stores (both prefixed and non-prefixed)

Link to the changes in Github:
https://github.com/PPC64/qemu/tree/lffpires-ppc-isa31-1

v2:
- Store current pc in ctx instead of insn_size
- Use separate decode files for 32- and 64-bit instructions
- Improvements to the exception/is_jmp logic
- Use translator_loop_temp_check()
- Moved logic to prevent translation from crossing page boundaries
- Additional instructions using decodetree: addis, pnop, loads/stores
- Added check for prefixed insn support in cpu flags

This code contains contributions from Richard Henderson, Matheus Ferst
and myself.

Luis Pires (2):
  decodetree: Add support for 64-bit instructions
  target/ppc: Check cpu flags for prefixed insn support

Richard Henderson (13):
  target/ppc: Add cia field to DisasContext
  target/ppc: Split out decode_legacy
  target/ppc: Move DISAS_NORETURN setting into gen_exception*
  target/ppc: Tidy exception vs exit_tb
  target/ppc: Mark helper_raise_exception* as noreturn
  target/ppc: Use translator_loop_temp_check
  target/ppc: Add infrastructure for prefixed insns
  target/ppc: Move ADDI, ADDIS to decodetree, implement PADDI
  target/ppc: Implement PNOP
  target/ppc: Move D/DS/X-form integer loads to decodetree
  target/ppc: Implement prefixed integer load instructions
  target/ppc: Move D/DS/X-form integer stores to decodetree
  target/ppc: Implement prefixed integer store instructions

 docs/devel/decodetree.rst                  |   5 +-
 scripts/decodetree.py                      |  26 +-
 target/ppc/cpu.h                           |   1 +
 target/ppc/helper.h                        |   4 +-
 target/ppc/insn32.decode                   |  85 ++++
 target/ppc/insn64.decode                   |  64 +++
 target/ppc/meson.build                     |   9 +
 target/ppc/translate.c                     | 513 +++++++--------------
 target/ppc/translate/fixedpoint-impl.c.inc | 424 +++++++++++++++++
 target/ppc/translate_init.c.inc            |  42 +-
 10 files changed, 798 insertions(+), 375 deletions(-)
 create mode 100644 target/ppc/insn32.decode
 create mode 100644 target/ppc/insn64.decode
 create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc

-- 
2.25.1



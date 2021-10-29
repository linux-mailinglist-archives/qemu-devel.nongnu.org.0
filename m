Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7B7440429
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:33:44 +0200 (CEST)
Received: from localhost ([::1]:44076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYZL-00037K-A4
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYRN-0000o6-Lc; Fri, 29 Oct 2021 16:25:31 -0400
Received: from [201.28.113.2] (port=65208 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYRK-0001sK-0c; Fri, 29 Oct 2021 16:25:29 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 17:24:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 946BE800B36;
 Fri, 29 Oct 2021 17:24:43 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 00/34] PowerISA v3.1 instruction batch
Date: Fri, 29 Oct 2021 17:23:50 -0300
Message-Id: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 20:24:44.0181 (UTC)
 FILETIME=[02886C50:01D7CD03]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

This patch series implements 56 new instructions for POWER10, moving 28
"old" instructions to decodetree along the way. The series is divided by
facility as follows:

- From patch 1 to 4: Floating-Point
- From patch 5 to 10: Fixed-Point
- From patch 11 to 19: Vector
- From patch 20 to 34: Vector-Scalar Extensions

Based-on: <20211029192417.400707-1-luis.pires@eldorado.org.br>
because of patch 2 ("target/ppc: Move REQUIRE_ALTIVEC/VECTOR to
translate.c") and patch 3 ("target/ppc: Introduce REQUIRE_FPU"), and
Based-on: ppc-for-6.2

Patches without review: 7-8, 12, 14-16, 19, 21-22, 24, 30

v2:
- do_ea_calc now allocate and returns ea
- Inline version of cntlzdm/cnttzdm
- vecop_list removed from GVecGen* without fniv
- vsldbi/vsrdbi implemented with tcg_gen_extract2_i64
- memcpy instead of misaligned load/stores on vector insert instructions
- Simplified helper for Vector Extract
- Fixed [p]stxv[xp]/[p]lxv[xp] to always access to lowest address first
  in LE
- xxsplti32dx implemented with tcg_gen_st_i32
- valid_values mask removed from lxvkq implementation

Bruno Larsen (billionai) (6):
  target/ppc: Introduce REQUIRE_VSX macro
  target/ppc: moved XXSPLTW to using decodetree
  target/ppc: moved XXSPLTIB to using decodetree
  target/ppc: implemented XXSPLTI32DX
  target/ppc: Implemented XXSPLTIW using decodetree
  target/ppc: implemented XXSPLTIDP instruction

Fernando Eckhardt Valle (4):
  target/ppc: introduce do_ea_calc
  target/ppc: move resolve_PLS_D to translate.c
  target/ppc: Move load and store floating point instructions to
    decodetree
  target/ppc: Implement PLFS, PLFD, PSTFS and PSTFD instructions

Lucas Mateus Castro (alqotel) (6):
  target/ppc: moved stxv and lxv from legacy to decodtree
  target/ppc: moved stxvx and lxvx from legacy to decodtree
  target/ppc: added the instructions LXVP and STXVP
  target/ppc: added the instructions LXVPX and STXVPX
  target/ppc: added the instructions PLXV and PSTXV
  target/ppc: added the instructions PLXVP and PSTXVP

Luis Pires (2):
  target/ppc: Implement cntlzdm
  target/ppc: Implement cnttzdm

Matheus Ferst (16):
  target/ppc: Move LQ and STQ to decodetree
  target/ppc: Implement PLQ and PSTQ
  target/ppc: Implement pdepd instruction
  target/ppc: Implement pextd instruction
  target/ppc: Move vcfuged to vmx-impl.c.inc
  target/ppc: Implement vclzdm/vctzdm instructions
  target/ppc: Implement vpdepd/vpextd instruction
  target/ppc: Implement vsldbi/vsrdbi instructions
  target/ppc: Implement Vector Insert from GPR using GPR index insns
  target/ppc: Implement Vector Insert Word from GPR using Immediate
    insns
  target/ppc: Implement Vector Insert from VSR using GPR index insns
  target/ppc: Move vinsertb/vinserth/vinsertw/vinsertd to decodetree
  target/ppc: Implement Vector Extract Double to VSR using GPR index
    insns
  target/ppc: receive high/low as argument in get/set_cpu_vsr
  target/ppc: Implement xxblendvb/xxblendvh/xxblendvw/xxblendvd
    instructions
  target/ppc: Implement lxvkq instruction

 target/ppc/helper.h                        |  20 +-
 target/ppc/insn32.decode                   | 132 ++++
 target/ppc/insn64.decode                   |  72 +++
 target/ppc/int_helper.c                    | 134 +++-
 target/ppc/translate.c                     | 215 ++-----
 target/ppc/translate/fixedpoint-impl.c.inc | 218 ++++++-
 target/ppc/translate/fp-impl.c.inc         | 261 +++-----
 target/ppc/translate/fp-ops.c.inc          |  29 -
 target/ppc/translate/vector-impl.c.inc     |  48 --
 target/ppc/translate/vmx-impl.c.inc        | 334 +++++++++-
 target/ppc/translate/vmx-ops.c.inc         |  10 +-
 target/ppc/translate/vsx-impl.c.inc        | 701 ++++++++++++---------
 target/ppc/translate/vsx-ops.c.inc         |   4 -
 13 files changed, 1387 insertions(+), 791 deletions(-)
 delete mode 100644 target/ppc/translate/vector-impl.c.inc

-- 
2.25.1



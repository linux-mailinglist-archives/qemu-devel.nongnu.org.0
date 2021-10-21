Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD37D436B86
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 21:51:02 +0200 (CEST)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mde5d-000657-3K
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 15:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde1m-0002kY-Gi; Thu, 21 Oct 2021 15:47:02 -0400
Received: from [201.28.113.2] (port=45000 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde1j-00078b-5b; Thu, 21 Oct 2021 15:47:01 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:46:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 031B580012A;
 Thu, 21 Oct 2021 16:46:52 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 00/33] PowerISA v3.1 instruction batch
Date: Thu, 21 Oct 2021 16:45:14 -0300
Message-Id: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:46:53.0818 (UTC)
 FILETIME=[65FC85A0:01D7C6B4]
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
 luis.pires@eldorado.org.br, matheus.ferst@eldorado.org.br,
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
- From patch 20 to 33: Vector-Scalar Extensions

Based-on: <20210910112624.72748-1-luis.pires@eldorado.org.br>
because of patch 10 ("target/ppc: Move REQUIRE_ALTIVEC/VECTOR to
translate.c") and patch 11 ("target/ppc: Introduce REQUIRE_FPU").

Bruno Larsen (billionai) (6):
  target/ppc: Introduce REQUIRE_VSX macro
  target/ppc: moved XXSPLTW to using decodetree
  target/ppc: moved XXSPLTIB to using decodetree
  target/ppc: implemented XXSPLTI32DX
  target/ppc: Implemented XXSPLTIW using decodetree
  target/ppc: implemented XXSPLTIDP instruction

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

Matheus Ferst (15):
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
  target/ppc: Implement xxblendvb/xxblendvh/xxblendvw/xxblendvd
    instructions
  target/ppc: Implement lxvkq instruction

pherde (4):
  target/ppc: introduce do_ea_calc
  target/ppc: move resolve_PLS_D to translate.c
  target/ppc: Move load and store floating point instructions to
    decodetree
  target/ppc: Implement PLFS, PLFD, PSTFS and PSTFD instructions

 target/ppc/helper.h                        |  22 +-
 target/ppc/insn32.decode                   | 132 +++++++
 target/ppc/insn64.decode                   |  72 ++++
 target/ppc/int_helper.c                    | 169 +++++++-
 target/ppc/translate.c                     | 213 +++--------
 target/ppc/translate/fixedpoint-impl.c.inc | 188 +++++++--
 target/ppc/translate/fp-impl.c.inc         | 254 ++++--------
 target/ppc/translate/fp-ops.c.inc          |  29 --
 target/ppc/translate/vector-impl.c.inc     |  48 ---
 target/ppc/translate/vmx-impl.c.inc        | 358 ++++++++++++++++-
 target/ppc/translate/vmx-ops.c.inc         |  10 +-
 target/ppc/translate/vsx-impl.c.inc        | 424 ++++++++++++++-------
 target/ppc/translate/vsx-ops.c.inc         |   4 -
 13 files changed, 1298 insertions(+), 625 deletions(-)
 delete mode 100644 target/ppc/translate/vector-impl.c.inc

-- 
2.25.1



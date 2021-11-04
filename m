Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15489445342
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 13:46:00 +0100 (CET)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mic7z-0004KD-6I
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 08:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic1Z-0000EC-Se; Thu, 04 Nov 2021 08:39:21 -0400
Received: from [201.28.113.2] (port=33857 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic1X-0005sq-Tw; Thu, 04 Nov 2021 08:39:21 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 4 Nov 2021 09:39:15 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 63B59800BA7;
 Thu,  4 Nov 2021 09:39:15 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 00/25] PowerISA v3.1 instruction batch
Date: Thu,  4 Nov 2021 09:36:54 -0300
Message-Id: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Nov 2021 12:39:15.0822 (UTC)
 FILETIME=[FA6988E0:01D7D178]
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
X-Mailman-Version: 2.1.29
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

- From patch 1 to 9: Vector
- From patch 10 to 24: Vector-Scalar Extensions
- From patch 25: Fixed-Point

Based-on: ppc-for-6.2

Patches without review: 5, 25

v3:
- Rebase on ppc-for-6.2
- Fixed endianness issue in vector insert helpers
- cntlzdm/cnttzdm implementation without brcond

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

Lucas Mateus Castro (alqotel) (6):
  target/ppc: moved stxv and lxv from legacy to decodtree
  target/ppc: moved stxvx and lxvx from legacy to decodtree
  target/ppc: added the instructions LXVP and STXVP
  target/ppc: added the instructions LXVPX and STXVPX
  target/ppc: added the instructions PLXV and PSTXV
  target/ppc: added the instructions PLXVP and PSTXVP

Matheus Ferst (13):
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
  target/ppc: cntlzdm/cnttzdm implementation without brcond

 target/ppc/helper.h                        |  20 +-
 target/ppc/insn32.decode                   |  93 +++
 target/ppc/insn64.decode                   |  57 ++
 target/ppc/int_helper.c                    | 101 ++-
 target/ppc/translate.c                     |  26 +-
 target/ppc/translate/fixedpoint-impl.c.inc |  37 +-
 target/ppc/translate/vector-impl.c.inc     |  48 --
 target/ppc/translate/vmx-impl.c.inc        | 334 +++++++++-
 target/ppc/translate/vmx-ops.c.inc         |  10 +-
 target/ppc/translate/vsx-impl.c.inc        | 704 ++++++++++++---------
 target/ppc/translate/vsx-ops.c.inc         |   4 -
 11 files changed, 1006 insertions(+), 428 deletions(-)
 delete mode 100644 target/ppc/translate/vector-impl.c.inc

-- 
2.25.1



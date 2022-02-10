Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6BA4B0E72
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 14:31:03 +0100 (CET)
Received: from localhost ([::1]:51238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI9XI-0000Tf-CB
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 08:31:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nI8g9-0002jg-Iw; Thu, 10 Feb 2022 07:36:08 -0500
Received: from [187.72.171.209] (port=47893 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nI8g4-00052E-T4; Thu, 10 Feb 2022 07:36:04 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 10 Feb 2022 09:35:22 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 6ED66800172;
 Thu, 10 Feb 2022 09:35:22 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 00/37] target/ppc: PowerISA Vector/VSX instruction batch
Date: Thu, 10 Feb 2022 09:34:10 -0300
Message-Id: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Feb 2022 12:35:22.0893 (UTC)
 FILETIME=[AC0EE3D0:01D81E7A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

This patch series implements 5 missing instructions from PowerISA v3.0
and 40 new instructions from PowerISA v3.1, moving 62 other instructions
to decodetree along the way.

v3:
 - Dropped patch 33, which caused a regression in xxperm[r]

v2:
 - New patch (30) to remove xscmpnedp

Lucas Coutinho (2):
  target/ppc: Move vexts[bhw]2[wd] to decodetree
  target/ppc: Implement vextsd2q

Lucas Mateus Castro (alqotel) (3):
  target/ppc: moved vector even and odd multiplication to decodetree
  target/ppc: Moved vector multiply high and low to decodetree
  target/ppc: vmulh* instructions use gvec

Luis Pires (1):
  target/ppc: Introduce TRANS*FLAGS macros

Matheus Ferst (20):
  target/ppc: Move Vector Compare Equal/Not Equal/Greater Than to
    decodetree
  target/ppc: Move Vector Compare Not Equal or Zero to decodetree
  target/ppc: Implement Vector Compare Equal Quadword
  target/ppc: Implement Vector Compare Greater Than Quadword
  target/ppc: Implement Vector Compare Quadword
  target/ppc: implement vstri[bh][lr]
  target/ppc: implement vclrlb
  target/ppc: implement vclrrb
  target/ppc: implement vcntmb[bhwd]
  target/ppc: implement vgnb
  target/ppc: Move vsel and vperm/vpermr to decodetree
  target/ppc: Move xxsel to decodetree
  target/ppc: move xxperm/xxpermr to decodetree
  target/ppc: Move xxpermdi to decodetree
  target/ppc: Implement xxpermx instruction
  tcg/tcg-op-gvec.c: Introduce tcg_gen_gvec_4i
  target/ppc: Implement xxeval
  target/ppc: Implement xxgenpcv[bhwd]m instruction
  target/ppc: move xs[n]madd[am][ds]p/xs[n]msub[am][ds]p to decodetree
  target/ppc: implement xs[n]maddqp[o]/xs[n]msubqp[o]

Víctor Colombo (11):
  target/ppc: Implement vmsumcud instruction
  target/ppc: Implement vmsumudm instruction
  target/ppc: Implement xvtlsbb instruction
  target/ppc: Remove xscmpnedp instruction
  target/ppc: Refactor VSX_SCALAR_CMP_DP
  target/ppc: Implement xscmp{eq,ge,gt}qp
  target/ppc: Move xscmp{eq,ge,gt}dp to decodetree
  target/ppc: Move xs{max,min}[cj]dp to use do_helper_XX3
  target/ppc: Refactor VSX_MAX_MINC helper
  target/ppc: Implement xs{max,min}cqp
  target/ppc: Implement xvcvbf16spn and xvcvspbf16 instructions

 include/tcg/tcg-op-gvec.h           |  22 +
 target/ppc/fpu_helper.c             | 171 ++++--
 target/ppc/helper.h                 | 143 ++---
 target/ppc/insn32.decode            | 188 +++++-
 target/ppc/insn64.decode            |  40 +-
 target/ppc/int_helper.c             | 354 ++++++-----
 target/ppc/translate.c              |  19 +
 target/ppc/translate/vmx-impl.c.inc | 894 +++++++++++++++++++++++++---
 target/ppc/translate/vmx-ops.c.inc  |  41 +-
 target/ppc/translate/vsx-impl.c.inc | 543 ++++++++++++++---
 target/ppc/translate/vsx-ops.c.inc  |  67 ---
 tcg/ppc/tcg-target.c.inc            |   6 +
 tcg/tcg-op-gvec.c                   | 146 +++++
 13 files changed, 2066 insertions(+), 568 deletions(-)

-- 
2.31.1



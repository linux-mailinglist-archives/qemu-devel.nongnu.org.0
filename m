Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D454F3D86
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 22:14:18 +0200 (CEST)
Received: from localhost ([::1]:43296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbpZC-0004xv-1K
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 16:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nbpHy-0004Jl-Pq; Tue, 05 Apr 2022 15:56:30 -0400
Received: from [187.72.171.209] (port=24543 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nbpHx-00049c-Br; Tue, 05 Apr 2022 15:56:30 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 5 Apr 2022 16:56:10 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C54E98000CB;
 Tue,  5 Apr 2022 16:56:09 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 8/9] target/ppc: Implemented vector module word/doubleword
Date: Tue,  5 Apr 2022 16:55:57 -0300
Message-Id: <20220405195558.66144-9-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Apr 2022 19:56:10.0311 (UTC)
 FILETIME=[32411D70:01D84927]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
vmodsw: Vector Modulo Signed Word
vmoduw: Vector Modulo Unsigned Word
vmodsd: Vector Modulo Signed Doubleword
vmodud: Vector Modulo Unsigned Doubleword

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/insn32.decode            |  5 +++++
 target/ppc/translate/vmx-impl.c.inc | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 3eb920ac76..36b42e41d2 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -719,3 +719,8 @@ VDIVESD         000100 ..... ..... ..... 01111001011    @VX
 VDIVEUD         000100 ..... ..... ..... 01011001011    @VX
 VDIVESQ         000100 ..... ..... ..... 01100001011    @VX
 VDIVEUQ         000100 ..... ..... ..... 01000001011    @VX
+
+VMODSW          000100 ..... ..... ..... 11110001011    @VX
+VMODUW          000100 ..... ..... ..... 11010001011    @VX
+VMODSD          000100 ..... ..... ..... 11111001011    @VX
+VMODUD          000100 ..... ..... ..... 11011001011    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 23f215dbea..c5178a0f1e 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3340,6 +3340,11 @@ static void do_diveu_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
 DO_VDIV_VMOD(do_divesw, 32, do_dives_i32, true)
 DO_VDIV_VMOD(do_diveuw, 32, do_diveu_i32, false)
 
+DO_VDIV_VMOD(do_modsw, 32, tcg_gen_rem_i32, true)
+DO_VDIV_VMOD(do_moduw, 32, tcg_gen_remu_i32, false)
+DO_VDIV_VMOD(do_modsd, 64, tcg_gen_rem_i64, true)
+DO_VDIV_VMOD(do_modud, 64, tcg_gen_remu_i64, false)
+
 TRANS_VDIV_VMOD(ISA310, VDIVESW, MO_32, do_divesw, NULL)
 TRANS_VDIV_VMOD(ISA310, VDIVEUW, MO_32, do_diveuw, NULL)
 TRANS_FLAGS2(ISA310, VDIVESD, do_vx_helper, gen_helper_VDIVESD)
@@ -3347,6 +3352,11 @@ TRANS_FLAGS2(ISA310, VDIVEUD, do_vx_helper, gen_helper_VDIVEUD)
 TRANS_FLAGS2(ISA310, VDIVESQ, do_vx_helper, gen_helper_VDIVESQ)
 TRANS_FLAGS2(ISA310, VDIVEUQ, do_vx_helper, gen_helper_VDIVEUQ)
 
+TRANS_VDIV_VMOD(ISA310, VMODSW, MO_32, do_modsw , NULL)
+TRANS_VDIV_VMOD(ISA310, VMODUW, MO_32, do_moduw, NULL)
+TRANS_VDIV_VMOD(ISA310, VMODSD, MO_64, NULL, do_modsd)
+TRANS_VDIV_VMOD(ISA310, VMODUD, MO_64, NULL, do_modud)
+
 #undef DO_VDIV_VMOD
 
 #undef GEN_VR_LDX
-- 
2.31.1



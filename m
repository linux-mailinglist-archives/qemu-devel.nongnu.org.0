Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE824ECE2C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 22:42:17 +0200 (CEST)
Received: from localhost ([::1]:38996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZf8y-0005TF-7K
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 16:42:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZeuW-0004no-6L; Wed, 30 Mar 2022 16:27:20 -0400
Received: from [187.72.171.209] (port=8867 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZeuU-0001WS-Oq; Wed, 30 Mar 2022 16:27:19 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 17:25:46 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C4A948002AF;
 Wed, 30 Mar 2022 17:25:45 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 09/10] target/ppc: Implemented vector module word/doubleword
Date: Wed, 30 Mar 2022 17:25:14 -0300
Message-Id: <20220330202515.66554-10-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
References: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 20:25:46.0287 (UTC)
 FILETIME=[56570BF0:01D84474]
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
Hardware behavior based on mambo.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/insn32.decode            |  5 +++++
 target/ppc/translate/vmx-impl.c.inc | 26 ++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

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
index 62b2fcd45c..ed01d91b87 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3349,6 +3349,27 @@ static void do_vx_diveu_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
     tcg_temp_free_i64(val2);
 }
 
+#define REM_VEC(NAME, SZ, REM)                                          \
+static void do_vx_##NAME(TCGv_##SZ t, TCGv_##SZ a, TCGv_##SZ b)         \
+{                                                                       \
+    TCGv_##SZ zero = tcg_constant_##SZ(0), one = tcg_constant_##SZ(1);  \
+    /*                                                                  \
+     *  If N%0 the instruction used by the backend might deliver        \
+     *  a signal to the process and the hardware returns 0 when         \
+     *  N%0, so if b = 0 return 0%1                                     \
+     */                                                                 \
+    tcg_gen_movcond_##SZ(TCG_COND_EQ, a, b, zero, zero, a);             \
+    tcg_gen_movcond_##SZ(TCG_COND_EQ, b, b, zero, one, b);              \
+    REM(t, a, b);                                                       \
+}
+
+REM_VEC(rem_i32 , i32, tcg_gen_rem_i32)
+REM_VEC(remu_i32, i32, tcg_gen_remu_i32)
+REM_VEC(rem_i64 , i64, tcg_gen_rem_i64)
+REM_VEC(remu_i64, i64, tcg_gen_remu_i64)
+
+#undef REM_VEC
+
 TRANS_VDIV_VMOD(ISA310, VDIVESW, MO_32, do_vx_dives_i32, NULL)
 TRANS_VDIV_VMOD(ISA310, VDIVEUW, MO_32, do_vx_diveu_i32, NULL)
 TRANS_FLAGS2(ISA310, VDIVESD, do_vx_helper, gen_helper_VDIVESD)
@@ -3356,6 +3377,11 @@ TRANS_FLAGS2(ISA310, VDIVEUD, do_vx_helper, gen_helper_VDIVEUD)
 TRANS_FLAGS2(ISA310, VDIVESQ, do_vx_helper, gen_helper_VDIVESQ)
 TRANS_FLAGS2(ISA310, VDIVEUQ, do_vx_helper, gen_helper_VDIVEUQ)
 
+TRANS_VDIV_VMOD(ISA310, VMODSW, MO_32, do_vx_rem_i32 , NULL)
+TRANS_VDIV_VMOD(ISA310, VMODUW, MO_32, do_vx_remu_i32, NULL)
+TRANS_VDIV_VMOD(ISA310, VMODSD, MO_64, NULL, do_vx_rem_i64)
+TRANS_VDIV_VMOD(ISA310, VMODUD, MO_64, NULL, do_vx_remu_i64)
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
-- 
2.31.1



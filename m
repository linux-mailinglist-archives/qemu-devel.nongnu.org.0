Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A27E49B5A9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:05:42 +0100 (CET)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMS4-00056U-Ar
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:05:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLCR-0002QS-Qo; Tue, 25 Jan 2022 07:45:32 -0500
Received: from [187.72.171.209] (port=27856 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLCP-0007gn-MK; Tue, 25 Jan 2022 07:45:27 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 56A288009AB;
 Tue, 25 Jan 2022 09:20:42 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 24/38] tcg/tcg-op-gvec.c: Introduce tcg_gen_gvec_4i
Date: Tue, 25 Jan 2022 09:19:29 -0300
Message-Id: <20220125121943.3269077-25-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:42.0715 (UTC)
 FILETIME=[F8D262B0:01D811E5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, OBFU_UNSUB_UL=1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Following the implementation of tcg_gen_gvec_3i, add a four-vector and
immediate operand expansion method.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 include/tcg/tcg-op-gvec.h |  22 ++++++
 tcg/tcg-op-gvec.c         | 146 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 168 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index da55fed870..28cafbcc5c 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -218,6 +218,25 @@ typedef struct {
     bool write_aofs;
 } GVecGen4;
 
+typedef struct {
+    /*
+     * Expand inline as a 64-bit or 32-bit integer. Only one of these will be
+     * non-NULL.
+     */
+    void (*fni8)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64, int64_t);
+    void (*fni4)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32, int32_t);
+    /* Expand inline with a host vector type.  */
+    void (*fniv)(unsigned, TCGv_vec, TCGv_vec, TCGv_vec, TCGv_vec, int64_t);
+    /* Expand out-of-line helper w/descriptor, data in descriptor.  */
+    gen_helper_gvec_4 *fno;
+    /* The optional opcodes, if any, utilized by .fniv.  */
+    const TCGOpcode *opt_opc;
+    /* The vector element size, if applicable.  */
+    uint8_t vece;
+    /* Prefer i64 to v64.  */
+    bool prefer_i64;
+} GVecGen4i;
+
 void tcg_gen_gvec_2(uint32_t dofs, uint32_t aofs,
                     uint32_t oprsz, uint32_t maxsz, const GVecGen2 *);
 void tcg_gen_gvec_2i(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
@@ -231,6 +250,9 @@ void tcg_gen_gvec_3i(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                      const GVecGen3i *);
 void tcg_gen_gvec_4(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
                     uint32_t oprsz, uint32_t maxsz, const GVecGen4 *);
+void tcg_gen_gvec_4i(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
+                     uint32_t oprsz, uint32_t maxsz, int64_t c,
+                     const GVecGen4i *);
 
 /* Expand a specific vector operation.  */
 
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index ffe55e908f..079a761b04 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -836,6 +836,30 @@ static void expand_4_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     tcg_temp_free_i32(t0);
 }
 
+static void expand_4i_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
+                          uint32_t cofs, uint32_t oprsz, int32_t c,
+                          void (*fni)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32,
+                                      int32_t))
+{
+    TCGv_i32 t0 = tcg_temp_new_i32();
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t3 = tcg_temp_new_i32();
+    uint32_t i;
+
+    for (i = 0; i < oprsz; i += 4) {
+        tcg_gen_ld_i32(t1, cpu_env, aofs + i);
+        tcg_gen_ld_i32(t2, cpu_env, bofs + i);
+        tcg_gen_ld_i32(t3, cpu_env, cofs + i);
+        fni(t0, t1, t2, t3, c);
+        tcg_gen_st_i32(t0, cpu_env, dofs + i);
+    }
+    tcg_temp_free_i32(t3);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t0);
+}
+
 /* Expand OPSZ bytes worth of two-operand operations using i64 elements.  */
 static void expand_2_i64(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
                          bool load_dest, void (*fni)(TCGv_i64, TCGv_i64))
@@ -971,6 +995,30 @@ static void expand_4_i64(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     tcg_temp_free_i64(t0);
 }
 
+static void expand_4i_i64(uint32_t dofs, uint32_t aofs, uint32_t bofs,
+                          uint32_t cofs, uint32_t oprsz, int64_t c,
+                          void (*fni)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64,
+                                      int64_t))
+{
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+    TCGv_i64 t3 = tcg_temp_new_i64();
+    uint32_t i;
+
+    for (i = 0; i < oprsz; i += 8) {
+        tcg_gen_ld_i64(t1, cpu_env, aofs + i);
+        tcg_gen_ld_i64(t2, cpu_env, bofs + i);
+        tcg_gen_ld_i64(t3, cpu_env, cofs + i);
+        fni(t0, t1, t2, t3, c);
+        tcg_gen_st_i64(t0, cpu_env, dofs + i);
+    }
+    tcg_temp_free_i64(t3);
+    tcg_temp_free_i64(t2);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t0);
+}
+
 /* Expand OPSZ bytes worth of two-operand operations using host vectors.  */
 static void expand_2_vec(unsigned vece, uint32_t dofs, uint32_t aofs,
                          uint32_t oprsz, uint32_t tysz, TCGType type,
@@ -1121,6 +1169,35 @@ static void expand_4_vec(unsigned vece, uint32_t dofs, uint32_t aofs,
     tcg_temp_free_vec(t0);
 }
 
+/*
+ * Expand OPSZ bytes worth of four-vector operands and an immediate operand
+ * using host vectors.
+ */
+static void expand_4i_vec(unsigned vece, uint32_t dofs, uint32_t aofs,
+                          uint32_t bofs, uint32_t cofs, uint32_t oprsz,
+                          uint32_t tysz, TCGType type, int64_t c,
+                          void (*fni)(unsigned, TCGv_vec, TCGv_vec,
+                                     TCGv_vec, TCGv_vec, int64_t))
+{
+    TCGv_vec t0 = tcg_temp_new_vec(type);
+    TCGv_vec t1 = tcg_temp_new_vec(type);
+    TCGv_vec t2 = tcg_temp_new_vec(type);
+    TCGv_vec t3 = tcg_temp_new_vec(type);
+    uint32_t i;
+
+    for (i = 0; i < oprsz; i += tysz) {
+        tcg_gen_ld_vec(t1, cpu_env, aofs + i);
+        tcg_gen_ld_vec(t2, cpu_env, bofs + i);
+        tcg_gen_ld_vec(t3, cpu_env, cofs + i);
+        fni(vece, t0, t1, t2, t3, c);
+        tcg_gen_st_vec(t0, cpu_env, dofs + i);
+    }
+    tcg_temp_free_vec(t3);
+    tcg_temp_free_vec(t2);
+    tcg_temp_free_vec(t1);
+    tcg_temp_free_vec(t0);
+}
+
 /* Expand a vector two-operand operation.  */
 void tcg_gen_gvec_2(uint32_t dofs, uint32_t aofs,
                     uint32_t oprsz, uint32_t maxsz, const GVecGen2 *g)
@@ -1533,6 +1610,75 @@ void tcg_gen_gvec_4(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
     }
 }
 
+/* Expand a vector four-operand operation.  */
+void tcg_gen_gvec_4i(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
+                     uint32_t oprsz, uint32_t maxsz, int64_t c,
+                     const GVecGen4i *g)
+{
+    const TCGOpcode *this_list = g->opt_opc ? : vecop_list_empty;
+    const TCGOpcode *hold_list = tcg_swap_vecop_list(this_list);
+    TCGType type;
+    uint32_t some;
+
+    check_size_align(oprsz, maxsz, dofs | aofs | bofs | cofs);
+    check_overlap_4(dofs, aofs, bofs, cofs, maxsz);
+
+    type = 0;
+    if (g->fniv) {
+        type = choose_vector_type(g->opt_opc, g->vece, oprsz, g->prefer_i64);
+    }
+    switch (type) {
+    case TCG_TYPE_V256:
+        /*
+         * Recall that ARM SVE allows vector sizes that are not a
+         * power of 2, but always a multiple of 16.  The intent is
+         * that e.g. size == 80 would be expanded with 2x32 + 1x16.
+         */
+        some = QEMU_ALIGN_DOWN(oprsz, 32);
+        expand_4i_vec(g->vece, dofs, aofs, bofs, cofs, some,
+                      32, TCG_TYPE_V256, c, g->fniv);
+        if (some == oprsz) {
+            break;
+        }
+        dofs += some;
+        aofs += some;
+        bofs += some;
+        cofs += some;
+        oprsz -= some;
+        maxsz -= some;
+        /* fallthru */
+    case TCG_TYPE_V128:
+        expand_4i_vec(g->vece, dofs, aofs, bofs, cofs, oprsz,
+                       16, TCG_TYPE_V128, c, g->fniv);
+        break;
+    case TCG_TYPE_V64:
+        expand_4i_vec(g->vece, dofs, aofs, bofs, cofs, oprsz,
+                      8, TCG_TYPE_V64, c, g->fniv);
+        break;
+
+    case 0:
+        if (g->fni8 && check_size_impl(oprsz, 8)) {
+            expand_4i_i64(dofs, aofs, bofs, cofs, oprsz, c, g->fni8);
+        } else if (g->fni4 && check_size_impl(oprsz, 4)) {
+            expand_4i_i32(dofs, aofs, bofs, cofs, oprsz, c, g->fni4);
+        } else {
+            assert(g->fno != NULL);
+            tcg_gen_gvec_4_ool(dofs, aofs, bofs, cofs,
+                               oprsz, maxsz, c, g->fno);
+            oprsz = maxsz;
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+    tcg_swap_vecop_list(hold_list);
+
+    if (oprsz < maxsz) {
+        expand_clr(dofs + oprsz, maxsz - oprsz);
+    }
+}
+
 /*
  * Expand specific vector operations.
  */
-- 
2.25.1



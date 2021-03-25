Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1E5348746
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 04:02:33 +0100 (CET)
Received: from localhost ([::1]:57480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGGW-0008ML-RJ
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 23:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4y-0003K7-Ri
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:36 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:22854)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4o-0002jd-SS
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616640626; x=1648176626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MQvBHyV3nhqceEI/8zCslbJOlH2t0wbftP/VFdurkzM=;
 b=EgL333aR5FqED7vHspQss4ppQqnMqqmU0cG1bo068DH9pjyRobGwEB+Z
 g/WNnWKf3NqtZbdqaZSu/cQeB7pSJzl9u0ve5QNJtfyK42d7vDE8I/Eb7
 9kKxhKBGlBDtCEOIxeVoelmpdDROwBmrNpE8FxQdLKeJQaB3iHcDo8pnZ 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Mar 2021 19:50:14 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 24 Mar 2021 19:50:13 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 11978172B; Wed, 24 Mar 2021 21:50:12 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/15] Hexagon (target/hexagon) circular addressing
Date: Wed, 24 Mar 2021 21:50:06 -0500
Message-Id: <1616640610-17319-12-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following instructions are added
    L2_loadrub_pci          Rd32 = memub(Rx32++#s4:0:circ(Mu2))
    L2_loadrb_pci           Rd32 = memb(Rx32++#s4:0:circ(Mu2))
    L2_loadruh_pci          Rd32 = memuh(Rx32++#s4:1:circ(Mu2))
    L2_loadrh_pci           Rd32 = memh(Rx32++#s4:1:circ(Mu2))
    L2_loadri_pci           Rd32 = memw(Rx32++#s4:2:circ(Mu2))
    L2_loadrd_pci           Rdd32 = memd(Rx32++#s4:3:circ(Mu2))
    S2_storerb_pci          memb(Rx32++#s4:0:circ(Mu2)) = Rt32
    S2_storerh_pci          memh(Rx32++#s4:1:circ(Mu2)) = Rt32
    S2_storerf_pci          memh(Rx32++#s4:1:circ(Mu2)) = Rt.H32
    S2_storeri_pci          memw(Rx32++#s4:2:circ(Mu2)) = Rt32
    S2_storerd_pci          memd(Rx32++#s4:3:circ(Mu2)) = Rtt32
    S2_storerbnew_pci       memb(Rx32++#s4:0:circ(Mu2)) = Nt8.new
    S2_storerhnew_pci       memw(Rx32++#s4:1:circ(Mu2)) = Nt8.new
    S2_storerinew_pci       memw(Rx32++#s4:2:circ(Mu2)) = Nt8.new
    L2_loadrub_pcr          Rd32 = memub(Rx32++I:circ(Mu2))
    L2_loadrb_pcr           Rd32 = memb(Rx32++I:circ(Mu2))
    L2_loadruh_pcr          Rd32 = memuh(Rx32++I:circ(Mu2))
    L2_loadrh_pcr           Rd32 = memh(Rx32++I:circ(Mu2))
    L2_loadri_pcr           Rd32 = memw(Rx32++I:circ(Mu2))
    L2_loadrd_pcr           Rdd32 = memd(Rx32++I:circ(Mu2))
    S2_storerb_pcr          memb(Rx32++I:circ(Mu2)) = Rt32
    S2_storerh_pcr          memh(Rx32++I:circ(Mu2)) = Rt32
    S2_storerf_pcr          memh(Rx32++I:circ(Mu2)) = Rt32.H32
    S2_storeri_pcr          memw(Rx32++I:circ(Mu2)) = Rt32
    S2_storerd_pcr          memd(Rx32++I:circ(Mu2)) = Rtt32
    S2_storerbnew_pcr       memb(Rx32++I:circ(Mu2)) = Nt8.new
    S2_storerhnew_pcr       memh(Rx32++I:circ(Mu2)) = Nt8.new
    S2_storerinew_pcr       memw(Rx32++I:circ(Mu2)) = Nt8.new

Test cases in tests/tcg/hexagon/circ.c

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/gen_tcg.h              | 127 +++++++++++
 target/hexagon/genptr.c               |  85 ++++++++
 target/hexagon/imported/encode_pp.def |   9 +
 target/hexagon/imported/ldst.idef     |   4 +
 target/hexagon/imported/macros.def    |  26 +++
 target/hexagon/macros.h               |  87 ++++++++
 tests/tcg/hexagon/Makefile.target     |   1 +
 tests/tcg/hexagon/circ.c              | 393 ++++++++++++++++++++++++++++++++++
 8 files changed, 732 insertions(+)
 create mode 100644 tests/tcg/hexagon/circ.c

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index 0b2c2ca..2d64590 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -38,6 +38,8 @@
  *     _ap       absolute set                      r0 = memw(r1=##variable)
  *     _pr       post increment register           r0 = memw(r1++m1)
  *     _pi       post increment immediate          r0 = memb(r1++#1)
+ *     _pci      post increment circular immediate r0 = memw(r1++#4:circ(m0))
+ *     _pcr      post increment circular register  r0 = memw(r1++I:circ(m0))
  */
 
 /* Macros for complex addressing modes */
@@ -56,7 +58,28 @@
         fEA_REG(RxV); \
         fPM_I(RxV, siV); \
     } while (0)
+#define GET_EA_pci \
+    do { \
+        fEA_REG(RxV); \
+        fPM_CIRI(RxV, siV, MuV); \
+    } while (0)
+#define GET_EA_pcr(SHIFT) \
+    do { \
+        fEA_REG(RxV); \
+        fPM_CIRR(RxV, fREAD_IREG(MuV, (SHIFT)), MuV); \
+    } while (0)
 
+/*
+ * Many instructions will work with just macro redefinitions
+ * with the caveat that they need a tmp variable to carry a
+ * value between them.
+ */
+#define fGEN_TCG_tmp(SHORTCODE) \
+    do { \
+        TCGv tmp = tcg_temp_new(); \
+        SHORTCODE; \
+        tcg_temp_free(tmp); \
+    } while (0)
 
 /* Instructions with multiple definitions */
 #define fGEN_TCG_LOAD_AP(RES, SIZE, SIGN) \
@@ -80,6 +103,44 @@
 #define fGEN_TCG_L4_loadrd_ap(SHORTCODE) \
     fGEN_TCG_LOAD_AP(RddV, 8, u)
 
+#define fGEN_TCG_L2_loadrub_pci(SHORTCODE) \
+      fGEN_TCG_tmp(SHORTCODE)
+#define fGEN_TCG_L2_loadrb_pci(SHORTCODE) \
+      fGEN_TCG_tmp(SHORTCODE)
+#define fGEN_TCG_L2_loadruh_pci(SHORTCODE) \
+      fGEN_TCG_tmp(SHORTCODE)
+#define fGEN_TCG_L2_loadrh_pci(SHORTCODE) \
+      fGEN_TCG_tmp(SHORTCODE)
+#define fGEN_TCG_L2_loadri_pci(SHORTCODE) \
+      fGEN_TCG_tmp(SHORTCODE)
+#define fGEN_TCG_L2_loadrd_pci(SHORTCODE) \
+      fGEN_TCG_tmp(SHORTCODE)
+
+#define fGEN_TCG_PCR(SHIFT, LOAD) \
+    do { \
+        TCGv ireg = tcg_temp_new(); \
+        TCGv tmp = tcg_temp_new(); \
+        fEA_REG(RxV); \
+        fREAD_IREG(MuV, SHIFT); \
+        gen_helper_fcircadd(RxV, RxV, ireg, MuV, fREAD_CSREG(MuN)); \
+        LOAD; \
+        tcg_temp_free(tmp); \
+        tcg_temp_free(ireg); \
+    } while (0)
+
+#define fGEN_TCG_L2_loadrub_pcr(SHORTCODE) \
+      fGEN_TCG_PCR(0, fLOAD(1, 1, u, EA, RdV))
+#define fGEN_TCG_L2_loadrb_pcr(SHORTCODE) \
+      fGEN_TCG_PCR(0, fLOAD(1, 1, s, EA, RdV))
+#define fGEN_TCG_L2_loadruh_pcr(SHORTCODE) \
+      fGEN_TCG_PCR(1, fLOAD(1, 2, u, EA, RdV))
+#define fGEN_TCG_L2_loadrh_pcr(SHORTCODE) \
+      fGEN_TCG_PCR(1, fLOAD(1, 2, s, EA, RdV))
+#define fGEN_TCG_L2_loadri_pcr(SHORTCODE) \
+      fGEN_TCG_PCR(2, fLOAD(1, 4, u, EA, RdV))
+#define fGEN_TCG_L2_loadrd_pcr(SHORTCODE) \
+      fGEN_TCG_PCR(3, fLOAD(1, 8, u, EA, RddV))
+
 #define fGEN_TCG_L2_loadrub_pr(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrub_pi(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrb_pr(SHORTCODE)       SHORTCODE
@@ -195,6 +256,72 @@
 #define fGEN_TCG_S4_stored_locked(SHORTCODE) \
     do { SHORTCODE; READ_PREG(PdV, PdN); } while (0)
 
+#define fGEN_TCG_STORE(SHORTCODE) \
+    do { \
+        TCGv HALF = tcg_temp_new(); \
+        TCGv BYTE = tcg_temp_new(); \
+        TCGv tmp = tcg_temp_new(); \
+        SHORTCODE; \
+        tcg_temp_free(HALF); \
+        tcg_temp_free(BYTE); \
+        tcg_temp_free(tmp); \
+    } while (0)
+
+#define fGEN_TCG_STORE_pcr(SHIFT, STORE) \
+    do { \
+        TCGv ireg = tcg_temp_new(); \
+        TCGv HALF = tcg_temp_new(); \
+        TCGv BYTE = tcg_temp_new(); \
+        TCGv tmp = tcg_temp_new(); \
+        fEA_REG(RxV); \
+        fPM_CIRR(RxV, fREAD_IREG(MuV, SHIFT), MuV); \
+        STORE; \
+        tcg_temp_free(ireg); \
+        tcg_temp_free(HALF); \
+        tcg_temp_free(BYTE); \
+        tcg_temp_free(tmp); \
+    } while (0)
+
+#define fGEN_TCG_S2_storerb_pci(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
+#define fGEN_TCG_S2_storerb_pcr(SHORTCODE) \
+    fGEN_TCG_STORE_pcr(0, fSTORE(1, 1, EA, fGETBYTE(0, RtV)))
+
+#define fGEN_TCG_S2_storerh_pci(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
+#define fGEN_TCG_S2_storerh_pcr(SHORTCODE) \
+    fGEN_TCG_STORE_pcr(1, fSTORE(1, 2, EA, fGETHALF(0, RtV)))
+
+#define fGEN_TCG_S2_storerf_pci(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
+#define fGEN_TCG_S2_storerf_pcr(SHORTCODE) \
+    fGEN_TCG_STORE_pcr(1, fSTORE(1, 2, EA, fGETHALF(1, RtV)))
+
+#define fGEN_TCG_S2_storeri_pci(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
+#define fGEN_TCG_S2_storeri_pcr(SHORTCODE) \
+    fGEN_TCG_STORE_pcr(2, fSTORE(1, 4, EA, RtV))
+
+#define fGEN_TCG_S2_storerd_pci(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
+#define fGEN_TCG_S2_storerd_pcr(SHORTCODE) \
+    fGEN_TCG_STORE_pcr(3, fSTORE(1, 8, EA, RttV))
+
+#define fGEN_TCG_S2_storerbnew_pci(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
+#define fGEN_TCG_S2_storerbnew_pcr(SHORTCODE) \
+    fGEN_TCG_STORE_pcr(0, fSTORE(1, 1, EA, fGETBYTE(0, NtN)))
+
+#define fGEN_TCG_S2_storerhnew_pci(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
+#define fGEN_TCG_S2_storerhnew_pcr(SHORTCODE) \
+    fGEN_TCG_STORE_pcr(1, fSTORE(1, 2, EA, fGETHALF(0, NtN)))
+
+#define fGEN_TCG_S2_storerinew_pci(SHORTCODE) \
+    fGEN_TCG_STORE(SHORTCODE)
+#define fGEN_TCG_S2_storerinew_pcr(SHORTCODE) \
+    fGEN_TCG_STORE_pcr(2, fSTORE(1, 4, EA, NtN))
+
 /*
  * Mathematical operations with more than one definition require
  * special handling
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index a382664..aaa2901 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -27,6 +27,12 @@
 #include "macros.h"
 #include "gen_tcg.h"
 
+static inline TCGv gen_read_reg(TCGv result, int num)
+{
+    tcg_gen_mov_tl(result, hex_gpr[num]);
+    return result;
+}
+
 static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
 {
     tcg_gen_mov_tl(pred, hex_pred[num]);
@@ -292,6 +298,16 @@ static inline TCGv gen_get_byte_i64(TCGv result, int N, TCGv_i64 src, bool sign)
     return result;
 }
 
+static inline TCGv gen_get_half(TCGv result, int N, TCGv src, bool sign)
+{
+    if (sign) {
+        tcg_gen_sextract_tl(result, src, N * 16, 16);
+    } else {
+        tcg_gen_extract_tl(result, src, N * 16, 16);
+    }
+    return result;
+}
+
 static inline void gen_set_byte(int N, TCGv result, TCGv src)
 {
     tcg_gen_deposit_tl(result, result, src, N * 8, 8);
@@ -404,6 +420,75 @@ static inline void gen_store_conditional8(CPUHexagonState *env,
     tcg_gen_movi_tl(hex_llsc_addr, ~0);
 }
 
+static inline void gen_store32(TCGv vaddr, TCGv src, int width, int slot)
+{
+    tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
+    tcg_gen_movi_tl(hex_store_width[slot], width);
+    tcg_gen_mov_tl(hex_store_val32[slot], src);
+}
+
+static inline void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src,
+                              DisasContext *ctx, int slot)
+{
+    gen_store32(vaddr, src, 1, slot);
+    ctx->store_width[slot] = 1;
+}
+
+static inline void gen_store1i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
+                               DisasContext *ctx, int slot)
+{
+    TCGv tmp = tcg_const_tl(src);
+    gen_store1(cpu_env, vaddr, tmp, ctx, slot);
+    tcg_temp_free(tmp);
+}
+
+static inline void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src,
+                              DisasContext *ctx, int slot)
+{
+    gen_store32(vaddr, src, 2, slot);
+    ctx->store_width[slot] = 2;
+}
+
+static inline void gen_store2i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
+                               DisasContext *ctx, int slot)
+{
+    TCGv tmp = tcg_const_tl(src);
+    gen_store2(cpu_env, vaddr, tmp, ctx, slot);
+    tcg_temp_free(tmp);
+}
+
+static inline void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src,
+                              DisasContext *ctx, int slot)
+{
+    gen_store32(vaddr, src, 4, slot);
+    ctx->store_width[slot] = 4;
+}
+
+static inline void gen_store4i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
+                               DisasContext *ctx, int slot)
+{
+    TCGv tmp = tcg_const_tl(src);
+    gen_store4(cpu_env, vaddr, tmp, ctx, slot);
+    tcg_temp_free(tmp);
+}
+
+static inline void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src,
+                              DisasContext *ctx, int slot)
+{
+    tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
+    tcg_gen_movi_tl(hex_store_width[slot], 8);
+    tcg_gen_mov_i64(hex_store_val64[slot], src);
+    ctx->store_width[slot] = 8;
+}
+
+static inline void gen_store8i(TCGv_env cpu_env, TCGv vaddr, int64_t src,
+                               DisasContext *ctx, int slot)
+{
+    TCGv_i64 tmp = tcg_const_i64(src);
+    gen_store8(cpu_env, vaddr, tmp, ctx, slot);
+    tcg_temp_free_i64(tmp);
+}
+
 static inline TCGv_i64 gen_carry_from_add64(TCGv_i64 result, TCGv_i64 a,
                                             TCGv_i64 b, TCGv_i64 c)
 {
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index 514c240..c97219f 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -294,6 +294,7 @@ DEF_CLASS32(ICLASS_LD" ---- -------- PP------ --------",LD)
 
 
 DEF_CLASS32(ICLASS_LD" 0--- -------- PP------ --------",LD_ADDR_ROFFSET)
+DEF_CLASS32(ICLASS_LD" 100- -------- PP----0- --------",LD_ADDR_POST_CIRC_IMMED)
 DEF_CLASS32(ICLASS_LD" 101- -------- PP00---- --------",LD_ADDR_POST_IMMED)
 DEF_CLASS32(ICLASS_LD" 101- -------- PP01---- --------",LD_ADDR_ABS_UPDATE_V4)
 DEF_CLASS32(ICLASS_LD" 101- -------- PP1----- --------",LD_ADDR_POST_IMMED_PRED_V2)
@@ -308,18 +309,22 @@ DEF_FIELD32(ICLASS_LD" ---- --!----- PP------ --------",LD_UN,"Unsigned")
 
 #define STD_LD_ENC(TAG,OPC) \
 DEF_ENC32(L2_load##TAG##_io,   ICLASS_LD" 0 ii "OPC"  sssss  PPiiiiii  iiiddddd")\
+DEF_ENC32(L2_load##TAG##_pci,  ICLASS_LD" 1 00 "OPC"  xxxxx  PPu0--0i  iiiddddd")\
 DEF_ENC32(L2_load##TAG##_pi,   ICLASS_LD" 1 01 "OPC"  xxxxx  PP00---i  iiiddddd")\
 DEF_ENC32(L4_load##TAG##_ap,   ICLASS_LD" 1 01 "OPC"  eeeee  PP01IIII  -IIddddd")\
 DEF_ENC32(L2_load##TAG##_pr,   ICLASS_LD" 1 10 "OPC"  xxxxx  PPu0----  0--ddddd")\
 DEF_ENC32(L4_load##TAG##_ur,   ICLASS_LD" 1 10 "OPC"  ttttt  PPi1IIII  iIIddddd")\
+DEF_ENC32(L2_load##TAG##_pcr,  ICLASS_LD" 1 00 "OPC"  xxxxx  PPu0--1-  0--ddddd")\
 
 
 #define STD_LDX_ENC(TAG,OPC) \
 DEF_ENC32(L2_load##TAG##_io,   ICLASS_LD" 0 ii "OPC"  sssss  PPiiiiii  iiiyyyyy")\
+DEF_ENC32(L2_load##TAG##_pci,  ICLASS_LD" 1 00 "OPC"  xxxxx  PPu0--0i  iiiyyyyy")\
 DEF_ENC32(L2_load##TAG##_pi,   ICLASS_LD" 1 01 "OPC"  xxxxx  PP00---i  iiiyyyyy")\
 DEF_ENC32(L4_load##TAG##_ap,   ICLASS_LD" 1 01 "OPC"  eeeee  PP01IIII  -IIyyyyy")\
 DEF_ENC32(L2_load##TAG##_pr,   ICLASS_LD" 1 10 "OPC"  xxxxx  PPu0----  0--yyyyy")\
 DEF_ENC32(L4_load##TAG##_ur,   ICLASS_LD" 1 10 "OPC"  ttttt  PPi1IIII  iIIyyyyy")\
+DEF_ENC32(L2_load##TAG##_pcr,  ICLASS_LD" 1 00 "OPC"  xxxxx  PPu0--1-  0--yyyyy")\
 
 
 #define STD_PLD_ENC(TAG,OPC) \
@@ -351,6 +356,7 @@ STD_PLD_ENC(rd,  "1 110") /* note dest reg field LSB=0, 1 is reserved */
 
 DEF_CLASS32(    ICLASS_LD" 0--0 000----- PP------ --------",LD_MISC)
 DEF_ANTICLASS32(ICLASS_LD" 0--0 000----- PP------ --------",LD_ADDR_ROFFSET)
+DEF_ANTICLASS32(ICLASS_LD" 1000 000----- PP------ --------",LD_ADDR_POST_CIRC_IMMED)
 DEF_ANTICLASS32(ICLASS_LD" 1010 000----- PP------ --------",LD_ADDR_POST_IMMED)
 DEF_ANTICLASS32(ICLASS_LD" 1100 000----- PP------ --------",LD_ADDR_POST_REG)
 DEF_ANTICLASS32(ICLASS_LD" 1110 000----- PP------ --------",LD_ADDR_POST_REG)
@@ -397,6 +403,7 @@ DEF_FIELD32(ICLASS_ST" ---! !!------ PP------ --------",ST_Type,"Type")
 DEF_FIELD32(ICLASS_ST" ---- --!----- PP------ --------",ST_UN,"Unsigned")
 
 DEF_CLASS32(ICLASS_ST" 0--1 -------- PP------ --------",ST_ADDR_ROFFSET)
+DEF_CLASS32(ICLASS_ST" 1001 -------- PP------ ------0-",ST_ADDR_POST_CIRC_IMMED)
 DEF_CLASS32(ICLASS_ST" 1011 -------- PP0----- 0-----0-",ST_ADDR_POST_IMMED)
 DEF_CLASS32(ICLASS_ST" 1011 -------- PP0----- 1-------",ST_ADDR_ABS_UPDATE_V4)
 DEF_CLASS32(ICLASS_ST" 1011 -------- PP1----- --------",ST_ADDR_POST_IMMED_PRED_V2)
@@ -411,10 +418,12 @@ DEF_CLASS32(ICLASS_ST" 0--0 0------- PP------ --------",ST_MISC_CACHEOP)
 
 #define STD_ST_ENC(TAG,OPC,SRC) \
 DEF_ENC32(S2_store##TAG##_io,   ICLASS_ST" 0 ii "OPC"  sssss  PPi"SRC"  iiiiiiii")\
+DEF_ENC32(S2_store##TAG##_pci,  ICLASS_ST" 1 00 "OPC"  xxxxx  PPu"SRC"  0iiii-0-")\
 DEF_ENC32(S2_store##TAG##_pi,   ICLASS_ST" 1 01 "OPC"  xxxxx  PP0"SRC"  0iiii-0-")\
 DEF_ENC32(S4_store##TAG##_ap,   ICLASS_ST" 1 01 "OPC"  eeeee  PP0"SRC"  1-IIIIII")\
 DEF_ENC32(S2_store##TAG##_pr,   ICLASS_ST" 1 10 "OPC"  xxxxx  PPu"SRC"  0-------")\
 DEF_ENC32(S4_store##TAG##_ur,   ICLASS_ST" 1 10 "OPC"  uuuuu  PPi"SRC"  1iIIIIII")\
+DEF_ENC32(S2_store##TAG##_pcr,  ICLASS_ST" 1 00 "OPC"  xxxxx  PPu"SRC"  0-----1-")\
 
 
 #define STD_PST_ENC(TAG,OPC,SRC) \
diff --git a/target/hexagon/imported/ldst.idef b/target/hexagon/imported/ldst.idef
index 78a2ea4..6ce0635 100644
--- a/target/hexagon/imported/ldst.idef
+++ b/target/hexagon/imported/ldst.idef
@@ -26,6 +26,8 @@ Q6INSN(L4_##TAG##_ur,  OPER"(Rt32<<#u2+#U6)",             ATTRIB,DESCR,{fMUST_IM
 Q6INSN(L4_##TAG##_ap,  OPER"(Re32=#U6)",                  ATTRIB,DESCR,{fMUST_IMMEXT(UiV); fEA_IMM(UiV); SEMANTICS; ReV=UiV; })\
 Q6INSN(L2_##TAG##_pr,  OPER"(Rx32++Mu2)",                 ATTRIB,DESCR,{fEA_REG(RxV); fPM_M(RxV,MuV); SEMANTICS;})\
 Q6INSN(L2_##TAG##_pi,  OPER"(Rx32++#s4:"SHFT")",          ATTRIB,DESCR,{fEA_REG(RxV); fPM_I(RxV,siV); SEMANTICS;})\
+Q6INSN(L2_##TAG##_pci, OPER"(Rx32++#s4:"SHFT":circ(Mu2))",ATTRIB,DESCR,{fEA_REG(RxV); fPM_CIRI(RxV,siV,MuV); SEMANTICS;})\
+Q6INSN(L2_##TAG##_pcr, OPER"(Rx32++I:circ(Mu2))",  ATTRIB,DESCR,{fEA_REG(RxV); fPM_CIRR(RxV,fREAD_IREG(MuV)<<SCALE,MuV); SEMANTICS;})
 
 /* The set of 32-bit load instructions */
 STD_LD_AMODES(loadrub,"Rd32=memub","Load Unsigned Byte",ATTRIBS(A_LOAD),"0",fLOAD(1,1,u,EA,RdV),0)
@@ -42,6 +44,8 @@ Q6INSN(S2_##TAG##_pi,  OPER"(Rx32++#s4:"SHFT")="DEST,     ATTRIB,DESCR,{fEA_REG(
 Q6INSN(S4_##TAG##_ap,  OPER"(Re32=#U6)="DEST,             ATTRIB,DESCR,{fMUST_IMMEXT(UiV); fEA_IMM(UiV); SEMANTICS; ReV=UiV; })\
 Q6INSN(S2_##TAG##_pr,  OPER"(Rx32++Mu2)="DEST,            ATTRIB,DESCR,{fEA_REG(RxV); fPM_M(RxV,MuV); SEMANTICS; })\
 Q6INSN(S4_##TAG##_ur,  OPER"(Ru32<<#u2+#U6)="DEST,            ATTRIB,DESCR,{fMUST_IMMEXT(UiV); fEA_IRs(UiV,RuV,uiV); SEMANTICS;})\
+Q6INSN(S2_##TAG##_pci, OPER"(Rx32++#s4:"SHFT":circ(Mu2))="DEST,  ATTRIB,DESCR,{fEA_REG(RxV); fPM_CIRI(RxV,siV,MuV); SEMANTICS;})\
+Q6INSN(S2_##TAG##_pcr, OPER"(Rx32++I:circ(Mu2))="DEST,  ATTRIB,DESCR,{fEA_REG(RxV); fPM_CIRR(RxV,fREAD_IREG(MuV)<<SCALE,MuV); SEMANTICS;})
 
 
 /* The set of 32-bit store instructions */
diff --git a/target/hexagon/imported/macros.def b/target/hexagon/imported/macros.def
index 65292c7..25f57b6 100755
--- a/target/hexagon/imported/macros.def
+++ b/target/hexagon/imported/macros.def
@@ -277,6 +277,12 @@ DEF_MACRO(
 /*************************************/
 
 DEF_MACRO(
+    fREAD_IREG, /* read modifier register */
+    (fSXTN(11,64,(((VAL) & 0xf0000000)>>21) | ((VAL>>17)&0x7f) )),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
     fREAD_LR, /* read link register */
     (READ_RREG(REG_LR)),          /* behavior */
     ()
@@ -307,6 +313,12 @@ DEF_MACRO(
 )
 
 DEF_MACRO(
+    fREAD_CSREG, /* read  CS register */
+    (READ_RREG(REG_CSA+N)),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
     fREAD_LC0, /* read loop count */
     (READ_RREG(REG_LC0)),          /* behavior */
     ()
@@ -825,6 +837,20 @@ DEF_MACRO(
 )
 
 DEF_MACRO(
+    fPM_CIRI, /* Post Modify Register using Circular arithmetic by Immediate */
+    do { fcirc_add(REG,siV,MuV); } while (0),
+    ()
+)
+
+DEF_MACRO(
+    fPM_CIRR, /* Post Modify Register using Circular arithmetic by register */
+    do { fcirc_add(REG,VAL,MuV); } while (0),
+    ()
+)
+
+
+
+DEF_MACRO(
     fSCALE, /* scale by N */
     (((size8s_t)(A))<<N),
     /* optional attributes */
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index 123c995..3fed518 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -133,6 +133,38 @@
         CHECK_NOSHUF; \
         tcg_gen_qemu_ld64(DST, VA, ctx->mem_idx); \
     } while (0)
+
+#define MEM_STORE1_FUNC(X) \
+    __builtin_choose_expr(TYPE_INT(X), \
+        gen_store1i, \
+        __builtin_choose_expr(TYPE_TCGV(X), \
+            gen_store1, (void)0))
+#define MEM_STORE1(VA, DATA, SLOT) \
+    MEM_STORE1_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)
+
+#define MEM_STORE2_FUNC(X) \
+    __builtin_choose_expr(TYPE_INT(X), \
+        gen_store2i, \
+        __builtin_choose_expr(TYPE_TCGV(X), \
+            gen_store2, (void)0))
+#define MEM_STORE2(VA, DATA, SLOT) \
+    MEM_STORE2_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)
+
+#define MEM_STORE4_FUNC(X) \
+    __builtin_choose_expr(TYPE_INT(X), \
+        gen_store4i, \
+        __builtin_choose_expr(TYPE_TCGV(X), \
+            gen_store4, (void)0))
+#define MEM_STORE4(VA, DATA, SLOT) \
+    MEM_STORE4_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)
+
+#define MEM_STORE8_FUNC(X) \
+    __builtin_choose_expr(TYPE_INT(X), \
+        gen_store8i, \
+        __builtin_choose_expr(TYPE_TCGV_I64(X), \
+            gen_store8, (void)0))
+#define MEM_STORE8(VA, DATA, SLOT) \
+    MEM_STORE8_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)
 #else
 #define MEM_LOAD1s(VA) ((int8_t)mem_load1(env, slot, VA))
 #define MEM_LOAD1u(VA) ((uint8_t)mem_load1(env, slot, VA))
@@ -293,12 +325,48 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
 
 #define fPCALIGN(IMM) IMM = (IMM & ~PCALIGN_MASK)
 
+#ifdef QEMU_GENERATE
+static inline TCGv gen_read_ireg(TCGv result, TCGv val, int shift)
+{
+    /*
+     * Section 2.2.4 of the Hexagon V67 Programmer's Reference Manual
+     *
+     *  The "I" value from a modifier register is divided into two pieces
+     *      LSB         bits 23:17
+     *      MSB         bits 31:28
+     * At the end we shift the result according to the shift argument
+     */
+    TCGv msb = tcg_temp_new();
+    TCGv lsb = tcg_temp_new();
+
+    tcg_gen_extract_tl(lsb, val, 17, 7);
+    tcg_gen_extract_tl(msb, val, 28, 4);
+    tcg_gen_movi_tl(result, 0);
+    tcg_gen_deposit_tl(result, result, lsb, 0, 7);
+    tcg_gen_deposit_tl(result, result, msb, 7, 4);
+
+    tcg_gen_shli_tl(result, result, shift);
+
+    tcg_temp_free(msb);
+    tcg_temp_free(lsb);
+
+    return result;
+}
+#define fREAD_IREG(VAL, SHIFT) gen_read_ireg(ireg, (VAL), (SHIFT))
+#else
+#define fREAD_IREG(VAL) \
+    (fSXTN(11, 64, (((VAL) & 0xf0000000) >> 21) | ((VAL >> 17) & 0x7f)))
+#endif
+
 #define fREAD_LR() (READ_REG(HEX_REG_LR))
 
 #define fWRITE_LR(A) WRITE_RREG(HEX_REG_LR, A)
 #define fWRITE_FP(A) WRITE_RREG(HEX_REG_FP, A)
 #define fWRITE_SP(A) WRITE_RREG(HEX_REG_SP, A)
 
+#ifdef QEMU_GENERATE
+#define fREAD_CSREG(N) (READ_REG(tmp, HEX_REG_CS0 + N))
+#else
 #define fREAD_SP() (READ_REG(HEX_REG_SP))
 #define fREAD_LC0 (READ_REG(HEX_REG_LC0))
 #define fREAD_LC1 (READ_REG(HEX_REG_LC1))
@@ -313,6 +381,7 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
 #define fREAD_GP() READ_REG(HEX_REG_GP)
 #endif
 #define fREAD_PC() (READ_REG(HEX_REG_PC))
+#endif
 
 #define fREAD_NPC() (env->next_PC & (0xfffffffe))
 
@@ -426,6 +495,14 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
 #define fEA_REG(REG) tcg_gen_mov_tl(EA, REG)
 #define fPM_I(REG, IMM)     tcg_gen_addi_tl(REG, REG, IMM)
 #define fPM_M(REG, MVAL)    tcg_gen_add_tl(REG, REG, MVAL)
+#define fPM_CIRI(REG, IMM, MVAL) \
+    do { \
+        TCGv tcgv_siV = tcg_const_tl(siV); \
+        gen_helper_fcircadd(REG, REG, tcgv_siV, MuV, fREAD_CSREG(MuN)); \
+        tcg_temp_free(tcgv_siV); \
+    } while (0)
+#define fPM_CIRR(REG, VAL, MVAL) \
+    gen_helper_fcircadd(REG, REG, VAL, MuV, fREAD_CSREG(MuN))
 #else
 #define fEA_IMM(IMM)        do { EA = (IMM); } while (0)
 #define fEA_REG(REG)        do { EA = (REG); } while (0)
@@ -502,7 +579,11 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
     gen_load_locked##SIZE##SIGN(DST, EA, ctx->mem_idx);
 #endif
 
+#ifdef QEMU_GENERATE
+#define fSTORE(NUM, SIZE, EA, SRC) MEM_STORE##SIZE(EA, SRC, insn->slot)
+#else
 #define fSTORE(NUM, SIZE, EA, SRC) MEM_STORE##SIZE(EA, SRC, slot)
+#endif
 
 #ifdef QEMU_GENERATE
 #define fSTORE_LOCKED(NUM, SIZE, EA, SRC, PRED) \
@@ -536,8 +617,14 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
         (((uint64_t)((VAL) & 0x0ffLL)) << ((N) * 8)); \
     } while (0)
 #endif
+
+#ifdef QEMU_GENERATE
+#define fGETHALF(N, SRC)  gen_get_half(HALF, N, SRC, true)
+#define fGETUHALF(N, SRC) gen_get_half(HALF, N, SRC, false)
+#else
 #define fGETHALF(N, SRC) ((int16_t)((SRC >> ((N) * 16)) & 0xffff))
 #define fGETUHALF(N, SRC) ((uint16_t)((SRC >> ((N) * 16)) & 0xffff))
+#endif
 #define fSETHALF(N, DST, VAL) \
     do { \
         DST = (DST & ~(0x0ffffLL << ((N) * 16))) | \
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 18218ad..81f73c0 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -41,6 +41,7 @@ HEX_TESTS += preg_alias
 HEX_TESTS += dual_stores
 HEX_TESTS += multi_result
 HEX_TESTS += mem_noshuf
+HEX_TESTS += circ
 HEX_TESTS += atomics
 HEX_TESTS += fpstuff
 
diff --git a/tests/tcg/hexagon/circ.c b/tests/tcg/hexagon/circ.c
new file mode 100644
index 0000000..cffb910
--- /dev/null
+++ b/tests/tcg/hexagon/circ.c
@@ -0,0 +1,393 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <stdio.h>
+
+#define DEBUG          0
+#if DEBUG
+#define DEBUG_PRINTF(...) printf(__VA_ARGS__)
+#else
+#define DEBUG_PRINTF(...) do { } while (0)
+#endif
+
+
+#define NBYTES         (1 << 8)
+#define NHALFS         (NBYTES / sizeof(short))
+#define NWORDS         (NBYTES / sizeof(int))
+#define NDOBLS         (NBYTES / sizeof(long long))
+
+long long     dbuf[NDOBLS] __attribute__((aligned(1 << 12))) = {0};
+int           wbuf[NWORDS] __attribute__((aligned(1 << 12))) = {0};
+short         hbuf[NHALFS] __attribute__((aligned(1 << 12))) = {0};
+unsigned char bbuf[NBYTES] __attribute__((aligned(1 << 12))) = {0};
+
+/*
+ * We use the C preporcessor to deal with the combinations of types
+ */
+
+#define INIT(BUF, N) \
+    void init_##BUF(void) \
+    { \
+        int i; \
+        for (i = 0; i < N; i++) { \
+            BUF[i] = i; \
+        } \
+    } \
+
+INIT(bbuf, NBYTES)
+INIT(hbuf, NHALFS)
+INIT(wbuf, NWORDS)
+INIT(dbuf, NDOBLS)
+
+/*
+ * Macros for performing circular load
+ *     RES         result
+ *     ADDR        address
+ *     START       start address of buffer
+ *     LEN         length of buffer (in bytes)
+ *     INC         address increment (in bytes for IMM, elements for REG)
+ */
+#define CIRC_LOAD_IMM(SIZE, RES, ADDR, START, LEN, INC) \
+    __asm__( \
+        "r4 = %4\n\t" \
+        "m0 = r4\n\t" \
+        "cs0 = %3\n\t" \
+        "%0 = mem" #SIZE "(%1++#" #INC ":circ(M0))\n\t" \
+        : "=r"(RES), "=r"(ADDR) \
+        : "1"(ADDR), "r"(START), "r"(LEN) \
+        : "r4", "m0", "cs0")
+#define CIRC_LOAD_IMM_b(RES, ADDR, START, LEN, INC) \
+    CIRC_LOAD_IMM(b, RES, ADDR, START, LEN, INC)
+#define CIRC_LOAD_IMM_ub(RES, ADDR, START, LEN, INC) \
+    CIRC_LOAD_IMM(ub, RES, ADDR, START, LEN, INC)
+#define CIRC_LOAD_IMM_h(RES, ADDR, START, LEN, INC) \
+    CIRC_LOAD_IMM(h, RES, ADDR, START, LEN, INC)
+#define CIRC_LOAD_IMM_uh(RES, ADDR, START, LEN, INC) \
+    CIRC_LOAD_IMM(uh, RES, ADDR, START, LEN, INC)
+#define CIRC_LOAD_IMM_w(RES, ADDR, START, LEN, INC) \
+    CIRC_LOAD_IMM(w, RES, ADDR, START, LEN, INC)
+#define CIRC_LOAD_IMM_d(RES, ADDR, START, LEN, INC) \
+    CIRC_LOAD_IMM(d, RES, ADDR, START, LEN, INC)
+
+#define CIRC_LOAD_REG(SIZE, RES, ADDR, START, LEN, INC) \
+    __asm__( \
+        "r4 = %3\n\t" \
+        "m1 = r4\n\t" \
+        "cs1 = %4\n\t" \
+        "%0 = mem" #SIZE "(%1++I:circ(M1))\n\t" \
+        : "=r"(RES), "=r"(ADDR) \
+        : "1"(ADDR), "r"((((INC) & 0x7f) << 17) | ((LEN) & 0x1ffff)), \
+          "r"(START) \
+        : "r4", "m1", "cs1")
+#define CIRC_LOAD_REG_b(RES, ADDR, START, LEN, INC) \
+    CIRC_LOAD_REG(b, RES, ADDR, START, LEN, INC)
+#define CIRC_LOAD_REG_ub(RES, ADDR, START, LEN, INC) \
+    CIRC_LOAD_REG(ub, RES, ADDR, START, LEN, INC)
+#define CIRC_LOAD_REG_h(RES, ADDR, START, LEN, INC) \
+    CIRC_LOAD_REG(h, RES, ADDR, START, LEN, INC)
+#define CIRC_LOAD_REG_uh(RES, ADDR, START, LEN, INC) \
+    CIRC_LOAD_REG(uh, RES, ADDR, START, LEN, INC)
+#define CIRC_LOAD_REG_w(RES, ADDR, START, LEN, INC) \
+    CIRC_LOAD_REG(w, RES, ADDR, START, LEN, INC)
+#define CIRC_LOAD_REG_d(RES, ADDR, START, LEN, INC) \
+    CIRC_LOAD_REG(d, RES, ADDR, START, LEN, INC)
+
+/*
+ * Macros for performing circular store
+ *     VAL         value to store
+ *     ADDR        address
+ *     START       start address of buffer
+ *     LEN         length of buffer (in bytes)
+ *     INC         address increment (in bytes for IMM, elements for REG)
+ */
+#define CIRC_STORE_IMM(SIZE, PART, VAL, ADDR, START, LEN, INC) \
+    __asm__( \
+        "r4 = %4\n\t" \
+        "m0 = r4\n\t" \
+        "cs0 = %2\n\t" \
+        "mem" #SIZE "(%0++#" #INC ":circ(M0)) = %3" PART "\n\t" \
+        : "=r"(ADDR) \
+        : "0"(ADDR), "r"(START), "r"(VAL), "r"(LEN) \
+        : "r4", "m0", "cs0", "memory")
+#define CIRC_STORE_IMM_b(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_IMM(b, "", VAL, ADDR, START, LEN, INC)
+#define CIRC_STORE_IMM_h(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_IMM(h, "", VAL, ADDR, START, LEN, INC)
+#define CIRC_STORE_IMM_f(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_IMM(h, ".H", VAL, ADDR, START, LEN, INC)
+#define CIRC_STORE_IMM_w(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_IMM(w, "", VAL, ADDR, START, LEN, INC)
+#define CIRC_STORE_IMM_d(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_IMM(d, "", VAL, ADDR, START, LEN, INC)
+
+#define CIRC_STORE_NEW_IMM(SIZE, VAL, ADDR, START, LEN, INC) \
+    __asm__( \
+        "r4 = %4\n\t" \
+        "m0 = r4\n\t" \
+        "cs0 = %2\n\t" \
+        "{\n\t" \
+        "    r5 = %3\n\t" \
+        "    mem" #SIZE "(%0++#" #INC ":circ(M0)) = r5.new\n\t" \
+        "}\n\t" \
+        : "=r"(ADDR) \
+        : "0"(ADDR), "r"(START), "r"(VAL), "r"(LEN) \
+        : "r4", "r5", "m0", "cs0", "memory")
+#define CIRC_STORE_IMM_bnew(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_NEW_IMM(b, VAL, ADDR, START, LEN, INC)
+#define CIRC_STORE_IMM_hnew(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_NEW_IMM(h, VAL, ADDR, START, LEN, INC)
+#define CIRC_STORE_IMM_wnew(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_NEW_IMM(w, VAL, ADDR, START, LEN, INC)
+
+#define CIRC_STORE_REG(SIZE, PART, VAL, ADDR, START, LEN, INC) \
+    __asm__( \
+        "r4 = %2\n\t" \
+        "m1 = r4\n\t" \
+        "cs1 = %3\n\t" \
+        "mem" #SIZE "(%0++I:circ(M1)) = %4" PART "\n\t" \
+        : "=r"(ADDR) \
+        : "0"(ADDR), \
+          "r"((((INC) & 0x7f) << 17) | ((LEN) & 0x1ffff)), \
+          "r"(START), \
+          "r"(VAL) \
+        : "r4", "m1", "cs1", "memory")
+#define CIRC_STORE_REG_b(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_REG(b, "", VAL, ADDR, START, LEN, INC)
+#define CIRC_STORE_REG_h(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_REG(h, "", VAL, ADDR, START, LEN, INC)
+#define CIRC_STORE_REG_f(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_REG(h, ".H", VAL, ADDR, START, LEN, INC)
+#define CIRC_STORE_REG_w(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_REG(w, "", VAL, ADDR, START, LEN, INC)
+#define CIRC_STORE_REG_d(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_REG(d, "", VAL, ADDR, START, LEN, INC)
+
+#define CIRC_STORE_NEW_REG(SIZE, VAL, ADDR, START, LEN, INC) \
+    __asm__( \
+        "r4 = %2\n\t" \
+        "m1 = r4\n\t" \
+        "cs1 = %3\n\t" \
+        "{\n\t" \
+        "    r5 = %4\n\t" \
+        "    mem" #SIZE "(%0++I:circ(M1)) = r5.new\n\t" \
+        "}\n\t" \
+        : "=r"(ADDR) \
+        : "0"(ADDR), \
+          "r"((((INC) & 0x7f) << 17) | ((LEN) & 0x1ffff)), \
+          "r"(START), \
+          "r"(VAL) \
+        : "r4", "r5", "m1", "cs1", "memory")
+#define CIRC_STORE_REG_bnew(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_NEW_REG(b, VAL, ADDR, START, LEN, INC)
+#define CIRC_STORE_REG_hnew(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_NEW_REG(h, VAL, ADDR, START, LEN, INC)
+#define CIRC_STORE_REG_wnew(VAL, ADDR, START, LEN, INC) \
+    CIRC_STORE_NEW_REG(w, VAL, ADDR, START, LEN, INC)
+
+
+int err;
+
+void check_load(int i, long long result, int mod)
+{
+    if (result != (i % mod)) {
+        printf("ERROR(%d): %lld != %d\n", i, result, i % mod);
+        err++;
+    }
+}
+
+#define TEST_LOAD_IMM(SZ, TYPE, BUF, BUFSIZE, INC, FMT) \
+void circ_test_load_imm_##SZ(void) \
+{ \
+    TYPE *p = (TYPE *)BUF; \
+    int size = 10; \
+    int i; \
+    for (i = 0; i < BUFSIZE; i++) { \
+        TYPE element; \
+        CIRC_LOAD_IMM_##SZ(element, p, BUF, size * sizeof(TYPE), INC); \
+        DEBUG_PRINTF("i = %2d, p = 0x%p, element = %2" #FMT "\n", \
+                     i, p, element); \
+        check_load(i, element, size); \
+    } \
+}
+
+TEST_LOAD_IMM(b,  char,           bbuf, NBYTES, 1, d)
+TEST_LOAD_IMM(ub, unsigned char,  bbuf, NBYTES, 1, d)
+TEST_LOAD_IMM(h,  short,          hbuf, NHALFS, 2, d)
+TEST_LOAD_IMM(uh, unsigned short, hbuf, NHALFS, 2, d)
+TEST_LOAD_IMM(w,  int,            wbuf, NWORDS, 4, d)
+TEST_LOAD_IMM(d,  long long,      dbuf, NDOBLS, 8, lld)
+
+#define TEST_LOAD_REG(SZ, TYPE, BUF, BUFSIZE, FMT) \
+void circ_test_load_reg_##SZ(void) \
+{ \
+    TYPE *p = (TYPE *)BUF; \
+    int size = 13; \
+    int i; \
+    for (i = 0; i < BUFSIZE; i++) { \
+        TYPE element; \
+        CIRC_LOAD_REG_##SZ(element, p, BUF, size * sizeof(TYPE), 1); \
+        DEBUG_PRINTF("i = %2d, p = 0x%p, element = %2" #FMT "\n", \
+                     i, p, element); \
+        check_load(i, element, size); \
+    } \
+}
+
+TEST_LOAD_REG(b,  char,           bbuf, NBYTES, d)
+TEST_LOAD_REG(ub, unsigned char,  bbuf, NBYTES, d)
+TEST_LOAD_REG(h,  short,          hbuf, NHALFS, d)
+TEST_LOAD_REG(uh, unsigned short, hbuf, NHALFS, d)
+TEST_LOAD_REG(w,  int,            wbuf, NWORDS, d)
+TEST_LOAD_REG(d,  long long,      dbuf, NDOBLS, lld)
+
+#define CIRC_VAL(SZ, TYPE, BUFSIZE) \
+TYPE circ_val_##SZ(int i, int size) \
+{ \
+    int mod = BUFSIZE % size; \
+    if (i < mod) { \
+        return (i + BUFSIZE - mod); \
+    } else { \
+        return (i + BUFSIZE - size - mod); \
+    } \
+}
+
+CIRC_VAL(b, unsigned char, NBYTES)
+CIRC_VAL(h, short,         NHALFS)
+CIRC_VAL(w, int,           NWORDS)
+CIRC_VAL(d, long long,     NDOBLS)
+
+#define CHECK_STORE(SZ, BUF, BUFSIZE, FMT) \
+void check_store_##SZ(int size) \
+{ \
+    int i; \
+    for (i = 0; i < size; i++) { \
+        DEBUG_PRINTF(#BUF "[%3d] = 0x%02" #FMT ", guess = 0x%02" #FMT "\n", \
+                     i, BUF[i], circ_val_##SZ(i, size)); \
+        if (BUF[i] != circ_val_##SZ(i, size)) { \
+            printf("ERROR(%3d): 0x%02" #FMT " != 0x%02" #FMT "\n", \
+                   i, BUF[i], circ_val_##SZ(i, size)); \
+            err++; \
+        } \
+    } \
+    for (i = size; i < BUFSIZE; i++) { \
+        if (BUF[i] != i) { \
+            printf("ERROR(%3d): 0x%02" #FMT " != 0x%02x\n", i, BUF[i], i); \
+            err++; \
+        } \
+    } \
+}
+
+CHECK_STORE(b, bbuf, NBYTES, x)
+CHECK_STORE(h, hbuf, NHALFS, x)
+CHECK_STORE(w, wbuf, NWORDS, x)
+CHECK_STORE(d, dbuf, NDOBLS, llx)
+
+#define CIRC_TEST_STORE_IMM(SZ, CHK, TYPE, BUF, BUFSIZE, SHIFT, INC) \
+void circ_test_store_imm_##SZ(void) \
+{ \
+    unsigned int size = 27; \
+    TYPE *p = BUF; \
+    TYPE val = 0; \
+    int i; \
+    init_##BUF(); \
+    for (i = 0; i < BUFSIZE; i++) { \
+        CIRC_STORE_IMM_##SZ(val << SHIFT, p, BUF, size * sizeof(TYPE), INC); \
+        val++; \
+    } \
+    check_store_##CHK(size); \
+}
+
+CIRC_TEST_STORE_IMM(b,    b, unsigned char, bbuf, NBYTES, 0,  1)
+CIRC_TEST_STORE_IMM(h,    h, short,         hbuf, NHALFS, 0,  2)
+CIRC_TEST_STORE_IMM(f,    h, short,         hbuf, NHALFS, 16, 2)
+CIRC_TEST_STORE_IMM(w,    w, int,           wbuf, NWORDS, 0,  4)
+CIRC_TEST_STORE_IMM(d,    d, long long,     dbuf, NDOBLS, 0,  8)
+CIRC_TEST_STORE_IMM(bnew, b, unsigned char, bbuf, NBYTES, 0,  1)
+CIRC_TEST_STORE_IMM(hnew, h, short,         hbuf, NHALFS, 0,  2)
+CIRC_TEST_STORE_IMM(wnew, w, int,           wbuf, NWORDS, 0,  4)
+
+#define CIRC_TEST_STORE_REG(SZ, CHK, TYPE, BUF, BUFSIZE, SHIFT) \
+void circ_test_store_reg_##SZ(void) \
+{ \
+    TYPE *p = BUF; \
+    unsigned int size = 19; \
+    TYPE val = 0; \
+    int i; \
+    init_##BUF(); \
+    for (i = 0; i < BUFSIZE; i++) { \
+        CIRC_STORE_REG_##SZ(val << SHIFT, p, BUF, size * sizeof(TYPE), 1); \
+        val++; \
+    } \
+    check_store_##CHK(size); \
+}
+
+CIRC_TEST_STORE_REG(b,    b, unsigned char, bbuf, NBYTES, 0)
+CIRC_TEST_STORE_REG(h,    h, short,         hbuf, NHALFS, 0)
+CIRC_TEST_STORE_REG(f,    h, short,         hbuf, NHALFS, 16)
+CIRC_TEST_STORE_REG(w,    w, int,           wbuf, NWORDS, 0)
+CIRC_TEST_STORE_REG(d,    d, long long,     dbuf, NDOBLS, 0)
+CIRC_TEST_STORE_REG(bnew, b, unsigned char, bbuf, NBYTES, 0)
+CIRC_TEST_STORE_REG(hnew, h, short,         hbuf, NHALFS, 0)
+CIRC_TEST_STORE_REG(wnew, w, int,           wbuf, NWORDS, 0)
+
+int main()
+{
+    init_bbuf();
+    init_hbuf();
+    init_wbuf();
+    init_dbuf();
+
+    DEBUG_PRINTF("NBYTES = %d\n", NBYTES);
+    DEBUG_PRINTF("Address of dbuf = 0x%p\n", dbuf);
+    DEBUG_PRINTF("Address of wbuf = 0x%p\n", wbuf);
+    DEBUG_PRINTF("Address of hbuf = 0x%p\n", hbuf);
+    DEBUG_PRINTF("Address of bbuf = 0x%p\n", bbuf);
+
+    circ_test_load_imm_b();
+    circ_test_load_imm_ub();
+    circ_test_load_imm_h();
+    circ_test_load_imm_uh();
+    circ_test_load_imm_w();
+    circ_test_load_imm_d();
+
+    circ_test_load_reg_b();
+    circ_test_load_reg_ub();
+    circ_test_load_reg_h();
+    circ_test_load_reg_uh();
+    circ_test_load_reg_w();
+    circ_test_load_reg_d();
+
+    circ_test_store_imm_b();
+    circ_test_store_imm_h();
+    circ_test_store_imm_f();
+    circ_test_store_imm_w();
+    circ_test_store_imm_d();
+    circ_test_store_imm_bnew();
+    circ_test_store_imm_hnew();
+    circ_test_store_imm_wnew();
+
+    circ_test_store_reg_b();
+    circ_test_store_reg_h();
+    circ_test_store_reg_f();
+    circ_test_store_reg_w();
+    circ_test_store_reg_d();
+    circ_test_store_reg_bnew();
+    circ_test_store_reg_hnew();
+    circ_test_store_reg_wnew();
+
+    puts(err ? "FAIL" : "PASS");
+    return err ? 1 : 0;
+}
-- 
2.7.4



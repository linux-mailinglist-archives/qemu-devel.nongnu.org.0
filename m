Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F203B4CB8
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:04:37 +0200 (CEST)
Received: from localhost ([::1]:40398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx0Ue-0001Az-0x
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TJ-0006lj-QK
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:13 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TH-0008Cb-27
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:13 -0400
Received: by mail-pg1-x535.google.com with SMTP id e20so10022185pgg.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8cr7+ukGyxymoEJaYC1BtudqoX6QSPAINnUfFXmM69I=;
 b=oa24eAsHTUsCv1VgIyz1HQ1F9rg4//TuarzA0c0uI6nF/9XnubRk8KFqhP43F0r31a
 iRkyM4otfBVumeY4cQMN47Tr3zqGHn0WsSH5wFTctDQOhS13aX3C4gYCbWrgqFYIbw8W
 N0KzELPrezLG7HWy35sEn0FTFLXbpvaXZBs3Tg7DNwrF40m8xooZmS8blo3x9HpcR7Kw
 4VDX0Kw8OYabzpllhimwTzimG/9HIauqKiZk/A9NX5JhG13AJ2adMU0KBR8zMf2gInbc
 VmpuWW2chD9WYVsH7V72W05c/thUIAezAqwrVCZKTYJDo1YKBysaegAWia/1Evwe/yKu
 PDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8cr7+ukGyxymoEJaYC1BtudqoX6QSPAINnUfFXmM69I=;
 b=HxT4px6R4/VI0SLrmepepGUE7pdlAPdq8pH22zNpJ5Z2kqAGummjYB8rnZD2/DJpvD
 dCVFJE4lDkt+HYlEMmtwm02Wg3zwcekHHtj/c92OxWcS5cdVZaV94VCoXgTnoB4fg4FL
 1qeN2STdjxK9cXQ/BOBPz3Bjc2KtCJUHQ01OaSBqzAye9JjlcGpDgbUcqzdNMgQJazM4
 0R8NVt6SPvLRvFsa1fSF67GfITUS35QwFp080ohGpCoHS/NQsboEscCIfAzppOX5ZrFY
 Z1oo3QQCNF4RZqOx3k8BnzR6l2OuSdHv9POi9BgpCVt7McqR4vQmfGN1hCKekpZwnVJg
 L//Q==
X-Gm-Message-State: AOAM532PBBD9BMoI02GJI6eDlJ9XvtZP6DxaqQoVb2Y8GcSj2GbvtgpX
 Eay9MiADXEf1926ijxueX3AMMhmBPAJ24w==
X-Google-Smtp-Source: ABdhPJyjI6kPNLMVKz/tT8lmmein8LKE1sQqAZGJ9LIqM/HwwF0ZgWWtg5E6OAH2X6Iqi4u8FG2Saw==
X-Received: by 2002:a63:ec43:: with SMTP id r3mr12646947pgj.344.1624683789245; 
 Fri, 25 Jun 2021 22:03:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c62sm7389768pfa.12.2021.06.25.22.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 22:03:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/16] tcg/s390x: Change FACILITY representation
Date: Fri, 25 Jun 2021 22:02:53 -0700
Message-Id: <20210626050307.2408505-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626050307.2408505-1-richard.henderson@linaro.org>
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly need to be able to check facilities beyond the
first 64.  Instead of explicitly masking against s390_facilities,
create a HAVE_FACILITY macro that indexes an array.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Change name to HAVE_FACILITY (david)
---
 tcg/s390x/tcg-target.h     | 29 ++++++++-------
 tcg/s390x/tcg-target.c.inc | 74 +++++++++++++++++++-------------------
 2 files changed, 52 insertions(+), 51 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index b04b72b7eb..e1209cfef3 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -55,16 +55,19 @@ typedef enum TCGReg {
 /* A list of relevant facilities used by this translator.  Some of these
    are required for proper operation, and these are checked at startup.  */
 
-#define FACILITY_ZARCH_ACTIVE         (1ULL << (63 - 2))
-#define FACILITY_LONG_DISP            (1ULL << (63 - 18))
-#define FACILITY_EXT_IMM              (1ULL << (63 - 21))
-#define FACILITY_GEN_INST_EXT         (1ULL << (63 - 34))
-#define FACILITY_LOAD_ON_COND         (1ULL << (63 - 45))
+#define FACILITY_ZARCH_ACTIVE         2
+#define FACILITY_LONG_DISP            18
+#define FACILITY_EXT_IMM              21
+#define FACILITY_GEN_INST_EXT         34
+#define FACILITY_LOAD_ON_COND         45
 #define FACILITY_FAST_BCR_SER         FACILITY_LOAD_ON_COND
 #define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
-#define FACILITY_LOAD_ON_COND2        (1ULL << (63 - 53))
+#define FACILITY_LOAD_ON_COND2        53
 
-extern uint64_t s390_facilities;
+extern uint64_t s390_facilities[1];
+
+#define HAVE_FACILITY(X) \
+    ((s390_facilities[FACILITY_##X / 64] >> (63 - FACILITY_##X % 64)) & 1)
 
 /* optional instructions */
 #define TCG_TARGET_HAS_div2_i32       1
@@ -85,8 +88,8 @@ extern uint64_t s390_facilities;
 #define TCG_TARGET_HAS_clz_i32        0
 #define TCG_TARGET_HAS_ctz_i32        0
 #define TCG_TARGET_HAS_ctpop_i32      0
-#define TCG_TARGET_HAS_deposit_i32    (s390_facilities & FACILITY_GEN_INST_EXT)
-#define TCG_TARGET_HAS_extract_i32    (s390_facilities & FACILITY_GEN_INST_EXT)
+#define TCG_TARGET_HAS_deposit_i32    HAVE_FACILITY(GEN_INST_EXT)
+#define TCG_TARGET_HAS_extract_i32    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_sextract_i32   0
 #define TCG_TARGET_HAS_extract2_i32   0
 #define TCG_TARGET_HAS_movcond_i32    1
@@ -99,7 +102,7 @@ extern uint64_t s390_facilities;
 #define TCG_TARGET_HAS_extrl_i64_i32  0
 #define TCG_TARGET_HAS_extrh_i64_i32  0
 #define TCG_TARGET_HAS_goto_ptr       1
-#define TCG_TARGET_HAS_direct_jump    (s390_facilities & FACILITY_GEN_INST_EXT)
+#define TCG_TARGET_HAS_direct_jump    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_qemu_st8_i32   0
 
 #define TCG_TARGET_HAS_div2_i64       1
@@ -120,11 +123,11 @@ extern uint64_t s390_facilities;
 #define TCG_TARGET_HAS_eqv_i64        0
 #define TCG_TARGET_HAS_nand_i64       0
 #define TCG_TARGET_HAS_nor_i64        0
-#define TCG_TARGET_HAS_clz_i64        (s390_facilities & FACILITY_EXT_IMM)
+#define TCG_TARGET_HAS_clz_i64        HAVE_FACILITY(EXT_IMM)
 #define TCG_TARGET_HAS_ctz_i64        0
 #define TCG_TARGET_HAS_ctpop_i64      0
-#define TCG_TARGET_HAS_deposit_i64    (s390_facilities & FACILITY_GEN_INST_EXT)
-#define TCG_TARGET_HAS_extract_i64    (s390_facilities & FACILITY_GEN_INST_EXT)
+#define TCG_TARGET_HAS_deposit_i64    HAVE_FACILITY(GEN_INST_EXT)
+#define TCG_TARGET_HAS_extract_i64    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_sextract_i64   0
 #define TCG_TARGET_HAS_extract2_i64   0
 #define TCG_TARGET_HAS_movcond_i64    1
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 5fe073f09a..76630aafc4 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -66,7 +66,7 @@
    We don't need this when we have pc-relative loads with the general
    instructions extension facility.  */
 #define TCG_REG_TB      TCG_REG_R12
-#define USE_REG_TB      (!(s390_facilities & FACILITY_GEN_INST_EXT))
+#define USE_REG_TB      (!HAVE_FACILITY(GEN_INST_EXT))
 
 #ifndef CONFIG_SOFTMMU
 #define TCG_GUEST_BASE_REG TCG_REG_R13
@@ -377,7 +377,7 @@ static void * const qemu_st_helpers[16] = {
 #endif
 
 static const tcg_insn_unit *tb_ret_addr;
-uint64_t s390_facilities;
+uint64_t s390_facilities[1];
 
 static bool patch_reloc(tcg_insn_unit *src_rw, int type,
                         intptr_t value, intptr_t addend)
@@ -577,7 +577,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
 
     /* Try all 48-bit insns that can load it in one go.  */
-    if (s390_facilities & FACILITY_EXT_IMM) {
+    if (HAVE_FACILITY(EXT_IMM)) {
         if (sval == (int32_t)sval) {
             tcg_out_insn(s, RIL, LGFI, ret, sval);
             return;
@@ -620,7 +620,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
 
     /* Otherwise, stuff it in the constant pool.  */
-    if (s390_facilities & FACILITY_GEN_INST_EXT) {
+    if (HAVE_FACILITY(GEN_INST_EXT)) {
         tcg_out_insn(s, RIL, LGRL, ret, 0);
         new_pool_label(s, sval, R_390_PC32DBL, s->code_ptr - 2, 2);
     } else if (USE_REG_TB && !in_prologue) {
@@ -706,7 +706,7 @@ static void tcg_out_ld_abs(TCGContext *s, TCGType type,
 {
     intptr_t addr = (intptr_t)abs;
 
-    if ((s390_facilities & FACILITY_GEN_INST_EXT) && !(addr & 1)) {
+    if (HAVE_FACILITY(GEN_INST_EXT) && !(addr & 1)) {
         ptrdiff_t disp = tcg_pcrel_diff(s, abs) >> 1;
         if (disp == (int32_t)disp) {
             if (type == TCG_TYPE_I32) {
@@ -740,7 +740,7 @@ static inline void tcg_out_risbg(TCGContext *s, TCGReg dest, TCGReg src,
 
 static void tgen_ext8s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
-    if (s390_facilities & FACILITY_EXT_IMM) {
+    if (HAVE_FACILITY(EXT_IMM)) {
         tcg_out_insn(s, RRE, LGBR, dest, src);
         return;
     }
@@ -760,7 +760,7 @@ static void tgen_ext8s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 
 static void tgen_ext8u(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
-    if (s390_facilities & FACILITY_EXT_IMM) {
+    if (HAVE_FACILITY(EXT_IMM)) {
         tcg_out_insn(s, RRE, LLGCR, dest, src);
         return;
     }
@@ -780,7 +780,7 @@ static void tgen_ext8u(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 
 static void tgen_ext16s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
-    if (s390_facilities & FACILITY_EXT_IMM) {
+    if (HAVE_FACILITY(EXT_IMM)) {
         tcg_out_insn(s, RRE, LGHR, dest, src);
         return;
     }
@@ -800,7 +800,7 @@ static void tgen_ext16s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 
 static void tgen_ext16u(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
-    if (s390_facilities & FACILITY_EXT_IMM) {
+    if (HAVE_FACILITY(EXT_IMM)) {
         tcg_out_insn(s, RRE, LLGHR, dest, src);
         return;
     }
@@ -888,7 +888,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         tgen_ext32u(s, dest, dest);
         return;
     }
-    if (s390_facilities & FACILITY_EXT_IMM) {
+    if (HAVE_FACILITY(EXT_IMM)) {
         if ((val & valid) == 0xff) {
             tgen_ext8u(s, TCG_TYPE_I64, dest, dest);
             return;
@@ -909,7 +909,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     }
 
     /* Try all 48-bit insns that can perform it in one go.  */
-    if (s390_facilities & FACILITY_EXT_IMM) {
+    if (HAVE_FACILITY(EXT_IMM)) {
         for (i = 0; i < 2; i++) {
             tcg_target_ulong mask = ~(0xffffffffull << i*32);
             if (((val | ~valid) & mask) == mask) {
@@ -918,7 +918,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
             }
         }
     }
-    if ((s390_facilities & FACILITY_GEN_INST_EXT) && risbg_mask(val)) {
+    if (HAVE_FACILITY(GEN_INST_EXT) && risbg_mask(val)) {
         tgen_andi_risbg(s, dest, dest, val);
         return;
     }
@@ -967,7 +967,7 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     }
 
     /* Try all 48-bit insns that can perform it in one go.  */
-    if (s390_facilities & FACILITY_EXT_IMM) {
+    if (HAVE_FACILITY(EXT_IMM)) {
         for (i = 0; i < 2; i++) {
             tcg_target_ulong mask = (0xffffffffull << i*32);
             if ((val & mask) != 0 && (val & ~mask) == 0) {
@@ -992,7 +992,7 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         /* Perform the OR via sequential modifications to the high and
            low parts.  Do this via recursion to handle 16-bit vs 32-bit
            masks in each half.  */
-        tcg_debug_assert(s390_facilities & FACILITY_EXT_IMM);
+        tcg_debug_assert(HAVE_FACILITY(EXT_IMM));
         tgen_ori(s, type, dest, val & 0x00000000ffffffffull);
         tgen_ori(s, type, dest, val & 0xffffffff00000000ull);
     }
@@ -1001,7 +1001,7 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 static void tgen_xori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 {
     /* Try all 48-bit insns that can perform it in one go.  */
-    if (s390_facilities & FACILITY_EXT_IMM) {
+    if (HAVE_FACILITY(EXT_IMM)) {
         if ((val & 0xffffffff00000000ull) == 0) {
             tcg_out_insn(s, RIL, XILF, dest, val);
             return;
@@ -1025,7 +1025,7 @@ static void tgen_xori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
                        tcg_tbrel_diff(s, NULL));
     } else {
         /* Perform the xor by parts.  */
-        tcg_debug_assert(s390_facilities & FACILITY_EXT_IMM);
+        tcg_debug_assert(HAVE_FACILITY(EXT_IMM));
         if (val & 0xffffffff) {
             tcg_out_insn(s, RIL, XILF, dest, val);
         }
@@ -1059,7 +1059,7 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
             goto exit;
         }
 
-        if (s390_facilities & FACILITY_EXT_IMM) {
+        if (HAVE_FACILITY(EXT_IMM)) {
             if (type == TCG_TYPE_I32) {
                 op = (is_unsigned ? RIL_CLFI : RIL_CFI);
                 tcg_out_insn_RIL(s, op, r1, c2);
@@ -1122,7 +1122,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
     bool have_loc;
 
     /* With LOC2, we can always emit the minimum 3 insns.  */
-    if (s390_facilities & FACILITY_LOAD_ON_COND2) {
+    if (HAVE_FACILITY(LOAD_ON_COND2)) {
         /* Emit: d = 0, d = (cc ? 1 : d).  */
         cc = tgen_cmp(s, type, cond, c1, c2, c2const, false);
         tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
@@ -1130,7 +1130,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
         return;
     }
 
-    have_loc = (s390_facilities & FACILITY_LOAD_ON_COND) != 0;
+    have_loc = HAVE_FACILITY(LOAD_ON_COND);
 
     /* For HAVE_LOC, only the paths through GTU/GT/LEU/LE are smaller.  */
  restart:
@@ -1216,7 +1216,7 @@ static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
                          TCGArg v3, int v3const)
 {
     int cc;
-    if (s390_facilities & FACILITY_LOAD_ON_COND) {
+    if (HAVE_FACILITY(LOAD_ON_COND)) {
         cc = tgen_cmp(s, type, c, c1, c2, c2const, false);
         if (v3const) {
             tcg_out_insn(s, RIE, LOCGHI, dest, v3, cc);
@@ -1249,7 +1249,7 @@ static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
         } else {
             tcg_out_mov(s, TCG_TYPE_I64, dest, a2);
         }
-        if (s390_facilities & FACILITY_LOAD_ON_COND) {
+        if (HAVE_FACILITY(LOAD_ON_COND)) {
             /* Emit: if (one bit found) dest = r0.  */
             tcg_out_insn(s, RRF, LOCGR, dest, TCG_REG_R0, 2);
         } else {
@@ -1325,7 +1325,7 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
 {
     int cc;
 
-    if (s390_facilities & FACILITY_GEN_INST_EXT) {
+    if (HAVE_FACILITY(GEN_INST_EXT)) {
         bool is_unsigned = is_unsigned_cond(c);
         bool in_range;
         S390Opcode opc;
@@ -1519,7 +1519,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
        cross pages using the address of the last byte of the access.  */
     a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
     tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
-    if ((s390_facilities & FACILITY_GEN_INST_EXT) && a_off == 0) {
+    if (HAVE_FACILITY(GEN_INST_EXT) && a_off == 0) {
         tgen_andi_risbg(s, TCG_REG_R3, addr_reg, tlb_mask);
     } else {
         tcg_out_insn(s, RX, LA, TCG_REG_R3, addr_reg, TCG_REG_NONE, a_off);
@@ -1810,7 +1810,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                     tcg_out_insn(s, RI, AHI, a0, a2);
                     break;
                 }
-                if (s390_facilities & FACILITY_EXT_IMM) {
+                if (HAVE_FACILITY(EXT_IMM)) {
                     tcg_out_insn(s, RIL, AFI, a0, a2);
                     break;
                 }
@@ -2034,7 +2034,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                     tcg_out_insn(s, RI, AGHI, a0, a2);
                     break;
                 }
-                if (s390_facilities & FACILITY_EXT_IMM) {
+                if (HAVE_FACILITY(EXT_IMM)) {
                     if (a2 == (int32_t)a2) {
                         tcg_out_insn(s, RIL, AGFI, a0, a2);
                         break;
@@ -2259,8 +2259,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         /* The host memory model is quite strong, we simply need to
            serialize the instruction stream.  */
         if (args[0] & TCG_MO_ST_LD) {
-            tcg_out_insn(s, RR, BCR,
-                         s390_facilities & FACILITY_FAST_BCR_SER ? 14 : 15, 0);
+            tcg_out_insn(s, RR, BCR, HAVE_FACILITY(FAST_BCR_SER) ? 14 : 15, 0);
         }
         break;
 
@@ -2323,7 +2322,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_or_i64:
     case INDEX_op_xor_i32:
     case INDEX_op_xor_i64:
-        return (s390_facilities & FACILITY_DISTINCT_OPS
+        return (HAVE_FACILITY(DISTINCT_OPS)
                 ? C_O1_I2(r, r, ri)
                 : C_O1_I2(r, 0, ri));
 
@@ -2331,19 +2330,19 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         /* If we have the general-instruction-extensions, then we have
            MULTIPLY SINGLE IMMEDIATE with a signed 32-bit, otherwise we
            have only MULTIPLY HALFWORD IMMEDIATE, with a signed 16-bit.  */
-        return (s390_facilities & FACILITY_GEN_INST_EXT
+        return (HAVE_FACILITY(GEN_INST_EXT)
                 ? C_O1_I2(r, 0, ri)
                 : C_O1_I2(r, 0, rI));
 
     case INDEX_op_mul_i64:
-        return (s390_facilities & FACILITY_GEN_INST_EXT
+        return (HAVE_FACILITY(GEN_INST_EXT)
                 ? C_O1_I2(r, 0, rJ)
                 : C_O1_I2(r, 0, rI));
 
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
     case INDEX_op_sar_i32:
-        return (s390_facilities & FACILITY_DISTINCT_OPS
+        return (HAVE_FACILITY(DISTINCT_OPS)
                 ? C_O1_I2(r, r, ri)
                 : C_O1_I2(r, 0, ri));
 
@@ -2387,7 +2386,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
-        return (s390_facilities & FACILITY_LOAD_ON_COND2
+        return (HAVE_FACILITY(LOAD_ON_COND2)
                 ? C_O1_I4(r, r, ri, rI, 0)
                 : C_O1_I4(r, r, ri, r, 0));
 
@@ -2402,13 +2401,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-        return (s390_facilities & FACILITY_EXT_IMM
+        return (HAVE_FACILITY(EXT_IMM)
                 ? C_O2_I4(r, r, 0, 1, ri, r)
                 : C_O2_I4(r, r, 0, 1, r, r));
 
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i64:
-        return (s390_facilities & FACILITY_EXT_IMM
+        return (HAVE_FACILITY(EXT_IMM)
                 ? C_O2_I4(r, r, 0, 1, rA, r)
                 : C_O2_I4(r, r, 0, 1, r, r));
 
@@ -2424,13 +2423,12 @@ static void query_s390_facilities(void)
     /* Is STORE FACILITY LIST EXTENDED available?  Honestly, I believe this
        is present on all 64-bit systems, but let's check for it anyway.  */
     if (hwcap & HWCAP_S390_STFLE) {
-        register int r0 __asm__("0");
-        register void *r1 __asm__("1");
+        register int r0 __asm__("0") = ARRAY_SIZE(s390_facilities) - 1;
+        register void *r1 __asm__("1") = s390_facilities;
 
         /* stfle 0(%r1) */
-        r1 = &s390_facilities;
         asm volatile(".word 0xb2b0,0x1000"
-                     : "=r"(r0) : "0"(0), "r"(r1) : "memory", "cc");
+                     : "=r"(r0) : "r"(r0), "r"(r1) : "memory", "cc");
     }
 }
 
-- 
2.25.1



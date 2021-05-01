Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A163F3708C4
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:21:32 +0200 (CEST)
Received: from localhost ([::1]:57876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcvBD-0001rS-KS
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcub0-0000CE-Ki
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:44:06 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuag-0000BP-3x
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:44:06 -0400
Received: by mail-pl1-x634.google.com with SMTP id s15so672336plg.6
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4XSEqyXiRtjJwO2gtAz97//kteN7PCPKLWgTDfEX9U=;
 b=OpVRgmZ5x93rV4A5FoiIgPDWa7GQorelvAX58/aQM2Swv//zUS1a7QX0OofrO+50AS
 WvBpPDTd0cvwWGoZWjGwfUCzPN2gf/d1m4KJNOmsNu4cJOQ5eSevdZWfY5Rv4TlHNgKX
 vPWYBaNiMonZPndQ8Rur2bZa1BaJdLEs81RTuCIAB29W2IU2OjaQDl1TiGuxLyMGw4zF
 mbIbCuDm460ZZdmWZizkED6YyvPIbLkIWZ6VZ6DLRot4xALaWhgm+qpRj9K2MrUClCON
 h3945zNwBN/9K/E3Dhf+TzhclWqeTUWntfw3qQBr1gTN5ZdS1BIS2sg2o/tF3R0FPu4T
 Oqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4XSEqyXiRtjJwO2gtAz97//kteN7PCPKLWgTDfEX9U=;
 b=DC6n2jUyArcX0bsQI3Mi3tLZABSIPKu0AE1JLLZgdFYSOKXTkLuJy7rdMeZ0IZ8gJH
 kOr/qIIXOWlzetBCMhJqMeGMpX+zqyjKlsDjJjX7CjZQYbAuhSOdsEtAqNS7GIyqHlim
 6HkclkQcFHila+uQiELXdRik3MopJoEPJOOUuZG/pHdM58YJ5sVaKnIPGR3fjiSaBj9T
 PzoQHE3ushqCarfh45+HIQe2A4MDYAhhWFHPn2UtZhTqa/RSrQhWfVUE4j47cUWtkF+f
 MGI4kpWuJ09hFIO+Hnn47d4S0EG7ZlDTimNwQR65Jju1J/2x/0JxaR4va28oDuQl5QOp
 QodQ==
X-Gm-Message-State: AOAM532pIXctTyzVfI9j+YU7DdKVzDo5nNtoL6MAXhaes7Uy83T21y9i
 /NZzdNY7N0ipF9NqC0SvogWh6d2UKT+pAA==
X-Google-Smtp-Source: ABdhPJywNICtfNtHCcFVUFkqPNvM2HZx3mRUVP2uS5xF0WnNUHwXGFJfz9dkhdmGdtsf87YUnrzgVQ==
X-Received: by 2002:a17:90a:690d:: with SMTP id
 r13mr2480760pjj.19.1619894622622; 
 Sat, 01 May 2021 11:43:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/31] Hexagon (target/hexagon) circular addressing
Date: Sat,  1 May 2021 11:43:20 -0700
Message-Id: <20210501184324.1338186-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-23-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_tcg.h              | 112 +++++-
 target/hexagon/macros.h               |  92 +++++
 target/hexagon/genptr.c               | 100 ++++++
 target/hexagon/op_helper.c            |  36 +-
 tests/tcg/hexagon/circ.c              | 486 ++++++++++++++++++++++++++
 target/hexagon/imported/encode_pp.def |  10 +
 target/hexagon/imported/ldst.idef     |   4 +
 target/hexagon/imported/macros.def    |  26 ++
 tests/tcg/hexagon/Makefile.target     |   2 +
 9 files changed, 845 insertions(+), 23 deletions(-)
 create mode 100644 tests/tcg/hexagon/circ.c

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index 6bc578dfda..25c228c112 100644
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
@@ -56,7 +58,22 @@
         fEA_REG(RxV); \
         fPM_I(RxV, siV); \
     } while (0)
-
+#define GET_EA_pci \
+    do { \
+        TCGv tcgv_siV = tcg_const_tl(siV); \
+        tcg_gen_mov_tl(EA, RxV); \
+        gen_helper_fcircadd(RxV, RxV, tcgv_siV, MuV, \
+                            hex_gpr[HEX_REG_CS0 + MuN]); \
+        tcg_temp_free(tcgv_siV); \
+    } while (0)
+#define GET_EA_pcr(SHIFT) \
+    do { \
+        TCGv ireg = tcg_temp_new(); \
+        tcg_gen_mov_tl(EA, RxV); \
+        gen_read_ireg(ireg, MuV, (SHIFT)); \
+        gen_helper_fcircadd(RxV, RxV, ireg, MuV, hex_gpr[HEX_REG_CS0 + MuN]); \
+        tcg_temp_free(ireg); \
+    } while (0)
 
 /* Instructions with multiple definitions */
 #define fGEN_TCG_LOAD_AP(RES, SIZE, SIGN) \
@@ -80,6 +97,36 @@
 #define fGEN_TCG_L4_loadrd_ap(SHORTCODE) \
     fGEN_TCG_LOAD_AP(RddV, 8, u)
 
+#define fGEN_TCG_L2_loadrub_pci(SHORTCODE)    SHORTCODE
+#define fGEN_TCG_L2_loadrb_pci(SHORTCODE)     SHORTCODE
+#define fGEN_TCG_L2_loadruh_pci(SHORTCODE)    SHORTCODE
+#define fGEN_TCG_L2_loadrh_pci(SHORTCODE)     SHORTCODE
+#define fGEN_TCG_L2_loadri_pci(SHORTCODE)     SHORTCODE
+#define fGEN_TCG_L2_loadrd_pci(SHORTCODE)     SHORTCODE
+
+#define fGEN_TCG_LOAD_pcr(SHIFT, LOAD) \
+    do { \
+        TCGv ireg = tcg_temp_new(); \
+        tcg_gen_mov_tl(EA, RxV); \
+        gen_read_ireg(ireg, MuV, SHIFT); \
+        gen_helper_fcircadd(RxV, RxV, ireg, MuV, hex_gpr[HEX_REG_CS0 + MuN]); \
+        LOAD; \
+        tcg_temp_free(ireg); \
+    } while (0)
+
+#define fGEN_TCG_L2_loadrub_pcr(SHORTCODE) \
+      fGEN_TCG_LOAD_pcr(0, fLOAD(1, 1, u, EA, RdV))
+#define fGEN_TCG_L2_loadrb_pcr(SHORTCODE) \
+      fGEN_TCG_LOAD_pcr(0, fLOAD(1, 1, s, EA, RdV))
+#define fGEN_TCG_L2_loadruh_pcr(SHORTCODE) \
+      fGEN_TCG_LOAD_pcr(1, fLOAD(1, 2, u, EA, RdV))
+#define fGEN_TCG_L2_loadrh_pcr(SHORTCODE) \
+      fGEN_TCG_LOAD_pcr(1, fLOAD(1, 2, s, EA, RdV))
+#define fGEN_TCG_L2_loadri_pcr(SHORTCODE) \
+      fGEN_TCG_LOAD_pcr(2, fLOAD(1, 4, u, EA, RdV))
+#define fGEN_TCG_L2_loadrd_pcr(SHORTCODE) \
+      fGEN_TCG_LOAD_pcr(3, fLOAD(1, 8, u, EA, RddV))
+
 #define fGEN_TCG_L2_loadrub_pr(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrub_pi(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrb_pr(SHORTCODE)       SHORTCODE
@@ -195,6 +242,69 @@
 #define fGEN_TCG_S4_stored_locked(SHORTCODE) \
     do { SHORTCODE; READ_PREG(PdV, PdN); } while (0)
 
+#define fGEN_TCG_STORE(SHORTCODE) \
+    do { \
+        TCGv HALF = tcg_temp_new(); \
+        TCGv BYTE = tcg_temp_new(); \
+        SHORTCODE; \
+        tcg_temp_free(HALF); \
+        tcg_temp_free(BYTE); \
+    } while (0)
+
+#define fGEN_TCG_STORE_pcr(SHIFT, STORE) \
+    do { \
+        TCGv ireg = tcg_temp_new(); \
+        TCGv HALF = tcg_temp_new(); \
+        TCGv BYTE = tcg_temp_new(); \
+        tcg_gen_mov_tl(EA, RxV); \
+        gen_read_ireg(ireg, MuV, SHIFT); \
+        gen_helper_fcircadd(RxV, RxV, ireg, MuV, hex_gpr[HEX_REG_CS0 + MuN]); \
+        STORE; \
+        tcg_temp_free(ireg); \
+        tcg_temp_free(HALF); \
+        tcg_temp_free(BYTE); \
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
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index 8cb211dfde..494ea8dfd8 100644
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
@@ -285,6 +317,39 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
 
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
+     * The value is signed
+     *
+     * At the end we shift the result according to the shift argument
+     */
+    TCGv msb = tcg_temp_new();
+    TCGv lsb = tcg_temp_new();
+
+    tcg_gen_extract_tl(lsb, val, 17, 7);
+    tcg_gen_sari_tl(msb, val, 21);
+    tcg_gen_deposit_tl(result, msb, lsb, 0, 7);
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
@@ -418,6 +483,13 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
 #define fEA_REG(REG) tcg_gen_mov_tl(EA, REG)
 #define fPM_I(REG, IMM)     tcg_gen_addi_tl(REG, REG, IMM)
 #define fPM_M(REG, MVAL)    tcg_gen_add_tl(REG, REG, MVAL)
+#define fPM_CIRI(REG, IMM, MVAL) \
+    do { \
+        TCGv tcgv_siV = tcg_const_tl(siV); \
+        gen_helper_fcircadd(REG, REG, tcgv_siV, MuV, \
+                            hex_gpr[HEX_REG_CS0 + MuN]); \
+        tcg_temp_free(tcgv_siV); \
+    } while (0)
 #else
 #define fEA_IMM(IMM)        do { EA = (IMM); } while (0)
 #define fEA_REG(REG)        do { EA = (REG); } while (0)
@@ -494,23 +566,43 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
     gen_load_locked##SIZE##SIGN(DST, EA, ctx->mem_idx);
 #endif
 
+#ifdef QEMU_GENERATE
+#define fSTORE(NUM, SIZE, EA, SRC) MEM_STORE##SIZE(EA, SRC, insn->slot)
+#else
 #define fSTORE(NUM, SIZE, EA, SRC) MEM_STORE##SIZE(EA, SRC, slot)
+#endif
 
 #ifdef QEMU_GENERATE
 #define fSTORE_LOCKED(NUM, SIZE, EA, SRC, PRED) \
     gen_store_conditional##SIZE(env, ctx, PdN, PRED, EA, SRC);
 #endif
 
+#ifdef QEMU_GENERATE
+#define GETBYTE_FUNC(X) \
+    __builtin_choose_expr(TYPE_TCGV(X), \
+        gen_get_byte, \
+        __builtin_choose_expr(TYPE_TCGV_I64(X), \
+            gen_get_byte_i64, (void)0))
+#define fGETBYTE(N, SRC) GETBYTE_FUNC(SRC)(BYTE, N, SRC, true)
+#define fGETUBYTE(N, SRC) GETBYTE_FUNC(SRC)(BYTE, N, SRC, false)
+#else
 #define fGETBYTE(N, SRC) ((int8_t)((SRC >> ((N) * 8)) & 0xff))
 #define fGETUBYTE(N, SRC) ((uint8_t)((SRC >> ((N) * 8)) & 0xff))
+#endif
 
 #define fSETBYTE(N, DST, VAL) \
     do { \
         DST = (DST & ~(0x0ffLL << ((N) * 8))) | \
         (((uint64_t)((VAL) & 0x0ffLL)) << ((N) * 8)); \
     } while (0)
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
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 333f7d74bf..eac3f61921 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -28,6 +28,12 @@
 #undef QEMU_GENERATE
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
@@ -266,6 +272,16 @@ static inline void gen_write_ctrl_reg_pair(DisasContext *ctx, int reg_num,
     }
 }
 
+static TCGv gen_get_byte(TCGv result, int N, TCGv src, bool sign)
+{
+    if (sign) {
+        tcg_gen_sextract_tl(result, src, N * 8, 8);
+    } else {
+        tcg_gen_extract_tl(result, src, N * 8, 8);
+    }
+    return result;
+}
+
 static TCGv gen_get_byte_i64(TCGv result, int N, TCGv_i64 src, bool sign)
 {
     TCGv_i64 res64 = tcg_temp_new_i64();
@@ -280,6 +296,21 @@ static TCGv gen_get_byte_i64(TCGv result, int N, TCGv_i64 src, bool sign)
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
+static inline void gen_set_byte(int N, TCGv result, TCGv src)
+{
+    tcg_gen_deposit_tl(result, result, src, N * 8, 8);
+}
+
 static void gen_set_byte_i64(int N, TCGv_i64 result, TCGv src)
 {
     TCGv_i64 src64 = tcg_temp_new_i64();
@@ -361,6 +392,75 @@ static inline void gen_store_conditional8(CPUHexagonState *env,
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
 static TCGv gen_8bitsof(TCGv result, TCGv value)
 {
     TCGv zero = tcg_const_tl(0);
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index f9fb65555b..2319b9313e 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -251,33 +251,25 @@ void HELPER(debug_commit_end)(CPUHexagonState *env, int has_st0, int has_st1)
 
 }
 
-static int32_t fcircadd_v4(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
-{
-    int32_t length = M & 0x0001ffff;
-    uint32_t new_ptr = RxV + offset;
-    uint32_t start_addr = CS;
-    uint32_t end_addr = start_addr + length;
-
-    if (new_ptr >= end_addr) {
-        new_ptr -= length;
-    } else if (new_ptr < start_addr) {
-        new_ptr += length;
-    }
-
-    return new_ptr;
-}
-
 int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
 {
-    int32_t K_const = (M >> 24) & 0xf;
-    int32_t length = M & 0x1ffff;
-    int32_t mask = (1 << (K_const + 2)) - 1;
+    int32_t K_const = sextract32(M, 24, 4);
+    int32_t length = sextract32(M, 0, 17);
     uint32_t new_ptr = RxV + offset;
-    uint32_t start_addr = RxV & (~mask);
-    uint32_t end_addr = start_addr | length;
+    uint32_t start_addr;
+    uint32_t end_addr;
 
     if (K_const == 0 && length >= 4) {
-        return fcircadd_v4(RxV, offset, M, CS);
+        start_addr = CS;
+        end_addr = start_addr + length;
+    } else {
+        /*
+         * Versions v3 and earlier used the K value to specify a power-of-2 size
+         * 2^(K+2) that is greater than the buffer length
+         */
+        int32_t mask = (1 << (K_const + 2)) - 1;
+        start_addr = RxV & (~mask);
+        end_addr = start_addr | length;
     }
 
     if (new_ptr >= end_addr) {
diff --git a/tests/tcg/hexagon/circ.c b/tests/tcg/hexagon/circ.c
new file mode 100644
index 0000000000..67a1aa3054
--- /dev/null
+++ b/tests/tcg/hexagon/circ.c
@@ -0,0 +1,486 @@
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
+#define DEBUG_PRINTF(...) \
+    do { \
+        if (DEBUG) { \
+            printf(__VA_ARGS__); \
+        } \
+    } while (0)
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
+        "r4 = %3\n\t" \
+        "m0 = r4\n\t" \
+        "cs0 = %2\n\t" \
+        "%0 = mem" #SIZE "(%1++#" #INC ":circ(M0))\n\t" \
+        : "=r"(RES), "+r"(ADDR) \
+        : "r"(START), "r"(LEN) \
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
+/*
+ * The mreg has the following pieces
+ *     mreg[31:28]              increment[10:7]
+ *     mreg[27:24]              K value (used Hexagon v3 and earlier)
+ *     mreg[23:17]              increment[6:0]
+ *     mreg[16:0]               circular buffer length
+ */
+static int build_mreg(int inc, int K, int len)
+{
+    return ((inc & 0x780) << 21) |
+           ((K & 0xf) << 24) |
+           ((inc & 0x7f) << 17) |
+           (len & 0x1ffff);
+}
+
+#define CIRC_LOAD_REG(SIZE, RES, ADDR, START, LEN, INC) \
+    __asm__( \
+        "r4 = %2\n\t" \
+        "m1 = r4\n\t" \
+        "cs1 = %3\n\t" \
+        "%0 = mem" #SIZE "(%1++I:circ(M1))\n\t" \
+        : "=r"(RES), "+r"(ADDR) \
+        : "r"(build_mreg((INC), 0, (LEN))), \
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
+        "r4 = %3\n\t" \
+        "m0 = r4\n\t" \
+        "cs0 = %1\n\t" \
+        "mem" #SIZE "(%0++#" #INC ":circ(M0)) = %2" PART "\n\t" \
+        : "+r"(ADDR) \
+        : "r"(START), "r"(VAL), "r"(LEN) \
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
+        "r4 = %3\n\t" \
+        "m0 = r4\n\t" \
+        "cs0 = %1\n\t" \
+        "{\n\t" \
+        "    r5 = %2\n\t" \
+        "    mem" #SIZE "(%0++#" #INC ":circ(M0)) = r5.new\n\t" \
+        "}\n\t" \
+        : "+r"(ADDR) \
+        : "r"(START), "r"(VAL), "r"(LEN) \
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
+        "r4 = %1\n\t" \
+        "m1 = r4\n\t" \
+        "cs1 = %2\n\t" \
+        "mem" #SIZE "(%0++I:circ(M1)) = %3" PART "\n\t" \
+        : "+r"(ADDR) \
+        : "r"(build_mreg((INC), 0, (LEN))), \
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
+        "r4 = %1\n\t" \
+        "m1 = r4\n\t" \
+        "cs1 = %2\n\t" \
+        "{\n\t" \
+        "    r5 = %3\n\t" \
+        "    mem" #SIZE "(%0++I:circ(M1)) = r5.new\n\t" \
+        "}\n\t" \
+        : "+r"(ADDR) \
+        : "r"(build_mreg((INC), 0, (LEN))), \
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
+/* We'll test increments +1 and -1 */
+void check_load(int i, long long result, int inc, int size)
+{
+    int expect = (i * inc);
+    while (expect >= size) {
+        expect -= size;
+    }
+    while (expect < 0) {
+        expect += size;
+    }
+    if (result != expect) {
+        printf("ERROR(%d): %lld != %d\n", i, result, expect);
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
+        CIRC_LOAD_IMM_##SZ(element, p, BUF, size * sizeof(TYPE), (INC)); \
+        DEBUG_PRINTF("i = %2d, p = 0x%p, element = %2" #FMT "\n", \
+                     i, p, element); \
+        check_load(i, element, ((INC) / (int)sizeof(TYPE)), size); \
+    } \
+    p = (TYPE *)BUF; \
+    for (i = 0; i < BUFSIZE; i++) { \
+        TYPE element; \
+        CIRC_LOAD_IMM_##SZ(element, p, BUF, size * sizeof(TYPE), -(INC)); \
+        DEBUG_PRINTF("i = %2d, p = 0x%p, element = %2" #FMT "\n", \
+                     i, p, element); \
+        check_load(i, element, (-(INC) / (int)sizeof(TYPE)), size); \
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
+        check_load(i, element, 1, size); \
+    } \
+    p = (TYPE *)BUF; \
+    for (i = 0; i < BUFSIZE; i++) { \
+        TYPE element; \
+        CIRC_LOAD_REG_##SZ(element, p, BUF, size * sizeof(TYPE), -1); \
+        DEBUG_PRINTF("i = %2d, p = 0x%p, element = %2" #FMT "\n", \
+                     i, p, element); \
+        check_load(i, element, -1, size); \
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
+/* The circular stores will wrap around somewhere inside the buffer */
+#define CIRC_VAL(SZ, TYPE, BUFSIZE) \
+TYPE circ_val_##SZ(int i, int inc, int size) \
+{ \
+    int mod = BUFSIZE % size; \
+    int elem = i * inc; \
+    if (elem < 0) { \
+        if (-elem <= size - mod) { \
+            return (elem + BUFSIZE - mod); \
+        } else { \
+            return (elem + BUFSIZE + size - mod); \
+        } \
+    } else if (elem < mod) {\
+        return (elem + BUFSIZE - mod); \
+    } else { \
+        return (elem + BUFSIZE - size - mod); \
+    } \
+}
+
+CIRC_VAL(b, unsigned char, NBYTES)
+CIRC_VAL(h, short,         NHALFS)
+CIRC_VAL(w, int,           NWORDS)
+CIRC_VAL(d, long long,     NDOBLS)
+
+/*
+ * Circular stores should only write to the first "size" elements of the buffer
+ * the remainder of the elements should have BUF[i] == i
+ */
+#define CHECK_STORE(SZ, BUF, BUFSIZE, FMT) \
+void check_store_##SZ(int inc, int size) \
+{ \
+    int i; \
+    for (i = 0; i < size; i++) { \
+        DEBUG_PRINTF(#BUF "[%3d] = 0x%02" #FMT ", guess = 0x%02" #FMT "\n", \
+                     i, BUF[i], circ_val_##SZ(i, inc, size)); \
+        if (BUF[i] != circ_val_##SZ(i, inc, size)) { \
+            printf("ERROR(%3d): 0x%02" #FMT " != 0x%02" #FMT "\n", \
+                   i, BUF[i], circ_val_##SZ(i, inc, size)); \
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
+    check_store_##CHK(((INC) / (int)sizeof(TYPE)), size); \
+    p = BUF; \
+    val = 0; \
+    init_##BUF(); \
+    for (i = 0; i < BUFSIZE; i++) { \
+        CIRC_STORE_IMM_##SZ(val << SHIFT, p, BUF, size * sizeof(TYPE), \
+                            -(INC)); \
+        val++; \
+    } \
+    check_store_##CHK((-(INC) / (int)sizeof(TYPE)), size); \
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
+    check_store_##CHK(1, size); \
+    p = BUF; \
+    val = 0; \
+    init_##BUF(); \
+    for (i = 0; i < BUFSIZE; i++) { \
+        CIRC_STORE_REG_##SZ(val << SHIFT, p, BUF, size * sizeof(TYPE), -1); \
+        val++; \
+    } \
+    check_store_##CHK(-1, size); \
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
+/* Test the old scheme used in Hexagon V3 */
+static void circ_test_v3(void)
+{
+    int *p = wbuf;
+    int size = 15;
+    int K = 4;      /* 64 bytes */
+    int element;
+    int i;
+
+    init_wbuf();
+
+    for (i = 0; i < NWORDS; i++) {
+        __asm__(
+            "r4 = %2\n\t"
+            "m1 = r4\n\t"
+            "%0 = memw(%1++I:circ(M1))\n\t"
+            : "=r"(element), "+r"(p)
+            : "r"(build_mreg(1, K, size * sizeof(int)))
+            : "r4", "m1");
+        DEBUG_PRINTF("i = %2d, p = 0x%p, element = %2d\n", i, p, element);
+        check_load(i, element, 1, size);
+    }
+}
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
+    circ_test_v3();
+
+    puts(err ? "FAIL" : "PASS");
+    return err ? 1 : 0;
+}
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
index 514c2404ce..68b435ebe7 100644
--- a/target/hexagon/imported/encode_pp.def
+++ b/target/hexagon/imported/encode_pp.def
@@ -294,6 +294,7 @@ DEF_CLASS32(ICLASS_LD" ---- -------- PP------ --------",LD)
 
 
 DEF_CLASS32(ICLASS_LD" 0--- -------- PP------ --------",LD_ADDR_ROFFSET)
+DEF_CLASS32(ICLASS_LD" 100- -------- PP----0- --------",LD_ADDR_POST_CIRC_IMMED)
 DEF_CLASS32(ICLASS_LD" 101- -------- PP00---- --------",LD_ADDR_POST_IMMED)
 DEF_CLASS32(ICLASS_LD" 101- -------- PP01---- --------",LD_ADDR_ABS_UPDATE_V4)
 DEF_CLASS32(ICLASS_LD" 101- -------- PP1----- --------",LD_ADDR_POST_IMMED_PRED_V2)
@@ -308,18 +309,23 @@ DEF_FIELD32(ICLASS_LD" ---- --!----- PP------ --------",LD_UN,"Unsigned")
 
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
+DEF_ENC32(L2_load##TAG##_pbr,  ICLASS_LD" 1 11 "OPC"  xxxxx  PPu0----  0--yyyyy")
 
 
 #define STD_PLD_ENC(TAG,OPC) \
@@ -351,6 +357,7 @@ STD_PLD_ENC(rd,  "1 110") /* note dest reg field LSB=0, 1 is reserved */
 
 DEF_CLASS32(    ICLASS_LD" 0--0 000----- PP------ --------",LD_MISC)
 DEF_ANTICLASS32(ICLASS_LD" 0--0 000----- PP------ --------",LD_ADDR_ROFFSET)
+DEF_ANTICLASS32(ICLASS_LD" 1000 000----- PP------ --------",LD_ADDR_POST_CIRC_IMMED)
 DEF_ANTICLASS32(ICLASS_LD" 1010 000----- PP------ --------",LD_ADDR_POST_IMMED)
 DEF_ANTICLASS32(ICLASS_LD" 1100 000----- PP------ --------",LD_ADDR_POST_REG)
 DEF_ANTICLASS32(ICLASS_LD" 1110 000----- PP------ --------",LD_ADDR_POST_REG)
@@ -397,6 +404,7 @@ DEF_FIELD32(ICLASS_ST" ---! !!------ PP------ --------",ST_Type,"Type")
 DEF_FIELD32(ICLASS_ST" ---- --!----- PP------ --------",ST_UN,"Unsigned")
 
 DEF_CLASS32(ICLASS_ST" 0--1 -------- PP------ --------",ST_ADDR_ROFFSET)
+DEF_CLASS32(ICLASS_ST" 1001 -------- PP------ ------0-",ST_ADDR_POST_CIRC_IMMED)
 DEF_CLASS32(ICLASS_ST" 1011 -------- PP0----- 0-----0-",ST_ADDR_POST_IMMED)
 DEF_CLASS32(ICLASS_ST" 1011 -------- PP0----- 1-------",ST_ADDR_ABS_UPDATE_V4)
 DEF_CLASS32(ICLASS_ST" 1011 -------- PP1----- --------",ST_ADDR_POST_IMMED_PRED_V2)
@@ -411,10 +419,12 @@ DEF_CLASS32(ICLASS_ST" 0--0 0------- PP------ --------",ST_MISC_CACHEOP)
 
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
index 78a2ea441c..6ce0635e32 100644
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
index 65292c7afa..25f57b6f19 100755
--- a/target/hexagon/imported/macros.def
+++ b/target/hexagon/imported/macros.def
@@ -276,6 +276,12 @@ DEF_MACRO(
 /* Read and Write Implicit Regs      */
 /*************************************/
 
+DEF_MACRO(
+    fREAD_IREG, /* read modifier register */
+    (fSXTN(11,64,(((VAL) & 0xf0000000)>>21) | ((VAL>>17)&0x7f) )),          /* behavior */
+    ()
+)
+
 DEF_MACRO(
     fREAD_LR, /* read link register */
     (READ_RREG(REG_LR)),          /* behavior */
@@ -306,6 +312,12 @@ DEF_MACRO(
     ()
 )
 
+DEF_MACRO(
+    fREAD_CSREG, /* read  CS register */
+    (READ_RREG(REG_CSA+N)),          /* behavior */
+    ()
+)
+
 DEF_MACRO(
     fREAD_LC0, /* read loop count */
     (READ_RREG(REG_LC0)),          /* behavior */
@@ -824,6 +836,20 @@ DEF_MACRO(
     ()
 )
 
+DEF_MACRO(
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
 DEF_MACRO(
     fSCALE, /* scale by N */
     (((size8s_t)(A))<<N),
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 18218ad05a..15c7091db5 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -28,6 +28,7 @@ endif
 
 
 CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal
+CFLAGS += -fno-unroll-loops
 
 HEX_SRC=$(SRC_PATH)/tests/tcg/hexagon
 VPATH += $(HEX_SRC)
@@ -41,6 +42,7 @@ HEX_TESTS += preg_alias
 HEX_TESTS += dual_stores
 HEX_TESTS += multi_result
 HEX_TESTS += mem_noshuf
+HEX_TESTS += circ
 HEX_TESTS += atomics
 HEX_TESTS += fpstuff
 
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C253B5FA1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:08:48 +0200 (CEST)
Received: from localhost ([::1]:47704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrwN-0002vf-VW
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmv-0003KN-LA
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:59:01 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmk-00066R-Px
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:59:01 -0400
Received: by mail-wr1-x430.google.com with SMTP id y3so2000045wrq.3
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YRngVAx2194hp4Bsbki6Z8MFxNFrBT5px84jQzug+cI=;
 b=XQrhuoyY/bPeO0nOZRVSDuaNSVpJog2JiUyaMELpUu50WsOz+yFzEEWksVcjwsyxXI
 YQCvHVMha0kkYno8vGRdel/o32vx3YWdHza/AJU/+1Rh9WijUCZd1CwsRXpkLp+9T89w
 Ah1wLGZvnLG0601NfOFP7iZ8vwHSTi6qX2jB2Y0r4dmJw6gjOmioD0mUwXvWb9zpqIYy
 VTwh5cwa5dSEMk26jppzZPY9dUcW2DI5MO6U3t+DhndQWZOdZoITzFbSkD7eNG53+yzM
 fy1luu8W0KydyzOfyeAcefODdSTgP6L7Fsbk2eR4aP7otSkM+Qbxv6nMLuIlaovGAHhh
 /oPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YRngVAx2194hp4Bsbki6Z8MFxNFrBT5px84jQzug+cI=;
 b=uXwwzw5wkmra2H6gYXBCPvDflMSyMeziRo7iVbfyyznG1gDnwIEzj9bXWoRAiN0SWP
 ZlR2QNJXmHes+5XRMpj2M9dFPLlhkEtQvGVhSlHhiuVcwMLavi74xRZl8KLnjGCk/1xB
 LeY+aEDWNO/oaAcOANLCZeQ7sr1yBuaN15bEmaciqA88k8AdDb16dvZ1RXrYhBLz6gak
 6yQrkKXl/0SVq5pvTEueR+wncpM2+Hx5hqX32JArhlFVPagjhfBdp0lgkfSMTb7ay4Eu
 cMrvNPrmYDKEf+hUHGcRONac5l3y8MYGFmljXKd4oDDvAjbR88THkUNjDQHvw5PIxCvP
 3YTg==
X-Gm-Message-State: AOAM533e6//T1+5nz0L0WCEO5PbFcNyhOQln5wV6KsrFWonubaxsaFlN
 ADOFTKOCfmXqwS1J8HiPk6Z60ptEBRGgeK91
X-Google-Smtp-Source: ABdhPJx1JufOToN+cnheqKcw4jqmtKyQ9UXhnrpyIftzDPmrQb8E9rWV7BZ+9MTl8F+CoXvWFAf9fg==
X-Received: by 2002:adf:a18a:: with SMTP id u10mr10625902wru.254.1624888728533; 
 Mon, 28 Jun 2021 06:58:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 16/18] target/arm: Implement MVE long shifts by register
Date: Mon, 28 Jun 2021 14:58:33 +0100
Message-Id: <20210628135835.6690-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE long shifts by register, which perform shifts on a
pair of general-purpose registers treated as a 64-bit quantity, with
the shift count in another general-purpose register, which might be
either positive or negative.

Like the long-shifts-by-immediate, these encodings sit in the space
that was previously the UNPREDICTABLE MOVS/ORRS with Rm==13,15.
Because LSLL_rr and ASRL_rr overlap with both MOV_rxri/ORR_rrri and
also with CSEL (as one of the previously-UNPREDICTABLE Rm==13 cases),
we have to move the CSEL pattern into the same decodetree group.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h |  6 +++
 target/arm/translate.h  |  1 +
 target/arm/t32.decode   | 16 +++++--
 target/arm/mve_helper.c | 93 +++++++++++++++++++++++++++++++++++++++++
 target/arm/translate.c  | 69 ++++++++++++++++++++++++++++++
 5 files changed, 182 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index d3ad7411eb8..7a4316bf8df 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -450,5 +450,11 @@ DEF_HELPER_FLAGS_4(mve_vqrshrunth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(mve_vshlc, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
 
+DEF_HELPER_FLAGS_3(mve_sshrl, TCG_CALL_NO_RWG, i64, env, i64, i32)
+DEF_HELPER_FLAGS_3(mve_ushll, TCG_CALL_NO_RWG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(mve_sqshll, TCG_CALL_NO_RWG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(mve_uqshll, TCG_CALL_NO_RWG, i64, env, i64, i32)
+DEF_HELPER_FLAGS_3(mve_sqrshrl, TCG_CALL_NO_RWG, i64, env, i64, i32)
+DEF_HELPER_FLAGS_3(mve_uqrshll, TCG_CALL_NO_RWG, i64, env, i64, i32)
+DEF_HELPER_FLAGS_3(mve_sqrshrl48, TCG_CALL_NO_RWG, i64, env, i64, i32)
+DEF_HELPER_FLAGS_3(mve_uqrshll48, TCG_CALL_NO_RWG, i64, env, i64, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 8e64ee508c8..10e94335818 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -465,6 +465,7 @@ typedef void CryptoThreeOpIntFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void CryptoThreeOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, MemOp);
 typedef void WideShiftImmFn(TCGv_i64, TCGv_i64, int64_t shift);
+typedef void WideShiftFn(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv_i32);
 
 /**
  * arm_tbflags_from_tb:
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 014725d6ea8..ef0f81016de 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -49,6 +49,7 @@
 &mcrr            !extern cp opc1 crm rt rt2
 
 &mve_shl_ri      rdalo rdahi shim
+&mve_shl_rr      rdalo rdahi rm
 
 # rdahi: bits [3:1] from insn, bit 0 is 1
 # rdalo: bits [3:1] from insn, bit 0 is 0
@@ -68,6 +69,8 @@
 
 @mve_shl_ri      ....... .... . ... . . ... ... . .. .. .... \
                  &mve_shl_ri shim=%imm5_12_6 rdalo=%rdalo_17 rdahi=%rdahi_9
+@mve_shl_rr      ....... .... . ... . rm:4  ... . .. .. .... \
+                 &mve_shl_rr rdalo=%rdalo_17 rdahi=%rdahi_9
 
 {
   TST_xrri       1110101 0000 1 .... 0 ... 1111 .... ....     @S_xrr_shi
@@ -91,8 +94,18 @@ BIC_rrri         1110101 0001 . .... 0 ... .... .... ....     @s_rrr_shi
   SRSHRL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 10 1111  @mve_shl_ri
   SQSHLL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 11 1111  @mve_shl_ri
 
+  LSLL_rr        1110101 0010 1 ... 0 ....  ... 1 0000 1101   @mve_shl_rr
+  ASRL_rr        1110101 0010 1 ... 0 ....  ... 1 0010 1101   @mve_shl_rr
+  UQRSHLL64_rr   1110101 0010 1 ... 1 ....  ... 1 0000 1101   @mve_shl_rr
+  SQRSHRL64_rr   1110101 0010 1 ... 1 ....  ... 1 0010 1101   @mve_shl_rr
+  UQRSHLL48_rr   1110101 0010 1 ... 1 ....  ... 1 1000 1101   @mve_shl_rr
+  SQRSHRL48_rr   1110101 0010 1 ... 1 ....  ... 1 1010 1101   @mve_shl_rr
+
   MOV_rxri       1110101 0010 . 1111 0 ... .... .... ....     @s_rxr_shi
   ORR_rrri       1110101 0010 . .... 0 ... .... .... ....     @s_rrr_shi
+
+  # v8.1M CSEL and friends
+  CSEL           1110101 0010 1 rn:4 10 op:2 rd:4 fcond:4 rm:4
 }
 {
   MVN_rxri       1110101 0011 . 1111 0 ... .... .... ....     @s_rxr_shi
@@ -116,9 +129,6 @@ SBC_rrri         1110101 1011 . .... 0 ... .... .... ....     @s_rrr_shi
 }
 RSB_rrri         1110101 1110 . .... 0 ... .... .... ....     @s_rrr_shi
 
-# v8.1M CSEL and friends
-CSEL             1110101 0010 1 rn:4 10 op:2 rd:4 fcond:4 rm:4
-
 # Data-processing (register-shifted register)
 
 MOV_rxrr         1111 1010 0 shty:2 s:1 rm:4 1111 rd:4 0000 rs:4 \
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 7cd359ec9c2..bba150c7904 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1526,6 +1526,16 @@ uint32_t HELPER(mve_vshlc)(CPUARMState *env, void *vd, uint32_t rdm,
     return rdm;
 }
 
+uint64_t HELPER(mve_sshrl)(CPUARMState *env, uint64_t n, uint32_t shift)
+{
+    return do_sqrshl_d(n, -(int8_t)shift, false, NULL);
+}
+
+uint64_t HELPER(mve_ushll)(CPUARMState *env, uint64_t n, uint32_t shift)
+{
+    return do_uqrshl_d(n, (int8_t)shift, false, NULL);
+}
+
 uint64_t HELPER(mve_sqshll)(CPUARMState *env, uint64_t n, uint32_t shift)
 {
     return do_sqrshl_d(n, (int8_t)shift, false, &env->QF);
@@ -1535,3 +1545,86 @@ uint64_t HELPER(mve_uqshll)(CPUARMState *env, uint64_t n, uint32_t shift)
 {
     return do_uqrshl_d(n, (int8_t)shift, false, &env->QF);
 }
+
+uint64_t HELPER(mve_sqrshrl)(CPUARMState *env, uint64_t n, uint32_t shift)
+{
+    return do_sqrshl_d(n, -(int8_t)shift, true, &env->QF);
+}
+
+uint64_t HELPER(mve_uqrshll)(CPUARMState *env, uint64_t n, uint32_t shift)
+{
+    return do_uqrshl_d(n, (int8_t)shift, true, &env->QF);
+}
+
+/* Operate on 64-bit values, but saturate at 48 bits */
+static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
+                                    bool round, uint32_t *sat)
+{
+    if (shift <= -48) {
+        /* Rounding the sign bit always produces 0. */
+        if (round) {
+            return 0;
+        }
+        return src >> 63;
+    } else if (shift < 0) {
+        if (round) {
+            src >>= -shift - 1;
+            return (src >> 1) + (src & 1);
+        }
+        return src >> -shift;
+    } else if (shift < 48) {
+        int64_t val = src << shift;
+        int64_t extval = sextract64(val, 0, 48);
+        if (!sat || val == extval) {
+            return extval;
+        }
+    } else if (!sat || src == 0) {
+        return 0;
+    }
+
+    *sat = 1;
+    return (1ULL << 47) - (src >= 0);
+}
+
+/* Operate on 64-bit values, but saturate at 48 bits */
+static inline uint64_t do_uqrshl48_d(uint64_t src, int64_t shift,
+                                     bool round, uint32_t *sat)
+{
+    uint64_t val, extval;
+
+    if (shift <= -(48 + round)) {
+        return 0;
+    } else if (shift < 0) {
+        if (round) {
+            val = src >> (-shift - 1);
+            val = (val >> 1) + (val & 1);
+        } else {
+            val = src >> -shift;
+        }
+        extval = extract64(val, 0, 48);
+        if (!sat || val == extval) {
+            return extval;
+        }
+    } else if (shift < 48) {
+        uint64_t val = src << shift;
+        uint64_t extval = extract64(val, 0, 48);
+        if (!sat || val == extval) {
+            return extval;
+        }
+    } else if (!sat || src == 0) {
+        return 0;
+    }
+
+    *sat = 1;
+    return MAKE_64BIT_MASK(0, 48);
+}
+
+uint64_t HELPER(mve_sqrshrl48)(CPUARMState *env, uint64_t n, uint32_t shift)
+{
+    return do_sqrshl48_d(n, -(int8_t)shift, true, &env->QF);
+}
+
+uint64_t HELPER(mve_uqrshll48)(CPUARMState *env, uint64_t n, uint32_t shift)
+{
+    return do_uqrshl48_d(n, (int8_t)shift, true, &env->QF);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 47a151a4ea7..f32caa00749 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5794,6 +5794,75 @@ static bool trans_URSHRL_ri(DisasContext *s, arg_mve_shl_ri *a)
     return do_mve_shl_ri(s, a, gen_urshr64_i64);
 }
 
+static bool do_mve_shl_rr(DisasContext *s, arg_mve_shl_rr *a, WideShiftFn *fn)
+{
+    TCGv_i64 rda;
+    TCGv_i32 rdalo, rdahi;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        /* Decode falls through to ORR/MOV UNPREDICTABLE handling */
+        return false;
+    }
+    if (a->rdahi == 15) {
+        /* These are a different encoding (SQSHL/SRSHR/UQSHL/URSHR) */
+        return false;
+    }
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !arm_dc_feature(s, ARM_FEATURE_M_MAIN) ||
+        a->rdahi == 13 || a->rm == 13 || a->rm == 15 ||
+        a->rm == a->rdahi || a->rm == a->rdalo) {
+        /* These rdahi/rdalo/rm cases are UNPREDICTABLE; we choose to UNDEF */
+        unallocated_encoding(s);
+        return true;
+    }
+
+    rda = tcg_temp_new_i64();
+    rdalo = load_reg(s, a->rdalo);
+    rdahi = load_reg(s, a->rdahi);
+    tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
+
+    /* The helper takes care of the sign-extension of the low 8 bits of Rm */
+    fn(rda, cpu_env, rda, cpu_R[a->rm]);
+
+    tcg_gen_extrl_i64_i32(rdalo, rda);
+    tcg_gen_extrh_i64_i32(rdahi, rda);
+    store_reg(s, a->rdalo, rdalo);
+    store_reg(s, a->rdahi, rdahi);
+    tcg_temp_free_i64(rda);
+
+    return true;
+}
+
+static bool trans_LSLL_rr(DisasContext *s, arg_mve_shl_rr *a)
+{
+    return do_mve_shl_rr(s, a, gen_helper_mve_ushll);
+}
+
+static bool trans_ASRL_rr(DisasContext *s, arg_mve_shl_rr *a)
+{
+    return do_mve_shl_rr(s, a, gen_helper_mve_sshrl);
+}
+
+static bool trans_UQRSHLL64_rr(DisasContext *s, arg_mve_shl_rr *a)
+{
+    return do_mve_shl_rr(s, a, gen_helper_mve_uqrshll);
+}
+
+static bool trans_SQRSHRL64_rr(DisasContext *s, arg_mve_shl_rr *a)
+{
+    return do_mve_shl_rr(s, a, gen_helper_mve_sqrshrl);
+}
+
+static bool trans_UQRSHLL48_rr(DisasContext *s, arg_mve_shl_rr *a)
+{
+    return do_mve_shl_rr(s, a, gen_helper_mve_uqrshll48);
+}
+
+static bool trans_SQRSHRL48_rr(DisasContext *s, arg_mve_shl_rr *a)
+{
+    return do_mve_shl_rr(s, a, gen_helper_mve_sqrshrl48);
+}
+
 /*
  * Multiply and multiply accumulate
  */
-- 
2.20.1



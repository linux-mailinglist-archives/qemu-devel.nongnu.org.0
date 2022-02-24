Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F62A4C3082
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:58:50 +0100 (CET)
Received: from localhost ([::1]:47568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGW1-000729-Im
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:58:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHp-0003zl-2F
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:44:09 -0500
Received: from [2607:f8b0:4864:20::435] (port=37820
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHY-0008MH-HM
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:44:07 -0500
Received: by mail-pf1-x435.google.com with SMTP id y5so2216494pfe.4
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 07:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vf0IIGRnbqt7HbYY9i0mhCfkzAZefWpn29SVpRnKkrw=;
 b=YSMlXXqxkByy5WLwW83UQDOuUNeS3pLjLMpuSfnvfPAHQrjR1bWB6sKw9AY01RoXYr
 6giC7gfj0ORHS9oPcbt2otL6qY+ERX2XdkjkttdmCCexb6bpnH5OAfzqSgBaRFdZtiCh
 8+f7UvCt4aYGu6Y5KQ6kFOMpiuBTCyDtL4ql7NMMWglzBKo1sTo0HmotpSYhYNZ6MLEk
 uchJV49Ra1g2OiShjEB+BD2+zlviOWsBwQOEVJK4VM8TKgU7Kjtxxyi2H6iL3zPlTudQ
 MWlpvbCBakpMjVyLDERnxFVfU6j5lIya5wwSNmtryY4Hhd+glgNR4uAajpuvDQHswVTG
 4g0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vf0IIGRnbqt7HbYY9i0mhCfkzAZefWpn29SVpRnKkrw=;
 b=tpT9QqyxBbibx5VuD4STtCZEBEexsNI8Py+13eSDDYN+I+kn4HVubrqumDMD9XaeT4
 8PvJgQqOfxpEG3t6olgM3vcn4wm1KrPuvyj3w+ZXQhw/a0j2kR+e+1LEGliNWDXulJf8
 AbkXZNsMtJ1BbGzMUYExXwYL1WXklUAEkFisrz8w8H1hOugS+HFIX/CjqIMH+lt6FZaM
 fHJCoaqgQec7ERPP/4mkGPu3v+2hlX1sbE3eNKxn9sCkX2JeBEIC0VKfGcZBPeqUn7dG
 5JNDT9rKpl4sYdKSeydZeP8VNf8Bag8+MjI0d45rBdCNWjya/aefsTJ2JWk0qJYXOtgm
 J1cA==
X-Gm-Message-State: AOAM530tdJLPjIAF9Mrz5ql8k39BvEJbS7hM3wgQ5tNaeT80gXUNFnRS
 4ou/UUoSpKTi4TWL5gLN43CnL/9mGFdarA==
X-Google-Smtp-Source: ABdhPJynCPWI1k7//RmXvvx6dx+I70Ydrbmjer9uq5Y/0+FF77nFGQNWgfD0NYv/sQKc5ZJJKvSR6A==
X-Received: by 2002:a05:6a00:248c:b0:4ce:1932:80dd with SMTP id
 c12-20020a056a00248c00b004ce193280ddmr3439929pfv.48.1645717431206; 
 Thu, 24 Feb 2022 07:43:51 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v20sm3198062pju.9.2022.02.24.07.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:43:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] tcg/s390x: Implement ctpop operation
Date: Thu, 24 Feb 2022 05:43:33 -1000
Message-Id: <20220224154333.125185-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224154333.125185-1-richard.henderson@linaro.org>
References: <20220224154333.125185-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-s390x@nongnu.org, david@redhat.com, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is an older form that produces per-byte results,
and a newer form that produces per-register results,
and a vector form that produces per-element results.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  5 ++--
 tcg/s390x/tcg-target.c.inc | 54 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 4aff59b7c0..42cb900c6d 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -62,6 +62,7 @@ typedef enum TCGReg {
 #define FACILITY_LOAD_ON_COND         45
 #define FACILITY_FAST_BCR_SER         FACILITY_LOAD_ON_COND
 #define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
+#define FACILITY_POPCOUNT             FACILITY_LOAD_ON_COND
 #define FACILITY_LOAD_ON_COND2        53
 #define FACILITY_MISC_INSN_EXT2       58
 #define FACILITY_MISC_INSN_EXT3       61
@@ -91,7 +92,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_nor_i32        HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_clz_i32        0
 #define TCG_TARGET_HAS_ctz_i32        HAVE_FACILITY(VECTOR)
-#define TCG_TARGET_HAS_ctpop_i32      0
+#define TCG_TARGET_HAS_ctpop_i32      HAVE_FACILITY(POPCOUNT)
 #define TCG_TARGET_HAS_deposit_i32    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_extract_i32    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_sextract_i32   0
@@ -128,7 +129,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_nor_i64        HAVE_FACILITY(MISC_INSN_EXT3)
 #define TCG_TARGET_HAS_clz_i64        HAVE_FACILITY(EXT_IMM)
 #define TCG_TARGET_HAS_ctz_i64        HAVE_FACILITY(VECTOR)
-#define TCG_TARGET_HAS_ctpop_i64      0
+#define TCG_TARGET_HAS_ctpop_i64      HAVE_FACILITY(POPCOUNT)
 #define TCG_TARGET_HAS_deposit_i64    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_extract_i64    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_sextract_i64   0
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 9c3f8f365e..4b877c70fe 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -187,6 +187,7 @@ typedef enum S390Opcode {
     RRE_SLBGR   = 0xb989,
     RRE_XGR     = 0xb982,
 
+    RRFa_ALHHLR = 0xb9da,
     RRFa_MGRK   = 0xb9ec,
     RRFa_MSRKC  = 0xb9fd,
     RRFa_MSGRKC = 0xb9ed,
@@ -215,6 +216,7 @@ typedef enum S390Opcode {
 
     RRFc_LOCR   = 0xb9f2,
     RRFc_LOCGR  = 0xb9e2,
+    RRFc_POPCNT = 0xb9e1,
 
     RR_AR       = 0x1a,
     RR_ALR      = 0x1e,
@@ -315,6 +317,7 @@ typedef enum S390Opcode {
     VRRc_VO     = 0xe76a,
     VRRc_VOC    = 0xe76f,
     VRRc_VPKS   = 0xe797,   /* we leave the m5 cs field 0 */
+    VRRa_VPOPCT = 0xe750,
     VRRc_VS     = 0xe7f7,
     VRRa_VUPH   = 0xe7d7,
     VRRa_VUPL   = 0xe7d6,
@@ -1694,6 +1697,48 @@ static void tgen_ctz(TCGContext *s, TCGType type, TCGReg dest,
     tgen_movcond_int(s, type, dest, a2, a2const, src, cc, inv_cc);
 }
 
+static void tgen_ctpop(TCGContext *s, TCGType type, TCGReg dest, TCGReg a1)
+{
+    /* With MIE3, POPCNT can produce the complete result. */
+    if (HAVE_FACILITY(MISC_INSN_EXT3)) {
+        if (type == TCG_TYPE_I32) {
+            tgen_ext32u(s, dest, a1);
+            a1 = dest;
+        }
+        tcg_out_insn(s, RRFc, POPCNT, dest, a1, 8);
+        return;
+    }
+
+    /* Failing that, the vector facility can produce the complete result. */
+    if (HAVE_FACILITY(VECTOR)) {
+        tcg_out_mov(s, type, TCG_TMPV, a1);
+        tcg_out_insn(s, VRRa, VPOPCT, TCG_TMPV, TCG_TMPV,
+                     type == TCG_TYPE_I32 ? MO_32 : MO_64);
+        tcg_out_mov(s, type, dest, TCG_TMPV);
+        return;
+    }
+
+    /*
+     * Failing that, POPCNT produces one byte per byte.
+     * Fold to intermediate results to produce the final value.
+     */
+    tcg_out_insn(s, RRFc, POPCNT, dest, a1, 0);
+    if (type == TCG_TYPE_I32) {
+        tcg_out_sh64(s, RSY_SRLG, TCG_TMP0, dest, TCG_REG_NONE, 16);
+        tcg_out_insn(s, RR, ALR, dest, TCG_TMP0);
+        tcg_out_sh64(s, RSY_SRLG, TCG_TMP0, dest, TCG_REG_NONE, 8);
+        tcg_out_insn(s, RR, ALR, dest, TCG_TMP0);
+        tgen_ext8u(s, TCG_TYPE_I32, dest, dest);
+    } else {
+        tcg_out_insn(s, RRFa, ALHHLR, dest, dest, dest);
+        tcg_out_sh64(s, RSY_SLLG, TCG_TMP0, dest, TCG_REG_NONE, 16);
+        tcg_out_insn(s, RRE, ALGR, dest, TCG_TMP0);
+        tcg_out_sh64(s, RSY_SLLG, TCG_TMP0, dest, TCG_REG_NONE, 8);
+        tcg_out_insn(s, RRE, ALGR, dest, TCG_TMP0);
+        tcg_out_sh64(s, RSY_SRLG, dest, dest, TCG_REG_NONE, 56);
+    }
+}
+
 static void tgen_deposit(TCGContext *s, TCGReg dest, TCGReg src,
                          int ofs, int len, int z)
 {
@@ -2858,6 +2903,13 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tgen_ctz(s, TCG_TYPE_I64, args[0], args[1], args[2], const_args[2]);
         break;
 
+    case INDEX_op_ctpop_i32:
+        tgen_ctpop(s, TCG_TYPE_I32, args[0], args[1]);
+        break;
+    case INDEX_op_ctpop_i64:
+        tgen_ctpop(s, TCG_TYPE_I64, args[0], args[1]);
+        break;
+
     case INDEX_op_mb:
         /* The host memory model is quite strong, we simply need to
            serialize the instruction stream.  */
@@ -3416,6 +3468,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extu_i32_i64:
     case INDEX_op_extract_i32:
     case INDEX_op_extract_i64:
+    case INDEX_op_ctpop_i32:
+    case INDEX_op_ctpop_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_qemu_ld_i32:
-- 
2.25.1



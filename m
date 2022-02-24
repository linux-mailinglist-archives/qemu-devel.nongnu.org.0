Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB024C3037
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:46:30 +0100 (CET)
Received: from localhost ([::1]:50596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGK5-0006Gp-GK
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:46:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHP-0003N2-RX
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:43 -0500
Received: from [2607:f8b0:4864:20::42c] (port=35367
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHN-0008J5-Ph
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:43 -0500
Received: by mail-pf1-x42c.google.com with SMTP id l19so2226658pfu.2
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 07:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s3i7BBXCiqunqAbBUTWJlKhPBZNYA2tVKwZnz7k/ltU=;
 b=b6G2zQJq0H3ewdNi7aR5yOy2v2n0SYh/qNlLpHbm4w0JYgfO4NcC4RkvqL7ATldk60
 BwFgtoND9Ib+LlCH5m8gMalwCpTaIKqeDOySEDx7F+W1asllTUnfW2VKZiGayOCF8yJN
 NcE4CbaCiN0fMhab5xHNdyhRB6eB22uAdTTjea7EoYIe6D2vCX109KLqxAGqFgsarExG
 9YKMLqT1HlFLxAR0BJMc7mDy7aAb42zZy4spNzGQYTuMrMFG9CjSgwrCkygdng/NdgC1
 NPZGWGwdCex9VaX1JksHH4K6h9nsb0Ujpkip0fAFzIHY7+Oy7bJfEP1DNGg+5PcH2Qyo
 D9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s3i7BBXCiqunqAbBUTWJlKhPBZNYA2tVKwZnz7k/ltU=;
 b=0bm7s1h4SyoM7+xcAVfQKqRUT/njkyNk8h3fp/zoXmh+zjHliCaG2ZVGPTWSk8dz03
 KAg99fQT+tSl4BdADzHL8nFDZJV3+5rkv9cvKkiGoBvSRP7B9WKbLox0ppDfUVok3l4L
 d8vKcIgzx4QRZZYIGD2rgGuLCNOUfeADH1Ym0ZjTzBDn21HkVDoCmyKs/GRyi1AmmEl9
 3XhlqEzjgi6YMB4UI+vGsl/2vGS9ICWgs5Zk7cWrL0pCtzZx5XQRPikrNUP4CCpkIUu9
 jYyqXtbT3PNOUfutklQmM9ZImPS7MlR53VlhemR6GgOMKU8pDuMcV8uBw1Bgfj3JRRHS
 2kfQ==
X-Gm-Message-State: AOAM531sx/X7MbRe3a7kjGr01FUEWkjLfo66oIY59egkxvnQ3EFk9+3y
 XGyUh0F8gBoTq1RwfP+jdZ0IqCS6kqan4w==
X-Google-Smtp-Source: ABdhPJxLZ7uBitSAMIrbkfO2eLSq+EXUBdbJeDgEAYBmAqcdybiGevHlnmsV1vxtkWOy71jpThXbjw==
X-Received: by 2002:a63:1e59:0:b0:372:cf4e:d142 with SMTP id
 p25-20020a631e59000000b00372cf4ed142mr2691714pgm.560.1645717420445; 
 Thu, 24 Feb 2022 07:43:40 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v20sm3198062pju.9.2022.02.24.07.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:43:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] tcg/s390x: Support MIE2 multiply single instructions
Date: Thu, 24 Feb 2022 05:43:26 -1000
Message-Id: <20220224154333.125185-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224154333.125185-1-richard.henderson@linaro.org>
References: <20220224154333.125185-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

The MIE2 facility adds 3-operand versions of multiply.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  1 +
 tcg/s390x/tcg-target.h         |  1 +
 tcg/s390x/tcg-target.c.inc     | 34 ++++++++++++++++++++++++----------
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 426dd92e51..685739329e 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -23,6 +23,7 @@ C_O1_I2(r, 0, ri)
 C_O1_I2(r, 0, rI)
 C_O1_I2(r, 0, rJ)
 C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rJ)
 C_O1_I2(r, rZ, r)
 C_O1_I2(v, v, r)
 C_O1_I2(v, v, v)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 69217d995b..a625ef63ac 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -63,6 +63,7 @@ typedef enum TCGReg {
 #define FACILITY_FAST_BCR_SER         FACILITY_LOAD_ON_COND
 #define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
 #define FACILITY_LOAD_ON_COND2        53
+#define FACILITY_MISC_INSN_EXT2       58
 #define FACILITY_VECTOR               129
 #define FACILITY_VECTOR_ENH1          135
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index c1cea8b1fe..ab92a2a82c 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -186,6 +186,8 @@ typedef enum S390Opcode {
     RRE_SLBGR   = 0xb989,
     RRE_XGR     = 0xb982,
 
+    RRFa_MSRKC  = 0xb9fd,
+    RRFa_MSGRKC = 0xb9ed,
     RRFa_NRK    = 0xb9f4,
     RRFa_NGRK   = 0xb9e4,
     RRFa_ORK    = 0xb9f6,
@@ -2256,14 +2258,18 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_mul_i32:
+        a0 = args[0], a1 = args[1], a2 = (int32_t)args[2];
         if (const_args[2]) {
-            if ((int32_t)args[2] == (int16_t)args[2]) {
-                tcg_out_insn(s, RI, MHI, args[0], args[2]);
+            tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
+            if (a2 == (int16_t)a2) {
+                tcg_out_insn(s, RI, MHI, a0, a2);
             } else {
-                tcg_out_insn(s, RIL, MSFI, args[0], args[2]);
+                tcg_out_insn(s, RIL, MSFI, a0, a2);
             }
+        } else if (a0 == a1) {
+            tcg_out_insn(s, RRE, MSR, a0, a2);
         } else {
-            tcg_out_insn(s, RRE, MSR, args[0], args[2]);
+            tcg_out_insn(s, RRFa, MSRKC, a0, a1, a2);
         }
         break;
 
@@ -2513,14 +2519,18 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_mul_i64:
+        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
-            if (args[2] == (int16_t)args[2]) {
-                tcg_out_insn(s, RI, MGHI, args[0], args[2]);
+            tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
+            if (a2 == (int16_t)a2) {
+                tcg_out_insn(s, RI, MGHI, a0, a2);
             } else {
-                tcg_out_insn(s, RIL, MSGFI, args[0], args[2]);
+                tcg_out_insn(s, RIL, MSGFI, a0, a2);
             }
+        } else if (a0 == a1) {
+            tcg_out_insn(s, RRE, MSGR, a0, a2);
         } else {
-            tcg_out_insn(s, RRE, MSGR, args[0], args[2]);
+            tcg_out_insn(s, RRFa, MSGRKC, a0, a1, a2);
         }
         break;
 
@@ -3154,12 +3164,16 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
            MULTIPLY SINGLE IMMEDIATE with a signed 32-bit, otherwise we
            have only MULTIPLY HALFWORD IMMEDIATE, with a signed 16-bit.  */
         return (HAVE_FACILITY(GEN_INST_EXT)
-                ? C_O1_I2(r, 0, ri)
+                ? (HAVE_FACILITY(MISC_INSN_EXT2)
+                   ? C_O1_I2(r, r, ri)
+                   : C_O1_I2(r, 0, ri))
                 : C_O1_I2(r, 0, rI));
 
     case INDEX_op_mul_i64:
         return (HAVE_FACILITY(GEN_INST_EXT)
-                ? C_O1_I2(r, 0, rJ)
+                ? (HAVE_FACILITY(MISC_INSN_EXT2)
+                   ? C_O1_I2(r, r, rJ)
+                   : C_O1_I2(r, 0, rJ))
                 : C_O1_I2(r, 0, rI));
 
     case INDEX_op_shl_i32:
-- 
2.25.1



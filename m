Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4976400C4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:58:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zuA-0007ZE-4N; Fri, 02 Dec 2022 01:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu4-0007YX-Pb
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:08 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu3-0003fF-16
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:08 -0500
Received: by mail-pf1-x42c.google.com with SMTP id x66so4097485pfx.3
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1xf2gNMoqab1oZCQR0m3ylYe6c4vcDw62EIKnNwJnY=;
 b=UVs7saXIuxyfE8d3opEcaFF9Ky0va9GyKzKNvK0K3xQPYFx84dJuPNDgB0+LfwZ0T0
 H2CbHfBtpMpJdKSKtk2nFNymAGPSS2VTn+dXE9abhgLukt6aHYz4KtLO0er3s+Z0dyvn
 iFS978uOj69R4WxvuXo1Dr88NOjsWR2JcF3Agnng3HA8X9UvTYe2vlLevN8M7XZktrTg
 c6pA0qjkISmeBp5XpU+KhZ/S3JmCx/mMrb0mspV5/PtFkOLEd68vPp16w1JRfz80jabD
 +pEPJIV+Xdy/8uX/m6MGvLgcWa1YZSHrlAgg39ON+3dvFH4U9O+bTIBpQh0XnocxtWfz
 +gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1xf2gNMoqab1oZCQR0m3ylYe6c4vcDw62EIKnNwJnY=;
 b=wLS0Gy530IXlfbrdL0xCGv+xBB/JG1d9IszBLf0aotE3hy0LRvikIijzob/EP4Oa9D
 gWtyJq9QGf9ACA6fUVtpjVOXSe0o/HNUQ4qbpxZLVoO2GWtXb7HBrUlC89J82zn8jGk0
 Jsnob95q8QuIY43AiTk9vHFwZ4iwkwJqTIhwT/jd81uCf7fV3NCDHdtRN41+Hpa7SGos
 wPASMtctfAcUqEca4S0TwHU6NuQPlnDmKlC/B8HNDZhSa0D1YkkhK0HquFZx6MWawCW0
 cQtzIf5+hk3WsRRivXYBGMPXniJcrTrx05e2+9JvDx9K8pz7wszve0tHgMKCTcy39IBt
 QV/A==
X-Gm-Message-State: ANoB5pl4rAJFr9i0KaQ4djIzNnBS5iwZsd7BXjNOjrlRv0cfR4d2f+pc
 bTpvJMV0E7pjD5pOgLGPIJip4cXMAM77HLd0
X-Google-Smtp-Source: AA0mqf7bclJrXdtpK8D1frDlBY94LYfchXK6aOUPAUZBzljvlerAcUn8Hu3DkekVxhELLWKbsrB9Jw==
X-Received: by 2002:a63:e404:0:b0:477:f6be:b65b with SMTP id
 a4-20020a63e404000000b00477f6beb65bmr26864015pgi.362.1669963925635; 
 Thu, 01 Dec 2022 22:52:05 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 04/13] tcg/s390x: Distinguish RRF-a and RRF-c formats
Date: Thu,  1 Dec 2022 22:51:51 -0800
Message-Id: <20221202065200.224537-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

One has 3 register arguments; the other has 2 plus an m3 field.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 57 +++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 34de5c5ebe..a489b3359e 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -177,18 +177,19 @@ typedef enum S390Opcode {
     RRE_SLBGR   = 0xb989,
     RRE_XGR     = 0xb982,
 
-    RRF_LOCR    = 0xb9f2,
-    RRF_LOCGR   = 0xb9e2,
-    RRF_NRK     = 0xb9f4,
-    RRF_NGRK    = 0xb9e4,
-    RRF_ORK     = 0xb9f6,
-    RRF_OGRK    = 0xb9e6,
-    RRF_SRK     = 0xb9f9,
-    RRF_SGRK    = 0xb9e9,
-    RRF_SLRK    = 0xb9fb,
-    RRF_SLGRK   = 0xb9eb,
-    RRF_XRK     = 0xb9f7,
-    RRF_XGRK    = 0xb9e7,
+    RRFa_NRK    = 0xb9f4,
+    RRFa_NGRK   = 0xb9e4,
+    RRFa_ORK    = 0xb9f6,
+    RRFa_OGRK   = 0xb9e6,
+    RRFa_SRK    = 0xb9f9,
+    RRFa_SGRK   = 0xb9e9,
+    RRFa_SLRK   = 0xb9fb,
+    RRFa_SLGRK  = 0xb9eb,
+    RRFa_XRK    = 0xb9f7,
+    RRFa_XGRK   = 0xb9e7,
+
+    RRFc_LOCR   = 0xb9f2,
+    RRFc_LOCGR  = 0xb9e2,
 
     RR_AR       = 0x1a,
     RR_ALR      = 0x1e,
@@ -543,8 +544,14 @@ static void tcg_out_insn_RRE(TCGContext *s, S390Opcode op,
     tcg_out32(s, (op << 16) | (r1 << 4) | r2);
 }
 
-static void tcg_out_insn_RRF(TCGContext *s, S390Opcode op,
-                             TCGReg r1, TCGReg r2, int m3)
+static void tcg_out_insn_RRFa(TCGContext *s, S390Opcode op,
+                              TCGReg r1, TCGReg r2, TCGReg r3)
+{
+    tcg_out32(s, (op << 16) | (r3 << 12) | (r1 << 4) | r2);
+}
+
+static void tcg_out_insn_RRFc(TCGContext *s, S390Opcode op,
+                              TCGReg r1, TCGReg r2, int m3)
 {
     tcg_out32(s, (op << 16) | (m3 << 12) | (r1 << 4) | r2);
 }
@@ -1419,7 +1426,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
         /* Emit: d = 0, t = 1, d = (cc ? t : d).  */
         tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
         tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, 1);
-        tcg_out_insn(s, RRF, LOCGR, dest, TCG_TMP0, cc);
+        tcg_out_insn(s, RRFc, LOCGR, dest, TCG_TMP0, cc);
     } else {
         /* Emit: d = 1; if (cc) goto over; d = 0; over:  */
         tcg_out_movi(s, type, dest, 1);
@@ -1438,7 +1445,7 @@ static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
         if (v3const) {
             tcg_out_insn(s, RIE, LOCGHI, dest, v3, cc);
         } else {
-            tcg_out_insn(s, RRF, LOCGR, dest, v3, cc);
+            tcg_out_insn(s, RRFc, LOCGR, dest, v3, cc);
         }
     } else {
         c = tcg_invert_cond(c);
@@ -1468,7 +1475,7 @@ static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
         }
         if (HAVE_FACILITY(LOAD_ON_COND)) {
             /* Emit: if (one bit found) dest = r0.  */
-            tcg_out_insn(s, RRF, LOCGR, dest, TCG_REG_R0, 2);
+            tcg_out_insn(s, RRFc, LOCGR, dest, TCG_REG_R0, 2);
         } else {
             /* Emit: if (no one bit found) goto over; dest = r0; over:  */
             tcg_out_insn(s, RI, BRC, 8, (4 + 4) >> 1);
@@ -2085,7 +2092,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, SR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, SRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, SRK, a0, a1, a2);
         }
         break;
 
@@ -2097,7 +2104,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, NR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, NRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, NRK, a0, a1, a2);
         }
         break;
     case INDEX_op_or_i32:
@@ -2108,7 +2115,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, OR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, ORK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, ORK, a0, a1, a2);
         }
         break;
     case INDEX_op_xor_i32:
@@ -2119,7 +2126,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, XR, args[0], args[2]);
         } else {
-            tcg_out_insn(s, RRF, XRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, XRK, a0, a1, a2);
         }
         break;
 
@@ -2347,7 +2354,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RRE, SGR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, SGRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, SGRK, a0, a1, a2);
         }
         break;
 
@@ -2359,7 +2366,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RRE, NGR, args[0], args[2]);
         } else {
-            tcg_out_insn(s, RRF, NGRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, NGRK, a0, a1, a2);
         }
         break;
     case INDEX_op_or_i64:
@@ -2370,7 +2377,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RRE, OGR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, OGRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, OGRK, a0, a1, a2);
         }
         break;
     case INDEX_op_xor_i64:
@@ -2381,7 +2388,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RRE, XGR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, XGRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, XGRK, a0, a1, a2);
         }
         break;
 
-- 
2.34.1



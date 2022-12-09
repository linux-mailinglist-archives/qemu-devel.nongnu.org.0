Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAA0647C1C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:17:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slv-0005yu-VN; Thu, 08 Dec 2022 21:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slt-0005xc-Gk
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:53 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slr-0001wp-Ox
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:53 -0500
Received: by mail-oi1-x232.google.com with SMTP id q186so3252300oia.9
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/GryLdVxy6DbC9JdLFOg5oT779WNfnXadHx5Ifz/fE=;
 b=kTutfcM3BgDFkYEZmD2+7gjWxHkwtYVxlflt4Queht7GMlsatiGBo0gsRE988KDt0q
 5eQ8QKkvk0HKKVZHQ/smUo1N3zoMkQEDiLPl40x0nh+8WjJUOf+/vylPDPk7Nq46gX+8
 0gGSjPkhK1IjJ5rmRty5SDkx2fscWLRmLB4U7IcG+B83vXPzRklIKjD5Cw1d7CjN8M58
 vFoUpS/5wOv/XVnVr01cg2uVRWsuo42/ETRf5pstYTIsEytAxaJJY/RclCsjIFhhQJsP
 vxJpZU7CmFutfHWDqrpnC9lRwDu5CCEceMhjtdyhVwBgNACkqIokCwm/KfcBLJkMmlfr
 lGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R/GryLdVxy6DbC9JdLFOg5oT779WNfnXadHx5Ifz/fE=;
 b=VF26l5xJmkLupecYiPALLclzWM6wz1iyQq4thm93PTdCZJFJ26buR/6ZGPjgvRN830
 xwUGT/SBul2fXcit50jO1tj5aDG0VScMB34Z0L37HwGO01BpIqbiRW8li9a2BD955HCR
 tC80vHml6dhiabuAUqSAg7Y/pJZ7Fza9rNIFDI2Kq8R1raJT8ViSAivQFjkWRxRDzy1Z
 5JpnVrkOdW5HudTI88r3Id386ltawd8ztfvZ6pyxalba4OzRq38fqoXz0WQ6WRiyfTqv
 8tXvIUipYgJXK+aMmcubv9Ra6/WQjbCPu6R1iTOpwBV9x8BU8OHftRBzhQmaWxN6aDZD
 U1hQ==
X-Gm-Message-State: ANoB5pm33TjPDnkTlqAj1k8wQETBDbaIdBqoPsC/uTNmlqY10xwGvtqg
 NGiyFDpik1C2CtfEqxgoO2tmrJY/iPJ7FOg14s4=
X-Google-Smtp-Source: AA0mqf6W387OwLgw0l1yN8YMj7sE9mEFhrGzaa6d/M6S5Oei08zYZ5n4C3pTTUk2BTmJ3KtPPzBwuA==
X-Received: by 2002:a05:6808:1b23:b0:355:1de8:cd59 with SMTP id
 bx35-20020a0568081b2300b003551de8cd59mr2385992oib.23.1670551547942; 
 Thu, 08 Dec 2022 18:05:47 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 13/27] tcg/s390x: Distinguish RIE formats
Date: Thu,  8 Dec 2022 20:05:16 -0600
Message-Id: <20221209020530.396391-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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

There are multiple variations, with different fields.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 47 +++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index d38a602dd9..a81a82c70b 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -128,16 +128,19 @@ typedef enum S390Opcode {
     RI_OILL     = 0xa50b,
     RI_TMLL     = 0xa701,
 
-    RIE_CGIJ    = 0xec7c,
-    RIE_CGRJ    = 0xec64,
-    RIE_CIJ     = 0xec7e,
-    RIE_CLGRJ   = 0xec65,
-    RIE_CLIJ    = 0xec7f,
-    RIE_CLGIJ   = 0xec7d,
-    RIE_CLRJ    = 0xec77,
-    RIE_CRJ     = 0xec76,
-    RIE_LOCGHI  = 0xec46,
-    RIE_RISBG   = 0xec55,
+    RIEb_CGRJ    = 0xec64,
+    RIEb_CLGRJ   = 0xec65,
+    RIEb_CLRJ    = 0xec77,
+    RIEb_CRJ     = 0xec76,
+
+    RIEc_CGIJ    = 0xec7c,
+    RIEc_CIJ     = 0xec7e,
+    RIEc_CLGIJ   = 0xec7d,
+    RIEc_CLIJ    = 0xec7f,
+
+    RIEf_RISBG   = 0xec55,
+
+    RIEg_LOCGHI  = 0xec46,
 
     RRE_AGR     = 0xb908,
     RRE_ALGR    = 0xb90a,
@@ -556,7 +559,7 @@ static void tcg_out_insn_RI(TCGContext *s, S390Opcode op, TCGReg r1, int i2)
     tcg_out32(s, (op << 16) | (r1 << 20) | (i2 & 0xffff));
 }
 
-static void tcg_out_insn_RIE(TCGContext *s, S390Opcode op, TCGReg r1,
+static void tcg_out_insn_RIEg(TCGContext *s, S390Opcode op, TCGReg r1,
                              int i2, int m3)
 {
     tcg_out16(s, (op & 0xff00) | (r1 << 4) | m3);
@@ -985,9 +988,9 @@ static inline void tcg_out_risbg(TCGContext *s, TCGReg dest, TCGReg src,
                                  int msb, int lsb, int ofs, int z)
 {
     /* Format RIE-f */
-    tcg_out16(s, (RIE_RISBG & 0xff00) | (dest << 4) | src);
+    tcg_out16(s, (RIEf_RISBG & 0xff00) | (dest << 4) | src);
     tcg_out16(s, (msb << 8) | (z << 7) | lsb);
-    tcg_out16(s, (ofs << 8) | (RIE_RISBG & 0xff));
+    tcg_out16(s, (ofs << 8) | (RIEf_RISBG & 0xff));
 }
 
 static void tgen_ext8s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
@@ -1266,7 +1269,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
         /* Emit: d = 0, d = (cc ? 1 : d).  */
         cc = tgen_cmp(s, type, cond, c1, c2, c2const, false);
         tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
-        tcg_out_insn(s, RIE, LOCGHI, dest, 1, cc);
+        tcg_out_insn(s, RIEg, LOCGHI, dest, 1, cc);
         return;
     }
 
@@ -1340,7 +1343,7 @@ static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
 {
     int cc = tgen_cmp(s, type, c, c1, c2, c2const, false);
     if (v3const) {
-        tcg_out_insn(s, RIE, LOCGHI, dest, v3, cc);
+        tcg_out_insn(s, RIEg, LOCGHI, dest, v3, cc);
     } else {
         tcg_out_insn(s, RRFc, LOCGR, dest, v3, cc);
     }
@@ -1409,6 +1412,7 @@ static void tgen_compare_branch(TCGContext *s, S390Opcode opc, int cc,
                                 TCGReg r1, TCGReg r2, TCGLabel *l)
 {
     tcg_out_reloc(s, s->code_ptr + 1, R_390_PC16DBL, l, 2);
+    /* Format RIE-b */
     tcg_out16(s, (opc & 0xff00) | (r1 << 4) | r2);
     tcg_out16(s, 0);
     tcg_out16(s, cc << 12 | (opc & 0xff));
@@ -1418,6 +1422,7 @@ static void tgen_compare_imm_branch(TCGContext *s, S390Opcode opc, int cc,
                                     TCGReg r1, int i2, TCGLabel *l)
 {
     tcg_out_reloc(s, s->code_ptr + 1, R_390_PC16DBL, l, 2);
+    /* Format RIE-c */
     tcg_out16(s, (opc & 0xff00) | (r1 << 4) | cc);
     tcg_out16(s, 0);
     tcg_out16(s, (i2 << 8) | (opc & 0xff));
@@ -1435,8 +1440,8 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
 
     if (!c2const) {
         opc = (type == TCG_TYPE_I32
-               ? (is_unsigned ? RIE_CLRJ : RIE_CRJ)
-               : (is_unsigned ? RIE_CLGRJ : RIE_CGRJ));
+               ? (is_unsigned ? RIEb_CLRJ : RIEb_CRJ)
+               : (is_unsigned ? RIEb_CLGRJ : RIEb_CGRJ));
         tgen_compare_branch(s, opc, cc, r1, c2, l);
         return;
     }
@@ -1449,18 +1454,18 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
      */
     if (type == TCG_TYPE_I32) {
         if (is_unsigned) {
-            opc = RIE_CLIJ;
+            opc = RIEc_CLIJ;
             in_range = (uint32_t)c2 == (uint8_t)c2;
         } else {
-            opc = RIE_CIJ;
+            opc = RIEc_CIJ;
             in_range = (int32_t)c2 == (int8_t)c2;
         }
     } else {
         if (is_unsigned) {
-            opc = RIE_CLGIJ;
+            opc = RIEc_CLGIJ;
             in_range = (uint64_t)c2 == (uint8_t)c2;
         } else {
-            opc = RIE_CGIJ;
+            opc = RIEc_CGIJ;
             in_range = (int64_t)c2 == (int8_t)c2;
         }
     }
-- 
2.34.1



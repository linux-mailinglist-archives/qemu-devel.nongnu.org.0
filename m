Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948A03B78EA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:55:58 +0200 (CEST)
Received: from localhost ([::1]:47656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJpt-00071U-L7
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItT-0000AG-Pt
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:35 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItE-0000y2-C8
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:35 -0400
Received: by mail-pg1-x52c.google.com with SMTP id v7so19397619pgl.2
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Byf+XhtG+qcZv627+lVjuBQ3l6+Bu+/qb7N4RrzRGKk=;
 b=f+elT2nZ8H4YBwT3NHm8NAbDjOnBH1kRIVT+v2iMo+WIQaLOedK7AGevrHso+ub9gu
 vhpvkVMMglELhQaWgRB/sk6xsOMMBQILhTr5kgb5RMpQ/p3cBh48r1HFy4Gpp3dDpP3e
 db8hpW9/5d/Fy+IFDimJ6rnH3r10WZXrE/zKekex+4tZJmaL+Vn5ooVFaSjGL123jFB6
 bKzYh0Hk6M0fF42jYn4+EI1zyV01wHvnhiTRZIUZ87svN/CJi3B14/sbplIH3a0plhrR
 wXeNggpeKHIrdoMFKjzIHVAkT+t6Od91DboD4L9WuIdiZDqHaNzvzDJ5aW15TWb78SyF
 xxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Byf+XhtG+qcZv627+lVjuBQ3l6+Bu+/qb7N4RrzRGKk=;
 b=WuvOgnoYM/CK9EVtgb12VO6kT8VEDuEkbGgyphI+bJa0g3w1bNW/zo0d1Ycjei9q6p
 iN8IKLj+gvs7YfgiBbyIwONG0ulq5ggOcJVkQ2ktfEyoio1kVzwvccVV+iHTqr2+lKkO
 RNYguk7YsntFEfIHcDpfCe+rR8DS/7ociglb7hO/Kh1tztFSdDHo+dmBN8mPPaTDoB/r
 cpeXwfmL/ihCq15LszoXFOlPM2zd/5AjauGH91zZ4xkCOCwPslob9Y1dv5DQqBVcpn+B
 ZNN8i/N4Nn/+6oopia9ri1UVHqT7rkWNcmcOfrIVFRRGTP20RvjmCNOcxef8ERV3DPcv
 D9qA==
X-Gm-Message-State: AOAM533O1JASESDVljb/mE1Kedqsy8DDHBQo8rqHhiEjbX+dQNyO1Pgi
 4q3UQlTgSVrSAywIhf+6TeetXXMv/Rzqvg==
X-Google-Smtp-Source: ABdhPJwt7cXEVGuK+usARNjWfd6+tmODD+fiPKZZ0MpJ04yUIgQ9EClcv1f3L3OLzQCvO77HyyO+rg==
X-Received: by 2002:aa7:818a:0:b029:309:a073:51cb with SMTP id
 g10-20020aa7818a0000b0290309a07351cbmr23699251pfi.40.1624992919014; 
 Tue, 29 Jun 2021 11:55:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/63] tcg/aarch64: Merge tcg_out_rev{16,32,64}
Date: Tue, 29 Jun 2021 11:54:29 -0700
Message-Id: <20210629185455.3131172-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass in the input and output size.  We currently use 3 of the 5
possible combinations; the others may be used by new tcg opcodes.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 42 ++++++++++++++----------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 27cde314a9..8619e54fca 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -475,9 +475,7 @@ typedef enum {
     /* Data-processing (1 source) instructions.  */
     I3507_CLZ       = 0x5ac01000,
     I3507_RBIT      = 0x5ac00000,
-    I3507_REV16     = 0x5ac00400,
-    I3507_REV32     = 0x5ac00800,
-    I3507_REV64     = 0x5ac00c00,
+    I3507_REV       = 0x5ac00000, /* + size << 10 */
 
     /* Data-processing (2 source) instructions.  */
     I3508_LSLV      = 0x1ac02000,
@@ -1417,19 +1415,11 @@ static void tcg_out_brcond(TCGContext *s, TCGType ext, TCGCond c, TCGArg a,
     }
 }
 
-static inline void tcg_out_rev64(TCGContext *s, TCGReg rd, TCGReg rn)
+static inline void tcg_out_rev(TCGContext *s, int ext, MemOp s_bits,
+                               TCGReg rd, TCGReg rn)
 {
-    tcg_out_insn(s, 3507, REV64, TCG_TYPE_I64, rd, rn);
-}
-
-static inline void tcg_out_rev32(TCGContext *s, TCGReg rd, TCGReg rn)
-{
-    tcg_out_insn(s, 3507, REV32, TCG_TYPE_I32, rd, rn);
-}
-
-static inline void tcg_out_rev16(TCGContext *s, TCGReg rd, TCGReg rn)
-{
-    tcg_out_insn(s, 3507, REV16, TCG_TYPE_I32, rd, rn);
+    /* REV, REV16, REV32 */
+    tcg_out_insn_3507(s, I3507_REV | (s_bits << 10), ext, rd, rn);
 }
 
 static inline void tcg_out_sxt(TCGContext *s, TCGType ext, MemOp s_bits,
@@ -1737,13 +1727,13 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
     case MO_UW:
         tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
         if (bswap) {
-            tcg_out_rev16(s, data_r, data_r);
+            tcg_out_rev(s, TCG_TYPE_I32, MO_16, data_r, data_r);
         }
         break;
     case MO_SW:
         if (bswap) {
             tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
-            tcg_out_rev16(s, data_r, data_r);
+            tcg_out_rev(s, TCG_TYPE_I32, MO_16, data_r, data_r);
             tcg_out_sxt(s, ext, MO_16, data_r, data_r);
         } else {
             tcg_out_ldst_r(s, (ext ? I3312_LDRSHX : I3312_LDRSHW),
@@ -1753,13 +1743,13 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
     case MO_UL:
         tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
         if (bswap) {
-            tcg_out_rev32(s, data_r, data_r);
+            tcg_out_rev(s, TCG_TYPE_I32, MO_32, data_r, data_r);
         }
         break;
     case MO_SL:
         if (bswap) {
             tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
-            tcg_out_rev32(s, data_r, data_r);
+            tcg_out_rev(s, TCG_TYPE_I32, MO_32, data_r, data_r);
             tcg_out_sxt(s, TCG_TYPE_I64, MO_32, data_r, data_r);
         } else {
             tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
@@ -1768,7 +1758,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
     case MO_Q:
         tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
         if (bswap) {
-            tcg_out_rev64(s, data_r, data_r);
+            tcg_out_rev(s, TCG_TYPE_I64, MO_64, data_r, data_r);
         }
         break;
     default:
@@ -1788,21 +1778,21 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
         break;
     case MO_16:
         if (bswap && data_r != TCG_REG_XZR) {
-            tcg_out_rev16(s, TCG_REG_TMP, data_r);
+            tcg_out_rev(s, TCG_TYPE_I32, MO_16, TCG_REG_TMP, data_r);
             data_r = TCG_REG_TMP;
         }
         tcg_out_ldst_r(s, I3312_STRH, data_r, addr_r, otype, off_r);
         break;
     case MO_32:
         if (bswap && data_r != TCG_REG_XZR) {
-            tcg_out_rev32(s, TCG_REG_TMP, data_r);
+            tcg_out_rev(s, TCG_TYPE_I32, MO_32, TCG_REG_TMP, data_r);
             data_r = TCG_REG_TMP;
         }
         tcg_out_ldst_r(s, I3312_STRW, data_r, addr_r, otype, off_r);
         break;
     case MO_64:
         if (bswap && data_r != TCG_REG_XZR) {
-            tcg_out_rev64(s, TCG_REG_TMP, data_r);
+            tcg_out_rev(s, TCG_TYPE_I64, MO_64, TCG_REG_TMP, data_r);
             data_r = TCG_REG_TMP;
         }
         tcg_out_ldst_r(s, I3312_STRX, data_r, addr_r, otype, off_r);
@@ -2184,15 +2174,15 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_bswap64_i64:
-        tcg_out_rev64(s, a0, a1);
+        tcg_out_rev(s, TCG_TYPE_I64, MO_64, a0, a1);
         break;
     case INDEX_op_bswap32_i64:
     case INDEX_op_bswap32_i32:
-        tcg_out_rev32(s, a0, a1);
+        tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
         break;
     case INDEX_op_bswap16_i64:
     case INDEX_op_bswap16_i32:
-        tcg_out_rev16(s, a0, a1);
+        tcg_out_rev(s, TCG_TYPE_I32, MO_16, a0, a1);
         break;
 
     case INDEX_op_ext8s_i64:
-- 
2.25.1



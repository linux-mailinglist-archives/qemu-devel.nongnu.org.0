Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EEC3B4D23
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:38:14 +0200 (CEST)
Received: from localhost ([::1]:46452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx1xF-0004cD-7c
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vi-0001kg-75
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:38 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vf-0000Ey-PS
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:37 -0400
Received: by mail-pl1-x636.google.com with SMTP id v12so5856134plo.10
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZlahKAk2GvJoEPglaEhoPSy6nfPWO2g1rLhLI8uKMz8=;
 b=R7+IRrsMgPgCcCEtoJ+wL2WwnF8EC7ehsJ3hU+tR4kvMCGYg+QN4nBrXME3rJBDz8Z
 e41nZojCbScEwm5P6biEsSZ0jH7MO5dA9qVrEgbuChobddSMP5drQGz1sijDoX4tYro4
 M4Wsuh5ywn7lJlJ+bfZLIUNLAxYIL8fqJ2wQrfWZIJboS0VnavwZ8fGkZsg/2IqXDxCs
 i8XsoHw3CB0scyO4/tyDKAw/JGtajv2IZ5cmX4GHwCaxzJCKlxi4ULcZeo1fBOywotn0
 LGHqXoKRUJ67W1CG+8+NmIE9cjilUvN1mzDE5HO+6bGBt7MJSbEcV42bkd9i5fLcuEZS
 ebqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZlahKAk2GvJoEPglaEhoPSy6nfPWO2g1rLhLI8uKMz8=;
 b=qRuLuz+U0XvQQrzF9HKELQuS76i+wwYV3Nh4HX2sRE0iZkD0c3YC3Yarm4MuGmSiV6
 RZDUZDfodQogskvSjXVnt5BbAwWbKQA6xO8pzWh7oVN5tnDelyl2qaUlKArRDbSjMXLP
 QsBnSX53ReZ8nNmBLI2/GbVs3IIjs+lJB9PLt86LTwXfanZ4IrcwTVPzy5+zUMEv8Jgn
 exazMTetzpFeb/MNoPY5sIHBOjL2CFBNxxsh2VPnR8n4Gzafywzow0IKFHVD9ZMZM5rR
 vwaBGF+SfQHd6gwU2X7PtFiqOn5S+n93RN4RAktPzqNf3XJJIhGq1LWV1Xy1jttIi5xH
 1Htg==
X-Gm-Message-State: AOAM5309s76fNGtuK9g2nzKjtJUKA51CAJBN7jTS2RsOS5ydbXVe7rXi
 XObcHExTXhpdOizRj+YrS3LwgUDlRXaf4Q==
X-Google-Smtp-Source: ABdhPJwXJoOKYd6xBeG6iB9C+25y/ckxZVtqhq0bvQKHUPaHrqcWrwLhrRgi4vcaju6kKBgvSXUoIQ==
X-Received: by 2002:a17:90a:17c6:: with SMTP id
 q64mr25529421pja.56.1624689394543; 
 Fri, 25 Jun 2021 23:36:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/29] tcg/aarch64: Merge tcg_out_rev{16,32,64}
Date: Fri, 25 Jun 2021 23:36:05 -0700
Message-Id: <20210626063631.2411938-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Cc: Peter Maydell <peter.maydell@linaro.org>
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



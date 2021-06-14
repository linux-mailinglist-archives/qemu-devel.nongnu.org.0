Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27AF3A5E90
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:49:13 +0200 (CEST)
Received: from localhost ([::1]:39878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiHQ-00055y-Nz
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6k-00026Z-4C
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:11 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6f-0003VJ-Vv
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:09 -0400
Received: by mail-pf1-x42f.google.com with SMTP id u18so9997718pfk.11
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sO8Vuhh9GE568nvDdU8zL4gGQtwmUCpxM4YL6VHIofw=;
 b=jHnphA4vSdjeXtz8hrAycxppoiADzwNcC9BM4APG+HtOAysw5XUECXZViCZ8+rCZH/
 SFtPzkNqIROpHQ0FM19kJQ3FEhsGxLNrP0zvxYoVYtRqmSi4y/jO0Bff/U6wo0G2r4r+
 yn+SITeswH4eFPNMD9bUK2C/vr3VI7oCxOFCH7QaFGcxxoW0zwTp+Espgbd5wcs+R7V3
 a2HEQ8vbxmal38XdGXgGPeCVdzImXUT8JPulETMaeRV+8St+7Bzr+K0QG3rwjjq7ZYpc
 L0c0f1jfFZE5UmjYlNy8cQL6nlrtXs6QkEXg7tohKSFLoVVI1K1eG8bUnZvJxEujx6Xy
 Uuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sO8Vuhh9GE568nvDdU8zL4gGQtwmUCpxM4YL6VHIofw=;
 b=jdWlZ9HG2GQ3g5uveKoFQMzkj0tOgBDEg+ClcOrBpS7gITAMFkqzuFal5Q4RAigUaD
 Z5WROhoGwZfJZaBnazmcmNZ0jhWcGk4zr6TzV6xEiH8PeWc/Il2fWLffl4y+yDuCvN5a
 AhsTNYJkc8oeIK5a1oMGlpkdllaqOWNl3ww89CU/YKxVfgeNPC4LmG9oL6AScHk/KPDU
 X6PYUKIQSHg4/bvJ8h9xxdwdMOwQzbRI2oHlkntS8Y0I8O0NmfVHIZRyAkBiiU/qhvzE
 MX5QMWIM/HFFMIYMea8jkcw04m+qWswpe2uj/dHY28X8ftdCvGWQGhqVq15epbF7yKLy
 sXhg==
X-Gm-Message-State: AOAM533bmX5/iA42DA3Zhpa32h8Ph+VNXq2A6mexwfUVq0xwDhT5Wmqh
 AV/sCOu9GWBPb9DZDFOGNuFzUg6XiFntcw==
X-Google-Smtp-Source: ABdhPJzMeJWP7ONaBqPg1lkUpVifRX5S5/+Y2kMuPlAPy6LmKXfPXrpdag9azdwwJZgpfsXR1P6nQw==
X-Received: by 2002:a63:5203:: with SMTP id g3mr16128997pgb.247.1623659884069; 
 Mon, 14 Jun 2021 01:38:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/28] tcg/arm: Support bswap flags
Date: Mon, 14 Jun 2021 01:37:36 -0700
Message-Id: <20210614083800.1166166-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Combine the three bswap16 routines, and differentiate via the flags.
Use the correct flags combination from the load/store routines, and
pass along the constant parameter from tcg_out_op.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 78 ++++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 5157143246..9824e215be 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1013,50 +1013,44 @@ static inline void tcg_out_ext16u(TCGContext *s, int cond,
     }
 }
 
-static inline void tcg_out_bswap16s(TCGContext *s, int cond, int rd, int rn)
+static void tcg_out_bswap16(TCGContext *s, int cond, int rd, int rn, int flags)
 {
     if (use_armv6_instructions) {
-        /* revsh */
-        tcg_out32(s, 0x06ff0fb0 | (cond << 28) | (rd << 12) | rn);
-    } else {
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        TCG_REG_TMP, 0, rn, SHIFT_IMM_LSL(24));
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        TCG_REG_TMP, 0, TCG_REG_TMP, SHIFT_IMM_ASR(16));
-        tcg_out_dat_reg(s, cond, ARITH_ORR,
-                        rd, TCG_REG_TMP, rn, SHIFT_IMM_LSR(8));
-    }
-}
+        if (flags & TCG_BSWAP_OS) {
+            /* revsh */
+            tcg_out32(s, 0x06ff0fb0 | (cond << 28) | (rd << 12) | rn);
+            return;
+        }
 
-static inline void tcg_out_bswap16(TCGContext *s, int cond, int rd, int rn)
-{
-    if (use_armv6_instructions) {
         /* rev16 */
         tcg_out32(s, 0x06bf0fb0 | (cond << 28) | (rd << 12) | rn);
-    } else {
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        TCG_REG_TMP, 0, rn, SHIFT_IMM_LSL(24));
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        TCG_REG_TMP, 0, TCG_REG_TMP, SHIFT_IMM_LSR(16));
-        tcg_out_dat_reg(s, cond, ARITH_ORR,
-                        rd, TCG_REG_TMP, rn, SHIFT_IMM_LSR(8));
+        if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            /* uxth */
+            tcg_out32(s, 0x06ff0070 | (cond << 28) | (rd << 12) | rd);
+        }
+        return;
     }
-}
 
-/* swap the two low bytes assuming that the two high input bytes and the
-   two high output bit can hold any value. */
-static inline void tcg_out_bswap16st(TCGContext *s, int cond, int rd, int rn)
-{
-    if (use_armv6_instructions) {
-        /* rev16 */
-        tcg_out32(s, 0x06bf0fb0 | (cond << 28) | (rd << 12) | rn);
-    } else {
-        tcg_out_dat_reg(s, cond, ARITH_MOV,
-                        TCG_REG_TMP, 0, rn, SHIFT_IMM_LSR(8));
+    /* Move the high byte down and isolate it. */
+    /* rn=xxAB -> tmp=0xxA -> tmp=000A */
+    tcg_out_dat_reg(s, cond, ARITH_MOV, TCG_REG_TMP, 0, rn, SHIFT_IMM_LSR(8));
+    if (!(flags & TCG_BSWAP_IZ)) {
         tcg_out_dat_imm(s, cond, ARITH_AND, TCG_REG_TMP, TCG_REG_TMP, 0xff);
+    }
+
+    /* Move the low byte up and extend it. */
+    if (!(flags & (TCG_BSWAP_OS | TCG_BSWAP_OZ))) {
+        /* No output extension: rd=xABA */
         tcg_out_dat_reg(s, cond, ARITH_ORR,
                         rd, TCG_REG_TMP, rn, SHIFT_IMM_LSL(8));
+        return;
     }
+
+    /* rn=xxAB -> rd=B000 -> rd=ssBA */
+    tcg_out_dat_reg(s, cond, ARITH_MOV, rd, 0, rn, SHIFT_IMM_LSL(24));
+    tcg_out_dat_reg(s, cond, ARITH_ORR, rd, TCG_REG_TMP, rd,
+                    flags & TCG_BSWAP_OS
+                    ? SHIFT_IMM_ASR(16) : SHIFT_IMM_LSR(16));
 }
 
 static inline void tcg_out_bswap32(TCGContext *s, int cond, int rd, int rn)
@@ -1705,13 +1699,15 @@ static inline void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
     case MO_UW:
         tcg_out_ld16u_r(s, COND_AL, datalo, addrlo, addend);
         if (bswap) {
-            tcg_out_bswap16(s, COND_AL, datalo, datalo);
+            tcg_out_bswap16(s, COND_AL, datalo, datalo,
+                            TCG_BSWAP_IZ | TCG_BSWAP_OZ);
         }
         break;
     case MO_SW:
         if (bswap) {
             tcg_out_ld16u_r(s, COND_AL, datalo, addrlo, addend);
-            tcg_out_bswap16s(s, COND_AL, datalo, datalo);
+            tcg_out_bswap16(s, COND_AL, datalo, datalo,
+                            TCG_BSWAP_IZ | TCG_BSWAP_OS);
         } else {
             tcg_out_ld16s_r(s, COND_AL, datalo, addrlo, addend);
         }
@@ -1766,13 +1762,15 @@ static inline void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc,
     case MO_UW:
         tcg_out_ld16u_8(s, COND_AL, datalo, addrlo, 0);
         if (bswap) {
-            tcg_out_bswap16(s, COND_AL, datalo, datalo);
+            tcg_out_bswap16(s, COND_AL, datalo, datalo,
+                            TCG_BSWAP_IZ | TCG_BSWAP_OZ);
         }
         break;
     case MO_SW:
         if (bswap) {
             tcg_out_ld16u_8(s, COND_AL, datalo, addrlo, 0);
-            tcg_out_bswap16s(s, COND_AL, datalo, datalo);
+            tcg_out_bswap16(s, COND_AL, datalo, datalo,
+                            TCG_BSWAP_IZ | TCG_BSWAP_OS);
         } else {
             tcg_out_ld16s_8(s, COND_AL, datalo, addrlo, 0);
         }
@@ -1862,7 +1860,7 @@ static inline void tcg_out_qemu_st_index(TCGContext *s, int cond, MemOp opc,
         break;
     case MO_16:
         if (bswap) {
-            tcg_out_bswap16st(s, cond, TCG_REG_R0, datalo);
+            tcg_out_bswap16(s, cond, TCG_REG_R0, datalo, 0);
             tcg_out_st16_r(s, cond, TCG_REG_R0, addrlo, addend);
         } else {
             tcg_out_st16_r(s, cond, datalo, addrlo, addend);
@@ -1907,7 +1905,7 @@ static inline void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc,
         break;
     case MO_16:
         if (bswap) {
-            tcg_out_bswap16st(s, COND_AL, TCG_REG_R0, datalo);
+            tcg_out_bswap16(s, COND_AL, TCG_REG_R0, datalo, 0);
             tcg_out_st16_8(s, COND_AL, TCG_REG_R0, addrlo, 0);
         } else {
             tcg_out_st16_8(s, COND_AL, datalo, addrlo, 0);
@@ -2245,7 +2243,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_bswap16_i32:
-        tcg_out_bswap16(s, COND_AL, args[0], args[1]);
+        tcg_out_bswap16(s, COND_AL, args[0], args[1], args[2]);
         break;
     case INDEX_op_bswap32_i32:
         tcg_out_bswap32(s, COND_AL, args[0], args[1]);
-- 
2.25.1



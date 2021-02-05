Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F5B3116FC
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:22:54 +0100 (CET)
Received: from localhost ([::1]:60998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ARB-0001EJ-Fo
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A36-0002WC-CR
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:00 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2m-0003Tj-Ov
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:57 -0500
Received: by mail-pg1-x52a.google.com with SMTP id o21so4168351pgn.12
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nPG7Xcmlwk2vyC0De6Qy+WTUFdq1vGPN65ZNzO4h0N8=;
 b=EsitVyKX3VGFveBg5/yDPX41MvH3ZaYKnmTZuSqDyHDb7cYREGMybY0cIsX9zwnU10
 aMGskTnad8JqBLciHj4u/HvuttQhaHrl/vEuKHU3DODDEqxrlWvMrpBtHXvuFldfd3ox
 77xLiqaZtWpuDs0p6fA7+3MirmdPCqrRH6sXui4JVo3vEpn2PQpWrHvr1BP7dxU4FQ4m
 mlu+96u6fZWwZIGPF843pM06BaD2H8CfwTxzlt/cOxhpcIWVYwfq87AMz1UUmxo+ddM0
 ooGxieZkthkOp4lOxifOAErZ1GvEk13QRk35u3f30hKGQa4aOrlrmnahPaeJW8TM06tk
 86pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nPG7Xcmlwk2vyC0De6Qy+WTUFdq1vGPN65ZNzO4h0N8=;
 b=I3n71WO+OxJsHzAWCasY3gh7rKHbcFzhroZpdSNh/MZvaypnPPgnvEHSMlUMPF7gB3
 JDGLd78zGs0xq2dkEHI38u0Ei1ZBMBDJRZYt5JTDDiKQhBsS3cu6o1n1XfdhNHlpVGIO
 2UCUCVC92VrTxvpZllCfk6WlEK64rvleCAs8iACy2JGvP/ETXTzCWyGCtRvmzjT4HTyy
 A+cFQNLNf4S+emuU53lnaU+ptokFGBCoSfZXO6UJcIU1aD+81EiQ5Wh+RohSDgH9zocF
 1URQY7+en9kTSZPxBTkvD3HC7ewz47K8exdeyZC/J0F9q3exNlXmAcmkNH/39F+pPhso
 EP2g==
X-Gm-Message-State: AOAM5302mgmETETx3/XTt4kW+w8ViRCcfbWKEoDsuisNt6YKtfpXv3r/
 5M1qWb+RiB6gZHDojGbWdtptDS0Lr8KqXR8v
X-Google-Smtp-Source: ABdhPJwm3+1JKXeU4/gApdmDDY+3n3heTWWFKk6Zbn+jIRYUfWLx8HH4WOybq21sWp1hCnGv+UC//A==
X-Received: by 2002:a63:3747:: with SMTP id g7mr6327466pgn.376.1612565858610; 
 Fri, 05 Feb 2021 14:57:38 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/46] tcg/tci: Implement 64-bit division
Date: Fri,  5 Feb 2021 12:56:28 -1000
Message-Id: <20210205225650.1330794-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivially implemented like other arithmetic.
Tested via check-tcg and the ppc64 target.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  4 ++--
 tcg/tci.c                | 28 ++++++++++++++++++++++------
 tcg/tci/tcg-target.c.inc | 10 ++++------
 3 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index bb784e018e..7fc349a3de 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -100,8 +100,8 @@
 #define TCG_TARGET_HAS_extract_i64      0
 #define TCG_TARGET_HAS_sextract_i64     0
 #define TCG_TARGET_HAS_extract2_i64     0
-#define TCG_TARGET_HAS_div_i64          0
-#define TCG_TARGET_HAS_rem_i64          0
+#define TCG_TARGET_HAS_div_i64          1
+#define TCG_TARGET_HAS_rem_i64          1
 #define TCG_TARGET_HAS_ext8s_i64        1
 #define TCG_TARGET_HAS_ext16s_i64       1
 #define TCG_TARGET_HAS_ext32s_i64       1
diff --git a/tcg/tci.c b/tcg/tci.c
index 25329345cf..5c84a1c979 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -894,14 +894,30 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_ri64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
-#if TCG_TARGET_HAS_div_i64
         case INDEX_op_div_i64:
-        case INDEX_op_divu_i64:
-        case INDEX_op_rem_i64:
-        case INDEX_op_remu_i64:
-            TODO();
+            t0 = *tb_ptr++;
+            t1 = tci_read_ri64(regs, &tb_ptr);
+            t2 = tci_read_ri64(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int64_t)t1 / (int64_t)t2);
+            break;
+        case INDEX_op_divu_i64:
+            t0 = *tb_ptr++;
+            t1 = tci_read_ri64(regs, &tb_ptr);
+            t2 = tci_read_ri64(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint64_t)t1 / (uint64_t)t2);
+            break;
+        case INDEX_op_rem_i64:
+            t0 = *tb_ptr++;
+            t1 = tci_read_ri64(regs, &tb_ptr);
+            t2 = tci_read_ri64(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int64_t)t1 % (int64_t)t2);
+            break;
+        case INDEX_op_remu_i64:
+            t0 = *tb_ptr++;
+            t1 = tci_read_ri64(regs, &tb_ptr);
+            t2 = tci_read_ri64(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
             break;
-#endif
         case INDEX_op_and_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 6dc5bac2f3..3327ce3072 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -577,6 +577,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_sar_i64:
     case INDEX_op_rotl_i64:     /* Optional (TCG_TARGET_HAS_rot_i64). */
     case INDEX_op_rotr_i64:     /* Optional (TCG_TARGET_HAS_rot_i64). */
+    case INDEX_op_div_i64:      /* Optional (TCG_TARGET_HAS_div_i64). */
+    case INDEX_op_divu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
+    case INDEX_op_rem_i64:      /* Optional (TCG_TARGET_HAS_div_i64). */
+    case INDEX_op_remu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
         tcg_out_r(s, args[0]);
         tcg_out_ri64(s, const_args[1], args[1]);
         tcg_out_ri64(s, const_args[2], args[2]);
@@ -590,12 +594,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_debug_assert(args[4] <= UINT8_MAX);
         tcg_out8(s, args[4]);
         break;
-    case INDEX_op_div_i64:      /* Optional (TCG_TARGET_HAS_div_i64). */
-    case INDEX_op_divu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
-    case INDEX_op_rem_i64:      /* Optional (TCG_TARGET_HAS_div_i64). */
-    case INDEX_op_remu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
-        TODO();
-        break;
     case INDEX_op_brcond_i64:
         tcg_out_r(s, args[0]);
         tcg_out_ri64(s, const_args[1], args[1]);
-- 
2.25.1



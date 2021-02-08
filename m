Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A87731296F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:37:47 +0100 (CET)
Received: from localhost ([::1]:50496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xMw-0004Ct-Iw
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZO-0003ou-BY
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:34 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZM-0008WP-FD
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:33 -0500
Received: by mail-pg1-x531.google.com with SMTP id m2so2533709pgq.5
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yE3f2/oY1Ir+OoAlm4KxbjGgymDSzAcdp4+YBVGpF4Q=;
 b=Vd+LXf0uGVHaSbYrvU8h5yCXuFtF8X024oeLxHjvIUDGeW1YhgfWyXdaAh9/fFNF4P
 G7WXT3n9EjgV+cui7E7OTM/efff/3xSDlJU8stcJ27+OGQRtuxjqW87hQIsiyh7Yh7LI
 yzTKtPlyZ+SlXobq7ckzn7z1YVZPTn4FZvevJaZl/2uDoocN80S4ZhYac/Xb311qhY3M
 3XSbYgFBsYTkZ8O0p/OfQ1sNTx0Sqh9yBIBApRXpJlQqjIxNCsCBzZHtOjoyYBYH30MO
 2RkkZXVNGRmSBYQ3/1xSoa2bDMfQdXo0PMIPfnO+BkEDIgg8uY3qc31pmdqFqadN9vpm
 6Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yE3f2/oY1Ir+OoAlm4KxbjGgymDSzAcdp4+YBVGpF4Q=;
 b=nL0c/8Inu7AO7mAbnjtcoILZ6tisUaGvl5gMUR6NMiMyVi1VD4rzhVcq15By9BEx9a
 bubdWeHM6B3RTEMaxYunc/vKz+F0/lejbCtBVlMQNqkGk1YXRtAUE/bjA5/fQDILW3f8
 UoNyJnaLXTZfaljmqiIHmFnDtxA8lWPbBniQXRj20xzacq/nz/PQw1EfZ7ABU0pPNNxZ
 Izo51eqPtlSn1jC84Euj39PmM1Hb5P3DyAKf6VCD0afdl2cv2uv8LFaZNIlaYy43e9h+
 oc8TQFmrjE8uVF4Vh4GMyKXyDoIGtkVFo8zbFd+l5UnHQXzq0wqiVzmP3QvZCU48b8N5
 XjzQ==
X-Gm-Message-State: AOAM532QxzCp5DnnJ7gSk7UIG62rcB/CkE5gskKCXe4ID+Nxn55aj9Ik
 Ge5vdjGO/NDewcgSheC3FzpJZ5lm5QOnIA==
X-Google-Smtp-Source: ABdhPJz5Rk+Es4Mp7johpb2LXs49jdM5IvLj9YEYGF0fnoCPmMnfz77S5g/k3Zz7vSds1L01PtiJ9w==
X-Received: by 2002:a63:4d41:: with SMTP id n1mr15398565pgl.147.1612752390839; 
 Sun, 07 Feb 2021 18:46:30 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/15] tcg/arm: Implement tcg_out_mov for vector types
Date: Sun,  7 Feb 2021 18:46:14 -0800
Message-Id: <20210208024625.271018-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 50 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index ca9a71ca64..20088ac61a 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -178,6 +178,7 @@ typedef enum {
 
     INSN_VLD1      = 0xf4200000,  /* VLD1 (multiple single elements) */
     INSN_VST1      = 0xf4000000,  /* VST1 (multiple single elements) */
+    INSN_VMOV      = 0xf2200110,  /* VMOV (register) */
 } ARMInsn;
 
 #define INSN_NOP   (use_armv7_instructions ? INSN_NOP_v6k : INSN_NOP_v4)
@@ -1109,6 +1110,25 @@ static uint32_t encode_vd(TCGReg rd)
     return (extract32(rd, 3, 1) << 22) | (extract32(rd, 0, 3) << 13);
 }
 
+static uint32_t encode_vn(TCGReg rn)
+{
+    tcg_debug_assert(rn >= TCG_REG_Q0);
+    return (extract32(rn, 3, 1) << 7) | (extract32(rn, 0, 3) << 17);
+}
+
+static uint32_t encode_vm(TCGReg rm)
+{
+    tcg_debug_assert(rm >= TCG_REG_Q0);
+    return (extract32(rm, 3, 1) << 5) | (extract32(rm, 0, 3) << 1);
+}
+
+static void tcg_out_vreg3(TCGContext *s, ARMInsn insn, int q, int vece,
+                          TCGReg d, TCGReg n, TCGReg m)
+{
+    tcg_out32(s, insn | (vece << 20) | (q << 6) |
+              encode_vd(d) | encode_vn(n) | encode_vm(m));
+}
+
 static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
                           TCGReg rd, TCGReg rn, int offset)
 {
@@ -2283,16 +2303,34 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
-static inline bool tcg_out_mov(TCGContext *s, TCGType type,
-                               TCGReg ret, TCGReg arg)
+static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
-    tcg_out_mov_reg(s, COND_AL, ret, arg);
-    return true;
+    if (ret == arg) {
+        return true;
+    }
+    switch (type) {
+    case TCG_TYPE_I32:
+        if (ret < TCG_REG_Q0 && arg < TCG_REG_Q0) {
+            tcg_out_mov_reg(s, COND_AL, ret, arg);
+            return true;
+        }
+        return false;
+
+    case TCG_TYPE_V64:
+    case TCG_TYPE_V128:
+        tcg_out_vreg3(s, INSN_VMOV, type - TCG_TYPE_V64, 0, ret, arg, arg);
+        return true;
+
+    default:
+        g_assert_not_reached();
+    }
 }
 
-static inline void tcg_out_movi(TCGContext *s, TCGType type,
-                                TCGReg ret, tcg_target_long arg)
+static void tcg_out_movi(TCGContext *s, TCGType type,
+                         TCGReg ret, tcg_target_long arg)
 {
+    tcg_debug_assert(type == TCG_TYPE_I32);
+    tcg_debug_assert(ret < TCG_REG_Q0);
     tcg_out_movi32(s, COND_AL, ret, arg);
 }
 
-- 
2.25.1



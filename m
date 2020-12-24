Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59CC2E2915
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:50:15 +0100 (CET)
Received: from localhost ([::1]:39784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZR0-0006zQ-Qo
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMI-0001pp-Fo
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:22 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMG-0008IQ-O0
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:22 -0500
Received: by mail-pl1-x62c.google.com with SMTP id s15so1806633plr.9
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/d+dt/50ZxvNyX2um8aZl9JJPUmMeM/hY33UH0tmi+Q=;
 b=dhFVdoN5FUen6e0urFQepm+9uj6g2GpTvvWCm7U9mfrsx8SU+SIMWcjf6Ykp6Fu8yI
 eCG/GHVRVuv4IbgiP7qXjaum0q1o2Us92NpWOHgu2SmOMIRDsdPWklu1vFLC125+9Bnf
 dwrlyQISlSH6iI5U2vNme+RwcWLMW0O3y5KfRu8YATMOl8SzHUQKMcUJgZ1DYTFAXa46
 piNzhVgRF4Tx6YnBbvN/58dMxBZG4PjQ9YhZkwW4oQcHWxMT4sfInZ1gl1rMmdU2+OaQ
 BiBZdJ6FfGkwrBvGil0r99V7md5nYpa/J+xuXeaQ1pOP3/uidUC+XRbWbOZ/Ahcz/JHZ
 alMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/d+dt/50ZxvNyX2um8aZl9JJPUmMeM/hY33UH0tmi+Q=;
 b=luVAQ6M8803Nx0VrNHFrxOdfGIQxINqCYxrkPGMKUdRA9PnD7QR4oykoF2Ig6MCeiZ
 R7uyING3iJE63vVfPsUem2KK57EHC8fGz65BHTLZjYzgIvcVa81yxYoYZiFBOpmbjBax
 bYDLLC5q+N88UVsh/aXBnEwm0km01Sis9MJuM5twlTUzVrRN466KMqVJFL45dc2JuaXs
 kQ8ccR+88BgQ6e2ncxKgdlzfuF+B3JBrS7UYrQGGMBWmRQqh2cNZdNpDgBx5MP8oBoth
 jy91FQ8YJYqswwJy0KtNo1LQDwEwKJBaYvUkCv1lonNbIvveF/IPjfoRouLgq3DWpIOm
 pPjw==
X-Gm-Message-State: AOAM533ho4ZCDM2/Xw7W+NnE9mhbI1FeSf8tfuU35qmLaAi1D2Tr4pwr
 XKi4xX1uC6hRtnyjUSMsM3HFmYJWvw1KXg==
X-Google-Smtp-Source: ABdhPJzNVp/8amoxuubmKb0T3UxrZEITl3wK7z3o2v+NACcetZFEWceua+2adQJWS07/XKOeOglVgg==
X-Received: by 2002:a17:90a:db4e:: with SMTP id
 u14mr6020202pjx.184.1608849919002; 
 Thu, 24 Dec 2020 14:45:19 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/15] tcg/arm: Implement tcg_out_mov for vector types
Date: Thu, 24 Dec 2020 14:45:02 -0800
Message-Id: <20201224224514.626561-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
index 7122d5f390..acc8f2c44a 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -178,6 +178,7 @@ typedef enum {
 
     INSN_VLD1      = 0xf4200000,  /* VLD1 (multiple single elements) */
     INSN_VST1      = 0xf4000000,  /* VST1 (multiple single elements) */
+    INSN_VMOV      = 0xf2200110,  /* VMOV (register) */
 } ARMInsn;
 
 #define INSN_NOP   (use_armv7_instructions ? INSN_NOP_v6k : INSN_NOP_v4)
@@ -1086,6 +1087,25 @@ static uint32_t encode_vd(TCGReg rd)
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
@@ -2260,16 +2280,34 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
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



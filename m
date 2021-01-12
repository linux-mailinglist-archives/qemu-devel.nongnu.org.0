Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA72F3BF6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:57:05 +0100 (CET)
Received: from localhost ([::1]:52030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzRey-0003rj-3r
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRdE-0002WO-6A
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:16 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzRdC-0001Rk-Pd
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:55:15 -0500
Received: by mail-wr1-x431.google.com with SMTP id 91so13576wrj.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R5+CptAzrxEHDBYh29wFpGC187htOzgdNCjnN5XvwCI=;
 b=OCi/7PPdCubpE/c1YGbvItN8Lus43KTft0crVkPZEh3v+wKXkibv0r5G8DPThsMCiq
 bDHvi915BFBtMwWPJZsWs2ymeIB41zXtJBljhydP8+qZC+QuviOA+jT5CbNpxvt5yMf7
 BdwyMkxNG+sjcuX8+rz2WJlqJHIABM+aPpkm90v1Z9VxM7LfXYQSDNBZBUzfEPZID7XW
 7eFwb1Ny5LshEp3qnL47gmLQbCCQNIaJO5bYZlLEKfGu5iDDvKCgn0DaRsG1zQT7z4rh
 j4RxUyT8ycFgMxMxQdjTpV4Rc/D6j0sEJ2+lMo6BfauKrg/YQW5a/FVM4xR4gcIT6LTy
 yzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R5+CptAzrxEHDBYh29wFpGC187htOzgdNCjnN5XvwCI=;
 b=KrDbabVb/oVVIcEJ7O7E/K8zdPTyl8ZfElF89kbzGmD3LrbUMPzrH0j3JdQchJmb57
 EsGVv+MEPAqr+fAZ84ugSrOy1Dx7TpgO6pESVl42LJKKkXB2dsJoxvgkJof6m6Y5gJSG
 895mQeXF1dr9HFKpMn0J0iGgKI6sdnpz6kLKomIr5tqENKI/AHvuspdOioM8WNzBrl0l
 pJrq4mjgamjHtfLl/vsdprW2gMcfynZXYrVWjuJFQFfLmlnDGeLEdq7ZZHE8uTvKciFd
 jBzcZ4JnS+JVJa/tDaZtT4NIWlLyUGuIrZso3lCbjvBXl13v8f6iVk+MYDkHNHeiOc0N
 jYUw==
X-Gm-Message-State: AOAM532JyWomRtzYx5cgJfyK070g2TWwi/fZMgsa225achj0SRV9uJpO
 QGuTpRd3qG7gJ9d8t5ujYYzI5D+FLnM=
X-Google-Smtp-Source: ABdhPJzMBcnPXrKy4BIW6pIYL+mccqHozAO6UWN6KE1lFANP/0Mf+DjQqu0jAh2mUw8jI0x0vSwYmA==
X-Received: by 2002:adf:8342:: with SMTP id 60mr842567wrd.140.1610488513085;
 Tue, 12 Jan 2021 13:55:13 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id h16sm5609960wmb.41.2021.01.12.13.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:55:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/mips: Re-introduce OPC_ADDUH_QB_DSP and
 OPC_MUL_PH_DSP
Date: Tue, 12 Jan 2021 22:54:59 +0100
Message-Id: <20210112215504.2093955-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112215504.2093955-1-f4bug@amsat.org>
References: <20210112215504.2093955-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no issue having multiple enum declarations with
the same value. As we are going to remove the OPC_MULT_G_2E
definition in few commits, restore the OPC_ADDUH_QB_DSP and
OPC_MUL_PH_DSP definitions and use them where they belong.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index a2b3026132d..cbd152eff50 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -399,16 +399,14 @@ enum {
     OPC_ADDU_OB_DSP    = 0x14 | OPC_SPECIAL3,
     OPC_ABSQ_S_PH_DSP  = 0x12 | OPC_SPECIAL3,
     OPC_ABSQ_S_QH_DSP  = 0x16 | OPC_SPECIAL3,
-    /* OPC_ADDUH_QB_DSP is same as OPC_MULT_G_2E.  */
-    /* OPC_ADDUH_QB_DSP   = 0x18 | OPC_SPECIAL3,  */
+    OPC_ADDUH_QB_DSP   = 0x18 | OPC_SPECIAL3,
     OPC_CMPU_EQ_QB_DSP = 0x11 | OPC_SPECIAL3,
     OPC_CMPU_EQ_OB_DSP = 0x15 | OPC_SPECIAL3,
     /* MIPS DSP GPR-Based Shift Sub-class */
     OPC_SHLL_QB_DSP    = 0x13 | OPC_SPECIAL3,
     OPC_SHLL_OB_DSP    = 0x17 | OPC_SPECIAL3,
     /* MIPS DSP Multiply Sub-class insns */
-    /* OPC_MUL_PH_DSP is same as OPC_ADDUH_QB_DSP.  */
-    /* OPC_MUL_PH_DSP     = 0x18 | OPC_SPECIAL3,  */
+    OPC_MUL_PH_DSP     = 0x18 | OPC_SPECIAL3,
     OPC_DPA_W_PH_DSP   = 0x30 | OPC_SPECIAL3,
     OPC_DPAQ_W_QH_DSP  = 0x34 | OPC_SPECIAL3,
     /* DSP Bit/Manipulation Sub-class */
@@ -566,7 +564,6 @@ enum {
     OPC_MULQ_S_PH      = (0x1E << 6) | OPC_ADDU_QB_DSP,
 };
 
-#define OPC_ADDUH_QB_DSP OPC_MULT_G_2E
 #define MASK_ADDUH_QB(op)           (MASK_SPECIAL3(op) | (op & (0x1F << 6)))
 enum {
     /* MIPS DSP Arithmetic Sub-class */
@@ -22681,8 +22678,7 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
     gen_load_gpr(v2_t, v2);
 
     switch (op1) {
-    /* OPC_MULT_G_2E is equal OPC_ADDUH_QB_DSP */
-    case OPC_MULT_G_2E:
+    case OPC_ADDUH_QB_DSP:
         check_dsp_r2(ctx);
         switch (op2) {
         case OPC_ADDUH_QB:
@@ -23376,11 +23372,7 @@ static void gen_mipsdsp_multiply(DisasContext *ctx, uint32_t op1, uint32_t op2,
     gen_load_gpr(v2_t, v2);
 
     switch (op1) {
-    /*
-     * OPC_MULT_G_2E, OPC_ADDUH_QB_DSP, OPC_MUL_PH_DSP have
-     * the same mask and op1.
-     */
-    case OPC_MULT_G_2E:
+    case OPC_MUL_PH_DSP:
         check_dsp_r2(ctx);
         switch (op2) {
         case  OPC_MUL_PH:
@@ -27337,7 +27329,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
          * OPC_MULT_G_2E, OPC_ADDUH_QB_DSP, OPC_MUL_PH_DSP have
          * the same mask and op1.
          */
-        if ((ctx->insn_flags & ASE_DSP_R2) && (op1 == OPC_MULT_G_2E)) {
+        if ((ctx->insn_flags & ASE_DSP_R2) && (op1 == OPC_MUL_PH_DSP)) {
             op2 = MASK_ADDUH_QB(ctx->opcode);
             switch (op2) {
             case OPC_ADDUH_QB:
-- 
2.26.2



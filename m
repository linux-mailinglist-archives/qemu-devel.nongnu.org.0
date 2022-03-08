Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6269C4D1106
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:32:54 +0100 (CET)
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUKz-0004i2-7m
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:32:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8r-00053S-JW
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:23 -0500
Received: from [2607:f8b0:4864:20::636] (port=33745
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8q-0006Gu-5E
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:21 -0500
Received: by mail-pl1-x636.google.com with SMTP id m2so10296940pll.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hnm7ONwW3b6w8PSvN2V8w956oTjdf4vnzb4T0LKj/Ww=;
 b=NpafVhxgGT1tHKxyOFWMUigif028Z986BPrw0QzES9dwjx8d+jxCXF5x2TNQD3hfBx
 qU6wq2D8ftvYXfshIhDFXVIcn2Ypsem8xhptKz0TIbWdKEGLQC96qrokpWDaiRHyi81I
 cgN+UnAtR+7pFLzSKy36YcD3rb26yv6E+FchXOrjOjggVp9XnR9K9ZQOgvB8XEi2SIsR
 FUfK1BEMLJsvLiq5eoWeXWN1V2CqXXtCshKGN7CYoXN3fC4v9bLZkC6qyDK4CTs+nQcY
 XIGc7p89vWlEQB7kf3jeBg4qJB9Kmm96HColctzz//3Fon1qfKeIm4/pq0XeVpT6U69W
 yK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hnm7ONwW3b6w8PSvN2V8w956oTjdf4vnzb4T0LKj/Ww=;
 b=gECztkH+66dPJKYw5r3aPSYA9wUbVgHZTT6hQUrFnHb5hI62qPjuP1QWCK0MyhlpiL
 yMq8MdWaAkDOX0FyZndQCo+7048QoACvrzBcTZUMzTMkAunldPMcnzgnt3ZOliMx3gAO
 vcuPWOzTFtGA+ZKSf+4uk31Tdt84YWLIWD9kO+PuGvszNJCItWHHsmka6j/SbuMVzeCg
 LQrPJIblnwRw3JseHj0VsTGEbBgOIWz5+unXWQxJgOnOWbTpR7StbxMLP2lJZk+KqFa7
 cNFZP8i6DOOD/DXX0FYh++5DP46dYcLL39GbgmJ3PRn1PT0YVWe1YbkQ4SCS69MaI/CP
 Y4dA==
X-Gm-Message-State: AOAM530q9gVPVa/JMmJWf4E96eUiwWg7npMIGQMX57/Lo8Vag7Z8+VVb
 tOcXh8hVo8mOYOQ1Iufjp9AO+YBmYUAhkQ==
X-Google-Smtp-Source: ABdhPJxlvAd3g12NPD/NckVQxV9n5xxNN4w370JOlHoR0WtWW+bxpBmjN351j47COW66sBENw55jtw==
X-Received: by 2002:a17:90a:1188:b0:1bd:36d0:d7b2 with SMTP id
 e8-20020a17090a118800b001bd36d0d7b2mr3151245pja.223.1646724018837; 
 Mon, 07 Mar 2022 23:20:18 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/33] target/nios2: Do not create TCGv for control
 registers
Date: Mon,  7 Mar 2022 21:19:38 -1000
Message-Id: <20220308072005.307955-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to reference them often, and when we do it
is just as easy to load/store from cpu_env directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index fe21bf45af..cefdcea81e 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -103,7 +103,7 @@ typedef struct DisasContext {
     int               mem_idx;
 } DisasContext;
 
-static TCGv cpu_R[NUM_CORE_REGS];
+static TCGv cpu_R[NUM_GP_REGS];
 static TCGv cpu_pc;
 
 typedef struct Nios2Instruction {
@@ -453,6 +453,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
 static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
+    TCGv t1, t2;
 
     if (!gen_check_supervisor(dc)) {
         return;
@@ -472,10 +473,19 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
          * must perform the AND here, and anywhere else we need the
          * guest value of ipending.
          */
-        tcg_gen_and_tl(cpu_R[instr.c], cpu_R[CR_IPENDING], cpu_R[CR_IENABLE]);
+        t1 = tcg_temp_new();
+        t2 = tcg_temp_new();
+        tcg_gen_ld_tl(t1, cpu_env,
+                      offsetof(CPUNios2State, regs[CR_IPENDING]));
+        tcg_gen_ld_tl(t2, cpu_env,
+                      offsetof(CPUNios2State, regs[CR_IENABLE]));
+        tcg_gen_and_tl(cpu_R[instr.c], t1, t2);
+        tcg_temp_free(t1);
+        tcg_temp_free(t2);
         break;
     default:
-        tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
+        tcg_gen_ld_tl(cpu_R[instr.c], cpu_env,
+                      offsetof(CPUNios2State, regs[instr.imm5 + CR_BASE]));
         break;
     }
 }
@@ -512,7 +522,8 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
         dc->base.is_jmp = DISAS_UPDATE;
         /* fall through */
     default:
-        tcg_gen_mov_tl(cpu_R[instr.imm5 + CR_BASE], v);
+        tcg_gen_st_tl(v, cpu_env,
+                      offsetof(CPUNios2State, regs[instr.imm5 + CR_BASE]));
         break;
     }
 #endif
@@ -900,7 +911,7 @@ void nios2_tcg_init(void)
 {
     int i;
 
-    for (i = 0; i < NUM_CORE_REGS; i++) {
+    for (i = 0; i < NUM_GP_REGS; i++) {
         cpu_R[i] = tcg_global_mem_new(cpu_env,
                                       offsetof(CPUNios2State, regs[i]),
                                       regnames[i]);
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68AB4D10F0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:27:25 +0100 (CET)
Received: from localhost ([::1]:35976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUFg-0005DQ-S2
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:27:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8q-00052y-Gv
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:20 -0500
Received: from [2607:f8b0:4864:20::432] (port=39426
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8o-0006GK-I4
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:19 -0500
Received: by mail-pf1-x432.google.com with SMTP id d17so7755871pfv.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=15hlNvkyzEehRLy4eHDGVhK7xmnt7sbQeH8nIQruRKI=;
 b=OcuPWW8CBK5KPIvopeaLtqgADr8x8lWQOTYM7mCvpDmTWljIkzXtuhl5on/b9pufXu
 dc9vpEC1+U/SopFjuufECiwlxJblgcL1RahGMQia+xG6T48KVvc8ldgIanKh7rvFJxaI
 dPYAm1yQx92FIluP25uZM+HmKtMkIZr57RwUcEtjtTGEgnY6xITa2a65nxevWblt8gpq
 4mB1/8RXRxDppjk6j3mRbB+dbJrRrrWxN8QW4uBLGghaZExB6HNv09Z29BB5hVhhSDEl
 LxgVkjki+5dyBombZIDQS4qOwUb41DHTItjEq9XwTO/CQTp6tXit3y/tG7pbO3lYQL0q
 v37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=15hlNvkyzEehRLy4eHDGVhK7xmnt7sbQeH8nIQruRKI=;
 b=tjXLsdgMVGQNcvtFttJ2NFJAVy5m5pHRqiujYjNFKuO4sUaAm8aLXiN+3w1eBB7M+v
 4tg6QQiaQM3XxvwSMG/tJxuz/wSgqygcOKApHmc9C4OiaLMuI3PZGqEr4QeALHdiryPH
 LFI625zF/sAIyjUO3Ppo4uKJid1X2cthGtXu1abc41BJrk/8/F6vSekBQv9g77c1hZ+e
 pA4Yl3pTjC645S4qS9T3bn07dPSs1LFxYdp3O81ZLmumsEWRrUGXmPnBJFGAxsL/sUpN
 YFHd5mCqSQPsSjTqFzjpjl8xErsH4VkUHxnyK8kaPQQDugBuvX85QF/hrxQm1EOCZadb
 bZkw==
X-Gm-Message-State: AOAM530Zf8YFnIxItKwqr9g/PRtmPQWiXCAM2Ddp7JlJ43KGaymBx68l
 sGw6lsmOe+Z/C8bJgcP4k7AVdlVtKudNAQ==
X-Google-Smtp-Source: ABdhPJxWoMMuItrZdPMniD+QjjhT46husUjdCUCejuIXUmA8j6K2pJ6qMhB8dkwj/YmNgKIjhtcPrA==
X-Received: by 2002:a05:6a00:244d:b0:4e0:1f65:d5da with SMTP id
 d13-20020a056a00244d00b004e01f65d5damr16909243pfj.6.1646724017243; 
 Mon, 07 Mar 2022 23:20:17 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/33] target/nios2: Split out helper for eret instruction
Date: Mon,  7 Mar 2022 21:19:37 -1000
Message-Id: <20220308072005.307955-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

The implementation of eret will become much more complex
with the introduction of shadow registers.

Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
[rth: Split out of a larger patch for shadow register sets.
      Directly exit to the cpu loop from the helper.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.h    |  1 +
 target/nios2/op_helper.c |  9 +++++++++
 target/nios2/translate.c | 10 ++++++----
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index a44ecfdf7a..02797c384d 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -21,6 +21,7 @@
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
+DEF_HELPER_2(eret, noreturn, env, i32)
 DEF_HELPER_2(mmu_write_tlbacc, void, env, i32)
 DEF_HELPER_2(mmu_write_tlbmisc, void, env, i32)
 DEF_HELPER_2(mmu_write_pteaddr, void, env, i32)
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index caa885f7b4..df48e82cc2 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -30,3 +30,12 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
     cs->exception_index = index;
     cpu_loop_exit(cs);
 }
+
+#ifndef CONFIG_USER_ONLY
+void helper_eret(CPUNios2State *env, uint32_t new_pc)
+{
+    env->regs[CR_STATUS] = env->regs[CR_ESTATUS];
+    env->pc = new_pc;
+    cpu_loop_exit(env_cpu(env));
+}
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 7a33181c4b..fe21bf45af 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -391,10 +391,12 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
         return;
     }
 
-    tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_EA]);
-
-    dc->base.is_jmp = DISAS_JUMP;
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    gen_helper_eret(cpu_env, cpu_R[R_EA]);
+    dc->base.is_jmp = DISAS_NORETURN;
+#endif
 }
 
 /* PC <- ra */
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422514DBE12
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:18:29 +0100 (CET)
Received: from localhost ([::1]:44488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiWq-0003p1-AU
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:18:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKa-0000Pr-Na
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:48 -0400
Received: from [2607:f8b0:4864:20::636] (port=39430
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKZ-0002Cv-4P
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:48 -0400
Received: by mail-pl1-x636.google.com with SMTP id d18so3558666plr.6
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JwvNUZim2yApAOIks/gNVf1oLVx5CVGA+91qmxfeNYY=;
 b=k917HWq/iApWpmnPKFi67UggyNWz8Z6FLFyfAxPHGfYu+XfOlo63pPsMtPRfHjAYr+
 AMG885VFHtpOlGnzAFq1PuQd0PwMEjraLnB2DLL2Pe/3IA38K02EXNYk6JwcKCBFkwvX
 SB2qeg286BeUk48nYy3WyX2EaXXpL9MEkQ677GwjYB0viI/DT2DryXBsgTL4i9gnt7VI
 vFEvVwdvLXqW9sgiFQPQiDxiPmRpF6Wjd5lCY6cO/50/zgCu2eHySHS2BAEveOiwSa0l
 /t5oo3JZYD0zIeouRyXd1kGs7Vl/N7qIaqzZCnYTiKds8pbxo81lXLpdBFZ/R3GxRnBh
 MLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JwvNUZim2yApAOIks/gNVf1oLVx5CVGA+91qmxfeNYY=;
 b=owjuUvQtdOlEFxG0O+Y826tdnTDue7dmIhMrrOjoOjHf8HQVGIvEbmkmdhHHKYdlHv
 zSTVNgJoxxsJgnw/IBtk4ogD8Qo/R2DfkzX0OeYcHF+jrJNw5Lb+/Au5OQXK5V4OQU1T
 LMYN2GB+cGrBtPcGDTTKTLgKiZq/+K5dkwoWXRojHADbkZx0Ec28G+r4lJ5ev7/QVmWJ
 xPqY5l80jvSXp09bSGw7fLT/18YOrMJgv4a0/qlWqE+E7rCg74t1ahj2U7/Ko428mEd/
 TT9U84kCxTog2HC6MC7BEee+LIrnhtk2FjPdDATlsNdoMmrqpSSE49IA57GobB/qhFCJ
 oRKQ==
X-Gm-Message-State: AOAM533KPwBHjQ0fzagWhUHfvhOLylFcGvzdBXyicPETykU1zr6E4dGX
 eCP+Y4U5frSrv2pz6GhA1U6S0OmqHgvfkw==
X-Google-Smtp-Source: ABdhPJzwWFK0xxbxBrmpGP4icV3n8OSr82Ez0LuY8lPS9H+pj/ISQc02i8YVO9DaNbKUha2W+YVwog==
X-Received: by 2002:a17:90b:4b09:b0:1c6:3223:8048 with SMTP id
 lx9-20020a17090b4b0900b001c632238048mr13404880pjb.240.1647493545764; 
 Wed, 16 Mar 2022 22:05:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 06/51] target/nios2: Split out helper for eret
 instruction
Date: Wed, 16 Mar 2022 22:04:53 -0700
Message-Id: <20220317050538.924111-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

The implementation of eret will become much more complex
with the introduction of shadow registers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index a44ecfdf7a..525b6b685b 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -21,6 +21,7 @@
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
+DEF_HELPER_3(eret, noreturn, env, i32, i32)
 DEF_HELPER_2(mmu_write_tlbacc, void, env, i32)
 DEF_HELPER_2(mmu_write_tlbmisc, void, env, i32)
 DEF_HELPER_2(mmu_write_pteaddr, void, env, i32)
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index caa885f7b4..ee5ad8b23f 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -30,3 +30,12 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
     cs->exception_index = index;
     cpu_loop_exit(cs);
 }
+
+#ifndef CONFIG_USER_ONLY
+void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
+{
+    env->regs[CR_STATUS] = new_status;
+    env->pc = new_pc;
+    cpu_loop_exit(env_cpu(env));
+}
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 154ffacbea..7c2c430e99 100644
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
+    gen_helper_eret(cpu_env, cpu_R[CR_ESTATUS], cpu_R[R_EA]);
+    dc->base.is_jmp = DISAS_NORETURN;
+#endif
 }
 
 /* PC <- ra */
-- 
2.25.1



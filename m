Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1832650BF01
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:48:16 +0200 (CEST)
Received: from localhost ([::1]:53316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxOB-0004Qe-2N
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwb4-0000YH-LH
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:30 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:36770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwb3-00083X-0Q
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:30 -0400
Received: by mail-il1-x12f.google.com with SMTP id k12so5429301ilv.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3naWy5W9s9QUNBHvEd2IV7OasikpkGCP8dcpLW6o6A=;
 b=jNdBMGRn+kzI3VFo/qjqiviZ7qwpUAsm5vJ6zRC9GFGttOXmLZ/WaXnG7WERQC5o6r
 Y2C4t8JA1Jb7abWWLWkV6W9GgJ9EdTBCrdUJ1aDuZZjZ2IjfP1MD83CCdxFu6Yh4JqPP
 KdCwidIpCIQbPgaE0HbW2fjhqnGOZ22fQ9cnd9Soyh8lVRL2ta7CbLM2Zt4oQ1w+3Wka
 pzX3r3HqlR+pQYZxUvEuf5atJqsUgE8QKkNO2TS4b5MQ/HSE3htoo10DdPrRy2txtQIR
 arHVIs3U0QPsh562fNpOnFStZeF8eYkOCD+UElHkCh2WcjUFExU0HaIgfxdPNTdmesYw
 xxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f3naWy5W9s9QUNBHvEd2IV7OasikpkGCP8dcpLW6o6A=;
 b=Ygr/+9+1anK87D+WVT26WdWOpkUdXeJgdesR1+JHxeK4CdWexxb1Wi1QrFqGjdZZbI
 mlBn3qzQAF/POy7cf6tO3uA4N8QHUaKE1fEi+nprZHEVQJtmTY8lYxsyDj825P14t5Qh
 7hT1LYgmBAV1HrrHZR3ZEaySvuBEWOmKGyAhbaPGrX9hl9pjjHX1mddbtqwFoCA/MP2A
 Fv5hRHhGpC7sxziZXmtPEgYIAKTFbgDK0G9lf1rkMp+dYHeQIFPCNV/90rQDNqPw+57U
 agIjftoETaYNhf8603uBMc56eJoGf6RATkPXcvt0tbMzfWxYaFYalbxbxOlW1p1oqOfH
 +Gag==
X-Gm-Message-State: AOAM530ZTsHlWEiuHXq8uK4NgsyOrvn5QIdjI+DWL/SrlmHVfmuC+vBy
 MeJH7TiVUlYs1nUsPy9IhChHaLu385JAtoLm
X-Google-Smtp-Source: ABdhPJzZDbN3h6IMbNLjkwHZZepTlJm69sZJZr3aU1/6a61S6Yw+ukQupRIIvTNGZD8GwIATZYU+6Q==
X-Received: by 2002:a92:cb4f:0:b0:2cb:fde0:b5c2 with SMTP id
 f15-20020a92cb4f000000b002cbfde0b5c2mr2251528ilq.274.1650646647288; 
 Fri, 22 Apr 2022 09:57:27 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 59/68] target/nios2: Update helper_eret for shadow registers
Date: Fri, 22 Apr 2022 09:52:29 -0700
Message-Id: <20220422165238.1971496-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When CRS = 0, we restore from estatus; otherwise from sstatus.
Update for the new CRS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-56-richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 +
 target/nios2/op_helper.c | 10 +++++++---
 target/nios2/translate.c | 13 ++++++++-----
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index cca821cf80..eb171a33e6 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -82,6 +82,7 @@ enum {
     R_FP     = 28,
     R_EA     = 29,
     R_BA     = 30,
+    R_SSTATUS = 30,
     R_RA     = 31,
 };
 
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index a3164f5356..94040102f4 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -73,14 +73,18 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
     }
 
     /*
-     * Both estatus and bstatus have no constraints on write;
+     * None of estatus, bstatus, or sstatus have constraints on write;
      * do not allow reserved fields in status to be set.
-     * TODO: more than this is required for shadow registers.
+     * When shadow registers are enabled, eret *does* restore CRS.
+     * Rather than testing eic_present to decide, mask CRS out of
+     * the set of readonly fields.
      */
-    new_status &= cpu->cr_state[CR_STATUS].writable;
+    new_status &= cpu->cr_state[CR_STATUS].writable |
+                  (cpu->cr_state[CR_STATUS].readonly & R_CR_STATUS_CRS_MASK);
 
     env->ctrl[CR_STATUS] = new_status;
     env->pc = new_pc;
+    nios2_update_crs(env);
     cpu_loop_exit(cs);
 }
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index e566175db5..b52f98180d 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -496,11 +496,14 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
-    TCGv tmp = tcg_temp_new();
-    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
-    gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
-    tcg_temp_free(tmp);
-
+    if (FIELD_EX32(dc->tb_flags, TBFLAGS, CRS0)) {
+        TCGv tmp = tcg_temp_new();
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
+        gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
+        tcg_temp_free(tmp);
+    } else {
+        gen_helper_eret(cpu_env, load_gpr(dc, R_SSTATUS), load_gpr(dc, R_EA));
+    }
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
 }
-- 
2.34.1



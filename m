Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15F95107B2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:54:00 +0200 (CEST)
Received: from localhost ([::1]:38266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQK0-0007ny-3I
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmZ-0002ZJ-1L
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:28 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmX-0004Nj-3J
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:26 -0400
Received: by mail-pf1-x42c.google.com with SMTP id i24so18692275pfa.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qf4cYEUah8+UZ9PulZzd1wKH6UWiuDaNT9BP/AwB7KQ=;
 b=JuuwjbvniXbPi87xZ7zDwLsJpsP6IwmCz8H/JJ6C4PYyuK75/Qc5508f6PSSBqvWHI
 SPYD3Ry4FKYpTt6BnGY6xbHIsFTuAHPFsM/YB6S40AtCDip0R2iuNmPzWp/r0HC/Dz/f
 is7JJDPmH6FoUGlAEsygZaLMvpOsNSXAWBc0k7UkVsRFNIdYGvU3W+HokFqMSz9WclC2
 K9lAw5yEZDbh0xT5MNFw0GQ38HsdEQIKbLa7QxFjD/4xlPr7XduEbCYCUbIZpMfTD5N/
 Ut2c326GSXpimypyUGCuXEXfpiex9f7LWgY0OU8/5FSogTqy81pMGtEk7Dn47F0WQlvb
 OSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qf4cYEUah8+UZ9PulZzd1wKH6UWiuDaNT9BP/AwB7KQ=;
 b=qsWdsVqaLFhMWauTNq9qQkR7YV7tg3wVNGpaozaZvNZEkNRtRMLtZvbLdXz18LGGNo
 rU5wuX/vk0+T7jWcb4yl2ql4wCMpV9WxW1Xp74/JXY08p6gAgOhE3yeuL7pcaQSoKkkf
 hiycqe32dBFTjrDX3rOljDH3cil9YLtPkEw8KDrTct7tC8t1fJlLu9zSyok4YZIfatgm
 3uobhrpzHXKt5bFEwiEj2ijO0yDH/1DBR2I8SVKaox7O4Y9TNpkVIvQNUCR0lxnM4xL8
 ai+5m/xqmfa9B28y70pxtA/A1zmHihBdsvUW40DI1EGxbZKm4z47+fwxridb4fUBYkI6
 eTeA==
X-Gm-Message-State: AOAM532eu4S/NZXH/GtOhD0Pa4ac92v8qRNhwP0P+khbqb5jN0b3TrLz
 sbI5IspwWmsGjRyL2cVmLSyQJ36ncrg78w==
X-Google-Smtp-Source: ABdhPJxM4qip5O46x1i1p9plST4ACLm8GywJ0VLTRRc7AsN2c7vNEjCLEGF8KenQ/mSVukmvEtNUZA==
X-Received: by 2002:a65:41c3:0:b0:363:5711:e234 with SMTP id
 b3-20020a6541c3000000b003635711e234mr20855804pgq.386.1650997163851; 
 Tue, 26 Apr 2022 11:19:23 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/68] target/nios2: Split out helper for eret instruction
Date: Tue, 26 Apr 2022 11:18:16 -0700
Message-Id: <20220426181907.103691-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

The implementation of eret will become much more complex
with the introduction of shadow registers.

[rth: Split out of a larger patch for shadow register sets.
      Directly exit to the cpu loop from the helper.]

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-18-richard.henderson@linaro.org>
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
index 226bd9e30b..53699ee088 100644
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
2.34.1



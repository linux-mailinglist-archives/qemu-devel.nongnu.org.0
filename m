Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1BC58B0B9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 22:06:11 +0200 (CEST)
Received: from localhost ([::1]:54636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK3aE-0003cm-6I
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 16:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Pu-0006mH-Mg
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Ps-0004aZ-UV
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:30 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 q9-20020a17090a2dc900b001f58bcaca95so2402186pjm.3
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kfx1lrx4WNwVLD4+SbP89f5w4riUSjZqaLsw6gR72p0=;
 b=PRh5MD0k/nf8AFAs/zr4u6mkWsG07CBW9ok3jiW8PCxqEVHPwRAnMdDy9A312Hh473
 DqmPzkKLW5RuWbRjsc8PmlQyVkImnUriqDuEcsDOFh1ZOpF1g2s4ZkX3hIVUZfvvuLod
 jc/spj1unRcS/JFxLOTcaD9Ih66V8/BKl0FlNvDe9TT/i+GC61qAQx0XWywWWW1YBoNS
 3yn9ksUvXmflbRNCZaqBWW/439JTOzURQwb92Bth8ZHkmmHcT7AsptNBxYUhe9Bgkq2X
 Ybj8gRg7mgOdc4VYdD7RkG7ISzLvdb6vhPSW5eeedImVD8vw2Qu0IoEVLjhZc2Yigc09
 HzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kfx1lrx4WNwVLD4+SbP89f5w4riUSjZqaLsw6gR72p0=;
 b=CsXpZvJdgmGG16P8yUQ/R+P4VKcmR0r7xuP7tPx+JI/Uf7IFgM0rlVJ+d7cASyiWwc
 run62/ZO6y/LposWkB9qR+5TDaxX8NkBVKr2hcdtFmt6zGM23xouKIjXqjRpiF930355
 8RogKLOxpCmv4xEMZtw0UlHPXgNGXAnZSWs5rHK6BJek4yxIExY9fZxgCgBNrTHg3SoP
 6YUeaAOuyuMi3FUnfoxiFDw9kEua2dd9Svw7Ce7Otcwxe6R6zgINCHHg1/2vLArIOtRU
 ZzdGb2MwU3e2ldDb2RV2OQHbicVkZRgQlkr6QhuHFUs9ywoF1vbcLdQhGZPhXhV2yHo5
 b2SA==
X-Gm-Message-State: ACgBeo2EDQ9nFUrRhr3hiSkw4BWieTGJhHRG5KWvncovw8rgdaEXMVdB
 Wbk6pcWmJKKUsVK8vXeo9FcupXwzguPN+Q==
X-Google-Smtp-Source: AA6agR5OUwjVPlR1W3LT7Fw8886T8ZYygkPgPRDLjwJ5rjMdgXTUaNURNNzcd3uWr5df5yxhxGPnjA==
X-Received: by 2002:a17:902:e849:b0:16e:81c6:2cb7 with SMTP id
 t9-20020a170902e84900b0016e81c62cb7mr8457121plg.110.1659729326532; 
 Fri, 05 Aug 2022 12:55:26 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902f70d00b0016f0c2ea158sm3393048plo.157.2022.08.05.12.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 12:55:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 7/7] target/loongarch: Update gdb_set_fpu() and gdb_get_fpu()
Date: Fri,  5 Aug 2022 12:55:15 -0700
Message-Id: <20220805195515.349768-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805195515.349768-1-richard.henderson@linaro.org>
References: <20220805195515.349768-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

GDB LoongArch fpu use fcc register, update gdb_set_fpu()
and gdb_get_fpu() to match it.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220805033523.1416837-6-gaosong@loongson.cn>
---
 target/loongarch/internals.h    |  3 +++
 linux-user/loongarch64/signal.c | 24 ++---------------------
 target/loongarch/gdbstub.c      | 34 ++++++++++++++++++++++++++-------
 3 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index ea227362b6..f01635aed6 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -51,6 +51,9 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
 
+uint64_t read_fcc(CPULoongArchState *env);
+void write_fcc(CPULoongArchState *env, uint64_t val);
+
 int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n);
 int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n);
 void loongarch_cpu_register_gdb_regs_for_features(CPUState *cs);
diff --git a/linux-user/loongarch64/signal.c b/linux-user/loongarch64/signal.c
index 65fd5f3857..7c7afb652e 100644
--- a/linux-user/loongarch64/signal.c
+++ b/linux-user/loongarch64/signal.c
@@ -71,26 +71,6 @@ struct extctx_layout {
     struct ctx_layout end;
 };
 
-/* The kernel's sc_save_fcc macro is a sequence of MOVCF2GR+BSTRINS. */
-static uint64_t read_all_fcc(CPULoongArchState *env)
-{
-    uint64_t ret = 0;
-
-    for (int i = 0; i < 8; ++i) {
-        ret |= (uint64_t)env->cf[i] << (i * 8);
-    }
-
-    return ret;
-}
-
-/* The kernel's sc_restore_fcc macro is a sequence of BSTRPICK+MOVGR2CF. */
-static void write_all_fcc(CPULoongArchState *env, uint64_t val)
-{
-    for (int i = 0; i < 8; ++i) {
-        env->cf[i] = (val >> (i * 8)) & 1;
-    }
-}
-
 static abi_ptr extframe_alloc(struct extctx_layout *extctx,
                               struct ctx_layout *sctx, unsigned size,
                               unsigned align, abi_ptr orig_sp)
@@ -150,7 +130,7 @@ static void setup_sigframe(CPULoongArchState *env,
     for (i = 0; i < 32; ++i) {
         __put_user(env->fpr[i], &fpu_ctx->regs[i]);
     }
-    __put_user(read_all_fcc(env), &fpu_ctx->fcc);
+    __put_user(read_fcc(env), &fpu_ctx->fcc);
     __put_user(env->fcsr0, &fpu_ctx->fcsr);
 
     /*
@@ -216,7 +196,7 @@ static void restore_sigframe(CPULoongArchState *env,
             __get_user(env->fpr[i], &fpu_ctx->regs[i]);
         }
         __get_user(fcc, &fpu_ctx->fcc);
-        write_all_fcc(env, fcc);
+        write_fcc(env, fcc);
         __get_user(env->fcsr0, &fpu_ctx->fcsr);
         restore_fp_status(env);
     }
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index d3a5e404b0..a4d1e28e36 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -11,6 +11,24 @@
 #include "internals.h"
 #include "exec/gdbstub.h"
 
+uint64_t read_fcc(CPULoongArchState *env)
+{
+    uint64_t ret = 0;
+
+    for (int i = 0; i < 8; ++i) {
+        ret |= (uint64_t)env->cf[i] << (i * 8);
+    }
+
+    return ret;
+}
+
+void write_fcc(CPULoongArchState *env, uint64_t val)
+{
+    for (int i = 0; i < 8; ++i) {
+        env->cf[i] = (val >> (i * 8)) & 1;
+    }
+}
+
 int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
@@ -51,9 +69,10 @@ static int loongarch_gdb_get_fpu(CPULoongArchState *env,
 {
     if (0 <= n && n < 32) {
         return gdb_get_reg64(mem_buf, env->fpr[n]);
-    } else if (32 <= n && n < 40) {
-        return gdb_get_reg8(mem_buf, env->cf[n - 32]);
-    } else if (n == 40) {
+    } else if (n == 32) {
+        uint64_t val = read_fcc(env);
+        return gdb_get_reg64(mem_buf, val);
+    } else if (n == 33) {
         return gdb_get_reg32(mem_buf, env->fcsr0);
     }
     return 0;
@@ -67,10 +86,11 @@ static int loongarch_gdb_set_fpu(CPULoongArchState *env,
     if (0 <= n && n < 32) {
         env->fpr[n] = ldq_p(mem_buf);
         length = 8;
-    } else if (32 <= n && n < 40) {
-        env->cf[n - 32] = ldub_p(mem_buf);
-        length = 1;
-    } else if (n == 40) {
+    } else if (n == 32) {
+        uint64_t val = ldq_p(mem_buf);
+        write_fcc(env, val);
+        length = 8;
+    } else if (n == 33) {
         env->fcsr0 = ldl_p(mem_buf);
         length = 4;
     }
-- 
2.34.1



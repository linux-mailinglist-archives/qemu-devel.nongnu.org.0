Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4847C40DE8F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:49:38 +0200 (CEST)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtdp-0001qy-Bd
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLk-0001ZL-1i
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:56 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLZ-0002ah-5w
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:54 -0400
Received: by mail-pg1-x529.google.com with SMTP id w8so6486197pgf.5
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/h2t7iFSfX1gtAhd6k9niCF0SPBIUY92gpdkPQq/Z1o=;
 b=mg7GdO2mmqVUEKzB3EjE3GpHETqpdw2XOG/GbE0Uf97+m+thauE9rFCdz0GmesGa90
 Bf1tRYa+LEukgfX6cYiFOdKD1XKlxIdz8oAeOmKx3HOpmvfCDbwL8ITkTSytASehnQUl
 JEN7Np7MWw0mSBg3ts2BGf/YE7GQUykEMQtKzK9KQ5S8wwJFiljXkS9VKW34UvUTWrDB
 V2h6Q37eqoKchknJo3Bb7e+XvtC29DObbw/wVVnJk/ArbVL671IYAwaEhVHCy80wsDxj
 NIHOBPQThiz0o1omMOgu1bQCdEaaXTP/XQfI1etYNbMUHSgPtWl7+kowcFBJDvV1TVev
 8Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/h2t7iFSfX1gtAhd6k9niCF0SPBIUY92gpdkPQq/Z1o=;
 b=bX+in59FThVNwtSBkcfnQJQMhXpmyGmBIGebj/pvr4dCm3fBS1mGq9usfFBX+3T1fZ
 irOX2+/R+DFw856Ar4ad0POFc5inG/wx24DRSjPuOTwOASik/XzWHqhsT2GjDi9GyM8z
 hD1GBXP6OzThpca2asLPm6yNP4EqYPk7wJ4J+BumhcdDrAKRPMNlvYto5RY+qXJcXKUz
 6P66+bkM5DARufrIIyyZeK1lXL3Fj7mrAWp5TPUaVQ/RKXRwtbe3o89+9HRX+pFkqk1n
 XOJCVtSGvIRvTU5hfmNW2bJZKeB9rhOew0MwmHQWQFJsUw5AGzVnmRiXdYf4ZNZ+EMWt
 JQJw==
X-Gm-Message-State: AOAM531fNmD4KhiTtOUYoVZ/sa7eQTEEDVCEdbRPNJo40Gx1YCek+y9D
 eZDeon0Z1z8JqU6KECTWXZrWixE5ZjEZeA==
X-Google-Smtp-Source: ABdhPJxUu40UsFtbEWRfms8U9wc926GSsOZqdu7rgMkD+f34gX49UvIHH0r6Ki/btJP8lUPfJhzbbQ==
X-Received: by 2002:a63:f817:: with SMTP id n23mr5442467pgh.250.1631806242490; 
 Thu, 16 Sep 2021 08:30:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/35] target/riscv: Restrict has_work() handler to sysemu and
 TCG
Date: Thu, 16 Sep 2021 08:30:13 -0700
Message-Id: <20210916153025.1944763-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-23-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 13575c1408..abb555a8bd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -335,9 +335,9 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
     env->pc = tb->pc;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool riscv_cpu_has_work(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     /*
@@ -345,10 +345,8 @@ static bool riscv_cpu_has_work(CPUState *cs)
      * mode and delegation registers, but respect individual enables
      */
     return (env->mip & env->mie) != 0;
-#else
-    return true;
-#endif
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
                           target_ulong *data)
@@ -647,6 +645,7 @@ static const struct TCGCPUOps riscv_tcg_ops = {
     .tlb_fill = riscv_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = riscv_cpu_has_work,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
@@ -666,7 +665,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = riscv_cpu_class_by_name;
-    cc->has_work = riscv_cpu_has_work;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
-- 
2.25.1



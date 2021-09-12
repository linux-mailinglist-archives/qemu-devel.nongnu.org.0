Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D1407F07
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:43:51 +0200 (CEST)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTWA-0001kW-7q
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIB-0000Yg-00
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:23 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTI9-0005II-FZ
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id i3so4957000wmq.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FSh6oWLMIgLLqTTqDcEll1Q32OdPIjqXmSpoO2tYnP4=;
 b=V2rLbxO0Z+PfuBpRw71BHzzdDPoVNfkgBxygXtN+/rkLPf8Kt20McF7g9MZnNhdAfS
 SzrVeJxogv9c70sun6s2+gNPxA2ttaDTK3zNPPlI8zQgSg7gePaa3BpLIG+M8+tChExG
 PoMXqcYiSjLjQ6er34FGSpl9tP2ZO9rSg6D10LbgluLh7DrErdrO0eBISkxmYvqNv6VO
 74t+w1KchP+Pi31ANhofzXDYwgNIo30N3bkXviCpkJqLP1lCADnvhTJSyFI9lBPO5MD1
 +sfoaJ1/HQ4Hcw1zH3DBrc8KDTSEVdJ5nq12wmyeumeb26NDZ7ZocTNKfwSccS87SIlm
 dPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FSh6oWLMIgLLqTTqDcEll1Q32OdPIjqXmSpoO2tYnP4=;
 b=WeqSsd8auQumZ1ZSqBoVGh6CYKvxmkhMs0bCNW/0gcH+QyfgQQEVJy48Jfuel6fhuo
 qesoK2Ah6j3/FiqgS//tEIZymp6gw5TBMKHXnW7OgkFECerYr9J16brk9aYH+p88fgoI
 45qT/r/m6DsP6284HLgM8DUFahr19IcZqZpbwAdu+0FIhta/Ex0c7shzl/7zzxN7BKaa
 Ershp+KQM5JEN9f4VaE9VKMx/K0b99iVa0Or/zQ4SeozMGTytmIkFxtL3od73eQA0wlR
 z3HS5Xd8jzULxripKiZb9Nwm1OgmG0Oww1Hl97stsdU4dYSNUYfErAa0mTAIgft/sCpa
 drrw==
X-Gm-Message-State: AOAM530lCM5lOpB739qR52AOEUDz/nQ+y7cxFmj03oLlmzUN1vEq2cYY
 KA3j4/S7Bbc/JUOj09gO5NOgYnkjx4c=
X-Google-Smtp-Source: ABdhPJzXLItfrFTCGM/xJtMlW1Qugo7VSxhIHafJsNHfj26YfDmZ4eJn49/XLg+fpaU2OqoXV2Apqg==
X-Received: by 2002:a1c:a713:: with SMTP id q19mr7507414wme.42.1631467759916; 
 Sun, 12 Sep 2021 10:29:19 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id y9sm3461833wmj.36.2021.09.12.10.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:29:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/30] target/riscv: Restrict has_work() handler to sysemu
 and TCG
Date: Sun, 12 Sep 2021 19:27:23 +0200
Message-Id: <20210912172731.789788-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/riscv/cpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 13575c14085..abb555a8bdb 100644
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
2.31.1



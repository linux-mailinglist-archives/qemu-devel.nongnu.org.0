Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64723416FB0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:56:26 +0200 (CEST)
Received: from localhost ([::1]:36776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThwP-0007bc-DA
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThiB-0007ED-DS
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:43 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThi9-0008Ea-Tn
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:43 -0400
Received: by mail-wr1-x429.google.com with SMTP id i24so9577948wrc.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7nxEt9EN1rfUcFm1gYLqiVpIjc8wwfbzfO8vsuUKuDU=;
 b=dFTz6tKuqmjjhqyqNuCPczxGOwYdFlakFGou/jw4A3SDzLuyuFs1RB3axWLxZdMrxy
 EzdKAW1dlBWzshmaypU5tnJgPjFePz//avo8Wi1KJr/nppdWmK1evhVvTar7ASbHaBso
 x18I2QuHitrDhbtyTl329UIV31qU2Q8Ba97L+FhHeFa+ClTizP0fwvxBpUuQKI63dbNr
 bWfm1GHkbvl4M4RFwHafLuU9xzHBTx/AqORSfQyLqzgCdWhW7JZ5U0xl8E6li5hVMPvO
 xAuJofjZN59msYjrRXTK8tSU6ZW5twtxpXpRsbVc1rLLBAJIBN8q7UguEdWgLWJ7sBuN
 pubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7nxEt9EN1rfUcFm1gYLqiVpIjc8wwfbzfO8vsuUKuDU=;
 b=AzOt1Fv6j6d1nZ+0ZMziHqwZ7A+cfwrfisssACMM044gOTD39ykSB0qJ8hya35VdD1
 qr4TE6mMCM8AMxiSCAjdq32SFXxwyFpHUlH2VIW4fwZHgCSmcwHpnfkoa/aUXLMWCWYR
 fudwZfkRPo8gFSrcJe73E1yMQK3a6uGNGE4mWna7X/zZjkC2dTIRqfBfFnmXhKqRy777
 vKXmhc0ASKp2NDiLk07ffv4GIvF107gyRNd12X2lN+h57sErvZwybm/gGIHHbOXgJA2F
 7ZxcoXsTAPbaqCLx2nr5o8leqbP/ewbzY6FrqqpurSuEae/oRO4J9NGxTCDmICR51uxl
 2C5g==
X-Gm-Message-State: AOAM532N/eoaCQNGrSIyGTPn/8QwwwaN5AVLsO5VhCgJaMpc87DN6rq/
 ySmROMuue1xtc9mz6z3/WbojEReYDSA=
X-Google-Smtp-Source: ABdhPJyhS/QR5fQzSy/c/qDhU3aoEvlxwAHNMtjhmWfeeh/9WdVeH7tonNo+YTDHjIlZwoGeFO1IZQ==
X-Received: by 2002:a7b:c184:: with SMTP id y4mr1075809wmi.128.1632476500498; 
 Fri, 24 Sep 2021 02:41:40 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 t18sm6364162wrv.39.2021.09.24.02.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:41:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 36/40] target/sparc: Restrict has_work() handler to sysemu
Date: Fri, 24 Sep 2021 11:38:43 +0200
Message-Id: <20210924093847.1014331-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 0d252cb5bdc..8d61bf15f6c 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -702,6 +702,7 @@ static void sparc_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.npc = tb->cs_base;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool sparc_cpu_has_work(CPUState *cs)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
@@ -710,6 +711,7 @@ static bool sparc_cpu_has_work(CPUState *cs)
     return (cs->interrupt_request & CPU_INTERRUPT_HARD) &&
            cpu_interrupts_enabled(env);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static char *sparc_cpu_type_name(const char *cpu_model)
 {
@@ -867,6 +869,7 @@ static const struct TCGCPUOps sparc_tcg_ops = {
     .tlb_fill = sparc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = sparc_cpu_has_work,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .do_interrupt = sparc_cpu_do_interrupt,
     .do_transaction_failed = sparc_cpu_do_transaction_failed,
@@ -888,7 +891,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
-    cc->has_work = sparc_cpu_has_work;
     cc->dump_state = sparc_cpu_dump_state;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
     cc->memory_rw_debug = sparc_cpu_memory_rw_debug;
-- 
2.31.1



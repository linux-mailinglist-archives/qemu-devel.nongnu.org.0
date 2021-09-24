Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CE1416FC9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:59:50 +0200 (CEST)
Received: from localhost ([::1]:48338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThzh-0006xC-AE
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhP-00062w-Ce
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhO-0007cK-1A
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:55 -0400
Received: by mail-wr1-x434.google.com with SMTP id i24so9570798wrc.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iR+hhecIhVQbqLgRtJRf7TAYJMYyVJckrOxOor2tvDk=;
 b=poAo8TZVliy9CTJaK1iutNXJ9iF0CPrs8SUol+weLnwShMDjnexGYWQe4XAO/mDEP2
 6ClZCATrb9xakVT1TdqgqqIoQAOHeBDDFxkYbXexXRdtFIWUxU9M7KAijVfyOkyPhTHL
 ulEfk9tTB/oqjy4qHetFVRRR74a+z9e+ZZ4+kLFt5QvyJfJx/5zeXRzZk/FZJ9fojG1l
 pPhKlExWlh0YSADiq0XYHgZkQLzlsVtxgCUH9CwqXWbWIqJq5hqltaquLoYtW7YYJCCn
 b5qNwTcDvE9CITU3vQqSLjQusvQm/KtvlopzBSirx6oynTDjuuoBy9C3Vu29JNK4cp8j
 sovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iR+hhecIhVQbqLgRtJRf7TAYJMYyVJckrOxOor2tvDk=;
 b=JqQa2eHMFPc7Xad+Um3cvz8da4YguZT278US7b10ZibMathURPFizRv765QAzEHrm0
 Np3coK4+qY4uwbLJXk5pebpeHotmOrid6zc0eOerWbcg3lHBMo6kTQ4VpQWXUCnqXfqH
 YnJVT0QRMKW9E9yjNYXdCVmYUfwvzvoJKFB82I8OkLEAIb8zAAsVeShs+KZtVz7jCtv5
 nmGOPg1ydM5To3gBwmVJRdlFz48qj8hMaiR1XsIGHNLtpOs37RC2jUv2wufblzA9S3e4
 Zaec9YxyN+dYFkZjqjZdgszXwOO6B+gNb7AQzYferkXAGNU9YSpOdfUHC+Y8ZsuhmjHr
 /39Q==
X-Gm-Message-State: AOAM530z2vvTaaKKTkDvwbFs3xeQCTTlnOWIt9tbr5syAI8soNLoKSK7
 B00lQWreSkl856z8C+5qzoi48fX1hXs=
X-Google-Smtp-Source: ABdhPJy5HMTxlNXPvYuT0ZCbUAkwbGeY6f1D5UvQG6GdUJlsPaWDT3+c/kxp98Fku5vy3IDY3Q1ymQ==
X-Received: by 2002:a5d:6cb1:: with SMTP id a17mr10330856wra.72.1632476451519; 
 Fri, 24 Sep 2021 02:40:51 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 v17sm5870249wro.62.2021.09.24.02.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 26/40] target/mips: Restrict has_work() handler to sysemu
 and TCG
Date: Fri, 24 Sep 2021 11:38:33 +0200
Message-Id: <20210924093847.1014331-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 00e0c55d0e4..3639c03f8ea 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -128,6 +128,7 @@ static void mips_cpu_set_pc(CPUState *cs, vaddr value)
     mips_env_set_pc(&cpu->env, value);
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool mips_cpu_has_work(CPUState *cs)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
@@ -172,6 +173,7 @@ static bool mips_cpu_has_work(CPUState *cs)
     }
     return has_work;
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 #include "cpu-defs.c.inc"
 
@@ -542,6 +544,7 @@ static const struct TCGCPUOps mips_tcg_ops = {
     .tlb_fill = mips_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = mips_cpu_has_work,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
@@ -563,7 +566,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, mips_cpu_properties);
 
     cc->class_by_name = mips_cpu_class_by_name;
-    cc->has_work = mips_cpu_has_work;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
-- 
2.31.1



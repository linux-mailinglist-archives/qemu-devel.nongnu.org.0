Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1988B416FA7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:54:41 +0200 (CEST)
Received: from localhost ([::1]:59414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThui-0003oP-4E
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgj-0004nW-2V; Fri, 24 Sep 2021 05:40:13 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgh-0006u1-Gz; Fri, 24 Sep 2021 05:40:12 -0400
Received: by mail-wr1-x42d.google.com with SMTP id g16so25530287wrb.3;
 Fri, 24 Sep 2021 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jjDpP5pLPewtdopPT9Bv9deCPUCIA2fG6dBKaHxXEg=;
 b=WOIjYrXNXbdh2jL5gRIhbK4TBGocSjPE/HYr5CjsD476vvB12UEKRlCfGDj/7zhFoJ
 5OABnVasQCMDkKYYZuvToEsDwXl6IGgxpwjwOnJKCrYrCmXhKLlR7nVtlEEhH/nzLyMx
 H2Ig2SSLbo71t4LmouRRkSBtEDMFlVbT68nhfRml0pri6Hp+vDTqqa4I3DqbNe/tg4m3
 rHsT+9JF6oIYOXSVTjxh6G6opZOrvatb+xlmdwLKResJzYwCZw+hvD7sub/7DfwChsLY
 atBypv4w1jndbo7cHsf4LimPyqCPL5UJx8ukAk0qx6NwDRZUUpRxMmDoHeRntkP5vje2
 VVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3jjDpP5pLPewtdopPT9Bv9deCPUCIA2fG6dBKaHxXEg=;
 b=gB5OxKvrkDHh0D0J7BclVnSO2Bm8vsfJjPd5613SLd+OoEHtfWBBqS+5jWyqPw3jl/
 zWdGAkaUbp+6yesd99N+7M/ihN6q9ICMBTtO5+PJLt/rfNQGNfQD8M9MyDa/SnseWTAb
 v1gcocLoqZYPJs4dsd7t5dJJ4oNuBu1E5Hs2jxjYHM7KCXlsl56qLPWNTFIXtETjFZAX
 xx3qEn8hBh+YPc/FW6naja3HIIHI+d4u6cNphlPYJufoS3y/aCV0Eyj+ZaEoWNq52zps
 2Z652WFXdWgeXbMM9QlpUqcWj8QEYN2XcBSNX8R30OcYJvuE2/EcqEY0InK+f1Rx3Ep8
 dwIg==
X-Gm-Message-State: AOAM530quCwvFq6JvQYq/tFm2ivnxFBSLAc/0cyGZVili6Ypwzf/JqsQ
 X4i01DQVgZz/sqNAsiDH5WDETp2JGGc=
X-Google-Smtp-Source: ABdhPJy3+AHIs93McQTzdxLkhMqGCtC9ki5PzV1Ocglawiy+Jokpjoa2rZ1FFQvtFa64D//R3aCBzw==
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr1016581wms.119.1632476409645; 
 Fri, 24 Sep 2021 02:40:09 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 f1sm7964722wrc.66.2021.09.24.02.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 17/40] target/arm: Explicit v7M cores use arm_cpu_has_work
 as CPUClass:has_work
Date: Fri, 24 Sep 2021 11:38:24 +0200
Message-Id: <20210924093847.1014331-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARM v7M cores inherit TYPE_ARM_CPU, so TYPE_ARM_CPU's class_init runs
first and sets up most of the class fields, setting in particular the
has_work handler to the generic arm_cpu_has_work(). Thus M-profile
and A-profile share the same arm_cpu_has_work() function. Some of the
checks the code there does are perhaps unnecessary for M-profile, but
they're harmless.

Since we want to move the has_work handler from CPUClass to TCGCPUOps,
the next commit will be more explicit if we already register this
handler in arm_v7m_class_init(). Since arm_cpu_has_work() is static to
target/arm/cpu.c, we have to declare it in "internals.h" to be able to
use it in target/arm/cpu_tcg.c.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 2 ++
 target/arm/cpu.c       | 2 +-
 target/arm/cpu_tcg.c   | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 777f9687648..864b5ad4cdf 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -177,6 +177,8 @@ void arm_translate_init(void);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
+bool arm_cpu_has_work(CPUState *cs);
+
 /**
  * aarch64_sve_zcr_get_valid_len:
  * @cpu: cpu context
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 641a8c2d3d3..4b08f717f64 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -76,7 +76,7 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
 }
 #endif /* CONFIG_TCG */
 
-static bool arm_cpu_has_work(CPUState *cs)
+bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 0d5adccf1a7..9a0927ad5d0 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -920,6 +920,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 
     acc->info = data;
 #ifdef CONFIG_TCG
+    cc->has_work = arm_cpu_has_work;
     cc->tcg_ops = &arm_v7m_tcg_ops;
 #endif /* CONFIG_TCG */
 
-- 
2.31.1



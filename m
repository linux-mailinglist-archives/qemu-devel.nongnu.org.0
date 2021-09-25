Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2570418330
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:21:12 +0200 (CEST)
Received: from localhost ([::1]:52206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9UF-00084z-Nn
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU94A-0003zO-CQ
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:14 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU948-0007BA-SM
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:14 -0400
Received: by mail-wr1-x436.google.com with SMTP id t18so36556238wrb.0
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7nxEt9EN1rfUcFm1gYLqiVpIjc8wwfbzfO8vsuUKuDU=;
 b=ijLH+UQoiCfmfrFOgh3gjvCnCVH6BEyy/QyDaJrrsVftBfqqTteorWngyySf0my8m2
 MSTaV0cMNPL56uf+I3ixMj438bXjoxhh3hmQGH897aturmyVcCQ00xqw1OEjD3ZXiTvD
 phXRoOO9iNNjxvrdZI1kcQNEnhD0Amch//vi3WU+BkTZZjQJcyfZv38meq/zn6On2x/L
 8FpQ543uFSlPOa1HrcocR5WDKiIFTLVvCnmIzk7n7hJgRy6JLFJu6awLp4xdbLP451Xc
 K5maObG/0kq2ZuqW7L+HBAWR7mbFTm4RNJs8DPt/UovB5XOg/S5khZE4UeH1ZyIdtyJ7
 HWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7nxEt9EN1rfUcFm1gYLqiVpIjc8wwfbzfO8vsuUKuDU=;
 b=0/QexLyLXQPLIYZR9Df/tUTs3LgiTAN7T3v4yEvZq/lXfWY3Ymbe2l+o+Lu/YuE4wv
 /AH4MWI8ejIo6Y9bOyD69uPR//9/qFrbGOv3xv9K0DqrJBIrh89PWrx4m1hyMZ7ghwq+
 9XDDT1B5ErB9aDGpujN9CcmFJHyTKBI7fylW2k0xtoi84qUFiCKJRAFvwF4CLgU3xX9+
 uHjg7Qa0OkpE75zoXzD2tjXqo+cGqPDtRqo2hsBSbzA5XU4/Dj7eUcQB308ZDgKEE9dm
 7e2ej3Lpkzb5ghuekl9pSS+PO6pdLGDXMXkXnaA66UJDglqhjx22vXJ/B8Z6zohxu6vg
 m8sA==
X-Gm-Message-State: AOAM5303YwW+XI7SmSMlQJdC2T4rye4dlPlN9diZleWm/R8f+YatykD0
 Vg8YKr+Jrjxsq+22/7tdomCO2XRAMts=
X-Google-Smtp-Source: ABdhPJw09UagsrFkhlht0hUTqy24dAnkUnWy7RPE1pO3uphUrcJt0CS4LBBrPvE/3w+9kB0ickDcDA==
X-Received: by 2002:a05:600c:4ca2:: with SMTP id
 g34mr7260753wmp.193.1632581651449; 
 Sat, 25 Sep 2021 07:54:11 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 q7sm11963610wrc.55.2021.09.25.07.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:54:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 36/40] target/sparc: Restrict has_work() handler to sysemu
Date: Sat, 25 Sep 2021 16:51:14 +0200
Message-Id: <20210925145118.1361230-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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



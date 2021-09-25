Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F5641830D
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:08:04 +0200 (CEST)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9HX-0001Oc-09
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93K-0001r6-8t
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:22 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93I-0006WJ-I6
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:21 -0400
Received: by mail-wr1-x431.google.com with SMTP id w17so36395937wrv.10
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TotqMEN5DrXYEF17ne4DDCu2zSM8Bp20jLCGhp9+svs=;
 b=dLLQ9jqesSCiqaSohDdyIjtjEFP1BnRBr7sh6EQCAtO2UiR5d2olJpH46gocRuvKzQ
 fjQjGDngvQNOBB2SxyTNdwoNehKpSArDBjnvZqR/ZiaT9bwJafH6BwoxjwmoJCZASmuD
 twFjXwwKK9eJ8ilnZDlnlAnq9JiiEroAeyuOE5+FaTRALZmLYXcGkX1tXijfxdfcESts
 KE37YUgikhZNeErFR07Y85WyJWsJ9fEWUPvjGKnw3sohQsj92ilTiJw8VYHVTsLjRjL/
 yoMzeUFhkiuvpHVljnYyxrrChh0JVmnpFy3wCVjnCKjjdIKSBi9L0gjGdy9zfUN9wQWu
 kvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TotqMEN5DrXYEF17ne4DDCu2zSM8Bp20jLCGhp9+svs=;
 b=cpYP40Y4VUP0MdcS4heIm3KuACypUbrZKltGnPEcS9pWnvZyh0bK+tx5nK6e1v1wkU
 LCKjfmMWOYUV9XoTksK+qwlAzy7Qmf57jBGc4dfgj2Hz7FjJT5U78PhOfDnXk0Itx26y
 uXAfVCoS01czpJJtI6jS9KUmhlZRNmL4soVIg9AzZYYxsohIMX+P3V+U3nwxGMfIMMcP
 g60Wcv0bl8rmEPkcRyApQwTBV0Kv4ocJPzrMTbByvAObLj2az+kI1wEgLjAZoxcxvC4/
 XA4OCnRw7DtasYzClzJHIK8UsrwEwgFmiwlGjE8VQkaEOD/bO5XO//YqaH1TzJVEB/s2
 rLvg==
X-Gm-Message-State: AOAM531gsiH7rc6c/F7HkKOn3tsUQhv0rDGOM5jkTHiCBhSYlgPvdrQH
 a6nt8PPS0HxybxnxGkHJeteAnAHs5Tw=
X-Google-Smtp-Source: ABdhPJxDf6bBJ6gtOR94BUA81N2bzDzutMbqGYGGp6xNiVAJT5uB+NEI+tRuBK0YV9P7obkWFW/klA==
X-Received: by 2002:a05:600c:198e:: with SMTP id
 t14mr7555032wmq.124.1632581598440; 
 Sat, 25 Sep 2021 07:53:18 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 b7sm13979439wrm.9.2021.09.25.07.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:53:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 25/40] target/microblaze: Restrict has_work() handler to
 sysemu
Date: Sat, 25 Sep 2021 16:51:03 +0200
Message-Id: <20210925145118.1361230-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 15db277925f..36e6e540483 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -92,12 +92,13 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static bool mb_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
 
-#ifndef CONFIG_USER_ONLY
 static void mb_cpu_ns_axi_dp(void *opaque, int irq, int level)
 {
     MicroBlazeCPU *cpu = opaque;
@@ -142,7 +143,7 @@ static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
         cpu_reset_interrupt(cs, type);
     }
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 static void mb_cpu_reset(DeviceState *dev)
 {
@@ -368,6 +369,7 @@ static const struct TCGCPUOps mb_tcg_ops = {
     .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = mb_cpu_has_work,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
@@ -386,8 +388,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = mb_cpu_class_by_name;
-    cc->has_work = mb_cpu_has_work;
-
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
-- 
2.31.1



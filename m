Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8994041700A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:09:39 +0200 (CEST)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTi9C-0008BU-JW
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhO-00061v-5k
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhI-0007Ya-9t
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t28so12108523wra.7
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TotqMEN5DrXYEF17ne4DDCu2zSM8Bp20jLCGhp9+svs=;
 b=OM/0dF3NI1YOwFRPIv0JxiIP+CxHF93wyDHkuapIBBYEvQy7/ooid8xn1Zxs7n4ENQ
 kql2G4sBHl99lz27wGxk3HvSsA+EhgZvJub9L3zcoVPtAi1CIYQY4gNB/5zPKXN4Qc1U
 9Ip31zS2beKEShsjqrCd2g6HH1To7ALppRwvJkNiB04GyXr5zp+Au7mvGTkdF09NKADZ
 j98ug4D/QXmyUvFKwphZUsjUJx6BUggyPP/CagjX0XnJ3IrxJ1ZhuJdG903gqSmQb8gT
 i0Wne0pPNCTLiyCVseNuGlRL31T0nmt6CmY+N9P9xMXqaDkjPEbEQqHYVcSPWwSEAhQY
 fxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TotqMEN5DrXYEF17ne4DDCu2zSM8Bp20jLCGhp9+svs=;
 b=2TLwTKlIsW2sQZZvlOdrNQIMyIdlL8wwAI6o7VD+OnvxDz7DIyMuxfge7IlVXq/+97
 g27SJhaj/Mpdt0aKfbdl2cOiVo4xuTbMWnnmqTUWuk6+gIO8Sx8KOWw0Mn/GgN2ftvMf
 zkXibByjdCED/r7psv1Eng9tBBKcWEio6hpsD/AL1/nx/hqgM63AC7h10Yub+bnCc2iA
 2l1zC1JrHiKxsi/zzwQimJ1dEWbfGd7o3ytCl+fxrgOYbvGKqMmRUv+XkBI85vvAMPRt
 KIsLlZG9IYvPGgSdtNn4f6ZHYfrGY3BnrXNN1Au4RxWZh5DVHCwsf1Q2xfpp4nsPgEXv
 9W6g==
X-Gm-Message-State: AOAM530xnZ5JuNNyUa/FQX4c5xOUPRWtAzJARSll2SYz8i0YFxM3wxR8
 3qtNNzdwJV0AreR53vd14TVMWrjJnAg=
X-Google-Smtp-Source: ABdhPJyBGBgdEd/n8Zi7iyxga5yCoQVwc4ydEor1WSdcRy88clr6yA4QCAXVziHDgny2WZx2w7u+Jw==
X-Received: by 2002:a5d:4d91:: with SMTP id b17mr10315790wru.321.1632476446748; 
 Fri, 24 Sep 2021 02:40:46 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 n14sm6139585wmc.38.2021.09.24.02.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 25/40] target/microblaze: Restrict has_work() handler to
 sysemu
Date: Fri, 24 Sep 2021 11:38:32 +0200
Message-Id: <20210924093847.1014331-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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



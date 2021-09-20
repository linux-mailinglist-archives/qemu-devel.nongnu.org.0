Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DCD4128A7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:08:06 +0200 (CEST)
Received: from localhost ([::1]:60556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRSH-0006F5-UR
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6e-0003aP-Qo
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:44 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6Y-00027y-UH
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:43 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d6so33412664wrc.11
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kUpo4gBQv8Yjxq7BisSezlZpsvG2i8VN6l835nBley0=;
 b=Yvo3Oo9E6ujCAbWK67zJf2j9tw68pZ07Szvd2eO9Sxf3SCyt8QbKwx9S2GbMbl9Xxt
 LUPZZzwl1whwtqt3xuywssblsPTuAHo2dWqqGThQiUrWQqfsPYmUsNecqwkvRZsOez9D
 3sX7mYs3NL2ljnnjGcvn5/rcuMKnOb9x9scoNGGkgCGyETK6290Yz8d+XQyAdOBpQgG+
 cQq9EdT0Ag7KPTQDWHZtc3+mLIbSH1Xf8NvOY0A/EYc+7iJv8jILK5LLHRYgzKSFUxt3
 Uiy4246V9f605J80BmKQFEPgwu6iWw/q2zCQDuxuEFti1d7bo3NbvQDxyvEPBuCJd/KH
 Bz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kUpo4gBQv8Yjxq7BisSezlZpsvG2i8VN6l835nBley0=;
 b=p+eEyS/3ov2sXHqph224SAxxAPAktUMmqnawMa0Ai9InFRvta0uc+kbnz8C2be0+a2
 iXoS9coEECUMKBOeHAbB+ZfuOdUrI20y2iqmVl70vUfsNVEDUeDBFGN+lVfvNtbGEdo9
 LUay6Y9tfgPoHYzbE/megf9IIzjxv4RxvXiHiiF0b+GR5LN8Rc2Lf2A4fzQQ5oy1c74v
 BSqKj/UFE22Exb8HpOg+7HLAWA9qyA8eTCjB3HCgiXbRDebaWVXHPWQGH0yKKSd6Cuc7
 MTFAfxMQi37r9eSBld9g7hZS1P0Ir1b9+pD7d7r6ORiRH0fwgVZt7h6cEiXDgziID+TZ
 dIHQ==
X-Gm-Message-State: AOAM532WcV+AiOhhzeC+VFdrHmVid9G6+6jfQLn/YIFbOi6CHMv7X5Wv
 KqBfmMq8WD1VabN3B590iUW3dvSMzfs=
X-Google-Smtp-Source: ABdhPJwUwoC3jRn0a4XxswmUhPY4jk4BBQmhfVb68bY3NCDF7IjsEcxKsWFrDpNd1+tyr6g2JnKcIg==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr1135281wmc.150.1632174335038; 
 Mon, 20 Sep 2021 14:45:35 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j20sm17168577wrb.5.2021.09.20.14.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:45:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/31] target/arm: Restrict has_work() handler to sysemu
 and TCG
Date: Mon, 20 Sep 2021 23:44:26 +0200
Message-Id: <20210920214447.2998623-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c     | 7 +++++--
 target/arm/cpu_tcg.c | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ba0741b20e4..e11aa625a5f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -73,8 +73,8 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
         env->regs[15] = tb->pc;
     }
 }
-#endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
 static bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -85,6 +85,9 @@ static bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
 }
+#endif /* !CONFIG_USER_ONLY */
+
+#endif /* CONFIG_TCG */
 
 void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque)
@@ -2017,6 +2020,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = arm_cpu_has_work,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
@@ -2041,7 +2045,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
 
     cc->class_by_name = arm_cpu_class_by_name;
-    cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index da348938407..a3df208249a 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -907,6 +907,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = arm_v7m_cpu_has_work,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .do_interrupt = arm_v7m_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
@@ -925,7 +926,6 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 
     acc->info = data;
 #ifdef CONFIG_TCG
-    cc->has_work = arm_v7m_cpu_has_work;
     cc->tcg_ops = &arm_v7m_tcg_ops;
 #endif /* CONFIG_TCG */
 
-- 
2.31.1



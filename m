Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFBB407F05
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:41:04 +0200 (CEST)
Received: from localhost ([::1]:35754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTTT-0005TF-3f
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHB-0006Qe-Pr
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:21 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:42514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTH9-0004ei-Ek
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso4976106wmc.1
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fA/mjW9p1BsOqouWNrY0vh7vEglYSGEzqkX3xwPHGNg=;
 b=mlRrzIuLNz51dWahU/z4mI5BUxWsxaWqJ3gP3dSMAiy1GWM1i2WDxXFxIsmkA6LmAj
 a0SqG0xnzSJ0+v5XykvnjKXh7299hu3YxxqIURc4cetIdAeWyw53raBhTS1gQ/LMcLwN
 JvtLny/KqpomjlSkt2TM2qfNtGaddVk4qYsTfA6jWrE95D7j308faJBj4cx63HlwvOD5
 JpikrR05+ASVXRSeE/PgKC9Mb+K2fsrYdYwHkP1nv37mHRlbdU4Tq9cWpk4J1z1XKVnn
 KFXxPEaKLtv+phrzlbhHHwc62T9Y34ulgb3qHMRsp8rjg2cTMfJU3M3R46TX8M88TPIB
 SHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fA/mjW9p1BsOqouWNrY0vh7vEglYSGEzqkX3xwPHGNg=;
 b=CE1Y1HN7waXUr9xe/+9219LWvEwZhnTB6FWDEjmKWbruqQfCsdLEBtW+EMERwWYIxq
 /x3Uu5Ak6x1Ui2D68SUtldAihqNCH0o7+6XnlaC4W+/HEPWwjxd17fDI5whWtgwcUi3Z
 l/1oLl6CorQb5i6UrAIc2REGce5vnrI418vb8cDV8/KarUBeeq/H2JmLLWk0imm/IAXA
 Fcj7/1jnVj/OLAK6cV6I1IwQ2+B00CdsIoBsknYIe+ZzeNyxZJlfGA30bLKO0hhrzrlw
 gCN3a0bObeYV6qhMZI9jrua+V2/pj4D5/9AiNTLDB+bYiDkeo8S2XiYOCsq0uVp377mc
 iSkQ==
X-Gm-Message-State: AOAM532CD3Fln/b5QTOQ5kHxniIhl/Lmc2ksOreZQO3GeoWCehsNwCpi
 7RU4ROEBoKVkSW/Idlw5UbANJmcdkJc=
X-Google-Smtp-Source: ABdhPJwnnH8LH0YxtV11SpIwd1kxUEoT9XnXdc5QPnibsWsPoxPZGdPHIk9veS9CrZAPu2GQdSSqcQ==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr7648288wmk.51.1631467697627; 
 Sun, 12 Sep 2021 10:28:17 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id x21sm4585351wmi.15.2021.09.12.10.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:28:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/30] target/arm: Restrict has_work() handler to sysemu
 and TCG
Date: Sun, 12 Sep 2021 19:27:10 +0200
Message-Id: <20210912172731.789788-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
 target/arm/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

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
-- 
2.31.1



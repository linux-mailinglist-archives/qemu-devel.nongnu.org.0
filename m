Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CC0418CE0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:48:44 +0200 (CEST)
Received: from localhost ([::1]:46794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcwt-0007lE-91
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdU-0002cW-U4
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:40 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdT-00066p-EM
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:40 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t18so46548245wrb.0
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r6ZxEtcTtXMZRq7+nFZf7Av8uL6lok+sSg0IbMh7PU4=;
 b=Qe0Mf9yEZwjMz+ydJuf3ti9wMPQE6YwtWkrLuRMwtSWvRswAiHKvAno38Re+9ynLjy
 tGpx6CHu7lj5HuRsC9yZoGN9cZwfMEA79/uhkV8355pK88DzwmUI0yeyDnGzC56ILIMW
 QqgtyXhXb418Hc4L8mWppsAhzHJ39hS4/0op2Q3U1ArOfg1CBaNjKfKbutBm8n/OkRte
 y0635/iKpLNq10OFAofD7fHkeXpEMqu8FgGXUIc58Zd5f1EXNvB66A9q/cNgtCy3sFRe
 wZ49crC9QCx9duDuSNIhNGMmhy+gJu+k4RnAkmO+ypDJJGiGObWKmbY+las0LugnskYx
 Ml2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r6ZxEtcTtXMZRq7+nFZf7Av8uL6lok+sSg0IbMh7PU4=;
 b=DwyScuwLg/LZzps7JljzXaSbmoke2YVF5fQm+bb99qB8tVyA6tYTzRxX2+zWG65W7n
 Tvd/3T3JtHgiMuhl2flljsDFmtXtMiPXXeFaUCLgTLb7gSvYNkndNTMll+mZm60mWzqi
 hLTobKy1ij2WicHAqTO2KxCbUeEJd1rXUVwzRVL7rJ5C1lXtL48NvvEvGWrAZ4IuzXot
 9+xjhv1gUvAfLP5lre2A0nqT/Enm+v2wUHeaVbqeJXbv8/3kVBoxDvh6I61xJYPiC4Ck
 6bCrRR77yUrVrR0iHDLDEQexbMzMwGfM4DHjFzewqCAHvw0VqGrET00C6kcaYBLBNbgH
 Y1pA==
X-Gm-Message-State: AOAM532gNDdAUWZj3GHOx0GmtMG5i+4IT7f7dARRYc082SqrWzoAq2wp
 Ab/CipSYSztJRs6PidkoRRYpYz3oz2M=
X-Google-Smtp-Source: ABdhPJyiD0JWYAWHjgyS5g+bpRe47DYpSl3/WEG66YLxBkVuLFN0sgILQDL6i56Lqt81h3Ha15IsbA==
X-Received: by 2002:a05:600c:1d18:: with SMTP id
 l24mr13333905wms.98.1632695318051; 
 Sun, 26 Sep 2021 15:28:38 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j4sm15186040wrt.67.2021.09.26.15.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 17/40] target/arm: Restrict has_work() handler to sysemu
 and TCG
Date: Mon, 27 Sep 2021 00:26:53 +0200
Message-Id: <20210926222716.1732932-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

Restrict arm_cpu_has_work() and has_work() handler to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 4 +++-
 target/arm/cpu.c       | 7 +++++--
 target/arm/cpu_tcg.c   | 2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f20aeb97fa0..18b3c2bf1ea 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -175,9 +175,11 @@ void arm_translate_init(void);
 
 #ifdef CONFIG_TCG
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
-#endif /* CONFIG_TCG */
 
+#if !defined(CONFIG_USER_ONLY)
 bool arm_cpu_has_work(CPUState *cs);
+#endif /* !CONFIG_USER_ONLY */
+#endif /* CONFIG_TCG */
 
 /**
  * aarch64_sve_zcr_get_valid_len:
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4b08f717f64..53c478171ac 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -74,8 +74,8 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
         env->regs[15] = tb->pc;
     }
 }
-#endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
 bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -86,6 +86,9 @@ bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
 }
+#endif /* !CONFIG_USER_ONLY */
+
+#endif /* CONFIG_TCG */
 
 void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque)
@@ -2035,6 +2038,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = arm_cpu_has_work,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
@@ -2059,7 +2063,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
 
     cc->class_by_name = arm_cpu_class_by_name;
-    cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 9a0927ad5d0..7d0d9fcbc79 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -902,6 +902,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = arm_cpu_has_work,
     .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .do_interrupt = arm_v7m_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
@@ -920,7 +921,6 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 
     acc->info = data;
 #ifdef CONFIG_TCG
-    cc->has_work = arm_cpu_has_work;
     cc->tcg_ops = &arm_v7m_tcg_ops;
 #endif /* CONFIG_TCG */
 
-- 
2.31.1



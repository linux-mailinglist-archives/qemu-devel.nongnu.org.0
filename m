Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE0067C9F5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0Ld-0003fm-Ft; Thu, 26 Jan 2023 06:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LW-000335-In
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:10 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LU-0004Ne-Iu
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:10 -0500
Received: by mail-wr1-x431.google.com with SMTP id m7so1417154wru.8
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9f+VLtMfEl0g+TsyrZ76kRHyOpYPXOzBzVbN5p8WhM=;
 b=WVJIE/eGbJWNVm1lg0Lqr5C59YO82ZGtiKH5D0e6JBKFrHrufXoevHQfOVw+M0SRZL
 aDULhBSdyG1hXnkQtgf8elfKCOtvYxsBr3zzzG2wi7XgoAesbtjj1WvkP6H0JsmVCNSe
 nC5HiQmoYnTUWyiqH9+mIOTby2z41hAPLmYnTnkO6ICLzWOFj+tNKrM6Ko/P4E4WbpI7
 69Mz98TwEWDYHg0UvKS6OH3kMW196RbNWK0wrSk46kEnS7csQ+JVh/zlFOYsIWBeVCWL
 bf6/7F9qsgktTzJ+Ll2l5pP2+HwEpUFu0ULyXLBG+/JlerApZd52Pl81W9xQuLurkccP
 BGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f9f+VLtMfEl0g+TsyrZ76kRHyOpYPXOzBzVbN5p8WhM=;
 b=xmIbyjqrg1BH84YLrj9gty1522wHDUBg1+xs1QHGPprn7QLHMs0gF2kawqx2fU4gX7
 9lERS7m963eX55ipBlYzdnBv0g9HVDM5J5P8btIyOmAxMn69MxosgrX11Z7ZAvvwz566
 0nSo/Wdhnkg1b4nyLvxA9dGoGx8G+MCwp88YzCz3j55/CzgNODz8cE3fcon7P1GkIuGO
 u4Y7qnzfFt1tqPS+lmEeHjCbyPQq80vXIz0CcdQOnn+c64q7C+S/S+Nsi7ElGcn2xTTI
 EHMGEFf6v+4TuuB+YgHT6r7JnEfWoq/DYjOgrqH1UQlm6AmzxRD01M3CXa3V7bRa8mt+
 Pyrg==
X-Gm-Message-State: AFqh2koyjJuNFXz36uxlr2kE6ev+Ylhb4hTuYgd2LKe6E7mcySXV2oll
 gNLiV2KmLQNkEL2D5kfY/pHGuA==
X-Google-Smtp-Source: AMrXdXsp1rqkqSNVDUC+h5bCHeV4zjlQZKNYVcQuWO1aYopvDYjpeM1tKwZsMlfZtXTIyRNrc3p8Gg==
X-Received: by 2002:a05:6000:689:b0:2bd:ffad:1bce with SMTP id
 bo9-20020a056000068900b002bdffad1bcemr34239101wrb.59.1674732186960; 
 Thu, 26 Jan 2023 03:23:06 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfdccd000000b002bbddb89c71sm1049761wrm.67.2023.01.26.03.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:23:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 308BA1FFC1;
 Thu, 26 Jan 2023 11:23:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Emilio Cota <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 34/35] cpu-exec: assert that plugin_mem_cbs is NULL after
 execution
Date: Thu, 26 Jan 2023 11:22:49 +0000
Message-Id: <20230126112250.2584701-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emilio Cota <cota@braap.org>

Fixes: #1381

Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230108165107.62488-1-cota@braap.org>
[AJB: manually applied follow-up fix]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230124180127.1881110-35-alex.bennee@linaro.org>

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index e0ebedef84..fb338ba576 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -59,6 +59,8 @@ get_plugin_meminfo_rw(qemu_plugin_meminfo_t i)
 #ifdef CONFIG_PLUGIN
 extern QemuOptsList qemu_plugin_opts;
 
+#define QEMU_PLUGIN_ASSERT(cond) g_assert(cond)
+
 static inline void qemu_plugin_add_opts(void)
 {
     qemu_add_opts(&qemu_plugin_opts);
@@ -250,6 +252,8 @@ void qemu_plugin_user_postfork(bool is_child);
 
 #else /* !CONFIG_PLUGIN */
 
+#define QEMU_PLUGIN_ASSERT(cond)
+
 static inline void qemu_plugin_add_opts(void)
 { }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 25ec73ef9a..9c857eeb07 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -504,6 +504,7 @@ static void cpu_exec_exit(CPUState *cpu)
     if (cc->tcg_ops->cpu_exec_exit) {
         cc->tcg_ops->cpu_exec_exit(cpu);
     }
+    QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
 }
 
 void cpu_exec_step_atomic(CPUState *cpu)
@@ -980,6 +981,7 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
 
             cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
 
+            QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
             align_clocks(sc, cpu);
-- 
2.34.1



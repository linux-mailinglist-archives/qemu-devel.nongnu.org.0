Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F89C40A234
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:53:32 +0200 (CEST)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwhX-0004Fw-AP
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6T-0001l7-QM
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:15 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6R-0007hH-Mz
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:13 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m21-20020a17090a859500b00197688449c4so1397469pjn.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0+8ADCpEoBHzsBniJtbioBvSe5w9cp/AYrH3glkRW40=;
 b=Vwtb9meaM2+t/RbVPU18umTLXeHDxi4WilHpr72ERZ+j6j7oA/tmI9qmHprIbBCI2t
 olUOw2a8vtRKGEq+n0Lji1TfZikqtuN2IkqAcgzzPJRteIUqfroRjTxHsAwsBxUN19T4
 n+HPrRMyaSheD1FqFOmMeEiTZVY9scbnvWXwSXTl1WBmxh0IDGUBgbttMpbWao1HI2T2
 duncLb/P0OcIGZWbcUpkk2xzM4JmUrmc3+tbL044mF3JfTMF2HIygingNDbnA8mn2aiB
 PQNPHiPb/SHejTgVcNRueTa0JF258nyVgjE2EzmYJNegsVs4pLE3BUs1JG4MHztxyrpl
 dtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0+8ADCpEoBHzsBniJtbioBvSe5w9cp/AYrH3glkRW40=;
 b=fxIMXhi8sQ9bKB6RJUCwHBTCwjG0umkIamwlGcjpGwLsyec0oz0yElJOB0teBFEdjK
 paQaRkOTkH6jBs8vu9G0OwQz0CLg2aOrOALfWELUosZHg0ExZIzZMMVLKWQZBjWs9WaJ
 GHG48rjZZFjxgrcabik66qcFJxN7RspihvXfXw7dZJGpj5yrVxbSShh5DG5uwjFufEyS
 N1vO4Yp++WAYtk3OINKJN8ZhHy5+wQI46Tx1rtbSvNifzy8mjiU2HIKvQk8rKcAPqhuI
 IebYkbqWzgcKiLnjx701QJB1sx++1Lrws+DVBhjLqWuQukfJMFuKlIMNGbelR/yTOk6Y
 5GZQ==
X-Gm-Message-State: AOAM5301TBjqi2E8sjHG5g9jk0eqEo3xc9rqJD7F8hvFnsrTGqsybKpd
 3ZC/o0MkMfKFS4XzO6ghceSVqneWVI0ffQ==
X-Google-Smtp-Source: ABdhPJw7E8Wc5e1QIAT+kKtkIB7c3rmaxw+M8C+511cxN0jpQ+jGS3Pb7BtjIUv3G/2jdZtWfheLjw==
X-Received: by 2002:a17:902:9a49:b0:13a:430d:7e8b with SMTP id
 x9-20020a1709029a4900b0013a430d7e8bmr12791342plv.50.1631578509219; 
 Mon, 13 Sep 2021 17:15:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/44] target/arm: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:27 -0700
Message-Id: <20210914001456.793490-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-8-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 3 +--
 target/arm/cpu.c     | 7 +++++--
 target/arm/cpu_tcg.c | 6 +++---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6a987f65e4..cfd755cff9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1040,11 +1040,10 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_arm_cpu;
-#endif
 
 void arm_cpu_do_interrupt(CPUState *cpu);
 void arm_v7m_cpu_do_interrupt(CPUState *cpu);
-bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d631c4683c..ba0741b20e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -440,6 +440,8 @@ static void arm_cpu_reset(DeviceState *dev)
     arm_rebuild_hflags(env);
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
                                      unsigned int target_el,
                                      unsigned int cur_el, bool secure,
@@ -556,7 +558,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
     return unmasked || pstate_unmasked;
 }
 
-bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
     CPUARMState *env = cs->env_ptr;
@@ -608,6 +610,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     cc->tcg_ops->do_interrupt(cs);
     return true;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 void arm_cpu_update_virq(ARMCPU *cpu)
 {
@@ -2010,11 +2013,11 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
 static const struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
     .do_unaligned_access = arm_cpu_do_unaligned_access,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 33cc75af57..0d5adccf1a 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -22,7 +22,7 @@
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#ifdef CONFIG_TCG
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -46,7 +46,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
 
 static void arm926_initfn(Object *obj)
 {
@@ -898,11 +898,11 @@ static void pxa270c5_initfn(Object *obj)
 static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .do_interrupt = arm_v7m_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
     .do_unaligned_access = arm_cpu_do_unaligned_access,
-- 
2.25.1



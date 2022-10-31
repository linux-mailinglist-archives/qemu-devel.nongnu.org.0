Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B03614055
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:03:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcrG-0005wI-GV; Mon, 31 Oct 2022 18:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcqg-0005I8-GV
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:01:42 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcqe-0001D8-PM
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:01:38 -0400
Received: by mail-il1-x136.google.com with SMTP id x16so6910154ilm.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 15:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h1dVA8sOI3Rlc4k5D7aWCLPuYTG55wXodxs0RRcAfpY=;
 b=X/iDyu81C6GoEteaC/cPycLSD1WjUnfh8OJ2d9LMsZIL0x4PB5EsFSKqWMIV1PQlei
 w/9xENa6o0w2rfPYuirjps0oN2Jd/EOao+dBStHoEw87X8eFaswWhvvNLP1bomnhDJim
 t77gGHVVhvZmjixG7zD6rX29XgbJQIx/4xYXVy7rQQB2vy97uga6ZY6MXsws3erPZNXW
 hkU8AjcVwo5QRvrd7pFcLN+Qsbyry+eBFWqxvCLgkHcFcAQvImXfymAqK1WJFOsJYg1X
 s1sW+HjyFmxYWJ7lRFwp5p2k0w1LyzbusHTxawshxCvd8ic+Yaj1/3kH7k4s0ezYypQM
 jZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h1dVA8sOI3Rlc4k5D7aWCLPuYTG55wXodxs0RRcAfpY=;
 b=buRC46F5P/RtywUK+XTAFBjjAO64W4d5+UWxKwKqWjYSNORDBOJ+mPDpAsx+knOVjb
 K8KH7HX9gdFksqZeKz4/Ilz00jDwomBRYA9GRef90DdV3tJoYgFrIsm1j5ZaCyju8+o/
 JyQQTf771OpUEXwjY7nlOb0Fz2PmfbOKqw9XBEcoS/Bg4MH6PYAUeyr/1gXQVpA4cPKL
 5rn9t1MYYdZ0UH5KPSzsxvypOGPxTjZQEkYtFwz/Rv/a1AOmIPpQ9drEuQPIcmojEeWf
 uZfm564wc6HO1cD4khcJJrhoV6lj6SPfHjxD1lkZsY2lnoCSZkREjuLK4zooiohx73wT
 fkAQ==
X-Gm-Message-State: ACrzQf1rqn9lL0bo/MK3OTIcM2EWNbHVlE0LR10j4BWtDkVnTnfBfhK8
 NeuuR9uExDwDyzbCzZddZxFax30R/Idh4Q==
X-Google-Smtp-Source: AMsMyM59dMQLmTucd0iz1y5s06BXSt9nrvqdYltl8HeQwHH3pZ9KPKEW7JLa5hIVr96eErxN3FsQUA==
X-Received: by 2002:a05:6e02:1607:b0:300:60df:7cc7 with SMTP id
 t7-20020a056e02160700b0030060df7cc7mr8253596ilu.306.1667253695662; 
 Mon, 31 Oct 2022 15:01:35 -0700 (PDT)
Received: from stoup.. ([172.58.176.58]) by smtp.gmail.com with ESMTPSA id
 s7-20020a02c507000000b00363ec4dcaacsm3203039jam.22.2022.10.31.15.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:01:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v2 12/13] accel/tcg: Complete cpu initialization before
 registration
Date: Tue,  1 Nov 2022 09:01:12 +1100
Message-Id: <20221031220113.414796-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031220113.414796-1-richard.henderson@linaro.org>
References: <20221031215723.414467-1-richard.henderson@linaro.org>
 <20221031220113.414796-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x136.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Delay cpu_list_add until realize is complete, so that cross-cpu
interaction does not happen with incomplete cpu state.  For this,
we must delay plugin initialization out of tcg_exec_realizefn,
because no cpu_index has been assigned.

Fixes a problem with cross-cpu jump cache flushing, when the
jump cache has not yet been allocated.

Fixes: a976a99a2975 ("include/hw/core: Create struct CPUJumpCache")
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reported-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c      |  8 +++++---
 accel/tcg/translate-all.c | 16 +++++++---------
 cpu.c                     | 10 +++++++++-
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 82b06c1824..356fe348de 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1052,23 +1052,25 @@ void tcg_exec_realizefn(CPUState *cpu, Error **errp)
         cc->tcg_ops->initialize();
         tcg_target_initialized = true;
     }
-    tlb_init(cpu);
-    qemu_plugin_vcpu_init_hook(cpu);
 
+    cpu->tb_jmp_cache = g_new0(CPUJumpCache, 1);
+    tlb_init(cpu);
 #ifndef CONFIG_USER_ONLY
     tcg_iommu_init_notifier_list(cpu);
 #endif /* !CONFIG_USER_ONLY */
+    /* qemu_plugin_vcpu_init_hook delayed until cpu_index assigned. */
 }
 
 /* undo the initializations in reverse order */
 void tcg_exec_unrealizefn(CPUState *cpu)
 {
+    qemu_plugin_vcpu_exit_hook(cpu);
 #ifndef CONFIG_USER_ONLY
     tcg_iommu_free_notifier_list(cpu);
 #endif /* !CONFIG_USER_ONLY */
 
-    qemu_plugin_vcpu_exit_hook(cpu);
     tlb_destroy(cpu);
+    g_free(cpu->tb_jmp_cache);
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 0089578f8f..921944a5ab 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1580,15 +1580,13 @@ void tcg_flush_jmp_cache(CPUState *cpu)
 {
     CPUJumpCache *jc = cpu->tb_jmp_cache;
 
-    if (likely(jc)) {
-        for (int i = 0; i < TB_JMP_CACHE_SIZE; i++) {
-            qatomic_set(&jc->array[i].tb, NULL);
-        }
-    } else {
-        /* This should happen once during realize, and thus never race. */
-        jc = g_new0(CPUJumpCache, 1);
-        jc = qatomic_xchg(&cpu->tb_jmp_cache, jc);
-        assert(jc == NULL);
+    /* During early initialization, the cache may not yet be allocated. */
+    if (unlikely(jc == NULL)) {
+        return;
+    }
+
+    for (int i = 0; i < TB_JMP_CACHE_SIZE; i++) {
+        qatomic_set(&jc->array[i].tb, NULL);
     }
 }
 
diff --git a/cpu.c b/cpu.c
index 2a09b05205..4a7d865427 100644
--- a/cpu.c
+++ b/cpu.c
@@ -134,15 +134,23 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     /* cache the cpu class for the hotpath */
     cpu->cc = CPU_GET_CLASS(cpu);
 
-    cpu_list_add(cpu);
     if (!accel_cpu_realizefn(cpu, errp)) {
         return;
     }
+
     /* NB: errp parameter is unused currently */
     if (tcg_enabled()) {
         tcg_exec_realizefn(cpu, errp);
     }
 
+    /* Wait until cpu initialization complete before exposing cpu. */
+    cpu_list_add(cpu);
+
+    /* Plugin initialization must wait until cpu_index assigned. */
+    if (tcg_enabled()) {
+        qemu_plugin_vcpu_init_hook(cpu);
+    }
+
 #ifdef CONFIG_USER_ONLY
     assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
            qdev_get_vmsd(DEVICE(cpu))->unmigratable);
-- 
2.34.1



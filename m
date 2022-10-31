Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EB2612FDB
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:41:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNY9-0002W3-MK; Mon, 31 Oct 2022 01:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNY2-0002Pu-DU
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:41:22 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNY0-0004DJ-MZ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:41:22 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-13c569e5ff5so12086445fac.6
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yuH1GAU+oS8xr1ANJWeOga+9yCpmRNqHFAuqmo5PjZY=;
 b=eqJFKzengJ9UXSObsHj7qhnHPl33r/eA4R6ng/Ekc0fGD8iN+Vkp2nzEwL4oCM6hHf
 EJQnYHfrrZZyRG0aAAd18pn6QzZ01/ZNZYLjVjAi0wO43Irz3XPCTcKVqUcuaQZpxFzk
 22MkKu8vy8uyd8Nb/2gWKad2h5ygqhzl9qqW6vZLk+l2FfeobapdarYZSMxAGDllwNcK
 7J5xjrfJwkqzq+xApws1wKzzzjjQpOXIeAKdNwt6iq9O8SI062c3lfukpZVPoqxuUR6N
 pOaO9SbGZw+yoD6vWWQFcO8Ve61hapuLwvnj7veev88xPqrYVtRjX9wJAD7DOs9pZb/t
 FdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yuH1GAU+oS8xr1ANJWeOga+9yCpmRNqHFAuqmo5PjZY=;
 b=AA6PyVURIGkf0hb4jIr00hTe0Jl4Zrhy9QKdcw10ej4I6pnqZfk0xzqzcjaoIrfNmz
 Sphap88gL70hhBTpBS9NY0PNczf0CFmSwdPywwaQXGilUM81+boIk6VtXdu15E7FEVoo
 WuzMJA6iBB/N+AcbOVrqQHH0goSBNW2yU+h3E6/FbF14fn4a1j2oK2njdlSvk1Wr5Pvq
 Iu2z00Jrv4XMte34zNFU7CmPpX7HX1KGm9rUhNSM7kVt/nc+TPHDV6qokdknfFJF5Z8H
 VeqqcUy73cEnpxf0AssEYYQzN4Jz+G4UjbUCtgz1O9lDyUyjFzY3ObYZ46B6vtuIlTv5
 wJlQ==
X-Gm-Message-State: ACrzQf24EWmLi8G3cSl1YkQmX+ybxvoNtpUz759xOB0q1QOYRS37jMzj
 UI2DEXbEL49zICi+KAgtVVlPb9nFtqqZLw==
X-Google-Smtp-Source: AMsMyM7hX+6nun4r/ASGVZjZ5x2PGvMA2rRL7mDlARDvAyiKmYlF72HMweaPFVb9RGU3626ch5v4xw==
X-Received: by 2002:a05:6870:c188:b0:136:faa7:dd66 with SMTP id
 h8-20020a056870c18800b00136faa7dd66mr6493950oad.47.1667194878417; 
 Sun, 30 Oct 2022 22:41:18 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 m6-20020a4ae3c6000000b0047f94999318sm2058916oov.29.2022.10.30.22.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:41:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] accel/tcg: Complete cpu initialization before registration
Date: Mon, 31 Oct 2022 16:41:05 +1100
Message-Id: <20221031054105.3552-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Delay cpu_list_add until realize is complete, so that cross-cpu
interaction does not happen with incomplete cpu state.  For this,
we must delay plugin initialization out of tcg_exec_realizefn,
because no cpu_index has been assigned.

Fixes a problem with cross-cpu jump cache flushing, when the
jump cache has not yet been allocated.

Fixes: a976a99a2975 ("include/hw/core: Create struct CPUJumpCache")
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



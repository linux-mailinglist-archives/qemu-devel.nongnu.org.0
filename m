Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B1E3017F0
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:59:06 +0100 (CET)
Received: from localhost ([::1]:45816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3O7l-00062I-3A
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Nzg-0005Oa-2X
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:44 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:32809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Nze-0008Jg-1s
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:43 -0500
Received: by mail-pg1-x52c.google.com with SMTP id n25so6170319pgb.0
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BKBpY0AI8UiujeeaSOJWvVpTSr3Ee4SaVnbe/ePIKI4=;
 b=GHOeh8UVkzyqaLwaYnEgPQUPmK+G5UwNzESewekrloWP5CraMnmixRR1LQP6QqPWAy
 tN3YdPySUb1iamstfQGvBRgp7lrgB6ED2hm6FUCx14uAT2zuuYrWFuvRynEsdhOL5h04
 tKt5iqgzitHWpbIiBso4uUHwd2a4Xk9NfZix3Ub2JZJW2guWEEM7dZ3mbae8qoqqu/Kn
 M4LkNGspNta6tcH4dqV1dhm/3Y81yGC4JNJs0jER1nMlMvz09W/GoUp0pjCuATBg/ucQ
 ZPxTRwOPMZEPmTTEBO8vRznCviH12jfAJ+aoymuetf6rC1sYK5+4EWZ4LOtSKR4IHYaf
 MIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BKBpY0AI8UiujeeaSOJWvVpTSr3Ee4SaVnbe/ePIKI4=;
 b=o3oTg+W2G9tHsTWKW59XN75lByuR401vKLP1gkDiIox07OZR9CSj5nj/SCA70qfuv/
 3TpQPslcuwA56jPN4PL+3iEOwQF670IQKAv89OvDHoFbybAO6SLC+MXklgGKkwm+i3fa
 Kx6F8f6FLAnbbLicc6BLm2Obd094mrnijoAB35fiUTL6YUKr9LWapLwMYzxIkZs8OCbA
 dFZRTSWijXEF5z9zDukbYVfhrwCrJsYlAf97nlFYdLvZ13qtL83QAEwX4SpdQBroHiar
 UPFt3C6y0FVXX30/d8uOrSwY/wBn41HxaokpVV18Zf4uy1yBhUByw6EPj407q44J//S8
 skzg==
X-Gm-Message-State: AOAM532HojyTvnfwam+w4vGw7VynT5JpAD4AQWsXq+yn1Nd+1UXH+MDT
 35ZBb6kqXAJi2Nf+28SarRzmEoeGbozCMg==
X-Google-Smtp-Source: ABdhPJzo5a1hZJyAi9z93HcDYQ9OsQ6FUsC7sStZLQCxlc8W8kRH2AtWxL7PuJR3qSImj1UOMGtJGA==
X-Received: by 2002:a63:3549:: with SMTP id c70mr10655403pga.361.1611427840722; 
 Sat, 23 Jan 2021 10:50:40 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id j19sm5018614pfn.14.2021.01.23.10.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 10:50:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] tcg: Toggle page execution for Apple Silicon
Date: Sat, 23 Jan 2021 08:50:20 -1000
Message-Id: <20210123185020.1766324-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123185020.1766324-1-richard.henderson@linaro.org>
References: <20210123185020.1766324-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: peter.maydell@linaro.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Bolshakov <r.bolshakov@yadro.com>

Pages can't be both write and executable at the same time on Apple
Silicon. macOS provides public API to switch write protection [1] for
JIT applications, like TCG.

1. https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon

Tested-by: Alexander Graf <agraf@csgraf.de>
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20210113032806.18220-1-r.bolshakov@yadro.com>
[rth: Inline the qemu_thread_jit_* functions;
 drop the MAP_JIT change for a follow-on patch.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/osdep.h      | 28 ++++++++++++++++++++++++++++
 accel/tcg/cpu-exec.c      |  2 ++
 accel/tcg/translate-all.c |  3 +++
 tcg/tcg.c                 |  1 +
 4 files changed, 34 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index a434382c58..b6ffdc15bf 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -119,6 +119,10 @@ extern int daemon(int, int);
 #include "sysemu/os-posix.h"
 #endif
 
+#ifdef __APPLE__
+#include <AvailabilityMacros.h>
+#endif
+
 #include "glib-compat.h"
 #include "qemu/typedefs.h"
 
@@ -682,4 +686,28 @@ char *qemu_get_host_name(Error **errp);
  */
 size_t qemu_get_host_physmem(void);
 
+/*
+ * Toggle write/execute on the pages marked MAP_JIT
+ * for the current thread.
+ */
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
+static inline void qemu_thread_jit_execute(void)
+{
+    if (__builtin_available(macOS 11.0, *)) {
+        pthread_jit_write_protect_np(true);
+    }
+}
+
+static inline void qemu_thread_jit_write(void)
+{
+    if (__builtin_available(macOS 11.0, *)) {
+        pthread_jit_write_protect_np(false);
+    }
+}
+#else
+static inline void qemu_thread_jit_write(void) {}
+static inline void qemu_thread_jit_execute(void) {}
+#endif
+
 #endif
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 37d17c8e88..6d017e46dd 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -186,6 +186,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     }
 #endif /* DEBUG_DISAS */
 
+    qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
     cpu->can_do_io = 1;
     /*
@@ -410,6 +411,7 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 {
     uintptr_t old;
 
+    qemu_thread_jit_write();
     assert(n < ARRAY_SIZE(tb->jmp_list_next));
     qemu_spin_lock(&tb_next->jmp_lock);
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 73fef47148..d09c187e0f 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1670,7 +1670,9 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
 static void tb_phys_invalidate__locked(TranslationBlock *tb)
 {
+    qemu_thread_jit_write();
     do_tb_phys_invalidate(tb, true);
+    qemu_thread_jit_execute();
 }
 
 /* invalidate one TB
@@ -1872,6 +1874,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 #endif
 
     assert_memory_lock();
+    qemu_thread_jit_write();
 
     phys_pc = get_page_addr_code(env, pc);
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5110f6f39c..4d734130df 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1112,6 +1112,7 @@ void tcg_prologue_init(TCGContext *s)
     s->pool_labels = NULL;
 #endif
 
+    qemu_thread_jit_write();
     /* Generate the prologue.  */
     tcg_target_qemu_prologue(s);
 
-- 
2.25.1



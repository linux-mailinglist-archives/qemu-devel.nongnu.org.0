Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD02FF381
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:49:13 +0100 (CET)
Received: from localhost ([::1]:40774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2f15-0002Gk-V5
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2ezv-0001OE-QC
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:47:59 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2ezt-0005fz-J5
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:47:59 -0500
Received: by mail-pf1-x432.google.com with SMTP id w18so2044713pfu.9
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 10:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=niAb/uNOoqhMk1wlzOxTIPCOzc6E0csy+56QybuWsfI=;
 b=GSuMAjIIraBQzzFXZ1DGvjZnDGC15h+ZlvpQGrir8jyk47a8YQzJUvravktuQGndhK
 3XIc1eY6HEO2zNykB4ply/3TDd++1QlDvzAZgZv02ya5I/hMoGqv7cNVauCKaLCtT1MK
 vmh7oJikytGJRItqb0xaVfxU3J1uIzbVWLiDy5RYj3MfgzFr0h4r5afc5DARkUbNlVSr
 2edXJmkuI3hUNaTfw92yoFirNZkXIjQ6UboaTjHESfgDj2AF9p3yjoQ8w50Pfk2sJFxG
 r5PxrDNRBK0RsszJSfqCYWExl0ltfeeDBiIRuVdqk7fFxbus+O9P/49R17se+zeY2Bbr
 NV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=niAb/uNOoqhMk1wlzOxTIPCOzc6E0csy+56QybuWsfI=;
 b=SZoPhwzcc0EnBmC+M2AmBZUO/OAtq5xNh+UjdEVWNOhNDOnqpJnzf/qm+soznSlt14
 vCeFriK9wX/rJ6g60U9B1i1riiM4KVBJ1cVw2U7OSSVvFDHGrCrD8EZk0w+Gjnrpi7x3
 mTqsWjmQkqOYRPGbD2Eep4cZ7j0ATSIxehagDvR7GKe6Z37UmC+dWQbx1RxVAoFLAgbc
 99LiJqMQh1stC8q3610ZZU4fPdnGXb6DHfuXwsS4PTdNTNhoNyNiSfX+cUyVJ4ACKBdP
 EVnlsHzE/hyMSvNYzdoTEpOKPb1OPOMbvmbvTLo7pgmkNCNHGzZKL8BVWMkTblMKJnfH
 Do0A==
X-Gm-Message-State: AOAM530Nd0b6GNcPsQKNzhT7OYmUio51rrf6hPLnrT29GMufFOcPUnBS
 UzQWa3U4XkuPXhXcI0pyIqSBPj8CvVI3eg==
X-Google-Smtp-Source: ABdhPJyZ8+6gKfoq/in/wXLsAxC2akqKqrdZHURHAlQ2Qk+r1eVNyY8oDKxlxA8P4HIKXeeAGkU7RQ==
X-Received: by 2002:a62:9248:0:b029:1ae:8b24:34c8 with SMTP id
 o69-20020a6292480000b02901ae8b2434c8mr777979pfd.67.1611254875687; 
 Thu, 21 Jan 2021 10:47:55 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id b206sm6108203pfb.73.2021.01.21.10.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 10:47:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] tcg: Toggle page execution for Apple Silicon
Date: Thu, 21 Jan 2021 08:47:52 -1000
Message-Id: <20210121184752.1395873-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, agraf@csgraf.de, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Bolshakov <r.bolshakov@yadro.com>

Pages can't be both write and executable at the same time on Apple
Silicon. macOS provides public API to switch write protection [1] for
JIT applications, like TCG.

1. https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20210113032806.18220-1-r.bolshakov@yadro.com>
[rth: Inline the qemu_thread_jit_* functions;
 drop the MAP_JIT change for a follow-on patch.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Supercedes: <20210113032806.18220-1-r.bolshakov@yadro.com>

This is the version of Roman's patch that I'm queuing to tcg-next.
What's missing from the full "Fix execution" patch is setting MAP_JIT
for !splitwx in alloc_code_gen_buffer().


r~

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



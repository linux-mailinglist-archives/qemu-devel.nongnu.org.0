Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A78755BE47
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:53:12 +0200 (CEST)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63Dr-0006VJ-KE
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62nd-0008Q9-DN
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:26:05 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62nb-0004N7-5R
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:26:04 -0400
Received: by mail-pg1-x529.google.com with SMTP id q140so11021066pgq.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pHB4ROsLewdQ7HrrSMrZ3uGIT5+drN7tItK3h279f+o=;
 b=QUqugosrd9RGlDrUFLIEKrx3iQFjgMEKXr1W87CRq/wniF1UkOadR0KbgNfdQzKZWt
 0mpc/ZBfj0Ruo2bH72nKnnAnNnJkNyG/KAhCWxMNrCHxBaYtgK1AdhOKGHIhqSw5dwqz
 jnfEjJDKAnNVoKIIA+D0s/BGMbZ3GDR8ZRSkuVuVUzL7mYfrbGk1exCYLlfC8pWKRFKH
 oGmHzOaGIHpKxAQMES3TkrGLMRPI7Rjbg1UjO7iVnMJ5J4PJl+ONvfQYKZ0EDngbXAx1
 f8rmMH7GBliQYzwT32W2ML989gNDRkC96fh2MPQv84fZ6RaraeP0PCBAd3PyVv6F6t6K
 V4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pHB4ROsLewdQ7HrrSMrZ3uGIT5+drN7tItK3h279f+o=;
 b=CY4MMJWN3SjWeYQSM0xnTd21oVOYHpyQfV88Uy0Vtvd+zGNvcMX3y3ovviSgT+QHDj
 Z0uLei+Y7b8zG1hqHQ3v9dADZ+5X7WbwIidV7k8LdsD/XbBHqi7yRcXqRhjf5ESMr9GN
 wZL5PywoedWKVqgujoIm2sHNXPnrrYrpHQwDGqrXUjajl5ZQfXpBWsfxYxNshRC72z9m
 nbraoCM4hfWq9l85lZDCdW2gqlFTWw6QkXoqf3YcphffHhF2xOyUAVVCeIHJjTcOeeKI
 Xw+cso3X9ILiIaZnY/G0589pRPH0cdgvprXH1Zfg8jr2fJrOvD1WUOYA64mU+7Blao6K
 KCEg==
X-Gm-Message-State: AJIora8/s5rEyQ3t+t/FvMlobzKA2En869Q+dCXoa5T/SxIi4OnVk77J
 ung1YqqSR+oSv5zdRi6vHnDzAiDVjLcCRw==
X-Google-Smtp-Source: AGRyM1tXfUGZKpzMhhFU7DzbB+e006Qhrdh3b8RIDjPVvDgqZGe2PntDNLLUqV7O3Hws9rscG95UGg==
X-Received: by 2002:a63:9044:0:b0:40c:9a2e:5b88 with SMTP id
 a65-20020a639044000000b0040c9a2e5b88mr15918544pge.214.1656390361383; 
 Mon, 27 Jun 2022 21:26:01 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 k26-20020aa7821a000000b0052517150777sm8160565pfi.41.2022.06.27.21.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:26:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 40/45] linux-user/aarch64: Implement SME signal handling
Date: Tue, 28 Jun 2022 09:51:12 +0530
Message-Id: <20220628042117.368549-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set the SM bit in the SVE record on signal delivery, create the ZA record.
Restore SM and ZA state according to the records present on return.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 162 +++++++++++++++++++++++++++++++++---
 1 file changed, 151 insertions(+), 11 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 22d0b8b4ec..1ad125d3d9 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -104,6 +104,22 @@ struct target_sve_context {
 
 #define TARGET_SVE_SIG_FLAG_SM  1
 
+#define TARGET_ZA_MAGIC        0x54366345
+
+struct target_za_context {
+    struct target_aarch64_ctx head;
+    uint16_t vl;
+    uint16_t reserved[3];
+    /* The actual ZA data immediately follows. */
+};
+
+#define TARGET_ZA_SIG_REGS_OFFSET \
+    QEMU_ALIGN_UP(sizeof(struct target_za_context), TARGET_SVE_VQ_BYTES)
+#define TARGET_ZA_SIG_ZAV_OFFSET(VQ, N) \
+    (TARGET_ZA_SIG_REGS_OFFSET + (VQ) * TARGET_SVE_VQ_BYTES * (N))
+#define TARGET_ZA_SIG_CONTEXT_SIZE(VQ) \
+    TARGET_ZA_SIG_ZAV_OFFSET(VQ, VQ * TARGET_SVE_VQ_BYTES)
+
 struct target_rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
@@ -176,9 +192,9 @@ static void target_setup_end_record(struct target_aarch64_ctx *end)
 }
 
 static void target_setup_sve_record(struct target_sve_context *sve,
-                                    CPUARMState *env, int vq, int size)
+                                    CPUARMState *env, int size)
 {
-    int i, j;
+    int i, j, vq = sme_vq(env);
 
     memset(sve, 0, sizeof(*sve));
     __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
@@ -207,6 +223,34 @@ static void target_setup_sve_record(struct target_sve_context *sve,
     }
 }
 
+static void target_setup_za_record(struct target_za_context *za,
+                                   CPUARMState *env, int size)
+{
+    int vq = sme_vq(env);
+    int vl = vq * TARGET_SVE_VQ_BYTES;
+    int i, j;
+
+    memset(za, 0, sizeof(*za));
+    __put_user(TARGET_ZA_MAGIC, &za->head.magic);
+    __put_user(size, &za->head.size);
+    __put_user(vl, &za->vl);
+
+    if (size == TARGET_ZA_SIG_CONTEXT_SIZE(0)) {
+        return;
+    }
+
+    /*
+     * Note that ZA vectors are stored as a byte stream,
+     * with each byte element at a subsequent address.
+     */
+    for (i = 0; i < vl; ++i) {
+        uint64_t *z = (void *)za + TARGET_ZA_SIG_ZAV_OFFSET(vq, i);
+        for (j = 0; j < vq * 2; ++j) {
+            __put_user_e(env->zarray[i].d[j], z + j, le);
+        }
+    }
+}
+
 static void target_restore_general_frame(CPUARMState *env,
                                          struct target_rt_sigframe *sf)
 {
@@ -252,16 +296,28 @@ static void target_restore_fpsimd_record(CPUARMState *env,
 
 static bool target_restore_sve_record(CPUARMState *env,
                                       struct target_sve_context *sve,
-                                      int size)
+                                      int size, int *svcr)
 {
-    int i, j, vl, vq;
+    int i, j, vl, vq, flags;
+    bool sm;
 
+    /* ??? Kernel tests SVE && (!sm || SME); suggest (sm ? SME : SVE). */
     if (!cpu_isar_feature(aa64_sve, env_archcpu(env))) {
         return false;
     }
 
     __get_user(vl, &sve->vl);
-    vq = sve_vq(env);
+    __get_user(flags, &sve->flags);
+
+    sm = flags & TARGET_SVE_SIG_FLAG_SM;
+    if (sm) {
+        if (!cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+            return false;
+        }
+        vq = sme_vq(env);
+    } else {
+        vq = sve_vq(env);
+    }
 
     /* Reject mismatched VL. */
     if (vl != vq * TARGET_SVE_VQ_BYTES) {
@@ -278,6 +334,8 @@ static bool target_restore_sve_record(CPUARMState *env,
         return false;
     }
 
+    *svcr = FIELD_DP64(*svcr, SVCR, SM, sm);
+
     /*
      * Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian load
@@ -304,15 +362,57 @@ static bool target_restore_sve_record(CPUARMState *env,
     return true;
 }
 
+static bool target_restore_za_record(CPUARMState *env,
+                                     struct target_za_context *za,
+                                     int size, int *svcr)
+{
+    int i, j, vl, vq;
+
+    if (!cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        return false;
+    }
+
+    __get_user(vl, &za->vl);
+    vq = sme_vq(env);
+
+    /* Reject mismatched VL. */
+    if (vl != vq * TARGET_SVE_VQ_BYTES) {
+        return false;
+    }
+
+    /* Accept empty record -- used to clear PSTATE.ZA. */
+    if (size <= TARGET_ZA_SIG_CONTEXT_SIZE(0)) {
+        return true;
+    }
+
+    /* Reject non-empty but incomplete record. */
+    if (size < TARGET_ZA_SIG_CONTEXT_SIZE(vq)) {
+        return false;
+    }
+
+    *svcr = FIELD_DP64(*svcr, SVCR, ZA, 1);
+
+    for (i = 0; i < vl; ++i) {
+        uint64_t *z = (void *)za + TARGET_ZA_SIG_ZAV_OFFSET(vq, i);
+        for (j = 0; j < vq * 2; ++j) {
+            __get_user_e(env->zarray[i].d[j], z + j, le);
+        }
+    }
+    return true;
+}
+
 static int target_restore_sigframe(CPUARMState *env,
                                    struct target_rt_sigframe *sf)
 {
     struct target_aarch64_ctx *ctx, *extra = NULL;
     struct target_fpsimd_context *fpsimd = NULL;
     struct target_sve_context *sve = NULL;
+    struct target_za_context *za = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
     int sve_size = 0;
+    int za_size = 0;
+    int svcr = 0;
 
     target_restore_general_frame(env, sf);
 
@@ -350,6 +450,14 @@ static int target_restore_sigframe(CPUARMState *env,
             sve_size = size;
             break;
 
+        case TARGET_ZA_MAGIC:
+            if (za || size < sizeof(struct target_za_context)) {
+                goto err;
+            }
+            za = (struct target_za_context *)ctx;
+            za_size = size;
+            break;
+
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
                 goto err;
@@ -381,9 +489,16 @@ static int target_restore_sigframe(CPUARMState *env,
     }
 
     /* SVE data, if present, overwrites FPSIMD data.  */
-    if (sve && !target_restore_sve_record(env, sve, sve_size)) {
+    if (sve && !target_restore_sve_record(env, sve, sve_size, &svcr)) {
         goto err;
     }
+    if (za && !target_restore_za_record(env, za, za_size, &svcr)) {
+        goto err;
+    }
+    if (env->svcr != svcr) {
+        env->svcr = svcr;
+        arm_rebuild_hflags(env);
+    }
     unlock_user(extra, extra_datap, 0);
     return 0;
 
@@ -451,7 +566,8 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         .total_size = offsetof(struct target_rt_sigframe,
                                uc.tuc_mcontext.__reserved),
     };
-    int fpsimd_ofs, fr_ofs, sve_ofs = 0, vq = 0, sve_size = 0;
+    int fpsimd_ofs, fr_ofs, sve_ofs = 0, za_ofs = 0;
+    int sve_size = 0, za_size = 0;
     struct target_rt_sigframe *frame;
     struct target_rt_frame_record *fr;
     abi_ulong frame_addr, return_addr;
@@ -461,11 +577,20 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
                                       &layout);
 
     /* SVE state needs saving only if it exists.  */
-    if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-        vq = sve_vq(env);
-        sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
+    if (cpu_isar_feature(aa64_sve, env_archcpu(env)) ||
+        cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(sve_vq(env)), 16);
         sve_ofs = alloc_sigframe_space(sve_size, &layout);
     }
+    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        /* ZA state needs saving only if it is enabled.  */
+        if (FIELD_EX64(env->svcr, SVCR, ZA)) {
+            za_size = TARGET_ZA_SIG_CONTEXT_SIZE(sme_vq(0));
+        } else {
+            za_size = TARGET_ZA_SIG_CONTEXT_SIZE(0);
+        }
+        za_ofs = alloc_sigframe_space(za_size, &layout);
+    }
 
     if (layout.extra_ofs) {
         /* Reserve space for the extra end marker.  The standard end marker
@@ -512,7 +637,10 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         target_setup_end_record((void *)frame + layout.extra_end_ofs);
     }
     if (sve_ofs) {
-        target_setup_sve_record((void *)frame + sve_ofs, env, vq, sve_size);
+        target_setup_sve_record((void *)frame + sve_ofs, env, sve_size);
+    }
+    if (za_ofs) {
+        target_setup_za_record((void *)frame + za_ofs, env, za_size);
     }
 
     /* Set up the stack frame for unwinding.  */
@@ -536,6 +664,18 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         env->btype = 2;
     }
 
+    /*
+     * Invoke the signal handler with both SM and ZA disabled.
+     * When clearing SM, ResetSVEState, per SMSTOP.
+     */
+    if (FIELD_EX64(env->svcr, SVCR, SM)) {
+        arm_reset_sve_state(env);
+    }
+    if (env->svcr) {
+        env->svcr = 0;
+        arm_rebuild_hflags(env);
+    }
+
     if (info) {
         tswap_siginfo(&frame->info, info);
         env->xregs[1] = frame_addr + offsetof(struct target_rt_sigframe, info);
-- 
2.34.1



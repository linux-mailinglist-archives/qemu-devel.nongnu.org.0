Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1927F5683FC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:47:37 +0200 (CEST)
Received: from localhost ([::1]:52376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91dA-0003Ee-68
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PH-0000cp-Oz
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:29:13 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:50710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PF-0001DK-O3
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:29:11 -0400
Received: by mail-pj1-x1029.google.com with SMTP id a15so7835220pjs.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZwyJS+DI6VXP8TVU6OuO37fm60h5FhLdjsLlNVqKXk=;
 b=J7Fqx9iIOVWXshZ1siWHTe0Mmciuh6qZI5OYFhx1BFYkd4YtsDpaFNbpikSvmucA7l
 UGgvu/W/WmERiPO/sk8ahez8Q2NWusDP9bxXDaCbsWUfhDX9BJCevzjaCwCH0hHJ31Lf
 oIc89EM4ckSv/B8HqKjqrmEiTC2kuJEMOfLLFSZjh4ZQbzdCZUjcofsY+0LZxLulroXh
 EI+AQWAakGkLggolCzp4iOAbQ8kLrmYFeYaK+JMTFjT7EiDQqiFz1sHS6FzQ5Vg3vT5p
 ireAZZYWLVh1WPoKaaNWyh7Z+xVSK1oQM+tNSwjS5zyt4IgukJoQNOc59UjDq0xN0nWY
 XHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZwyJS+DI6VXP8TVU6OuO37fm60h5FhLdjsLlNVqKXk=;
 b=F1JEchuT30amrLRCYqMu++jCT1opoeJlb1VzIB/f/VZ1S+wnRhF+Rmwuz9D7R47hAj
 crMKKU4oCNX3FFV3tHwyk4LiNK5hw2pRV8yozEFEK/5mwIqILybSdGUxtJegd7+E3z7W
 6X/ZDwGC7o7wYGJAJ2/niWzFqdce5LmBivzqd4yqL3+UoogBPljljfHBCYgPicOdjdQL
 e+81vePe+SUbh7hUX3cswR//RxJ2XaD3eST/MoM0eYs5sXeNMQgwdlWr1HutqwwH58Dl
 aMiVhiHWjEptYAmWXmozChfon0U8BkDZyNM2Ua3aqMXMisFEP42EHs68r+3Kr+jGghiN
 Nwtw==
X-Gm-Message-State: AJIora8wsWGS3kurpEqFBfnzMiqJODS64lZUoyjZsZs+dD2HmYO/aCAn
 0Us+g8XImbgP593OUOQnf9TgVwjCo9gcsPCq
X-Google-Smtp-Source: AGRyM1ugg4BrLvCKM4flfKwppDW1P+kWcfWBjfZq2h4Lz3DXaPLeSgrY3+OutLRdMaPTkQyIc+UOiA==
X-Received: by 2002:a17:902:ab96:b0:16a:6db6:2715 with SMTP id
 f22-20020a170902ab9600b0016a6db62715mr46983471plr.141.1657096147496; 
 Wed, 06 Jul 2022 01:29:07 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b0016bdf53b303sm6700529plh.205.2022.07.06.01.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:29:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 40/45] linux-user/aarch64: Implement SME signal handling
Date: Wed,  6 Jul 2022 13:54:06 +0530
Message-Id: <20220706082411.1664825-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 167 +++++++++++++++++++++++++++++++++---
 1 file changed, 154 insertions(+), 13 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 22d0b8b4ec..6a2c6e06d2 100644
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
+    int i, j, vq = sve_vq(env);
 
     memset(sve, 0, sizeof(*sve));
     __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
@@ -207,6 +223,35 @@ static void target_setup_sve_record(struct target_sve_context *sve,
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
+    assert(size == TARGET_ZA_SIG_CONTEXT_SIZE(vq));
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
@@ -252,16 +297,28 @@ static void target_restore_fpsimd_record(CPUARMState *env,
 
 static bool target_restore_sve_record(CPUARMState *env,
                                       struct target_sve_context *sve,
-                                      int size)
+                                      int size, int *svcr)
 {
-    int i, j, vl, vq;
+    int i, j, vl, vq, flags;
+    bool sm;
 
-    if (!cpu_isar_feature(aa64_sve, env_archcpu(env))) {
+    __get_user(vl, &sve->vl);
+    __get_user(flags, &sve->flags);
+
+    sm = flags & TARGET_SVE_SIG_FLAG_SM;
+
+    /* The cpu must support Streaming or Non-streaming SVE. */
+    if (sm
+        ? !cpu_isar_feature(aa64_sme, env_archcpu(env))
+        : !cpu_isar_feature(aa64_sve, env_archcpu(env))) {
         return false;
     }
 
-    __get_user(vl, &sve->vl);
-    vq = sve_vq(env);
+    /*
+     * Note that we cannot use sve_vq() because that depends on the
+     * current setting of PSTATE.SM, not the state to be restored.
+     */
+    vq = sve_vqm1_for_el_sm(env, 0, sm) + 1;
 
     /* Reject mismatched VL. */
     if (vl != vq * TARGET_SVE_VQ_BYTES) {
@@ -278,6 +335,8 @@ static bool target_restore_sve_record(CPUARMState *env,
         return false;
     }
 
+    *svcr = FIELD_DP64(*svcr, SVCR, SM, sm);
+
     /*
      * Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian load
@@ -304,15 +363,57 @@ static bool target_restore_sve_record(CPUARMState *env,
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
 
@@ -350,6 +451,14 @@ static int target_restore_sigframe(CPUARMState *env,
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
@@ -381,9 +490,16 @@ static int target_restore_sigframe(CPUARMState *env,
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
 
@@ -451,7 +567,8 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         .total_size = offsetof(struct target_rt_sigframe,
                                uc.tuc_mcontext.__reserved),
     };
-    int fpsimd_ofs, fr_ofs, sve_ofs = 0, vq = 0, sve_size = 0;
+    int fpsimd_ofs, fr_ofs, sve_ofs = 0, za_ofs = 0;
+    int sve_size = 0, za_size = 0;
     struct target_rt_sigframe *frame;
     struct target_rt_frame_record *fr;
     abi_ulong frame_addr, return_addr;
@@ -461,11 +578,20 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
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
+            za_size = TARGET_ZA_SIG_CONTEXT_SIZE(sme_vq(env));
+        } else {
+            za_size = TARGET_ZA_SIG_CONTEXT_SIZE(0);
+        }
+        za_ofs = alloc_sigframe_space(za_size, &layout);
+    }
 
     if (layout.extra_ofs) {
         /* Reserve space for the extra end marker.  The standard end marker
@@ -512,7 +638,10 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
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
@@ -536,6 +665,18 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3372565104
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:37:28 +0200 (CEST)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IWF-0003GG-Qe
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8IT6-0008OP-Qf
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:12 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8IT4-0004wB-Ry
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:12 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 g20-20020a17090a579400b001ed52939d72so8993950pji.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AUPE1C4HXl6AujPRUCwFngmcCgBSgGym03nofdyDOGU=;
 b=ZLgX814+p7UfUcBylR85a/nfYodQEk9Ur1JiEO+q4SDS5jCHHP48JpXJ6t9JHX85wM
 /1fc4p86ArgJHN1gaahnzjJYoa1lQXMVq7yCgcEpWJSj5U4nzAN3Cgvn2PoJaEBPNyiC
 lUIlloaEElcyFF31RSywuitor+6oCkzJH/F14x0Nm0QE5jisK8Js6DnS4X46G97QY6de
 AJ60kJHmIJJ4utG2uYe1POuddoCHvLI8zMTjqrIaeJq+dPRWjJvDz3KdTKaf6RQshKpx
 7FiP25WTMTysxIwDaCl7z2V/Deh4W4dUeN7IsDDsBl3hnuv5AVLFFifRh5FN9DkUfPTL
 KprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AUPE1C4HXl6AujPRUCwFngmcCgBSgGym03nofdyDOGU=;
 b=E0VKCccDjjO5ZogqORVsZBAPravo0sN49NunAuqacESetrSrfIIn5OevVpszC7i0DT
 EFmuYnDbafmPIAa8sVE2q0StiLzENdfWWoyfkdWJGjQSXYHQgBk2lotjFnabie+BEbT1
 BkCzRv6c83xc7Dz7kWeXQn+9cjmp5+PXTpkmLAjbEiMewp/Nu/o6W9YaWQExJIS7NEED
 wmbMO0h7Rs2y/baM9vTSyzYATV9kyeL2EBgovqnUBjFGE+9rFc+BXC1K9Q/gHLm+MqDD
 pTrlhVW1llrrsBeFIllew/NxJ6QdDku8Hy7202b8A9T/iYQ9PqWeZfFrEcqAed0TjvML
 H7Jg==
X-Gm-Message-State: AJIora+pmyA+X7xkntdLi/8Nk+vXVdVeS264R1F5sBkX4V0OwYEiHug1
 BsAbP6TEQEJogsgV76asXidS27DFH84b8swI
X-Google-Smtp-Source: AGRyM1sriHhJQeTJIt2z1BMCMSGV6XYjziCIjYLAH3es2I8qB+z4hYzXx93oGojh1IczeB8C53/HGQ==
X-Received: by 2002:a17:902:e543:b0:16a:7d9e:6517 with SMTP id
 n3-20020a170902e54300b0016a7d9e6517mr34490867plf.151.1656927248963; 
 Mon, 04 Jul 2022 02:34:08 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 02/23] linux-user: Add LoongArch signal support
Date: Mon,  4 Jul 2022 15:03:36 +0530
Message-Id: <20220704093357.983255-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

From: Song Gao <gaosong@loongson.cn>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Message-Id: <20220624031049.1716097-3-gaosong@loongson.cn>
[rth: Rework extctx frame allocation and locking;
      Properly read/write fcc from signal frame.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/loongarch64/target_signal.h |  13 +
 linux-user/loongarch64/signal.c        | 335 +++++++++++++++++++++++++
 2 files changed, 348 insertions(+)
 create mode 100644 linux-user/loongarch64/target_signal.h
 create mode 100644 linux-user/loongarch64/signal.c

diff --git a/linux-user/loongarch64/target_signal.h b/linux-user/loongarch64/target_signal.h
new file mode 100644
index 0000000000..ad3aaffcb4
--- /dev/null
+++ b/linux-user/loongarch64/target_signal.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_SIGNAL_H
+#define LOONGARCH_TARGET_SIGNAL_H
+
+#include "../generic/signal.h"
+
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
+#endif /* LOONGARCH_TARGET_SIGNAL_H */
diff --git a/linux-user/loongarch64/signal.c b/linux-user/loongarch64/signal.c
new file mode 100644
index 0000000000..65fd5f3857
--- /dev/null
+++ b/linux-user/loongarch64/signal.c
@@ -0,0 +1,335 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch emulation of Linux signals
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qemu.h"
+#include "user-internals.h"
+#include "signal-common.h"
+#include "linux-user/trace.h"
+
+#include "target/loongarch/internals.h"
+
+/* FP context was used */
+#define SC_USED_FP              (1 << 0)
+
+struct target_sigcontext {
+    uint64_t sc_pc;
+    uint64_t sc_regs[32];
+    uint32_t sc_flags;
+    uint64_t sc_extcontext[0]   QEMU_ALIGNED(16);
+};
+
+
+#define FPU_CTX_MAGIC           0x46505501
+#define FPU_CTX_ALIGN           8
+struct target_fpu_context {
+    uint64_t regs[32];
+    uint64_t fcc;
+    uint32_t fcsr;
+} QEMU_ALIGNED(FPU_CTX_ALIGN);
+
+#define CONTEXT_INFO_ALIGN      16
+struct target_sctx_info {
+    uint32_t magic;
+    uint32_t size;
+    uint64_t padding;
+} QEMU_ALIGNED(CONTEXT_INFO_ALIGN);
+
+struct target_ucontext {
+    abi_ulong tuc_flags;
+    abi_ptr tuc_link;
+    target_stack_t tuc_stack;
+    target_sigset_t tuc_sigmask;
+    uint8_t __unused[1024 / 8 - sizeof(target_sigset_t)];
+    struct target_sigcontext tuc_mcontext;
+};
+
+struct target_rt_sigframe {
+    struct target_siginfo        rs_info;
+    struct target_ucontext       rs_uc;
+};
+
+/*
+ * These two structures are not present in guest memory, are private
+ * to the signal implementation, but are largely copied from the
+ * kernel's signal implementation.
+ */
+struct ctx_layout {
+    void *haddr;
+    abi_ptr gaddr;
+    unsigned int size;
+};
+
+struct extctx_layout {
+    unsigned int size;
+    unsigned int flags;
+    struct ctx_layout fpu;
+    struct ctx_layout end;
+};
+
+/* The kernel's sc_save_fcc macro is a sequence of MOVCF2GR+BSTRINS. */
+static uint64_t read_all_fcc(CPULoongArchState *env)
+{
+    uint64_t ret = 0;
+
+    for (int i = 0; i < 8; ++i) {
+        ret |= (uint64_t)env->cf[i] << (i * 8);
+    }
+
+    return ret;
+}
+
+/* The kernel's sc_restore_fcc macro is a sequence of BSTRPICK+MOVGR2CF. */
+static void write_all_fcc(CPULoongArchState *env, uint64_t val)
+{
+    for (int i = 0; i < 8; ++i) {
+        env->cf[i] = (val >> (i * 8)) & 1;
+    }
+}
+
+static abi_ptr extframe_alloc(struct extctx_layout *extctx,
+                              struct ctx_layout *sctx, unsigned size,
+                              unsigned align, abi_ptr orig_sp)
+{
+    abi_ptr sp = orig_sp;
+
+    sp -= sizeof(struct target_sctx_info) + size;
+    align = MAX(align, CONTEXT_INFO_ALIGN);
+    sp = ROUND_DOWN(sp, align);
+    sctx->gaddr = sp;
+
+    size = orig_sp - sp;
+    sctx->size = size;
+    extctx->size += size;
+
+    return sp;
+}
+
+static abi_ptr setup_extcontext(struct extctx_layout *extctx, abi_ptr sp)
+{
+    memset(extctx, 0, sizeof(struct extctx_layout));
+
+    /* Grow down, alloc "end" context info first. */
+    sp = extframe_alloc(extctx, &extctx->end, 0, CONTEXT_INFO_ALIGN, sp);
+
+    /* For qemu, there is no lazy fp context switch, so fp always present. */
+    extctx->flags = SC_USED_FP;
+    sp = extframe_alloc(extctx, &extctx->fpu,
+                        sizeof(struct target_rt_sigframe), FPU_CTX_ALIGN, sp);
+
+    return sp;
+}
+
+static void setup_sigframe(CPULoongArchState *env,
+                           struct target_sigcontext *sc,
+                           struct extctx_layout *extctx)
+{
+    struct target_sctx_info *info;
+    struct target_fpu_context *fpu_ctx;
+    int i;
+
+    __put_user(extctx->flags, &sc->sc_flags);
+    __put_user(env->pc, &sc->sc_pc);
+    __put_user(0, &sc->sc_regs[0]);
+    for (i = 1; i < 32; ++i) {
+        __put_user(env->gpr[i], &sc->sc_regs[i]);
+    }
+
+    /*
+     * Set fpu context
+     */
+    info = extctx->fpu.haddr;
+    __put_user(FPU_CTX_MAGIC, &info->magic);
+    __put_user(extctx->fpu.size, &info->size);
+
+    fpu_ctx = (struct target_fpu_context *)(info + 1);
+    for (i = 0; i < 32; ++i) {
+        __put_user(env->fpr[i], &fpu_ctx->regs[i]);
+    }
+    __put_user(read_all_fcc(env), &fpu_ctx->fcc);
+    __put_user(env->fcsr0, &fpu_ctx->fcsr);
+
+    /*
+     * Set end context
+     */
+    info = extctx->end.haddr;
+    __put_user(0, &info->magic);
+    __put_user(extctx->end.size, &info->size);
+}
+
+static bool parse_extcontext(struct extctx_layout *extctx, abi_ptr frame)
+{
+    memset(extctx, 0, sizeof(*extctx));
+
+    while (1) {
+        uint32_t magic, size;
+
+        if (get_user_u32(magic, frame) || get_user_u32(size, frame + 4)) {
+            return false;
+        }
+
+        switch (magic) {
+        case 0: /* END */
+            extctx->end.gaddr = frame;
+            extctx->end.size = size;
+            extctx->size += size;
+            return true;
+
+        case FPU_CTX_MAGIC:
+            if (size < (sizeof(struct target_sctx_info) +
+                        sizeof(struct target_fpu_context))) {
+                return false;
+            }
+            extctx->fpu.gaddr = frame;
+            extctx->fpu.size = size;
+            extctx->size += size;
+            break;
+        default:
+            return false;
+        }
+
+        frame += size;
+    }
+}
+
+static void restore_sigframe(CPULoongArchState *env,
+                             struct target_sigcontext *sc,
+                             struct extctx_layout *extctx)
+{
+    int i;
+
+    __get_user(env->pc, &sc->sc_pc);
+    for (i = 1; i < 32; ++i) {
+        __get_user(env->gpr[i], &sc->sc_regs[i]);
+    }
+
+    if (extctx->fpu.haddr) {
+        struct target_fpu_context *fpu_ctx =
+            extctx->fpu.haddr + sizeof(struct target_sctx_info);
+        uint64_t fcc;
+
+        for (i = 0; i < 32; ++i) {
+            __get_user(env->fpr[i], &fpu_ctx->regs[i]);
+        }
+        __get_user(fcc, &fpu_ctx->fcc);
+        write_all_fcc(env, fcc);
+        __get_user(env->fcsr0, &fpu_ctx->fcsr);
+        restore_fp_status(env);
+    }
+}
+
+/*
+ * Determine which stack to use.
+ */
+static abi_ptr get_sigframe(struct target_sigaction *ka,
+                            CPULoongArchState *env,
+                            struct extctx_layout *extctx)
+{
+    abi_ulong sp;
+
+    sp = target_sigsp(get_sp_from_cpustate(env), ka);
+    sp = ROUND_DOWN(sp, 16);
+    sp = setup_extcontext(extctx, sp);
+    sp -= sizeof(struct target_rt_sigframe);
+
+    assert(QEMU_IS_ALIGNED(sp, 16));
+
+    return sp;
+}
+
+void setup_rt_frame(int sig, struct target_sigaction *ka,
+                    target_siginfo_t *info,
+                    target_sigset_t *set, CPULoongArchState *env)
+{
+    struct target_rt_sigframe *frame;
+    struct extctx_layout extctx;
+    abi_ptr frame_addr;
+    int i;
+
+    frame_addr = get_sigframe(ka, env, &extctx);
+    trace_user_setup_rt_frame(env, frame_addr);
+
+    frame = lock_user(VERIFY_WRITE, frame_addr,
+                      sizeof(*frame) + extctx.size, 0);
+    if (!frame) {
+        force_sigsegv(sig);
+        return;
+    }
+    extctx.fpu.haddr = (void *)frame + (extctx.fpu.gaddr - frame_addr);
+    extctx.end.haddr = (void *)frame + (extctx.end.gaddr - frame_addr);
+
+    tswap_siginfo(&frame->rs_info, info);
+
+    __put_user(0, &frame->rs_uc.tuc_flags);
+    __put_user(0, &frame->rs_uc.tuc_link);
+    target_save_altstack(&frame->rs_uc.tuc_stack, env);
+
+    setup_sigframe(env, &frame->rs_uc.tuc_mcontext, &extctx);
+
+    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
+        __put_user(set->sig[i], &frame->rs_uc.tuc_sigmask.sig[i]);
+    }
+
+    env->gpr[4] = sig;
+    env->gpr[5] = frame_addr + offsetof(struct target_rt_sigframe, rs_info);
+    env->gpr[6] = frame_addr + offsetof(struct target_rt_sigframe, rs_uc);
+    env->gpr[3] = frame_addr;
+    env->gpr[1] = default_rt_sigreturn;
+
+    env->pc = ka->_sa_handler;
+    unlock_user(frame, frame_addr, sizeof(*frame) + extctx.size);
+}
+
+long do_rt_sigreturn(CPULoongArchState *env)
+{
+    struct target_rt_sigframe *frame;
+    struct extctx_layout extctx;
+    abi_ulong frame_addr;
+    sigset_t blocked;
+
+    frame_addr = env->gpr[3];
+    trace_user_do_rt_sigreturn(env, frame_addr);
+
+    if (!parse_extcontext(&extctx, frame_addr + sizeof(*frame))) {
+        goto badframe;
+    }
+
+    frame = lock_user(VERIFY_READ, frame_addr,
+                      sizeof(*frame) + extctx.size, 1);
+    if (!frame) {
+        goto badframe;
+    }
+    if (extctx.fpu.gaddr) {
+        extctx.fpu.haddr = (void *)frame + (extctx.fpu.gaddr - frame_addr);
+    }
+
+    target_to_host_sigset(&blocked, &frame->rs_uc.tuc_sigmask);
+    set_sigmask(&blocked);
+
+    restore_sigframe(env, &frame->rs_uc.tuc_mcontext, &extctx);
+
+    target_restore_altstack(&frame->rs_uc.tuc_stack, env);
+
+    unlock_user(frame, frame_addr, 0);
+    return -QEMU_ESIGRETURN;
+
+ badframe:
+    force_sig(TARGET_SIGSEGV);
+    return -QEMU_ESIGRETURN;
+}
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    __put_user(0x03822c0b, tramp + 0);  /* ori     a7, zero, 0x8b */
+    __put_user(0x002b0000, tramp + 1);  /* syscall 0 */
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11133EFD8D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 09:12:43 +0200 (CEST)
Received: from localhost ([::1]:36794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGFkg-0000hW-K6
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 03:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mGFhE-0006HW-Oy
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:09:08 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mGFhC-0008F9-Po
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:09:08 -0400
Received: by mail-wm1-x32f.google.com with SMTP id u15so947200wmj.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 00:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I4d5/jylUJng8gB+j35WYKKGet2c3NfEVZGEKd+aN0I=;
 b=MRnQfrHccQoIjUaBUepI9Hnrl4ZsTGld5djqOmR9bmU+BqS8rkom2SH/Ocj1PieROI
 hKS+ikA4vOCojBARyM8WuMMhC2X0tzQ5KMdGf/jqnpmmUFdx99o6w0uvqCINWF1jBxnA
 HxI6BReVQWZmFYKlQinv6WLOJRpUbDxcCeOTA5onGaZox7N1TjqkyGIrhCfkYXplVwYO
 ylh4CBv2c0qbBi5JrzOFj16dCHETX75e4RKoea7OjBqPkVT9K1Hxg7n2Vuz8h119derv
 oVq3MFNFD/BO+O9pFklQydiavyizguV0JvLE49enBtu8ZLPb1bZshxXng+eVfrq4uoSi
 hkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I4d5/jylUJng8gB+j35WYKKGet2c3NfEVZGEKd+aN0I=;
 b=FAMkMMg0NhX2neV5dz5SBmcBKkIkpd27JHKKV2M/WzUxJvzkt3MkUIk+65FFjMkbYk
 dp1zUGgF7jvxuA//X9MbAYLwbI5yEUxx8vwY3IcJ5ilYwhwTmAZ/aCG7raAjcz7QJYZp
 ZQwoco7ywCy5lsHAeIW7CnVcLW63POhiimJhxe3NK4x1AM8nF1N/78O/VTKksLYL8tN2
 X9Oa7nC6RPQoM6UfRnDm+Rqsxwh6u/xIXvP2MO2gUr5mJmhZvrN+kX1q4IxWpuU5uHGw
 WL+0yP/Wkg8IjySO8Ku/vXRvEWZPKL/56gvrXjL87FK2lsqAm8/LMl0mkIDQo44nvs/5
 OMsA==
X-Gm-Message-State: AOAM5307msOZhLa/iTOjQr9DdgnAwZbarbgRe0m1OnARtjCWqUV+MN3K
 D0Z8Qw8C3aYpzsYtDawIW5Cj9f3A8vA=
X-Google-Smtp-Source: ABdhPJyNX/cOZfNLaisoqZodvmG7V1d/EOxAia2zOO72IBQ7Jtghk/unjcK0CL0nBbH++IBvwJ8svg==
X-Received: by 2002:a1c:2547:: with SMTP id l68mr7221296wml.23.1629270545456; 
 Wed, 18 Aug 2021 00:09:05 -0700 (PDT)
Received: from laral.fritz.box
 (200116b82b53c5004989ea3bb9da8dea.dip.versatel-1u1.de.
 [2001:16b8:2b53:c500:4989:ea3b:b9da:8dea])
 by smtp.gmail.com with ESMTPSA id w18sm4902609wrg.68.2021.08.18.00.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:09:05 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/i386: Added VGIF V_IRQ masking capability
Date: Wed, 18 Aug 2021 09:08:36 +0200
Message-Id: <20210818070838.44344-4-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818070838.44344-1-laramglazier@gmail.com>
References: <20210818070838.44344-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: pbonzini@redhat.com, Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGIF provides masking capability for when virtual interrupts
are taken. (APM2)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.c                   |  7 +++++--
 target/i386/cpu.h                   |  2 ++
 target/i386/tcg/sysemu/svm_helper.c | 12 ++++++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5dcdab3b80..b2094175d9 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5649,6 +5649,7 @@ static void x86_cpu_reset(DeviceState *dev)
     /* init to reset state */
     env->int_ctl = 0;
     env->hflags2 |= HF2_GIF_MASK;
+    env->hflags2 |= HF2_VGIF_MASK;
     env->hflags &= ~HF_GUEST_MASK;
 
     cpu_x86_update_cr0(env, 0x60000010);
@@ -6532,10 +6533,12 @@ int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
                       !(env->hflags & HF_INHIBIT_IRQ_MASK))))) {
             return CPU_INTERRUPT_HARD;
 #if !defined(CONFIG_USER_ONLY)
-        } else if ((interrupt_request & CPU_INTERRUPT_VIRQ) &&
+        } else if (env->hflags2 & HF2_VGIF_MASK) {
+            if((interrupt_request & CPU_INTERRUPT_VIRQ) &&
                    (env->eflags & IF_MASK) &&
                    !(env->hflags & HF_INHIBIT_IRQ_MASK)) {
-            return CPU_INTERRUPT_VIRQ;
+                        return CPU_INTERRUPT_VIRQ;
+            }
 #endif
         }
     }
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e27a1aab99..d26df6de6b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -203,6 +203,7 @@ typedef enum X86Seg {
 #define HF2_MPX_PR_SHIFT         5 /* BNDCFGx.BNDPRESERVE */
 #define HF2_NPT_SHIFT            6 /* Nested Paging enabled */
 #define HF2_IGNNE_SHIFT          7 /* Ignore CR0.NE=0 */
+#define HF2_VGIF_SHIFT           8 /* Can take VIRQ*/
 
 #define HF2_GIF_MASK            (1 << HF2_GIF_SHIFT)
 #define HF2_HIF_MASK            (1 << HF2_HIF_SHIFT)
@@ -212,6 +213,7 @@ typedef enum X86Seg {
 #define HF2_MPX_PR_MASK         (1 << HF2_MPX_PR_SHIFT)
 #define HF2_NPT_MASK            (1 << HF2_NPT_SHIFT)
 #define HF2_IGNNE_MASK          (1 << HF2_IGNNE_SHIFT)
+#define HF2_VGIF_MASK           (1 << HF2_VGIF_SHIFT)
 
 #define CR0_PE_SHIFT 0
 #define CR0_MP_SHIFT 1
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 9ef2454779..2c44bdb243 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -130,6 +130,11 @@ static inline bool virtual_gif_enabled(CPUX86State *env)
     return false;
 }
 
+static inline bool virtual_gif_set(CPUX86State *env)
+{
+    return !virtual_gif_enabled(env) || (env->int_ctl & V_GIF_MASK);
+}
+
 void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
@@ -363,6 +368,10 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
         cs->interrupt_request |= CPU_INTERRUPT_VIRQ;
     }
 
+    if (virtual_gif_set(env)) {
+        env->hflags2 |= HF2_VGIF_MASK;
+    }
+
     /* maybe we need to inject an event */
     event_inj = x86_ldl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
                                                  control.event_inj));
@@ -519,6 +528,7 @@ void helper_stgi(CPUX86State *env)
 
     if (virtual_gif_enabled(env)) {
         env->int_ctl |= V_GIF_MASK;
+        env->hflags2 |= HF2_VGIF_MASK;
     } else {
         env->hflags2 |= HF2_GIF_MASK;
     }
@@ -530,6 +540,7 @@ void helper_clgi(CPUX86State *env)
 
     if (virtual_gif_enabled(env)) {
         env->int_ctl &= ~V_GIF_MASK;
+        env->hflags2 &= ~HF2_VGIF_MASK;
     } else {
         env->hflags2 &= ~HF2_GIF_MASK;
     }
@@ -811,6 +822,7 @@ void do_vmexit(CPUX86State *env)
              env->vm_vmcb + offsetof(struct vmcb, control.event_inj), 0);
 
     env->hflags2 &= ~HF2_GIF_MASK;
+    env->hflags2 &= ~HF2_VGIF_MASK;
     /* FIXME: Resets the current ASID register to zero (host ASID). */
 
     /* Clears the V_IRQ and V_INTR_MASKING bits inside the processor. */
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD3E3AB11E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:15:00 +0200 (CEST)
Received: from localhost ([::1]:52188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltp35-00070B-CM
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNY-000341-Sk
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:04 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNW-0006Kz-Cq
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:04 -0400
Received: by mail-ej1-x632.google.com with SMTP id hv20so2772785ejc.12
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lC/0Cp9Va8sjJCLH7XVbQgzt0OCEOfNbiDwuv03f8v8=;
 b=AaWj/KKJ0REhP6f7fALlmjNfNQd45tDTj+14S9PZNJ/6w+agYDl3oEDouG30A25Z1h
 SqIhpwNh3xZsKZ5fr4gkAzPohfOEgUaJ7rQ+pDM8uH9kkIel6Pb2dCuUXEsvv4k48xUX
 k1pWO384YyOpjPTFX8EvSN3Jbz0GHqpBoGXgNMYzj9GuUnQsaYiuZ0f7LTYLul4C5rct
 QR0yzw4Ds6NhaiX3NoueHcYWkjsa+1uWvq9ZbCFFp/R2PRhl6tSJS4xKc1YzXFq6gVAQ
 Ny+BxTi4DHjCPdmArXMKkstRIP2nZeBIsEwCtDT3H+5pdNqH//4wFVBxCsFC9E7hrJ8B
 1qDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lC/0Cp9Va8sjJCLH7XVbQgzt0OCEOfNbiDwuv03f8v8=;
 b=F3Z9mImbP7O81Dw+ypeBVZ08VNzwz5K9jhrFCUb5CZJcHkKKRcsnzwAg/07ConfvQV
 SRxQ33EM44kUf878+PZGkFKhA+T8vaaIRGNjyVtmEP1lg50jdi8ukjXxarCQMIaAGb4w
 wJZz3uFZ11g14IKgaMww2qi4jXjg2czsF0QENXirvkkQ0VGfRm+nKcxCMzEsv1U4zMJP
 7bJKZxujRa1cm/qFg0/u2MoxHDWsJE14WfLrTKLHips2IxbP590enVZy76MR4IR2D5uM
 t29fmSKFz2z8cQ11XgLW5zrWBVxNGqGDdU6wzQ83gvrbjfIBsD9DMd7D+SLAc4ZJY5K5
 duMA==
X-Gm-Message-State: AOAM533yUQApfhbuGzDXBvXGAA5maQjkLF49u5cfTgauNwGE9w8ZFEiG
 14KbydrVhlxNMHSLy93IEq4MsmiPXyo=
X-Google-Smtp-Source: ABdhPJwkC/LS/bOts1dOPtlK6G9SuWXZukoJcY2wdwFSlxNlHYRiJ/bynogR4xwec+fot4lZMO2KPg==
X-Received: by 2002:a17:907:9813:: with SMTP id
 ji19mr4326774ejc.318.1623922320943; 
 Thu, 17 Jun 2021 02:32:00 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/45] target/i386: Refactored intercept checks into
 cpu_svm_has_intercept
Date: Thu, 17 Jun 2021 11:31:23 +0200
Message-Id: <20210617093134.900014-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

Added cpu_svm_has_intercept to reduce duplication when checking the
corresponding intercept bit outside of cpu_svm_check_intercept_param

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210616123907.17765-2-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h                   |   4 +
 target/i386/tcg/sysemu/svm_helper.c | 133 +++++++++++++++-------------
 2 files changed, 76 insertions(+), 61 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ac3abea97c..64b4e46731 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2149,9 +2149,13 @@ static inline void
 cpu_svm_check_intercept_param(CPUX86State *env1, uint32_t type,
                               uint64_t param, uintptr_t retaddr)
 { /* no-op */ }
+static inline bool
+cpu_svm_has_intercept(CPUX86State *env, uint32_t type)
+{ return false; }
 #else
 void cpu_svm_check_intercept_param(CPUX86State *env1, uint32_t type,
                                    uint64_t param, uintptr_t retaddr);
+bool cpu_svm_has_intercept(CPUX86State *env, uint32_t type);
 #endif
 
 /* apic.c */
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 9d671297cf..2f7606bebf 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -412,6 +412,43 @@ void helper_clgi(CPUX86State *env)
     env->hflags2 &= ~HF2_GIF_MASK;
 }
 
+bool cpu_svm_has_intercept(CPUX86State *env, uint32_t type)
+{
+    switch (type) {
+    case SVM_EXIT_READ_CR0 ... SVM_EXIT_READ_CR0 + 8:
+        if (env->intercept_cr_read & (1 << (type - SVM_EXIT_READ_CR0))) {
+            return true;
+        }
+        break;
+    case SVM_EXIT_WRITE_CR0 ... SVM_EXIT_WRITE_CR0 + 8:
+        if (env->intercept_cr_write & (1 << (type - SVM_EXIT_WRITE_CR0))) {
+            return true;
+        }
+        break;
+    case SVM_EXIT_READ_DR0 ... SVM_EXIT_READ_DR0 + 7:
+        if (env->intercept_dr_read & (1 << (type - SVM_EXIT_READ_DR0))) {
+            return true;
+        }
+        break;
+    case SVM_EXIT_WRITE_DR0 ... SVM_EXIT_WRITE_DR0 + 7:
+        if (env->intercept_dr_write & (1 << (type - SVM_EXIT_WRITE_DR0))) {
+            return true;
+        }
+        break;
+    case SVM_EXIT_EXCP_BASE ... SVM_EXIT_EXCP_BASE + 31:
+        if (env->intercept_exceptions & (1 << (type - SVM_EXIT_EXCP_BASE))) {
+            return true;
+        }
+        break;
+    default:
+        if (env->intercept & (1ULL << (type - SVM_EXIT_INTR))) {
+            return true;
+        }
+        break;
+    }
+    return false;
+}
+
 void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
                                    uint64_t param, uintptr_t retaddr)
 {
@@ -420,72 +457,46 @@ void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
     if (likely(!(env->hflags & HF_GUEST_MASK))) {
         return;
     }
-    switch (type) {
-    case SVM_EXIT_READ_CR0 ... SVM_EXIT_READ_CR0 + 8:
-        if (env->intercept_cr_read & (1 << (type - SVM_EXIT_READ_CR0))) {
-            cpu_vmexit(env, type, param, retaddr);
-        }
-        break;
-    case SVM_EXIT_WRITE_CR0 ... SVM_EXIT_WRITE_CR0 + 8:
-        if (env->intercept_cr_write & (1 << (type - SVM_EXIT_WRITE_CR0))) {
-            cpu_vmexit(env, type, param, retaddr);
-        }
-        break;
-    case SVM_EXIT_READ_DR0 ... SVM_EXIT_READ_DR0 + 7:
-        if (env->intercept_dr_read & (1 << (type - SVM_EXIT_READ_DR0))) {
-            cpu_vmexit(env, type, param, retaddr);
-        }
-        break;
-    case SVM_EXIT_WRITE_DR0 ... SVM_EXIT_WRITE_DR0 + 7:
-        if (env->intercept_dr_write & (1 << (type - SVM_EXIT_WRITE_DR0))) {
-            cpu_vmexit(env, type, param, retaddr);
-        }
-        break;
-    case SVM_EXIT_EXCP_BASE ... SVM_EXIT_EXCP_BASE + 31:
-        if (env->intercept_exceptions & (1 << (type - SVM_EXIT_EXCP_BASE))) {
-            cpu_vmexit(env, type, param, retaddr);
-        }
-        break;
-    case SVM_EXIT_MSR:
-        if (env->intercept & (1ULL << (SVM_EXIT_MSR - SVM_EXIT_INTR))) {
-            /* FIXME: this should be read in at vmrun (faster this way?) */
-            uint64_t addr = x86_ldq_phys(cs, env->vm_vmcb +
-                                     offsetof(struct vmcb,
-                                              control.msrpm_base_pa));
-            uint32_t t0, t1;
 
-            switch ((uint32_t)env->regs[R_ECX]) {
-            case 0 ... 0x1fff:
-                t0 = (env->regs[R_ECX] * 2) % 8;
-                t1 = (env->regs[R_ECX] * 2) / 8;
-                break;
-            case 0xc0000000 ... 0xc0001fff:
-                t0 = (8192 + env->regs[R_ECX] - 0xc0000000) * 2;
-                t1 = (t0 / 8);
-                t0 %= 8;
-                break;
-            case 0xc0010000 ... 0xc0011fff:
-                t0 = (16384 + env->regs[R_ECX] - 0xc0010000) * 2;
-                t1 = (t0 / 8);
-                t0 %= 8;
-                break;
-            default:
-                cpu_vmexit(env, type, param, retaddr);
-                t0 = 0;
-                t1 = 0;
-                break;
-            }
-            if (x86_ldub_phys(cs, addr + t1) & ((1 << param) << t0)) {
-                cpu_vmexit(env, type, param, retaddr);
-            }
+    if (!cpu_svm_has_intercept(env, type)) {
+        return;
+    }
+
+    if (type == SVM_EXIT_MSR) {
+        /* FIXME: this should be read in at vmrun (faster this way?) */
+        uint64_t addr = x86_ldq_phys(cs, env->vm_vmcb +
+                                    offsetof(struct vmcb,
+                                            control.msrpm_base_pa));
+        uint32_t t0, t1;
+
+        switch ((uint32_t)env->regs[R_ECX]) {
+        case 0 ... 0x1fff:
+            t0 = (env->regs[R_ECX] * 2) % 8;
+            t1 = (env->regs[R_ECX] * 2) / 8;
+            break;
+        case 0xc0000000 ... 0xc0001fff:
+            t0 = (8192 + env->regs[R_ECX] - 0xc0000000) * 2;
+            t1 = (t0 / 8);
+            t0 %= 8;
+            break;
+        case 0xc0010000 ... 0xc0011fff:
+            t0 = (16384 + env->regs[R_ECX] - 0xc0010000) * 2;
+            t1 = (t0 / 8);
+            t0 %= 8;
+            break;
+        default:
+            cpu_vmexit(env, type, param, retaddr);
+            t0 = 0;
+            t1 = 0;
+            break;
         }
-        break;
-    default:
-        if (env->intercept & (1ULL << (type - SVM_EXIT_INTR))) {
+        if (x86_ldub_phys(cs, addr + t1) & ((1 << param) << t0)) {
             cpu_vmexit(env, type, param, retaddr);
         }
-        break;
+        return;
     }
+
+    cpu_vmexit(env, type, param, retaddr);
 }
 
 void helper_svm_check_intercept(CPUX86State *env, uint32_t type)
-- 
2.31.1




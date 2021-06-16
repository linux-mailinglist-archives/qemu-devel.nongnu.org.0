Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA93A9AA3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:41:50 +0200 (CEST)
Received: from localhost ([::1]:40418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltUrd-0005jg-J9
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1ltUp9-0003bg-GG
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:39:15 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1ltUp6-00068h-OX
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:39:15 -0400
Received: by mail-wr1-x432.google.com with SMTP id m18so2533163wrv.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pz3f5BQMMh6gZXdg7BbIJKDpOxerjbISimqm16pYa4s=;
 b=R5S/T1kyV8xPHoX3IsVRHUJ1LALxZR0DFe4GciCwIFWTPYsI44GFf2qHogGiUxVckx
 f2l2xqSINecfp37vQqa+3Lt4cwgdZ3E6KwGXBTvoLYgIJYvWfzt05woujVdd/IdOPqNg
 ugC1DxgtOUCe8fudoLOVQRVHwh3AfzSeG0AajdPFub+lqQ3G54u8VX1QspOayKKJSu2X
 iGt6gkiapuvmUg115UHWyKj/7CAvvRrRY2gLHxb/YbII+QksryMG6zpk9tLSXpB3xBt9
 WELUgI45yuBjhz/JDL49b78O0219Q7rVVNUUqOJq04eYMYKpJ9s+n0v+bpKxiZlotffx
 JasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pz3f5BQMMh6gZXdg7BbIJKDpOxerjbISimqm16pYa4s=;
 b=BYEslpJ9eHuCbU8mqZCYAPTDW80TxSwmCqDmbuW7vjvJvdZ5m+MS1aDdlwTKQvD24g
 7Rk62TZ9wQ/77EkIDNqCAmm6WG/IiPVYJoeIqRa0hdM+ckN5pVyuyrK2RlGtvZcUfk6Y
 mVwn+3svVSMEqsmXSHreySLTqolHCTO9CB4fdxv3oiO897Udsw1LkMSHQ57UFAE/uOUW
 2xOkaxLLOwJ1Ae2QGE5nvif7sgJRCBh0iSjF6dXAlq+zOEd68++YH8D7MbhiolcD+Ktg
 imrEqM96nBJ5hRiyf0SBcdZUevFoNu5W3J4Ki/G7HkZY6O5iRhL1kvEQalbfi+7x8Rha
 d+Uw==
X-Gm-Message-State: AOAM533RU+YmSz4IU+kpPvLaDegzVlmZJxYicUx/eDs6x4UhT3fvOjQg
 LMCD9HefUBx4NEP/wh/9Lb8wQ2Axhe7Blw==
X-Google-Smtp-Source: ABdhPJytGQH/1CNjgxf7DZHZlbyEnboOyWe2DOP2uR6Dhd5LnIHXtWfltFTwx20u+BhhBj00nVM1Og==
X-Received: by 2002:a05:6000:110e:: with SMTP id
 z14mr5274289wrw.235.1623847150459; 
 Wed, 16 Jun 2021 05:39:10 -0700 (PDT)
Received: from localhost.localdomain ([82.197.173.73])
 by smtp.gmail.com with ESMTPSA id c12sm2330273wrr.90.2021.06.16.05.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 05:39:10 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] target/i386: Refactored intercept checks into
 cpu_svm_has_intercept
Date: Wed, 16 Jun 2021 14:39:04 +0200
Message-Id: <20210616123907.17765-2-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616123907.17765-1-laramglazier@gmail.com>
References: <20210616123907.17765-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=laramglazier@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added cpu_svm_has_intercept to reduce duplication when checking the
corresponding intercept bit outside of cpu_svm_check_intercept_param

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.h                   |   3 +
 target/i386/tcg/sysemu/svm_helper.c | 105 +++++++++++++++-------------
 2 files changed, 61 insertions(+), 47 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ac3abea97c..59b9231ee2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2149,9 +2149,12 @@ static inline void
 cpu_svm_check_intercept_param(CPUX86State *env1, uint32_t type,
                               uint64_t param, uintptr_t retaddr)
 { /* no-op */ }
+bool cpu_svm_has_intercept(CPUX86State *env, uint32_t type)
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
@@ -412,80 +412,91 @@ void helper_clgi(CPUX86State *env)
     env->hflags2 &= ~HF2_GIF_MASK;
 }
 
-void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
-                                   uint64_t param, uintptr_t retaddr)
+bool cpu_svm_has_intercept(CPUX86State *env, uint32_t type)
 {
-    CPUState *cs = env_cpu(env);
-
-    if (likely(!(env->hflags & HF_GUEST_MASK))) {
-        return;
-    }
     switch (type) {
     case SVM_EXIT_READ_CR0 ... SVM_EXIT_READ_CR0 + 8:
         if (env->intercept_cr_read & (1 << (type - SVM_EXIT_READ_CR0))) {
-            cpu_vmexit(env, type, param, retaddr);
+            return true;
         }
         break;
     case SVM_EXIT_WRITE_CR0 ... SVM_EXIT_WRITE_CR0 + 8:
         if (env->intercept_cr_write & (1 << (type - SVM_EXIT_WRITE_CR0))) {
-            cpu_vmexit(env, type, param, retaddr);
+            return true;
         }
         break;
     case SVM_EXIT_READ_DR0 ... SVM_EXIT_READ_DR0 + 7:
         if (env->intercept_dr_read & (1 << (type - SVM_EXIT_READ_DR0))) {
-            cpu_vmexit(env, type, param, retaddr);
+            return true;
         }
         break;
     case SVM_EXIT_WRITE_DR0 ... SVM_EXIT_WRITE_DR0 + 7:
         if (env->intercept_dr_write & (1 << (type - SVM_EXIT_WRITE_DR0))) {
-            cpu_vmexit(env, type, param, retaddr);
+            return true;
         }
         break;
     case SVM_EXIT_EXCP_BASE ... SVM_EXIT_EXCP_BASE + 31:
         if (env->intercept_exceptions & (1 << (type - SVM_EXIT_EXCP_BASE))) {
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
-
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
+            return true;
         }
         break;
     default:
         if (env->intercept & (1ULL << (type - SVM_EXIT_INTR))) {
-            cpu_vmexit(env, type, param, retaddr);
+            return true;
         }
         break;
     }
+    return false;
+}
+
+void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
+                                   uint64_t param, uintptr_t retaddr)
+{
+    CPUState *cs = env_cpu(env);
+
+    if (likely(!(env->hflags & HF_GUEST_MASK))) {
+        return;
+    }
+
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
+        }
+        if (x86_ldub_phys(cs, addr + t1) & ((1 << param) << t0)) {
+            cpu_vmexit(env, type, param, retaddr);
+        }
+        return;
+    }
+
+    cpu_vmexit(env, type, param, retaddr);
 }
 
 void helper_svm_check_intercept(CPUX86State *env, uint32_t type)
-- 
2.25.1



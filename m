Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E903C1641
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:46:08 +0200 (CEST)
Received: from localhost ([::1]:51088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WE3-0006uo-Ph
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnC-0001Aa-Iz
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:23 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnA-0008Kz-Iw
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:22 -0400
Received: by mail-ej1-x629.google.com with SMTP id hc16so10254241ejc.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MGKKVl3QbKe1iLy2VhvmJf/EJj62pnAxZn6Ud3Ie0QM=;
 b=kN1yeWj0nlUVESo2iq/QoX7uCc3yuPbT/jH3PTMI+MpM2tqzqyWkhBIicdnXgSREK0
 OApwllIwFUmSiFq73SIdX5JSIRElb2vN/8fL8Ps42Z8fnso1YXwtPCmox/ejcAW8BUtp
 gMaFwhm5VwXZTfSIKiFg8Wk3R4gWnO3YJxJSz2So5+ADeGhGIwrjBM93T3LEiZmOEMp+
 mukw4S6sMhJqcYt3nsiW6+jx//ylTBuhfLW2MZM0RUIBVUcEy6RQrZoNzNBMWBPXT1Iw
 sqbYW63pPHf7ML2l6JxlTkWWoXye1ErVarLI3F+QELKRIzjHMTNHZNsYZzhBMDuUDeK/
 8flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MGKKVl3QbKe1iLy2VhvmJf/EJj62pnAxZn6Ud3Ie0QM=;
 b=CsuIrokwDXOBLbyCSV+1N1+n+YRLtHpfOn1QffLjOAfoPrFIA+9xyM7/E1HdqG25aG
 G4rxfJPBQ+TEGjURXSEG39/fAt0jf0bkIFBA2FiEgQ+4TxNjDnY0JUX2L80huBHk5OBS
 y6g+PT/HHapyBjL9XalPajjybmKWXQ2gjbka1c5EyI6rXjmegyraSPYTi8uzqwc5i2bx
 00KR2DwbaC9L/93DppHuDESlXg89emCfRTpQlj8CtlwCEbypspfc5miajffORFeOvJpp
 QLyD3wsWnA+IRr57fe8LBDZ7ghp73Ctg6mvUxuw98hX6/tViPRvp4U0m00qzdRFzhyWb
 kYSA==
X-Gm-Message-State: AOAM532QpJs5m0tDYcUw7504pjczvUA2FK9XFLbXiFHSP0Gy7GfbdTk8
 RMzgXOqxZbMPcKDKMlC0+YExGBttuaI=
X-Google-Smtp-Source: ABdhPJxOyfuK8fa8FzqoRjfv0f4h8pT7TrZ9y5bmTKaWDvJ2DFaoMQBT4O8qsqQyQac0fcKVuw3wqg==
X-Received: by 2002:a17:906:a219:: with SMTP id
 r25mr3893448ejy.133.1625757498758; 
 Thu, 08 Jul 2021 08:18:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/48] target/i386: fix exceptions for MOV to DR
Date: Thu,  8 Jul 2021 17:17:41 +0200
Message-Id: <20210708151748.408754-42-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use raise_exception_ra (without error code) when raising the illegal
opcode operation; raise #GP when setting bits 63:32 of DR6 or DR7.

Move helper_get_dr to sysemu/ since it is a privileged instruction
that is not needed on user-mode emulators.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h                   |  2 ++
 target/i386/helper.h                |  3 +-
 target/i386/svm.h                   |  2 --
 target/i386/tcg/bpt_helper.c        | 21 -------------
 target/i386/tcg/sysemu/bpt_helper.c | 47 ++++++++++++++++++-----------
 target/i386/tcg/sysemu/svm_helper.c |  4 +--
 target/i386/tcg/translate.c         |  1 +
 7 files changed, 35 insertions(+), 45 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0f7ddbfeae..8f3747dd28 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -268,6 +268,8 @@ typedef enum X86Seg {
 #define DR7_TYPE_IO_RW       0x2
 #define DR7_TYPE_DATA_RW     0x3
 
+#define DR_RESERVED_MASK 0xffffffff00000000ULL
+
 #define PG_PRESENT_BIT  0
 #define PG_RW_BIT       1
 #define PG_USER_BIT     2
diff --git a/target/i386/helper.h b/target/i386/helper.h
index f3d8c3f949..574ff75615 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -46,9 +46,8 @@ DEF_HELPER_1(clts, void, env)
 
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_FLAGS_3(set_dr, TCG_CALL_NO_WG, void, env, int, tl)
-#endif /* !CONFIG_USER_ONLY */
-
 DEF_HELPER_FLAGS_2(get_dr, TCG_CALL_NO_WG, tl, env, int)
+#endif /* !CONFIG_USER_ONLY */
 
 DEF_HELPER_1(sysenter, void, env)
 DEF_HELPER_2(sysexit, void, env, int)
diff --git a/target/i386/svm.h b/target/i386/svm.h
index 4bde9f3475..adc058dc76 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -140,8 +140,6 @@
 #define SVM_MSRPM_SIZE		(1ULL << 13)
 #define SVM_IOPM_SIZE		((1ULL << 13) + 1)
 
-#define SVM_DR_RESERVED_MASK 0xffffffff00000000ULL
-
 struct QEMU_PACKED vmcb_control_area {
 	uint16_t intercept_cr_read;
 	uint16_t intercept_cr_write;
diff --git a/target/i386/tcg/bpt_helper.c b/target/i386/tcg/bpt_helper.c
index 83cd89581e..b6c1fff16e 100644
--- a/target/i386/tcg/bpt_helper.c
+++ b/target/i386/tcg/bpt_helper.c
@@ -37,24 +37,3 @@ void helper_rechecking_single_step(CPUX86State *env)
         helper_single_step(env);
     }
 }
-
-target_ulong helper_get_dr(CPUX86State *env, int reg)
-{
-    switch (reg) {
-    case 0: case 1: case 2: case 3: case 6: case 7:
-        return env->dr[reg];
-    case 4:
-        if (env->cr[4] & CR4_DE_MASK) {
-            break;
-        } else {
-            return env->dr[6];
-        }
-    case 5:
-        if (env->cr[4] & CR4_DE_MASK) {
-            break;
-        } else {
-            return env->dr[7];
-        }
-    }
-    raise_exception_err_ra(env, EXCP06_ILLOP, 0, GETPC());
-}
diff --git a/target/i386/tcg/sysemu/bpt_helper.c b/target/i386/tcg/sysemu/bpt_helper.c
index 9bdf7e170b..805118c6b5 100644
--- a/target/i386/tcg/sysemu/bpt_helper.c
+++ b/target/i386/tcg/sysemu/bpt_helper.c
@@ -234,10 +234,30 @@ void breakpoint_handler(CPUState *cs)
     }
 }
 
+target_ulong helper_get_dr(CPUX86State *env, int reg)
+{
+    if (reg >= 4 && reg < 6) {
+        if (env->cr[4] & CR4_DE_MASK) {
+            raise_exception_ra(env, EXCP06_ILLOP, GETPC());
+        } else {
+            reg += 2;
+        }
+    }
+
+    return env->dr[reg];
+}
+
 void helper_set_dr(CPUX86State *env, int reg, target_ulong t0)
 {
-    switch (reg) {
-    case 0: case 1: case 2: case 3:
+    if (reg >= 4 && reg < 6) {
+        if (env->cr[4] & CR4_DE_MASK) {
+            raise_exception_ra(env, EXCP06_ILLOP, GETPC());
+        } else {
+            reg += 2;
+        }
+    }
+
+    if (reg < 4) {
         if (hw_breakpoint_enabled(env->dr[7], reg)
             && hw_breakpoint_type(env->dr[7], reg) != DR7_TYPE_IO_RW) {
             hw_breakpoint_remove(env, reg);
@@ -246,25 +266,16 @@ void helper_set_dr(CPUX86State *env, int reg, target_ulong t0)
         } else {
             env->dr[reg] = t0;
         }
-        return;
-    case 4:
-        if (env->cr[4] & CR4_DE_MASK) {
-            break;
+    } else {
+        if (t0 & DR_RESERVED_MASK) {
+            raise_exception_err_ra(env, EXCP0D_GPF, 0, GETPC());
         }
-        /* fallthru */
-    case 6:
-        env->dr[6] = t0 | DR6_FIXED_1;
-        return;
-    case 5:
-        if (env->cr[4] & CR4_DE_MASK) {
-            break;
+        if (reg == 6) {
+            env->dr[6] = t0 | DR6_FIXED_1;
+        } else {
+            cpu_x86_update_dr7(env, t0);
         }
-        /* fallthru */
-    case 7:
-        cpu_x86_update_dr7(env, t0);
-        return;
     }
-    raise_exception_err_ra(env, EXCP06_ILLOP, 0, GETPC());
 }
 
 /* Check if Port I/O is trapped by a breakpoint.  */
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 047f31628e..00618cff23 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -270,10 +270,10 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
                           env->vm_vmcb + offsetof(struct vmcb, save.dr6));
 
 #ifdef TARGET_X86_64
-    if (env->dr[6] & SVM_DR_RESERVED_MASK) {
+    if (env->dr[6] & DR_RESERVED_MASK) {
         cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
     }
-    if (env->dr[7] & SVM_DR_RESERVED_MASK) {
+    if (env->dr[7] & DR_RESERVED_MASK) {
         cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
     }
 #endif
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b21873ed23..9e445b9bf0 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -206,6 +206,7 @@ STUB_HELPER(outw, TCGv_env env, TCGv_i32 port, TCGv_i32 val)
 STUB_HELPER(outl, TCGv_env env, TCGv_i32 port, TCGv_i32 val)
 STUB_HELPER(rdmsr, TCGv_env env)
 STUB_HELPER(read_crN, TCGv ret, TCGv_env env, TCGv_i32 reg)
+STUB_HELPER(get_dr, TCGv ret, TCGv_env env, TCGv_i32 reg)
 STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
 STUB_HELPER(stgi, TCGv_env env)
 STUB_HELPER(svm_check_intercept, TCGv_env env, TCGv_i32 type)
-- 
2.31.1




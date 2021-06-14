Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9223A5FC9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 12:13:25 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjau-0002xe-Hw
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 06:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1lsjWx-0005C7-25
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:09:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1lsjWs-00044b-I3
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:09:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so12428412wmq.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 03:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zPNUcRYgGmr4VMYBANGO9WVeq5kpBLoCHc6KvmEV1vU=;
 b=vdkhOFgy1Lv8rKJXH/BcucMpo4oYe0ZFQ5MzzwKMfqR053bRWEdl6pY6g73JUd0sfW
 Dy4Slx3m1efIbjPvHXT1mDjq8VAyNKpfOj6dP/bsEaJ6gg7ocYWd/3kUs+LIS7VYqhJR
 6dU4JENn6f9ldUgaYZ+qYQ/18cCbXhCGDSnMdXfdgxeUSufEb7/2CeLlkPrRao7XW3G8
 FVKgVUbm5wt1ycpVJ0HWsb7KfLRxfBEB3yYd6rwnGOmW+1Ugw4x4wXoFecLG3Miv9evt
 /CqupthVxwKkZgAGeKZ85AbHXsdm96IV0ZyP9tq+jdKs0gRrqy3SxKFcACQzRQAA95Fx
 USPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zPNUcRYgGmr4VMYBANGO9WVeq5kpBLoCHc6KvmEV1vU=;
 b=Pb0nz9JBIqPWhOJ5m47KKXeFrSsvQv7NGk5hqOJeOqLOSG47BAICkA6npZxeEHCZqM
 XNY7KieOKCNbmOuS/erng+na79o/pcxhOd5LgUr++9lT0q+09GPAYcaAgKH7eVbjV6Qx
 +8MXx/1C+Z0j0JO99mmehXdggOcyGaABvp6FWzHFhVLTpozGp0T06wgBY6OKdYrZOqis
 nooQwqRQaF5OuKaIB8Oid1JrVubQPBGQ7qINeLiUrwXImopz2XfOM21rZMLDlRgksT2X
 igD3GMUY8m9rKt08saEvGpJgMQ/kcjZvbYHd3tCAPGRHLu87Wm1gUgNApwKLJFF29+CI
 XZ3Q==
X-Gm-Message-State: AOAM533741QI6AEXj5SYptllkHRl3T7YtZAuV5HRigHfKxFH0YxXuEvH
 70OF6guloSENiTmdmx/lhFXNAn7fP1cUIg==
X-Google-Smtp-Source: ABdhPJwdRNi5m+d3EKW7f/oXht0JJn/vVLMK1QP/qw6RRQQYg8eriFSiPHCwVAyA5MG/ktWP7V1mcw==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr14769379wmq.153.1623665353098; 
 Mon, 14 Jun 2021 03:09:13 -0700 (PDT)
Received: from localhost.localdomain ([37.161.140.231])
 by smtp.gmail.com with ESMTPSA id o18sm15752254wrx.59.2021.06.14.03.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 03:09:12 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/i386: Added consistency checks for CR0
Date: Mon, 14 Jun 2021 12:09:01 +0200
Message-Id: <20210614100902.15860-3-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614100902.15860-1-laramglazier@gmail.com>
References: <20210614100902.15860-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x329.google.com
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

The combination of unset CD and set NW bit in CR0 is illegal.
CR0[63:32] are also reserved and need to be zero.
(AMD64 Architecture Programmer's Manual, V2, 15.5)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.h                   |  2 ++
 target/i386/svm.h                   |  1 +
 target/i386/tcg/sysemu/svm_helper.c | 12 +++++++++---
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ac3abea97c..46542513cc 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -224,6 +224,8 @@ typedef enum X86Seg {
 #define CR0_NE_MASK  (1U << 5)
 #define CR0_WP_MASK  (1U << 16)
 #define CR0_AM_MASK  (1U << 18)
+#define CR0_NW_MASK  (1U << 29)
+#define CR0_CD_MASK  (1U << 30)
 #define CR0_PG_MASK  (1U << 31)
 
 #define CR4_VME_MASK  (1U << 0)
diff --git a/target/i386/svm.h b/target/i386/svm.h
index 1c55d4f829..7a88906907 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -136,6 +136,7 @@
 #define SVM_NPTEXIT_GPT     (1ULL << 33)
 
 #define SVM_VMRUN_INTERCEPT (1ULL << 32)
+#define SVM_CR0_RESERVED_MASK 0xffffffff00000000U
 
 struct QEMU_PACKED vmcb_control_area {
 	uint16_t intercept_cr_read;
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index ff826fe11a..63aaa53490 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -73,6 +73,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     uint32_t event_inj;
     uint32_t int_ctl;
     uint32_t asid;
+    uint64_t new_cr0;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMRUN, 0, GETPC());
 
@@ -192,13 +193,18 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     env->idt.limit = x86_ldl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
                                                       save.idtr.limit));
 
+    new_cr0 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr0));
+    if (new_cr0 & SVM_CR0_RESERVED_MASK) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
+    if ((new_cr0 & CR0_NW_MASK) && !(new_cr0 & CR0_CD_MASK)) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
     /* clear exit_info_2 so we behave like the real hardware */
     x86_stq_phys(cs,
              env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2), 0);
 
-    cpu_x86_update_cr0(env, x86_ldq_phys(cs,
-                                     env->vm_vmcb + offsetof(struct vmcb,
-                                                             save.cr0)));
+    cpu_x86_update_cr0(env, new_cr0);
     cpu_x86_update_cr4(env, x86_ldq_phys(cs,
                                      env->vm_vmcb + offsetof(struct vmcb,
                                                              save.cr4)));
-- 
2.25.1



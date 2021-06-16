Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94103A9AA9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:43:29 +0200 (CEST)
Received: from localhost ([::1]:45848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltUtE-00012W-Rx
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1ltUpA-0003cj-60
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:39:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1ltUp6-00069S-TE
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:39:15 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q5so2546366wrm.1
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 05:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c7LHRpzoj4CXpyM2Hpp18CdFcaswdKYOw7GMNx8g0po=;
 b=fY/R+uqJmuDl+gsrvgGTx/+ZfupTtRtYeGuCM3mmh5fvQz6QnIDaSD8903nIyplUzf
 75/TqcN6RD3RrufcMzRnIIHA/EEw+H9AByqHwC8Myfbi5+mdOoxSaR5jGm7t5gTZozjC
 hdQ7ppe2WWnshOsuFp6H0kj6EtlGLYDkd0mULKLGt+2czFBWbeaw8C/cUnkx9XsJlZU5
 Eq7cG0LUk9LKXYZYaKyqrUA2/I640KoChzRE2nyyZoZ6S9qFMpXMCx1nTZzp6kjcUkGa
 rlnpkHtbS2exyxMac9HYhCUI6R8Sg3h0zsfIyuIUxmHnIGReUGh/84a5/8E6Du+ESYTx
 yxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c7LHRpzoj4CXpyM2Hpp18CdFcaswdKYOw7GMNx8g0po=;
 b=AxJq0yBfv/pqoIL50uSeF2/9I8AyXyfvso+zQfO8mJaRUnaimkF6SclnCK9HWxCzi7
 r7qYYauvnP1a9Sx6w9CjBDZwYX8ttNxNINdnQEKWNIse5pAR8X8xZK+QfAza3ee95e8x
 u4+dboKbIKCYG1CDtvKNJWU8Vl/BLT26Lh9sgVMlruWJFdQlYm0mr+oVhy7eNzyNmGei
 yFCcOq1P+QYEGFKKU0z5X5cFjClvAtPySzp+gcJCQchaGj7fb+plwcBU7twoZRkQy60H
 5B14zj0B6EiXE6CdtVczBlq8Dx0g0ZU3dI6kVXQ5o1e1zsXo9jBxkbaJoBJ/7GnT6HIc
 ZrVA==
X-Gm-Message-State: AOAM531Sz8cyMncQW22qMIpoYD+OyAVHg5zqbiCrRVbRavP7NlNEKzbz
 OkD/RDiH6MtDmuDk0GbQ6G02Hy8Bq2pqkQ==
X-Google-Smtp-Source: ABdhPJzRa0I21gxR42m4cSNeDWUkWgk1lYIXivI3FtraJ6QtwRCt89mZgl4UEwwZMou9WceRHH1sSw==
X-Received: by 2002:adf:a191:: with SMTP id u17mr5193074wru.150.1623847151561; 
 Wed, 16 Jun 2021 05:39:11 -0700 (PDT)
Received: from localhost.localdomain ([82.197.173.73])
 by smtp.gmail.com with ESMTPSA id c12sm2330273wrr.90.2021.06.16.05.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 05:39:11 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] target/i386: Added consistency checks for CR0
Date: Wed, 16 Jun 2021 14:39:06 +0200
Message-Id: <20210616123907.17765-4-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616123907.17765-1-laramglazier@gmail.com>
References: <20210616123907.17765-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=laramglazier@gmail.com; helo=mail-wr1-x42d.google.com
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
 target/i386/svm.h                   |  2 ++
 target/i386/tcg/sysemu/svm_helper.c | 12 +++++++++---
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 59b9231ee2..6b9d04b33e 100644
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
index 87965e5bc2..5098733053 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -135,6 +135,8 @@
 #define SVM_NPTEXIT_GPA     (1ULL << 32)
 #define SVM_NPTEXIT_GPT     (1ULL << 33)
 
+#define SVM_CR0_RESERVED_MASK 0xffffffff00000000U
+
 struct QEMU_PACKED vmcb_control_area {
 	uint16_t intercept_cr_read;
 	uint16_t intercept_cr_write;
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 902bf03fc3..1c2dbc1862 100644
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



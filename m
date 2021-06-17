Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7063AB071
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:55:58 +0200 (CEST)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltokf-00040n-QD
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNZ-00035S-7R
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:05 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNX-0006M8-GR
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:04 -0400
Received: by mail-ej1-x62b.google.com with SMTP id he7so8673147ejc.13
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Ui8G8tZLwk/rGM64JxEVMBWydF4cB84aHXFqaciPiU=;
 b=oo1klPfoD7IxWrq8Ag8HxYqUWbCHOYJQt4R4cXGHo3fUYbuNW8CvHRr0RWOyBxtL+g
 0Nd2kmesSIBiHMbPh5PkdiWYDd36GVj1wx4abfHgrv64B/mZBrHeux1iY6SNbi03ecP9
 1+iz7kzG+60U5c3T+cSnf10OMWB4wsK9XMRyekFb/rw0QZ4igIVcktAs7tAcfI2MMTm0
 o8FWBfu3ETiOTQKO6YZn4/8CO7cUz50kejLaVNwe1dp/94uOGmmq974GbqRGQUj4YOCL
 PWYkHRuY3nroNaGn2DZqY8/4VzE5A6+owL4sQ6BZGWo5mQCzIJl19ZsDma3x14uco3I1
 hV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1Ui8G8tZLwk/rGM64JxEVMBWydF4cB84aHXFqaciPiU=;
 b=LCSvh9CcAqYfrLP/KwgcKxy8Izc+pHwRs2Dj36v8NwOYx2HQhkZ4yTKslqeSMyShcn
 yHgK43QaZzlBeWjq87Eu/L6EnRUxs61j58WbUxg56+KWwFHt1l2RvT/RUSV0gEjonQ6k
 DWPxu4UpYyTY+ddVUjpnxsYZ3TIhZLhiwgwp3BRZltPnsFT2qWLZForpvlmvSUqOMXdA
 1LvuSJUK2TgwXbKYtL/CaVvcYrBQVxMfXjXZRcZ3iYAXbfSZKP7BHLdDqAcKyTxHdy0J
 O6zPkL42Ak+pdwh9A+VzeCPfje+yHGj8vTbsFvVzUvIiUFpx2DfQ66qCU9Gg7I2kGs+n
 RAow==
X-Gm-Message-State: AOAM531hkW4reuek68X7+BWq5VkHpcmoGjf5pMZgc1DiaKJLvxUTTBMS
 IPkoX/ViE/xFV8BdgslVjC94otZfTqg=
X-Google-Smtp-Source: ABdhPJzo6V3bxQqkaf8Dr8ESHuCwTT7Jbu0RUjW47rmXsuvW8kR0rZDbdOrRfY8a0j6UKAg/c77GhQ==
X-Received: by 2002:a17:907:1b02:: with SMTP id
 mp2mr4205925ejc.196.1623922322244; 
 Thu, 17 Jun 2021 02:32:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/45] target/i386: Added consistency checks for CR0
Date: Thu, 17 Jun 2021 11:31:25 +0200
Message-Id: <20210617093134.900014-37-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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

The combination of unset CD and set NW bit in CR0 is illegal.
CR0[63:32] are also reserved and need to be zero.
(AMD64 Architecture Programmer's Manual, V2, 15.5)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210616123907.17765-4-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h                   |  2 ++
 target/i386/svm.h                   |  2 ++
 target/i386/tcg/sysemu/svm_helper.c | 12 +++++++++---
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 64b4e46731..1e11071d81 100644
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
2.31.1




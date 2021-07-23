Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CC63D397D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 13:29:53 +0200 (CEST)
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6tNI-0002tD-Jg
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 07:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m6tLL-0001Xt-4w
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:27:51 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m6tLJ-0001AT-Km
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:27:50 -0400
Received: by mail-ed1-x532.google.com with SMTP id df26so1309489edb.9
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 04:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGHW3a60NIDsEcRf36TM/6mUVcZDkmjFHxvSTfI4Uzc=;
 b=llDQ0BOpZo+iD1YuzeVL6Sa88ksI0WFTR8838CcbQPQ45is2pRb5y34uX63C0XIFJ4
 AQT9DB/mJhar6nLTcRn85tLsuHi7pwQr8EBzOgxnwEOyIKTzmTDy1ga2xz5sUiSVfYin
 TBnA5hf3Ulk/TgM4wZGKdh2xx30sfNOdzgM4DH9r7dGyFaLRQ6ZjTjf+8XIw4qTFUSOQ
 JspKsSuH64kkHwjDhxVnTKQ4oZENnilf50OD0rPERc08IuvF2AUIpU0numygisOgz7JX
 1KVrjokREFCGxXqxIRuQhpGZ2DhgVKR42cEaxKjEwLVwqe8O8WAQcf8+5Wsy+lz+KAzU
 VP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGHW3a60NIDsEcRf36TM/6mUVcZDkmjFHxvSTfI4Uzc=;
 b=W808ZjpKzKumRsCv40T8jJx7/I2nAPHrJPS9a+i5xs9NIDc1yCKQdJBl/7tuBKM8PF
 J5nxKv/BU/36whtJ50cApVSzvCgR0gn+44uSN1SkIT2jubFVcTzHXW9D8y/z77cq/uuM
 kJFWTsIoXVrDVrs9+wWUcT1CzzhrbqAhaYHxuCD75zlEKi2CoE2Ngw78/T14SjQwlZDL
 5E1j7ObDqbsF7B4kM91AP60xyA9ptnOyK7pNBPJnLA8iNJIHZXA1z5sAfujT3zajHk3w
 I3NXHUzrlVd1Hx0KZAsDFGX+BVA5+aTWa1dK/A/+avr6mXU7p6+nkHSMAiZAFi1jM9Kw
 CgYA==
X-Gm-Message-State: AOAM533R3DmhMWcDCF7LCZ7wfMAGtGmXycWh6zTVE2HzCkb9npeKiG9K
 s9b16c2TcKJlvykk+NowigSL9zLScrO5Tw==
X-Google-Smtp-Source: ABdhPJzIcY7IlAnKkyr9AtqKHcmC/yxH3EWjhMyGuWwsbTp4ZHQ0WDknV91Q5nqdDPOhrVWsijjZ3w==
X-Received: by 2002:aa7:c4c7:: with SMTP id p7mr4941701edr.290.1627039667453; 
 Fri, 23 Jul 2021 04:27:47 -0700 (PDT)
Received: from localhost.localdomain ([151.68.138.167])
 by smtp.gmail.com with ESMTPSA id eg5sm14010900edb.38.2021.07.23.04.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 04:27:46 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Added consistency checks for CR3
Date: Fri, 23 Jul 2021 13:27:40 +0200
Message-Id: <20210723112740.45962-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=laramglazier@gmail.com; helo=mail-ed1-x532.google.com
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

All MBZ in CR3 must be zero (APM2 15.5)
Added checks in both helper_vmrun and helper_write_crN.
When EFER.LMA is zero the upper 32 bits needs to be zeroed.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/tcg/sysemu/misc_helper.c |  7 +++++++
 target/i386/tcg/sysemu/svm_helper.c  | 10 +++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index a2af2c9bba..d347af2a99 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -96,6 +96,13 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
         cpu_x86_update_cr0(env, t0);
         break;
     case 3:
+        if ((env->efer & MSR_EFER_LMA) &&
+                (t0 & ((~0UL) << env_archcpu(env)->phys_bits))) {
+            cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+        }
+        if (!(env->efer & MSR_EFER_LMA)) {
+            t0 &= 0xffffffffUL;
+        }
         cpu_x86_update_cr3(env, t0);
         break;
     case 4:
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 37dbe8e434..8b1ba53c64 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -111,6 +111,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     uint32_t int_ctl;
     uint32_t asid;
     uint64_t new_cr0;
+    uint64_t new_cr3;
     uint64_t new_cr4;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMRUN, 0, GETPC());
@@ -252,6 +253,11 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     if ((new_cr0 & CR0_NW_MASK) && !(new_cr0 & CR0_CD_MASK)) {
         cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
     }
+    new_cr3 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr3));
+    if ((env->efer & MSR_EFER_LMA) &&
+            (new_cr3 & ((~0UL) << cpu->phys_bits))) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
     new_cr4 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr4));
     if (new_cr4 & cr4_reserved_bits(env)) {
         cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
@@ -262,9 +268,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 
     cpu_x86_update_cr0(env, new_cr0);
     cpu_x86_update_cr4(env, new_cr4);
-    cpu_x86_update_cr3(env, x86_ldq_phys(cs,
-                                     env->vm_vmcb + offsetof(struct vmcb,
-                                                             save.cr3)));
+    cpu_x86_update_cr3(env, new_cr3);
     env->cr[2] = x86_ldq_phys(cs,
                           env->vm_vmcb + offsetof(struct vmcb, save.cr2));
     int_ctl = x86_ldl_phys(cs,
-- 
2.25.1



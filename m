Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD953D467B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 10:57:41 +0200 (CEST)
Received: from localhost ([::1]:40192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7DTY-0005r6-NE
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 04:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQy-000328-Ac
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:55:00 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQw-0002tf-67
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:55:00 -0400
Received: by mail-ej1-x635.google.com with SMTP id e19so7167406ejs.9
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 01:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xdEiRZN1v/sZpkTLvZyGYr+OUpRF15xUtThQLAzFLSs=;
 b=oEhvt1+E+QBjMj0A4Y68ud3uGNKsbEBw6ZQUPZaVj7GnnsI7ijcEia+P/rWBnGqjO0
 37KCUIJk9wvp0/LD4ISF71n/FJHaCkDPKL/x4WGDJwSgd1nmO5jUyVm4sYQjEcBVL6oK
 Y4GKY+TPqjDItcO8KcJ/9H6OK8DYpSAuKa3y4LWiLoFcfOTJrr692EOTQ35xpIsFx0WQ
 UKJBIn6aFFbStevEkYdh0ZYXMXfoM3Y1iYXxi64Ox7TfdtTUzTWc3hTuTarR/Vw9GegJ
 1oQnQZ4Ejiw8IwMgDEfCQvWpUaA1X+RSVqgoQ1X1IufXSASdA4SpcFhZCsXjWLDy1oWs
 oWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xdEiRZN1v/sZpkTLvZyGYr+OUpRF15xUtThQLAzFLSs=;
 b=nMMe5YfZ/buYe15tI+xfffNZNByJ5hhjf4G0xp9pz7l7Duc8vEVI/23Uch4q0NlTbU
 f9whNbXj1oM1uExW2gjsaJ47bwF9vZ01jUrbpsEPjs1KoMmWPzZKfE5YnIPTX18e6ryz
 amy77bbapIISf7p0qeAjk4n8JZrN8TpQOXCqsPCARpqJCGdXJqKGcAujj1zyiohertCR
 GB7Fx5o2z/9IaZAOKoN74Wuoo6o51mOPgSNubsLvkIBtzt5wNjyTDYbz4oApPxcam3r7
 ocUyaCSAGoO4C1duszV9lULCtOhE/noGNu1AsdtgHn276AFsMmkOEOENa8SuSlZpK0pm
 6AEw==
X-Gm-Message-State: AOAM532JxSSOKDGMIWNizOw58IfaLn67RFUmP+f3zJxfLeccodwgdHIi
 HGqPr+pjXXY0z1/PEATrPOs7R0skqbebQA==
X-Google-Smtp-Source: ABdhPJxUSWannDA2dKNwx6T0Upw2as/lW8Xz1DoqqNCU5XPqfoV9bOpv7VcjnfHY7ncZjs/s1yAznQ==
X-Received: by 2002:a17:906:2844:: with SMTP id
 s4mr8246439ejc.263.1627116896884; 
 Sat, 24 Jul 2021 01:54:56 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j21sm15723881edq.76.2021.07.24.01.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 01:54:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] target/i386: Added consistency checks for CR3
Date: Sat, 24 Jul 2021 10:54:46 +0200
Message-Id: <20210724085453.16791-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724085453.16791-1-pbonzini@redhat.com>
References: <20210724085453.16791-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

All MBZ in CR3 must be zero (APM2 15.5)
Added checks in both helper_vmrun and helper_write_crN.
When EFER.LMA is zero the upper 32 bits needs to be zeroed.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210723112740.45962-1-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index 4d64ec378e..145511d635 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -120,6 +120,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     uint32_t int_ctl;
     uint32_t asid;
     uint64_t new_cr0;
+    uint64_t new_cr3;
     uint64_t new_cr4;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMRUN, 0, GETPC());
@@ -261,6 +262,11 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
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
@@ -271,9 +277,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 
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
2.31.1




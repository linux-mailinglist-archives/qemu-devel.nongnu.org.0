Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC213D126D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:30:08 +0200 (CEST)
Received: from localhost ([::1]:54594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EAh-0004u7-CA
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m6E7r-0007MM-16
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:27:11 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m6E7n-00044s-Pq
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:27:10 -0400
Received: by mail-ej1-x62a.google.com with SMTP id oz7so3863830ejc.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8CYZB9izVHIYYhYgKoKIAX3eB1BT443+lnEKlYC3f9k=;
 b=LUAZgMduBkc5mBCX9srYQCuZ14QuM8QGNwyfBdhsKuaWt8dvo69Yh9UlUsnGoBbcDv
 SNmMEaAh4dlI9axVRiyP003D1urFc/CeAyPug1yiAHUrC4SwvnyE6lV0JdVoH3RpagLg
 gkVlcdazxyu24D9rF+/niPAivxwRt6OugYIP0YQSvs15jp3fB0GJzQn0VqNqZsnPn8IL
 aYP+4E9Xn/zzL6RlZ0YpcqMFIC5ZwenwocrrzDlXm81ekmLtqaAJ2ge/oyZhlwGN7UR/
 qQt1gl+zYqW3/KTTBFKTA2QmLyjxulfagqEuaKsKCRLVJLGzvsCb44Gv13Ujpbx956eX
 27mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8CYZB9izVHIYYhYgKoKIAX3eB1BT443+lnEKlYC3f9k=;
 b=afnha/Wxz+m46war6PSLpfEUU89IYSlN3Pmmlps498vSrzJsSDfxgGb/0TmZnk0tgt
 hBIFuJLC2G1AA1lIdLfwuILKPvJRW+q6v9s3CTk0TFKXOqvFYkLydUXkCMXdjhUeJGr5
 pJKbJ7wNXELjzH7VDv5lxy/BHtanKYjNKHgDjjqRJvQd67ayypQ3x2edaeRZrW0mDnGf
 kwVUUGK3sjd9Lt2NQA1uvm7ydihhBFbcR/GAswdCxgRVPjTPX70vc0YX6uZVZQOI+Lzf
 myR22gRvlLwr7/2VCmDsB9eUv2zdfLSZ7atlPbBB/CzFPTLOzKhzMCvV2njY6+BMoGmJ
 n7BQ==
X-Gm-Message-State: AOAM533EO+MvVlKbuU2VqZltPYgShPSbEtFLjmBw1h9TDDXTgwijoKIF
 xyJLAhUUY/q2znL5D4739tAgogRNubZX1dLF
X-Google-Smtp-Source: ABdhPJzuNvqyyXIJyC2Lh+wTX9uHDdkqftUhlhsc+pRhzrswO3enGW6Xo/SclmNbJHsfG4Mnha4uYw==
X-Received: by 2002:a17:907:77ca:: with SMTP id
 kz10mr38699947ejc.22.1626881225830; 
 Wed, 21 Jul 2021 08:27:05 -0700 (PDT)
Received: from localhost.localdomain ([151.68.51.173])
 by smtp.gmail.com with ESMTPSA id r27sm10253217edb.66.2021.07.21.08.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 08:27:05 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/i386: Added consistency checks for CR4
Date: Wed, 21 Jul 2021 17:26:50 +0200
Message-Id: <20210721152651.14683-2-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721152651.14683-1-laramglazier@gmail.com>
References: <20210721152651.14683-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=laramglazier@gmail.com; helo=mail-ej1-x62a.google.com
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

All MBZ bits in CR4 must be zero. (APM2 15.5)
Added reserved bitmask and added checks in both
helper_vmrun and helper_write_crN.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.h                    | 31 ++++++++++++++++++++++++++++
 target/i386/tcg/sysemu/misc_helper.c |  3 +++
 target/i386/tcg/sysemu/svm_helper.c  |  9 +++++---
 3 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0b3057bdb6..a596e967f7 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -240,6 +240,7 @@ typedef enum X86Seg {
 #define CR4_OSFXSR_SHIFT 9
 #define CR4_OSFXSR_MASK (1U << CR4_OSFXSR_SHIFT)
 #define CR4_OSXMMEXCPT_MASK  (1U << 10)
+#define CR4_UMIP_MASK   (1U << 11)
 #define CR4_LA57_MASK   (1U << 12)
 #define CR4_VMXE_MASK   (1U << 13)
 #define CR4_SMXE_MASK   (1U << 14)
@@ -251,6 +252,36 @@ typedef enum X86Seg {
 #define CR4_PKE_MASK   (1U << 22)
 #define CR4_PKS_MASK   (1U << 24)
 
+#define CR4_RESERVED_MASK \
+(~(target_ulong)(CR4_VME_MASK | CR4_PVI_MASK | CR4_TSD_MASK \
+                | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
+                | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
+                | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
+                | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
+                | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK | CR4_PKS_MASK))
+
+#define cr4_reserved_bits(env) \
+({ \
+    uint64_t __reserved_bits = CR4_RESERVED_MASK; \
+    if (!env->features[FEAT_XSAVE]) \
+        __reserved_bits |= CR4_OSXSAVE_MASK; \
+    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SMEP)) \
+        __reserved_bits |= CR4_SMEP_MASK; \
+    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SMAP)) \
+        __reserved_bits |= CR4_SMAP_MASK; \
+    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_FSGSBASE)) \
+        __reserved_bits |= CR4_FSGSBASE_MASK; \
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_PKU)) \
+        __reserved_bits |= CR4_PKE_MASK; \
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_LA57)) \
+        __reserved_bits |= CR4_LA57_MASK; \
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_UMIP)) \
+        __reserved_bits |= CR4_UMIP_MASK; \
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_PKS)) \
+        __reserved_bits |= CR4_PKS_MASK; \
+    __reserved_bits; \
+})
+
 #define DR6_BD          (1 << 13)
 #define DR6_BS          (1 << 14)
 #define DR6_BT          (1 << 15)
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index db0d8a9d79..a2af2c9bba 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -99,6 +99,9 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
         cpu_x86_update_cr3(env, t0);
         break;
     case 4:
+        if (t0 & cr4_reserved_bits(env)) {
+            cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+        }
         if (((t0 ^ env->cr[4]) & CR4_LA57_MASK) &&
             (env->hflags & HF_CS64_MASK)) {
             raise_exception_ra(env, EXCP0D_GPF, GETPC());
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index b6df36d4e5..37dbe8e434 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -111,6 +111,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     uint32_t int_ctl;
     uint32_t asid;
     uint64_t new_cr0;
+    uint64_t new_cr4;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMRUN, 0, GETPC());
 
@@ -251,14 +252,16 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     if ((new_cr0 & CR0_NW_MASK) && !(new_cr0 & CR0_CD_MASK)) {
         cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
     }
+    new_cr4 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr4));
+    if (new_cr4 & cr4_reserved_bits(env)) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
     /* clear exit_info_2 so we behave like the real hardware */
     x86_stq_phys(cs,
              env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2), 0);
 
     cpu_x86_update_cr0(env, new_cr0);
-    cpu_x86_update_cr4(env, x86_ldq_phys(cs,
-                                     env->vm_vmcb + offsetof(struct vmcb,
-                                                             save.cr4)));
+    cpu_x86_update_cr4(env, new_cr4);
     cpu_x86_update_cr3(env, x86_ldq_phys(cs,
                                      env->vm_vmcb + offsetof(struct vmcb,
                                                              save.cr3)));
-- 
2.25.1



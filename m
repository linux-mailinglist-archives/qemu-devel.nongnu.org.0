Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7625F3B4579
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:22:42 +0200 (CEST)
Received: from localhost ([::1]:37846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmjB-000355-Fc
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmf7-0002r6-FU
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:29 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmf5-00037g-72
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:29 -0400
Received: by mail-ej1-x62a.google.com with SMTP id hz1so15401287ejc.1
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nv0ACy0+Eum8qUTT1PI/Lvp1yQqi/xZRGLjc430QOSY=;
 b=udDyx2JNrDKXoGqenNS8ya2t4SQNFMP1D1udgDF0T4oLw6duBkcD03szO75sDeQ2nH
 c6oDfjdnVdL0H3asTO2a6MTc4OLoKqajLhgXmjxm2jv85pKI95AJeeGOwUm8AMwg5fJn
 qLM2kyVaYsT/2d0f57iocCLALPqXNOMFoc8HCxsJa5c9+JwKXeCx1pmIgTNp2G6lXFr6
 cQePEEICdn4DewLTBtICLm1LMQJXV6bUcCvsIN4lf5JRs/U+vtywCrKCkC/vuOJGP6ZK
 96cpJxVcmq5eh5vUj3iWHoyGp0TwrzuSZzkNBRh/wYGRYtSU27IN5t6/Otu1dJuYd6rx
 tRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nv0ACy0+Eum8qUTT1PI/Lvp1yQqi/xZRGLjc430QOSY=;
 b=hNDrzzsSOayE0DMWZ7TXyyNOYKuQAjx1n25NjTnoFQvK25KrPo3JhqompEW6Na95LE
 Xf1VohWYLiLmMIVh0nMyRT22QGr2K6qx+SAnogX8/LQYpW1HRSmEtonAJJoPyHDm59lc
 4QTKDbD2kJ6+tqnAKZwXpuwfIaN8IzJWNK5t/HvBuERfQFNdMBiOd0yXSyERKYPXgNph
 n+cAz6ty7aFAeqMcNBtWSStfamJNNOWoH+Yi32Ggr/NpFwPb89aKDbczSdGEx3GM1XLe
 f6z5Fp3m8MwKNdtMEzZdrcLr9t/oxGvx+iorevbKq3xE0fL6XUPL3/W1YJQZA3OwyNpU
 d08g==
X-Gm-Message-State: AOAM532Vo53pmdKJcQ8EJs9vB2m13/f3RMiPxz1OPkk8+aEbzfa3WGiy
 Jl0Byu6WUJNRGLy3aXMNb358+s6Yr/A=
X-Google-Smtp-Source: ABdhPJwnlzj1zzk2IBZS61ROvKTe3YW+wC2dN9e5qa/ju8Ae6jgVDRKU2aYO7086B5cqFauaYUtGGg==
X-Received: by 2002:a17:906:dbd8:: with SMTP id
 yc24mr11178881ejb.55.1624630704926; 
 Fri, 25 Jun 2021 07:18:24 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/28] target/i386: kvm: add support for TSC scaling
Date: Fri, 25 Jun 2021 16:17:55 +0200
Message-Id: <20210625141822.1368639-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Linux 5.14 will add support for nested TSC scaling.  Add the
corresponding feature in QEMU; to keep support for existing kernels,
do not add it to any processor yet.

The handling of the VMCS enumeration MSR is ugly; once we have more than
one case, we may want to add a table to check VMX features against.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c     |  2 +-
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c | 12 ++++++++----
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a9fe1662d3..d8f3ab3192 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1031,7 +1031,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "vmx-invpcid-exit", "vmx-vmfunc", "vmx-shadow-vmcs", "vmx-encls-exit",
             "vmx-rdseed-exit", "vmx-pml", NULL, NULL,
             "vmx-xsaves", NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, "vmx-tsc-scaling", NULL, NULL,
             NULL, NULL, NULL, NULL,
         },
         .msr = {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1e11071d81..f7fa5870b1 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -972,6 +972,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define VMX_SECONDARY_EXEC_RDSEED_EXITING           0x00010000
 #define VMX_SECONDARY_EXEC_ENABLE_PML               0x00020000
 #define VMX_SECONDARY_EXEC_XSAVES                   0x00100000
+#define VMX_SECONDARY_EXEC_TSC_SCALING              0x02000000
 
 #define VMX_PIN_BASED_EXT_INTR_MASK                 0x00000001
 #define VMX_PIN_BASED_NMI_EXITING                   0x00000008
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ad950c3c27..04e4ec063f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2700,8 +2700,6 @@ static uint64_t make_vmx_msr_value(uint32_t index, uint32_t features)
     return must_be_one | (((uint64_t)can_be_one) << 32);
 }
 
-#define VMCS12_MAX_FIELD_INDEX (0x17)
-
 static void kvm_msr_entry_add_vmx(X86CPU *cpu, FeatureWordArray f)
 {
     uint64_t kvm_vmx_basic =
@@ -2791,8 +2789,14 @@ static void kvm_msr_entry_add_vmx(X86CPU *cpu, FeatureWordArray f)
                       CR0_PE_MASK | CR0_PG_MASK | CR0_NE_MASK);
     kvm_msr_entry_add(cpu, MSR_IA32_VMX_CR4_FIXED0,
                       CR4_VMXE_MASK);
-    kvm_msr_entry_add(cpu, MSR_IA32_VMX_VMCS_ENUM,
-                      VMCS12_MAX_FIELD_INDEX << 1);
+
+    if (f[FEAT_VMX_SECONDARY_CTLS] & VMX_SECONDARY_EXEC_TSC_SCALING) {
+        /* TSC multiplier (0x2032).  */
+        kvm_msr_entry_add(cpu, MSR_IA32_VMX_VMCS_ENUM, 0x32);
+    } else {
+        /* Preemption timer (0x482E).  */
+        kvm_msr_entry_add(cpu, MSR_IA32_VMX_VMCS_ENUM, 0x2E);
+    }
 }
 
 static void kvm_msr_entry_add_perf(X86CPU *cpu, FeatureWordArray f)
-- 
2.31.1




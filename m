Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A2C3AF17B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:11:19 +0200 (CEST)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNSA-0001t2-3F
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lvMrg-0005rD-9v
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:33:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lvMrd-0001wo-Gl
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:33:36 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so3865759wms.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zV/KPY9bZ3pal6xpYD4CK8dy8f77ddc3RvulggFn6OY=;
 b=gXaFwTQGkbFzcIx5MPwp+kVvvFRGKrHC1/+WSVvI9IebitXxROMHGMFFn/bFFreVj8
 FusjP3WVUIU5k50IUwbpziWDprV0dJsJ0BAkZi+rHzSB/eAvXftvQ7n8hA+9v3Vex4sh
 FcbBhQGsYMlHiI1/TfKyjRuKLKRv2jg0RGmDlaQ0Bf1klYyIz3LsW05+H1KbBqPUwybh
 pCOeKqMwva/n+M6PxvSg0hJCfN/r2rqzAR/fR2h+drZEP3VTt3dTVhCE11Nhw+5BilY/
 2itKoRYJMUQa0AJbHjjEA1Wzq3qNPEThHnfDgy5yUnMME8Mp09CxquKf3DCADHfghGcO
 ujsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zV/KPY9bZ3pal6xpYD4CK8dy8f77ddc3RvulggFn6OY=;
 b=Ff2TBxN246VhlVaQmpKxm7a825Z44z/guDqHzpWMyxZg0rUPLFXfBQz3u4l4bsFunW
 RRkkZXRqLZ40UGEjxRbrGnML7Kfo0maMkq6usq1Ifxg/IjBkkuEwleXoHC0V1ZUbv04U
 Egere61CDOSHN0nhUpsNNEJJnySMTnBrItGSEqUxj4HsN3dRpflriECFqnQPapwPAycL
 4HmDDur6BLH6sH6T/sMBlHjocQsjDS5M6MArduNH05vPTpEjlzfc3z1PQAxacICptuI7
 FXj66JJrVfdgVYwtlOPuSj2m9QMBYsuqlz+FKJaI/jvF0rPMN5YmIW2yl81so5j8rEF5
 1+Sg==
X-Gm-Message-State: AOAM531kCH/rjCKsb/oMUDuBuQb0YclA1WIziL6JHeMP7/7jubODN9ZI
 n0kddoVX4HZNi3BjkwGTg8A2lqFEYEg=
X-Google-Smtp-Source: ABdhPJwQTcJY5IpkVomwzpZqVwXxMUiJhu7uIgoBnXHCJwZHFHNVyiOlT+i7Z+Hg+81u2J2INECp7Q==
X-Received: by 2002:a05:600c:218c:: with SMTP id
 e12mr28469240wme.92.1624293208819; 
 Mon, 21 Jun 2021 09:33:28 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 p5sm19722570wrd.25.2021.06.21.09.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:33:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: kvm: add support for TSC scaling
Date: Mon, 21 Jun 2021 18:33:27 +0200
Message-Id: <20210621163327.1141734-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: vkuznets@redhat.com
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
index c676ee8b38..a136171df6 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2675,8 +2675,6 @@ static uint64_t make_vmx_msr_value(uint32_t index, uint32_t features)
     return must_be_one | (((uint64_t)can_be_one) << 32);
 }
 
-#define VMCS12_MAX_FIELD_INDEX (0x17)
-
 static void kvm_msr_entry_add_vmx(X86CPU *cpu, FeatureWordArray f)
 {
     uint64_t kvm_vmx_basic =
@@ -2766,8 +2764,14 @@ static void kvm_msr_entry_add_vmx(X86CPU *cpu, FeatureWordArray f)
                       CR0_PE_MASK | CR0_PG_MASK | CR0_NE_MASK);
     kvm_msr_entry_add(cpu, MSR_IA32_VMX_CR4_FIXED0,
                       CR4_VMXE_MASK);
-    kvm_msr_entry_add(cpu, MSR_IA32_VMX_VMCS_ENUM,
-                      VMCS12_MAX_FIELD_INDEX << 1);
+
+    if (f[FEAT_VMX_SECONDARY_CTLS] & VMX_SECONDARY_TSC_SCALING) {
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



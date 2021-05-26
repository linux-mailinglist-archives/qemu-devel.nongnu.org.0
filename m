Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B91391391
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:23:56 +0200 (CEST)
Received: from localhost ([::1]:33794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llplb-0001Zt-H2
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1llpel-0007z9-E7; Wed, 26 May 2021 05:16:51 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1llpeh-0003xW-Vo; Wed, 26 May 2021 05:16:51 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso3285726pjx.1; 
 Wed, 26 May 2021 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sWUNPHdCWDVADUV+8ouwbbVfRasx3YfGoo+cwtihs8Q=;
 b=IhxodMoCHRIprQChOrLHBM3TtRbcE5E2MgGTJwn1YcYSx4DFXqfnFVRpqQ7x/GILeO
 NFNpEA8cix0BYFJtA64+po9Rx4t0YE6GcocoyePQnDtaHmyNCohJnm9bNj3/nvR6xT2b
 wyCyF48Hxy7H41+IjQtVfmrUz9J7LGDgiAjbo5RfeNgF22QGgCrbBqJc5/E+Yxfgsy67
 aG+2jBkV6DlMT6UbICYS13Ui57aG3c+7LmXy+69OcowwNrE99DP6RM3KRmdVgK07e/7K
 8Y0ZU7Px+aV05twRFknDHEeFZknyhFhY2IxyhUX7WUW3ZT9jXZLOpoBLR0N6Hsbcyfyc
 WWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sWUNPHdCWDVADUV+8ouwbbVfRasx3YfGoo+cwtihs8Q=;
 b=BJj/9Hb3TfLrecTfCQfqlseo91l4KCpQ0vLPXmWSrMfJ6ieq1AD5+Ehbnyzk+iYYaa
 1jVS45c2lp9N/gYiQOwr8jeHHCw0Y81yvvqrbtGR2W37vzfs0sWDsXQqxwRjcYPruCr3
 GxtlQ8+D1DVcudgdU5IkwiuIL3GWpxL3ys+cZIRWqJJD2uPdt3VtrlgA36xFeDUfuUFa
 m3ex9/TERRq+E4C7NaJEsIqNzy6nMs5q8JRN4Omkl4yb7SJh+DaBs9dD+mes6fk5Tvsd
 v43jXOlZDJLMYjQJKFWPH2lZrzb8hVoOGUSaa2GKKoTdyoJubTXMBEKpM/rLZ0Cqba1K
 a6tg==
X-Gm-Message-State: AOAM531p2tjg1ICuQzkl5pawRmgCJ1pWzCntivY6Drkf7GT/Rxou7Rxl
 tSSVwq2UsdJtu7hsv5ShZSIA09f5uUR8Ng==
X-Google-Smtp-Source: ABdhPJxNXRX1nXxmxS4NB+NkOerT1gvispAoNKIe+I0qqPnNM/g6zgnUxNL6mQF7VwE7JAUtyj4znA==
X-Received: by 2002:a17:902:c213:b029:f0:bbdf:3852 with SMTP id
 19-20020a170902c213b02900f0bbdf3852mr35104423pll.56.1622020605702; 
 Wed, 26 May 2021 02:16:45 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id h22sm15055171pfn.55.2021.05.26.02.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 02:16:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v1 3/3] target/ppc: Synchronize with KVM's LPCR value when
 creating a vCPU
Date: Wed, 26 May 2021 19:16:26 +1000
Message-Id: <20210526091626.3388262-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210526091626.3388262-1-npiggin@gmail.com>
References: <20210526091626.3388262-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1030.google.com
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Despite the suggestion from the comment, LPCR value set by KVM does not
get propagated to QEMU SPR values. Instead, the KVM LPCR register is set
from the inital QEMU values, of which KVM allows the DPFD, ILE, TC, AIL,
LD fields to be modified. For the most part these get fixed up, but at
least the DPFD value set by KVM gets lost.

Fix this by reading the KVM LPCR when initialising a vCPU and reading
registers. The hack for setting the LPCR LD bit can be removed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_cpu_core.c |  9 ++++++---
 target/ppc/kvm.c        | 34 ++++++++++++++++++++--------------
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 4f316a6f9d..91193b4bba 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -40,9 +40,12 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
 
     lpcr = env->spr[SPR_LPCR];
 
-    /* Set emulated LPCR to not send interrupts to hypervisor. Note that
-     * under KVM, the actual HW LPCR will be set differently by KVM itself,
-     * the settings below ensure proper operations with TCG in absence of
+    /*
+     * Set emulated LPCR to not send interrupts to hypervisor. Note that
+     * under KVM, the actual HW LPCR will be set differently by KVM itself
+     * and that gets loaded by kvm_arch_get_registers and kvm_arch_init_vcpu.
+     *
+     * The LPCR settings below ensure proper operations with TCG in absence of
      * a real hypervisor.
      *
      * Disable Power-saving mode Exit Cause exceptions for the CPU, so
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 104a308abb..ec269e38f8 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -104,6 +104,7 @@ static bool kvmppc_is_pr(KVMState *ks)
     return kvm_vm_check_extension(ks, KVM_CAP_PPC_GET_PVINFO) != 0;
 }
 
+static void kvm_get_one_spr(CPUState *cs, uint64_t id, int spr);
 static int kvm_ppc_register_host_cpu_type(void);
 static void kvmppc_get_cpu_characteristics(KVMState *s);
 static int kvmppc_get_dec_bits(void);
@@ -477,6 +478,16 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return ret;
     }
 
+    /*
+     * As explained in spapr_reset_vcpu, a KVM guest needs to synchronize
+     * to the LPCR value set by KVM.
+     */
+#ifdef TARGET_PPC64
+    kvm_get_one_spr(cs, KVM_REG_PPC_LPCR_64, SPR_LPCR);
+#else
+    kvm_get_one_spr(cs, KVM_REG_PPC_LPCR, SPR_LPCR);
+#endif
+
     switch (cenv->mmu_model) {
     case POWERPC_MMU_BOOKE206:
         /* This target supports access to KVM's guest TLB */
@@ -1307,6 +1318,7 @@ int kvm_arch_get_registers(CPUState *cs)
 
         kvm_get_one_reg(cs, KVM_REG_PPC_TB_OFFSET, &env->tb_env->tb_offset);
         kvm_get_one_spr(cs, KVM_REG_PPC_DPDES, SPR_DPDES);
+        kvm_get_one_spr(cs, KVM_REG_PPC_LPCR_64, SPR_LPCR);
 #endif
     }
 
@@ -2529,24 +2541,18 @@ int kvmppc_get_cap_large_decr(void)
 
 int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
 {
+    CPUPPCState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
     uint64_t lpcr;
 
-    kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
-    /* Do we need to modify the LPCR? */
-    if (!!(lpcr & LPCR_LD) != !!enable) {
-        if (enable) {
-            lpcr |= LPCR_LD;
-        } else {
-            lpcr &= ~LPCR_LD;
-        }
-        kvm_set_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
-        kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
-
-        if (!!(lpcr & LPCR_LD) != !!enable) {
-            return -1;
-        }
+    cpu_synchronize_state(cs);
+    lpcr = env->spr[SPR_LPCR];
+    if (enable) {
+        lpcr |= LPCR_LD;
+    } else {
+        lpcr &= ~LPCR_LD;
     }
+    ppc_store_lpcr(cpu, lpcr);
 
     return 0;
 }
-- 
2.23.0



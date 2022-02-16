Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556444B839B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:07:58 +0100 (CET)
Received: from localhost ([::1]:50138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGI1-0004VY-EV
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:07:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKDyU-0000Tm-Ni; Wed, 16 Feb 2022 01:39:41 -0500
Received: from [2607:f8b0:4864:20::62b] (port=38623
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKDy8-0008Nf-8z; Wed, 16 Feb 2022 01:39:28 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c3so1270445pls.5;
 Tue, 15 Feb 2022 22:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bas72fCMi00RwpfvpngxkerimAj2r+i1dZ9MYckgWOo=;
 b=kn8LM/0Ub0NvMymU5hB1fK9npW+aVcEHTHcbKcJdTEzQpeU0SxAFl7vpn+UEldkyjC
 HKRcNi5hgK/JSD56OT1csRWt+gp4g8vv+mJYy124Bu6kwaX1Hwkngzc43oPWcgmfR/6N
 P6FbADhmlHvRx+Ld0AiVniYIRhQX4eLHKH10hDhZRy74po6ZsTk1JN9VjUFBt5QqX5Tc
 /4T8kgU83YCYlJ8DbJFybOflFL5I54d04wkJul0zO0/POVMk8XgvYQcMRdtxawZQ4oln
 OsZX9mD9Y87om7pmHFFfOngmgrI0z8+YfU0YCINdPJuL4fACnkjbH90WJAQofrT7FZXm
 mJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bas72fCMi00RwpfvpngxkerimAj2r+i1dZ9MYckgWOo=;
 b=jHN4pTrtIh1C8yAh+PuNskEo44o+1AV3L8X3krnDyNLfiJfdvaJbU4ooeksd846bjO
 m9P6JyZ1d9djWzrt4j+K0cHIo6pGbh6pQDOEGhB+10JDgTPFge8D+Fxb6hE/cW2JGZQA
 zSu98Zt8km0srQM/3z23PQpHJn50F0qC+p4h7UFF3WktglRrO8rn6q1HNg+zPSbo+X/9
 +7iBmWAsTj4zT6LYh8Nc2yCAj3DjgptpCbXkY2fQQKsa/cqayc3z7AzfVEhVWdkp75o8
 0N4DaI7gIpegH0WodD3kHx+FL476kKMbOYfwqsrZbCyQl/bG9l9pXhO/PHgmwOLGjU1s
 NO4w==
X-Gm-Message-State: AOAM533owT8QZVfIF6hUL7cWA5Rrr0SNaY/tPZemezc9vpez7N4l5Alk
 Dvd/0Vm/kmt+FNY7zU7G8Lo4knKZFVs=
X-Google-Smtp-Source: ABdhPJyc4EhE59pY8UsmHfeqJW6nvN0VMimP7GbEGtA+t6gzmRRbS/rWnqUZVVs/vC6Yr2Ml+UAu/g==
X-Received: by 2002:a17:90a:d243:b0:1b9:cbac:a775 with SMTP id
 o3-20020a17090ad24300b001b9cbaca775mr140523pjw.196.1644993554192; 
 Tue, 15 Feb 2022 22:39:14 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-241-140-189.static.tpgi.com.au.
 [60.241.140.189])
 by smtp.gmail.com with ESMTPSA id dw20sm18379814pjb.3.2022.02.15.22.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 22:39:13 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 2/3] spapr: Add SPAPR_CAP_AIL_MODE_3 for AIL mode 3 support
 for H_SET_MODE hcall
Date: Wed, 16 Feb 2022 16:39:02 +1000
Message-Id: <20220216063903.1782281-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220216063903.1782281-1-npiggin@gmail.com>
References: <20220216063903.1782281-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The behaviour of the Address Translation Mode on Interrupt resource is
not consistently supported by all CPU versions or all KVM versions:
KVM-HV does not support mode 2, and does not support mode 3 on POWER7 or
early POWER9 processesors. KVM PR only supports mode 0. TCG supports all
modes (0, 2, 3). This leads to inconsistencies in guest behaviour and
could cause problems migrating guests.

This was not noticable for Linux guests for a long time because the
kernel only uses modes 0 and 3, and it used to consider AIL-3 to be
advisory in that it would always keep the AIL-0 vectors around. Recent
Linux guests depend on the AIL mode working as specified in order to
support the SCV facility interrupt. If AIL-3 can not be provided, then
Linux must be given an error so it can disable the SCV facility, rather
than silently failing.

Add the ail-mode-3 capability to specify that AIL-3 is supported. AIL-0
is implied as the baseline, and AIL-2 is no longer supported by spapr.
AIL-2 is not known to be used by any software, but support in TCG could
be restored with an ail-mode-2 capability quite easily if a regression
is reported.

Modify the H_SET_MODE Address Translation Mode on Interrupt resource
handler to check capabilities and correctly return error if not
supported.

A heuristic is added for KVM to determine AIL-3 support before the
introduction of a new KVM CAP, because blanket disabling AIL-3 has too
much performance cost.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Minor cleanups.
- Improve KVM tests to catch the problem POWER9s.
- Use default_caps_with_cpu() to clear the cap for POWER7


 hw/ppc/spapr.c         |  5 +++++
 hw/ppc/spapr_caps.c    | 37 +++++++++++++++++++++++++++++++++++++
 hw/ppc/spapr_hcall.c   | 24 +++++++++++++-----------
 include/hw/ppc/spapr.h |  4 +++-
 target/ppc/kvm.c       | 29 +++++++++++++++++++++++++++++
 target/ppc/kvm_ppc.h   |  6 ++++++
 6 files changed, 93 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3d6ec309dd..fd7eccbdfd 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4606,6 +4606,11 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_ON;
     smc->default_caps.caps[SPAPR_CAP_FWNMI] = SPAPR_CAP_ON;
     smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] = SPAPR_CAP_OFF;
+
+    /* This cap specifies whether the AIL 3 mode for H_SET_RESOURCE is
+     * supported. The default is modified by default_caps_with_cpu().
+     */
+    smc->default_caps.caps[SPAPR_CAP_AIL_MODE_3] = SPAPR_CAP_ON;
     spapr_caps_add_properties(smc);
     smc->irq = &spapr_irq_dual;
     smc->dr_phb_enabled = true;
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index ed7c077a0d..e2412aaa57 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -613,6 +613,33 @@ static void cap_rpt_invalidate_apply(SpaprMachineState *spapr,
     }
 }
 
+static void cap_ail_mode_3_apply(SpaprMachineState *spapr,
+                                     uint8_t val, Error **errp)
+{
+    ERRP_GUARD();
+    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+
+    if (!val) {
+        return;
+    }
+
+    if (tcg_enabled()) {
+	/* AIL-3 is only supported on POWER8 and above CPUs. */
+	if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
+            error_setg(errp, "TCG only supports cap-ail-mode-3 on POWER8 and later CPUs");
+            error_append_hint(errp, "Try appending -machine cap-ail-mode-3=off\n");
+            return;
+        }
+    } else if (kvm_enabled()) {
+        if (!kvmppc_supports_ail_3()) {
+            error_setg(errp, "KVM implementation does not support cap-ail-mode-3");
+            error_append_hint(errp, "Try appending -machine cap-ail-mode-3=off\n");
+            return;
+        }
+    }
+}
+
 SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
     [SPAPR_CAP_HTM] = {
         .name = "htm",
@@ -730,6 +757,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
         .type = "bool",
         .apply = cap_rpt_invalidate_apply,
     },
+    [SPAPR_CAP_AIL_MODE_3] = {
+        .name = "ail-mode-3",
+        .description = "Alternate Interrupt Location (AIL) mode 3 support",
+        .index = SPAPR_CAP_AIL_MODE_3,
+        .get = spapr_cap_get_bool,
+        .set = spapr_cap_set_bool,
+        .type = "bool",
+        .apply = cap_ail_mode_3_apply,
+    },
 };
 
 static SpaprCapabilities default_caps_with_cpu(SpaprMachineState *spapr,
@@ -749,6 +785,7 @@ static SpaprCapabilities default_caps_with_cpu(SpaprMachineState *spapr,
                                0, spapr->max_compat_pvr)) {
         caps.caps[SPAPR_CAP_HTM] = SPAPR_CAP_OFF;
         caps.caps[SPAPR_CAP_CFPC] = SPAPR_CAP_BROKEN;
+        caps.caps[SPAPR_CAP_AIL_MODE_3] = SPAPR_CAP_OFF;
     }
 
     if (!ppc_type_check_compat(cputype, CPU_POWERPC_LOGICAL_2_06_PLUS,
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 222c1b6bbd..fa60505315 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -811,30 +811,32 @@ static target_ulong h_set_mode_resource_le(PowerPCCPU *cpu,
 }
 
 static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
+                                                        SpaprMachineState *spapr,
                                                         target_ulong mflags,
                                                         target_ulong value1,
                                                         target_ulong value2)
 {
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-
-    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
-        return H_P2;
-    }
     if (value1) {
         return H_P3;
     }
+
     if (value2) {
         return H_P4;
     }
 
-    if (mflags == 1) {
-        /* AIL=1 is reserved in POWER8/POWER9/POWER10 */
+    /*
+     * AIL-1 is not architected, and AIL-2 is not supported by QEMU spapr.
+     * It is supported for faithful emulation of bare metal systems, but for
+     * compatibility concerns we leave it out of the pseries machine.
+     */
+    if (mflags != 0 && mflags != 3) {
         return H_UNSUPPORTED_FLAG;
     }
 
-    if (mflags == 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
-        /* AIL=2 is reserved in POWER10 (ISA v3.1) */
-        return H_UNSUPPORTED_FLAG;
+    if (mflags == 3) {
+        if (!spapr_get_cap(spapr, SPAPR_CAP_AIL_MODE_3)) {
+            return H_UNSUPPORTED_FLAG;
+        }
     }
 
     spapr_set_all_lpcrs(mflags << LPCR_AIL_SHIFT, LPCR_AIL);
@@ -853,7 +855,7 @@ static target_ulong h_set_mode(PowerPCCPU *cpu, SpaprMachineState *spapr,
         ret = h_set_mode_resource_le(cpu, spapr, args[0], args[2], args[3]);
         break;
     case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
-        ret = h_set_mode_resource_addr_trans_mode(cpu, args[0],
+        ret = h_set_mode_resource_addr_trans_mode(cpu, spapr, args[0],
                                                   args[2], args[3]);
         break;
     }
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index ee7504b976..edbf3eeed0 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -77,8 +77,10 @@ typedef enum {
 #define SPAPR_CAP_FWNMI                 0x0A
 /* Support H_RPT_INVALIDATE */
 #define SPAPR_CAP_RPT_INVALIDATE        0x0B
+/* Support for AIL modes */
+#define SPAPR_CAP_AIL_MODE_3            0x0C
 /* Num Caps */
-#define SPAPR_CAP_NUM                   (SPAPR_CAP_RPT_INVALIDATE + 1)
+#define SPAPR_CAP_NUM                   (SPAPR_CAP_AIL_MODE_3 + 1)
 
 /*
  * Capability Values
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index dc93b99189..1338c41f8f 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2563,6 +2563,35 @@ int kvmppc_has_cap_rpt_invalidate(void)
     return cap_rpt_invalidate;
 }
 
+bool kvmppc_supports_ail_3(void)
+{
+    PowerPCCPUClass *pcc = kvm_ppc_get_host_cpu_class();
+
+    /*
+     * KVM PR only supports AIL-0
+     */
+    if (kvmppc_is_pr(kvm_state)) {
+        return 0;
+    }
+
+    /*
+     * KVM HV hosts support AIL-3 on POWER8 and above, except for radix
+     * mode on some early POWER9s.
+     */
+    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
+        return 0;
+    }
+
+    /* These tests match the CPU_FTR_P9_RADIX_PREFETCH_BUG flag in Linux */
+    if (((pcc->pvr & 0xffffff00) == CPU_POWERPC_POWER9_DD1) ||
+        ((pcc->pvr & 0xffffff00) == CPU_POWERPC_POWER9_DD20) ||
+        ((pcc->pvr & 0xffffff00) == CPU_POWERPC_POWER9_DD21)) {
+        return 0;
+    }
+
+    return 1;
+}
+
 PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void)
 {
     uint32_t host_pvr = mfpvr();
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index ee9325bf9a..7bba26d1da 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -73,6 +73,7 @@ int kvmppc_set_cap_nested_kvm_hv(int enable);
 int kvmppc_get_cap_large_decr(void);
 int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
 int kvmppc_has_cap_rpt_invalidate(void);
+bool kvmppc_supports_ail_3(void);
 int kvmppc_enable_hwrng(void);
 int kvmppc_put_books_sregs(PowerPCCPU *cpu);
 PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
@@ -393,6 +394,11 @@ static inline int kvmppc_has_cap_rpt_invalidate(void)
     return false;
 }
 
+static inline bool kvmppc_supports_ail_3(void)
+{
+    return false;
+}
+
 static inline int kvmppc_enable_hwrng(void)
 {
     return -1;
-- 
2.23.0



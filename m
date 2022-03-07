Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9544CF257
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:01:39 +0100 (CET)
Received: from localhost ([::1]:51092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7NC-000700-SV
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:01:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nR7Ha-0006Y6-WE; Mon, 07 Mar 2022 01:55:51 -0500
Received: from [2607:f8b0:4864:20::52c] (port=37838
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nR7HY-0007n0-UI; Mon, 07 Mar 2022 01:55:50 -0500
Received: by mail-pg1-x52c.google.com with SMTP id bc27so12804929pgb.4;
 Sun, 06 Mar 2022 22:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x8ZCoo2efyiNDexpOcLRIp3ABlWpDbFRfAphz0mONfA=;
 b=WgToOIU9v0y6SXDS0poekAztT+hxXcTYS5uA28QqCIbPAVhxLttUbykmFEjAfaLij/
 drQcw8KUzZQAjSIJLhDWYGl8exrir4q7ONeMnNDmJEdyhSlusFtdmzhWVfNMqbM1Ke9O
 g/RqOZfqvFnVBzWFspgsVQOgEcXSqQ4Vx9RTwqtZZ47MMCoYerVkWFqCtQOgNVSyu+kt
 cskfyZy9I7avHz/lAoDg++fuYbWjkNPMmTtZoWwQhJSyKyRdZBKSKBgNr5qpN1MRJh+T
 8/s1HTm+VgBD0D5v/l8nECHd+kGPTgNJhw+tJ2YTRurxkl39D+0ZEwQwgpvSMNCQCQ+i
 ys2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8ZCoo2efyiNDexpOcLRIp3ABlWpDbFRfAphz0mONfA=;
 b=nUqql/gpsJq+/4kCWYPXQxUp9f0Rm0l7osWm9cqZkLE2Ihdf6OI4X6BymY8piE/SL4
 eqQdG0oXyGTiQMaINrd6pLRyKysIeIe8OoiYWCEA5miBpx7WmeGzpB3Z+9/qqXNWmjiB
 LhGDkLD78sCGuHN7stq+Koo/63fBcUVylkntMsqgBjLxNLHtkZ0wEnlJ4ZfNk0TLQpms
 MVMUJE8fVgb8V7dh3MoJ0y9AFJXNIlA/Sa5uBPCBurjcGNoKIoQsSHF4rB9ghhO3mjIJ
 DP/NGGGZhA6GYYR4HGc9K8bVAfPMGN130WMbjesolyaEexRNetTG8IP7s0E7xGuDbaNS
 Dkiw==
X-Gm-Message-State: AOAM530DTLmSOAtmVgvbz5KQ5+FfViWidylyXhMGeYmrXzUCCw2mP7vy
 cX9t2wbA/zDBOE+7mt3IcJvyDxxQxA4=
X-Google-Smtp-Source: ABdhPJz1pCzWjzZtNjOw39Cs1AGJre2KebZxW1qdXsPxH1aervyrZTKz/QT0+ssJ/Y0RvOmpf0urUA==
X-Received: by 2002:a63:471f:0:b0:373:9b10:886e with SMTP id
 u31-20020a63471f000000b003739b10886emr8553273pga.307.1646636147203; 
 Sun, 06 Mar 2022 22:55:47 -0800 (PST)
Received: from bobo.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a637e41000000b003804d0e2c9esm1902477pgn.35.2022.03.06.22.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 22:55:47 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v3 4/4] spapr: Add SPAPR_CAP_AIL_MODE_3 for AIL mode 3 support
 for H_SET_MODE hcall
Date: Mon,  7 Mar 2022 16:55:27 +1000
Message-Id: <20220307065527.156132-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220307065527.156132-1-npiggin@gmail.com>
References: <20220307065527.156132-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
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

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr.c         |  5 +++++
 hw/ppc/spapr_caps.c    | 37 +++++++++++++++++++++++++++++++++++++
 hw/ppc/spapr_hcall.c   | 24 +++++++++++++-----------
 include/hw/ppc/spapr.h |  4 +++-
 target/ppc/kvm.c       | 32 ++++++++++++++++++++++++++++++++
 target/ppc/kvm_ppc.h   |  6 ++++++
 6 files changed, 96 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 69b0a6f6d6..6789c8a38d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4641,6 +4641,11 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
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
index 655ab856a0..fe9a04b638 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -614,6 +614,33 @@ static void cap_rpt_invalidate_apply(SpaprMachineState *spapr,
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
+        /* AIL-3 is only supported on POWER8 and above CPUs. */
+        if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
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
@@ -731,6 +758,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
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
@@ -750,6 +786,7 @@ static SpaprCapabilities default_caps_with_cpu(SpaprMachineState *spapr,
                                0, spapr->max_compat_pvr)) {
         caps.caps[SPAPR_CAP_HTM] = SPAPR_CAP_OFF;
         caps.caps[SPAPR_CAP_CFPC] = SPAPR_CAP_BROKEN;
+        caps.caps[SPAPR_CAP_AIL_MODE_3] = SPAPR_CAP_OFF;
     }
 
     if (!ppc_type_check_compat(cputype, CPU_POWERPC_LOGICAL_2_06_PLUS,
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f008290787..e183892287 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -812,30 +812,32 @@ static target_ulong h_set_mode_resource_le(PowerPCCPU *cpu,
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
@@ -854,7 +856,7 @@ static target_ulong h_set_mode(PowerPCCPU *cpu, SpaprMachineState *spapr,
         ret = h_set_mode_resource_le(cpu, spapr, args[0], args[2], args[3]);
         break;
     case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
-        ret = h_set_mode_resource_addr_trans_mode(cpu, args[0],
+        ret = h_set_mode_resource_addr_trans_mode(cpu, spapr, args[0],
                                                   args[2], args[3]);
         break;
     }
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index f5c33dcc86..7c090d54b0 100644
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
index dc93b99189..e984474608 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2563,6 +2563,38 @@ int kvmppc_has_cap_rpt_invalidate(void)
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
+        return false;
+    }
+
+    /*
+     * KVM HV hosts support AIL-3 on POWER8 and above, except for radix
+     * mode on some early POWER9s.
+     */
+    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
+        return false;
+    }
+
+    /*
+     * These tests match the CPU_FTR_P9_RADIX_PREFETCH_BUG flag in Linux.
+     * DD2.0 and 2.1 has it, DD2.2 and 2.3 does not, but we have no 2.1 or
+     * 2.3 CPU model.
+     */
+    if (((pcc->pvr & 0xffff0fff) == CPU_POWERPC_POWER9_DD1) ||
+        ((pcc->pvr & 0xffff0fff) == CPU_POWERPC_POWER9_DD20)) {
+        return false;
+    }
+
+    return true;
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



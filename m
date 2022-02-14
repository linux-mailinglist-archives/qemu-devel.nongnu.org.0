Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C33A4B4DFE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 12:23:35 +0100 (CET)
Received: from localhost ([::1]:43324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJZS9-0005vx-Ov
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 06:23:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJZN0-000379-9P; Mon, 14 Feb 2022 06:18:17 -0500
Received: from [2607:f8b0:4864:20::62c] (port=34355
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJZMw-0007Cy-FV; Mon, 14 Feb 2022 06:18:13 -0500
Received: by mail-pl1-x62c.google.com with SMTP id 10so10271175plj.1;
 Mon, 14 Feb 2022 03:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9l0McjgxfXzRCVnZMbrlUtPARp3K3UBbuSlm1EU+SB4=;
 b=QWj1ycPeam+a/oMuhHWyXmMt8G4mPN9CWAQAWX51E13HF/Esp1Zjy6tityKcNC+Jyj
 zTmFWFRGQqcLfCzpK7F3rHJpYl8smTI+llFj435QLsSPjUgoUvlFgMhRsWZe9VDTMy9u
 q9rg35WfeaLihoNL4RHpwyPWSKCqtcO4NiTtmKuFmfKm1TroZJbU6brwUmfpD/VVesJd
 l01cLF3k9ixWurCaKuLk8SplTtRXzUtZT9eMIFYT1rozNFKR6QZAzjuQkTc1dQeVWzPo
 bEnBfGHDeDTazwcG/d+sS9TryqRJYZqsaRBCuH+WwR5vv0a7NZLGeKbSmcRIrLvrPHk1
 GFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9l0McjgxfXzRCVnZMbrlUtPARp3K3UBbuSlm1EU+SB4=;
 b=vkbWgF5e0D381B5p/ceeT4a7JS0s3EDGPKbmg6XkEG8fsaXHbWeCF5xX77rmj6lihz
 MwbFRmltNBT5idsJ2xmYMx4gKPzbn3xfq1Jr4n4fukwQnZYfqb3rcd31IBu1bZMr0Qxo
 XuD8PpA7YuGqrBb9C0Qq70Xg2bcWLaFq+d6pIDpBJhOJybzl1xOdCJkqhjID5bYHygLe
 aFejkPsH8wMfBFprTTnmHacwA5VxuGDMT1Av+zFduwbzcFdqF96EUUGa5lCuZuLWjx8W
 UKHHsbWzL+DnoSo8VCM405wEPPKjavay/iOn19hUnwW1fEcA1ce2/LbVsQOt66hRp6mm
 I8Tg==
X-Gm-Message-State: AOAM5303/nIglRtEkiklO5+DZwzyN5GgDKdSTjLaapdMjXybk2ZSdHcB
 MZzytI/A5jctV4Mmz1CYAVe/+M+kfns=
X-Google-Smtp-Source: ABdhPJyHZPGiDsDmmd2qSQM0/61w0g7oIgYBIFwcp6Uka37fQk9sJFrIlU/cQeHwjDiOsSWy1VK5sA==
X-Received: by 2002:a17:902:e844:: with SMTP id
 t4mr8399427plg.22.1644837487210; 
 Mon, 14 Feb 2022 03:18:07 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-33-251-132.static.tpgi.com.au.
 [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id ch19sm13920361pjb.19.2022.02.14.03.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 03:18:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 1/2] spapr: Add SPAPR_CAP_AIL_MODE_3 for AIL mode 3 support
 for H_SET_MODE hcall
Date: Mon, 14 Feb 2022 21:17:48 +1000
Message-Id: <20220214111749.1542196-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The behaviour of the Address Translation Mode on Interrupt resource is
not consistently supported by all CPU versions or all KVM versions. In
particular KVM HV only supports mode 0 on POWER7 processors and some
early POWER9 processors, and does not support mode 2 anywhere. KVM PR
only supports mode 0. TCG supports all modes (0, 2, 3).

This leads to inconsistencies in guest behaviour and could cause
problems migrating guests. This was not noticable for Linux guests for a
long time because the kernel only uses modes 0 and 3, and it used to
consider AIL-3 to be advisory in that it would always keep the AIL-0
vectors around. KVM for a long time would not always honor the AIL mode,
contrary to architecture.

Recent Linux guests depend on the AIL mode working as specified in order
to support the SCV facility interrupt. If AIL-3 can not be provided,
then Linux must be given an error so it can disable the SCV facility,
rather than silently failing.

Add the ail-mode-3 capability to specify that AIL-3 is supported. AIL-0
is implied as the baseline. AIL-2 is no longer supported by spapr. It
is not known to be used by any software, but support in TCG could be
restored with an ail-mode-2 capability quite easily if a regression is
reported.

Modify the H_SET_MODE Address Translation Mode on Interrupt resource
handler to check capabilities and correctly return error if not
supported.

A heuristic is added for KVM to determine AIL-3 support before the
introduction of a new KVM CAP.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since the RFC, I made this a single mode cap for ail-3, suggested
by David. Also split out the KVM CAP into patch 2 because that is
not ready for merge yet (this patch can go in ahead of it).

Thanks,
Nick

 hw/ppc/spapr.c         |  6 ++++++
 hw/ppc/spapr_caps.c    | 23 +++++++++++++++++++++++
 hw/ppc/spapr_hcall.c   | 23 +++++++++++++----------
 include/hw/ppc/spapr.h |  4 +++-
 target/ppc/kvm.c       | 23 +++++++++++++++++++++++
 target/ppc/kvm_ppc.h   |  6 ++++++
 6 files changed, 74 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3d6ec309dd..15a02d3e78 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4606,6 +4606,12 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_ON;
     smc->default_caps.caps[SPAPR_CAP_FWNMI] = SPAPR_CAP_ON;
     smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] = SPAPR_CAP_OFF;
+
+    /* This cap specifies whether the AIL 3 mode for H_SET_RESOURCE is
+     * supported. Default to true, (PR KVM, POWER7 and earlier, and KVM on
+     * some early POWER9s only support 0).
+     */
+    smc->default_caps.caps[SPAPR_CAP_AIL_MODE_3] = SPAPR_CAP_ON;
     spapr_caps_add_properties(smc);
     smc->irq = &spapr_irq_dual;
     smc->dr_phb_enabled = true;
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index ed7c077a0d..5fd4a53c33 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -613,6 +613,20 @@ static void cap_rpt_invalidate_apply(SpaprMachineState *spapr,
     }
 }
 
+static void cap_ail_mode_3_apply(SpaprMachineState *spapr,
+                                     uint8_t val, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (kvm_enabled()) {
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
@@ -730,6 +744,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
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
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 222c1b6bbd..5dec056796 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -811,32 +811,35 @@ static target_ulong h_set_mode_resource_le(PowerPCCPU *cpu,
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
+    /* AIL-1 is not architected, and AIL-2 is not supported by QEMU. */
+    if (mflags == 1 || mflags == 2) {
         return H_UNSUPPORTED_FLAG;
     }
 
-    if (mflags == 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
-        /* AIL=2 is reserved in POWER10 (ISA v3.1) */
+    /* Only 0 and 3 are possible */
+    if (mflags != 0 && mflags != 3) {
         return H_UNSUPPORTED_FLAG;
     }
 
+    if (mflags == 3) {
+        if (!spapr_get_cap(spapr, SPAPR_CAP_AIL_MODE_3)) {
+            return H_UNSUPPORTED_FLAG;
+        }
+    }
+
     spapr_set_all_lpcrs(mflags << LPCR_AIL_SHIFT, LPCR_AIL);
 
     return H_SUCCESS;
@@ -853,7 +856,7 @@ static target_ulong h_set_mode(PowerPCCPU *cpu, SpaprMachineState *spapr,
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
index dc93b99189..128bc530d4 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2563,6 +2563,29 @@ int kvmppc_has_cap_rpt_invalidate(void)
     return cap_rpt_invalidate;
 }
 
+int kvmppc_supports_ail_3(void)
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
+     * mode on some early POWER9s, but it's not clear how to cover those
+     * without disabling the feature for many.
+     */
+    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
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
index ee9325bf9a..d9d1c54955 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -73,6 +73,7 @@ int kvmppc_set_cap_nested_kvm_hv(int enable);
 int kvmppc_get_cap_large_decr(void);
 int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
 int kvmppc_has_cap_rpt_invalidate(void);
+int kvmppc_supports_ail_3(void);
 int kvmppc_enable_hwrng(void);
 int kvmppc_put_books_sregs(PowerPCCPU *cpu);
 PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
@@ -393,6 +394,11 @@ static inline int kvmppc_has_cap_rpt_invalidate(void)
     return false;
 }
 
+static inline int kvmppc_supports_ail_3(void)
+{
+    return false;
+}
+
 static inline int kvmppc_enable_hwrng(void)
 {
     return -1;
-- 
2.23.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8D94B4DFF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 12:24:02 +0100 (CET)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJZSb-0006eH-Gx
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 06:24:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJZN2-00037J-JK; Mon, 14 Feb 2022 06:18:17 -0500
Received: from [2607:f8b0:4864:20::1030] (port=56042
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJZMz-0007DR-8M; Mon, 14 Feb 2022 06:18:15 -0500
Received: by mail-pj1-x1030.google.com with SMTP id om7so14200497pjb.5;
 Mon, 14 Feb 2022 03:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dz1hgT/pGU5Wt693fA80/XHMv18aIW+uTP4FdCJZ22A=;
 b=cgU9qI3DRnk+mpOZpR6R5+oLRsxMrkPx9wWjN29p95Ha0nR6XEfIDPG4nqw3AL561B
 1Oq0zS0zwZP3Wc1rHEOUeX3emUB/tyxHXyOLkwMbGR9FOfLRa/Yh0KkdOs2KW+iVdPFB
 DuitySxXYqfvnslfnjGYAavexpnzssikUFjcTwwYKUqlY68aDHW/wbD4t5MmMA86/oZ9
 8GQs3eLbkQZo/zO8Pj79rFHDYKHD5mT+XbwjVi6LDp2bsfURzEwhxC3uCDysxX2SNzUK
 rFbq7qQViY8gB35sqKbHnilyr4r0zQ1+mZswjr7cs3mtMmv02YqicW9aSMltKOCi0Ctf
 hubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dz1hgT/pGU5Wt693fA80/XHMv18aIW+uTP4FdCJZ22A=;
 b=vdDDcw3M5LZrzTEPBwQRIvNZv2Y8GWtLosZKD9OjwbLo1uLEFULHo/ZwoKgFu+akUH
 ZJzU/GJBEJ9f492RP6tsF1Y5oAldprGS15wvMhxiwhXVTRkI6p28pNtaAvYlXGjFr5Sb
 XTN09awdZm34StW3ejKKiCGRxpNtUvrfPF8NrOjV0cqs/egWDsNtEHW+hBBO/heyL4/9
 +4v4/L6egPze6AKdAXEJtcQQJ4D/OmYYAb48Cb4RyDKsqjUhtma2jS97z5ETxoQmgHg3
 F06d/p0z997mB5Wrgan5RNLijG3loT1/fkl4vjssXWg8x/mJlZzSn+gEQIvm/p3lcEad
 hS1g==
X-Gm-Message-State: AOAM533uPDfZHCO+vOxPd3UBuSkjeju1VNqYjOJ2EFMfYaJC88G3PeTn
 BIU1tK74jeX184BBHwGawh9gCoj3tyY=
X-Google-Smtp-Source: ABdhPJw0yWPVko0lEslQaM8JK4adqYHCZP4AyldD5rib8f5q9J8KxKh+SRciOVDqcnhoN8qirY5w8Q==
X-Received: by 2002:a17:902:6502:: with SMTP id
 b2mr13558144plk.43.1644837490575; 
 Mon, 14 Feb 2022 03:18:10 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-33-251-132.static.tpgi.com.au.
 [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id ch19sm13920361pjb.19.2022.02.14.03.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 03:18:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 2/2] target/ppc/kvm: Use KVM_CAP_PPC_AIL_MODE_3 to determine
 cap-ail-mode-3 support
Date: Mon, 14 Feb 2022 21:17:49 +1000
Message-Id: <20220214111749.1542196-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220214111749.1542196-1-npiggin@gmail.com>
References: <20220214111749.1542196-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1030.google.com
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

Use KVM_CAP_PPC_AIL_MODE_3 to determine cap-ail-mode-3 support for KVM
guests. Keep the fallback heuristic for KVM hosts that pre-date this
CAP.

This is only proposed the KVM CAP has not yet been allocated. I will
ask to merge the new KVM cap when there are no objections on the QEMU
side.

not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_caps.c       |  2 +-
 linux-headers/linux/kvm.h |  1 +
 target/ppc/kvm.c          | 18 +++++++++++++++++-
 target/ppc/kvm_ppc.h      |  4 ++--
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 5fd4a53c33..5cc80776d0 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -619,7 +619,7 @@ static void cap_ail_mode_3_apply(SpaprMachineState *spapr,
     ERRP_GUARD();
 
     if (kvm_enabled()) {
-        if (!kvmppc_supports_ail_3()) {
+        if (!kvmppc_has_cap_ail_3()) {
             error_setg(errp, "KVM implementation does not support cap-ail-mode-3");
             error_append_hint(errp, "Try appending -machine cap-ail-mode-3=off\n");
             return;
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 02c5e7b7bb..d91f578200 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1130,6 +1130,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_BINARY_STATS_FD 203
 #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
 #define KVM_CAP_ARM_MTE 205
+#define KVM_CAP_PPC_AIL_MODE_3 210
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 128bc530d4..d0d0bdaac4 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
 static int cap_large_decr;
 static int cap_fwnmi;
 static int cap_rpt_invalidate;
+static int cap_ail_mode_3;
 
 static uint32_t debug_inst_opcode;
 
@@ -154,6 +155,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     }
 
     cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
+    cap_ail_mode_3 = kvm_vm_check_extension(s, KVM_CAP_PPC_AIL_MODE_3);
     kvm_ppc_register_host_cpu_type();
 
     return 0;
@@ -2563,10 +2565,24 @@ int kvmppc_has_cap_rpt_invalidate(void)
     return cap_rpt_invalidate;
 }
 
-int kvmppc_supports_ail_3(void)
+int kvmppc_has_cap_ail_3(void)
 {
     PowerPCCPUClass *pcc = kvm_ppc_get_host_cpu_class();
 
+    if (cap_ail_mode_3) {
+        return 1;
+    }
+
+    if (kvm_ioctl(kvm_state, KVM_CHECK_EXTENSION, KVM_CAP_PPC_AIL_MODE_3) == 0) {
+        return 0;
+    }
+
+    /*
+     * For KVM hosts that pre-date this cap, special-case the test because
+     * the performance cost for disabling the feature unconditionally is
+     * prohibitive.
+     */
+
     /*
      * KVM PR only supports AIL-0
      */
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index d9d1c54955..efafa67b83 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -73,7 +73,7 @@ int kvmppc_set_cap_nested_kvm_hv(int enable);
 int kvmppc_get_cap_large_decr(void);
 int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
 int kvmppc_has_cap_rpt_invalidate(void);
-int kvmppc_supports_ail_3(void);
+int kvmppc_has_cap_ail_3(void);
 int kvmppc_enable_hwrng(void);
 int kvmppc_put_books_sregs(PowerPCCPU *cpu);
 PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
@@ -394,7 +394,7 @@ static inline int kvmppc_has_cap_rpt_invalidate(void)
     return false;
 }
 
-static inline int kvmppc_supports_ail_3(void)
+static inline int kvmppc_has_cap_ail_3(void)
 {
     return false;
 }
-- 
2.23.0



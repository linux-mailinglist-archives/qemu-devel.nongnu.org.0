Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30836388127
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:14:12 +0200 (CEST)
Received: from localhost ([::1]:59240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj66V-0003gq-7p
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64H-0008Mo-5p
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:53 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64E-00060d-8w
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:52 -0400
Received: by mail-oi1-x235.google.com with SMTP id w127so7139950oig.12
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BKH8RkMUVg0BQHkEeqxp4YAUN+HZAVJ9V/XbNB3bw2s=;
 b=bKZiMZqHOp5rBo5K2mqCuLd4Yh/JrX/x30gTWb/0Rw++wtg7q5MaE+Qv6zOMSC38TQ
 vdqqdAg7/R7PC1MX5FNbmsoXSfAxl4hSeGviaPPR3ZjyLIes6+3kZqMxglY98/v1gR19
 /Q9ANJaSriIj4lWD+K2rdJNAXmt570ZVdkwOh77ZeHUnDFIto4HeSxHlOFSkPHoAN2n4
 WYVgo3S3R8tRodRQL8H0CT0relzorDcuYT+TfLiWSFStKgwewsy3NR6UctSG/BnRisaT
 ++PLhTawb7Q9YGA+kOfwVkaB34gLLPvrYvoFMbUhwU97qwMK8RIwXJUyq+fZj2YQ21pw
 Wvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BKH8RkMUVg0BQHkEeqxp4YAUN+HZAVJ9V/XbNB3bw2s=;
 b=RIRbIIc+4u0pPjiHk9dQFIyZKySTYfM8Z2/U3MxEWu2DDTjHZWQqpg98nXyMKOmi4n
 GvjWHcAdTcrAd3PYYLOiNA0siAlGRLW5uqvefveUUapddfPwHIoIBxm6niwde15/Wy72
 rChdKFCpn80k/E9uDUdilmQOfqEDMAg9HIkHWfuppahfd/ojmKEADSNzT5Y99oCfRKJb
 d0EwKuBKiUJXamFoXBILjanlyIFGTw8+6b0qdVRV2swi/JbCRPJCtWOBiApepGRrPUyC
 M73g4JpKG93IMc4anNnq1UAWkZ1YOhhGaqyIbitbATG6YD7enseIC63HBo1LwtDCrLMG
 RhWw==
X-Gm-Message-State: AOAM532dahPQ/26J8HNfjRAN9R3yix0Imv4PGT193ucTsRAPDzR+nCRL
 gsxHO+EKyNFCzfrPhqtxLosixLPEJm9yJTPu
X-Google-Smtp-Source: ABdhPJy06pY8g05SdXM9TSR6Lu1CAVcyU+hHM54Umc55avs9AWx47mtBaSfwBsXwVE2ylxF5PCddbA==
X-Received: by 2002:aca:dd89:: with SMTP id u131mr4774845oig.145.1621368709178; 
 Tue, 18 May 2021 13:11:49 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:11:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/24] target/ppc: Introduce prot_for_access_type
Date: Tue, 18 May 2021 15:11:23 -0500
Message-Id: <20210518201146.794854-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use this in the three places we currently have a local array
indexed by rwx (which happens to have the same values).
The types will match up correctly with additional changes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/internal.h    | 19 +++++++++++++++++++
 target/ppc/mmu-hash32.c  |  8 +++++---
 target/ppc/mmu-hash64.c  | 10 ++++++----
 target/ppc/mmu-radix64.c |  6 ++++--
 4 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 184ba6d6b3..2b4b06eb76 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -228,4 +228,23 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
 void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
 gchar *ppc_gdb_arch_name(CPUState *cs);
 
+/**
+ * prot_for_access_type:
+ * @access_type: Access type
+ *
+ * Return the protection bit required for the given access type.
+ */
+static inline int prot_for_access_type(MMUAccessType access_type)
+{
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        return PAGE_EXEC;
+    case MMU_DATA_LOAD:
+        return PAGE_READ;
+    case MMU_DATA_STORE:
+        return PAGE_WRITE;
+    }
+    g_assert_not_reached();
+}
+
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 178cf090b7..233a66658e 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
+#include "internal.h"
 #include "mmu-hash32.h"
 #include "exec/log.h"
 
@@ -421,10 +422,11 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     hwaddr pte_offset;
     ppc_hash_pte32_t pte;
     int prot;
-    const int need_prot[] = {PAGE_READ, PAGE_WRITE, PAGE_EXEC};
+    int need_prot;
     hwaddr raddr;
 
     assert((rwx == 0) || (rwx == 1) || (rwx == 2));
+    need_prot = prot_for_access_type(rwx);
 
     /* 1. Handle real mode accesses */
     if (((rwx == 2) && (msr_ir == 0)) || ((rwx != 2) && (msr_dr == 0))) {
@@ -440,7 +442,7 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     if (env->nb_BATs != 0) {
         raddr = ppc_hash32_bat_lookup(cpu, eaddr, rwx, &prot);
         if (raddr != -1) {
-            if (need_prot[rwx] & ~prot) {
+            if (need_prot & ~prot) {
                 if (rwx == 2) {
                     cs->exception_index = POWERPC_EXCP_ISI;
                     env->error_code = 0x08000000;
@@ -513,7 +515,7 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
 
     prot = ppc_hash32_pte_prot(cpu, sr, pte);
 
-    if (need_prot[rwx] & ~prot) {
+    if (need_prot & ~prot) {
         /* Access right violation */
         qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
         if (rwx == 2) {
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index c4a4bc7cd2..d5b70ddc9c 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -29,6 +29,7 @@
 #include "mmu-hash64.h"
 #include "exec/log.h"
 #include "hw/hw.h"
+#include "internal.h"
 #include "mmu-book3s-v3.h"
 #include "helper_regs.h"
 
@@ -876,7 +877,7 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     hwaddr ptex;
     ppc_hash_pte64_t pte;
     int exec_prot, pp_prot, amr_prot, prot;
-    const int need_prot[] = {PAGE_READ, PAGE_WRITE, PAGE_EXEC};
+    int need_prot;
     hwaddr raddr;
 
     assert((rwx == 0) || (rwx == 1) || (rwx == 2));
@@ -996,7 +997,8 @@ skip_slb_search:
     amr_prot = ppc_hash64_amr_prot(cpu, pte);
     prot = exec_prot & pp_prot & amr_prot;
 
-    if ((need_prot[rwx] & ~prot) != 0) {
+    need_prot = prot_for_access_type(rwx);
+    if (need_prot & ~prot) {
         /* Access right violation */
         qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
         if (rwx == 2) {
@@ -1012,13 +1014,13 @@ skip_slb_search:
             ppc_hash64_set_isi(cs, srr1);
         } else {
             int dsisr = 0;
-            if (need_prot[rwx] & ~pp_prot) {
+            if (need_prot & ~pp_prot) {
                 dsisr |= DSISR_PROTFAULT;
             }
             if (rwx == 1) {
                 dsisr |= DSISR_ISSTORE;
             }
-            if (need_prot[rwx] & ~amr_prot) {
+            if (need_prot & ~amr_prot) {
                 dsisr |= DSISR_AMR;
             }
             ppc_hash64_set_dsi(cs, eaddr, dsisr);
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 30fcfcf11f..646b9afb7b 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -25,6 +25,7 @@
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
 #include "exec/log.h"
+#include "internal.h"
 #include "mmu-radix64.h"
 #include "mmu-book3s-v3.h"
 
@@ -135,7 +136,7 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, int rwx, uint64_t pte,
                                    bool partition_scoped)
 {
     CPUPPCState *env = &cpu->env;
-    const int need_prot[] = { PAGE_READ, PAGE_WRITE, PAGE_EXEC };
+    int need_prot;
 
     /* Check Page Attributes (pte58:59) */
     if (((pte & R_PTE_ATT) == R_PTE_ATT_NI_IO) && (rwx == 2)) {
@@ -158,7 +159,8 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, int rwx, uint64_t pte,
     }
 
     /* Check if requested access type is allowed */
-    if (need_prot[rwx] & ~(*prot)) { /* Page Protected for that Access */
+    need_prot = prot_for_access_type(rwx);
+    if (need_prot & ~*prot) { /* Page Protected for that Access */
         *fault_cause |= DSISR_PROTFAULT;
         return true;
     }
-- 
2.25.1



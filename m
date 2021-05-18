Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8891D388126
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:14:11 +0200 (CEST)
Received: from localhost ([::1]:59090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj66U-0003az-IR
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64I-0008Qk-4t
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:54 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:36721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64F-00061P-CA
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:53 -0400
Received: by mail-oi1-x22e.google.com with SMTP id f184so10982458oig.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iHEkHaZIfkKzz1rPeJBsc0nLzQ2Qjc824vRMxX4Quns=;
 b=rA9r2SH6XH7azYeYEV9qk4Ooi2IJZJV7EvtBfliT6u+W49H8bG0WxhQvIv+0MSrrY6
 0Hy+v5diZTTOGl4jM2Z35cucC7fnmuY0wQ1tAWi7DiaTiHb5H8MSGFtBGBxpzEul83CO
 8mZIvE+13SEcDH6dGdVubn5bBzwBsi0BIdroshWfSYn2WeU+7l0laScYqu7K6nw8J3PB
 1CJfk+F0xzwAlohzTbdaYSiwTaGl8IrFyXJOcYJKFp/lQqmAeoiYgiYYjZbETlkpG1C1
 mW+Wh9gLpqRGk1IVduBmmz5uLCxOqvyJIWiJ30FqpzS8hdWT7EI8mSzScd2qjx6IuObv
 6UrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iHEkHaZIfkKzz1rPeJBsc0nLzQ2Qjc824vRMxX4Quns=;
 b=eN1A2y4qK05VXe1JWzoVh/YFY0BK8jOubUFaR8ajW7HcnMkmkRrJ8HNYHY3ejyHNEY
 kD6MywqNQ3hVA66EoahKwH3stC8tzvg0l+AvcqK9zA17Hx6hjkEiI3p9YZVoyolbd3I1
 DB2vT6XJRkp79HtBtfQYc8RppQu4xz5jlrhcozQRvFfpOpt1llapV4cRmM11UH+JWoYW
 cV7kFseTxUL0p+k+Fkhs8vFNlS3tg5cWyOaTPaGSeiVZkmxK7Vpjcltos1eBVSAOs47T
 nMFsoFosmoatX2UVDsmMBw32qaCWv5zZzY6grhZHY8iIFHOzVDPDGykts37lT6Upcl/P
 wm6w==
X-Gm-Message-State: AOAM532YG4hm+W2R2aqPWNVr/PgYxHxESkghhnZcm5z7nsR+4VHeR8Qr
 zZS9SFel+yJIEiPSPDFICADicfP2qCSyisnM
X-Google-Smtp-Source: ABdhPJztZ487gVC2kOWmY9ncegnwq3n0BoCUn3FyjpA6N+7d5LUxDOHpMdGPixsDapPJ4QHz1yGBfA==
X-Received: by 2002:a05:6808:4b:: with SMTP id
 v11mr5189172oic.117.1621368710169; 
 Tue, 18 May 2021 13:11:50 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:11:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/24] target/ppc: Use MMUAccessType in mmu-radix64.c
Date: Tue, 18 May 2021 15:11:24 -0500
Message-Id: <20210518201146.794854-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We must leave the 'int rwx' parameter to ppc_radix64_handle_mmu_fault
for now, but will clean that up later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu-radix64.c | 119 ++++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 45 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 646b9afb7b..7972153f23 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -75,71 +75,94 @@ static bool ppc_radix64_get_fully_qualified_addr(const CPUPPCState *env,
     return true;
 }
 
-static void ppc_radix64_raise_segi(PowerPCCPU *cpu, int rwx, vaddr eaddr)
+static void ppc_radix64_raise_segi(PowerPCCPU *cpu, MMUAccessType access_type,
+                                   vaddr eaddr)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
-    if (rwx == 2) { /* Instruction Segment Interrupt */
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        /* Instruction Segment Interrupt */
         cs->exception_index = POWERPC_EXCP_ISEG;
-    } else { /* Data Segment Interrupt */
+        break;
+    case MMU_DATA_STORE:
+    case MMU_DATA_LOAD:
+        /* Data Segment Interrupt */
         cs->exception_index = POWERPC_EXCP_DSEG;
         env->spr[SPR_DAR] = eaddr;
+        break;
+    default:
+        g_assert_not_reached();
     }
     env->error_code = 0;
 }
 
-static void ppc_radix64_raise_si(PowerPCCPU *cpu, int rwx, vaddr eaddr,
-                                uint32_t cause)
+static void ppc_radix64_raise_si(PowerPCCPU *cpu, MMUAccessType access_type,
+                                 vaddr eaddr, uint32_t cause)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
-    if (rwx == 2) { /* Instruction Storage Interrupt */
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        /* Instruction Storage Interrupt */
         cs->exception_index = POWERPC_EXCP_ISI;
         env->error_code = cause;
-    } else { /* Data Storage Interrupt */
+        break;
+    case MMU_DATA_STORE:
+        cause |= DSISR_ISSTORE;
+        /* fall through */
+    case MMU_DATA_LOAD:
+        /* Data Storage Interrupt */
         cs->exception_index = POWERPC_EXCP_DSI;
-        if (rwx == 1) { /* Write -> Store */
-            cause |= DSISR_ISSTORE;
-        }
         env->spr[SPR_DSISR] = cause;
         env->spr[SPR_DAR] = eaddr;
         env->error_code = 0;
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
 
-static void ppc_radix64_raise_hsi(PowerPCCPU *cpu, int rwx, vaddr eaddr,
-                                  hwaddr g_raddr, uint32_t cause)
+static void ppc_radix64_raise_hsi(PowerPCCPU *cpu, MMUAccessType access_type,
+                                  vaddr eaddr, hwaddr g_raddr, uint32_t cause)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
-    if (rwx == 2) { /* H Instruction Storage Interrupt */
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        /* H Instruction Storage Interrupt */
         cs->exception_index = POWERPC_EXCP_HISI;
         env->spr[SPR_ASDR] = g_raddr;
         env->error_code = cause;
-    } else { /* H Data Storage Interrupt */
+        break;
+    case MMU_DATA_STORE:
+        cause |= DSISR_ISSTORE;
+        /* fall through */
+    case MMU_DATA_LOAD:
+        /* H Data Storage Interrupt */
         cs->exception_index = POWERPC_EXCP_HDSI;
-        if (rwx == 1) { /* Write -> Store */
-            cause |= DSISR_ISSTORE;
-        }
         env->spr[SPR_HDSISR] = cause;
         env->spr[SPR_HDAR] = eaddr;
         env->spr[SPR_ASDR] = g_raddr;
         env->error_code = 0;
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
 
-static bool ppc_radix64_check_prot(PowerPCCPU *cpu, int rwx, uint64_t pte,
-                                   int *fault_cause, int *prot,
+static bool ppc_radix64_check_prot(PowerPCCPU *cpu, MMUAccessType access_type,
+                                   uint64_t pte, int *fault_cause, int *prot,
                                    bool partition_scoped)
 {
     CPUPPCState *env = &cpu->env;
     int need_prot;
 
     /* Check Page Attributes (pte58:59) */
-    if (((pte & R_PTE_ATT) == R_PTE_ATT_NI_IO) && (rwx == 2)) {
+    if ((pte & R_PTE_ATT) == R_PTE_ATT_NI_IO && access_type == MMU_INST_FETCH) {
         /*
          * Radix PTE entries with the non-idempotent I/O attribute are treated
          * as guarded storage
@@ -159,7 +182,7 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, int rwx, uint64_t pte,
     }
 
     /* Check if requested access type is allowed */
-    need_prot = prot_for_access_type(rwx);
+    need_prot = prot_for_access_type(access_type);
     if (need_prot & ~*prot) { /* Page Protected for that Access */
         *fault_cause |= DSISR_PROTFAULT;
         return true;
@@ -168,15 +191,15 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, int rwx, uint64_t pte,
     return false;
 }
 
-static void ppc_radix64_set_rc(PowerPCCPU *cpu, int rwx, uint64_t pte,
-                               hwaddr pte_addr, int *prot)
+static void ppc_radix64_set_rc(PowerPCCPU *cpu, MMUAccessType access_type,
+                               uint64_t pte, hwaddr pte_addr, int *prot)
 {
     CPUState *cs = CPU(cpu);
     uint64_t npte;
 
     npte = pte | R_PTE_R; /* Always set reference bit */
 
-    if (rwx == 1) { /* Store/Write */
+    if (access_type == MMU_DATA_STORE) { /* Store/Write */
         npte |= R_PTE_C; /* Set change bit */
     } else {
         /*
@@ -271,7 +294,8 @@ static bool validate_pate(PowerPCCPU *cpu, uint64_t lpid, ppc_v3_pate_t *pate)
     return true;
 }
 
-static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu, int rwx,
+static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
+                                              MMUAccessType access_type,
                                               vaddr eaddr, hwaddr g_raddr,
                                               ppc_v3_pate_t pate,
                                               hwaddr *h_raddr, int *h_prot,
@@ -287,24 +311,25 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu, int rwx,
     if (ppc_radix64_walk_tree(CPU(cpu)->as, g_raddr, pate.dw0 & PRTBE_R_RPDB,
                               pate.dw0 & PRTBE_R_RPDS, h_raddr, h_page_size,
                               &pte, &fault_cause, &pte_addr) ||
-        ppc_radix64_check_prot(cpu, rwx, pte, &fault_cause, h_prot, true)) {
+        ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, h_prot, true)) {
         if (pde_addr) { /* address being translated was that of a guest pde */
             fault_cause |= DSISR_PRTABLE_FAULT;
         }
         if (guest_visible) {
-            ppc_radix64_raise_hsi(cpu, rwx, eaddr, g_raddr, fault_cause);
+            ppc_radix64_raise_hsi(cpu, access_type, eaddr, g_raddr, fault_cause);
         }
         return 1;
     }
 
     if (guest_visible) {
-        ppc_radix64_set_rc(cpu, rwx, pte, pte_addr, h_prot);
+        ppc_radix64_set_rc(cpu, access_type, pte, pte_addr, h_prot);
     }
 
     return 0;
 }
 
-static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
+static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
+                                            MMUAccessType access_type,
                                             vaddr eaddr, uint64_t pid,
                                             ppc_v3_pate_t pate, hwaddr *g_raddr,
                                             int *g_prot, int *g_page_size,
@@ -323,7 +348,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
     if (offset >= size) {
         /* offset exceeds size of the process table */
         if (guest_visible) {
-            ppc_radix64_raise_si(cpu, rwx, eaddr, DSISR_NOPTE);
+            ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPTE);
         }
         return 1;
     }
@@ -364,7 +389,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
         if (ret) {
             /* No valid PTE */
             if (guest_visible) {
-                ppc_radix64_raise_si(cpu, rwx, eaddr, fault_cause);
+                ppc_radix64_raise_si(cpu, access_type, eaddr, fault_cause);
             }
             return ret;
         }
@@ -393,7 +418,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
             if (ret) {
                 /* No valid pte */
                 if (guest_visible) {
-                    ppc_radix64_raise_si(cpu, rwx, eaddr, fault_cause);
+                    ppc_radix64_raise_si(cpu, access_type, eaddr, fault_cause);
                 }
                 return ret;
             }
@@ -407,16 +432,16 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
         *g_raddr = (rpn & ~mask) | (eaddr & mask);
     }
 
-    if (ppc_radix64_check_prot(cpu, rwx, pte, &fault_cause, g_prot, false)) {
+    if (ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, g_prot, false)) {
         /* Access denied due to protection */
         if (guest_visible) {
-            ppc_radix64_raise_si(cpu, rwx, eaddr, fault_cause);
+            ppc_radix64_raise_si(cpu, access_type, eaddr, fault_cause);
         }
         return 1;
     }
 
     if (guest_visible) {
-        ppc_radix64_set_rc(cpu, rwx, pte, pte_addr, g_prot);
+        ppc_radix64_set_rc(cpu, access_type, pte, pte_addr, g_prot);
     }
 
     return 0;
@@ -439,7 +464,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
  *              | = On        | Process Scoped |    Scoped     |
  *              +-------------+----------------+---------------+
  */
-static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, int rwx,
+static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                             MMUAccessType access_type,
                              bool relocation,
                              hwaddr *raddr, int *psizep, int *protp,
                              bool guest_visible)
@@ -453,7 +479,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     /* Virtual Mode Access - get the fully qualified address */
     if (!ppc_radix64_get_fully_qualified_addr(&cpu->env, eaddr, &lpid, &pid)) {
         if (guest_visible) {
-            ppc_radix64_raise_segi(cpu, rwx, eaddr);
+            ppc_radix64_raise_segi(cpu, access_type, eaddr);
         }
         return 1;
     }
@@ -466,13 +492,13 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     } else {
         if (!ppc64_v3_get_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
-                ppc_radix64_raise_si(cpu, rwx, eaddr, DSISR_NOPTE);
+                ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPTE);
             }
             return 1;
         }
         if (!validate_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
-                ppc_radix64_raise_si(cpu, rwx, eaddr, DSISR_R_BADCONFIG);
+                ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BADCONFIG);
             }
             return 1;
         }
@@ -490,7 +516,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, int rwx,
      * - Translates an effective address to a guest real address.
      */
     if (relocation) {
-        int ret = ppc_radix64_process_scoped_xlate(cpu, rwx, eaddr, pid,
+        int ret = ppc_radix64_process_scoped_xlate(cpu, access_type, eaddr, pid,
                                                    pate, &g_raddr, &prot,
                                                    &psize, guest_visible);
         if (ret) {
@@ -513,9 +539,10 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, int rwx,
         if (lpid || !msr_hv) {
             int ret;
 
-            ret = ppc_radix64_partition_scoped_xlate(cpu, rwx, eaddr, g_raddr,
-                                                     pate, raddr, &prot, &psize,
-                                                     false, guest_visible);
+            ret = ppc_radix64_partition_scoped_xlate(cpu, access_type, eaddr,
+                                                     g_raddr, pate, raddr,
+                                                     &prot, &psize, false,
+                                                     guest_visible);
             if (ret) {
                 return ret;
             }
@@ -536,12 +563,14 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     CPUPPCState *env = &cpu->env;
     int page_size, prot;
     bool relocation;
+    MMUAccessType access_type;
     hwaddr raddr;
 
     assert(!(msr_hv && cpu->vhyp));
     assert((rwx == 0) || (rwx == 1) || (rwx == 2));
+    access_type = rwx;
 
-    relocation = ((rwx == 2) && (msr_ir == 1)) || ((rwx != 2) && (msr_dr == 1));
+    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
     /* HV or virtual hypervisor Real Mode Access */
     if (!relocation && (msr_hv || cpu->vhyp)) {
         /* In real mode top 4 effective addr bits (mostly) ignored */
@@ -570,7 +599,7 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     }
 
     /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
-    if (ppc_radix64_xlate(cpu, eaddr, rwx, relocation, &raddr,
+    if (ppc_radix64_xlate(cpu, eaddr, access_type, relocation, &raddr,
                           &page_size, &prot, true)) {
         return 1;
     }
-- 
2.25.1



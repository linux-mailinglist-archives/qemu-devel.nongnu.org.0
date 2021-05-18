Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645AF38812E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:16:30 +0200 (CEST)
Received: from localhost ([::1]:38502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj68j-0000Ie-C5
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64J-0008VR-Em
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:55 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:42964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64G-00062v-QZ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:55 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so1919801otg.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcPI5lPBCexP89rT0HV5a1mPydi7khfc1j2g/chIoCU=;
 b=XFz7n/Mm89ots8MrQGecLNMXer0TBVCvXZgnrYjgsodkQxJTB9djCDuwc2nfyW5Oy/
 ndiwV1u/9mGwQeX82yCK5v7uG1imJMXWx8Sr7DPKvsGWyzzdpIrfEBY2aEA7CTRluJxC
 IU9271/c79/zF5b085yqvDN6c5Bno/croVf7JRIzuWAXuT0KtO6PLbFsLA6nf7HEOe+G
 a6JN5jxQwvchc+qs7vhwEWQRH8VbsVdUdm+DubbvrIev2+Qj27Z4mCAqBTH+k69+96dM
 6yq77WyNyzec7fVzBstaITATkR02ElrS0VED0lh27hiuJVMKvtjXDQhfttyiOx5VC4SG
 o9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QcPI5lPBCexP89rT0HV5a1mPydi7khfc1j2g/chIoCU=;
 b=c/aYwq7Rq+SULofxSzx/du9S19+leQCpHB85Btb/bk5DYLZid+u8ZYj610B3d/nN17
 Xk6op5rtRxi0m8aC0pwtbR9/LTj7fXfWPp2Gpy8k1yrJJaH7MUQGs6qjZsaJ7yLJzDHj
 TvD7jZDfdvWnmz+8oehQsyVMkz8giZrSDiAYtWZ9UR28E7zETicHVFMTnUVOzo0VcAlR
 QCtflyEz3pAmVSgEJFOpJ3b7B5rGRPGa11FdascD5BHuSFmVM3RLjagkb4dn34JJDzBq
 zhsoQctzauhAKy5AF/6S9WQCx/8GrRAukWYrwCfMDnuQqmqhtj1byiOI1zqodWl4YHuq
 N/dw==
X-Gm-Message-State: AOAM532AQsw9Yq0F6Zhz1PfDgAdKrAsUhVleVGvQI3Da6JsxHmQb3euM
 9wltvPW2ZWqeCwquMdEbX1ScPVr4SvUSmLFD
X-Google-Smtp-Source: ABdhPJw16z254lxjXLL0R8Azu9eddMIAU+lF6kKCYwnqu8L9w0LRDqMR/xMCMQ+7xbzYbjrEkxJwzg==
X-Received: by 2002:a05:6830:15c9:: with SMTP id
 j9mr5429111otr.73.1621368711612; 
 Tue, 18 May 2021 13:11:51 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:11:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/24] target/ppc: Use MMUAccessType in mmu-hash64.c
Date: Tue, 18 May 2021 15:11:25 -0500
Message-Id: <20210518201146.794854-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
Cc: bruno.larsen@eldorado.org.br,
 Ricgard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We must leave the 'int rwx' parameter to ppc_hash64_handle_mmu_fault
for now, but will clean that up later.

Signed-off-by: Ricgard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu-hash64.c | 61 ++++++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index d5b70ddc9c..f48b625f48 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -877,10 +877,12 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     hwaddr ptex;
     ppc_hash_pte64_t pte;
     int exec_prot, pp_prot, amr_prot, prot;
+    MMUAccessType access_type;
     int need_prot;
     hwaddr raddr;
 
     assert((rwx == 0) || (rwx == 1) || (rwx == 2));
+    access_type = rwx;
 
     /*
      * Note on LPCR usage: 970 uses HID4, but our special variant of
@@ -891,7 +893,7 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
      */
 
     /* 1. Handle real mode accesses */
-    if (((rwx == 2) && (msr_ir == 0)) || ((rwx != 2) && (msr_dr == 0))) {
+    if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
         /*
          * Translation is supposedly "off", but in real mode the top 4
          * effective address bits are (mostly) ignored
@@ -924,14 +926,19 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
             /* Emulated old-style RMO mode, bounds check against RMLS */
             if (raddr >= limit) {
-                if (rwx == 2) {
+                switch (access_type) {
+                case MMU_INST_FETCH:
                     ppc_hash64_set_isi(cs, SRR1_PROTFAULT);
-                } else {
-                    int dsisr = DSISR_PROTFAULT;
-                    if (rwx == 1) {
-                        dsisr |= DSISR_ISSTORE;
-                    }
-                    ppc_hash64_set_dsi(cs, eaddr, dsisr);
+                    break;
+                case MMU_DATA_LOAD:
+                    ppc_hash64_set_dsi(cs, eaddr, DSISR_PROTFAULT);
+                    break;
+                case MMU_DATA_STORE:
+                    ppc_hash64_set_dsi(cs, eaddr,
+                                       DSISR_PROTFAULT | DSISR_ISSTORE);
+                    break;
+                default:
+                    g_assert_not_reached();
                 }
                 return 1;
             }
@@ -954,13 +961,19 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
             exit(1);
         }
         /* Segment still not found, generate the appropriate interrupt */
-        if (rwx == 2) {
+        switch (access_type) {
+        case MMU_INST_FETCH:
             cs->exception_index = POWERPC_EXCP_ISEG;
             env->error_code = 0;
-        } else {
+            break;
+        case MMU_DATA_LOAD:
+        case MMU_DATA_STORE:
             cs->exception_index = POWERPC_EXCP_DSEG;
             env->error_code = 0;
             env->spr[SPR_DAR] = eaddr;
+            break;
+        default:
+            g_assert_not_reached();
         }
         return 1;
     }
@@ -968,7 +981,7 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 skip_slb_search:
 
     /* 3. Check for segment level no-execute violation */
-    if ((rwx == 2) && (slb->vsid & SLB_VSID_N)) {
+    if (access_type == MMU_INST_FETCH && (slb->vsid & SLB_VSID_N)) {
         ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
         return 1;
     }
@@ -976,14 +989,18 @@ skip_slb_search:
     /* 4. Locate the PTE in the hash table */
     ptex = ppc_hash64_htab_lookup(cpu, slb, eaddr, &pte, &apshift);
     if (ptex == -1) {
-        if (rwx == 2) {
+        switch (access_type) {
+        case MMU_INST_FETCH:
             ppc_hash64_set_isi(cs, SRR1_NOPTE);
-        } else {
-            int dsisr = DSISR_NOPTE;
-            if (rwx == 1) {
-                dsisr |= DSISR_ISSTORE;
-            }
-            ppc_hash64_set_dsi(cs, eaddr, dsisr);
+            break;
+        case MMU_DATA_LOAD:
+            ppc_hash64_set_dsi(cs, eaddr, DSISR_NOPTE);
+            break;
+        case MMU_DATA_STORE:
+            ppc_hash64_set_dsi(cs, eaddr, DSISR_NOPTE | DSISR_ISSTORE);
+            break;
+        default:
+            g_assert_not_reached();
         }
         return 1;
     }
@@ -997,11 +1014,11 @@ skip_slb_search:
     amr_prot = ppc_hash64_amr_prot(cpu, pte);
     prot = exec_prot & pp_prot & amr_prot;
 
-    need_prot = prot_for_access_type(rwx);
+    need_prot = prot_for_access_type(access_type);
     if (need_prot & ~prot) {
         /* Access right violation */
         qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
-        if (rwx == 2) {
+        if (access_type == MMU_INST_FETCH) {
             int srr1 = 0;
             if (PAGE_EXEC & ~exec_prot) {
                 srr1 |= SRR1_NOEXEC_GUARD; /* Access violates noexec or guard */
@@ -1017,7 +1034,7 @@ skip_slb_search:
             if (need_prot & ~pp_prot) {
                 dsisr |= DSISR_PROTFAULT;
             }
-            if (rwx == 1) {
+            if (access_type == MMU_DATA_STORE) {
                 dsisr |= DSISR_ISSTORE;
             }
             if (need_prot & ~amr_prot) {
@@ -1036,7 +1053,7 @@ skip_slb_search:
         ppc_hash64_set_r(cpu, ptex, pte.pte1);
     }
     if (!(pte.pte1 & HPTE64_R_C)) {
-        if (rwx == 1) {
+        if (access_type == MMU_DATA_STORE) {
             ppc_hash64_set_c(cpu, ptex, pte.pte1);
         } else {
             /*
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA0438815A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:26:29 +0200 (CEST)
Received: from localhost ([::1]:42946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6IO-0005mO-OD
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64g-0000ws-Uk
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:18 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:36534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64V-0006KH-R5
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:18 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 v13-20020a4aa40d0000b02902052145a469so2516314ool.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=usq8qtlgC3o9/Uyj8zLYVbmtA5cNJErk7QF+4PTr5tk=;
 b=srWYLrfkHQfgg64i83c1scQHJ8OrygxvKb+9keuebuY/z81CMSCTX1l6hkoJSODHYt
 JScjxARpUp2X6DqNCfWVd7G4CxV47f5kc0P0Ym7K+hsxJoigfhQKKmRRf5fzVxhynflh
 mzbnN07C7jFdrAnPuZ5JjezrILIvB1tBNGqVpeBinrv7+dhl1PHlBtpP5e8rBPBfb6Fo
 pKq31+Ouz7GEUnayBAjDAVxD2u5pW5e3gwIIrE0Jyf/0qqKKX+bBc6PvOgIN/4rJyS4w
 IAFzQBDescDGL9gv+i+BP12dh/vlzWhhftYJbfdSjQRNHyCNKR6JUJ4XvKH56upnLkuO
 ILbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=usq8qtlgC3o9/Uyj8zLYVbmtA5cNJErk7QF+4PTr5tk=;
 b=rd3COzzjpwU9RXN95oss321J2NaqkmJCZDa9R3X9BvI1VaMxuLhfNMxtdM/7SWriZ6
 bWnzh/qqsI8KUDM/wWCExJIy+lRMVybecJHobt4FXEB6QAehmjKVyT2bECxc9dWud5/a
 NSsLTDgYw910BmiDZ6YjrASOC6XU/F+JmhCx+tFHY+yrLxJwsbdUwAvbleyZPrP/sgW6
 haARnNduQoURdU75y3+E2I86zECkRvKdwjfdB0iry/Tgnjgpk/e8KESmcdiBtYUtaOSV
 i+snRmVNY3jhb0dn6R3orGImjQM91P76r2OYElcRRHRLne+jGo2m5l5TbqdV0kuB7lO0
 MHVg==
X-Gm-Message-State: AOAM533THAQfxPREt4qsQxPqVvhcIoSFqGLqSn+1srZ3r0ndc/44mwvT
 MUuwooeBWaDoGo2YsZWqmJFVxkb2tyNNVumj
X-Google-Smtp-Source: ABdhPJzxh9Yk6yTkYIYlpYhjITWbiHRDbiAmZSWAgJ/Iw+G4NrOWmy/Vil662RB629pbQ/RYhtCJDA==
X-Received: by 2002:a4a:625c:: with SMTP id y28mr5727630oog.45.1621368725224; 
 Tue, 18 May 2021 13:12:05 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/24] target/ppc: Use MMUAccessType with *_handle_mmu_fault
Date: Tue, 18 May 2021 15:11:39 -0500
Message-Id: <20210518201146.794854-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
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

These changes were waiting until we didn't need to match
the function type of PowerPCCPUClass.handle_mmu_fault.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu-hash32.h  | 4 ++--
 target/ppc/mmu-hash64.h  | 4 ++--
 target/ppc/mmu-radix64.h | 4 ++--
 target/ppc/mmu-hash32.c  | 7 ++-----
 target/ppc/mmu-hash64.c  | 6 +-----
 target/ppc/mmu-radix64.c | 7 ++-----
 6 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index 898021f0d8..30e35718a7 100644
--- a/target/ppc/mmu-hash32.h
+++ b/target/ppc/mmu-hash32.h
@@ -5,8 +5,8 @@
 
 hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
 hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
-                                int mmu_idx);
+int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
+                                MMUAccessType access_type, int mmu_idx);
 
 /*
  * Segment register definitions
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index 4b8b8e7950..3e8a8eec1f 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -8,8 +8,8 @@ void dump_slb(PowerPCCPU *cpu);
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
                   target_ulong esid, target_ulong vsid);
 hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
-int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
-                                int mmu_idx);
+int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
+                                MMUAccessType access_type, int mmu_idx);
 void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
                                target_ulong pte_index,
                                target_ulong pte0, target_ulong pte1);
diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
index f28c5794d0..94bd72cb38 100644
--- a/target/ppc/mmu-radix64.h
+++ b/target/ppc/mmu-radix64.h
@@ -44,8 +44,8 @@
 
 #ifdef TARGET_PPC64
 
-int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                                 int mmu_idx);
+int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                 MMUAccessType access_type, int mmu_idx);
 hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
 
 static inline int ppc_radix64_get_prot_eaa(uint64_t pte)
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 744a763f44..d51be59f95 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -416,8 +416,8 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
     return (rpn & ~mask) | (eaddr & mask);
 }
 
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                                int mmu_idx)
+int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -426,11 +426,8 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     ppc_hash_pte32_t pte;
     int prot;
     int need_prot;
-    MMUAccessType access_type;
     hwaddr raddr;
 
-    assert((rwx == 0) || (rwx == 1) || (rwx == 2));
-    access_type = rwx;
     need_prot = prot_for_access_type(access_type);
 
     /* 1. Handle real mode accesses */
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index f48b625f48..877a01a296 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -867,7 +867,7 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
 }
 
 int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                int rwx, int mmu_idx)
+                                MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -877,13 +877,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     hwaddr ptex;
     ppc_hash_pte64_t pte;
     int exec_prot, pp_prot, amr_prot, prot;
-    MMUAccessType access_type;
     int need_prot;
     hwaddr raddr;
 
-    assert((rwx == 0) || (rwx == 1) || (rwx == 2));
-    access_type = rwx;
-
     /*
      * Note on LPCR usage: 970 uses HID4, but our special variant of
      * store_spr copies relevant fields into env->spr[SPR_LPCR].
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 7972153f23..f6d96f73b2 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -556,19 +556,16 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
     return 0;
 }
 
-int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                                 int mmu_idx)
+int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                 MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     int page_size, prot;
     bool relocation;
-    MMUAccessType access_type;
     hwaddr raddr;
 
     assert(!(msr_hv && cpu->vhyp));
-    assert((rwx == 0) || (rwx == 1) || (rwx == 2));
-    access_type = rwx;
 
     relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
     /* HV or virtual hypervisor Real Mode Access */
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA334DBE0D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:16:34 +0100 (CET)
Received: from localhost ([::1]:38824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiUz-0008Om-VP
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:16:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKl-0000yZ-DZ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:59 -0400
Received: from [2607:f8b0:4864:20::62a] (port=34465
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKj-0002FP-NR
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:59 -0400
Received: by mail-pl1-x62a.google.com with SMTP id i11so2867634plr.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GKFLxmbTYTFJV6/p4TM5MrilKQbtlOw6w8FSPR9X89E=;
 b=SZpJt/ilQdGCuAKAFbLw2Lt4Ve4D5LFGmAKQXF1pcv3cVwpWlgJLCcbJ406jNHrcIX
 3vFlSjLKhPV1z0d3OuIapt7OoFIRfw8xHvQoGojJ3JKtEMnJh46PSTFHAWDnjtC1I6De
 1CQCLds1EGe9Ie2qE6HDmVGUdijZhnBSHyNDsqCZXI9Ri9sYbWr8ous/O8486PBfESen
 y+TsQDmkfp0UDn7d0tko9cFoLBasBDXVWhqpMj1s2L63aRDAPtrpzFnTRqpGt770wYP6
 t4U81GC1UxjQSLJVvhsX16YCbD0xCmPkZ/rbqI0H+uVghyvwUjJ+F7+Un+oEytISPlyS
 hgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GKFLxmbTYTFJV6/p4TM5MrilKQbtlOw6w8FSPR9X89E=;
 b=s50For4MCX4mPoSVCnL7ar3UWJiLM7OigW6n0wqAfX+vm//qfjLiBj5xuTVBqHryW2
 Z7tmwQFw+uPU+4HjUI/KJIuHcjGXZB3TCVp8i1tKHUtIU/wkkoU5oB7NBjMZ1ILVFLDp
 ix/ta/5JvZ5zIQ4bLDrNrGUDFte74IDYGE/cNObYJwZyenpaaf+auQZvE/aAGT7SAwhI
 dFSxCvxgn5RB5AFLFe42UMEPmDGTC1KcsuMCLEecYqcKKNIhK+gh1Mg8POSSCYW5pLlY
 sfdTTwJKwgCFi4lpAw0oN21x9ZeFKweaU8qpqh3L3N6GFm4rILN8Rg/D6apKNHZyBf9Y
 mB5w==
X-Gm-Message-State: AOAM5317vr/oKECDicjJgXxQd2Ic58scC+GgyrsEtxwTUc05xTvv2a1/
 oZgNV+jYL+CukA8GKDPqPdRkYuA5W/L0eQ==
X-Google-Smtp-Source: ABdhPJzGFu7H2Nk2w8nNXMiZyaIAvEZyKISVA3jXWGEtbMcfLkVwyFGJrJZ5+YM7JkYWT+3lLCs3lA==
X-Received: by 2002:a17:902:c407:b0:151:f794:ac5e with SMTP id
 k7-20020a170902c40700b00151f794ac5emr3256282plk.67.1647493556344; 
 Wed, 16 Mar 2022 22:05:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 16/51] target/nios2: Use hw/registerfields.h for
 CR_TLBACC fields
Date: Wed, 16 Mar 2022 22:05:03 -0700
Message-Id: <20220317050538.924111-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Retain the helper macros for single bit fields as aliases to
the longer R_*_MASK names.  Use FIELD_EX32 and FIELD_DP32
instead of manually manipulating the fields.

Since we're rewriting the references to CR_TLBACC_IGN_* anyway,
we correct the name of this field to IG, which is its name in
the official CPU documentation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 23 +++++++++++++++--------
 target/nios2/mmu.c | 16 ++++++++--------
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index e1c2bf8c31..25b77916ca 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -115,14 +115,21 @@ FIELD(CR_PTEADDR, VPN, 2, 20)
 FIELD(CR_PTEADDR, PTBASE, 22, 10)
 
 #define CR_TLBACC        9
-#define   CR_TLBACC_IGN_SHIFT 25
-#define   CR_TLBACC_IGN_MASK  (0x7F << CR_TLBACC_IGN_SHIFT)
-#define   CR_TLBACC_C         (1 << 24)
-#define   CR_TLBACC_R         (1 << 23)
-#define   CR_TLBACC_W         (1 << 22)
-#define   CR_TLBACC_X         (1 << 21)
-#define   CR_TLBACC_G         (1 << 20)
-#define   CR_TLBACC_PFN_MASK  0x000FFFFF
+
+FIELD(CR_TLBACC, PFN, 0, 20)
+FIELD(CR_TLBACC, G, 20, 1)
+FIELD(CR_TLBACC, X, 21, 1)
+FIELD(CR_TLBACC, W, 22, 1)
+FIELD(CR_TLBACC, R, 23, 1)
+FIELD(CR_TLBACC, C, 24, 1)
+FIELD(CR_TLBACC, IG, 25, 7)
+
+#define CR_TLBACC_C      R_CR_TLBACC_C_MASK
+#define CR_TLBACC_R      R_CR_TLBACC_R_MASK
+#define CR_TLBACC_W      R_CR_TLBACC_W_MASK
+#define CR_TLBACC_X      R_CR_TLBACC_X_MASK
+#define CR_TLBACC_G      R_CR_TLBACC_G_MASK
+
 #define CR_TLBMISC       10
 #define   CR_TLBMISC_WAY_SHIFT 20
 #define   CR_TLBMISC_WAY_MASK  (0xF << CR_TLBMISC_WAY_SHIFT)
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 75afc56daf..826cd2afb4 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -49,7 +49,7 @@ unsigned int mmu_translate(CPUNios2State *env,
         }
 
         lu->vaddr = vaddr & TARGET_PAGE_MASK;
-        lu->paddr = (entry->data & CR_TLBACC_PFN_MASK) << TARGET_PAGE_BITS;
+        lu->paddr = FIELD_EX32(entry->data, CR_TLBACC, PFN) << TARGET_PAGE_BITS;
         lu->prot = ((entry->data & CR_TLBACC_R) ? PAGE_READ : 0) |
                    ((entry->data & CR_TLBACC_W) ? PAGE_WRITE : 0) |
                    ((entry->data & CR_TLBACC_X) ? PAGE_EXEC : 0);
@@ -86,27 +86,27 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
     CPUState *cs = env_cpu(env);
     Nios2CPU *cpu = env_archcpu(env);
 
-    trace_nios2_mmu_write_tlbacc(v >> CR_TLBACC_IGN_SHIFT,
+    trace_nios2_mmu_write_tlbacc(FIELD_EX32(v, CR_TLBACC, IG),
                                  (v & CR_TLBACC_C) ? 'C' : '.',
                                  (v & CR_TLBACC_R) ? 'R' : '.',
                                  (v & CR_TLBACC_W) ? 'W' : '.',
                                  (v & CR_TLBACC_X) ? 'X' : '.',
                                  (v & CR_TLBACC_G) ? 'G' : '.',
-                                 v & CR_TLBACC_PFN_MASK);
+                                 FIELD_EX32(v, CR_TLBACC, PFN));
 
     /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
     if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WR) {
         int way = (env->ctrl[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
         int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
         int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
-        int g = (v & CR_TLBACC_G) ? 1 : 0;
-        int valid = ((vpn & CR_TLBACC_PFN_MASK) < 0xC0000) ? 1 : 0;
+        int g = FIELD_EX32(v, CR_TLBACC, G);
+        int valid = FIELD_EX32(vpn, CR_TLBACC, PFN) < 0xC0000;
         Nios2TLBEntry *entry =
             &env->mmu.tlb[(way * cpu->tlb_num_ways) +
                           (vpn & env->mmu.tlb_entry_mask)];
         uint32_t newTag = (vpn << 12) | (g << 11) | (valid << 10) | pid;
         uint32_t newData = v & (CR_TLBACC_C | CR_TLBACC_R | CR_TLBACC_W |
-                                CR_TLBACC_X | CR_TLBACC_PFN_MASK);
+                                CR_TLBACC_X | R_CR_TLBACC_PFN_MASK);
 
         if ((entry->tag != newTag) || (entry->data != newData)) {
             if (entry->tag & (1 << 10)) {
@@ -153,7 +153,7 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
             &env->mmu.tlb[(way * cpu->tlb_num_ways) +
                           (vpn & env->mmu.tlb_entry_mask)];
 
-        env->ctrl[CR_TLBACC] &= CR_TLBACC_IGN_MASK;
+        env->ctrl[CR_TLBACC] &= R_CR_TLBACC_IG_MASK;
         env->ctrl[CR_TLBACC] |= entry->data;
         env->ctrl[CR_TLBACC] |= (entry->tag & (1 << 11)) ? CR_TLBACC_G : 0;
         env->ctrl[CR_TLBMISC] =
@@ -208,7 +208,7 @@ void dump_mmu(CPUNios2State *env)
                     entry->tag >> 12,
                     entry->tag & ((1 << cpu->pid_num_bits) - 1),
                     (entry->tag & (1 << 11)) ? 'G' : '-',
-                    entry->data & CR_TLBACC_PFN_MASK,
+                    FIELD_EX32(entry->data, CR_TLBACC, PFN),
                     (entry->data & CR_TLBACC_C) ? 'C' : '-',
                     (entry->data & CR_TLBACC_R) ? 'R' : '-',
                     (entry->data & CR_TLBACC_W) ? 'W' : '-',
-- 
2.25.1



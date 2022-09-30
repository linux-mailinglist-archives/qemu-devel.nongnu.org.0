Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7EA5F14F2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:33:18 +0200 (CEST)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNdF-00087H-I7
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWv-0006Kp-Rm
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:45 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:43612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWt-0005OW-Tc
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:45 -0400
Received: by mail-qv1-xf29.google.com with SMTP id s13so3581678qvq.10
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=m+Sqb4KGdCuWUPK1XHg8WBMkrVNPK8kei5cVHcxSXxQ=;
 b=OjU3Mkc1aoJs1Qej/N02NP/lVewAvuvszEgv6hpmljQxGASeyiXe5QC9gAhD14AYFh
 jH1rrys9wG/lX06f8nzT5gARmg5IMSPoIX84Y+sJ+OS0vNOVDut0gzxelm8E0UA59FR2
 /veV6neiXr0+mTum9hD2r6QXaKHXofcktMudjMGSMpskmeE9eq/Wzt9jANzJN6gapT/N
 YQ5ppWWB0x1HbddyjxlhDZ/0kmwvXJCi+/q4FUbSKyCKAJxMq0IYY99cTewgy5Img3+M
 XKKxcYV42cWyXLuZjby0wAzChF3KpvV7D4dHjPYg2HP5NC6VDg+rUiCTiK2nuzFRZ0Ej
 HrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=m+Sqb4KGdCuWUPK1XHg8WBMkrVNPK8kei5cVHcxSXxQ=;
 b=LSd+2xiz8qLKofBYe3ri/aYPrW1E/yveuos2WVX3EvTfsjfnInSZ/tgRDS1q12FS2u
 2NhoqxXXB5YhJdudC9dWlIV3x5ahuvLuASWXnIZ396RmxiAwCmbYZqXRGDn9156Hgq5j
 5ML9iH2Nv9yw0g6V3dhHYNq+nE3Zqc5wmQFTwRm1ZGeUda/FvKkN5HHyQVSHIJ9EuxCz
 FvP9nT0e7BuxSV6feA4OelyyRqojlaiN7RSJ2Z2CZKcLntfsgodkIgW+TYTTKjoYgzjN
 cUZ4V66bsx5eB3msI/Tybk3JU7puaI5kUF4XwDLvwyQepXXxXJBEiwLV7vgzl8Ec8jXr
 DEJw==
X-Gm-Message-State: ACrzQf2mS8UeaKaHB2IefcpToT7BdaIK0B2Xd8dzEifzE18noNvjfjfk
 q8oODi3KhxCvxC28dsDK6NyjKDjXC7Hq1w==
X-Google-Smtp-Source: AMsMyM5qEI9c/PGRslrDgB8thZYv0Wb9l62Vroc4ofNH3agQmLYicsMv8RgD8Itbp0wUq3r04DB8Tg==
X-Received: by 2002:a05:6214:3011:b0:4ad:82d6:d579 with SMTP id
 ke17-20020a056214301100b004ad82d6d579mr8670464qvb.37.1664573203068; 
 Fri, 30 Sep 2022 14:26:43 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:26:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org, alex.bennee@linux.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 07/18] accel/tcg: Introduce probe_access_full
Date: Fri, 30 Sep 2022 14:26:11 -0700
Message-Id: <20220930212622.108363-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an interface to return the CPUTLBEntryFull struct
that goes with the lookup.  The result is not intended
to be valid across multiple lookups, so the user must
use the results immediately.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 15 +++++++++++++
 accel/tcg/cputlb.c      | 47 +++++++++++++++++++++++++----------------
 2 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index bcad607c4e..d255d69bc1 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -434,6 +434,21 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr);
 
+#ifndef CONFIG_USER_ONLY
+/**
+ * probe_access_full:
+ * Like probe_access_flags, except also return into @pfull.
+ *
+ * The CPUTLBEntryFull structure returned via @pfull is transient
+ * and must be consumed or copied immediately, before any further
+ * access or changes to TLB @mmu_idx.
+ */
+int probe_access_full(CPUArchState *env, target_ulong addr,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool nonfault, void **phost,
+                      CPUTLBEntryFull **pfull, uintptr_t retaddr);
+#endif
+
 #define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
 
 /* Estimated block size for TB allocation.  */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 264f84a248..e3ee4260bd 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1510,7 +1510,8 @@ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
 static int probe_access_internal(CPUArchState *env, target_ulong addr,
                                  int fault_size, MMUAccessType access_type,
                                  int mmu_idx, bool nonfault,
-                                 void **phost, uintptr_t retaddr)
+                                 void **phost, CPUTLBEntryFull **pfull,
+                                 uintptr_t retaddr)
 {
     uintptr_t index = tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
@@ -1543,10 +1544,12 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
                                            mmu_idx, nonfault, retaddr)) {
                 /* Non-faulting page table read failed.  */
                 *phost = NULL;
+                *pfull = NULL;
                 return TLB_INVALID_MASK;
             }
 
             /* TLB resize via tlb_fill may have moved the entry.  */
+            index = tlb_index(env, mmu_idx, addr);
             entry = tlb_entry(env, mmu_idx, addr);
 
             /*
@@ -1560,6 +1563,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     }
     flags &= tlb_addr;
 
+    *pfull = &env_tlb(env)->d[mmu_idx].fulltlb[index];
+
     /* Fold all "mmio-like" bits into TLB_MMIO.  This is not RAM.  */
     if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))) {
         *phost = NULL;
@@ -1571,37 +1576,44 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     return flags;
 }
 
-int probe_access_flags(CPUArchState *env, target_ulong addr,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool nonfault, void **phost, uintptr_t retaddr)
+int probe_access_full(CPUArchState *env, target_ulong addr,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool nonfault, void **phost, CPUTLBEntryFull **pfull,
+                      uintptr_t retaddr)
 {
-    int flags;
-
-    flags = probe_access_internal(env, addr, 0, access_type, mmu_idx,
-                                  nonfault, phost, retaddr);
+    int flags = probe_access_internal(env, addr, 0, access_type, mmu_idx,
+                                      nonfault, phost, pfull, retaddr);
 
     /* Handle clean RAM pages.  */
     if (unlikely(flags & TLB_NOTDIRTY)) {
-        uintptr_t index = tlb_index(env, mmu_idx, addr);
-        CPUTLBEntryFull *full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
-
-        notdirty_write(env_cpu(env), addr, 1, full, retaddr);
+        notdirty_write(env_cpu(env), addr, 1, *pfull, retaddr);
         flags &= ~TLB_NOTDIRTY;
     }
 
     return flags;
 }
 
+int probe_access_flags(CPUArchState *env, target_ulong addr,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool nonfault, void **phost, uintptr_t retaddr)
+{
+    CPUTLBEntryFull *full;
+
+    return probe_access_full(env, addr, access_type, mmu_idx,
+                             nonfault, phost, &full, retaddr);
+}
+
 void *probe_access(CPUArchState *env, target_ulong addr, int size,
                    MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
 {
+    CPUTLBEntryFull *full;
     void *host;
     int flags;
 
     g_assert(-(addr | TARGET_PAGE_MASK) >= size);
 
     flags = probe_access_internal(env, addr, size, access_type, mmu_idx,
-                                  false, &host, retaddr);
+                                  false, &host, &full, retaddr);
 
     /* Per the interface, size == 0 merely faults the access. */
     if (size == 0) {
@@ -1609,9 +1621,6 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     }
 
     if (unlikely(flags & (TLB_NOTDIRTY | TLB_WATCHPOINT))) {
-        uintptr_t index = tlb_index(env, mmu_idx, addr);
-        CPUTLBEntryFull *full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
-
         /* Handle watchpoints.  */
         if (flags & TLB_WATCHPOINT) {
             int wp_access = (access_type == MMU_DATA_STORE
@@ -1632,11 +1641,12 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
                         MMUAccessType access_type, int mmu_idx)
 {
+    CPUTLBEntryFull *full;
     void *host;
     int flags;
 
     flags = probe_access_internal(env, addr, 0, access_type,
-                                  mmu_idx, true, &host, 0);
+                                  mmu_idx, true, &host, &full, 0);
 
     /* No combination of flags are expected by the caller. */
     return flags ? NULL : host;
@@ -1655,10 +1665,11 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
 tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
                                         void **hostp)
 {
+    CPUTLBEntryFull *full;
     void *p;
 
     (void)probe_access_internal(env, addr, 1, MMU_INST_FETCH,
-                                cpu_mmu_index(env, true), false, &p, 0);
+                                cpu_mmu_index(env, true), false, &p, &full, 0);
     if (p == NULL) {
         return -1;
     }
-- 
2.34.1



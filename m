Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E182959CCEB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:12:42 +0200 (CEST)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHX7-0002pW-MZ
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ5-00041X-Mp
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:12 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ3-0002i6-O4
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:11 -0400
Received: by mail-pg1-x535.google.com with SMTP id s206so10821921pgs.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=sLuofTzD3XcbGEKkxECtfxPk5kwjXiJfOftJpAZ8w/Y=;
 b=hAa8ivhgN+/i5/MZdVNkeN2NCPvYkGAZMnrMzSjUOJTJKukvK6k0m7/0nDHpuuTNsG
 iom57IljShYppRYRkcfbWqv4C1aYIL1Dlo05hrXtA1GrQ9HhSvoAoFaFEkDxnh4A/t22
 mBmo0oY/h/dBvSMh66Fqe7RJV6jBl3mPXXxO9OfZWnDJO/8t+ldbb4bq9b2w4awwSPHu
 ArgsbMC6u2H3cECie46E6/bpkQMQZnh0FbHp35kqpIyReA4flRpjH9WHG2/TtkOPRNbg
 HhGsXYyJUkLwNUUzpfEqADuLLlPPUnnTcYUzdMEc/P1B7oyl7kl4l019flsuaSlu92uP
 rYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=sLuofTzD3XcbGEKkxECtfxPk5kwjXiJfOftJpAZ8w/Y=;
 b=2+OtPcs3KpVc7tSfghZsMCMp88LTm1eX1dsXGe9ZDeai/OcJIltFoUM4C0YKO1SHbI
 huHFa57Dd+UO67LuFKTqEXUUu6OC/Dgfj3vXKqmb1hdbpcGQSBbq0cH5YsL2sq0txh0H
 VKFR8X7giIPyoEsFGxOYpQKf/nFGDJiPQ+wygLjkyP+wvQyvAlz2MWsIDT03YXOSydOq
 oXv1UbLZMD7TLEOa8dowxNB6q2VLpBJqDDXwQpiRcvdYTNJAi+RLY3cQ8LNuGTYVdRpe
 eNK2VE3jfyiJE9FCPPdjqMCtKkRBAC+2Qac+/BsACf8uuNNHhXKXSs5sG/MNs7SrwCSr
 Wwvg==
X-Gm-Message-State: ACgBeo2sUe/ialgq7ElhNn/Pa/0A0zS8jmHLWDG/WLRcQ5II3+zBlHk9
 gxt1b+HD9DKT3RxllGIXjz2Gw06MgJnUXw==
X-Google-Smtp-Source: AA6agR5k98GaeVpM07I8MId7P2NfF7/3/fyMoiYNAr7M5Ctr6VjEc4crQUGqs5rComL9zu3I2zNW/Q==
X-Received: by 2002:a63:d609:0:b0:42a:8bfc:6578 with SMTP id
 q9-20020a63d609000000b0042a8bfc6578mr9330870pgg.119.1661212688336; 
 Mon, 22 Aug 2022 16:58:08 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 w190-20020a6230c7000000b0052d52de6726sm9173159pfw.124.2022.08.22.16.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:58:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH 04/14] accel/tcg: Introduce probe_access_full
Date: Mon, 22 Aug 2022 16:57:53 -0700
Message-Id: <20220822235803.1729290-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822235803.1729290-1-richard.henderson@linaro.org>
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 11 +++++++++++
 accel/tcg/cputlb.c      | 44 +++++++++++++++++++++++++----------------
 2 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 311e5fb422..e366b5c1ba 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -435,6 +435,17 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr);
 
+#ifndef CONFIG_USER_ONLY
+/**
+ * probe_access_full:
+ * Like probe_access_flags, except also return into @pfull.
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
index 5359113e8d..1c59e701e6 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1579,7 +1579,8 @@ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
 static int probe_access_internal(CPUArchState *env, target_ulong addr,
                                  int fault_size, MMUAccessType access_type,
                                  int mmu_idx, bool nonfault,
-                                 void **phost, uintptr_t retaddr)
+                                 void **phost, CPUTLBEntryFull **pfull,
+                                 uintptr_t retaddr)
 {
     uintptr_t index = tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
@@ -1613,10 +1614,12 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
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
@@ -1630,6 +1633,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     }
     flags &= tlb_addr;
 
+    *pfull = &env_tlb(env)->d[mmu_idx].fulltlb[index];
+
     /* Fold all "mmio-like" bits into TLB_MMIO.  This is not RAM.  */
     if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))) {
         *phost = NULL;
@@ -1641,37 +1646,44 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
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
@@ -1679,9 +1691,6 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     }
 
     if (unlikely(flags & (TLB_NOTDIRTY | TLB_WATCHPOINT))) {
-        uintptr_t index = tlb_index(env, mmu_idx, addr);
-        CPUTLBEntryFull *full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
-
         /* Handle watchpoints.  */
         if (flags & TLB_WATCHPOINT) {
             int wp_access = (access_type == MMU_DATA_STORE
@@ -1702,11 +1711,12 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
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
-- 
2.34.1



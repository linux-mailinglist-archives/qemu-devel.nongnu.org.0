Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6230959C5C9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:11:13 +0200 (CEST)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBtI-00051H-7B
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Of-0004dQ-S7
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:28 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:37385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Od-0001ad-P6
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:25 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x15so9783310pfp.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=sLuofTzD3XcbGEKkxECtfxPk5kwjXiJfOftJpAZ8w/Y=;
 b=eY0jKCOi/0F6BnqLwWgsFl7dY2JIWefv5PgviFwo07jZhw+hnX20H9bXyBAC5UA/ig
 kKqEdmzo1xAbUH4IVm8+LQv2aKFx9WGImc0BPF4KBvzdL0jhUwk+ipCPfORK8N/uFfi4
 JuFRH/XZFyLDaLpxn89ej8tPGbAGg3GGE7czY5IkX0AwVuVg/1nRIk8DB+/fmccEK2PJ
 CZmVkFrQvExevpBD4lnUwOGkYzT1uySJrF0he/G7Movr38iY0jsf6SNqPFEluAHMNJ6c
 JMqTOgu61bHKsWtr7iKqVKSu0LemQvPkYLdw6vvCdnU7BDuQMIrv/7zgA103bpY8hXuc
 iDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=sLuofTzD3XcbGEKkxECtfxPk5kwjXiJfOftJpAZ8w/Y=;
 b=DGYUqAyJbSsJjHsf2xaFoWXtbb/IrzIFMFbOS363jWJBgUOGrv16moYhkyXOydsDoK
 He7yoA8aVG2cPWrx9b14tfoheS87sbWwMfyNs95NN8GJspNgqlTPpbwEp3J6Vt37t42m
 TY0PVgSNBpfHTYB4SwLpUbFz5JNS3CtAk+1kCh0QHfaSr9yX60CDemdqnT0b9DtWPQyl
 L1owfOfbVubsBPGg6iFLJEB3ouvDBkdzb6XghN1P4cGUWtFnqGR1501pLTNgez+Nx4Dc
 5WWIOhLnOK52PCHekRaX+civiDEd9t0fSutNbflFfoAyJq7bhw+yWojgu6uNAlVNS29A
 K4mQ==
X-Gm-Message-State: ACgBeo3BD2WnLeWp3cwgCHcW73JEJM3TYF3MaDQRFU4lmpOdxSqa+drU
 NdjHhVMOc0Bbgi+/trBuCGw2M+Qvy/LHaQ==
X-Google-Smtp-Source: AA6agR6czH8Mft8TafQKJto6R+8+b33d5nN6xsUeqQ+urCIJ8iR5NrrXVzuoTZ+S0FdoSrscqBl0fw==
X-Received: by 2002:a05:6a00:1a49:b0:52d:4ad7:3bea with SMTP id
 h9-20020a056a001a4900b0052d4ad73beamr21749452pfv.66.1661182279316; 
 Mon, 22 Aug 2022 08:31:19 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 40/66] accel/tcg: Introduce probe_access_full
Date: Mon, 22 Aug 2022 08:27:15 -0700
Message-Id: <20220822152741.1617527-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



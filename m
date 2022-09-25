Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2089F5E923C
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:01:52 +0200 (CEST)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPOR-0005Cy-6p
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEh-0002T0-NN
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:47 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:43548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEf-0000KF-SY
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:47 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id s13so2772370qvq.10
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=sxOCnY//6BiHGHXJRUAoV3+rYxvxr+ZbnS0O7fJsJKI=;
 b=fFhvnfK95hTxsL9MAtv4/JrvHnpIPUjaWYZSAHPRu/LcfTSh9szGafR0jU+8dgekGG
 hVHoQc2w4YNGPHpJeKKhdEwA7ei5ZXt9TVPf4Cn5pJS+PsxxjNK03P98JrISVRohSJUu
 nssUHSTt8Q/bmYvWwm2W8wOp2bbYtzMd7LVgiAbRwLGjDgxkI5qr6TKyqPxLSp/Jdr4u
 nIbcr/AnMj1ngmrxmu7V2RhZxrB2Q53GRYVYrTonkIEanNMBv/dCi/QBRyFK1H6H48GT
 AU+AVwvXaghe6i4PrTWTwYeFPbrBDlNc++GLDr8INV52wtbhmTVwApd4s5uBSC3KSYZg
 f9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sxOCnY//6BiHGHXJRUAoV3+rYxvxr+ZbnS0O7fJsJKI=;
 b=I89afiRclMLeXaTYb9781AsUmB/V16vUs/HKk1hHbb5hBxx7aUX0ErW8q+iNifBmDP
 YEpsTW92w3HYHBUvlde8irvUHZOxbpL7pFKQfqzjhLXNyaCw4BkBcheE7auCEQQ2BAvK
 WFs2zvvbFitZbitxwggV4g/1bTdtf2rYKhvuggAjVhAPMuIVPWqcOn9ZQLgbf1yaB422
 YhIDysFalmnkxD2wR2BjxfEaoB/2oLKLwLvvcF0AJko45vS20W0mvFzSZpMJe+2odAgC
 uoI/x4ELSitqwXOf7SprSbVviAJAymAw75WqiHPBF+1qLcUJWTXcHViTUf7M+LNPD4Gv
 8ddQ==
X-Gm-Message-State: ACrzQf0VKbaACRDbt/BXWcDJ/VpdtO/rsQHQxExRYxdEEajGzmbeTEtd
 Z1GmHLC8R201F+p1zt+7aIKfSCwuSaZtgg==
X-Google-Smtp-Source: AMsMyM4qc+ka5qEXdaSYMucLRY81RdeokAfVo+R/dEOMItKTDy3fKfpgUw6dGcKWRHRPnCLiNQUVkg==
X-Received: by 2002:a05:6214:29c6:b0:473:8062:b1b4 with SMTP id
 gh6-20020a05621429c600b004738062b1b4mr12294168qvb.85.1664103105152; 
 Sun, 25 Sep 2022 03:51:45 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:51:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 04/17] accel/tcg: Introduce probe_access_full
Date: Sun, 25 Sep 2022 10:51:11 +0000
Message-Id: <20220925105124.82033-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 11 ++++++++++
 accel/tcg/cputlb.c      | 47 +++++++++++++++++++++++++----------------
 2 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index bcad607c4e..758cf6bcc7 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -434,6 +434,17 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
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
index 91f2b53142..62159549f6 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1512,7 +1512,8 @@ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
 static int probe_access_internal(CPUArchState *env, target_ulong addr,
                                  int fault_size, MMUAccessType access_type,
                                  int mmu_idx, bool nonfault,
-                                 void **phost, uintptr_t retaddr)
+                                 void **phost, CPUTLBEntryFull **pfull,
+                                 uintptr_t retaddr)
 {
     uintptr_t index = tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
@@ -1546,10 +1547,12 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
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
@@ -1563,6 +1566,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     }
     flags &= tlb_addr;
 
+    *pfull = &env_tlb(env)->d[mmu_idx].fulltlb[index];
+
     /* Fold all "mmio-like" bits into TLB_MMIO.  This is not RAM.  */
     if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))) {
         *phost = NULL;
@@ -1574,37 +1579,44 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
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
@@ -1612,9 +1624,6 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     }
 
     if (unlikely(flags & (TLB_NOTDIRTY | TLB_WATCHPOINT))) {
-        uintptr_t index = tlb_index(env, mmu_idx, addr);
-        CPUTLBEntryFull *full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
-
         /* Handle watchpoints.  */
         if (flags & TLB_WATCHPOINT) {
             int wp_access = (access_type == MMU_DATA_STORE
@@ -1635,11 +1644,12 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
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
@@ -1658,10 +1668,11 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
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



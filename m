Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F031CE04
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:29:17 +0100 (CET)
Received: from localhost ([::1]:60444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3Dx-00054i-0e
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32d-0007a2-DY
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:35 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32E-0002OW-Jj
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:35 -0500
Received: by mail-wr1-x435.google.com with SMTP id r21so13740194wrr.9
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kbRIvgMCJv2MfoVwhR7j8Y+Gi0EkYODCYNxvSWd9s0w=;
 b=j+WTSDuXJyPdTAPlDpHgM9rfOB3HJ5lpEXUsFR6dMl9ua64HIV5vTpg/9fX9BDX0qs
 o9Rg1EWbbXLamDmV9ICx4K+Z1XGBtllyuDufFYJspdhN8TvHOEvBC0J/kUUqFJ1kmuZ0
 wXK6DW2quozbJBt2d1U31EVbNDF3bcsL7RMdH1VOxU0n1i9VPL+eTxwLiiVJ4AcUGqjV
 wCNPq7DyzHy0fGUULqs+BDfnIpiAxNwHLvUkA78e9xdIMkQbB5ghD+hgjFOCUwS/e0C0
 KAu2hy3e5eKeAbnpUQxbLJ6+h1Hm6qak7XfPYyKNGRWiHI1mv2F0ueyqrt/SkX9NH1xl
 0rcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kbRIvgMCJv2MfoVwhR7j8Y+Gi0EkYODCYNxvSWd9s0w=;
 b=jFTydcoGiUz42DpSTm5sb71HU46yGu0XL0tyhww7sDOfxDYVrEBGG+BZTCNOMxK+jf
 rSt8Sx0/f/5FvoR5xOwy25bTGHuyeBBPvJXkHKodkS7AIrsN/cZFn4Uj1+JEMRnn9iKq
 SZxE1soPiEM0/DUrv6Y7KlfMeqpxa7VL9T8PLCxdCrtXsX2iSubcXJiB0VCd+eIPT829
 ffIxX7tcmT9OsUkm2bNxbQL2om4d8JNliTAyKsBzkZILoGcczlok4YSS7CB5vIaLGRpj
 SLaZ1FLodVh/lmUY1qBSYxF0TwP/YKzPJRZZPUqIt7vQTjgxT89SjNTiaY+85EhSTZnk
 QCdA==
X-Gm-Message-State: AOAM531OV3qbkhnQo4GHD2Gr4FrbbOrGVsMo+T9mi4uMA0BKJNAn09cy
 kmLF6ufeX8l4j9d1xBBGNeaIho22fYqFYA==
X-Google-Smtp-Source: ABdhPJyZVJs0+Zy1OrhGnDmOwiBTYO0/M+AoFCa0Ff6U4liI088qY6IhVPSohewW8IEjTAbHlkzSww==
X-Received: by 2002:a05:6000:4e:: with SMTP id
 k14mr24356764wrx.281.1613492228921; 
 Tue, 16 Feb 2021 08:17:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/40] exec: Use cpu_untagged_addr in g2h;
 split out g2h_untagged
Date: Tue, 16 Feb 2021 16:16:30 +0000
Message-Id: <20210216161658.29881-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use g2h_untagged in contexts that have no cpu, e.g. the binary
loaders that operate before the primary cpu is created.  As a
colollary, target_mmap and friends must use untagged addresses,
since they are used by the loaders.

Use g2h_untagged on values returned from target_mmap, as the
kernel never applies a tag itself.

Use g2h_untagged on all pc values.  The only current user of
tags, aarch64, removes tags from code addresses upon branch,
so "pc" is always untagged.

Use g2h with the cpu context on hand wherever possible.

Use g2h_untagged in lock_user, which will be updated soon.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 bsd-user/qemu.h              |  8 ++--
 include/exec/cpu_ldst.h      | 12 +++++-
 include/exec/exec-all.h      |  2 +-
 linux-user/qemu.h            |  6 +--
 accel/tcg/translate-all.c    |  4 +-
 accel/tcg/user-exec.c        | 48 ++++++++++++------------
 bsd-user/elfload.c           |  2 +-
 bsd-user/main.c              |  4 +-
 bsd-user/mmap.c              | 23 ++++++------
 linux-user/elfload.c         | 12 +++---
 linux-user/flatload.c        |  2 +-
 linux-user/hppa/cpu_loop.c   | 31 ++++++++--------
 linux-user/i386/cpu_loop.c   |  4 +-
 linux-user/mmap.c            | 45 +++++++++++-----------
 linux-user/ppc/signal.c      |  4 +-
 linux-user/syscall.c         | 72 +++++++++++++++++++-----------------
 target/arm/helper-a64.c      |  4 +-
 target/hppa/op_helper.c      |  2 +-
 target/i386/tcg/mem_helper.c |  2 +-
 target/s390x/mem_helper.c    |  4 +-
 20 files changed, 154 insertions(+), 137 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 4076adabd08..d2bcaab7413 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -356,13 +356,13 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
         void *addr;
         addr = g_malloc(len);
         if (copy)
-            memcpy(addr, g2h(guest_addr), len);
+            memcpy(addr, g2h_untagged(guest_addr), len);
         else
             memset(addr, 0, len);
         return addr;
     }
 #else
-    return g2h(guest_addr);
+    return g2h_untagged(guest_addr);
 #endif
 }
 
@@ -376,10 +376,10 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
 #ifdef DEBUG_REMAP
     if (!host_ptr)
         return;
-    if (host_ptr == g2h(guest_addr))
+    if (host_ptr == g2h_untagged(guest_addr))
         return;
     if (len > 0)
-        memcpy(g2h(guest_addr), host_ptr, len);
+        memcpy(g2h_untagged(guest_addr), host_ptr, len);
     g_free(host_ptr);
 #endif
 }
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index d9dc1de414a..c54069e3cd0 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -77,7 +77,15 @@ static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
 #endif
 
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
-#define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
+static inline void *g2h_untagged(abi_ptr x)
+{
+    return (void *)((uintptr_t)(x) + guest_base);
+}
+
+static inline void *g2h(CPUState *cs, abi_ptr x)
+{
+    return g2h_untagged(cpu_untagged_addr(cs, x));
+}
 
 static inline bool guest_addr_valid(abi_ulong x)
 {
@@ -448,7 +456,7 @@ static inline int cpu_ldsw_code(CPUArchState *env, abi_ptr addr)
 static inline void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
                                       MMUAccessType access_type, int mmu_idx)
 {
-    return g2h(addr);
+    return g2h(env_cpu(env), addr);
 }
 #else
 void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index f933c74c446..d30c7a84f6a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -616,7 +616,7 @@ static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
                                                       void **hostp)
 {
     if (hostp) {
-        *hostp = g2h(addr);
+        *hostp = g2h_untagged(addr);
     }
     return addr;
 }
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 9251337daf2..9fbc5edc4bd 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -652,7 +652,7 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
         return addr;
     }
 #else
-    return g2h(guest_addr);
+    return g2h_untagged(guest_addr);
 #endif
 }
 
@@ -666,10 +666,10 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
 #ifdef DEBUG_REMAP
     if (!host_ptr)
         return;
-    if (host_ptr == g2h(guest_addr))
+    if (host_ptr == g2h_untagged(guest_addr))
         return;
     if (len > 0)
-        memcpy(g2h(guest_addr), host_ptr, len);
+        memcpy(g2h_untagged(guest_addr), host_ptr, len);
     g_free(host_ptr);
 #endif
 }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bba9c8e0b3e..2c34adccce5 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1762,7 +1762,7 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
             prot |= p2->flags;
             p2->flags &= ~PAGE_WRITE;
           }
-        mprotect(g2h(page_addr), qemu_host_page_size,
+        mprotect(g2h_untagged(page_addr), qemu_host_page_size,
                  (prot & PAGE_BITS) & ~PAGE_WRITE);
         if (DEBUG_TB_INVALIDATE_GATE) {
             printf("protecting code page: 0x" TB_PAGE_ADDR_FMT "\n", page_addr);
@@ -2912,7 +2912,7 @@ int page_unprotect(target_ulong address, uintptr_t pc)
                 }
 #endif
             }
-            mprotect((void *)g2h(host_start), qemu_host_page_size,
+            mprotect((void *)g2h_untagged(host_start), qemu_host_page_size,
                      prot & PAGE_BITS);
         }
         mmap_unlock();
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 0b6f56ca407..fa1847b2a61 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -234,7 +234,7 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
     int flags;
 
     flags = probe_access_internal(env, addr, 0, access_type, nonfault, ra);
-    *phost = flags ? NULL : g2h(addr);
+    *phost = flags ? NULL : g2h(env_cpu(env), addr);
     return flags;
 }
 
@@ -247,7 +247,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     flags = probe_access_internal(env, addr, size, access_type, false, ra);
     g_assert(flags == 0);
 
-    return size ? g2h(addr) : NULL;
+    return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
 #if defined(__i386__)
@@ -842,7 +842,7 @@ uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_UB, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldub_p(g2h(ptr));
+    ret = ldub_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
@@ -853,7 +853,7 @@ int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_SB, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldsb_p(g2h(ptr));
+    ret = ldsb_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
@@ -864,7 +864,7 @@ uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_BEUW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = lduw_be_p(g2h(ptr));
+    ret = lduw_be_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
@@ -875,7 +875,7 @@ int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_BESW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldsw_be_p(g2h(ptr));
+    ret = ldsw_be_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
@@ -886,7 +886,7 @@ uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_BEUL, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldl_be_p(g2h(ptr));
+    ret = ldl_be_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
@@ -897,7 +897,7 @@ uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_BEQ, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldq_be_p(g2h(ptr));
+    ret = ldq_be_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
@@ -908,7 +908,7 @@ uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_LEUW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = lduw_le_p(g2h(ptr));
+    ret = lduw_le_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
@@ -919,7 +919,7 @@ int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_LESW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldsw_le_p(g2h(ptr));
+    ret = ldsw_le_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
@@ -930,7 +930,7 @@ uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_LEUL, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldl_le_p(g2h(ptr));
+    ret = ldl_le_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
@@ -941,7 +941,7 @@ uint64_t cpu_ldq_le_data(CPUArchState *env, abi_ptr ptr)
     uint16_t meminfo = trace_mem_get_info(MO_LEQ, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    ret = ldq_le_p(g2h(ptr));
+    ret = ldq_le_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
     return ret;
 }
@@ -1051,7 +1051,7 @@ void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
     uint16_t meminfo = trace_mem_get_info(MO_UB, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    stb_p(g2h(ptr), val);
+    stb_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
 
@@ -1060,7 +1060,7 @@ void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
     uint16_t meminfo = trace_mem_get_info(MO_BEUW, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    stw_be_p(g2h(ptr), val);
+    stw_be_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
 
@@ -1069,7 +1069,7 @@ void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
     uint16_t meminfo = trace_mem_get_info(MO_BEUL, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    stl_be_p(g2h(ptr), val);
+    stl_be_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
 
@@ -1078,7 +1078,7 @@ void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
     uint16_t meminfo = trace_mem_get_info(MO_BEQ, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    stq_be_p(g2h(ptr), val);
+    stq_be_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
 
@@ -1087,7 +1087,7 @@ void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
     uint16_t meminfo = trace_mem_get_info(MO_LEUW, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    stw_le_p(g2h(ptr), val);
+    stw_le_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
 
@@ -1096,7 +1096,7 @@ void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
     uint16_t meminfo = trace_mem_get_info(MO_LEUL, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    stl_le_p(g2h(ptr), val);
+    stl_le_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
 
@@ -1105,7 +1105,7 @@ void cpu_stq_le_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
     uint16_t meminfo = trace_mem_get_info(MO_LEQ, MMU_USER_IDX, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
-    stq_le_p(g2h(ptr), val);
+    stq_le_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
 }
 
@@ -1170,7 +1170,7 @@ uint32_t cpu_ldub_code(CPUArchState *env, abi_ptr ptr)
     uint32_t ret;
 
     set_helper_retaddr(1);
-    ret = ldub_p(g2h(ptr));
+    ret = ldub_p(g2h_untagged(ptr));
     clear_helper_retaddr();
     return ret;
 }
@@ -1180,7 +1180,7 @@ uint32_t cpu_lduw_code(CPUArchState *env, abi_ptr ptr)
     uint32_t ret;
 
     set_helper_retaddr(1);
-    ret = lduw_p(g2h(ptr));
+    ret = lduw_p(g2h_untagged(ptr));
     clear_helper_retaddr();
     return ret;
 }
@@ -1190,7 +1190,7 @@ uint32_t cpu_ldl_code(CPUArchState *env, abi_ptr ptr)
     uint32_t ret;
 
     set_helper_retaddr(1);
-    ret = ldl_p(g2h(ptr));
+    ret = ldl_p(g2h_untagged(ptr));
     clear_helper_retaddr();
     return ret;
 }
@@ -1200,7 +1200,7 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr ptr)
     uint64_t ret;
 
     set_helper_retaddr(1);
-    ret = ldq_p(g2h(ptr));
+    ret = ldq_p(g2h_untagged(ptr));
     clear_helper_retaddr();
     return ret;
 }
@@ -1213,7 +1213,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     if (unlikely(addr & (size - 1))) {
         cpu_loop_exit_atomic(env_cpu(env), retaddr);
     }
-    void *ret = g2h(addr);
+    void *ret = g2h(env_cpu(env), addr);
     set_helper_retaddr(retaddr);
     return ret;
 }
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 32378af7b2e..5f4d824d78f 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -737,7 +737,7 @@ static void padzero(abi_ulong elf_bss, abi_ulong last_bss)
             end_addr1 = REAL_HOST_PAGE_ALIGN(elf_bss);
             end_addr = HOST_PAGE_ALIGN(elf_bss);
             if (end_addr1 < end_addr) {
-                mmap((void *)g2h(end_addr1), end_addr - end_addr1,
+                mmap((void *)g2h_untagged(end_addr1), end_addr - end_addr1,
                      PROT_READ|PROT_WRITE|PROT_EXEC,
                      MAP_FIXED|MAP_PRIVATE|MAP_ANON, -1, 0);
             }
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 385d35886a0..798aba512c1 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -1055,7 +1055,7 @@ int main(int argc, char **argv)
     env->idt.base = target_mmap(0, sizeof(uint64_t) * (env->idt.limit + 1),
                                 PROT_READ|PROT_WRITE,
                                 MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
-    idt_table = g2h(env->idt.base);
+    idt_table = g2h_untagged(env->idt.base);
     set_idt(0, 0);
     set_idt(1, 0);
     set_idt(2, 0);
@@ -1085,7 +1085,7 @@ int main(int argc, char **argv)
                                     PROT_READ|PROT_WRITE,
                                     MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
         env->gdt.limit = sizeof(uint64_t) * TARGET_GDT_ENTRIES - 1;
-        gdt_table = g2h(env->gdt.base);
+        gdt_table = g2h_untagged(env->gdt.base);
 #ifdef TARGET_ABI32
         write_dt(&gdt_table[__USER_CS >> 3], 0, 0xfffff,
                  DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 17f4cd80aa1..01ec8080038 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -102,7 +102,8 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
             }
             end = host_end;
         }
-        ret = mprotect(g2h(host_start), qemu_host_page_size, prot1 & PAGE_BITS);
+        ret = mprotect(g2h_untagged(host_start),
+                       qemu_host_page_size, prot1 & PAGE_BITS);
         if (ret != 0)
             goto error;
         host_start += qemu_host_page_size;
@@ -112,8 +113,8 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
         for(addr = end; addr < host_end; addr += TARGET_PAGE_SIZE) {
             prot1 |= page_get_flags(addr);
         }
-        ret = mprotect(g2h(host_end - qemu_host_page_size), qemu_host_page_size,
-                       prot1 & PAGE_BITS);
+        ret = mprotect(g2h_untagged(host_end - qemu_host_page_size),
+                       qemu_host_page_size, prot1 & PAGE_BITS);
         if (ret != 0)
             goto error;
         host_end -= qemu_host_page_size;
@@ -121,7 +122,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
 
     /* handle the pages in the middle */
     if (host_start < host_end) {
-        ret = mprotect(g2h(host_start), host_end - host_start, prot);
+        ret = mprotect(g2h_untagged(host_start), host_end - host_start, prot);
         if (ret != 0)
             goto error;
     }
@@ -143,7 +144,7 @@ static int mmap_frag(abi_ulong real_start,
     int prot1, prot_new;
 
     real_end = real_start + qemu_host_page_size;
-    host_start = g2h(real_start);
+    host_start = g2h_untagged(real_start);
 
     /* get the protection of the target pages outside the mapping */
     prot1 = 0;
@@ -175,7 +176,7 @@ static int mmap_frag(abi_ulong real_start,
             mprotect(host_start, qemu_host_page_size, prot1 | PROT_WRITE);
 
         /* read the corresponding file data */
-        pread(fd, g2h(start), end - start, offset);
+        pread(fd, g2h_untagged(start), end - start, offset);
 
         /* put final protection */
         if (prot_new != (prot1 | PROT_WRITE))
@@ -300,7 +301,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         /* Note: we prefer to control the mapping address. It is
            especially important if qemu_host_page_size >
            qemu_real_host_page_size */
-        p = mmap(g2h(mmap_start),
+        p = mmap(g2h_untagged(mmap_start),
                  host_len, prot, flags | MAP_FIXED, fd, host_offset);
         if (p == MAP_FAILED)
             goto fail;
@@ -344,7 +345,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                                   -1, 0);
             if (retaddr == -1)
                 goto fail;
-            pread(fd, g2h(start), len, offset);
+            pread(fd, g2h_untagged(start), len, offset);
             if (!(prot & PROT_WRITE)) {
                 ret = target_mprotect(start, len, prot);
                 if (ret != 0) {
@@ -390,7 +391,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                 offset1 = 0;
             else
                 offset1 = offset + real_start - start;
-            p = mmap(g2h(real_start), real_end - real_start,
+            p = mmap(g2h_untagged(real_start), real_end - real_start,
                      prot, flags, fd, offset1);
             if (p == MAP_FAILED)
                 goto fail;
@@ -456,7 +457,7 @@ int target_munmap(abi_ulong start, abi_ulong len)
     ret = 0;
     /* unmap what we can */
     if (real_start < real_end) {
-        ret = munmap(g2h(real_start), real_end - real_start);
+        ret = munmap(g2h_untagged(real_start), real_end - real_start);
     }
 
     if (ret == 0)
@@ -479,5 +480,5 @@ int target_msync(abi_ulong start, abi_ulong len, int flags)
         return 0;
 
     start &= qemu_host_page_mask;
-    return msync(g2h(start), end - start, flags);
+    return msync(g2h_untagged(start), end - start, flags);
 }
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 7ec9249c256..902be3ff117 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -389,7 +389,7 @@ enum {
 
 static bool init_guest_commpage(void)
 {
-    void *want = g2h(ARM_COMMPAGE & -qemu_host_page_size);
+    void *want = g2h_untagged(ARM_COMMPAGE & -qemu_host_page_size);
     void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
                       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
 
@@ -402,7 +402,7 @@ static bool init_guest_commpage(void)
     }
 
     /* Set kernel helper versions; rest of page is 0.  */
-    __put_user(5, (uint32_t *)g2h(0xffff0ffcu));
+    __put_user(5, (uint32_t *)g2h_untagged(0xffff0ffcu));
 
     if (mprotect(addr, qemu_host_page_size, PROT_READ)) {
         perror("Protecting guest commpage");
@@ -1872,8 +1872,8 @@ static void zero_bss(abi_ulong elf_bss, abi_ulong last_bss, int prot)
        here is still actually needed.  For now, continue with it,
        but merge it with the "normal" mmap that would allocate the bss.  */
 
-    host_start = (uintptr_t) g2h(elf_bss);
-    host_end = (uintptr_t) g2h(last_bss);
+    host_start = (uintptr_t) g2h_untagged(elf_bss);
+    host_end = (uintptr_t) g2h_untagged(last_bss);
     host_map_start = REAL_HOST_PAGE_ALIGN(host_start);
 
     if (host_map_start < host_end) {
@@ -2171,7 +2171,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
     }
 
     /* Reserve the address space for the binary, or reserved_va. */
-    test = g2h(guest_loaddr);
+    test = g2h_untagged(guest_loaddr);
     addr = mmap(test, guest_hiaddr - guest_loaddr, PROT_NONE, flags, -1, 0);
     if (test != addr) {
         pgb_fail_in_use(image_name);
@@ -2393,7 +2393,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
 
     /* Reserve the memory on the host. */
     assert(guest_base != 0);
-    test = g2h(0);
+    test = g2h_untagged(0);
     addr = mmap(test, reserved_va, PROT_NONE, flags, -1, 0);
     if (addr == MAP_FAILED || addr != test) {
         error_report("Unable to reserve 0x%lx bytes of virtual address "
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 14d2999d153..3e5594cf894 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -668,7 +668,7 @@ static int load_flat_file(struct linux_binprm * bprm,
     }
 
     /* zero the BSS.  */
-    memset(g2h(datapos + data_len), 0, bss_len);
+    memset(g2h_untagged(datapos + data_len), 0, bss_len);
 
     return 0;
 }
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index d7e1ec77220..944511bbe43 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -23,6 +23,7 @@
 
 static abi_ulong hppa_lws(CPUHPPAState *env)
 {
+    CPUState *cs = env_cpu(env);
     uint32_t which = env->gr[20];
     abi_ulong addr = env->gr[26];
     abi_ulong old = env->gr[25];
@@ -39,7 +40,7 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
         }
         old = tswap32(old);
         new = tswap32(new);
-        ret = qatomic_cmpxchg((uint32_t *)g2h(addr), old, new);
+        ret = qatomic_cmpxchg((uint32_t *)g2h(cs, addr), old, new);
         ret = tswap32(ret);
         break;
 
@@ -58,38 +59,38 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
            can be host-endian as well.  */
         switch (size) {
         case 0:
-            old = *(uint8_t *)g2h(old);
-            new = *(uint8_t *)g2h(new);
-            ret = qatomic_cmpxchg((uint8_t *)g2h(addr), old, new);
+            old = *(uint8_t *)g2h(cs, old);
+            new = *(uint8_t *)g2h(cs, new);
+            ret = qatomic_cmpxchg((uint8_t *)g2h(cs, addr), old, new);
             ret = ret != old;
             break;
         case 1:
-            old = *(uint16_t *)g2h(old);
-            new = *(uint16_t *)g2h(new);
-            ret = qatomic_cmpxchg((uint16_t *)g2h(addr), old, new);
+            old = *(uint16_t *)g2h(cs, old);
+            new = *(uint16_t *)g2h(cs, new);
+            ret = qatomic_cmpxchg((uint16_t *)g2h(cs, addr), old, new);
             ret = ret != old;
             break;
         case 2:
-            old = *(uint32_t *)g2h(old);
-            new = *(uint32_t *)g2h(new);
-            ret = qatomic_cmpxchg((uint32_t *)g2h(addr), old, new);
+            old = *(uint32_t *)g2h(cs, old);
+            new = *(uint32_t *)g2h(cs, new);
+            ret = qatomic_cmpxchg((uint32_t *)g2h(cs, addr), old, new);
             ret = ret != old;
             break;
         case 3:
             {
                 uint64_t o64, n64, r64;
-                o64 = *(uint64_t *)g2h(old);
-                n64 = *(uint64_t *)g2h(new);
+                o64 = *(uint64_t *)g2h(cs, old);
+                n64 = *(uint64_t *)g2h(cs, new);
 #ifdef CONFIG_ATOMIC64
-                r64 = qatomic_cmpxchg__nocheck((uint64_t *)g2h(addr),
+                r64 = qatomic_cmpxchg__nocheck((uint64_t *)g2h(cs, addr),
                                                o64, n64);
                 ret = r64 != o64;
 #else
                 start_exclusive();
-                r64 = *(uint64_t *)g2h(addr);
+                r64 = *(uint64_t *)g2h(cs, addr);
                 ret = 1;
                 if (r64 == o64) {
-                    *(uint64_t *)g2h(addr) = n64;
+                    *(uint64_t *)g2h(cs, addr) = n64;
                     ret = 0;
                 }
                 end_exclusive();
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 70cde417e60..19c8a18cd30 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -379,7 +379,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     env->idt.base = target_mmap(0, sizeof(uint64_t) * (env->idt.limit + 1),
                                 PROT_READ|PROT_WRITE,
                                 MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
-    idt_table = g2h(env->idt.base);
+    idt_table = g2h_untagged(env->idt.base);
     set_idt(0, 0);
     set_idt(1, 0);
     set_idt(2, 0);
@@ -409,7 +409,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
                                     PROT_READ|PROT_WRITE,
                                     MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
         env->gdt.limit = sizeof(uint64_t) * TARGET_GDT_ENTRIES - 1;
-        gdt_table = g2h(env->gdt.base);
+        gdt_table = g2h_untagged(env->gdt.base);
 #ifdef TARGET_ABI32
         write_dt(&gdt_table[__USER_CS >> 3], 0, 0xfffff,
                  DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index c52b60482e1..6decfec68a9 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -141,7 +141,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
             }
             end = host_end;
         }
-        ret = mprotect(g2h(host_start), qemu_host_page_size,
+        ret = mprotect(g2h_untagged(host_start), qemu_host_page_size,
                        prot1 & PAGE_BITS);
         if (ret != 0) {
             goto error;
@@ -153,7 +153,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
         for (addr = end; addr < host_end; addr += TARGET_PAGE_SIZE) {
             prot1 |= page_get_flags(addr);
         }
-        ret = mprotect(g2h(host_end - qemu_host_page_size),
+        ret = mprotect(g2h_untagged(host_end - qemu_host_page_size),
                        qemu_host_page_size, prot1 & PAGE_BITS);
         if (ret != 0) {
             goto error;
@@ -163,7 +163,8 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
 
     /* handle the pages in the middle */
     if (host_start < host_end) {
-        ret = mprotect(g2h(host_start), host_end - host_start, host_prot);
+        ret = mprotect(g2h_untagged(host_start),
+                       host_end - host_start, host_prot);
         if (ret != 0) {
             goto error;
         }
@@ -186,7 +187,7 @@ static int mmap_frag(abi_ulong real_start,
     int prot1, prot_new;
 
     real_end = real_start + qemu_host_page_size;
-    host_start = g2h(real_start);
+    host_start = g2h_untagged(real_start);
 
     /* get the protection of the target pages outside the mapping */
     prot1 = 0;
@@ -218,7 +219,7 @@ static int mmap_frag(abi_ulong real_start,
             mprotect(host_start, qemu_host_page_size, prot1 | PROT_WRITE);
 
         /* read the corresponding file data */
-        if (pread(fd, g2h(start), end - start, offset) == -1)
+        if (pread(fd, g2h_untagged(start), end - start, offset) == -1)
             return -1;
 
         /* put final protection */
@@ -229,7 +230,7 @@ static int mmap_frag(abi_ulong real_start,
             mprotect(host_start, qemu_host_page_size, prot_new);
         }
         if (prot_new & PROT_WRITE) {
-            memset(g2h(start), 0, end - start);
+            memset(g2h_untagged(start), 0, end - start);
         }
     }
     return 0;
@@ -338,7 +339,7 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size, abi_ulong align)
          *  - mremap() with MREMAP_FIXED flag
          *  - shmat() with SHM_REMAP flag
          */
-        ptr = mmap(g2h(addr), size, PROT_NONE,
+        ptr = mmap(g2h_untagged(addr), size, PROT_NONE,
                    MAP_ANONYMOUS|MAP_PRIVATE|MAP_NORESERVE, -1, 0);
 
         /* ENOMEM, if host address space has no memory */
@@ -497,7 +498,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         /* Note: we prefer to control the mapping address. It is
            especially important if qemu_host_page_size >
            qemu_real_host_page_size */
-        p = mmap(g2h(start), host_len, host_prot,
+        p = mmap(g2h_untagged(start), host_len, host_prot,
                  flags | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
         if (p == MAP_FAILED) {
             goto fail;
@@ -505,10 +506,10 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         /* update start so that it points to the file position at 'offset' */
         host_start = (unsigned long)p;
         if (!(flags & MAP_ANONYMOUS)) {
-            p = mmap(g2h(start), len, host_prot,
+            p = mmap(g2h_untagged(start), len, host_prot,
                      flags | MAP_FIXED, fd, host_offset);
             if (p == MAP_FAILED) {
-                munmap(g2h(start), host_len);
+                munmap(g2h_untagged(start), host_len);
                 goto fail;
             }
             host_start += offset - host_offset;
@@ -548,7 +549,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
                                   -1, 0);
             if (retaddr == -1)
                 goto fail;
-            if (pread(fd, g2h(start), len, offset) == -1)
+            if (pread(fd, g2h_untagged(start), len, offset) == -1)
                 goto fail;
             if (!(host_prot & PROT_WRITE)) {
                 ret = target_mprotect(start, len, target_prot);
@@ -592,7 +593,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
                 offset1 = 0;
             else
                 offset1 = offset + real_start - start;
-            p = mmap(g2h(real_start), real_end - real_start,
+            p = mmap(g2h_untagged(real_start), real_end - real_start,
                      host_prot, flags, fd, offset1);
             if (p == MAP_FAILED)
                 goto fail;
@@ -652,7 +653,7 @@ static void mmap_reserve(abi_ulong start, abi_ulong size)
             real_end -= qemu_host_page_size;
     }
     if (real_start != real_end) {
-        mmap(g2h(real_start), real_end - real_start, PROT_NONE,
+        mmap(g2h_untagged(real_start), real_end - real_start, PROT_NONE,
                  MAP_FIXED | MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE,
                  -1, 0);
     }
@@ -707,7 +708,7 @@ int target_munmap(abi_ulong start, abi_ulong len)
         if (reserved_va) {
             mmap_reserve(real_start, real_end - real_start);
         } else {
-            ret = munmap(g2h(real_start), real_end - real_start);
+            ret = munmap(g2h_untagged(real_start), real_end - real_start);
         }
     }
 
@@ -738,8 +739,8 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
     mmap_lock();
 
     if (flags & MREMAP_FIXED) {
-        host_addr = mremap(g2h(old_addr), old_size, new_size,
-                           flags, g2h(new_addr));
+        host_addr = mremap(g2h_untagged(old_addr), old_size, new_size,
+                           flags, g2h_untagged(new_addr));
 
         if (reserved_va && host_addr != MAP_FAILED) {
             /* If new and old addresses overlap then the above mremap will
@@ -755,8 +756,9 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
             errno = ENOMEM;
             host_addr = MAP_FAILED;
         } else {
-            host_addr = mremap(g2h(old_addr), old_size, new_size,
-                               flags | MREMAP_FIXED, g2h(mmap_start));
+            host_addr = mremap(g2h_untagged(old_addr), old_size, new_size,
+                               flags | MREMAP_FIXED,
+                               g2h_untagged(mmap_start));
             if (reserved_va) {
                 mmap_reserve(old_addr, old_size);
             }
@@ -772,14 +774,15 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
             }
         }
         if (prot == 0) {
-            host_addr = mremap(g2h(old_addr), old_size, new_size, flags);
+            host_addr = mremap(g2h_untagged(old_addr),
+                               old_size, new_size, flags);
 
             if (host_addr != MAP_FAILED) {
                 /* Check if address fits target address space */
                 if (!guest_range_valid(h2g(host_addr), new_size)) {
                     /* Revert mremap() changes */
-                    host_addr = mremap(g2h(old_addr), new_size, old_size,
-                                       flags);
+                    host_addr = mremap(g2h_untagged(old_addr),
+                                       new_size, old_size, flags);
                     errno = ENOMEM;
                     host_addr = MAP_FAILED;
                 } else if (reserved_va && old_size > new_size) {
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 20a02c197cb..b78613f7c86 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -365,7 +365,7 @@ static void restore_user_regs(CPUPPCState *env,
         uint64_t v_addr;
         /* 64-bit needs to recover the pointer to the vectors from the frame */
         __get_user(v_addr, &frame->v_regs);
-        v_regs = g2h(v_addr);
+        v_regs = g2h(env_cpu(env), v_addr);
 #else
         v_regs = (ppc_avr_t *)frame->mc_vregs.altivec;
 #endif
@@ -552,7 +552,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (get_ppc64_abi(image) < 2) {
         /* ELFv1 PPC64 function pointers are pointers to OPD entries. */
         struct target_func_ptr *handler =
-            (struct target_func_ptr *)g2h(ka->_sa_handler);
+            (struct target_func_ptr *)g2h(env_cpu(env), ka->_sa_handler);
         env->nip = tswapl(handler->entry);
         env->gpr[2] = tswapl(handler->toc);
     } else {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 0c2d660bc42..e7fd99f1acc 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -912,7 +912,7 @@ abi_long do_brk(abi_ulong new_brk)
         /* Heap contents are initialized to zero, as for anonymous
          * mapped pages.  */
         if (new_brk > target_brk) {
-            memset(g2h(target_brk), 0, new_brk - target_brk);
+            memset(g2h_untagged(target_brk), 0, new_brk - target_brk);
         }
 	target_brk = new_brk;
         DEBUGF_BRK(TARGET_ABI_FMT_lx " (new_brk <= brk_page)\n", target_brk);
@@ -938,7 +938,7 @@ abi_long do_brk(abi_ulong new_brk)
          * come from the remaining part of the previous page: it may
          * contains garbage data due to a previous heap usage (grown
          * then shrunken).  */
-        memset(g2h(target_brk), 0, brk_page - target_brk);
+        memset(g2h_untagged(target_brk), 0, brk_page - target_brk);
 
         target_brk = new_brk;
         brk_page = HOST_PAGE_ALIGN(target_brk);
@@ -4622,7 +4622,7 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
     mmap_lock();
 
     if (shmaddr)
-        host_raddr = shmat(shmid, (void *)g2h(shmaddr), shmflg);
+        host_raddr = shmat(shmid, (void *)g2h_untagged(shmaddr), shmflg);
     else {
         abi_ulong mmap_start;
 
@@ -4633,7 +4633,8 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
             errno = ENOMEM;
             host_raddr = (void *)-1;
         } else
-            host_raddr = shmat(shmid, g2h(mmap_start), shmflg | SHM_REMAP);
+            host_raddr = shmat(shmid, g2h_untagged(mmap_start),
+                               shmflg | SHM_REMAP);
     }
 
     if (host_raddr == (void *)-1) {
@@ -4674,7 +4675,7 @@ static inline abi_long do_shmdt(abi_ulong shmaddr)
             break;
         }
     }
-    rv = get_errno(shmdt(g2h(shmaddr)));
+    rv = get_errno(shmdt(g2h_untagged(shmaddr)));
 
     mmap_unlock();
 
@@ -6145,10 +6146,10 @@ static abi_long write_ldt(CPUX86State *env,
                                     MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
         if (env->ldt.base == -1)
             return -TARGET_ENOMEM;
-        memset(g2h(env->ldt.base), 0,
+        memset(g2h_untagged(env->ldt.base), 0,
                TARGET_LDT_ENTRIES * TARGET_LDT_ENTRY_SIZE);
         env->ldt.limit = 0xffff;
-        ldt_table = g2h(env->ldt.base);
+        ldt_table = g2h_untagged(env->ldt.base);
     }
 
     /* NOTE: same code as Linux kernel */
@@ -6216,7 +6217,7 @@ static abi_long do_modify_ldt(CPUX86State *env, int func, abi_ulong ptr,
 #if defined(TARGET_ABI32)
 abi_long do_set_thread_area(CPUX86State *env, abi_ulong ptr)
 {
-    uint64_t *gdt_table = g2h(env->gdt.base);
+    uint64_t *gdt_table = g2h_untagged(env->gdt.base);
     struct target_modify_ldt_ldt_s ldt_info;
     struct target_modify_ldt_ldt_s *target_ldt_info;
     int seg_32bit, contents, read_exec_only, limit_in_pages;
@@ -6302,7 +6303,7 @@ install:
 static abi_long do_get_thread_area(CPUX86State *env, abi_ulong ptr)
 {
     struct target_modify_ldt_ldt_s *target_ldt_info;
-    uint64_t *gdt_table = g2h(env->gdt.base);
+    uint64_t *gdt_table = g2h_untagged(env->gdt.base);
     uint32_t base_addr, limit, flags;
     int seg_32bit, contents, read_exec_only, limit_in_pages, idx;
     int seg_not_present, useable, lm;
@@ -7597,8 +7598,8 @@ static int do_safe_futex(int *uaddr, int op, int val,
    tricky.  However they're probably useless because guest atomic
    operations won't work either.  */
 #if defined(TARGET_NR_futex)
-static int do_futex(target_ulong uaddr, int op, int val, target_ulong timeout,
-                    target_ulong uaddr2, int val3)
+static int do_futex(CPUState *cpu, target_ulong uaddr, int op, int val,
+                    target_ulong timeout, target_ulong uaddr2, int val3)
 {
     struct timespec ts, *pts;
     int base_op;
@@ -7619,11 +7620,14 @@ static int do_futex(target_ulong uaddr, int op, int val, target_ulong timeout,
         } else {
             pts = NULL;
         }
-        return do_safe_futex(g2h(uaddr), op, tswap32(val), pts, NULL, val3);
+        return do_safe_futex(g2h(cpu, uaddr),
+                             op, tswap32(val), pts, NULL, val3);
     case FUTEX_WAKE:
-        return do_safe_futex(g2h(uaddr), op, val, NULL, NULL, 0);
+        return do_safe_futex(g2h(cpu, uaddr),
+                             op, val, NULL, NULL, 0);
     case FUTEX_FD:
-        return do_safe_futex(g2h(uaddr), op, val, NULL, NULL, 0);
+        return do_safe_futex(g2h(cpu, uaddr),
+                             op, val, NULL, NULL, 0);
     case FUTEX_REQUEUE:
     case FUTEX_CMP_REQUEUE:
     case FUTEX_WAKE_OP:
@@ -7633,10 +7637,9 @@ static int do_futex(target_ulong uaddr, int op, int val, target_ulong timeout,
            to satisfy the compiler.  We do not need to tswap TIMEOUT
            since it's not compared to guest memory.  */
         pts = (struct timespec *)(uintptr_t) timeout;
-        return do_safe_futex(g2h(uaddr), op, val, pts, g2h(uaddr2),
+        return do_safe_futex(g2h(cpu, uaddr), op, val, pts, g2h(cpu, uaddr2),
                              (base_op == FUTEX_CMP_REQUEUE
-                                      ? tswap32(val3)
-                                      : val3));
+                              ? tswap32(val3) : val3));
     default:
         return -TARGET_ENOSYS;
     }
@@ -7644,7 +7647,8 @@ static int do_futex(target_ulong uaddr, int op, int val, target_ulong timeout,
 #endif
 
 #if defined(TARGET_NR_futex_time64)
-static int do_futex_time64(target_ulong uaddr, int op, int val, target_ulong timeout,
+static int do_futex_time64(CPUState *cpu, target_ulong uaddr, int op,
+                           int val, target_ulong timeout,
                            target_ulong uaddr2, int val3)
 {
     struct timespec ts, *pts;
@@ -7668,11 +7672,12 @@ static int do_futex_time64(target_ulong uaddr, int op, int val, target_ulong tim
         } else {
             pts = NULL;
         }
-        return do_safe_futex(g2h(uaddr), op, tswap32(val), pts, NULL, val3);
+        return do_safe_futex(g2h(cpu, uaddr), op,
+                             tswap32(val), pts, NULL, val3);
     case FUTEX_WAKE:
-        return do_safe_futex(g2h(uaddr), op, val, NULL, NULL, 0);
+        return do_safe_futex(g2h(cpu, uaddr), op, val, NULL, NULL, 0);
     case FUTEX_FD:
-        return do_safe_futex(g2h(uaddr), op, val, NULL, NULL, 0);
+        return do_safe_futex(g2h(cpu, uaddr), op, val, NULL, NULL, 0);
     case FUTEX_REQUEUE:
     case FUTEX_CMP_REQUEUE:
     case FUTEX_WAKE_OP:
@@ -7682,10 +7687,9 @@ static int do_futex_time64(target_ulong uaddr, int op, int val, target_ulong tim
            to satisfy the compiler.  We do not need to tswap TIMEOUT
            since it's not compared to guest memory.  */
         pts = (struct timespec *)(uintptr_t) timeout;
-        return do_safe_futex(g2h(uaddr), op, val, pts, g2h(uaddr2),
+        return do_safe_futex(g2h(cpu, uaddr), op, val, pts, g2h(cpu, uaddr2),
                              (base_op == FUTEX_CMP_REQUEUE
-                                      ? tswap32(val3)
-                                      : val3));
+                              ? tswap32(val3) : val3));
     default:
         return -TARGET_ENOSYS;
     }
@@ -7860,7 +7864,7 @@ static int open_self_maps(void *cpu_env, int fd)
             const char *path;
 
             max = h2g_valid(max - 1) ?
-                max : (uintptr_t) g2h(GUEST_ADDR_MAX) + 1;
+                max : (uintptr_t) g2h_untagged(GUEST_ADDR_MAX) + 1;
 
             if (page_check_range(h2g(min), max - min, flags) == -1) {
                 continue;
@@ -8277,8 +8281,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 
             if (ts->child_tidptr) {
                 put_user_u32(0, ts->child_tidptr);
-                do_sys_futex(g2h(ts->child_tidptr), FUTEX_WAKE, INT_MAX,
-                          NULL, NULL, 0);
+                do_sys_futex(g2h(cpu, ts->child_tidptr),
+                             FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
             }
             thread_cpu = NULL;
             g_free(ts);
@@ -8643,7 +8647,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             if (!arg5) {
                 ret = mount(p, p2, p3, (unsigned long)arg4, NULL);
             } else {
-                ret = mount(p, p2, p3, (unsigned long)arg4, g2h(arg5));
+                ret = mount(p, p2, p3, (unsigned long)arg4, g2h(cpu, arg5));
             }
             ret = get_errno(ret);
 
@@ -9738,15 +9742,15 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         /* ??? msync/mlock/munlock are broken for softmmu.  */
 #ifdef TARGET_NR_msync
     case TARGET_NR_msync:
-        return get_errno(msync(g2h(arg1), arg2, arg3));
+        return get_errno(msync(g2h(cpu, arg1), arg2, arg3));
 #endif
 #ifdef TARGET_NR_mlock
     case TARGET_NR_mlock:
-        return get_errno(mlock(g2h(arg1), arg2));
+        return get_errno(mlock(g2h(cpu, arg1), arg2));
 #endif
 #ifdef TARGET_NR_munlock
     case TARGET_NR_munlock:
-        return get_errno(munlock(g2h(arg1), arg2));
+        return get_errno(munlock(g2h(cpu, arg1), arg2));
 #endif
 #ifdef TARGET_NR_mlockall
     case TARGET_NR_mlockall:
@@ -12237,7 +12241,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 
 #if defined(TARGET_NR_set_tid_address) && defined(__NR_set_tid_address)
     case TARGET_NR_set_tid_address:
-        return get_errno(set_tid_address((int *)g2h(arg1)));
+        return get_errno(set_tid_address((int *)g2h(cpu, arg1)));
 #endif
 
     case TARGET_NR_tkill:
@@ -12324,11 +12328,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_futex
     case TARGET_NR_futex:
-        return do_futex(arg1, arg2, arg3, arg4, arg5, arg6);
+        return do_futex(cpu, arg1, arg2, arg3, arg4, arg5, arg6);
 #endif
 #ifdef TARGET_NR_futex_time64
     case TARGET_NR_futex_time64:
-        return do_futex_time64(arg1, arg2, arg3, arg4, arg5, arg6);
+        return do_futex_time64(cpu, arg1, arg2, arg3, arg4, arg5, arg6);
 #endif
 #if defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)
     case TARGET_NR_inotify_init:
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index ae611d73c2c..7f56c78fa6c 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -542,7 +542,7 @@ uint64_t HELPER(paired_cmpxchg64_le)(CPUARMState *env, uint64_t addr,
 
 #ifdef CONFIG_USER_ONLY
     /* ??? Enforce alignment.  */
-    uint64_t *haddr = g2h(addr);
+    uint64_t *haddr = g2h(env_cpu(env), addr);
 
     set_helper_retaddr(ra);
     o0 = ldq_le_p(haddr + 0);
@@ -612,7 +612,7 @@ uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env, uint64_t addr,
 
 #ifdef CONFIG_USER_ONLY
     /* ??? Enforce alignment.  */
-    uint64_t *haddr = g2h(addr);
+    uint64_t *haddr = g2h(env_cpu(env), addr);
 
     set_helper_retaddr(ra);
     o1 = ldq_be_p(haddr + 0);
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 7ae31e1a154..96d9391c399 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -63,7 +63,7 @@ static void atomic_store_3(CPUHPPAState *env, target_ulong addr, uint32_t val,
 #ifdef CONFIG_USER_ONLY
     uint32_t old, new, cmp;
 
-    uint32_t *haddr = g2h(addr - 1);
+    uint32_t *haddr = g2h(env_cpu(env), addr - 1);
     old = *haddr;
     while (1) {
         new = (old & ~mask) | (val & mask);
diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index e5cd2de1bff..591f512bffe 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -66,7 +66,7 @@ void helper_cmpxchg8b(CPUX86State *env, target_ulong a0)
 
 #ifdef CONFIG_USER_ONLY
     {
-        uint64_t *haddr = g2h(a0);
+        uint64_t *haddr = g2h(env_cpu(env), a0);
         cmpv = cpu_to_le64(cmpv);
         newv = cpu_to_le64(newv);
         oldv = qatomic_cmpxchg__nocheck(haddr, cmpv, newv);
diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 1901e9dfc7c..25cfede806a 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -1780,7 +1780,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
 
             if (parallel) {
 #ifdef CONFIG_USER_ONLY
-                uint32_t *haddr = g2h(a1);
+                uint32_t *haddr = g2h(env_cpu(env), a1);
                 ov = qatomic_cmpxchg__nocheck(haddr, cv, nv);
 #else
                 TCGMemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mem_idx);
@@ -1804,7 +1804,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
             if (parallel) {
 #ifdef CONFIG_ATOMIC64
 # ifdef CONFIG_USER_ONLY
-                uint64_t *haddr = g2h(a1);
+                uint64_t *haddr = g2h(env_cpu(env), a1);
                 ov = qatomic_cmpxchg__nocheck(haddr, cv, nv);
 # else
                 TCGMemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN, mem_idx);
-- 
2.20.1



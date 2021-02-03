Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B99B30E31C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:13:53 +0100 (CET)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Nb6-0007pF-5I
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOY-0007P6-W2
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:56 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOR-0001fe-E1
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:54 -0500
Received: by mail-pj1-x102a.google.com with SMTP id q72so230806pjq.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7hjhE0U9saCfWCVjfPxJo9p8Csb2DErMQl9VR45IGeY=;
 b=Hy+TU37qMan3zms2o7LXzt2i0rogQImDQtzvsyZr/kOlwo3WpJLe8uxXQyzlkgfu1t
 KukUISrQSNoFxwoeUGre6i8fZZ4NgDV5yRMQcumZKYwbWCTpmMl2tPN9x7nCLuwIRfj6
 MGEVAijNnGS9Hy6twJ93bdrFali/gL30hcPz+gjPKzwHWDXBQBEUAaw1r9novtlF7mTl
 lWtSdsaHL9BKG4kKLKSL5K0m6kc9Q+olyV3V8mmWfl+uWgvMmUIC5qSzPi9Zxl9nUHj/
 wY18SjrO9xmFgONewqfkEagheyijonqxm0rYjfu9tUv1LoNSIaib18lBIYxQ4Nc/+1hp
 NnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7hjhE0U9saCfWCVjfPxJo9p8Csb2DErMQl9VR45IGeY=;
 b=eVOshW7ryLitlAGEm5mqGFF+2m0mQRs3S+3I1XbiB/Uz8yFtqNPNrV4aTISSspHBzG
 EKFJcehUhLQiXlUhibTNSzlSSrg4172diw2ptsWxrYWmwqkKHpf/vvWAQSnALtK87yLA
 xaBmu2cXu41+4lS/i3x2BKlK9ubUFsabprrbEwzi6WQAJvlBhH8grxL6wroHVelcosZZ
 hSVXHQ0R1BNdMI34fS6jaBmXuF7NbAJ9CWof2EgaL/YfpqhzU+OL/9joWCeJhNxbodf6
 c+KNMgIGlV76ppwhRDV+qbivBvQFUQ2DB4rv3aXaknHD4ibWom9z0CcAO1/f877zLP4m
 7w0g==
X-Gm-Message-State: AOAM531+A0K29SIlzFN7o3Liimix2HU9/yOJb6dnIPA2mDgzrLzrxz1t
 3u4wL3Khzg2VFiKKw31B27ri4jZa/DnN30+N
X-Google-Smtp-Source: ABdhPJyxMb0womCNT+XOvuP0bGYactzEuIy9CjrLcQ6AYsKOjtl3aC7bKhCZqMWWl9RERC26j6KDYA==
X-Received: by 2002:a17:90b:124c:: with SMTP id
 gx12mr4298852pjb.21.1612378845094; 
 Wed, 03 Feb 2021 11:00:45 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/31] exec: Rename guest_{addr,range}_valid to *_untagged
Date: Wed,  3 Feb 2021 08:59:54 -1000
Message-Id: <20210203190010.759771-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The places that use these are better off using untagged
addresses, so do not provide a tagged versions.  Rename
to make it clear about the address type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h |  4 ++--
 linux-user/qemu.h       |  4 ++--
 accel/tcg/user-exec.c   |  9 ++++++---
 linux-user/mmap.c       | 12 ++++++------
 linux-user/syscall.c    |  2 +-
 5 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index c54069e3cd..ce6ce82618 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -87,12 +87,12 @@ static inline void *g2h(CPUState *cs, abi_ptr x)
     return g2h_untagged(cpu_untagged_addr(cs, x));
 }
 
-static inline bool guest_addr_valid(abi_ulong x)
+static inline bool guest_addr_valid_untagged(abi_ulong x)
 {
     return x <= GUEST_ADDR_MAX;
 }
 
-static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
+static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index ba122a7903..b3ccffbf0f 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -494,8 +494,8 @@ extern unsigned long guest_stack_size;
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
     if (size == 0
-        ? !guest_addr_valid(addr)
-        : !guest_range_valid(addr, size)) {
+        ? !guest_addr_valid_untagged(addr)
+        : !guest_range_valid_untagged(addr, size)) {
         return false;
     }
     return page_check_range((target_ulong)addr, size, type) == 0;
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a2a353920c..4963e5cc51 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -191,10 +191,11 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
     g_assert_not_reached();
 }
 
-static int probe_access_internal(CPUArchState *env, target_ulong addr,
+static int probe_access_internal(CPUArchState *env, target_ulong addr_tagged,
                                  int fault_size, MMUAccessType access_type,
                                  bool nonfault, uintptr_t ra)
 {
+    target_ulong addr;
     int flags;
 
     switch (access_type) {
@@ -211,13 +212,15 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
         g_assert_not_reached();
     }
 
-    if (!guest_addr_valid(addr) || page_check_range(addr, 1, flags) < 0) {
+    addr = cpu_untagged_addr(env_cpu(env), addr_tagged);
+    if (!guest_addr_valid_untagged(addr) ||
+        page_check_range(addr, 1, flags) < 0) {
         if (nonfault) {
             return TLB_INVALID_MASK;
         } else {
             CPUState *cpu = env_cpu(env);
             CPUClass *cc = CPU_GET_CLASS(cpu);
-            cc->tlb_fill(cpu, addr, fault_size, access_type,
+            cc->tlb_fill(cpu, addr_tagged, fault_size, access_type,
                          MMU_USER_IDX, false, ra);
             g_assert_not_reached();
         }
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 088c50592c..6690384752 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -119,7 +119,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
     }
     len = TARGET_PAGE_ALIGN(len);
     end = start + len;
-    if (!guest_range_valid(start, len)) {
+    if (!guest_range_valid_untagged(start, len)) {
         return -TARGET_ENOMEM;
     }
     if (len == 0) {
@@ -528,7 +528,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
          * It can fail only on 64-bit host with 32-bit target.
          * On any other target/host host mmap() handles this error correctly.
          */
-        if (end < start || !guest_range_valid(start, len)) {
+        if (end < start || !guest_range_valid_untagged(start, len)) {
             errno = ENOMEM;
             goto fail;
         }
@@ -669,7 +669,7 @@ int target_munmap(abi_ulong start, abi_ulong len)
     if (start & ~TARGET_PAGE_MASK)
         return -TARGET_EINVAL;
     len = TARGET_PAGE_ALIGN(len);
-    if (len == 0 || !guest_range_valid(start, len)) {
+    if (len == 0 || !guest_range_valid_untagged(start, len)) {
         return -TARGET_EINVAL;
     }
 
@@ -727,9 +727,9 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
     int prot;
     void *host_addr;
 
-    if (!guest_range_valid(old_addr, old_size) ||
+    if (!guest_range_valid_untagged(old_addr, old_size) ||
         ((flags & MREMAP_FIXED) &&
-         !guest_range_valid(new_addr, new_size))) {
+         !guest_range_valid_untagged(new_addr, new_size))) {
         errno = ENOMEM;
         return -1;
     }
@@ -777,7 +777,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
 
             if (host_addr != MAP_FAILED) {
                 /* Check if address fits target address space */
-                if (!guest_range_valid(h2g(host_addr), new_size)) {
+                if (!guest_range_valid_untagged(h2g(host_addr), new_size)) {
                     /* Revert mremap() changes */
                     host_addr = mremap(g2h_untagged(old_addr),
                                        new_size, old_size, flags);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4451f8e4f0..30a5021509 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4608,7 +4608,7 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
             return -TARGET_EINVAL;
         }
     }
-    if (!guest_range_valid(shmaddr, shm_info.shm_segsz)) {
+    if (!guest_range_valid_untagged(shmaddr, shm_info.shm_segsz)) {
         return -TARGET_EINVAL;
     }
 
-- 
2.25.1



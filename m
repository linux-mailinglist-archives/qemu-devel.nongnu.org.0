Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703F531A4D1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:56:17 +0100 (CET)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdc0-0007IK-Eh
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVU-0001gD-UF
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:32 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVM-0007oq-KC
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:32 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d13so336954plg.0
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SxP9W+IJKMFMofn6Rk2ZUxJOKG7H541uVqle1Z/l9bY=;
 b=ecLUVEfp9AY8AF38nDNqMgHfT0Un9rUBrGoIohAHIxhAhCrE5/76SFX75trDKkT0y0
 DjTnzMmJmeDQ5yZSKoKRBkw45vXUGzSDB9ZjJ3bM/1dnzN55ibe3TGBBoWFZUicPF9LY
 ZPFPi9+vX6VB9x5D1acrcq9F7ORcCFGoBcsAmHYMYUS4cTB7dlpaoWD8yQnjQoVc1phJ
 7kNRBT2vTwFn2/5toKuuvE9z2x/de2iK3ajYCN1I7Np8b2HAu1QotyLhObvbQDK+B7l1
 4y6QVUzGoj3kZvqGEWaWUvhztdX4c/i6QIKO+iLu0xTFDaUVBKxaMYy8GHqeFDp9fPwS
 pUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SxP9W+IJKMFMofn6Rk2ZUxJOKG7H541uVqle1Z/l9bY=;
 b=QwiMasjFkvcbQ1/mtZdcCRhw6ZpfEXeRgbW/dxgwVlpic4Tfh0gK1U+NmyrMspoFVq
 y1Jl7Peih38TlpATiOFNyHwsAXlUNXY9O0SQ+c3eObqVThAXb1sQl8BjrDEd7aTX96dU
 8f+VK7AT/2HZqe4SoZfFpgTKDqD+A2bpGKRcisskN64jpnQ/fnbrFGGPp586yfxxai2f
 /lnA+jxnZRBDO/FVEF61lH3vBvuNJKNoMm9G63mxfGpEdIHcJTSZ0HkLC64cfuoxGDZ8
 Vb4AxsCH1MytDMANAupq30xG3QqD/xR5bb3GbmxOTGJrKpdudLsjui2W+6Ad4lze9mDi
 dbhw==
X-Gm-Message-State: AOAM530fHH2t1MC7QQy4fwZBuZEeYAwPTUbML21uBHvxh2DRCpEdW/l9
 +TIfU2VMqlCxFFewFfEr9xd29xdqCh0fbg==
X-Google-Smtp-Source: ABdhPJzlxlbYzpdPf/HXTPv/4PR2bxKzt2/zMVMqOXDUjmjoQUeyI8xfKEI2g9voSp2bf3hXtntV/A==
X-Received: by 2002:a17:902:309:b029:e1:536b:4ab with SMTP id
 9-20020a1709020309b02900e1536b04abmr4064988pld.65.1613155763290; 
 Fri, 12 Feb 2021 10:49:23 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 15/31] exec: Rename guest_{addr,range}_valid to *_untagged
Date: Fri, 12 Feb 2021 10:48:46 -0800
Message-Id: <20210212184902.1251044-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The places that use these are better off using untagged
addresses, so do not provide a tagged versions.  Rename
to make it clear about the address type.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h |  4 ++--
 linux-user/qemu.h       |  4 ++--
 accel/tcg/user-exec.c   |  3 ++-
 linux-user/mmap.c       | 12 ++++++------
 linux-user/syscall.c    |  2 +-
 5 files changed, 13 insertions(+), 12 deletions(-)

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
index fa1847b2a6..0d8cc27b21 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -213,7 +213,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
         g_assert_not_reached();
     }
 
-    if (!guest_addr_valid(addr) || page_check_range(addr, 1, flags) < 0) {
+    if (!guest_addr_valid_untagged(addr) ||
+        page_check_range(addr, 1, flags) < 0) {
         if (nonfault) {
             return TLB_INVALID_MASK;
         } else {
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



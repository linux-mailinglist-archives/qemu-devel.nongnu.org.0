Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA957318C2C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:38:43 +0100 (CET)
Received: from localhost ([::1]:57234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACB8-0003CL-QD
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZB-0008JU-Ev
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:30 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ4-0008VP-EK
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:28 -0500
Received: by mail-wm1-x331.google.com with SMTP id i9so5657353wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YgxGpzJeSkPHs78f+HAWSg84qQk3nAuymHYPvqcfEew=;
 b=SKA5o95AQwH7UouHpQB7V3PltzTJlfwjHc+1XEPaztb2pBnxlMeuw+LmM6GHqt+5Qk
 aMswFnrkadeyRGjdnluXcNFTtiRGcWeXyK1X/veenLap82HWt8xvi602cKS6DBv+gTZy
 C0EqvF2IDRYa8SvVO/0Fr3/dcp42BNfgnrqLdvom/yvPiKnQXfx+B5WKMK1MRdwnUt78
 rm3C2FNWzn8Zb0/QFba+nt05cvncfcORvBkn+PNsaWM3A6bAadv7Qa695wS9rNixnFJm
 UOwE1Lj591W26bFoUgnLMSOhf/NjVQtvTLOZfQIFz0/5Lq7ZfttmBmKnjyKpKY90Xg+w
 pMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgxGpzJeSkPHs78f+HAWSg84qQk3nAuymHYPvqcfEew=;
 b=ZJy3pVKSsUKIh9Q51RvSGP7j9IkKSn6Y7/jX50rniPPC7YjWb7BoAUDtxXNfIRL8Aa
 7HTib1idSvEpYutEnVSiKZ26jf1S4WNkPBHvEdTo2FW1BFco2LCtf+j0DaPVlbeSX1q2
 r5wauPQ354qe6DdNrt79LIMObi4k3X22cCTpsjETxCefRjDrdhKbR5mGlpfarn2dDs0I
 dHY5JcAOT2tSNgZe7Mpwm2sXtawpYGULyxMsAuKcUo2qx+i7Opg4UxNpS9ceZ5NV4Hal
 T65c54rzM5gkxSmZKkIuB5bLR3XJIqwfDidBWDFntkBYpkk7x03bxJw5zS2uRtYNBMua
 PlMw==
X-Gm-Message-State: AOAM531lp84JuES2ptmAeoprhZXTjC9Pb8li96pfV4oKEd3iCxFgTXVJ
 KvrESvyzLXg5X0FrzEyvh4TCB+1K7HUhJQ==
X-Google-Smtp-Source: ABdhPJxfMB4N2suHNwo+o28MNbBD/ly7w0MavfVUZNQYOjNNc5Q1FzRQcN269Iljomf95N/ErbxVoA==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr5131853wmc.39.1613048361170;
 Thu, 11 Feb 2021 04:59:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/45] exec: Rename guest_{addr,range}_valid to *_untagged
Date: Thu, 11 Feb 2021 12:58:39 +0000
Message-Id: <20210211125900.22777-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The places that use these are better off using untagged
addresses, so do not provide a tagged versions.  Rename
to make it clear about the address type.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-16-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu_ldst.h |  4 ++--
 linux-user/qemu.h       |  4 ++--
 accel/tcg/user-exec.c   |  3 ++-
 linux-user/mmap.c       | 12 ++++++------
 linux-user/syscall.c    |  2 +-
 5 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index c54069e3cd0..ce6ce826182 100644
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
index ba122a79039..b3ccffbf0fa 100644
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
index fa1847b2a61..0d8cc27b213 100644
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
index 088c50592cf..6690384752f 100644
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
index 4451f8e4f08..30a5021509e 100644
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
2.20.1



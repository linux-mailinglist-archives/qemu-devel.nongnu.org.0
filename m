Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC4431CE20
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:35:39 +0100 (CET)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3K6-00016D-Cj
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32q-00088N-QJ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:48 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32G-0002Pq-OS
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:48 -0500
Received: by mail-wm1-x335.google.com with SMTP id n10so15029508wmq.0
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QZdYzSFH8t+vQqqw69mWNqxMXUzyV4/x8cSvRzxUxII=;
 b=csE0LE6grciJfWA/vPEyAKDEj0s4ljsrev+4RPIt+C3fHlckPEHFBFYbwKbuFama91
 n89Vj6E/GC5YkTPOGj+huTgO2SWzPsF33V+xJlLh2LA18A2/AAsLX2nef5P8BOFeS1Z9
 I3+tzsaWHTP2P7mRjKD3bTOqVlONTB6XRYTFRLyMqnmDztXCZcQXrMbaXDvmp5hcI7zM
 I7Ql6Vq7J2Fqog6GR96btoLL21AfaX6Mh+d5hsdBjZgtrAQX3FiQ+1N16JoSPCxXmA+R
 mQI5VBLf77smswSbHQ9DhYWIqGX0Orhh80NuOSwQG0tpnpWhp8WXAXTUwLxhOXus8tf1
 t9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QZdYzSFH8t+vQqqw69mWNqxMXUzyV4/x8cSvRzxUxII=;
 b=hPaYx8EtRBUnUYB4n4F8BYyQVRQUbkVGgACSrgi6t1EGFIH0VRTCM1PxrlWoDhbP84
 HMwiPMjqPqZOVNJarMn7PfkuUHADGzAC4zK/Xz5SxHUU3X9Etl7nN0kRSbKObnpo+0uL
 kreCDM4M7TLD0Cu58D3zBpEQqW5YhFJLIoQg1G18cSoWCPA8joYjk5XK54dXzG+TW6bH
 4WsXotJvojF8i7bjia3VNYCDkm20/pKIzLLljFXrmSjwGhC2SDfubzdY4c4WObZ1PtPk
 uFSIAqaGt1pE60GSrZ+RJuyHyG5DQujQwqOsbjQD99e+9BX/A2sY8JUnSXN1WmO28kEZ
 5kUg==
X-Gm-Message-State: AOAM533vu1phDHo4vgnkzlQ3llWNgTyBvtCORVZH8pSyH5LAyGQNdzkO
 JtnNY9tBpvISKaGSd12wwtElUsig5DMd3g==
X-Google-Smtp-Source: ABdhPJzwerBzWskBHsNoeCXZC2YzKrfDSVB/Wons/R1a4JEis7f7ryctV/Q4hdYLW7QxavNSIm8xJw==
X-Received: by 2002:a7b:c4d7:: with SMTP id g23mr1858667wmk.106.1613492231272; 
 Tue, 16 Feb 2021 08:17:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/40] exec: Rename guest_{addr,range}_valid to *_untagged
Date: Tue, 16 Feb 2021 16:16:33 +0000
Message-Id: <20210216161658.29881-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

The places that use these are better off using untagged
addresses, so do not provide a tagged versions.  Rename
to make it clear about the address type.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-16-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu_ldst.h |  4 ++--
 linux-user/qemu.h       |  4 ++--
 accel/tcg/user-exec.c   |  3 ++-
 linux-user/mmap.c       | 14 +++++++-------
 linux-user/syscall.c    |  2 +-
 5 files changed, 14 insertions(+), 13 deletions(-)

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
index 6decfec68a9..9fe0c634e24 100644
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
 
@@ -727,11 +727,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
     int prot;
     void *host_addr;
 
-    if (!guest_range_valid(old_addr, old_size) ||
+    if (!guest_range_valid_untagged(old_addr, old_size) ||
         ((flags & MREMAP_FIXED) &&
-         !guest_range_valid(new_addr, new_size)) ||
+         !guest_range_valid_untagged(new_addr, new_size)) ||
         ((flags & MREMAP_MAYMOVE) == 0 &&
-         !guest_range_valid(old_addr, new_size))) {
+         !guest_range_valid_untagged(old_addr, new_size))) {
         errno = ENOMEM;
         return -1;
     }
@@ -779,7 +779,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
 
             if (host_addr != MAP_FAILED) {
                 /* Check if address fits target address space */
-                if (!guest_range_valid(h2g(host_addr), new_size)) {
+                if (!guest_range_valid_untagged(h2g(host_addr), new_size)) {
                     /* Revert mremap() changes */
                     host_addr = mremap(g2h_untagged(old_addr),
                                        new_size, old_size, flags);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d5badd753e3..53529e4004c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4619,7 +4619,7 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
             return -TARGET_EINVAL;
         }
     }
-    if (!guest_range_valid(shmaddr, shm_info.shm_segsz)) {
+    if (!guest_range_valid_untagged(shmaddr, shm_info.shm_segsz)) {
         return -TARGET_EINVAL;
     }
 
-- 
2.20.1



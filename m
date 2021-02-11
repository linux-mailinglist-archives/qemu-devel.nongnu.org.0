Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD6318C18
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:35:13 +0100 (CET)
Received: from localhost ([::1]:48682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAC7k-00081D-HU
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZB-0008JV-HL
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:30 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ6-0008Vr-9r
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:29 -0500
Received: by mail-wm1-x333.google.com with SMTP id y134so5659585wmd.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rCXXZb8RGeVRsjgPYQzTpFm0H5PWMKbHXfySrTVhE1o=;
 b=cKaMcHhD2MvJNmE/9bbNVUjHFJGw6fgDkK5wITZH9wFCAphjMUWJf2K2VG/r+YRKoi
 C7tcoTgkCLO0gcE0EaeU/OSG2SCwu9Sl3V95cHbwXPyg/W0CPd5MX8C0E5mFXjLu9K6R
 YPgn5/e6hBhRPJUnsBl/FvPxRex9NFnUaEgTZB3Q8x7quYXtvxYlXC7OQb1gorbq8NLA
 DaUOhP+LWfpyBQpYKAT2wywzy3O1mOR7kwsPB4VJsuNd3E3J+1zsU1RjZSzEuO3/2mhi
 nSJNkxrO8cmw7jb89ZP4Bvrk6aYh7FWG1JqJWbH9QtUS2+qX6buk0R3AVrMKZQZZf+0F
 0DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rCXXZb8RGeVRsjgPYQzTpFm0H5PWMKbHXfySrTVhE1o=;
 b=apOQRL7lR72hAnEL/tfNSc+ZGcGHKLmzyPEmgVKtmAlLw8LylkhofXw/In4xI2yt8i
 9t80qr3HKGB7Y58tbACBgdm9PkvLF/m7mV2ckjNvRGgMzoPT1vYBNhs/gLzKJmlMQTZX
 lD75y6yGaUUDVdfhcwlHuKTCmi5++JyD033eb0ShOD3ewfzoKS9oTtB8j8gxLm+sLpMR
 yVn8VcIPH6teChyc32bTFdbZfHfq+zQGjdIfc33uMnWEa02zvqi/BWj1Gx5k4vRjrYC0
 pXxX3avu5U5DQ1iB0hAqVqzADaFuW8b69N46kEa8e/5IMsxiaZj8mjBtxzxxxxAOgSti
 o2lw==
X-Gm-Message-State: AOAM532jNxkxH/laS7vYKLBFcr6a0waS7MgElkB+RzEHLldpxebER/9Q
 XqXw+T+9CnUwACJi5LNupKECBQ/noNW5ZA==
X-Google-Smtp-Source: ABdhPJwnak3MLwAda9UNneCgYjxe2iuCPAjYLvp3PZtR8msq8vWMBg0qfROAMjfNZi6WMKbz/GupPw==
X-Received: by 2002:a1c:9cc5:: with SMTP id f188mr4939686wme.171.1613048361901; 
 Thu, 11 Feb 2021 04:59:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/45] linux-user: Use cpu_untagged_addr in access_ok;
 split out *_untagged
Date: Thu, 11 Feb 2021 12:58:40 +0000
Message-Id: <20210211125900.22777-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Provide both tagged and untagged versions of access_ok.
In a few places use thread_cpu, as the user is several
callees removed from do_syscall1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-17-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h          | 11 +++++++++--
 linux-user/elfload.c       |  2 +-
 linux-user/hppa/cpu_loop.c |  8 ++++----
 linux-user/i386/cpu_loop.c |  2 +-
 linux-user/i386/signal.c   |  5 +++--
 linux-user/syscall.c       |  9 ++++++---
 6 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index b3ccffbf0fa..82eabb73f80 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -491,7 +491,7 @@ extern unsigned long guest_stack_size;
 #define VERIFY_READ  PAGE_READ
 #define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
-static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
+static inline bool access_ok_untagged(int type, abi_ulong addr, abi_ulong size)
 {
     if (size == 0
         ? !guest_addr_valid_untagged(addr)
@@ -501,6 +501,12 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
     return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
+static inline bool access_ok(CPUState *cpu, int type,
+                             abi_ulong addr, abi_ulong size)
+{
+    return access_ok_untagged(type, cpu_untagged_addr(cpu, addr), size);
+}
+
 /* NOTE __get_user and __put_user use host pointers and don't check access.
    These are usually used to access struct data members once the struct has
    been locked - usually with lock_user_struct.  */
@@ -636,8 +642,9 @@ abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
    host area will have the same contents as the guest.  */
 static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy)
 {
-    if (!access_ok(type, guest_addr, len))
+    if (!access_ok_untagged(type, guest_addr, len)) {
         return NULL;
+    }
 #ifdef DEBUG_REMAP
     {
         void *addr;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f542841ba24..e7209e03cb5 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3500,7 +3500,7 @@ static int vma_get_mapping_count(const struct mm_struct *mm)
 static abi_ulong vma_dump_size(const struct vm_area_struct *vma)
 {
     /* if we cannot even read the first page, skip it */
-    if (!access_ok(VERIFY_READ, vma->vma_start, TARGET_PAGE_SIZE))
+    if (!access_ok_untagged(VERIFY_READ, vma->vma_start, TARGET_PAGE_SIZE))
         return (0);
 
     /*
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 944511bbe43..3aaaf3337cb 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -35,7 +35,7 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
         return -TARGET_ENOSYS;
 
     case 0: /* elf32 atomic 32bit cmpxchg */
-        if ((addr & 3) || !access_ok(VERIFY_WRITE, addr, 4)) {
+        if ((addr & 3) || !access_ok(cs, VERIFY_WRITE, addr, 4)) {
             return -TARGET_EFAULT;
         }
         old = tswap32(old);
@@ -50,9 +50,9 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
             return -TARGET_ENOSYS;
         }
         if (((addr | old | new) & ((1 << size) - 1))
-            || !access_ok(VERIFY_WRITE, addr, 1 << size)
-            || !access_ok(VERIFY_READ, old, 1 << size)
-            || !access_ok(VERIFY_READ, new, 1 << size)) {
+            || !access_ok(cs, VERIFY_WRITE, addr, 1 << size)
+            || !access_ok(cs, VERIFY_READ, old, 1 << size)
+            || !access_ok(cs, VERIFY_READ, new, 1 << size)) {
             return -TARGET_EFAULT;
         }
         /* Note that below we use host-endian loads so that the cmpxchg
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 19c8a18cd30..f813e87294a 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -99,7 +99,7 @@ static bool write_ok_or_segv(CPUX86State *env, abi_ptr addr, size_t len)
      * For all the vsyscalls, NULL means "don't write anything" not
      * "write it at address 0".
      */
-    if (addr == 0 || access_ok(VERIFY_WRITE, addr, len)) {
+    if (addr == 0 || access_ok(env_cpu(env), VERIFY_WRITE, addr, len)) {
         return true;
     }
 
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 97a39204cc2..9320e1d4726 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -513,9 +513,10 @@ restore_sigcontext(CPUX86State *env, struct target_sigcontext *sc)
 
     fpstate_addr = tswapl(sc->fpstate);
     if (fpstate_addr != 0) {
-        if (!access_ok(VERIFY_READ, fpstate_addr,
-                       sizeof(struct target_fpstate)))
+        if (!access_ok(env_cpu(env), VERIFY_READ, fpstate_addr,
+                       sizeof(struct target_fpstate))) {
             goto badframe;
+        }
 #ifndef TARGET_X86_64
         cpu_x86_frstor(env, fpstate_addr, 1);
 #else
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 30a5021509e..24fc1daf023 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3515,8 +3515,9 @@ static abi_long do_accept4(int fd, abi_ulong target_addr,
         return -TARGET_EINVAL;
     }
 
-    if (!access_ok(VERIFY_WRITE, target_addr, addrlen))
+    if (!access_ok(thread_cpu, VERIFY_WRITE, target_addr, addrlen)) {
         return -TARGET_EFAULT;
+    }
 
     addr = alloca(addrlen);
 
@@ -3546,8 +3547,9 @@ static abi_long do_getpeername(int fd, abi_ulong target_addr,
         return -TARGET_EINVAL;
     }
 
-    if (!access_ok(VERIFY_WRITE, target_addr, addrlen))
+    if (!access_ok(thread_cpu, VERIFY_WRITE, target_addr, addrlen)) {
         return -TARGET_EFAULT;
+    }
 
     addr = alloca(addrlen);
 
@@ -3577,8 +3579,9 @@ static abi_long do_getsockname(int fd, abi_ulong target_addr,
         return -TARGET_EINVAL;
     }
 
-    if (!access_ok(VERIFY_WRITE, target_addr, addrlen))
+    if (!access_ok(thread_cpu, VERIFY_WRITE, target_addr, addrlen)) {
         return -TARGET_EFAULT;
+    }
 
     addr = alloca(addrlen);
 
-- 
2.20.1



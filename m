Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB01A30E324
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:19:43 +0100 (CET)
Received: from localhost ([::1]:56102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ngk-0003Cm-Q4
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOX-0007Ot-Sk
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:56 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOS-0001gg-IW
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:53 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b17so380334plz.6
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L4t/8M8kFq5a42opgp1R5x4ZoXUV03vj2iLC3WBwq9Q=;
 b=M5MpYmojqIDGwcczEjz63Nzqmq3ySYmSbPrOcsJ1zGi0FHI3as5Q+goqScIGBxB+Hi
 hQEDO2Zv8S/IGMsuTvnFwi0AF2Cc/SvLS6zsxEsHDbr/og7qQaZDkgEe5WP5cAnl5cCg
 Bm0OdWdwvubpnE47GdDe3253QoHvLc8btp5uEa60OZ1pAjx+ba6jGfN7KIdGbCh4tqWv
 FWkTe+03USm7RJhTETiwaUqOokjhkhX3embQhwSPuYxDL4gmAfscmo99UytPgXluXCVV
 ZGEBIIte9eu2/hm+qchh0aw0KEucoYBW98Cgg28GtMcu/Iv2a8SxvV5cmnVUttFMKjzT
 hRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L4t/8M8kFq5a42opgp1R5x4ZoXUV03vj2iLC3WBwq9Q=;
 b=B26/OYVX/+o7ve4j3xKfRBXqF82rC8GGosuNkGLSTp3e7Z3FLKwLG/2oWSVQ6Jut92
 BU/FzXjHMCip7a5odIlNRnEPXaNj3cEBEn7wSaKJSvN3mOan6ffK1XNj4nhd4ifhhYLW
 UNWjeerA0XJ/IiMR9DcDtXQs0Ou/fL+G5OHBik2aruCOI7vwD1N4F0NutW68CLz1zpEd
 7YlgpJJ1JGNBQlTqtsDOuGS3s+qfWJFiykPN4G3+QmWypgl0/sZNWbJo8wQ3goIUunU2
 +njKRWzr8vofUoo/VaWCLYpFZ1KGVFekoQsxPmiS3w2p8mS0WN5dauElxXbiY2gbbHK8
 prZA==
X-Gm-Message-State: AOAM533O5IWT1ynRasdhP4VrByGNAUTFGGttW/3WyIlVt+V0+ptxdSQE
 ytKrJOjhHa7rraKBoSmbhsePvII3VeNavVu0
X-Google-Smtp-Source: ABdhPJzI7foHxNzutqLjh3noxCtq4pO3PgL8cfUj5HG7Sv1q3U0t8TVDNosRjTtXd682YvLljWkvTg==
X-Received: by 2002:a17:90a:67ca:: with SMTP id
 g10mr4496965pjm.28.1612378847178; 
 Wed, 03 Feb 2021 11:00:47 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/31] linux-user: Use cpu_untagged_addr in access_ok;
 split out *_untagged
Date: Wed,  3 Feb 2021 08:59:55 -1000
Message-Id: <20210203190010.759771-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Provide both tagged and untagged versions of access_ok.
In a few places use thread_cpu, as the user is several
callees removed from do_syscall1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h          | 11 +++++++++--
 linux-user/elfload.c       |  2 +-
 linux-user/hppa/cpu_loop.c |  8 ++++----
 linux-user/i386/cpu_loop.c |  2 +-
 linux-user/i386/signal.c   |  5 +++--
 linux-user/syscall.c       |  9 ++++++---
 6 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index b3ccffbf0f..82eabb73f8 100644
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
index f542841ba2..e7209e03cb 100644
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
index 944511bbe4..3aaaf3337c 100644
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
index 19c8a18cd3..f813e87294 100644
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
index 97a39204cc..9320e1d472 100644
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
index 30a5021509..24fc1daf02 100644
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
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EBF31CE1D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:34:53 +0100 (CET)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3JM-0000iF-5M
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32s-0008Be-63
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:50 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32H-0002QN-7r
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:49 -0500
Received: by mail-wr1-x42a.google.com with SMTP id b3so13779447wrj.5
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oOzT7sOzTR42HbW+vtiKP9qod26e6MefuWrn5uRr7O8=;
 b=PqA3VTobA2mXBwuPZmASvILebCTcpUuLAmR1HYBvFwDgg/J90eWJ3a76iNO4u8UUw3
 VBGiDRQ9Dmcyp+A3/pVM+3FYF6KI1mSHNslo1mwDKgRO+WDLsIYk69KYnAwhvd2LhYQa
 5zg+NiOPUp+hciDtQPCEu7RZO43lZ0RT4ooHFLxhpGkgKEc+uKSozB2+hS2vS7+vrMmC
 AY6JpRGQcAmlMWWshG5ffBMyC4OUjF1zdWzNywRIEoQ9uE/2VkeDUCvn8pV3RaI532ry
 3MoCBBmOvooR5xIkox5NVVFHXB3rTgX+62+zbAjmQtcO07TlJXonPNoy2Dw/V9KSTe+C
 ZkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOzT7sOzTR42HbW+vtiKP9qod26e6MefuWrn5uRr7O8=;
 b=Qb4EGGqx2X9IEuDNFqBKfIh3wkpf0URCIYizVVG491l5wqcQRLN3A1JxDn7IQTO8Rd
 hiGnraGPnXJFYn5oPze2Zl9V36a3QECDOMFg3E59ucrVqzF/uAjQP1UcC8Ndvd+kz60H
 s7wXfmEr+QrYAWG0MsAPcVYRlwAnmVk+cITqQ/DQQQjeq6aVdHmipdv039A1bwcyxuNd
 8ETryAZQnSPIFM2dyIuidJBjzp2ZjO39CbTnkzFQFWMIN16XqPf3E9giDOg7eExUA+aR
 i4xLMF6qEp4wbLN3px74RHe0bIG8q0b72hGaDhvtBn7E0INR/tFtHfTXyZUhWkJKV9uT
 j+Qw==
X-Gm-Message-State: AOAM531FlyFyMrqWGMIGU1muY12OygN2ayPqEmVBClghlNKH0YPRvf5f
 BOCD59TY9wZSvNpuaeRUQWN2O3pctoxd3A==
X-Google-Smtp-Source: ABdhPJytGbfUZG7DQNKlGepozdu+Rk5wjTBYSvYEC8AitbDdHEjBWa2K74utjsuqj/oO4JPbMA78Yg==
X-Received: by 2002:adf:eac6:: with SMTP id o6mr23982189wrn.172.1613492232000; 
 Tue, 16 Feb 2021 08:17:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/40] linux-user: Use cpu_untagged_addr in access_ok;
 split out *_untagged
Date: Tue, 16 Feb 2021 16:16:34 +0000
Message-Id: <20210216161658.29881-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Message-id: 20210212184902.1251044-17-richard.henderson@linaro.org
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
index 902be3ff117..73d750c8091 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3510,7 +3510,7 @@ static int vma_get_mapping_count(const struct mm_struct *mm)
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
index 53529e4004c..3d0411da57e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3526,8 +3526,9 @@ static abi_long do_accept4(int fd, abi_ulong target_addr,
         return -TARGET_EINVAL;
     }
 
-    if (!access_ok(VERIFY_WRITE, target_addr, addrlen))
+    if (!access_ok(thread_cpu, VERIFY_WRITE, target_addr, addrlen)) {
         return -TARGET_EFAULT;
+    }
 
     addr = alloca(addrlen);
 
@@ -3557,8 +3558,9 @@ static abi_long do_getpeername(int fd, abi_ulong target_addr,
         return -TARGET_EINVAL;
     }
 
-    if (!access_ok(VERIFY_WRITE, target_addr, addrlen))
+    if (!access_ok(thread_cpu, VERIFY_WRITE, target_addr, addrlen)) {
         return -TARGET_EFAULT;
+    }
 
     addr = alloca(addrlen);
 
@@ -3588,8 +3590,9 @@ static abi_long do_getsockname(int fd, abi_ulong target_addr,
         return -TARGET_EINVAL;
     }
 
-    if (!access_ok(VERIFY_WRITE, target_addr, addrlen))
+    if (!access_ok(thread_cpu, VERIFY_WRITE, target_addr, addrlen)) {
         return -TARGET_EFAULT;
+    }
 
     addr = alloca(addrlen);
 
-- 
2.20.1



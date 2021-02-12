Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237EB31A4FF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:09:36 +0100 (CET)
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdot-0001P7-3B
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVW-0001jz-7c
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:34 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVN-0007p7-LX
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:33 -0500
Received: by mail-pf1-x42a.google.com with SMTP id b145so72427pfb.4
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dS8ZnOshKJTWxglNrhrN5+PeQHaP6QIVapKYl4oypmA=;
 b=YYL50dSquZH3FnzErJEydQa3FLPcjekbVaS99qoXRBxIpavdNWq30qcndjWg9IFBQG
 JlLRxWDjrT4G0laReFX0u9N/q24usE2UE0B08bT4+DbfWhhWDfq6Hp7ST7QVXnx3J5V8
 J+HZbsUxlzzkz/dsdFVqgryXGBXbDFXEiZhWhn14v2vsb77Oo3fHtdisRrhnexMyqDQH
 X6ZpqJO5oSTabqcBSQL3PP2Ou6BXwl8maVbSJDxls3LzGuED1k60Mf4hiFDxKpBD0jdS
 ebzZIGRlqefuOInHnrzSufesRyEYTwsbz7blVeV4OEIYYph15qV79FNlInrAvKWHQwpf
 22dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dS8ZnOshKJTWxglNrhrN5+PeQHaP6QIVapKYl4oypmA=;
 b=Lz4vxNrQnZ5vZLzMmiZ37YsVkvu2TSQUyWcMSVFCu2hzQ1L4Uk+jzRq6RX3NKlHPMf
 Sfxq0OyO+9ZR9kT7sY2XSLH7Bhj1UC0K+Psw1FgICova+QMBYC5RORxYZYRlnhvQb0W0
 /0pvPCDBXFbWThMdq5n1CE6w/vfEu+4MQVuFTB1LWCwwIzteIw7MY8eJqYvRGIjEnCSt
 dPnDLlstutVfCf7jkdKATRQhSKj2JhlYCcUw+6e8GnG2/1gEzi2WFHz+SiLDbj/heAk+
 UTV0NmfGkKCird8QACoW/eBb6g4s8hwecrouK6XReDeKDJA8JYqv2WI81nIUrjY73xEO
 ydtg==
X-Gm-Message-State: AOAM531cIAkBeNVe2iZ3GUUL6dc/vXws8z5Z8ZGSHjQGOZE9OMn52gYw
 Rec89qWTs2/aq6llu78PplsUNPLAWQJNtQ==
X-Google-Smtp-Source: ABdhPJzMvLGem9SGCP+4woKeD1ya2salhBNPoAUgLDxJ77eGxAL1ZM1BwUL1Nf4Q8FpoL82e5UASwA==
X-Received: by 2002:a05:6a00:22d1:b029:1b4:9bb5:724c with SMTP id
 f17-20020a056a0022d1b02901b49bb5724cmr4126381pfj.63.1613155764237; 
 Fri, 12 Feb 2021 10:49:24 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 16/31] linux-user: Use cpu_untagged_addr in access_ok;
 split out *_untagged
Date: Fri, 12 Feb 2021 10:48:47 -0800
Message-Id: <20210212184902.1251044-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Provide both tagged and untagged versions of access_ok.
In a few places use thread_cpu, as the user is several
callees removed from do_syscall1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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



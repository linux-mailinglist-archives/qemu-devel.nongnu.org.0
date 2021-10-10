Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B3B4282BE
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 19:51:30 +0200 (CEST)
Received: from localhost ([::1]:40252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZcyv-0000b0-3V
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 13:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcry-0000U1-Dw
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:19 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcrw-0005qB-1v
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:17 -0400
Received: by mail-pg1-x536.google.com with SMTP id s11so8603538pgr.11
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 10:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+xpwLQQ3G87YSNylwYvHxHVXJT0SSnowXmZR7ncguZ4=;
 b=AwfA1P+B7oTp7cIicVjutkFHPKGSDxyBdEFpxVl0KBSea831gakU3flL5lRDSkhbd8
 fpP2WyhRdrNPG6zlBRMqSx497zlhsiizbJCgf2Vqw06RwX0oZa7HY5SDfAJOe6EhMSt1
 ZwE1gpC/XNq8e9eKHfpaiFZg5cIG5xm33UU+GfRwikCBn5Xxwtzq10Gpgz2PqCnJtean
 MbO9kaqMBeByO4TcF762O1jx7lpBNmZdBI4eZTP2o4Dxynm+PTBndeaxtV0aZg2uPR6f
 dlgot+Lb5HcALaMvxr0w6C9Su+tehKPapDQBuFLlPwKAj/o9OXPJlBor7H0hWf4cOATi
 U1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+xpwLQQ3G87YSNylwYvHxHVXJT0SSnowXmZR7ncguZ4=;
 b=Ui7DkPzJ/9bh7sgwR62PiGWF3vDtJWZBkicw/8uWy2FCRPJXc+a9d8AjL6MjWKS9nO
 2vunsXlnsdH8dcRdhgRDn9g37f5Dbw7lJIIy+igN3WQ1L0+wv+PzfGVlSqUXvgAt9QHh
 0IXwLjUO2NwWzPzWtWNO8yvib0ERrObr66XUO6V9p62o0uo7Z5awysFHwAl1fUqNaxC/
 3PeRXoM2KIANLrtwMM4zc37kZNZbQu/5jeLszpDc0agdkZIdsgRLwDB38KvhqyWh29BP
 UJ3EfY6WKqDx0Qzxz06Dw1U4u4BZut/PQOoZZZpt7hJ50aTW9J4rFMQwU42TLOFYq8Zq
 OuHQ==
X-Gm-Message-State: AOAM530817BrPiMhPCU1F7Eb1w+hjPc0EYkrj6k7M+OHCmQbM6kiS8qh
 bNgkfxSvwdNPFM3+Egt4CKXPoY1WKg1e2fwb
X-Google-Smtp-Source: ABdhPJzA1u19OfZQmUPO415GN0pB6eMcDWarTOmqSQYOtnU42qYGk/xstdn3mCAgzmQr18/70sZqTQ==
X-Received: by 2002:a05:6a00:140c:b0:447:96be:2ade with SMTP id
 l12-20020a056a00140c00b0044796be2ademr21015946pfu.26.1633887854719; 
 Sun, 10 Oct 2021 10:44:14 -0700 (PDT)
Received: from localhost.localdomain (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id 18sm5095391pfh.115.2021.10.10.10.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 10:44:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] linux-user: Support TCG_TARGET_SIGNED_ADDR32
Date: Sun, 10 Oct 2021 10:43:58 -0700
Message-Id: <20211010174401.141339-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211010174401.141339-1-richard.henderson@linaro.org>
References: <20211010174401.141339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using reserved_va, which is the default for a 64-bit host
and a 32-bit guest, set guest_base_signed_addr32 if requested
by TCG_TARGET_SIGNED_ADDR32, and the executable layout allows.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h |  4 ---
 linux-user/elfload.c   | 62 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 50 insertions(+), 16 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 80b5e17329..71d8e1de7a 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -278,11 +278,7 @@ extern intptr_t qemu_host_page_mask;
 #define PAGE_RESET     0x0040
 /* For linux-user, indicates that the page is MAP_ANON. */
 #define PAGE_ANON      0x0080
-
-#if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
-/* FIXME: Code that sets/uses this is broken and needs to go away.  */
 #define PAGE_RESERVED  0x0100
-#endif
 /* Target-specific bits that will be used via page_get_flags().  */
 #define PAGE_TARGET_1  0x0200
 #define PAGE_TARGET_2  0x0400
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 2404d482ba..4a3d339cf1 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2422,33 +2422,71 @@ static void pgb_dynamic(const char *image_name, long align)
 static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
                             abi_ulong guest_hiaddr, long align)
 {
-    int flags = MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE;
+    int flags = (MAP_ANONYMOUS | MAP_PRIVATE |
+                 MAP_NORESERVE | MAP_FIXED_NOREPLACE);
+    unsigned long local_rva = reserved_va;
+    bool protect_wrap = false;
     void *addr, *test;
 
-    if (guest_hiaddr > reserved_va) {
+    if (guest_hiaddr > local_rva) {
         error_report("%s: requires more than reserved virtual "
                      "address space (0x%" PRIx64 " > 0x%lx)",
-                     image_name, (uint64_t)guest_hiaddr, reserved_va);
+                     image_name, (uint64_t)guest_hiaddr, local_rva);
         exit(EXIT_FAILURE);
     }
 
-    /* Widen the "image" to the entire reserved address space. */
-    pgb_static(image_name, 0, reserved_va, align);
+    if (TCG_TARGET_SIGNED_ADDR32 && TARGET_LONG_BITS == 32) {
+        if (guest_loaddr < 0x80000000u && guest_hiaddr > 0x80000000u) {
+            /*
+             * The executable itself wraps on signed addresses.
+             * Without per-page translation, we must keep the
+             * guest address 0x7fff_ffff adjacent to 0x8000_0000
+             * consecutive in host memory: unsigned addresses.
+             */
+        } else {
+            set_guest_base_signed_addr32();
+            if (local_rva <= 0x80000000u) {
+                /* No guest addresses are "negative": win! */
+            } else {
+                /* Begin by allocating the entire address space. */
+                local_rva = 0xfffffffful + 1;
+                protect_wrap = true;
+            }
+        }
+    }
 
-    /* osdep.h defines this as 0 if it's missing */
-    flags |= MAP_FIXED_NOREPLACE;
+    /* Widen the "image" to the entire reserved address space. */
+    pgb_static(image_name, 0, local_rva, align);
+    assert(guest_base != 0);
 
     /* Reserve the memory on the host. */
-    assert(guest_base != 0);
     test = g2h_untagged(0);
-    addr = mmap(test, reserved_va, PROT_NONE, flags, -1, 0);
+    addr = mmap(test, local_rva, PROT_NONE, flags, -1, 0);
     if (addr == MAP_FAILED || addr != test) {
+        /*
+         * If protect_wrap, we could try again with the original reserved_va
+         * setting, but the edge case of low ulimit vm setting on a 64-bit
+         * host is probably useless.
+         */
         error_report("Unable to reserve 0x%lx bytes of virtual address "
-                     "space at %p (%s) for use as guest address space (check your"
-                     "virtual memory ulimit setting, min_mmap_addr or reserve less "
-                     "using -R option)", reserved_va, test, strerror(errno));
+                     "space at %p (%s) for use as guest address space "
+                     "(check your virtual memory ulimit setting, "
+                     "min_mmap_addr or reserve less using -R option)",
+                     local_rva, test, strerror(errno));
         exit(EXIT_FAILURE);
     }
+
+    if (protect_wrap) {
+        /*
+         * Prevent the page just before 0x80000000 from being allocated.
+         * This prevents a single guest object/allocation from crossing
+         * the signed wrap, and thus being discontiguous in host memory.
+         */
+        page_set_flags(0x7fffffff & TARGET_PAGE_MASK, 0x80000000u,
+                       PAGE_RESERVED);
+        /* Adjust guest_base so that 0 is in the middle of the reservation. */
+        guest_base += 0x80000000ul;
+    }
 }
 
 void probe_guest_base(const char *image_name, abi_ulong guest_loaddr,
-- 
2.25.1



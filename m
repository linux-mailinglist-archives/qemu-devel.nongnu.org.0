Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCC54C58F3
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 03:11:54 +0100 (CET)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO92P-0005Xm-Lv
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 21:11:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8vB-0002VC-LR
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:25 -0500
Received: from [2607:f8b0:4864:20::631] (port=36510
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8vA-0007SZ-1k
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:25 -0500
Received: by mail-pl1-x631.google.com with SMTP id e13so7909386plh.3
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 18:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nYpHk91d8Z1upIT+R8AUAaAp7pb2ZR3ZZpIaqxd5Msg=;
 b=wmBYbCVtP3bXwQZAJYlJ67OFnnT++tnSlCYYDiP9iM5jah/qSztzle044ZOvHR7Ex5
 B/6UkCc/JoNxRClME4ejmzwS4DuB3NJufQQ9ecJLkCNXmaDif//OdDXqj0TWqzqFBZdF
 lvHcG1VyyjYDsiw8HNpEvcAd84OIZYjLct34VOZZql3gzABw7RrgYKzIGwDs/RfPzs73
 d3ZwhwdKu+e67aVtcreSCMZ7LpHCfZFtyD3N1HkSFaGyCuW3ooY/vvWLQIwFE0k4/elw
 CoaE+qRmhyqilBQiFGwAsooQ/mUvBF7HcOCJptaBu+K//6q4Hijd0V7n55iFHYItTUVv
 Jq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nYpHk91d8Z1upIT+R8AUAaAp7pb2ZR3ZZpIaqxd5Msg=;
 b=jMSsZweSnI3Z4opjUs2fjcb9p7LGPkiinKQYaJvlBkva7zpcv7kHA5c9L+2BnmDU6b
 +lD3pFcqPEo47N4AArVIx0GWFTvFadl7iUPuc5dBC7ZMWHpsF68dAcjAFAh3dt0cPQMa
 pGeHZPsLzsZgH5aFbJmaMs+AbWV7iwrSln/1JEloEJW41OT6rdRjEdx5uU84cijKoLIL
 bVKXzkH/P07NgkWvVBFSnQiJIcwkZStosFm2fodTwBz8WQ8Wyj8CNxsc/i9cwyX8WkRH
 4eq6cINhlnvmm7s/h3/ChyJKHhGzYaYur3i4OvETmJSwCG0yrRZtcoz53iZhwasRmtZZ
 bg1g==
X-Gm-Message-State: AOAM5301Yk7EPe4zVrVOxtotSQqLFoXpgHwmQlLzINvkEjvTMD/UvY+e
 jjUENUgYDW+t0uUUxFWykbKoAxPM01ckAhqU
X-Google-Smtp-Source: ABdhPJw4fkxF3Qd7K/fR3SIQ3dtzOemokkIaTo8wbu5RBJSAhf0p6ajTBH2CF7QewVudvpFTXK88qg==
X-Received: by 2002:a17:90a:d498:b0:1bc:9269:e46b with SMTP id
 s24-20020a17090ad49800b001bc9269e46bmr10015295pju.95.1645927462739; 
 Sat, 26 Feb 2022 18:04:22 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm8304021pfj.43.2022.02.26.18.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 18:04:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/9] linux-user: Support TCG_TARGET_SIGNED_ADDR32
Date: Sat, 26 Feb 2022 16:04:09 -1000
Message-Id: <20220227020413.11741-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227020413.11741-1-richard.henderson@linaro.org>
References: <20220227020413.11741-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using reserved_va, which is the default for a 64-bit host
and a 32-bit guest, set guest_base_signed_addr32 if requested
by TCG_TARGET_SIGNED_ADDR32, and the executable layout allows.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h |  4 ---
 linux-user/elfload.c   | 62 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 50 insertions(+), 16 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 26ecd3c886..8bea0e069e 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -269,11 +269,7 @@ extern const TargetPageBits target_page;
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
index 9628a38361..5522f9e721 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2482,34 +2482,72 @@ static void pgb_dynamic(const char *image_name, long align)
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
+
     qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %p for %lu bytes\n",
                   __func__, addr, reserved_va);
 }
-- 
2.25.1



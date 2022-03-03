Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F94CC605
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:28:35 +0100 (CET)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPr7q-0008BQ-7C
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:28:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvp-0001wV-Ro
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:09 -0500
Received: from [2607:f8b0:4864:20::62b] (port=46911
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvk-0007Sn-3U
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:09 -0500
Received: by mail-pl1-x62b.google.com with SMTP id bd1so5545557plb.13
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F2bsGcziKKgWIATQyKoWzWtQMllrUtNMWOT4PiIDWxo=;
 b=La+UZkFGsKvGG3mpg7hSMQ4FthcocZ8kLEh2JGTOpFGcCbVk9Q0pOUFDYGsuMvM52/
 t6uDWcCCZ42L9Io//OpzuiA+eE9qRyt13w0mmfaPnrnigk/tEbPqfLGls0rdrOrSNnfi
 5XkIj/Fm3/FJfa3Y5T5W2NatvI9tMKAWudI9rX9gNdiE1yq9Re7+ol5fMXxKOGQvRUJ2
 TraUNs8AVkqvAC8S2SqkrnI27f5+SIzd/Di2HQdF6sYlUvqWIPGuN4YfVbKril9tkr0z
 ldgBIjWYw0VqBDRXYkfmG/LJ+6DOg9ORmEYQP1uJOG84KrNaz+GBr/3F8qMJ8c+J1YZs
 HXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F2bsGcziKKgWIATQyKoWzWtQMllrUtNMWOT4PiIDWxo=;
 b=hrkjPM2Lj/wvH3odxrrecv5A0VS6EK44ZPL6lSAqa75d6Prpf/dvqx34jlg3qZ5fk/
 +l3UhdA2LUH9h0GZEcs27F+i4vYjJifwcArUW96gOtfR+brIaoBwwJcAi0JOXlDT8BTO
 MBMq6ZXeysJgO7QXr7NMLh3bSHMX9YO4TOurHyKs+XuS0PstSy77Fr2cfkSc0OslY2xQ
 yOZeh4J8vMZoj0dO0siERr/4yGzf8DIy5ijoxtXq5UjeRYMQToOiQPGZ1oPs5x1GPpBd
 8iYbLl+R6fxGd6LZeY56ZuJtz6xsYynVzYvOyiuUTmdxL5vnzYc53npicLP3kgFLyHj6
 vDHg==
X-Gm-Message-State: AOAM532JAapDFmI0aGVv9VlpBgT1oLzN+BXvEhSn7zR6W9VW5gKd5tkV
 xYcCLTE0Vbt7V/NIbeW/95PHNUTmWRn1sw==
X-Google-Smtp-Source: ABdhPJwT8Z3ziOY+Ruf2W+MGq4lgVPJSjjhaHO4M8xFxvEphtF+tVNYwRTuFrZEU+cI02hLX8DPmcA==
X-Received: by 2002:a17:90b:1a81:b0:1bc:c3e5:27b2 with SMTP id
 ng1-20020a17090b1a8100b001bcc3e527b2mr6997483pjb.20.1646334961675; 
 Thu, 03 Mar 2022 11:16:01 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm3318043pfh.46.2022.03.03.11.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:16:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/9] linux-user: Support TCG_TARGET_SIGNED_ADDR32
Date: Thu,  3 Mar 2022 09:15:47 -1000
Message-Id: <20220303191551.466631-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303191551.466631-1-richard.henderson@linaro.org>
References: <20220303191551.466631-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using reserved_va, which is the default for a 64-bit host
and a 32-bit guest, set guest_base_signed_addr32 if requested
by TCG_TARGET_SIGNED_ADDR32, and the executable layout allows.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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



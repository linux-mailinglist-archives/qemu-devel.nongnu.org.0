Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB874CC7FC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:26:53 +0100 (CET)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsyK-0002si-8z
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:26:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsZ8-0006Gi-VH
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:58 -0500
Received: from [2607:f8b0:4864:20::535] (port=45986
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsZ5-0004Mo-F7
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:50 -0500
Received: by mail-pg1-x535.google.com with SMTP id z4so5727019pgh.12
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F2bsGcziKKgWIATQyKoWzWtQMllrUtNMWOT4PiIDWxo=;
 b=xaM3nO1Z7t8mvnumCJbXeBaLgfVBw3Up3BI6SchgirWFH0FJt+uLTBBjJj830g95nV
 WnRut+EexZ6GueiZVmknRrO2wv6l7sFjE+ICg3BDJTZ+CWxtKV8VA1l2ctJY+wCpxNV9
 97AbhheEC/USN8l4kofaXsosVC8XC0jftnt39hsHv5WT5RgCcR0FoHXNvoDGOIHgwKx+
 ZmExvBiCnm95+BlnA6x58JW475OR5i7ShCww8kwmyc9mkxt9SUPSp+qjPhez+VE2ZpuY
 sKqPbLAAlmpKIprzAz2gi/B+28i0F/cmycJS1mFXlHpaUBg9qobfoSm4W09d3YA7GGvR
 7xOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F2bsGcziKKgWIATQyKoWzWtQMllrUtNMWOT4PiIDWxo=;
 b=VVGnYRIWmkyNkxms6lBm/6sukzhMDPUa7WtN0cjfQbRNlv9/pu3IW/2ZSFRRDPotkw
 GRYPehf28IGPx1BMehNF45a9O0cqAiO/Cz0qRn+rvOeJI+MRcDHxNtaxF7PoqCNfSOgt
 IxNyzh6jBJRB5XOR8Ji8EJz5PqVpr8roGGq/MC/nK+d5bzMjZ+of+X7CVGkbydNjrCID
 CUJWUPr9QfHw22ZHGKrinhxWYdlu7shq8csE12o5DKZ9ACIZ3y6aNJxPy3GG09NwEmDh
 +hbIDBSLQXB2XODYVtzddVx3CrVWRt/eWRm4uSoxMfCQUJwyB/E9vyAiUacUsTFRQydm
 DnnA==
X-Gm-Message-State: AOAM530YTx2638s/jy11Mt5MKJEfXabi9S0qTwxZ4Lbxq27ZXxMjfNNf
 gI0u3YStYiSgEdTY4yysLyUxNH56PTKxGw==
X-Google-Smtp-Source: ABdhPJzTu711mfWHD36F2u4tByQGATZtLq0mAZ+xpa26pXocLXyCuaRbhqd9O20WoYVJof63imPVig==
X-Received: by 2002:a63:684a:0:b0:37c:5fa7:9f7e with SMTP id
 d71-20020a63684a000000b0037c5fa79f7emr2934407pgc.358.1646341226557; 
 Thu, 03 Mar 2022 13:00:26 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/30] linux-user: Support TCG_TARGET_SIGNED_ADDR32
Date: Thu,  3 Mar 2022 10:59:40 -1000
Message-Id: <20220303205944.469445-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
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



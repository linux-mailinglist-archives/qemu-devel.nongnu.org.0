Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C078A2D996A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:06:54 +0100 (CET)
Received: from localhost ([::1]:45842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooV3-0003RR-N5
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRi-0001WJ-O8
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:26 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRe-0003to-7U
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:25 -0500
Received: by mail-oi1-x241.google.com with SMTP id p126so19231068oif.7
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eOSyuirsXar+NqX//DtRTIYo0GnDDZiWnjXVEGBW7Sk=;
 b=A1CANqEFLIY4vWkipsGU4H9saAafv8nFQCXtlSKamdHh6GQxX77YAGMZwTxXHkpY6y
 VTCXvDliHkGgMfEON7gW/36y77V+LrH+m/DPG8p8/nJri1q+8NUndfmciLg15oVU0Q1h
 H4qhw5+Rti4xvKI26q4bJexHXrF1Koyd5FocDLNb1BCGuQk4ku1Gfjyc065duJjrjOXe
 k7JYrJFcoDyrfnlzx1qkGBBGm3httmhARPxNb16CnQbaeLP68ekmHEeehdYtYHc+LqxY
 DOrtLoNXINM359nn1RbRI04+xhRVVq+8PcmIAUUlL0ovgGDpb8aQYw5pYzRng51hsbcj
 f8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eOSyuirsXar+NqX//DtRTIYo0GnDDZiWnjXVEGBW7Sk=;
 b=XQ4jZPwlcQv3/Vysz1ddTCwIhpAQXD6JcAiwbCFvylmaumxRpfijxsKJE1GVF2q6T7
 u+QzRcu5wSsaj74cgRtu/wYH+j6Y0kMwJFr6IoCfrlCSH4RtXpfFGRwJaju+r/BmXXb7
 rOXiWuzqR2AyEoh0nF0eJwK78u9r3TJ2MJ8tWPpWgZBQPgmUgoktu9uaaLJJOS0x2Nit
 JiUT4xCEa5FHCm8nohU/pUSGdlIlHJdii4xvNQd1J49Bd0/TW7ejCNUbqPuelWofZOYG
 BV9ytZ6/FTLLbto2lY7yUk2aPE6dlqnfa7VGWdZ3sQMiSs32FqyLe6VUteQQC/1e52N+
 PuHw==
X-Gm-Message-State: AOAM531UTbcNc2VVONqjWgQUp4QSYAHKiaD89crxHQrIGNZCajQBPWai
 QpS9wA6IqjEH24OLdIbk0pIQB3BAJ5HgiRWj
X-Google-Smtp-Source: ABdhPJyqWFJqwDygL0f/zI5ahl+RlXtnamLDvjZGU748GHwAw/fGL7kHyBSsl/1p2yuxNHfDHCWINQ==
X-Received: by 2002:aca:b943:: with SMTP id j64mr12318009oif.71.1607954600057; 
 Mon, 14 Dec 2020 06:03:20 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/43] util: Extract flush_icache_range to cacheflush.c
Date: Mon, 14 Dec 2020 08:02:33 -0600
Message-Id: <20201214140314.18544-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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

This has been a tcg-specific function, but is also in use
by hardware accelerators via physmem.c.  This can cause
link errors when tcg is disabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/cacheflush.h | 24 +++++++++++++
 tcg/aarch64/tcg-target.h  |  5 ---
 tcg/arm/tcg-target.h      |  5 ---
 tcg/i386/tcg-target.h     |  4 ---
 tcg/mips/tcg-target.h     | 11 ------
 tcg/ppc/tcg-target.h      |  1 -
 tcg/riscv/tcg-target.h    |  5 ---
 tcg/s390/tcg-target.h     |  4 ---
 tcg/sparc/tcg-target.h    |  8 -----
 tcg/tci/tcg-target.h      |  4 ---
 softmmu/physmem.c         |  1 +
 tcg/tcg.c                 |  1 +
 util/cacheflush.c         | 71 +++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |  2 ++
 tcg/ppc/tcg-target.c.inc  | 22 ------------
 util/meson.build          |  2 +-
 16 files changed, 100 insertions(+), 70 deletions(-)
 create mode 100644 include/qemu/cacheflush.h
 create mode 100644 util/cacheflush.c

diff --git a/include/qemu/cacheflush.h b/include/qemu/cacheflush.h
new file mode 100644
index 0000000000..58ae488491
--- /dev/null
+++ b/include/qemu/cacheflush.h
@@ -0,0 +1,24 @@
+/*
+ * Flush the host cpu caches.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_CACHEFLUSH_H
+#define QEMU_CACHEFLUSH_H
+
+#if defined(__i386__) || defined(__x86_64__) || defined(__s390__)
+
+static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
+{
+    /* icache is coherent and does not require flushing. */
+}
+
+#else
+
+void flush_icache_range(uintptr_t start, uintptr_t stop);
+
+#endif
+
+#endif /* QEMU_CACHEFLUSH_H */
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 663dd0b95e..8a6b97598e 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -148,11 +148,6 @@ typedef enum {
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
-{
-    __builtin___clear_cache((char *)start, (char *)stop);
-}
-
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 
 #ifdef CONFIG_SOFTMMU
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 17e771374d..f1955ce4ac 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -134,11 +134,6 @@ enum {
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
-{
-    __builtin___clear_cache((char *) start, (char *) stop);
-}
-
 /* not defined -- call should be eliminated at compile time */
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index abd4ac7fc0..cd067e0b30 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -206,10 +206,6 @@ extern bool have_avx2;
 #define TCG_TARGET_extract_i64_valid(ofs, len) \
     (((ofs) == 8 && (len) == 8) || ((ofs) + (len)) == 32)
 
-static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
-{
-}
-
 static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
                                             uintptr_t jmp_addr, uintptr_t addr)
 {
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index c6b091d849..92c1d63da3 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -198,20 +198,9 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_ext16u_i64       0 /* andi rt, rs, 0xffff */
 #endif
 
-#ifdef __OpenBSD__
-#include <machine/sysarch.h>
-#else
-#include <sys/cachectl.h>
-#endif
-
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
-{
-    cacheflush ((void *)start, stop-start, ICACHE);
-}
-
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 
 #ifdef CONFIG_SOFTMMU
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index be10363956..a509a19628 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -175,7 +175,6 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_bitsel_vec       have_vsx
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
-void flush_icache_range(uintptr_t start, uintptr_t stop);
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 032439d806..c1bd52bb9a 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -159,11 +159,6 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i64        1
 #endif
 
-static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
-{
-    __builtin___clear_cache((char *)start, (char *)stop);
-}
-
 /* not defined -- call should be eliminated at compile time */
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 63c8797bd3..b4feb2f55a 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -145,10 +145,6 @@ enum {
     TCG_AREG0 = TCG_REG_R10,
 };
 
-static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
-{
-}
-
 static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
                                             uintptr_t jmp_addr, uintptr_t addr)
 {
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 633841ebf2..d8b0e32e2e 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -168,14 +168,6 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
-{
-    uintptr_t p;
-    for (p = start & -8; p < ((stop + 7) & -8); p += 8) {
-        __asm__ __volatile__("flush\t%0" : : "r" (p));
-    }
-}
-
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 8c1c1d265d..b84480f989 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -191,10 +191,6 @@ void tci_disas(uint8_t opc);
 
 #define HAVE_TCG_QEMU_TB_EXEC
 
-static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
-{
-}
-
 /* We could notice __i386__ or __s390x__ and reduce the barriers depending
    on the host.  But if you want performance, you use the normal backend.
    We prefer consistency across hosts on this.  */
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3027747c03..36854f0cd0 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -22,6 +22,7 @@
 #include "qapi/error.h"
 
 #include "qemu/cutils.h"
+#include "qemu/cacheflush.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/target_page.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 3b3f366acd..4b4cafe952 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -35,6 +35,7 @@
 #include "qemu/host-utils.h"
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
+#include "qemu/cacheflush.h"
 
 /* Note: the long term plan is to reduce the dependencies on the QEMU
    CPU definitions. Currently they are used for qemu_ld/st
diff --git a/util/cacheflush.c b/util/cacheflush.c
new file mode 100644
index 0000000000..2881832a38
--- /dev/null
+++ b/util/cacheflush.c
@@ -0,0 +1,71 @@
+/*
+ * Flush the host cpu caches.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/cacheflush.h"
+
+
+#if defined(__i386__) || defined(__x86_64__) || defined(__s390__)
+
+/* Caches are coherent and do not require flushing; symbol inline. */
+
+#elif defined(__mips__)
+
+#ifdef __OpenBSD__
+#include <machine/sysarch.h>
+#else
+#include <sys/cachectl.h>
+#endif
+
+void flush_icache_range(uintptr_t start, uintptr_t stop)
+{
+    cacheflush((void *)start, stop - start, ICACHE);
+}
+
+#elif defined(__powerpc__)
+
+void flush_icache_range(uintptr_t start, uintptr_t stop)
+{
+    uintptr_t p, start1, stop1;
+    size_t dsize = qemu_dcache_linesize;
+    size_t isize = qemu_icache_linesize;
+
+    start1 = start & ~(dsize - 1);
+    stop1 = (stop + dsize - 1) & ~(dsize - 1);
+    for (p = start1; p < stop1; p += dsize) {
+        asm volatile ("dcbst 0,%0" : : "r"(p) : "memory");
+    }
+    asm volatile ("sync" : : : "memory");
+
+    start &= start & ~(isize - 1);
+    stop1 = (stop + isize - 1) & ~(isize - 1);
+    for (p = start1; p < stop1; p += isize) {
+        asm volatile ("icbi 0,%0" : : "r"(p) : "memory");
+    }
+    asm volatile ("sync" : : : "memory");
+    asm volatile ("isync" : : : "memory");
+}
+
+#elif defined(__sparc__)
+
+void flush_icache_range(uintptr_t start, uintptr_t stop)
+{
+    uintptr_t p;
+
+    for (p = start & -8; p < ((stop + 7) & -8); p += 8) {
+        __asm__ __volatile__("flush\t%0" : : "r" (p));
+    }
+}
+
+#else
+
+void flush_icache_range(uintptr_t start, uintptr_t stop)
+{
+    __builtin___clear_cache((char *)start, (char *)stop);
+}
+
+#endif
diff --git a/MAINTAINERS b/MAINTAINERS
index d48a4e8a8b..2e23a93fec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -119,6 +119,8 @@ F: softmmu/cpus.c
 F: cpus-common.c
 F: accel/tcg/
 F: accel/stubs/tcg-stub.c
+F: util/cacheinfo.c
+F: util/cacheflush.c
 F: scripts/decodetree.py
 F: docs/devel/decodetree.rst
 F: include/exec/cpu*.h
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 18ee989f95..0d068ec8ab 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -3863,25 +3863,3 @@ void tcg_register_jit(void *buf, size_t buf_size)
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
 #endif /* __ELF__ */
-
-void flush_icache_range(uintptr_t start, uintptr_t stop)
-{
-    uintptr_t p, start1, stop1;
-    size_t dsize = qemu_dcache_linesize;
-    size_t isize = qemu_icache_linesize;
-
-    start1 = start & ~(dsize - 1);
-    stop1 = (stop + dsize - 1) & ~(dsize - 1);
-    for (p = start1; p < stop1; p += dsize) {
-        asm volatile ("dcbst 0,%0" : : "r"(p) : "memory");
-    }
-    asm volatile ("sync" : : : "memory");
-
-    start &= start & ~(isize - 1);
-    stop1 = (stop + isize - 1) & ~(isize - 1);
-    for (p = start1; p < stop1; p += isize) {
-        asm volatile ("icbi 0,%0" : : "r"(p) : "memory");
-    }
-    asm volatile ("sync" : : : "memory");
-    asm volatile ("isync" : : : "memory");
-}
diff --git a/util/meson.build b/util/meson.build
index f359af0d46..a3dfc0f966 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -21,7 +21,7 @@ util_ss.add(files('envlist.c', 'path.c', 'module.c'))
 util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
 util_ss.add(files('fifo8.c'))
-util_ss.add(files('cacheinfo.c'))
+util_ss.add(files('cacheinfo.c', 'cacheflush.c'))
 util_ss.add(files('error.c', 'qemu-error.c'))
 util_ss.add(files('qemu-print.c'))
 util_ss.add(files('id.c'))
-- 
2.25.1



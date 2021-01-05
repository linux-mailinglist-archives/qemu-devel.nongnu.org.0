Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882F72EB15A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:28:00 +0100 (CET)
Received: from localhost ([::1]:53028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwq7j-00041a-J8
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0A-0002Gi-GG
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:10 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq04-0006Qt-AT
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:09 -0500
Received: by mail-pg1-x531.google.com with SMTP id g15so270403pgu.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=COs7EFurKzdEkJGVYLhpSUwSiXcrdUCH71QLYE3G/IY=;
 b=o/DHP8nA3c0qaJHuVflNt0hD/a0l2DAfXC5Uz3392oapIv7eUM/5mqcJKG797HWXDV
 QPTGuIll0CUKrhAQueq7Uuohprb8VDtNYKFqJSzYgkGjrInavFyT1S7faulZr3fE619K
 aBCjPlbsCh8u5kRYrtOcrcK2LvNLaaLsT93wUvWkPYEFlNxTnxTsj/UmJ9Yo6UcuUZas
 B5p/Xd5KAKGoyW9p3eA6Jxmw0YC2TMI8ScgmfGn9LbMsPxg1doM2+nmC8nNvSai2Kcad
 vHc7jdhMksuogtp3rF06kAdUkfxaVz/+LOc2ukvle9gttdzfSN4oDWa02UtACYxr2Ny8
 wOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=COs7EFurKzdEkJGVYLhpSUwSiXcrdUCH71QLYE3G/IY=;
 b=FadbUOKEPMeY35gNXughF5ON1EvnN/F8kcJ2wV6w6De2YPl5h8fjExMgQtFNsEQYmi
 2v9XoRxEGr9/04odHMGKwI3vKOGdUKm1OB4wRlvPNOA/tAXAMcLVvM5nFNLD5bDdy6RE
 Z+AxKUomO98eInYjGSZJNNxB5+7m0PNGrgO+37g6ITGiIkS/3ADwxffwp9bWzMwQnjIA
 To9nRKC+S4IMulgtFOvNj4RJ4PbRTFx0va5+g27A3IHRkk4qS0pVLA43Hrycpzs22PMe
 qkRhvGa7OoxwIXBjRFOfmwaipcVqxevdOfmf0OmV6uDGjT+SWr6cnHE+/pDm2U5yOOkr
 LbPA==
X-Gm-Message-State: AOAM532Uk4F8shFkmUoZjBBAH7W1E9cBzhXBQgLtHp+KMAKmzXD0ReKL
 +Pc1sU8G9RNEwfdAfIfCNiQHZa8X5XnKug==
X-Google-Smtp-Source: ABdhPJyknskaiB11LWqlBZW1JG9SttvXdxQH7wPaIA5wiFc4EXGoErdD490e84RRadY0G8q4XN91pQ==
X-Received: by 2002:a62:184e:0:b029:19e:c636:17f9 with SMTP id
 75-20020a62184e0000b029019ec63617f9mr442575pfy.23.1609867201483; 
 Tue, 05 Jan 2021 09:20:01 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/43] util: Extract flush_icache_range to cacheflush.c
Date: Tue,  5 Jan 2021 07:19:09 -1000
Message-Id: <20210105171950.415486-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has been a tcg-specific function, but is also in use
by hardware accelerators via physmem.c.  This can cause
link errors when tcg is disabled.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
 tcg/ppc/tcg-target.c.inc  | 22 ------------
 MAINTAINERS               |  2 ++
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
index d1159d80c6..108a1fa969 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -149,11 +149,6 @@ typedef enum {
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
index 1e132afa75..1e18fefd0e 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -135,11 +135,6 @@ enum {
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
index abe8636f0d..f3836a4d0c 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -210,10 +210,6 @@ extern bool have_movbe;
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
index b04c12d317..624248b81e 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -199,20 +199,9 @@ extern bool use_mips32r2_instructions;
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
index 7ff46b3d6d..301173c97e 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -176,7 +176,6 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_bitsel_vec       have_vsx
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
-void flush_icache_range(uintptr_t start, uintptr_t stop);
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index ccda7b83c4..888288d54c 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -160,11 +160,6 @@ typedef enum {
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
index 7e7396caf2..69576f4a9a 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -146,10 +146,6 @@ enum {
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
index f2989b3b45..9dce305253 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -169,14 +169,6 @@ extern bool use_vis3_instructions;
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
index 7192d5319e..e8277caee2 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -192,10 +192,6 @@ void tci_disas(uint8_t opc);
 
 #define HAVE_TCG_QEMU_TB_EXEC
 
-static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
-{
-}
-
 /* We could notice __i386__ or __s390x__ and reduce the barriers depending
    on the host.  But if you want performance, you use the normal backend.
    We prefer consistency across hosts on this.  */
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 2cd1de4a2c..c595266b9f 100644
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
index df2857dc88..9bdc450196 100644
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 42fedf91e7..478bea667c 100644
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



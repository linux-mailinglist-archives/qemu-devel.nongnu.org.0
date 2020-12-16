Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2E2DC1D3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:07:03 +0100 (CET)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXSI-00056C-82
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpXHH-000509-2a
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:55:39 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpXHD-0000t0-Tf
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:55:38 -0500
Received: by mail-ej1-x62f.google.com with SMTP id d17so32830093ejy.9
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iOOVTid6TaZdEBZyZEIXgmDYaXapbxxAU5SjDeskRWA=;
 b=rIgSakw8g4yfUqcCtbM/UQ6UbPHGgchhnF8CR3DHhjm+mnpEW0yeTg6Q5bMsRUAtvf
 jjAExZwV4yyLYOwE9JVphdr2RhkpHRgSs/YTR7kf1m84Ix5LR4BFf2tOq3ta6gCJ0Sc5
 SLEQGeetTM747JvGOhbMCIfDY1PpxhqKQLchJ0CJys3/BNi76idLJKhlC/ZBasC6GDp1
 jFC9d/sb9dvnXbj+t1+uKtQ9HJ12yZQL+kD43ia0MH77Bon9Zo2yoNXCyIFQv0WZT073
 I7mGe2Y1JEIu0w+7HqaDIZwAT2rd2TE72nXoF4hhkcI2yFMokccjk4kPnVJZFd2QOIaa
 7Tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iOOVTid6TaZdEBZyZEIXgmDYaXapbxxAU5SjDeskRWA=;
 b=SKH58eoC8GL4kKzfd08hW62MCIu8tj34dWCHXzw2fVkMQWB4VOX64bywqsdU4R7GFR
 NHh0SVCs/l4QJNX45lzqM7VYbuBONZO3cVLiy6k9Ct14nyttex237q2kvL2HefVxV87+
 WmF4m4wWykdbR0qvM6k/WT43/SUSO+h8InWzUrtlI2YbXnJ1jXq3r7mzdtBZsMgTYeT5
 ipH1Xn37Uqut+OXKYl4JAagFxJBRWemSGTbgf3jTcBn3sLNeF1ohufm02rFlOdiQMGN3
 PPM6xm5vt1ry4riQTIAOFwoSTU5aGVpKGSHL0KFehbcTZGjw/mZ7YWbRuz7xAzMG5f+n
 guaQ==
X-Gm-Message-State: AOAM533BbU480jY01vslp73zv+h67P8FM+QYjf1UUB8Fh+AF2Xt4vIa6
 QZC+0qZFx2ErggfZoGrvqNs20cL8FMs=
X-Google-Smtp-Source: ABdhPJyZsVXmbKKedlfbEQdDO/Q7KFnKCzi7sVve0Iyzj57HoDOSQy3NiY7WTMF2SC4WCJQRIto4Ng==
X-Received: by 2002:a17:907:9705:: with SMTP id
 jg5mr31116789ejc.448.1608126934527; 
 Wed, 16 Dec 2020 05:55:34 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id k16sm1423216ejd.78.2020.12.16.05.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:55:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] move icache flush out of tcg.h
Date: Wed, 16 Dec 2020 14:55:28 +0100
Message-Id: <20201216135529.265165-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201216135529.265165-1-pbonzini@redhat.com>
References: <20201216135529.265165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: philmd@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

icache flush is also used by non-TCG accelerators.  Do not require users
such as physmem.c to include tcg/tcg.h.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/exec/flush-icache.h | 64 ++++++++++++++++++++++++++++++++++++++++
 softmmu/physmem.c           |  1 +
 tcg/aarch64/tcg-target.h    |  5 ----
 tcg/arm/tcg-target.h        |  5 ----
 tcg/i386/tcg-target.h       |  4 ---
 tcg/mips/tcg-target.h       | 11 -------
 tcg/ppc/tcg-target.c.inc    | 22 --------------
 tcg/ppc/tcg-target.h        |  1 -
 tcg/riscv/tcg-target.h      |  5 ----
 tcg/s390/tcg-target.h       |  4 ---
 tcg/sparc/tcg-target.h      |  8 -----
 tcg/tcg.c                   |  1 +
 tcg/tci/tcg-target.h        |  4 ---
 util/cacheinfo.c            | 25 ++++++++++++++++
 14 files changed, 91 insertions(+), 69 deletions(-)
 create mode 100644 include/exec/flush-icache.h

diff --git a/include/exec/flush-icache.h b/include/exec/flush-icache.h
new file mode 100644
index 0000000000..77a7b80ab7
--- /dev/null
+++ b/include/exec/flush-icache.h
@@ -0,0 +1,64 @@
+/*
+ * icache flush for QEMU (both TCG or virtualized)
+ *
+ *  Copyright (c) 2003-2020 QEMU contributors
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef FLUSH_ICACHE_H
+#define FLUSH_ICACHE_H
+
+#if defined HOST_I386 || defined HOST_X86_64 || defined HOST_S390 || defined HOST_S390X
+static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
+{
+}
+
+#elif defined HOST_MIPS
+#ifdef __OpenBSD__
+#include <machine/sysarch.h>
+#else
+#include <sys/cachectl.h>
+#endif
+
+static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
+{
+    cacheflush ((void *)start, stop-start, ICACHE);
+}
+
+#elif defined HOST_PPC || defined HOST_PPC64
+extern void flush_icache_range(uintptr_t start, uintptr_t stop);
+
+#elif defined HOST_SPARC
+static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
+{
+    uintptr_t p;
+    for (p = start & -8; p < ((stop + 7) & -8); p += 8) {
+        __asm__ __volatile__("flush\t%0" : : "r" (p));
+    }
+}
+
+#elif defined HOST_AARCH64 || defined HOST_ARM || defined HOST_RISCV
+static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
+{
+    __builtin___clear_cache((char *)start, (char *)stop);
+}
+#elif defined CONFIG_TCG_INTERPRETER
+static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
+{
+    assert(tcg_enabled());
+}
+#endif
+
+#endif
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 67b53d39e4..c6a3cb679e 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -53,6 +53,7 @@
 #include "qemu/rcu_queue.h"
 #include "qemu/main-loop.h"
 #include "exec/translate-all.h"
+#include "exec/flush-icache.h"
 #include "sysemu/replay.h"
 
 #include "exec/memory-internal.h"
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
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 43c6cf8f52..9974bb3c56 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -43,6 +43,7 @@
 #include "cpu.h"
 
 #include "exec/exec-all.h"
+#include "exec/flush-icache.h"
 
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/boards.h"
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
diff --git a/util/cacheinfo.c b/util/cacheinfo.c
index 7804c186b6..b49093106d 100644
--- a/util/cacheinfo.c
+++ b/util/cacheinfo.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "qemu/atomic.h"
+#include "exec/flush-icache.h"
 
 int qemu_icache_linesize = 0;
 int qemu_icache_linesize_log;
@@ -177,6 +178,30 @@ static void fallback_cache_info(int *isize, int *dsize)
     }
 }
 
+#if defined HOST_PPC || defined HOST_PPC64
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
+#endif
+
 static void __attribute__((constructor)) init_cache_info(void)
 {
     int isize = 0, dsize = 0;
-- 
2.28.0




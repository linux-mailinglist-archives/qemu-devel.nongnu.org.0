Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886C52EB145
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:22:27 +0100 (CET)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwq2M-0004HD-IN
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0A-0002Gu-JI
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:11 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:36033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq05-0006R4-2B
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:10 -0500
Received: by mail-pg1-x536.google.com with SMTP id c132so289680pga.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UW2e0M7l/Z+9/S5/2AeOh4O7fYeLa2EeE8+auV1ifcI=;
 b=QeU9pMqYzKWIjYye6txzX68aMiCCNsvzcwWxQ212iIBKJE3ImGnqCfDWlEY+te6XoD
 P1j1gQTKNFTlOyVE1jCvBgRaFjVxfCtL5A73idaimpz4hAJi8NjMSTmRFDWX+ntw8jJf
 Nt8pgu75b2v/7smlNoC0Wom5PupNPCQ8YnuyFka3zdi0D/MZLVQ2fNdjN9aD6ytPqTyk
 /Z56q3GNAYjJtaEw2VmCPxvwrx1iDsCdk2GtrRROjlXxNBLlCrvsk7HmJq69G7LNvo58
 KWh+ALp10Y24VIF8/gokTeDq+g2nSzIxyWafdy32+G5r6Mpo7XwvZZqF9syjGCl2NYR8
 ttlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UW2e0M7l/Z+9/S5/2AeOh4O7fYeLa2EeE8+auV1ifcI=;
 b=jD3oWFedSOTpNnWBPfMnJz+Zc0j5wvqzxsL0umyBK/oIB7yGLF7oJETcnm2ptRyYWu
 So+iaDmRQZtMsRx/xev2SjyuM9FfyvaVWUmF9nMrKwC9BP37/gyTpc8VD6Qme4xpnNAR
 b9kBgkm1Z+/hUX9MVCh7HZu4oNQOTRSA/vzq//tViZXOokEoQNCXZCrETmYzYWl2lv8k
 WfMJ74Hc3VsUzr2IZCR/gVpRzdENLor+m66YARLRH84Fxu34UNEqg0QAxUBs9J04CaGo
 v2nrE/EDTn3x1LA0EC+iWslpLKneTa1FKMpceOeHbhJfy9lrIb3clD/jy8bfFCGQYmbf
 mv5w==
X-Gm-Message-State: AOAM531RArlsYAGWKFRHSfGEMqS8RnYG2PA38X8YqFmVZJ+ZDvcDtwYV
 D1XcddS7oLVK68wxRBpsh1HGpjNKpgihNQ==
X-Google-Smtp-Source: ABdhPJweRG3QPiPRAPs1+AnT5NhApDvjWZpBR2A0f32t49O6SCP9qpd9yfgFLNqYvSFu4PZMlT+SAw==
X-Received: by 2002:a63:4644:: with SMTP id v4mr348156pgk.440.1609867203213;
 Tue, 05 Jan 2021 09:20:03 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/43] util: Enhance flush_icache_range with separate data
 pointer
Date: Tue,  5 Jan 2021 07:19:10 -1000
Message-Id: <20210105171950.415486-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are shortly going to have a split rw/rx jit buffer.  Depending
on the host, we need to flush the dcache at the rw data pointer and
flush the icache at the rx code pointer.

For now, the two passed pointers are identical, so there is no
effective change in behaviour.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/cacheflush.h    | 15 ++++++++++++--
 softmmu/physmem.c            |  2 +-
 tcg/tcg.c                    |  6 ++++--
 util/cacheflush.c            | 38 +++++++++++++++++++++---------------
 util/cacheinfo.c             |  8 +++++---
 tcg/aarch64/tcg-target.c.inc |  2 +-
 tcg/mips/tcg-target.c.inc    |  2 +-
 tcg/ppc/tcg-target.c.inc     |  4 ++--
 tcg/sparc/tcg-target.c.inc   |  4 ++--
 9 files changed, 51 insertions(+), 30 deletions(-)

diff --git a/include/qemu/cacheflush.h b/include/qemu/cacheflush.h
index 58ae488491..ae20bcda73 100644
--- a/include/qemu/cacheflush.h
+++ b/include/qemu/cacheflush.h
@@ -8,16 +8,27 @@
 #ifndef QEMU_CACHEFLUSH_H
 #define QEMU_CACHEFLUSH_H
 
+/**
+ * flush_idcache_range:
+ * @rx: instruction address
+ * @rw: data address
+ * @len: length to flush
+ *
+ * Flush @len bytes of the data cache at @rw and the icache at @rx
+ * to bring them in sync.  The two addresses may be different virtual
+ * mappings of the same physical page(s).
+ */
+
 #if defined(__i386__) || defined(__x86_64__) || defined(__s390__)
 
-static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
+static inline void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 {
     /* icache is coherent and does not require flushing. */
 }
 
 #else
 
-void flush_icache_range(uintptr_t start, uintptr_t stop);
+void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len);
 
 #endif
 
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index c595266b9f..e9d205f63e 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2947,7 +2947,7 @@ static inline MemTxResult address_space_write_rom_internal(AddressSpace *as,
                 invalidate_and_set_dirty(mr, addr1, l);
                 break;
             case FLUSH_CACHE:
-                flush_icache_range((uintptr_t)ram_ptr, (uintptr_t)ram_ptr + l);
+                flush_idcache_range((uintptr_t)ram_ptr, (uintptr_t)ram_ptr, l);
                 break;
             }
         }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 9bdc450196..759a41d848 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1079,7 +1079,8 @@ void tcg_prologue_init(TCGContext *s)
 
     buf1 = s->code_ptr;
 #ifndef CONFIG_TCG_INTERPRETER
-    flush_icache_range((uintptr_t)buf0, (uintptr_t)buf1);
+    flush_idcache_range((uintptr_t)buf0, (uintptr_t)buf0,
+                        tcg_ptr_byte_diff(buf1, buf0));
 #endif
 
     /* Deduct the prologue from the buffer.  */
@@ -4328,7 +4329,8 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 
 #ifndef CONFIG_TCG_INTERPRETER
     /* flush instruction cache */
-    flush_icache_range((uintptr_t)s->code_buf, (uintptr_t)s->code_ptr);
+    flush_idcache_range((uintptr_t)s->code_buf, (uintptr_t)s->code_buf,
+                        tcg_ptr_byte_diff(s->code_ptr, s->code_buf));
 #endif
 
     return tcg_current_code_size(s);
diff --git a/util/cacheflush.c b/util/cacheflush.c
index 2881832a38..92805efe49 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -21,29 +21,32 @@
 #include <sys/cachectl.h>
 #endif
 
-void flush_icache_range(uintptr_t start, uintptr_t stop)
+void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 {
-    cacheflush((void *)start, stop - start, ICACHE);
+    if (rx != rw) {
+        cacheflush((void *)rw, len, DCACHE);
+    }
+    cacheflush((void *)rx, len, ICACHE);
 }
 
 #elif defined(__powerpc__)
 
-void flush_icache_range(uintptr_t start, uintptr_t stop)
+void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 {
-    uintptr_t p, start1, stop1;
+    uintptr_t p, b, e;
     size_t dsize = qemu_dcache_linesize;
     size_t isize = qemu_icache_linesize;
 
-    start1 = start & ~(dsize - 1);
-    stop1 = (stop + dsize - 1) & ~(dsize - 1);
-    for (p = start1; p < stop1; p += dsize) {
+    b = rw & ~(dsize - 1);
+    e = (rw + len + dsize - 1) & ~(dsize - 1);
+    for (p = b; p < e; p += dsize) {
         asm volatile ("dcbst 0,%0" : : "r"(p) : "memory");
     }
     asm volatile ("sync" : : : "memory");
 
-    start &= start & ~(isize - 1);
-    stop1 = (stop + isize - 1) & ~(isize - 1);
-    for (p = start1; p < stop1; p += isize) {
+    b = rx & ~(isize - 1);
+    e = (rx + len + isize - 1) & ~(isize - 1);
+    for (p = b; p < e; p += isize) {
         asm volatile ("icbi 0,%0" : : "r"(p) : "memory");
     }
     asm volatile ("sync" : : : "memory");
@@ -52,20 +55,23 @@ void flush_icache_range(uintptr_t start, uintptr_t stop)
 
 #elif defined(__sparc__)
 
-void flush_icache_range(uintptr_t start, uintptr_t stop)
+void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 {
-    uintptr_t p;
-
-    for (p = start & -8; p < ((stop + 7) & -8); p += 8) {
+    /* No additional data flush to the RW virtual address required. */
+    uintptr_t p, end = (rx + len + 7) & -8;
+    for (p = rx & -8; p < end; p += 8) {
         __asm__ __volatile__("flush\t%0" : : "r" (p));
     }
 }
 
 #else
 
-void flush_icache_range(uintptr_t start, uintptr_t stop)
+void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 {
-    __builtin___clear_cache((char *)start, (char *)stop);
+    if (rw != rx) {
+        __builtin___clear_cache((char *)rw, (char *)rw + len);
+    }
+    __builtin___clear_cache((char *)rx, (char *)rx + len);
 }
 
 #endif
diff --git a/util/cacheinfo.c b/util/cacheinfo.c
index 7804c186b6..b182f0b693 100644
--- a/util/cacheinfo.c
+++ b/util/cacheinfo.c
@@ -166,9 +166,11 @@ static void fallback_cache_info(int *isize, int *dsize)
         *isize = *dsize;
     } else {
 #if defined(_ARCH_PPC)
-        /* For PPC, we're going to use the icache size computed for
-           flush_icache_range.  Which means that we must use the
-           architecture minimum.  */
+        /*
+         * For PPC, we're going to use the cache sizes computed for
+         * flush_idcache_range.  Which means that we must use the
+         * architecture minimum.
+         */
         *isize = *dsize = 16;
 #else
         /* Otherwise, 64 bytes is not uncommon.  */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 26f71cb599..83af3108a4 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1363,7 +1363,7 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
     }
     pair = (uint64_t)i2 << 32 | i1;
     qatomic_set((uint64_t *)jmp_addr, pair);
-    flush_icache_range(jmp_addr, jmp_addr + 8);
+    flush_idcache_range(jmp_addr, jmp_addr, 8);
 }
 
 static inline void tcg_out_goto_label(TCGContext *s, TCGLabel *l)
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 41be574e89..c255ecb444 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2660,7 +2660,7 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
     qatomic_set((uint32_t *)jmp_addr, deposit32(OPC_J, 0, 26, addr >> 2));
-    flush_icache_range(jmp_addr, jmp_addr + 4);
+    flush_idcache_range(jmp_addr, jmp_addr, 4);
 }
 
 typedef struct {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 0d068ec8ab..b756281042 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1753,12 +1753,12 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
         /* As per the enclosing if, this is ppc64.  Avoid the _Static_assert
            within qatomic_set that would fail to build a ppc32 host.  */
         qatomic_set__nocheck((uint64_t *)jmp_addr, pair);
-        flush_icache_range(jmp_addr, jmp_addr + 8);
+        flush_idcache_range(jmp_addr, jmp_addr, 8);
     } else {
         intptr_t diff = addr - jmp_addr;
         tcg_debug_assert(in_range_b(diff));
         qatomic_set((uint32_t *)jmp_addr, B | (diff & 0x3fffffc));
-        flush_icache_range(jmp_addr, jmp_addr + 4);
+        flush_idcache_range(jmp_addr, jmp_addr, 4);
     }
 }
 
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 6775bd30fc..6e2d755f6a 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1836,7 +1836,7 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
     if (!USE_REG_TB) {
         qatomic_set((uint32_t *)jmp_addr,
 		    deposit32(CALL, 0, 30, br_disp >> 2));
-        flush_icache_range(jmp_addr, jmp_addr + 4);
+        flush_idcache_range(jmp_addr, jmp_addr, 4);
         return;
     }
 
@@ -1860,5 +1860,5 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
     }
 
     qatomic_set((uint64_t *)jmp_addr, deposit64(i2, 32, 32, i1));
-    flush_icache_range(jmp_addr, jmp_addr + 8);
+    flush_idcache_range(jmp_addr, jmp_addr, 8);
 }
-- 
2.25.1



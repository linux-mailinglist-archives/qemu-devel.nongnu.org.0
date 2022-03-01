Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14CC4C891B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:19:08 +0100 (CET)
Received: from localhost ([::1]:45676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzb1-0000yU-W4
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:19:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOzF0-0007ym-Fa
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:56:22 -0500
Received: from [2a00:1450:4864:20::530] (port=36464
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOzEx-0001xY-9x
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:56:22 -0500
Received: by mail-ed1-x530.google.com with SMTP id cm8so21263485edb.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Kziok9V9LX6bcnJwQ9kOgg8CqbcOF/m3urdub8sZUQ=;
 b=kmtg0NXY569L7pEXa8FFbnTPrclVqemx8fqnkY+STOfOONpGcbu+ik016AyztbiFqK
 uB60bFjXFNVuh4+8s12byETSWzGvfRcH+wUqF3kwXsj/bGIIt7hN7zwg8tkKyengO0WI
 uOy06+WWQiVeCGa6BA+Zj4W9WFKPMl66ne38f/mjgyFD4Q86jtMzZORMy040HUAhVA1N
 he1VXSEUS73rb4FZSkxufyvgf7xUF07QjWbPdCN5hgscWb6nHt/IOSB/WKX06dx8lgoQ
 ZCZEpycJFLYJ/l/6lXsD98t+crypWBfyeIw4SRZyFQgZa1fGCxU4u2WHFjexTkJ9Iz93
 fZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Kziok9V9LX6bcnJwQ9kOgg8CqbcOF/m3urdub8sZUQ=;
 b=AqdLX4cTSIsJg26ahtJR87LNGz8g+vCyiASuFXbJJ0g5tHk4YFYRBRTM20b2ImI4cv
 L4IOvbFefbxaIDGsA2elm8Be9dO5BoB2Yambo+Z7zfQtrTnT2DXVsQbgvkOgkRwH/Ihh
 2gv2P6UQnj/UwWPGEYaytIyJmvPlQMyRg/Dg2b7cALevQZfsqIUh2FEPqfW7sByPjgvW
 0IdZ4QUWZ0x6BgAJh5YmAYPwo4sxcq/UU1IPMCntgm5QfVXk25vGy8jSlh5CakRaybqD
 9m6CQbbBq+JchYnvVqG9BXlOwd+z8HfqbbqRzb6N5tdO4HkOis10Ior3AaG7wGFG+J3v
 3SNg==
X-Gm-Message-State: AOAM5306xCtRquqB2mw7uvOUwMrKJECRGPlkFs9P8nSnMmq5VxKYWq4A
 r75TTPyMvbMfqR37RcSMKnokKA==
X-Google-Smtp-Source: ABdhPJyHfq8/tNBeE6B8JDnuCzpjTUHve3F/sAwyqT4Y5S5ZJzLTzlFZRhgUt8/vUuBm8mKmgmgpbw==
X-Received: by 2002:a50:baaa:0:b0:410:a098:2a7f with SMTP id
 x39-20020a50baaa000000b00410a0982a7fmr24023096ede.53.1646128577765; 
 Tue, 01 Mar 2022 01:56:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a17090617d300b006cea86ca384sm5032357eje.40.2022.03.01.01.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:56:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E40661FFC9;
 Tue,  1 Mar 2022 09:47:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 17/18] semihosting/arm-compat: replace heuristic for softmmu
 SYS_HEAPINFO
Date: Tue,  1 Mar 2022 09:47:14 +0000
Message-Id: <20220301094715.550871-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Keith Packard <keithp@keithp.com>, Andrew Strauss <astrauss11@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous numbers were a guess at best and rather arbitrary without
taking into account anything that might be loaded. Instead of using
guesses based on the state of registers implement a new function that:

 a) scans the MemoryRegions for the largest RAM block
 b) iterates through all "ROM" blobs looking for the biggest gap

The "ROM" blobs include all code loaded via -kernel and the various
-device loader techniques.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Andrew Strauss <astrauss11@gmail.com>
Cc: Keith Packard <keithp@keithp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220225172021.3493923-18-alex.bennee@linaro.org>

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 4fa485bd61..5572108ba5 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -343,4 +343,18 @@ int rom_add_option(const char *file, int32_t bootindex);
  * overflow on real hardware too. */
 #define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
 
+typedef struct RomGap {
+    hwaddr base;
+    size_t size;
+} RomGap;
+
+/**
+ * rom_find_largest_gap_between: return largest gap between ROMs in given range
+ *
+ * Given a range of addresses, this function finds the largest
+ * contiguous subrange which has no ROMs loaded to it. That is,
+ * it finds the biggest gap which is free for use for other things.
+ */
+RomGap rom_find_largest_gap_between(hwaddr base, size_t size);
+
 #endif
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 19edb928e9..ca2f2431fb 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1333,6 +1333,92 @@ static Rom *find_rom(hwaddr addr, size_t size)
     return NULL;
 }
 
+typedef struct RomSec {
+    hwaddr base;
+    int se; /* start/end flag */
+} RomSec;
+
+
+/*
+ * Sort into address order. We break ties between rom-startpoints
+ * and rom-endpoints in favour of the startpoint, by sorting the 0->1
+ * transition before the 1->0 transition. Either way round would
+ * work, but this way saves a little work later by avoiding
+ * dealing with "gaps" of 0 length.
+ */
+static gint sort_secs(gconstpointer a, gconstpointer b)
+{
+    RomSec *ra = (RomSec *) a;
+    RomSec *rb = (RomSec *) b;
+
+    if (ra->base == rb->base) {
+        return ra->se - rb->se;
+    }
+    return ra->base > rb->base ? 1 : -1;
+}
+
+static GList *add_romsec_to_list(GList *secs, hwaddr base, int se)
+{
+   RomSec *cand = g_new(RomSec, 1);
+   cand->base = base;
+   cand->se = se;
+   return g_list_prepend(secs, cand);
+}
+
+RomGap rom_find_largest_gap_between(hwaddr base, size_t size)
+{
+    Rom *rom;
+    RomSec *cand;
+    RomGap res = {0, 0};
+    hwaddr gapstart = base;
+    GList *it, *secs = NULL;
+    int count = 0;
+
+    QTAILQ_FOREACH(rom, &roms, next) {
+        /* Ignore blobs being loaded to special places */
+        if (rom->mr || rom->fw_file) {
+            continue;
+        }
+        /* ignore anything finishing bellow base */
+        if (rom->addr + rom->romsize <= base) {
+            continue;
+        }
+        /* ignore anything starting above the region */
+        if (rom->addr >= base + size) {
+            continue;
+        }
+
+        /* Save the start and end of each relevant ROM */
+        secs = add_romsec_to_list(secs, rom->addr, 1);
+
+        if (rom->addr + rom->romsize < base + size) {
+            secs = add_romsec_to_list(secs, rom->addr + rom->romsize, -1);
+        }
+    }
+
+    /* sentinel */
+    secs = add_romsec_to_list(secs, base + size, 1);
+
+    secs = g_list_sort(secs, sort_secs);
+
+    for (it = g_list_first(secs); it; it = g_list_next(it)) {
+        cand = (RomSec *) it->data;
+        if (count == 0 && count + cand->se == 1) {
+            size_t gap = cand->base - gapstart;
+            if (gap > res.size) {
+                res.base = gapstart;
+                res.size = gap;
+            }
+        } else if (count == 1 && count + cand->se == 0) {
+            gapstart = cand->base;
+        }
+        count += cand->se;
+    }
+
+    g_list_free_full(secs, g_free);
+    return res;
+}
+
 /*
  * Copies memory from registered ROMs to dest. Any memory that is contained in
  * a ROM between addr and addr + size is copied. Note that this can involve
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 37963becae..7a51fd0737 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -44,6 +44,7 @@
 #define COMMON_SEMI_HEAP_SIZE (128 * 1024 * 1024)
 #else
 #include "qemu/cutils.h"
+#include "hw/loader.h"
 #ifdef TARGET_ARM
 #include "hw/arm/boot.h"
 #endif
@@ -144,33 +145,69 @@ typedef struct GuestFD {
 static GArray *guestfd_array;
 
 #ifndef CONFIG_USER_ONLY
-#include "exec/address-spaces.h"
-/*
- * Find the base of a RAM region containing the specified address
+
+/**
+ * common_semi_find_bases: find information about ram and heap base
+ *
+ * This function attempts to provide meaningful numbers for RAM and
+ * HEAP base addresses. The rambase is simply the lowest addressable
+ * RAM position. For the heapbase we ask the loader to scan the
+ * address space and the largest available gap by querying the "ROM"
+ * regions.
+ *
+ * Returns: a structure with the numbers we need.
  */
-static inline hwaddr
-common_semi_find_region_base(hwaddr addr)
+
+typedef struct LayoutInfo {
+    target_ulong rambase;
+    size_t ramsize;
+    hwaddr heapbase;
+    hwaddr heaplimit;
+} LayoutInfo;
+
+static bool find_ram_cb(Int128 start, Int128 len, const MemoryRegion *mr,
+                        hwaddr offset_in_region, void *opaque)
 {
-    MemoryRegion *subregion;
+    LayoutInfo *info = (LayoutInfo *) opaque;
+    uint64_t size = int128_get64(len);
+
+    if (!mr->ram || mr->readonly) {
+        return false;
+    }
+
+    if (size > info->ramsize) {
+        info->rambase = int128_get64(start);
+        info->ramsize = size;
+    }
+
+    /* search exhaustively for largest RAM */
+    return false;
+}
+
+static LayoutInfo common_semi_find_bases(CPUState *cs)
+{
+    FlatView *fv;
+    LayoutInfo info = { 0, 0, 0, 0 };
+
+    RCU_READ_LOCK_GUARD();
+
+    fv = address_space_to_flatview(cs->as);
+    flatview_for_each_range(fv, find_ram_cb, &info);
 
     /*
-     * Find the chunk of R/W memory containing the address.  This is
-     * used for the SYS_HEAPINFO semihosting call, which should
-     * probably be using information from the loaded application.
+     * If we have found the RAM lets iterate through the ROM blobs to
+     * work out the best place for the remainder of RAM and split it
+     * equally between stack and heap.
      */
-    QTAILQ_FOREACH(subregion, &get_system_memory()->subregions,
-                   subregions_link) {
-        if (subregion->ram && !subregion->readonly) {
-            Int128 top128 = int128_add(int128_make64(subregion->addr),
-                                       subregion->size);
-            Int128 addr128 = int128_make64(addr);
-            if (subregion->addr <= addr && int128_lt(addr128, top128)) {
-                return subregion->addr;
-            }
-        }
+    if (info.rambase || info.ramsize > 0) {
+        RomGap gap = rom_find_largest_gap_between(info.rambase, info.ramsize);
+        info.heapbase = gap.base;
+        info.heaplimit = gap.base + gap.size;
     }
-    return 0;
+
+    return info;
 }
+
 #endif
 
 #ifdef TARGET_ARM
@@ -204,28 +241,6 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
     return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
 }
 
-#ifndef CONFIG_USER_ONLY
-#include "hw/arm/boot.h"
-static inline target_ulong
-common_semi_rambase(CPUState *cs)
-{
-    CPUArchState *env = cs->env_ptr;
-    const struct arm_boot_info *info = env->boot_info;
-    target_ulong sp;
-
-    if (info) {
-        return info->loader_start;
-    }
-
-    if (is_a64(env)) {
-        sp = env->xregs[31];
-    } else {
-        sp = env->regs[13];
-    }
-    return common_semi_find_region_base(sp);
-}
-#endif
-
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -251,17 +266,6 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
     return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
 }
 
-#ifndef CONFIG_USER_ONLY
-
-static inline target_ulong
-common_semi_rambase(CPUState *cs)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    return common_semi_find_region_base(env->gpr[xSP]);
-}
-#endif
-
 #endif
 
 /*
@@ -1165,12 +1169,12 @@ target_ulong do_common_semihosting(CPUState *cs)
     case TARGET_SYS_HEAPINFO:
         {
             target_ulong retvals[4];
-            target_ulong limit;
             int i;
 #ifdef CONFIG_USER_ONLY
             TaskState *ts = cs->opaque;
+            target_ulong limit;
 #else
-            target_ulong rambase = common_semi_rambase(cs);
+            LayoutInfo info = common_semi_find_bases(cs);
 #endif
 
             GET_ARG(0);
@@ -1201,12 +1205,10 @@ target_ulong do_common_semihosting(CPUState *cs)
             retvals[2] = ts->stack_base;
             retvals[3] = 0; /* Stack limit.  */
 #else
-            limit = current_machine->ram_size;
-            /* TODO: Make this use the limit of the loaded application.  */
-            retvals[0] = rambase + limit / 2;
-            retvals[1] = rambase + limit;
-            retvals[2] = rambase + limit; /* Stack base */
-            retvals[3] = rambase; /* Stack limit.  */
+            retvals[0] = info.heapbase;  /* Heap Base */
+            retvals[1] = info.heaplimit; /* Heap Limit */
+            retvals[2] = info.heaplimit; /* Stack base */
+            retvals[3] = info.heapbase;  /* Stack limit.  */
 #endif
 
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
-- 
2.30.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529363636D6
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:50:44 +0200 (CEST)
Received: from localhost ([::1]:56536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAd9-0002Jz-A2
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALk-0003OG-Hu
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALh-0004gv-PI
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c15so22553854wro.13
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NIsi822bMMuzY0ClUxKqT1adRaz2kyzQG16pu95t3kA=;
 b=jtyKz53sYt2daZGsRObr/z7s3XBmdGnTze3IEbNxkrVHSyIYl4nQTbvAeL0GKhFJGA
 8fefuQArtjeioASs6Iq2ecJfOlPu3zU5z539A4jxC3jnCCF4pjTJsPgwdj0QJnQKEwUC
 y8URH6XHui/1tqL/cvtQf/MJQMkraIcjglIWG+vs+SUl1PkaTSrKLTw2epuUNB1dv49V
 tu/kVhjzw7wMBU7wToJkUruPPI7fz0ZHZZTKwM9MFbAMHTu6BdiUFH/r5lI4FbOnz0OZ
 /JAUbfbyfM1xYikcikwOn9kjJVeBIvLE6Nx0r2EuyUkrZK8JhWVhQp8hVIA9mXvisfKK
 8zfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NIsi822bMMuzY0ClUxKqT1adRaz2kyzQG16pu95t3kA=;
 b=qWrSxIjeW8QyV55wo4sViKdS+g1uZFEZ6anDlUF1Gnxd9z+/0zjCQGZqT2iagMw3jR
 zbQo+LGiX1/TB2U9CjKWSs82rva2XQjKhYG1nvikMcscUA95M8izbc/hRe7Ftc7tryHx
 ZT9xmvJy6UEkaBUCfjBTK4sAuAnwz71Lf7r15hFKUMj2fpwHlbWFoUL7Ob9D1euuRqAl
 CNcM4EQGb71qDpKIwaXF1OqoCKL0I7lFpPyzWk9cFFTsZqzPBJxGvIBz5rs9DBVWBz7F
 tdcx0K0PaYOruqGQx3Zm1pPS8Zz21y4CxJOmzqmLs4AouQ8o0dMX4sua5SBXX15o5qN3
 3qgA==
X-Gm-Message-State: AOAM532QNywUsp6wT8/KUcj2JeWmZZxvrZiiUIAMvG8GZJdUpaKNU0rQ
 8iGzhD9JsG9ykdU28bGFgJJXrpzv53Hv4Q==
X-Google-Smtp-Source: ABdhPJw0ZCMs4/o6Iv0385Kjd4XROUDvEd/xzWrpMyk3bArjyz6Z1Sj0JLb3cVd1tgxT/ggdvst7xA==
X-Received: by 2002:adf:e747:: with SMTP id c7mr9805374wrn.220.1618763558825; 
 Sun, 18 Apr 2021 09:32:38 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a15sm18725962wrr.53.2021.04.18.09.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:32:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/26] target/mips: Move code related to physical addressing
 to sysemu/phys.c
Date: Sun, 18 Apr 2021 18:31:21 +0200
Message-Id: <20210418163134.1133100-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Declare get_physical_address() with local scope and move it along
with mips_cpu_get_phys_page_debug() to sysemu/phys.c new file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h         |  25 +++-
 target/mips/sysemu/physaddr.c  | 257 +++++++++++++++++++++++++++++++++
 target/mips/tlb_helper.c       | 254 --------------------------------
 target/mips/sysemu/meson.build |   1 +
 4 files changed, 282 insertions(+), 255 deletions(-)
 create mode 100644 target/mips/sysemu/physaddr.c

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 294560c9d2f..51a45bd397a 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -81,15 +81,38 @@ extern const struct mips_def_t mips_defs[];
 extern const int mips_defs_number;
 
 bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
-hwaddr mips_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int mips_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                   MMUAccessType access_type,
                                   int mmu_idx, uintptr_t retaddr);
 
+#define USEG_LIMIT      ((target_ulong)(int32_t)0x7FFFFFFFUL)
+#define KSEG0_BASE      ((target_ulong)(int32_t)0x80000000UL)
+#define KSEG1_BASE      ((target_ulong)(int32_t)0xA0000000UL)
+#define KSEG2_BASE      ((target_ulong)(int32_t)0xC0000000UL)
+#define KSEG3_BASE      ((target_ulong)(int32_t)0xE0000000UL)
+
+#define KVM_KSEG0_BASE  ((target_ulong)(int32_t)0x40000000UL)
+#define KVM_KSEG2_BASE  ((target_ulong)(int32_t)0x60000000UL)
+
 #if !defined(CONFIG_USER_ONLY)
 
+enum {
+    TLBRET_XI = -6,
+    TLBRET_RI = -5,
+    TLBRET_DIRTY = -4,
+    TLBRET_INVALID = -3,
+    TLBRET_NOMATCH = -2,
+    TLBRET_BADADDR = -1,
+    TLBRET_MATCH = 0
+};
+
+int get_physical_address(CPUMIPSState *env, hwaddr *physical,
+                         int *prot, target_ulong real_address,
+                         MMUAccessType access_type, int mmu_idx);
+hwaddr mips_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+
 typedef struct r4k_tlb_t r4k_tlb_t;
 struct r4k_tlb_t {
     target_ulong VPN;
diff --git a/target/mips/sysemu/physaddr.c b/target/mips/sysemu/physaddr.c
new file mode 100644
index 00000000000..1918633aa1c
--- /dev/null
+++ b/target/mips/sysemu/physaddr.c
@@ -0,0 +1,257 @@
+/*
+ * MIPS TLB (Translation lookaside buffer) helpers.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
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
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "../internal.h"
+
+static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
+{
+    /*
+     * Interpret access control mode and mmu_idx.
+     *           AdE?     TLB?
+     *      AM  K S U E  K S U E
+     * UK    0  0 1 1 0  0 - - 0
+     * MK    1  0 1 1 0  1 - - !eu
+     * MSK   2  0 0 1 0  1 1 - !eu
+     * MUSK  3  0 0 0 0  1 1 1 !eu
+     * MUSUK 4  0 0 0 0  0 1 1 0
+     * USK   5  0 0 1 0  0 0 - 0
+     * -     6  - - - -  - - - -
+     * UUSK  7  0 0 0 0  0 0 0 0
+     */
+    int32_t adetlb_mask;
+
+    switch (mmu_idx) {
+    case 3: /* ERL */
+        /* If EU is set, always unmapped */
+        if (eu) {
+            return 0;
+        }
+        /* fall through */
+    case MIPS_HFLAG_KM:
+        /* Never AdE, TLB mapped if AM={1,2,3} */
+        adetlb_mask = 0x70000000;
+        goto check_tlb;
+
+    case MIPS_HFLAG_SM:
+        /* AdE if AM={0,1}, TLB mapped if AM={2,3,4} */
+        adetlb_mask = 0xc0380000;
+        goto check_ade;
+
+    case MIPS_HFLAG_UM:
+        /* AdE if AM={0,1,2,5}, TLB mapped if AM={3,4} */
+        adetlb_mask = 0xe4180000;
+        /* fall through */
+    check_ade:
+        /* does this AM cause AdE in current execution mode */
+        if ((adetlb_mask << am) < 0) {
+            return TLBRET_BADADDR;
+        }
+        adetlb_mask <<= 8;
+        /* fall through */
+    check_tlb:
+        /* is this AM mapped in current execution mode */
+        return ((adetlb_mask << am) < 0);
+    default:
+        assert(0);
+        return TLBRET_BADADDR;
+    };
+}
+
+static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
+                                    int *prot, target_ulong real_address,
+                                    MMUAccessType access_type, int mmu_idx,
+                                    unsigned int am, bool eu,
+                                    target_ulong segmask,
+                                    hwaddr physical_base)
+{
+    int mapped = is_seg_am_mapped(am, eu, mmu_idx);
+
+    if (mapped < 0) {
+        /* is_seg_am_mapped can report TLBRET_BADADDR */
+        return mapped;
+    } else if (mapped) {
+        /* The segment is TLB mapped */
+        return env->tlb->map_address(env, physical, prot, real_address,
+                                     access_type);
+    } else {
+        /* The segment is unmapped */
+        *physical = physical_base | (real_address & segmask);
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return TLBRET_MATCH;
+    }
+}
+
+static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
+                                       int *prot, target_ulong real_address,
+                                       MMUAccessType access_type, int mmu_idx,
+                                       uint16_t segctl, target_ulong segmask)
+{
+    unsigned int am = (segctl & CP0SC_AM_MASK) >> CP0SC_AM;
+    bool eu = (segctl >> CP0SC_EU) & 1;
+    hwaddr pa = ((hwaddr)segctl & CP0SC_PA_MASK) << 20;
+
+    return get_seg_physical_address(env, physical, prot, real_address,
+                                    access_type, mmu_idx, am, eu, segmask,
+                                    pa & ~(hwaddr)segmask);
+}
+
+int get_physical_address(CPUMIPSState *env, hwaddr *physical,
+                         int *prot, target_ulong real_address,
+                         MMUAccessType access_type, int mmu_idx)
+{
+    /* User mode can only access useg/xuseg */
+#if defined(TARGET_MIPS64)
+    int user_mode = mmu_idx == MIPS_HFLAG_UM;
+    int supervisor_mode = mmu_idx == MIPS_HFLAG_SM;
+    int kernel_mode = !user_mode && !supervisor_mode;
+    int UX = (env->CP0_Status & (1 << CP0St_UX)) != 0;
+    int SX = (env->CP0_Status & (1 << CP0St_SX)) != 0;
+    int KX = (env->CP0_Status & (1 << CP0St_KX)) != 0;
+#endif
+    int ret = TLBRET_MATCH;
+    /* effective address (modified for KVM T&E kernel segments) */
+    target_ulong address = real_address;
+
+    if (mips_um_ksegs_enabled()) {
+        /* KVM T&E adds guest kernel segments in useg */
+        if (real_address >= KVM_KSEG0_BASE) {
+            if (real_address < KVM_KSEG2_BASE) {
+                /* kseg0 */
+                address += KSEG0_BASE - KVM_KSEG0_BASE;
+            } else if (real_address <= USEG_LIMIT) {
+                /* kseg2/3 */
+                address += KSEG2_BASE - KVM_KSEG2_BASE;
+            }
+        }
+    }
+
+    if (address <= USEG_LIMIT) {
+        /* useg */
+        uint16_t segctl;
+
+        if (address >= 0x40000000UL) {
+            segctl = env->CP0_SegCtl2;
+        } else {
+            segctl = env->CP0_SegCtl2 >> 16;
+        }
+        ret = get_segctl_physical_address(env, physical, prot,
+                                          real_address, access_type,
+                                          mmu_idx, segctl, 0x3FFFFFFF);
+#if defined(TARGET_MIPS64)
+    } else if (address < 0x4000000000000000ULL) {
+        /* xuseg */
+        if (UX && address <= (0x3FFFFFFFFFFFFFFFULL & env->SEGMask)) {
+            ret = env->tlb->map_address(env, physical, prot,
+                                        real_address, access_type);
+        } else {
+            ret = TLBRET_BADADDR;
+        }
+    } else if (address < 0x8000000000000000ULL) {
+        /* xsseg */
+        if ((supervisor_mode || kernel_mode) &&
+            SX && address <= (0x7FFFFFFFFFFFFFFFULL & env->SEGMask)) {
+            ret = env->tlb->map_address(env, physical, prot,
+                                        real_address, access_type);
+        } else {
+            ret = TLBRET_BADADDR;
+        }
+    } else if (address < 0xC000000000000000ULL) {
+        /* xkphys */
+        if ((address & 0x07FFFFFFFFFFFFFFULL) <= env->PAMask) {
+            /* KX/SX/UX bit to check for each xkphys EVA access mode */
+            static const uint8_t am_ksux[8] = {
+                [CP0SC_AM_UK]    = (1u << CP0St_KX),
+                [CP0SC_AM_MK]    = (1u << CP0St_KX),
+                [CP0SC_AM_MSK]   = (1u << CP0St_SX),
+                [CP0SC_AM_MUSK]  = (1u << CP0St_UX),
+                [CP0SC_AM_MUSUK] = (1u << CP0St_UX),
+                [CP0SC_AM_USK]   = (1u << CP0St_SX),
+                [6]              = (1u << CP0St_KX),
+                [CP0SC_AM_UUSK]  = (1u << CP0St_UX),
+            };
+            unsigned int am = CP0SC_AM_UK;
+            unsigned int xr = (env->CP0_SegCtl2 & CP0SC2_XR_MASK) >> CP0SC2_XR;
+
+            if (xr & (1 << ((address >> 59) & 0x7))) {
+                am = (env->CP0_SegCtl1 & CP0SC1_XAM_MASK) >> CP0SC1_XAM;
+            }
+            /* Does CP0_Status.KX/SX/UX permit the access mode (am) */
+            if (env->CP0_Status & am_ksux[am]) {
+                ret = get_seg_physical_address(env, physical, prot,
+                                               real_address, access_type,
+                                               mmu_idx, am, false, env->PAMask,
+                                               0);
+            } else {
+                ret = TLBRET_BADADDR;
+            }
+        } else {
+            ret = TLBRET_BADADDR;
+        }
+    } else if (address < 0xFFFFFFFF80000000ULL) {
+        /* xkseg */
+        if (kernel_mode && KX &&
+            address <= (0xFFFFFFFF7FFFFFFFULL & env->SEGMask)) {
+            ret = env->tlb->map_address(env, physical, prot,
+                                        real_address, access_type);
+        } else {
+            ret = TLBRET_BADADDR;
+        }
+#endif
+    } else if (address < KSEG1_BASE) {
+        /* kseg0 */
+        ret = get_segctl_physical_address(env, physical, prot, real_address,
+                                          access_type, mmu_idx,
+                                          env->CP0_SegCtl1 >> 16, 0x1FFFFFFF);
+    } else if (address < KSEG2_BASE) {
+        /* kseg1 */
+        ret = get_segctl_physical_address(env, physical, prot, real_address,
+                                          access_type, mmu_idx,
+                                          env->CP0_SegCtl1, 0x1FFFFFFF);
+    } else if (address < KSEG3_BASE) {
+        /* sseg (kseg2) */
+        ret = get_segctl_physical_address(env, physical, prot, real_address,
+                                          access_type, mmu_idx,
+                                          env->CP0_SegCtl0 >> 16, 0x1FFFFFFF);
+    } else {
+        /*
+         * kseg3
+         * XXX: debug segment is not emulated
+         */
+        ret = get_segctl_physical_address(env, physical, prot, real_address,
+                                          access_type, mmu_idx,
+                                          env->CP0_SegCtl0, 0x1FFFFFFF);
+    }
+    return ret;
+}
+
+hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+{
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    CPUMIPSState *env = &cpu->env;
+    hwaddr phys_addr;
+    int prot;
+
+    if (get_physical_address(env, &phys_addr, &prot, addr, MMU_DATA_LOAD,
+                             cpu_mmu_index(env, false)) != 0) {
+        return -1;
+    }
+    return phys_addr;
+}
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index bb4b503ff72..2304fff4c42 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -25,16 +25,6 @@
 #include "exec/log.h"
 #include "hw/mips/cpudevs.h"
 
-enum {
-    TLBRET_XI = -6,
-    TLBRET_RI = -5,
-    TLBRET_DIRTY = -4,
-    TLBRET_INVALID = -3,
-    TLBRET_NOMATCH = -2,
-    TLBRET_BADADDR = -1,
-    TLBRET_MATCH = 0
-};
-
 #if !defined(CONFIG_USER_ONLY)
 
 /* no MMU emulation */
@@ -166,236 +156,6 @@ void mmu_init(CPUMIPSState *env, const mips_def_t *def)
     }
 }
 
-static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
-{
-    /*
-     * Interpret access control mode and mmu_idx.
-     *           AdE?     TLB?
-     *      AM  K S U E  K S U E
-     * UK    0  0 1 1 0  0 - - 0
-     * MK    1  0 1 1 0  1 - - !eu
-     * MSK   2  0 0 1 0  1 1 - !eu
-     * MUSK  3  0 0 0 0  1 1 1 !eu
-     * MUSUK 4  0 0 0 0  0 1 1 0
-     * USK   5  0 0 1 0  0 0 - 0
-     * -     6  - - - -  - - - -
-     * UUSK  7  0 0 0 0  0 0 0 0
-     */
-    int32_t adetlb_mask;
-
-    switch (mmu_idx) {
-    case 3: /* ERL */
-        /* If EU is set, always unmapped */
-        if (eu) {
-            return 0;
-        }
-        /* fall through */
-    case MIPS_HFLAG_KM:
-        /* Never AdE, TLB mapped if AM={1,2,3} */
-        adetlb_mask = 0x70000000;
-        goto check_tlb;
-
-    case MIPS_HFLAG_SM:
-        /* AdE if AM={0,1}, TLB mapped if AM={2,3,4} */
-        adetlb_mask = 0xc0380000;
-        goto check_ade;
-
-    case MIPS_HFLAG_UM:
-        /* AdE if AM={0,1,2,5}, TLB mapped if AM={3,4} */
-        adetlb_mask = 0xe4180000;
-        /* fall through */
-    check_ade:
-        /* does this AM cause AdE in current execution mode */
-        if ((adetlb_mask << am) < 0) {
-            return TLBRET_BADADDR;
-        }
-        adetlb_mask <<= 8;
-        /* fall through */
-    check_tlb:
-        /* is this AM mapped in current execution mode */
-        return ((adetlb_mask << am) < 0);
-    default:
-        assert(0);
-        return TLBRET_BADADDR;
-    };
-}
-
-static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
-                                    int *prot, target_ulong real_address,
-                                    MMUAccessType access_type, int mmu_idx,
-                                    unsigned int am, bool eu,
-                                    target_ulong segmask,
-                                    hwaddr physical_base)
-{
-    int mapped = is_seg_am_mapped(am, eu, mmu_idx);
-
-    if (mapped < 0) {
-        /* is_seg_am_mapped can report TLBRET_BADADDR */
-        return mapped;
-    } else if (mapped) {
-        /* The segment is TLB mapped */
-        return env->tlb->map_address(env, physical, prot, real_address,
-                                     access_type);
-    } else {
-        /* The segment is unmapped */
-        *physical = physical_base | (real_address & segmask);
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        return TLBRET_MATCH;
-    }
-}
-
-static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
-                                       int *prot, target_ulong real_address,
-                                       MMUAccessType access_type, int mmu_idx,
-                                       uint16_t segctl, target_ulong segmask)
-{
-    unsigned int am = (segctl & CP0SC_AM_MASK) >> CP0SC_AM;
-    bool eu = (segctl >> CP0SC_EU) & 1;
-    hwaddr pa = ((hwaddr)segctl & CP0SC_PA_MASK) << 20;
-
-    return get_seg_physical_address(env, physical, prot, real_address,
-                                    access_type, mmu_idx, am, eu, segmask,
-                                    pa & ~(hwaddr)segmask);
-}
-
-static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
-                                int *prot, target_ulong real_address,
-                                MMUAccessType access_type, int mmu_idx)
-{
-    /* User mode can only access useg/xuseg */
-#if defined(TARGET_MIPS64)
-    int user_mode = mmu_idx == MIPS_HFLAG_UM;
-    int supervisor_mode = mmu_idx == MIPS_HFLAG_SM;
-    int kernel_mode = !user_mode && !supervisor_mode;
-    int UX = (env->CP0_Status & (1 << CP0St_UX)) != 0;
-    int SX = (env->CP0_Status & (1 << CP0St_SX)) != 0;
-    int KX = (env->CP0_Status & (1 << CP0St_KX)) != 0;
-#endif
-    int ret = TLBRET_MATCH;
-    /* effective address (modified for KVM T&E kernel segments) */
-    target_ulong address = real_address;
-
-#define USEG_LIMIT      ((target_ulong)(int32_t)0x7FFFFFFFUL)
-#define KSEG0_BASE      ((target_ulong)(int32_t)0x80000000UL)
-#define KSEG1_BASE      ((target_ulong)(int32_t)0xA0000000UL)
-#define KSEG2_BASE      ((target_ulong)(int32_t)0xC0000000UL)
-#define KSEG3_BASE      ((target_ulong)(int32_t)0xE0000000UL)
-
-#define KVM_KSEG0_BASE  ((target_ulong)(int32_t)0x40000000UL)
-#define KVM_KSEG2_BASE  ((target_ulong)(int32_t)0x60000000UL)
-
-    if (mips_um_ksegs_enabled()) {
-        /* KVM T&E adds guest kernel segments in useg */
-        if (real_address >= KVM_KSEG0_BASE) {
-            if (real_address < KVM_KSEG2_BASE) {
-                /* kseg0 */
-                address += KSEG0_BASE - KVM_KSEG0_BASE;
-            } else if (real_address <= USEG_LIMIT) {
-                /* kseg2/3 */
-                address += KSEG2_BASE - KVM_KSEG2_BASE;
-            }
-        }
-    }
-
-    if (address <= USEG_LIMIT) {
-        /* useg */
-        uint16_t segctl;
-
-        if (address >= 0x40000000UL) {
-            segctl = env->CP0_SegCtl2;
-        } else {
-            segctl = env->CP0_SegCtl2 >> 16;
-        }
-        ret = get_segctl_physical_address(env, physical, prot,
-                                          real_address, access_type,
-                                          mmu_idx, segctl, 0x3FFFFFFF);
-#if defined(TARGET_MIPS64)
-    } else if (address < 0x4000000000000000ULL) {
-        /* xuseg */
-        if (UX && address <= (0x3FFFFFFFFFFFFFFFULL & env->SEGMask)) {
-            ret = env->tlb->map_address(env, physical, prot,
-                                        real_address, access_type);
-        } else {
-            ret = TLBRET_BADADDR;
-        }
-    } else if (address < 0x8000000000000000ULL) {
-        /* xsseg */
-        if ((supervisor_mode || kernel_mode) &&
-            SX && address <= (0x7FFFFFFFFFFFFFFFULL & env->SEGMask)) {
-            ret = env->tlb->map_address(env, physical, prot,
-                                        real_address, access_type);
-        } else {
-            ret = TLBRET_BADADDR;
-        }
-    } else if (address < 0xC000000000000000ULL) {
-        /* xkphys */
-        if ((address & 0x07FFFFFFFFFFFFFFULL) <= env->PAMask) {
-            /* KX/SX/UX bit to check for each xkphys EVA access mode */
-            static const uint8_t am_ksux[8] = {
-                [CP0SC_AM_UK]    = (1u << CP0St_KX),
-                [CP0SC_AM_MK]    = (1u << CP0St_KX),
-                [CP0SC_AM_MSK]   = (1u << CP0St_SX),
-                [CP0SC_AM_MUSK]  = (1u << CP0St_UX),
-                [CP0SC_AM_MUSUK] = (1u << CP0St_UX),
-                [CP0SC_AM_USK]   = (1u << CP0St_SX),
-                [6]              = (1u << CP0St_KX),
-                [CP0SC_AM_UUSK]  = (1u << CP0St_UX),
-            };
-            unsigned int am = CP0SC_AM_UK;
-            unsigned int xr = (env->CP0_SegCtl2 & CP0SC2_XR_MASK) >> CP0SC2_XR;
-
-            if (xr & (1 << ((address >> 59) & 0x7))) {
-                am = (env->CP0_SegCtl1 & CP0SC1_XAM_MASK) >> CP0SC1_XAM;
-            }
-            /* Does CP0_Status.KX/SX/UX permit the access mode (am) */
-            if (env->CP0_Status & am_ksux[am]) {
-                ret = get_seg_physical_address(env, physical, prot,
-                                               real_address, access_type,
-                                               mmu_idx, am, false, env->PAMask,
-                                               0);
-            } else {
-                ret = TLBRET_BADADDR;
-            }
-        } else {
-            ret = TLBRET_BADADDR;
-        }
-    } else if (address < 0xFFFFFFFF80000000ULL) {
-        /* xkseg */
-        if (kernel_mode && KX &&
-            address <= (0xFFFFFFFF7FFFFFFFULL & env->SEGMask)) {
-            ret = env->tlb->map_address(env, physical, prot,
-                                        real_address, access_type);
-        } else {
-            ret = TLBRET_BADADDR;
-        }
-#endif
-    } else if (address < KSEG1_BASE) {
-        /* kseg0 */
-        ret = get_segctl_physical_address(env, physical, prot, real_address,
-                                          access_type, mmu_idx,
-                                          env->CP0_SegCtl1 >> 16, 0x1FFFFFFF);
-    } else if (address < KSEG2_BASE) {
-        /* kseg1 */
-        ret = get_segctl_physical_address(env, physical, prot, real_address,
-                                          access_type, mmu_idx,
-                                          env->CP0_SegCtl1, 0x1FFFFFFF);
-    } else if (address < KSEG3_BASE) {
-        /* sseg (kseg2) */
-        ret = get_segctl_physical_address(env, physical, prot, real_address,
-                                          access_type, mmu_idx,
-                                          env->CP0_SegCtl0 >> 16, 0x1FFFFFFF);
-    } else {
-        /*
-         * kseg3
-         * XXX: debug segment is not emulated
-         */
-        ret = get_segctl_physical_address(env, physical, prot, real_address,
-                                          access_type, mmu_idx,
-                                          env->CP0_SegCtl0, 0x1FFFFFFF);
-    }
-    return ret;
-}
-
 void cpu_mips_tlb_flush(CPUMIPSState *env)
 {
     /* Flush qemu's TLB and discard all shadowed entries.  */
@@ -482,20 +242,6 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
     env->error_code = error_code;
 }
 
-hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
-{
-    MIPSCPU *cpu = MIPS_CPU(cs);
-    CPUMIPSState *env = &cpu->env;
-    hwaddr phys_addr;
-    int prot;
-
-    if (get_physical_address(env, &phys_addr, &prot, addr, MMU_DATA_LOAD,
-                             cpu_mmu_index(env, false)) != 0) {
-        return -1;
-    }
-    return phys_addr;
-}
-
 #if !defined(TARGET_MIPS64)
 
 /*
diff --git a/target/mips/sysemu/meson.build b/target/mips/sysemu/meson.build
index f2a1ff46081..925ceeaa449 100644
--- a/target/mips/sysemu/meson.build
+++ b/target/mips/sysemu/meson.build
@@ -2,4 +2,5 @@
   'addr.c',
   'cp0_timer.c',
   'machine.c',
+  'physaddr.c',
 ))
-- 
2.26.3



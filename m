Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7A353F2B4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:46:12 +0200 (CEST)
Received: from localhost ([::1]:56006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMQF-0008PH-Lj
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwR-0001k5-Uh
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:27 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwN-0003z1-Oh
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:22 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so13875629pjs.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e/CaVyL6D0TOX6vRnGoc8tHlxl3zECpqyPAB50gwqiY=;
 b=sdsJsOF6RThIZedgdCO7NJ9xOEvTp+N7VMBjH0Om2lBvXaFi7dIpD2opz8lQB17DMq
 hMjSmSk4wMst8VUPA5REhcXGM4a+RZOZvT1eLuJwKgqrrNmLE3Sm7oqmlnEZWi2ANHKx
 IEKk6Ddamo1rc1o7SmmrbnQ4Ruujiwy9TG4ym0UhtNfzCFZuThBRPoy6TgSeRYuQZuGa
 e8Gsrnrh1PC3SVObfbr2G+vY6BuFzX6MxUHmTsF6iG0s+8e8j2YdrvvVG+vBdKnK9AQu
 a7sb2kmop8cTvX61cfAVzLO1K2F6I/F9iP8aCeWVOIgVmSJ97Wv3UV357DMvd2filp5X
 dH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e/CaVyL6D0TOX6vRnGoc8tHlxl3zECpqyPAB50gwqiY=;
 b=HWvgbh3V0xTa+kabADl7Bs85BykNW5DMpW+71kYGUpOyU7S7NM/kILwrelr290SM9W
 mjW9QH3/lYDvc9Tvr2Bc3WWfNd+1I7rDBbPj5c7K2+nPFPqlCskiTkHplQlp7CpvYP6Z
 ny4T4Dncyzd1XlXOjTyTISLxE4vjzFep5dR1X8DPiCA+s6BrU56deVEGRkupic47Klvo
 CLlXHZ6PTl/PHM9jx6/vmbinjXl6FNdz1uPxoJaXJLtNtRtCV4wvR01uUUjVGpM3icOw
 /4gyAGbzo8oviwPkXbBFnOUXG08cxDkuavTbrJCs4kaHB1NyU2kvtxO2wPXOhsetUpge
 Bojw==
X-Gm-Message-State: AOAM533RyHs0kE+5bTafkxjF0eKCH5gvs+l2xNUTKQ1xzt9WniE01z2U
 odD0h2Cj6vbeNV7BT1HLrkNFouT4SRLDEg==
X-Google-Smtp-Source: ABdhPJzP6zbegmYyw0Wn3WujlP9H1RAu+eeIx/gonWs2TEoiJo1I+bSPWwxEzwu4RCdDAyLWqfEnWQ==
X-Received: by 2002:a17:903:1013:b0:163:e8b9:2429 with SMTP id
 a19-20020a170903101300b00163e8b92429mr26519588plb.74.1654557316154; 
 Mon, 06 Jun 2022 16:15:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 26/43] target/loongarch: Add LoongArch IOCSR instruction
Date: Mon,  6 Jun 2022 16:14:33 -0700
Message-Id: <20220606231450.448443-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

This includes:
- IOCSR{RD/WR}.{B/H/W/D}

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-27-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.h                        | 25 +++++++
 target/loongarch/helper.h                     |  8 +++
 target/loongarch/insns.decode                 |  9 +++
 target/loongarch/cpu.c                        | 44 ++++++++++++
 target/loongarch/disas.c                      |  8 +++
 target/loongarch/iocsr_helper.c               | 67 +++++++++++++++++++
 .../insn_trans/trans_privileged.c.inc         | 35 ++++++++++
 target/loongarch/meson.build                  |  1 +
 8 files changed, 197 insertions(+)
 create mode 100644 target/loongarch/iocsr_helper.c

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 2081902f2e..03cc96ee9b 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -12,6 +12,27 @@
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
 #include "qemu/timer.h"
+#include "exec/memory.h"
+#include "hw/sysbus.h"
+
+#define IOCSRF_TEMP             0
+#define IOCSRF_NODECNT          1
+#define IOCSRF_MSI              2
+#define IOCSRF_EXTIOI           3
+#define IOCSRF_CSRIPI           4
+#define IOCSRF_FREQCSR          5
+#define IOCSRF_FREQSCALE        6
+#define IOCSRF_DVFSV1           7
+#define IOCSRF_GMOD             9
+#define IOCSRF_VM               11
+
+#define FEATURE_REG             0x8
+#define VENDOR_REG              0x10
+#define CPUNAME_REG             0x20
+#define MISC_FUNC_REG           0x420
+#define IOCSRM_EXTIOI_EN        48
+
+#define IOCSR_MEM_SIZE          0x428
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
@@ -283,6 +304,10 @@ typedef struct CPUArchState {
     uint64_t CSR_DSAVE;
 
     LoongArchTLB  tlb[LOONGARCH_TLB_MAX];
+
+    AddressSpace address_space_iocsr;
+    MemoryRegion system_iocsr;
+    MemoryRegion iocsr_mem;
 } CPULoongArchState;
 
 /**
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 5a6754eb65..4664a02dcf 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -100,3 +100,11 @@ DEF_HELPER_2(csrwr_estat, i64, env, tl)
 DEF_HELPER_2(csrwr_asid, i64, env, tl)
 DEF_HELPER_2(csrwr_tcfg, i64, env, tl)
 DEF_HELPER_2(csrwr_ticlr, i64, env, tl)
+DEF_HELPER_2(iocsrrd_b, i64, env, tl)
+DEF_HELPER_2(iocsrrd_h, i64, env, tl)
+DEF_HELPER_2(iocsrrd_w, i64, env, tl)
+DEF_HELPER_2(iocsrrd_d, i64, env, tl)
+DEF_HELPER_3(iocsrwr_b, void, env, tl, tl)
+DEF_HELPER_3(iocsrwr_h, void, env, tl, tl)
+DEF_HELPER_3(iocsrwr_w, void, env, tl, tl)
+DEF_HELPER_3(iocsrwr_d, void, env, tl, tl)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 43005ca283..2b436d3cd6 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -450,3 +450,12 @@ bgeu            0110 11 ................ ..... .....     @rr_offs16
   csrwr             0000 0100 .............. 00001 .....     @r_csr
   csrxchg           0000 0100 .............. ..... .....     @rr_csr
 }
+
+iocsrrd_b        0000 01100100 10000 00000 ..... .....    @rr
+iocsrrd_h        0000 01100100 10000 00001 ..... .....    @rr
+iocsrrd_w        0000 01100100 10000 00010 ..... .....    @rr
+iocsrrd_d        0000 01100100 10000 00011 ..... .....    @rr
+iocsrwr_b        0000 01100100 10000 00100 ..... .....    @rr
+iocsrwr_h        0000 01100100 10000 00101 ..... .....    @rr
+iocsrwr_w        0000 01100100 10000 00110 ..... .....    @rr
+iocsrwr_d        0000 01100100 10000 00111 ..... .....    @rr
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 5ec0ba1cfa..b846bd1a8b 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -17,6 +17,8 @@
 #include "internals.h"
 #include "fpu/softfloat-helpers.h"
 #include "cpu-csr.h"
+#include "sysemu/reset.h"
+#include "hw/loader.h"
 
 const char * const regnames[32] = {
     "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
@@ -489,14 +491,56 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
     lacc->parent_realize(dev, errp);
 }
 
+static void loongarch_qemu_write(void *opaque, hwaddr addr,
+                                 uint64_t val, unsigned size)
+{
+}
+
+static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
+{
+    switch (addr) {
+    case FEATURE_REG:
+        return 1ULL << IOCSRF_MSI | 1ULL << IOCSRF_EXTIOI |
+               1ULL << IOCSRF_CSRIPI;
+    case VENDOR_REG:
+        return 0x6e6f73676e6f6f4cULL; /* "Loongson" */
+    case CPUNAME_REG:
+        return 0x303030354133ULL;     /* "3A5000" */
+    case MISC_FUNC_REG:
+        return 1ULL << IOCSRM_EXTIOI_EN;
+    }
+    return 0ULL;
+}
+
+static const MemoryRegionOps loongarch_qemu_ops = {
+    .read = loongarch_qemu_read,
+    .write = loongarch_qemu_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 8,
+        .max_access_size = 8,
+    },
+};
+
 static void loongarch_cpu_init(Object *obj)
 {
     LoongArchCPU *cpu = LOONGARCH_CPU(obj);
+    CPULoongArchState *env = &cpu->env;
 
     cpu_set_cpustate_pointers(cpu);
     qdev_init_gpio_in(DEVICE(cpu), loongarch_cpu_set_irq, N_IRQS);
     timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
                   &loongarch_constant_timer_cb, cpu);
+    memory_region_init_io(&env->system_iocsr, OBJECT(cpu), NULL,
+                      env, "iocsr", UINT64_MAX);
+    address_space_init(&env->address_space_iocsr, &env->system_iocsr, "IOCSR");
+    memory_region_init_io(&env->iocsr_mem, OBJECT(cpu), &loongarch_qemu_ops,
+                          NULL, "iocsr_misc", 0x428);
+    memory_region_add_subregion(&env->system_iocsr, 0, &env->iocsr_mem);
 }
 
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 11a704ff7c..ea26aea728 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -615,6 +615,14 @@ INSN(bgeu,         rr_offs)
 INSN(csrrd,        r_csr)
 INSN(csrwr,        r_csr)
 INSN(csrxchg,      rr_csr)
+INSN(iocsrrd_b,    rr)
+INSN(iocsrrd_h,    rr)
+INSN(iocsrrd_w,    rr)
+INSN(iocsrrd_d,    rr)
+INSN(iocsrwr_b,    rr)
+INSN(iocsrwr_h,    rr)
+INSN(iocsrwr_w,    rr)
+INSN(iocsrwr_d,    rr)
 
 #define output_fcmp(C, PREFIX, SUFFIX)                                         \
 {                                                                              \
diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
new file mode 100644
index 0000000000..0e9c537dc7
--- /dev/null
+++ b/target/loongarch/iocsr_helper.c
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * Helpers for IOCSR reads/writes
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "cpu.h"
+#include "qemu/host-utils.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "tcg/tcg-ldst.h"
+
+uint64_t helper_iocsrrd_b(CPULoongArchState *env, target_ulong r_addr)
+{
+    return address_space_ldub(&env->address_space_iocsr, r_addr,
+                              MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+uint64_t helper_iocsrrd_h(CPULoongArchState *env, target_ulong r_addr)
+{
+    return address_space_lduw(&env->address_space_iocsr, r_addr,
+                              MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+uint64_t helper_iocsrrd_w(CPULoongArchState *env, target_ulong r_addr)
+{
+    return address_space_ldl(&env->address_space_iocsr, r_addr,
+                             MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+uint64_t helper_iocsrrd_d(CPULoongArchState *env, target_ulong r_addr)
+{
+    return address_space_ldq(&env->address_space_iocsr, r_addr,
+                             MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+void helper_iocsrwr_b(CPULoongArchState *env, target_ulong w_addr,
+                      target_ulong val)
+{
+    address_space_stb(&env->address_space_iocsr, w_addr,
+                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+void helper_iocsrwr_h(CPULoongArchState *env, target_ulong w_addr,
+                      target_ulong val)
+{
+    address_space_stw(&env->address_space_iocsr, w_addr,
+                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+void helper_iocsrwr_w(CPULoongArchState *env, target_ulong w_addr,
+                      target_ulong val)
+{
+    address_space_stl(&env->address_space_iocsr, w_addr,
+                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+void helper_iocsrwr_d(CPULoongArchState *env, target_ulong w_addr,
+                      target_ulong val)
+{
+    address_space_stq(&env->address_space_iocsr, w_addr,
+                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+}
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index f984e3f68e..3e50cd3ac6 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -262,3 +262,38 @@ static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
     tcg_temp_free(oldv);
     return true;
 }
+
+static bool gen_iocsrrd(DisasContext *ctx, arg_rr *a,
+                        void (*func)(TCGv, TCGv_ptr, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    func(dest, cpu_env, src1);
+    return true;
+}
+
+static bool gen_iocsrwr(DisasContext *ctx, arg_rr *a,
+                        void (*func)(TCGv_ptr, TCGv, TCGv))
+{
+    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    func(cpu_env, addr, val);
+    return true;
+}
+
+TRANS(iocsrrd_b, gen_iocsrrd, gen_helper_iocsrrd_b)
+TRANS(iocsrrd_h, gen_iocsrrd, gen_helper_iocsrrd_h)
+TRANS(iocsrrd_w, gen_iocsrrd, gen_helper_iocsrrd_w)
+TRANS(iocsrrd_d, gen_iocsrrd, gen_helper_iocsrrd_d)
+TRANS(iocsrwr_b, gen_iocsrwr, gen_helper_iocsrwr_b)
+TRANS(iocsrwr_h, gen_iocsrwr, gen_helper_iocsrwr_h)
+TRANS(iocsrwr_w, gen_iocsrwr, gen_helper_iocsrwr_w)
+TRANS(iocsrwr_d, gen_iocsrwr, gen_helper_iocsrwr_d)
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index d11829a6cc..74e5f3b2a7 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -20,6 +20,7 @@ loongarch_softmmu_ss.add(files(
   'tlb_helper.c',
   'constant_timer.c',
   'csr_helper.c',
+  'iocsr_helper.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
-- 
2.34.1



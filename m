Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455B431E32C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:45:11 +0100 (CET)
Received: from localhost ([::1]:46166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWVK-0004Ra-Au
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRC-0008JE-VU
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:55 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWR8-0004cj-9J
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:54 -0500
Received: by mail-pj1-x102b.google.com with SMTP id l18so264684pji.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJk3e4AfvfpdW4OO2fcNK1rD5VxDoURrTXi+1stUu50=;
 b=Uq5UPr2z8yA+goemdmcLDrJD5T0u4TaN4r4pIwIbVPOwHZ5eUO1ogRMhOGVM2OVBYU
 du8JCC2ENbhk1K5xmzzZ07zgA4GjbBlEzwBuKT22Sz5Enr93wH1E1RdoTOgHhIjrx7tM
 vpDY/jaMAJCTE6HVbWZe8nBn66Zp5Xsd3I5F+Oc0qOHaxpt/GXgSHTM328CZlviDv4wa
 HWEjrbKpgPh0AuXpASqopUbLYkxrigpv5DI6BjCGlHalyhW4DJgm/4a/3T1tqUIEGDCb
 uSH8mwna4oNKnjkfmVmPTX1y0jwWwy06qEhS9cTkZEzpDs2XVxa38twd+mXtjlb/ohRQ
 a4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJk3e4AfvfpdW4OO2fcNK1rD5VxDoURrTXi+1stUu50=;
 b=jaPjCot0vnDV60gnIbZ2IA7TrZdzRVf/QR1ote1JxjIBZ2mZK1P46b+aF7/A4GV1iJ
 oGRTyHJH7V/s4ORq0PfCof/g7T5RIpAFTV9Fb29ZWzfDBGZCx74KTs142/FR3qUBrS04
 QhS55f4oM4WWmJSYtJeIzYfryLo1wdP+n6cCETkGtR0BQzconzFbSO4UJpSMvbwxrZBD
 p5EQNsk/O77TRJ9EgU7R+yam8LHi/Kz8QODG6LRHTA5Z75rSWlcAUrtr1K29FyTSQDLF
 wyYHSPlOkpWM5TJnyzlXDrEpMroun5VkKBT5Cyx9Ln4wBuzmWJvXbLEQ+bXxLygCmFYl
 sLyg==
X-Gm-Message-State: AOAM530KeeSguVuFXFJlFrA1ibeoJi4paRoxQaOPVoUi1vma2LFK0dn+
 OpHQfcZou06Ru2nbFXCF5QYALAU++tUefQ==
X-Google-Smtp-Source: ABdhPJwu6r7jiHnmhc/sVqXh6KR3ioCrmjF2obkn0B0CZfQtLd3VjyxI0tsvHaE4l/t5W9pKSzrbAg==
X-Received: by 2002:a17:90b:3907:: with SMTP id
 ob7mr1232957pjb.18.1613605244947; 
 Wed, 17 Feb 2021 15:40:44 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/35] Hexagon (target/hexagon) scalar core helpers
Date: Wed, 17 Feb 2021 15:39:56 -0800
Message-Id: <20210217234023.1742406-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

The majority of helpers are generated.  Define the helper functions needed
then include the generated file

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1612763186-18161-8-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/helper.h    |   88 +++
 target/hexagon/op_helper.c | 1064 ++++++++++++++++++++++++++++++++++++
 2 files changed, 1152 insertions(+)
 create mode 100644 target/hexagon/helper.h
 create mode 100644 target/hexagon/op_helper.c

diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
new file mode 100644
index 0000000000..a5f340ce67
--- /dev/null
+++ b/target/hexagon/helper.h
@@ -0,0 +1,88 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "internal.h"
+#include "helper_protos_generated.h.inc"
+
+DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_RETURN, noreturn, env, i32)
+#if HEX_DEBUG
+DEF_HELPER_1(debug_start_packet, void, env)
+DEF_HELPER_FLAGS_3(debug_check_store_width, TCG_CALL_NO_WG, void, env, int, int)
+DEF_HELPER_FLAGS_3(debug_commit_end, TCG_CALL_NO_WG, void, env, int, int)
+#endif
+DEF_HELPER_2(commit_store, void, env, int)
+DEF_HELPER_FLAGS_4(fcircadd, TCG_CALL_NO_RWG_SE, s32, s32, s32, s32, s32)
+
+/* Floating point */
+DEF_HELPER_2(conv_sf2df, f64, env, f32)
+DEF_HELPER_2(conv_df2sf, f32, env, f64)
+DEF_HELPER_2(conv_uw2sf, f32, env, s32)
+DEF_HELPER_2(conv_uw2df, f64, env, s32)
+DEF_HELPER_2(conv_w2sf, f32, env, s32)
+DEF_HELPER_2(conv_w2df, f64, env, s32)
+DEF_HELPER_2(conv_ud2sf, f32, env, s64)
+DEF_HELPER_2(conv_ud2df, f64, env, s64)
+DEF_HELPER_2(conv_d2sf, f32, env, s64)
+DEF_HELPER_2(conv_d2df, f64, env, s64)
+DEF_HELPER_2(conv_sf2uw, s32, env, f32)
+DEF_HELPER_2(conv_sf2w, s32, env, f32)
+DEF_HELPER_2(conv_sf2ud, s64, env, f32)
+DEF_HELPER_2(conv_sf2d, s64, env, f32)
+DEF_HELPER_2(conv_df2uw, s32, env, f64)
+DEF_HELPER_2(conv_df2w, s32, env, f64)
+DEF_HELPER_2(conv_df2ud, s64, env, f64)
+DEF_HELPER_2(conv_df2d, s64, env, f64)
+DEF_HELPER_2(conv_sf2uw_chop, s32, env, f32)
+DEF_HELPER_2(conv_sf2w_chop, s32, env, f32)
+DEF_HELPER_2(conv_sf2ud_chop, s64, env, f32)
+DEF_HELPER_2(conv_sf2d_chop, s64, env, f32)
+DEF_HELPER_2(conv_df2uw_chop, s32, env, f64)
+DEF_HELPER_2(conv_df2w_chop, s32, env, f64)
+DEF_HELPER_2(conv_df2ud_chop, s64, env, f64)
+DEF_HELPER_2(conv_df2d_chop, s64, env, f64)
+DEF_HELPER_3(sfadd, f32, env, f32, f32)
+DEF_HELPER_3(sfsub, f32, env, f32, f32)
+DEF_HELPER_3(sfcmpeq, s32, env, f32, f32)
+DEF_HELPER_3(sfcmpgt, s32, env, f32, f32)
+DEF_HELPER_3(sfcmpge, s32, env, f32, f32)
+DEF_HELPER_3(sfcmpuo, s32, env, f32, f32)
+DEF_HELPER_3(sfmax, f32, env, f32, f32)
+DEF_HELPER_3(sfmin, f32, env, f32, f32)
+DEF_HELPER_3(sfclass, s32, env, f32, s32)
+DEF_HELPER_3(sffixupn, f32, env, f32, f32)
+DEF_HELPER_3(sffixupd, f32, env, f32, f32)
+DEF_HELPER_2(sffixupr, f32, env, f32)
+
+DEF_HELPER_3(dfadd, f64, env, f64, f64)
+DEF_HELPER_3(dfsub, f64, env, f64, f64)
+DEF_HELPER_3(dfmax, f64, env, f64, f64)
+DEF_HELPER_3(dfmin, f64, env, f64, f64)
+DEF_HELPER_3(dfcmpeq, s32, env, f64, f64)
+DEF_HELPER_3(dfcmpgt, s32, env, f64, f64)
+DEF_HELPER_3(dfcmpge, s32, env, f64, f64)
+DEF_HELPER_3(dfcmpuo, s32, env, f64, f64)
+DEF_HELPER_3(dfclass, s32, env, f64, s32)
+
+DEF_HELPER_3(sfmpy, f32, env, f32, f32)
+DEF_HELPER_4(sffma, f32, env, f32, f32, f32)
+DEF_HELPER_5(sffma_sc, f32, env, f32, f32, f32, f32)
+DEF_HELPER_4(sffms, f32, env, f32, f32, f32)
+DEF_HELPER_4(sffma_lib, f32, env, f32, f32, f32)
+DEF_HELPER_4(sffms_lib, f32, env, f32, f32, f32)
+
+DEF_HELPER_3(dfmpyfix, f64, env, f64, f64)
+DEF_HELPER_4(dfmpyhh, f64, env, f64, f64, f64)
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
new file mode 100644
index 0000000000..2c6d718579
--- /dev/null
+++ b/target/hexagon/op_helper.c
@@ -0,0 +1,1064 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu.h"
+#include "exec/helper-proto.h"
+#include "fpu/softfloat.h"
+#include "cpu.h"
+#include "internal.h"
+#include "macros.h"
+#include "arch.h"
+#include "hex_arch_types.h"
+#include "fma_emu.h"
+#include "conv_emu.h"
+
+#define SF_BIAS        127
+#define SF_MANTBITS    23
+
+/* Exceptions processing helpers */
+static void QEMU_NORETURN do_raise_exception_err(CPUHexagonState *env,
+                                                 uint32_t exception,
+                                                 uintptr_t pc)
+{
+    CPUState *cs = CPU(hexagon_env_get_cpu(env));
+    qemu_log_mask(CPU_LOG_INT, "%s: %d\n", __func__, exception);
+    cs->exception_index = exception;
+    cpu_loop_exit_restore(cs, pc);
+}
+
+void QEMU_NORETURN HELPER(raise_exception)(CPUHexagonState *env, uint32_t excp)
+{
+    do_raise_exception_err(env, excp, 0);
+}
+
+static inline void log_reg_write(CPUHexagonState *env, int rnum,
+                                 target_ulong val, uint32_t slot)
+{
+    HEX_DEBUG_LOG("log_reg_write[%d] = " TARGET_FMT_ld " (0x" TARGET_FMT_lx ")",
+                  rnum, val, val);
+    if (val == env->gpr[rnum]) {
+        HEX_DEBUG_LOG(" NO CHANGE");
+    }
+    HEX_DEBUG_LOG("\n");
+
+    env->new_value[rnum] = val;
+#if HEX_DEBUG
+    /* Do this so HELPER(debug_commit_end) will know */
+    env->reg_written[rnum] = 1;
+#endif
+}
+
+static inline void log_pred_write(CPUHexagonState *env, int pnum,
+                                  target_ulong val)
+{
+    HEX_DEBUG_LOG("log_pred_write[%d] = " TARGET_FMT_ld
+                  " (0x" TARGET_FMT_lx ")\n",
+                  pnum, val, val);
+
+    /* Multiple writes to the same preg are and'ed together */
+    if (env->pred_written & (1 << pnum)) {
+        env->new_pred_value[pnum] &= val & 0xff;
+    } else {
+        env->new_pred_value[pnum] = val & 0xff;
+        env->pred_written |= 1 << pnum;
+    }
+}
+
+static inline void log_store32(CPUHexagonState *env, target_ulong addr,
+                               target_ulong val, int width, int slot)
+{
+    HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx
+                  ", %" PRId32 " [0x08%" PRIx32 "])\n",
+                  width, addr, val, val);
+    env->mem_log_stores[slot].va = addr;
+    env->mem_log_stores[slot].width = width;
+    env->mem_log_stores[slot].data32 = val;
+}
+
+static inline void log_store64(CPUHexagonState *env, target_ulong addr,
+                               int64_t val, int width, int slot)
+{
+    HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx
+                  ", %" PRId64 " [0x016%" PRIx64 "])\n",
+                   width, addr, val, val);
+    env->mem_log_stores[slot].va = addr;
+    env->mem_log_stores[slot].width = width;
+    env->mem_log_stores[slot].data64 = val;
+}
+
+static inline void write_new_pc(CPUHexagonState *env, target_ulong addr)
+{
+    HEX_DEBUG_LOG("write_new_pc(0x" TARGET_FMT_lx ")\n", addr);
+
+    /*
+     * If more than one branch is taken in a packet, only the first one
+     * is actually done.
+     */
+    if (env->branch_taken) {
+        HEX_DEBUG_LOG("INFO: multiple branches taken in same packet, "
+                      "ignoring the second one\n");
+    } else {
+        fCHECK_PCALIGN(addr);
+        env->branch_taken = 1;
+        env->next_PC = addr;
+    }
+}
+
+#if HEX_DEBUG
+/* Handy place to set a breakpoint */
+void HELPER(debug_start_packet)(CPUHexagonState *env)
+{
+    HEX_DEBUG_LOG("Start packet: pc = 0x" TARGET_FMT_lx "\n",
+                  env->gpr[HEX_REG_PC]);
+
+    for (int i = 0; i < TOTAL_PER_THREAD_REGS; i++) {
+        env->reg_written[i] = 0;
+    }
+}
+#endif
+
+static inline int32_t new_pred_value(CPUHexagonState *env, int pnum)
+{
+    return env->new_pred_value[pnum];
+}
+
+#if HEX_DEBUG
+/* Checks for bookkeeping errors between disassembly context and runtime */
+void HELPER(debug_check_store_width)(CPUHexagonState *env, int slot, int check)
+{
+    if (env->mem_log_stores[slot].width != check) {
+        HEX_DEBUG_LOG("ERROR: %d != %d\n",
+                      env->mem_log_stores[slot].width, check);
+        g_assert_not_reached();
+    }
+}
+#endif
+
+void HELPER(commit_store)(CPUHexagonState *env, int slot_num)
+{
+    switch (env->mem_log_stores[slot_num].width) {
+    case 1:
+        put_user_u8(env->mem_log_stores[slot_num].data32,
+                    env->mem_log_stores[slot_num].va);
+        break;
+    case 2:
+        put_user_u16(env->mem_log_stores[slot_num].data32,
+                     env->mem_log_stores[slot_num].va);
+        break;
+    case 4:
+        put_user_u32(env->mem_log_stores[slot_num].data32,
+                     env->mem_log_stores[slot_num].va);
+        break;
+    case 8:
+        put_user_u64(env->mem_log_stores[slot_num].data64,
+                     env->mem_log_stores[slot_num].va);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+#if HEX_DEBUG
+static void print_store(CPUHexagonState *env, int slot)
+{
+    if (!(env->slot_cancelled & (1 << slot))) {
+        uint8_t width = env->mem_log_stores[slot].width;
+        if (width == 1) {
+            uint32_t data = env->mem_log_stores[slot].data32 & 0xff;
+            HEX_DEBUG_LOG("\tmemb[0x" TARGET_FMT_lx "] = %" PRId32
+                          " (0x%02" PRIx32 ")\n",
+                          env->mem_log_stores[slot].va, data, data);
+        } else if (width == 2) {
+            uint32_t data = env->mem_log_stores[slot].data32 & 0xffff;
+            HEX_DEBUG_LOG("\tmemh[0x" TARGET_FMT_lx "] = %" PRId32
+                          " (0x%04" PRIx32 ")\n",
+                          env->mem_log_stores[slot].va, data, data);
+        } else if (width == 4) {
+            uint32_t data = env->mem_log_stores[slot].data32;
+            HEX_DEBUG_LOG("\tmemw[0x" TARGET_FMT_lx "] = %" PRId32
+                          " (0x%08" PRIx32 ")\n",
+                          env->mem_log_stores[slot].va, data, data);
+        } else if (width == 8) {
+            HEX_DEBUG_LOG("\tmemd[0x" TARGET_FMT_lx "] = %" PRId64
+                          " (0x%016" PRIx64 ")\n",
+                          env->mem_log_stores[slot].va,
+                          env->mem_log_stores[slot].data64,
+                          env->mem_log_stores[slot].data64);
+        } else {
+            HEX_DEBUG_LOG("\tBad store width %d\n", width);
+            g_assert_not_reached();
+        }
+    }
+}
+
+/* This function is a handy place to set a breakpoint */
+void HELPER(debug_commit_end)(CPUHexagonState *env, int has_st0, int has_st1)
+{
+    bool reg_printed = false;
+    bool pred_printed = false;
+    int i;
+
+    HEX_DEBUG_LOG("Packet committed: pc = 0x" TARGET_FMT_lx "\n",
+                  env->this_PC);
+    HEX_DEBUG_LOG("slot_cancelled = %d\n", env->slot_cancelled);
+
+    for (i = 0; i < TOTAL_PER_THREAD_REGS; i++) {
+        if (env->reg_written[i]) {
+            if (!reg_printed) {
+                HEX_DEBUG_LOG("Regs written\n");
+                reg_printed = true;
+            }
+            HEX_DEBUG_LOG("\tr%d = " TARGET_FMT_ld " (0x" TARGET_FMT_lx ")\n",
+                          i, env->new_value[i], env->new_value[i]);
+        }
+    }
+
+    for (i = 0; i < NUM_PREGS; i++) {
+        if (env->pred_written & (1 << i)) {
+            if (!pred_printed) {
+                HEX_DEBUG_LOG("Predicates written\n");
+                pred_printed = true;
+            }
+            HEX_DEBUG_LOG("\tp%d = 0x" TARGET_FMT_lx "\n",
+                          i, env->new_pred_value[i]);
+        }
+    }
+
+    if (has_st0 || has_st1) {
+        HEX_DEBUG_LOG("Stores\n");
+        if (has_st0) {
+            print_store(env, 0);
+        }
+        if (has_st1) {
+            print_store(env, 1);
+        }
+    }
+
+    HEX_DEBUG_LOG("Next PC = " TARGET_FMT_lx "\n", env->next_PC);
+    HEX_DEBUG_LOG("Exec counters: pkt = " TARGET_FMT_lx
+                  ", insn = " TARGET_FMT_lx
+                  "\n",
+                  env->gpr[HEX_REG_QEMU_PKT_CNT],
+                  env->gpr[HEX_REG_QEMU_INSN_CNT]);
+
+}
+#endif
+
+static int32_t fcircadd_v4(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
+{
+    int32_t length = M & 0x0001ffff;
+    uint32_t new_ptr = RxV + offset;
+    uint32_t start_addr = CS;
+    uint32_t end_addr = start_addr + length;
+
+    if (new_ptr >= end_addr) {
+        new_ptr -= length;
+    } else if (new_ptr < start_addr) {
+        new_ptr += length;
+    }
+
+    return new_ptr;
+}
+
+int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
+{
+    int32_t K_const = (M >> 24) & 0xf;
+    int32_t length = M & 0x1ffff;
+    int32_t mask = (1 << (K_const + 2)) - 1;
+    uint32_t new_ptr = RxV + offset;
+    uint32_t start_addr = RxV & (~mask);
+    uint32_t end_addr = start_addr | length;
+
+    if (K_const == 0 && length >= 4) {
+        return fcircadd_v4(RxV, offset, M, CS);
+    }
+
+    if (new_ptr >= end_addr) {
+        new_ptr -= length;
+    } else if (new_ptr < start_addr) {
+        new_ptr += length;
+    }
+
+    return new_ptr;
+}
+
+/*
+ * Hexagon FP operations return ~0 insteat of NaN
+ * The hex_check_sfnan/hex_check_dfnan functions perform this check
+ */
+static float32 hex_check_sfnan(float32 x)
+{
+    if (float32_is_any_nan(x)) {
+        return make_float32(0xFFFFFFFFU);
+    }
+    return x;
+}
+
+static float64 hex_check_dfnan(float64 x)
+{
+    if (float64_is_any_nan(x)) {
+        return make_float64(0xFFFFFFFFFFFFFFFFULL);
+    }
+    return x;
+}
+
+/*
+ * mem_noshuf
+ * Section 5.5 of the Hexagon V67 Programmer's Reference Manual
+ *
+ * If the load is in slot 0 and there is a store in slot1 (that
+ * wasn't cancelled), we have to do the store first.
+ */
+static void check_noshuf(CPUHexagonState *env, uint32_t slot)
+{
+    if (slot == 0 && env->pkt_has_store_s1 &&
+        ((env->slot_cancelled & (1 << 1)) == 0)) {
+        HELPER(commit_store)(env, 1);
+    }
+}
+
+static inline uint8_t mem_load1(CPUHexagonState *env, uint32_t slot,
+                                target_ulong vaddr)
+{
+    uint8_t retval;
+    check_noshuf(env, slot);
+    get_user_u8(retval, vaddr);
+    return retval;
+}
+
+static inline uint16_t mem_load2(CPUHexagonState *env, uint32_t slot,
+                                 target_ulong vaddr)
+{
+    uint16_t retval;
+    check_noshuf(env, slot);
+    get_user_u16(retval, vaddr);
+    return retval;
+}
+
+static inline uint32_t mem_load4(CPUHexagonState *env, uint32_t slot,
+                                 target_ulong vaddr)
+{
+    uint32_t retval;
+    check_noshuf(env, slot);
+    get_user_u32(retval, vaddr);
+    return retval;
+}
+
+static inline uint64_t mem_load8(CPUHexagonState *env, uint32_t slot,
+                                 target_ulong vaddr)
+{
+    uint64_t retval;
+    check_noshuf(env, slot);
+    get_user_u64(retval, vaddr);
+    return retval;
+}
+
+/* Floating point */
+float64 HELPER(conv_sf2df)(CPUHexagonState *env, float32 RsV)
+{
+    float64 out_f64;
+    arch_fpop_start(env);
+    out_f64 = float32_to_float64(RsV, &env->fp_status);
+    out_f64 = hex_check_dfnan(out_f64);
+    arch_fpop_end(env);
+    return out_f64;
+}
+
+float32 HELPER(conv_df2sf)(CPUHexagonState *env, float64 RssV)
+{
+    float32 out_f32;
+    arch_fpop_start(env);
+    out_f32 = float64_to_float32(RssV, &env->fp_status);
+    out_f32 = hex_check_sfnan(out_f32);
+    arch_fpop_end(env);
+    return out_f32;
+}
+
+float32 HELPER(conv_uw2sf)(CPUHexagonState *env, int32_t RsV)
+{
+    float32 RdV;
+    arch_fpop_start(env);
+    RdV = uint32_to_float32(RsV, &env->fp_status);
+    RdV = hex_check_sfnan(RdV);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+float64 HELPER(conv_uw2df)(CPUHexagonState *env, int32_t RsV)
+{
+    float64 RddV;
+    arch_fpop_start(env);
+    RddV = uint32_to_float64(RsV, &env->fp_status);
+    RddV = hex_check_dfnan(RddV);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+float32 HELPER(conv_w2sf)(CPUHexagonState *env, int32_t RsV)
+{
+    float32 RdV;
+    arch_fpop_start(env);
+    RdV = int32_to_float32(RsV, &env->fp_status);
+    RdV = hex_check_sfnan(RdV);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+float64 HELPER(conv_w2df)(CPUHexagonState *env, int32_t RsV)
+{
+    float64 RddV;
+    arch_fpop_start(env);
+    RddV = int32_to_float64(RsV, &env->fp_status);
+    RddV = hex_check_dfnan(RddV);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+float32 HELPER(conv_ud2sf)(CPUHexagonState *env, int64_t RssV)
+{
+    float32 RdV;
+    arch_fpop_start(env);
+    RdV = uint64_to_float32(RssV, &env->fp_status);
+    RdV = hex_check_sfnan(RdV);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+float64 HELPER(conv_ud2df)(CPUHexagonState *env, int64_t RssV)
+{
+    float64 RddV;
+    arch_fpop_start(env);
+    RddV = uint64_to_float64(RssV, &env->fp_status);
+    RddV = hex_check_dfnan(RddV);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+float32 HELPER(conv_d2sf)(CPUHexagonState *env, int64_t RssV)
+{
+    float32 RdV;
+    arch_fpop_start(env);
+    RdV = int64_to_float32(RssV, &env->fp_status);
+    RdV = hex_check_sfnan(RdV);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+float64 HELPER(conv_d2df)(CPUHexagonState *env, int64_t RssV)
+{
+    float64 RddV;
+    arch_fpop_start(env);
+    RddV = int64_to_float64(RssV, &env->fp_status);
+    RddV = hex_check_dfnan(RddV);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+int32_t HELPER(conv_sf2uw)(CPUHexagonState *env, float32 RsV)
+{
+    int32_t RdV;
+    arch_fpop_start(env);
+    RdV = conv_sf_to_4u(RsV, &env->fp_status);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+int32_t HELPER(conv_sf2w)(CPUHexagonState *env, float32 RsV)
+{
+    int32_t RdV;
+    arch_fpop_start(env);
+    RdV = conv_sf_to_4s(RsV, &env->fp_status);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+int64_t HELPER(conv_sf2ud)(CPUHexagonState *env, float32 RsV)
+{
+    int64_t RddV;
+    arch_fpop_start(env);
+    RddV = conv_sf_to_8u(RsV, &env->fp_status);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+int64_t HELPER(conv_sf2d)(CPUHexagonState *env, float32 RsV)
+{
+    int64_t RddV;
+    arch_fpop_start(env);
+    RddV = conv_sf_to_8s(RsV, &env->fp_status);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+int32_t HELPER(conv_df2uw)(CPUHexagonState *env, float64 RssV)
+{
+    int32_t RdV;
+    arch_fpop_start(env);
+    RdV = conv_df_to_4u(RssV, &env->fp_status);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+int32_t HELPER(conv_df2w)(CPUHexagonState *env, float64 RssV)
+{
+    int32_t RdV;
+    arch_fpop_start(env);
+    RdV = conv_df_to_4s(RssV, &env->fp_status);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+int64_t HELPER(conv_df2ud)(CPUHexagonState *env, float64 RssV)
+{
+    int64_t RddV;
+    arch_fpop_start(env);
+    RddV = conv_df_to_8u(RssV, &env->fp_status);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+int64_t HELPER(conv_df2d)(CPUHexagonState *env, float64 RssV)
+{
+    int64_t RddV;
+    arch_fpop_start(env);
+    RddV = conv_df_to_8s(RssV, &env->fp_status);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+int32_t HELPER(conv_sf2uw_chop)(CPUHexagonState *env, float32 RsV)
+{
+    int32_t RdV;
+    arch_fpop_start(env);
+    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
+    RdV = conv_sf_to_4u(RsV, &env->fp_status);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+int32_t HELPER(conv_sf2w_chop)(CPUHexagonState *env, float32 RsV)
+{
+    int32_t RdV;
+    arch_fpop_start(env);
+    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
+    RdV = conv_sf_to_4s(RsV, &env->fp_status);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+int64_t HELPER(conv_sf2ud_chop)(CPUHexagonState *env, float32 RsV)
+{
+    int64_t RddV;
+    arch_fpop_start(env);
+    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
+    RddV = conv_sf_to_8u(RsV, &env->fp_status);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+int64_t HELPER(conv_sf2d_chop)(CPUHexagonState *env, float32 RsV)
+{
+    int64_t RddV;
+    arch_fpop_start(env);
+    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
+    RddV = conv_sf_to_8s(RsV, &env->fp_status);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+int32_t HELPER(conv_df2uw_chop)(CPUHexagonState *env, float64 RssV)
+{
+    int32_t RdV;
+    arch_fpop_start(env);
+    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
+    RdV = conv_df_to_4u(RssV, &env->fp_status);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+int32_t HELPER(conv_df2w_chop)(CPUHexagonState *env, float64 RssV)
+{
+    int32_t RdV;
+    arch_fpop_start(env);
+    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
+    RdV = conv_df_to_4s(RssV, &env->fp_status);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+int64_t HELPER(conv_df2ud_chop)(CPUHexagonState *env, float64 RssV)
+{
+    int64_t RddV;
+    arch_fpop_start(env);
+    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
+    RddV = conv_df_to_8u(RssV, &env->fp_status);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+int64_t HELPER(conv_df2d_chop)(CPUHexagonState *env, float64 RssV)
+{
+    int64_t RddV;
+    arch_fpop_start(env);
+    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
+    RddV = conv_df_to_8s(RssV, &env->fp_status);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+float32 HELPER(sfadd)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    float32 RdV;
+    arch_fpop_start(env);
+    RdV = float32_add(RsV, RtV, &env->fp_status);
+    RdV = hex_check_sfnan(RdV);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+float32 HELPER(sfsub)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    float32 RdV;
+    arch_fpop_start(env);
+    RdV = float32_sub(RsV, RtV, &env->fp_status);
+    RdV = hex_check_sfnan(RdV);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+int32_t HELPER(sfcmpeq)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    int32_t PdV;
+    arch_fpop_start(env);
+    PdV = f8BITSOF(float32_eq_quiet(RsV, RtV, &env->fp_status));
+    arch_fpop_end(env);
+    return PdV;
+}
+
+int32_t HELPER(sfcmpgt)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    int cmp;
+    int32_t PdV;
+    arch_fpop_start(env);
+    cmp = float32_compare_quiet(RsV, RtV, &env->fp_status);
+    PdV = f8BITSOF(cmp == float_relation_greater);
+    arch_fpop_end(env);
+    return PdV;
+}
+
+int32_t HELPER(sfcmpge)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    int cmp;
+    int32_t PdV;
+    arch_fpop_start(env);
+    cmp = float32_compare_quiet(RsV, RtV, &env->fp_status);
+    PdV = f8BITSOF(cmp == float_relation_greater ||
+                   cmp == float_relation_equal);
+    arch_fpop_end(env);
+    return PdV;
+}
+
+int32_t HELPER(sfcmpuo)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    int32_t PdV;
+    arch_fpop_start(env);
+    PdV = f8BITSOF(float32_is_any_nan(RsV) ||
+                   float32_is_any_nan(RtV));
+    arch_fpop_end(env);
+    return PdV;
+}
+
+float32 HELPER(sfmax)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    float32 RdV;
+    arch_fpop_start(env);
+    RdV = float32_maxnum(RsV, RtV, &env->fp_status);
+    RdV = hex_check_sfnan(RdV);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+float32 HELPER(sfmin)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    float32 RdV;
+    arch_fpop_start(env);
+    RdV = float32_minnum(RsV, RtV, &env->fp_status);
+    RdV = hex_check_sfnan(RdV);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+int32_t HELPER(sfclass)(CPUHexagonState *env, float32 RsV, int32_t uiV)
+{
+    int32_t PdV = 0;
+    arch_fpop_start(env);
+    if (fGETBIT(0, uiV) && float32_is_zero(RsV)) {
+        PdV = 0xff;
+    }
+    if (fGETBIT(1, uiV) && float32_is_normal(RsV)) {
+        PdV = 0xff;
+    }
+    if (fGETBIT(2, uiV) && float32_is_denormal(RsV)) {
+        PdV = 0xff;
+    }
+    if (fGETBIT(3, uiV) && float32_is_infinity(RsV)) {
+        PdV = 0xff;
+    }
+    if (fGETBIT(4, uiV) && float32_is_any_nan(RsV)) {
+        PdV = 0xff;
+    }
+    set_float_exception_flags(0, &env->fp_status);
+    arch_fpop_end(env);
+    return PdV;
+}
+
+float32 HELPER(sffixupn)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    float32 RdV = 0;
+    int adjust;
+    arch_fpop_start(env);
+    arch_sf_recip_common(&RsV, &RtV, &RdV, &adjust, &env->fp_status);
+    RdV = RsV;
+    arch_fpop_end(env);
+    return RdV;
+}
+
+float32 HELPER(sffixupd)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    float32 RdV = 0;
+    int adjust;
+    arch_fpop_start(env);
+    arch_sf_recip_common(&RsV, &RtV, &RdV, &adjust, &env->fp_status);
+    RdV = RtV;
+    arch_fpop_end(env);
+    return RdV;
+}
+
+float32 HELPER(sffixupr)(CPUHexagonState *env, float32 RsV)
+{
+    float32 RdV = 0;
+    int adjust;
+    arch_fpop_start(env);
+    arch_sf_invsqrt_common(&RsV, &RdV, &adjust, &env->fp_status);
+    RdV = RsV;
+    arch_fpop_end(env);
+    return RdV;
+}
+
+float64 HELPER(dfadd)(CPUHexagonState *env, float64 RssV, float64 RttV)
+{
+    float64 RddV;
+    arch_fpop_start(env);
+    RddV = float64_add(RssV, RttV, &env->fp_status);
+    RddV = hex_check_dfnan(RddV);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+float64 HELPER(dfsub)(CPUHexagonState *env, float64 RssV, float64 RttV)
+{
+    float64 RddV;
+    arch_fpop_start(env);
+    RddV = float64_sub(RssV, RttV, &env->fp_status);
+    RddV = hex_check_dfnan(RddV);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+float64 HELPER(dfmax)(CPUHexagonState *env, float64 RssV, float64 RttV)
+{
+    float64 RddV;
+    arch_fpop_start(env);
+    RddV = float64_maxnum(RssV, RttV, &env->fp_status);
+    if (float64_is_any_nan(RssV) || float64_is_any_nan(RttV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+    }
+    RddV = hex_check_dfnan(RddV);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+float64 HELPER(dfmin)(CPUHexagonState *env, float64 RssV, float64 RttV)
+{
+    float64 RddV;
+    arch_fpop_start(env);
+    RddV = float64_minnum(RssV, RttV, &env->fp_status);
+    if (float64_is_any_nan(RssV) || float64_is_any_nan(RttV)) {
+        float_raise(float_flag_invalid, &env->fp_status);
+    }
+    RddV = hex_check_dfnan(RddV);
+    arch_fpop_end(env);
+    return RddV;
+}
+
+int32_t HELPER(dfcmpeq)(CPUHexagonState *env, float64 RssV, float64 RttV)
+{
+    int32_t PdV;
+    arch_fpop_start(env);
+    PdV = f8BITSOF(float64_eq_quiet(RssV, RttV, &env->fp_status));
+    arch_fpop_end(env);
+    return PdV;
+}
+
+int32_t HELPER(dfcmpgt)(CPUHexagonState *env, float64 RssV, float64 RttV)
+{
+    int cmp;
+    int32_t PdV;
+    arch_fpop_start(env);
+    cmp = float64_compare_quiet(RssV, RttV, &env->fp_status);
+    PdV = f8BITSOF(cmp == float_relation_greater);
+    arch_fpop_end(env);
+    return PdV;
+}
+
+int32_t HELPER(dfcmpge)(CPUHexagonState *env, float64 RssV, float64 RttV)
+{
+    int cmp;
+    int32_t PdV;
+    arch_fpop_start(env);
+    cmp = float64_compare_quiet(RssV, RttV, &env->fp_status);
+    PdV = f8BITSOF(cmp == float_relation_greater ||
+                   cmp == float_relation_equal);
+    arch_fpop_end(env);
+    return PdV;
+}
+
+int32_t HELPER(dfcmpuo)(CPUHexagonState *env, float64 RssV, float64 RttV)
+{
+    int32_t PdV;
+    arch_fpop_start(env);
+    PdV = f8BITSOF(float64_is_any_nan(RssV) ||
+                   float64_is_any_nan(RttV));
+    arch_fpop_end(env);
+    return PdV;
+}
+
+int32_t HELPER(dfclass)(CPUHexagonState *env, float64 RssV, int32_t uiV)
+{
+    int32_t PdV = 0;
+    arch_fpop_start(env);
+    if (fGETBIT(0, uiV) && float64_is_zero(RssV)) {
+        PdV = 0xff;
+    }
+    if (fGETBIT(1, uiV) && float64_is_normal(RssV)) {
+        PdV = 0xff;
+    }
+    if (fGETBIT(2, uiV) && float64_is_denormal(RssV)) {
+        PdV = 0xff;
+    }
+    if (fGETBIT(3, uiV) && float64_is_infinity(RssV)) {
+        PdV = 0xff;
+    }
+    if (fGETBIT(4, uiV) && float64_is_any_nan(RssV)) {
+        PdV = 0xff;
+    }
+    set_float_exception_flags(0, &env->fp_status);
+    arch_fpop_end(env);
+    return PdV;
+}
+
+float32 HELPER(sfmpy)(CPUHexagonState *env, float32 RsV, float32 RtV)
+{
+    float32 RdV;
+    arch_fpop_start(env);
+    RdV = internal_mpyf(RsV, RtV, &env->fp_status);
+    RdV = hex_check_sfnan(RdV);
+    arch_fpop_end(env);
+    return RdV;
+}
+
+float32 HELPER(sffma)(CPUHexagonState *env, float32 RxV,
+                      float32 RsV, float32 RtV)
+{
+    arch_fpop_start(env);
+    RxV = internal_fmafx(RsV, RtV, RxV, 0, &env->fp_status);
+    RxV = hex_check_sfnan(RxV);
+    arch_fpop_end(env);
+    return RxV;
+}
+
+static bool is_zero_prod(float32 a, float32 b)
+{
+    return ((float32_is_zero(a) && is_finite(b)) ||
+            (float32_is_zero(b) && is_finite(a)));
+}
+
+static float32 check_nan(float32 dst, float32 x, float_status *fp_status)
+{
+    float32 ret = dst;
+    if (float32_is_any_nan(x)) {
+        if (extract32(x, 22, 1) == 0) {
+            float_raise(float_flag_invalid, fp_status);
+        }
+        ret = make_float32(0xffffffff);    /* nan */
+    }
+    return ret;
+}
+
+float32 HELPER(sffma_sc)(CPUHexagonState *env, float32 RxV,
+                         float32 RsV, float32 RtV, float32 PuV)
+{
+    size4s_t tmp;
+    arch_fpop_start(env);
+    RxV = check_nan(RxV, RxV, &env->fp_status);
+    RxV = check_nan(RxV, RsV, &env->fp_status);
+    RxV = check_nan(RxV, RtV, &env->fp_status);
+    tmp = internal_fmafx(RsV, RtV, RxV, fSXTN(8, 64, PuV), &env->fp_status);
+    tmp = hex_check_sfnan(tmp);
+    if (!(float32_is_zero(RxV) && is_zero_prod(RsV, RtV))) {
+        RxV = tmp;
+    }
+    arch_fpop_end(env);
+    return RxV;
+}
+
+float32 HELPER(sffms)(CPUHexagonState *env, float32 RxV,
+                      float32 RsV, float32 RtV)
+{
+    float32 neg_RsV;
+    arch_fpop_start(env);
+    neg_RsV = float32_sub(float32_zero, RsV, &env->fp_status);
+    RxV = internal_fmafx(neg_RsV, RtV, RxV, 0, &env->fp_status);
+    RxV = hex_check_sfnan(RxV);
+    arch_fpop_end(env);
+    return RxV;
+}
+
+static inline bool is_inf_prod(int32_t a, int32_t b)
+{
+    return (float32_is_infinity(a) && float32_is_infinity(b)) ||
+           (float32_is_infinity(a) && is_finite(b) && !float32_is_zero(b)) ||
+           (float32_is_infinity(b) && is_finite(a) && !float32_is_zero(a));
+}
+
+float32 HELPER(sffma_lib)(CPUHexagonState *env, float32 RxV,
+                          float32 RsV, float32 RtV)
+{
+    int infinp;
+    int infminusinf;
+    float32 tmp;
+
+    arch_fpop_start(env);
+    set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
+    infminusinf = float32_is_infinity(RxV) &&
+                  is_inf_prod(RsV, RtV) &&
+                  (fGETBIT(31, RsV ^ RxV ^ RtV) != 0);
+    infinp = float32_is_infinity(RxV) ||
+             float32_is_infinity(RtV) ||
+             float32_is_infinity(RsV);
+    RxV = check_nan(RxV, RxV, &env->fp_status);
+    RxV = check_nan(RxV, RsV, &env->fp_status);
+    RxV = check_nan(RxV, RtV, &env->fp_status);
+    tmp = internal_fmafx(RsV, RtV, RxV, 0, &env->fp_status);
+    tmp = hex_check_sfnan(tmp);
+    if (!(float32_is_zero(RxV) && is_zero_prod(RsV, RtV))) {
+        RxV = tmp;
+    }
+    set_float_exception_flags(0, &env->fp_status);
+    if (float32_is_infinity(RxV) && !infinp) {
+        RxV = RxV - 1;
+    }
+    if (infminusinf) {
+        RxV = 0;
+    }
+    arch_fpop_end(env);
+    return RxV;
+}
+
+float32 HELPER(sffms_lib)(CPUHexagonState *env, float32 RxV,
+                          float32 RsV, float32 RtV)
+{
+    int infinp;
+    int infminusinf;
+    float32 tmp;
+
+    arch_fpop_start(env);
+    set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
+    infminusinf = float32_is_infinity(RxV) &&
+                  is_inf_prod(RsV, RtV) &&
+                  (fGETBIT(31, RsV ^ RxV ^ RtV) == 0);
+    infinp = float32_is_infinity(RxV) ||
+             float32_is_infinity(RtV) ||
+             float32_is_infinity(RsV);
+    RxV = check_nan(RxV, RxV, &env->fp_status);
+    RxV = check_nan(RxV, RsV, &env->fp_status);
+    RxV = check_nan(RxV, RtV, &env->fp_status);
+    float32 minus_RsV = float32_sub(float32_zero, RsV, &env->fp_status);
+    tmp = internal_fmafx(minus_RsV, RtV, RxV, 0, &env->fp_status);
+    tmp = hex_check_sfnan(tmp);
+    if (!(float32_is_zero(RxV) && is_zero_prod(RsV, RtV))) {
+        RxV = tmp;
+    }
+    set_float_exception_flags(0, &env->fp_status);
+    if (float32_is_infinity(RxV) && !infinp) {
+        RxV = RxV - 1;
+    }
+    if (infminusinf) {
+        RxV = 0;
+    }
+    arch_fpop_end(env);
+    return RxV;
+}
+
+float64 HELPER(dfmpyfix)(CPUHexagonState *env, float64 RssV, float64 RttV)
+{
+    int64_t RddV;
+    arch_fpop_start(env);
+    if (float64_is_denormal(RssV) &&
+        (float64_getexp(RttV) >= 512) &&
+        float64_is_normal(RttV)) {
+        RddV = float64_mul(RssV, make_float64(0x4330000000000000),
+                           &env->fp_status);
+        RddV = hex_check_dfnan(RddV);
+    } else if (float64_is_denormal(RttV) &&
+               (float64_getexp(RssV) >= 512) &&
+               float64_is_normal(RssV)) {
+        RddV = float64_mul(RssV, make_float64(0x3cb0000000000000),
+                           &env->fp_status);
+        RddV = hex_check_dfnan(RddV);
+    } else {
+        RddV = RssV;
+    }
+    arch_fpop_end(env);
+    return RddV;
+}
+
+float64 HELPER(dfmpyhh)(CPUHexagonState *env, float64 RxxV,
+                        float64 RssV, float64 RttV)
+{
+    arch_fpop_start(env);
+    RxxV = internal_mpyhh(RssV, RttV, RxxV, &env->fp_status);
+    RxxV = hex_check_dfnan(RxxV);
+    arch_fpop_end(env);
+    return RxxV;
+}
+
+static void cancel_slot(CPUHexagonState *env, uint32_t slot)
+{
+    HEX_DEBUG_LOG("Slot %d cancelled\n", slot);
+    env->slot_cancelled |= (1 << slot);
+}
+
+/* These macros can be referenced in the generated helper functions */
+#define warn(...) /* Nothing */
+#define fatal(...) g_assert_not_reached();
+
+#define BOGUS_HELPER(tag) \
+    printf("ERROR: bogus helper: " #tag "\n")
+
+#include "helper_funcs_generated.c.inc"
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B42484CD6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 04:23:09 +0100 (CET)
Received: from localhost ([::1]:59074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4wtI-0004J7-Tb
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 22:23:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfa-0006zc-2G; Tue, 04 Jan 2022 22:08:58 -0500
Received: from [2607:f8b0:4864:20::22b] (port=39567
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfW-0001wM-D6; Tue, 04 Jan 2022 22:08:56 -0500
Received: by mail-oi1-x22b.google.com with SMTP id x10so57481300oix.6;
 Tue, 04 Jan 2022 19:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TL15klt8IfeTjfwPJPVq3QisNCIMvT9AbgHCrh1TUOo=;
 b=nd0Q0k6BuVnirZsEUOQYV9eU60uuBvSC+QWJ5za9G7bqLCINN1w+4mqlDmfE+XrLOQ
 Q23V9RcqsEKp/q3rvbGH/Oje3a8drB7WRxxNBs7yziIEzzqPAFxH6FtIY5891Hnoa0UZ
 9r0P4u1YR4q0CBOBtiBGaEn+i3LbOHACSMQQcW2AJKshnG3avY7MrwOlaxeqyjiRDZx+
 gin97FCgn9GQCo0vpAL4LaONr4DjtuW3EZTtEBJtVqbyGpmwuwUbA2Bj0WYlGqHWIOva
 nufAQIFKJ1n6wCpa2h1Rdg+6evtZydWhumY/kxINSYO1oTLFOfi7FYjKdBO0dcY4g4yS
 vCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TL15klt8IfeTjfwPJPVq3QisNCIMvT9AbgHCrh1TUOo=;
 b=rP2rXEcQKNjUZUubOeMQYogrQ3yp8PcZKIoXQpf+1F82A48W4CYtx1Ze9vE0pitGd+
 t2ZUWPfjjBAM6diKLesDt+I7yx1qsYp1iyavWdzAx1LtGMn4t1X527kTHqO8vH15QJQs
 zjbYFLKPb24AoYXLJyovZaw6NXxYzq1IgIuyyA3BB/+xuZAOmBYEQM5TpjNRyh2HfsfI
 1NH8JZPI6kWimOIQzW47BOAcxfLB6E9daQ7Wg1HwL724JnACzp1SHClCydMFQBhfEiNu
 kKQ0f5zDJoaEEOmO2YFL9pYEbs08vhuogE41dVRLu2dsWK/+ZyIRxWw4vozv6uuHxK+2
 Xp1A==
X-Gm-Message-State: AOAM533ruRZys9QplB1DubFzwxaoY5THZBpnJemDq5i9/9P4MR8mFx0F
 oZQEm0VuM4F8DDzr3/YhVAg7E+TlRzIwpg==
X-Google-Smtp-Source: ABdhPJw02BTY2da8vbBZ4ny3KgQJReeDF5sBu0n7R4wg6K7o5YCi5/92zQqKqdgoGqGCHwovedT4wA==
X-Received: by 2002:a17:90a:bb91:: with SMTP id
 v17mr700169pjr.238.1641351699548; 
 Tue, 04 Jan 2022 19:01:39 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id nu14sm23011pjb.17.2022.01.04.19.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:01:39 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 1/7] target/riscv: Add initial support for native debug
Date: Wed,  5 Jan 2022 11:01:20 +0800
Message-Id: <20220105030126.778503-2-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030126.778503-1-bin.meng@windriver.com>
References: <20220105030126.778503-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This adds initial support for the native debug via the Trigger Module,
as defined in the RISC-V Debug Specification [1].

Only "Address / Data Match" trigger (type 2) is implemented as of now,
which is mainly used for hardware breakpoint and watchpoint. The number
of type 2 triggers implemented is 2, which is the number that we can
find in the SiFive U54/U74 cores.

[1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- drop riscv_trigger_init(), which will be moved to patch #5

 target/riscv/cpu.h       |   5 +
 target/riscv/debug.h     | 108 +++++++++++++
 target/riscv/debug.c     | 339 +++++++++++++++++++++++++++++++++++++++
 target/riscv/meson.build |   1 +
 4 files changed, 453 insertions(+)
 create mode 100644 target/riscv/debug.h
 create mode 100644 target/riscv/debug.c

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index dc10f27093..0f3b3a4219 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -98,6 +98,7 @@ typedef struct CPURISCVState CPURISCVState;
 
 #if !defined(CONFIG_USER_ONLY)
 #include "pmp.h"
+#include "debug.h"
 #endif
 
 #define RV_VLEN_MAX 1024
@@ -234,6 +235,10 @@ struct CPURISCVState {
     pmp_table_t pmp_state;
     target_ulong mseccfg;
 
+    /* trigger module */
+    target_ulong trigger_cur;
+    trigger_type2_t trigger_type2[TRIGGER_TYPE2_NUM];
+
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
new file mode 100644
index 0000000000..0a3fda6c72
--- /dev/null
+++ b/target/riscv/debug.h
@@ -0,0 +1,108 @@
+/*
+ * QEMU RISC-V Native Debug Support
+ *
+ * Copyright (c) 2022 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef RISCV_DEBUG_H
+#define RISCV_DEBUG_H
+
+/* trigger indexes implemented */
+enum {
+    TRIGGER_TYPE2_IDX_0 = 0,
+    TRIGGER_TYPE2_IDX_1,
+    TRIGGER_TYPE2_NUM,
+    TRIGGER_NUM = TRIGGER_TYPE2_NUM
+};
+
+/* register index of tdata CSRs */
+enum {
+    TDATA1 = 0,
+    TDATA2,
+    TDATA3,
+    TDATA_NUM
+};
+
+typedef enum {
+    TRIGGER_TYPE_NO_EXIST = 0,      /* trigger does not exist */
+    TRIGGER_TYPE_AD_MATCH = 2,      /* address/data match trigger */
+    TRIGGER_TYPE_INST_CNT = 3,      /* instruction count trigger */
+    TRIGGER_TYPE_INT = 4,           /* interrupt trigger */
+    TRIGGER_TYPE_EXCP = 5,          /* exception trigger */
+    TRIGGER_TYPE_AD_MATCH6 = 6,     /* new address/data match trigger */
+    TRIGGER_TYPE_EXT_SRC = 7,       /* external source trigger */
+    TRIGGER_TYPE_UNAVAIL = 15       /* trigger exists, but unavailable */
+} trigger_type_t;
+
+typedef struct {
+    target_ulong mcontrol;
+    target_ulong maddress;
+    struct CPUBreakpoint *bp;
+    struct CPUWatchpoint *wp;
+} trigger_type2_t;
+
+/* tdata field masks */
+
+#define RV32_TYPE(t)    ((uint32_t)(t) << 28)
+#define RV32_TYPE_MASK  (0xf << 28)
+#define RV32_DMODE      BIT(27)
+#define RV64_TYPE(t)    ((uint64_t)(t) << 60)
+#define RV64_TYPE_MASK  (0xfULL << 60)
+#define RV64_DMODE      BIT_ULL(59)
+
+/* mcontrol field masks */
+
+#define TYPE2_LOAD      BIT(0)
+#define TYPE2_STORE     BIT(1)
+#define TYPE2_EXEC      BIT(2)
+#define TYPE2_U         BIT(3)
+#define TYPE2_S         BIT(4)
+#define TYPE2_M         BIT(6)
+#define TYPE2_MATCH     (0xf << 7)
+#define TYPE2_CHAIN     BIT(11)
+#define TYPE2_ACTION    (0xf << 12)
+#define TYPE2_SIZELO    (0x3 << 16)
+#define TYPE2_TIMING    BIT(18)
+#define TYPE2_SELECT    BIT(19)
+#define TYPE2_HIT       BIT(20)
+#define TYPE2_SIZEHI    (0x3 << 21) /* RV64 only */
+
+/* access size */
+enum {
+    SIZE_ANY = 0,
+    SIZE_1B,
+    SIZE_2B,
+    SIZE_4B,
+    SIZE_6B,
+    SIZE_8B,
+    SIZE_10B,
+    SIZE_12B,
+    SIZE_14B,
+    SIZE_16B,
+    SIZE_NUM = 16
+};
+
+bool tdata_available(CPURISCVState *env, int tdata_index);
+
+target_ulong tselect_csr_read(CPURISCVState *env);
+void tselect_csr_write(CPURISCVState *env, target_ulong val);
+
+target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index);
+void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
+
+#endif /* RISCV_DEBUG_H */
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
new file mode 100644
index 0000000000..530e030007
--- /dev/null
+++ b/target/riscv/debug.c
@@ -0,0 +1,339 @@
+/*
+ * QEMU RISC-V Native Debug Support
+ *
+ * Copyright (c) 2022 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * This provides the native debug support via the Trigger Module, as defined
+ * in the RISC-V Debug Specification:
+ * https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "trace.h"
+#include "exec/exec-all.h"
+
+/*
+ * The following M-mode trigger CSRs are implemented:
+ *
+ * - tselect
+ * - tdata1
+ * - tdata2
+ * - tdata3
+ *
+ * We don't support writable 'type' field in the tdata1 register, so there is
+ * no need to implement the "tinfo" CSR.
+ *
+ * The following triggers are implemented:
+ *
+ * Index | Type |          tdata mapping | Description
+ * ------+------+------------------------+------------
+ *     0 |    2 |         tdata1, tdata2 | Address / Data Match
+ *     1 |    2 |         tdata1, tdata2 | Address / Data Match
+ */
+
+/* tdata availability of a trigger */
+typedef bool tdata_avail[TDATA_NUM];
+
+static tdata_avail tdata_mapping[TRIGGER_NUM] = {
+    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = { true, true, false },
+};
+
+/* only breakpoint size 1/2/4/8 supported */
+static int access_size[SIZE_NUM] = {
+    [SIZE_ANY] = 0,
+    [SIZE_1B]  = 1,
+    [SIZE_2B]  = 2,
+    [SIZE_4B]  = 4,
+    [SIZE_6B]  = -1,
+    [SIZE_8B]  = 8,
+    [6 ... 15] = -1,
+};
+
+static inline target_ulong trigger_type(CPURISCVState *env,
+                                        trigger_type_t type)
+{
+    target_ulong tdata1;
+
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
+        tdata1 = RV32_TYPE(type);
+        break;
+    case MXL_RV64:
+        tdata1 = RV64_TYPE(type);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return tdata1;
+}
+
+bool tdata_available(CPURISCVState *env, int tdata_index)
+{
+    if (unlikely(tdata_index >= TDATA_NUM)) {
+        return false;
+    }
+
+    if (unlikely(env->trigger_cur >= TRIGGER_NUM)) {
+        return false;
+    }
+
+    return tdata_mapping[env->trigger_cur][tdata_index];
+}
+
+target_ulong tselect_csr_read(CPURISCVState *env)
+{
+    return env->trigger_cur;
+}
+
+void tselect_csr_write(CPURISCVState *env, target_ulong val)
+{
+    /* all target_ulong bits of tselect are implemented */
+    env->trigger_cur = val;
+}
+
+static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,
+                                    trigger_type_t t)
+{
+    uint32_t type, dmode;
+    target_ulong tdata1;
+
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
+        type = extract32(val, 28, 4);
+        dmode = extract32(val, 27, 1);
+        tdata1 = RV32_TYPE(t);
+        break;
+    case MXL_RV64:
+        type = extract64(val, 60, 4);
+        dmode = extract64(val, 59, 1);
+        tdata1 = RV64_TYPE(t);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (type != t) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring type write to tdata1 register\n");
+    }
+    if (dmode != 0) {
+        qemu_log_mask(LOG_UNIMP, "debug mode is not supported\n");
+    }
+
+    return tdata1;
+}
+
+static inline void warn_always_zero_bit(target_ulong val, target_ulong mask,
+                                        const char *msg)
+{
+    if (val & mask) {
+        qemu_log_mask(LOG_UNIMP, "%s bit is always zero\n", msg);
+    }
+}
+
+static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong ctrl)
+{
+    uint32_t size, sizelo, sizehi = 0;
+
+    if (riscv_cpu_mxl(env) == MXL_RV64) {
+        sizehi = extract32(ctrl, 21, 2);
+    }
+    sizelo = extract32(ctrl, 16, 2);
+    size = (sizehi << 2) | sizelo;
+
+    return size;
+}
+
+static inline bool type2_breakpoint_enabled(target_ulong ctrl)
+{
+    bool mode = !!(ctrl & (TYPE2_U | TYPE2_S | TYPE2_M));
+    bool rwx = !!(ctrl & (TYPE2_LOAD | TYPE2_STORE | TYPE2_EXEC));
+
+    return mode && rwx;
+}
+
+static target_ulong type2_mcontrol_validate(CPURISCVState *env,
+                                            target_ulong ctrl)
+{
+    target_ulong val;
+    uint32_t size;
+
+    /* validate the generic part first */
+    val = tdata1_validate(env, ctrl, TRIGGER_TYPE_AD_MATCH);
+
+    /* validate unimplemented (always zero) bits */
+    warn_always_zero_bit(ctrl, TYPE2_MATCH, "match");
+    warn_always_zero_bit(ctrl, TYPE2_CHAIN, "chain");
+    warn_always_zero_bit(ctrl, TYPE2_ACTION, "action");
+    warn_always_zero_bit(ctrl, TYPE2_TIMING, "timing");
+    warn_always_zero_bit(ctrl, TYPE2_SELECT, "select");
+    warn_always_zero_bit(ctrl, TYPE2_HIT, "hit");
+
+    /* validate size encoding */
+    size = type2_breakpoint_size(env, ctrl);
+    if (access_size[size] == -1) {
+        qemu_log_mask(LOG_UNIMP, "access size %d is not supported, using SIZE_ANY\n",
+                      size);
+    } else {
+        val |= (ctrl & TYPE2_SIZELO);
+        if (riscv_cpu_mxl(env) == MXL_RV64) {
+            val |= (ctrl & TYPE2_SIZEHI);
+        }
+    }
+
+    /* keep the mode and attribute bits */
+    val |= (ctrl & (TYPE2_U | TYPE2_S | TYPE2_M |
+                    TYPE2_LOAD | TYPE2_STORE | TYPE2_EXEC));
+
+    return val;
+}
+
+static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
+{
+    target_ulong ctrl = env->trigger_type2[index].mcontrol;
+    target_ulong addr = env->trigger_type2[index].maddress;
+    bool enabled = type2_breakpoint_enabled(ctrl);
+    CPUState *cs = env_cpu(env);
+    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
+    uint32_t size;
+
+    if (!enabled) {
+        return;
+    }
+
+    if (ctrl & TYPE2_EXEC) {
+        cpu_breakpoint_insert(cs, addr, flags, &env->trigger_type2[index].bp);
+    }
+
+    if (ctrl & TYPE2_LOAD) {
+        flags |= BP_MEM_READ;
+    }
+    if (ctrl & TYPE2_STORE) {
+        flags |= BP_MEM_WRITE;
+    }
+
+    if (flags & BP_MEM_ACCESS) {
+        size = type2_breakpoint_size(env, ctrl);
+        if (size != 0) {
+            cpu_watchpoint_insert(cs, addr, size, flags,
+                                  &env->trigger_type2[index].wp);
+        } else {
+            cpu_watchpoint_insert(cs, addr, 8, flags,
+                                  &env->trigger_type2[index].wp);
+        }
+    }
+}
+
+static void type2_breakpoint_remove(CPURISCVState *env, target_ulong index)
+{
+    CPUState *cs = env_cpu(env);
+
+    if (env->trigger_type2[index].bp) {
+        cpu_breakpoint_remove_by_ref(cs, env->trigger_type2[index].bp);
+        env->trigger_type2[index].bp = NULL;
+    }
+
+    if (env->trigger_type2[index].wp) {
+        cpu_watchpoint_remove_by_ref(cs, env->trigger_type2[index].wp);
+        env->trigger_type2[index].wp = NULL;
+    }
+}
+
+static target_ulong type2_reg_read(CPURISCVState *env,
+                                   target_ulong trigger_index, int tdata_index)
+{
+    uint32_t index = trigger_index - TRIGGER_TYPE2_IDX_0;
+    target_ulong tdata;
+
+    switch (tdata_index) {
+    case TDATA1:
+        tdata = env->trigger_type2[index].mcontrol;
+        break;
+    case TDATA2:
+        tdata = env->trigger_type2[index].maddress;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return tdata;
+}
+
+static void type2_reg_write(CPURISCVState *env, target_ulong trigger_index,
+                            int tdata_index, target_ulong val)
+{
+    uint32_t index = trigger_index - TRIGGER_TYPE2_IDX_0;
+    target_ulong new_val;
+
+    switch (tdata_index) {
+    case TDATA1:
+        new_val = type2_mcontrol_validate(env, val);
+        if (new_val != env->trigger_type2[index].mcontrol) {
+            env->trigger_type2[index].mcontrol = new_val;
+            type2_breakpoint_remove(env, index);
+            type2_breakpoint_insert(env, index);
+        }
+        break;
+    case TDATA2:
+        if (val != env->trigger_type2[index].maddress) {
+            env->trigger_type2[index].maddress = val;
+            type2_breakpoint_remove(env, index);
+            type2_breakpoint_insert(env, index);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return;
+}
+
+typedef target_ulong (*tdata_read_func)(CPURISCVState *env,
+                                        target_ulong trigger_index,
+                                        int tdata_index);
+
+static tdata_read_func trigger_read_funcs[TRIGGER_NUM] = {
+    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = type2_reg_read,
+};
+
+typedef void (*tdata_write_func)(CPURISCVState *env,
+                                 target_ulong trigger_index,
+                                 int tdata_index,
+                                 target_ulong val);
+
+static tdata_write_func trigger_write_funcs[TRIGGER_NUM] = {
+    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = type2_reg_write,
+};
+
+target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
+{
+    tdata_read_func read_func = trigger_read_funcs[env->trigger_cur];
+
+    return read_func(env, env->trigger_cur, tdata_index);
+}
+
+void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
+{
+    tdata_write_func write_func = trigger_write_funcs[env->trigger_cur];
+
+    return write_func(env, env->trigger_cur, tdata_index, val);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index d5e0bc93ea..966d97237a 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -24,6 +24,7 @@ riscv_softmmu_ss = ss.source_set()
 riscv_softmmu_ss.add(files(
   'arch_dump.c',
   'pmp.c',
+  'debug.c',
   'monitor.c',
   'machine.c'
 ))
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A9161A19E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 20:55:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or2lH-0005QJ-O7; Fri, 04 Nov 2022 15:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1or1dt-000555-7q; Fri, 04 Nov 2022 14:42:14 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1or1dq-0004Zs-4j; Fri, 04 Nov 2022 14:42:12 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h9so8298187wrt.0;
 Fri, 04 Nov 2022 11:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AjsJL5qoA5OV+XX0D98GI7EZlFRFtrEEpt0JqhPlo0c=;
 b=ChMBwFf2NW1IiemtaEh7RvKOnvZVnd2MNxKrEvNPoYY/BqKfiC9H9b7wGqk0BAJY0V
 bE3WirdO2BiTdTmHY3dGC534WPoDM5aM+Th8on9TGXM2nruCak/fyJXw8MzmJDx39XVW
 EDOsA9LvmWR8gwKdgXH/0PPMrquXt37QSc3s6EQdBmMDxArdAKMVZcATwJvvzj9Re4SN
 7PWY16GmUVfmqIrmb3LhdlzvhN9q4bElk17DnM7iYZjoVeRAE2NrU4SdUnvyHQBV8x/K
 2BWWNBE17/r6ldCDKHr4oF6RyC5ad7F9KdC5gt+O8GuLXDpxVsiajFJhi3PCji0NEXfT
 Z25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AjsJL5qoA5OV+XX0D98GI7EZlFRFtrEEpt0JqhPlo0c=;
 b=NlYN9kRGz3H2ITbIiYxa/0xhvciaXG1xF5OnjPU4hhOlAQixgGOHxXQn2DD9lXG0H6
 dhYvRHR/Uf9SKO+rv7nXXGmmAt+O+DrvhuniP2Hyi2WYb0MZmFiL8ottH6rHv2IYP9mB
 nDX0WQyExwX1jTpWyytXLNVK3uFTz3k2UC1ZllD34oucKU1/kL1yQ/Gn4b+gzUHVRNj4
 PYHdSpUZQKHvhCbH5iVoA+F4rlr5tHarYItI4wE09Hj2EUa6x1KHNOSAtadQx7TlRixZ
 gOcunov7JWcr+wka3GUdO9tvup9ufhKVG9l7q+nPxPu4/SEn8Y5ciF30XVrKrunMdCk+
 xiaQ==
X-Gm-Message-State: ACrzQf1zWJBzdriaiciIYZPPeMNUu/xjFtTxwabSiJwCzaZ4w56tkuR8
 zVgKuNocAKLMXIkAijZelMjSM0tC2CQwDw==
X-Google-Smtp-Source: AMsMyM5FX5jBUsCB5NCKuONyoHPiorVNB9B+AsX0BYaRsFhyya6KOU99OaPTJuh2I6anQagB5mTpEA==
X-Received: by 2002:a05:6000:1372:b0:236:bf8e:a78c with SMTP id
 q18-20020a056000137200b00236bf8ea78cmr20769957wrz.197.1667587327526; 
 Fri, 04 Nov 2022 11:42:07 -0700 (PDT)
Received: from localhost.localdomain (216.87.95.79.rev.sfr.net. [79.95.87.216])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a05600000cb00b00236e9755c02sm22217wrx.111.2022.11.04.11.42.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Nov 2022 11:42:07 -0700 (PDT)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: dirty@apple.com, r.bolshakov@yadro.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH 1/3] arm: move KVM breakpoints helpers
Date: Fri,  4 Nov 2022 19:40:59 +0100
Message-Id: <20221104184101.6923-2-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104184101.6923-1-fcagnin@quarkslab.com>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Nov 2022 15:53:47 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Francesco Cagnin <fcagnin@quarkslab.com>

These helpers will be also used for HVF. Aside from reformatting a
couple of comments for 'checkpatch.pl', this is just code motion.

Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
---
 target/arm/debug_helper.c | 241 +++++++++++++++++++++++++++++++++
 target/arm/internals.h    |  50 +++++++
 target/arm/kvm64.c        | 276 --------------------------------------
 3 files changed, 291 insertions(+), 276 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index c21739242c..2f29dd7e9b 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -12,6 +12,7 @@
 #include "cpregs.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
+#include "exec/gdbstub.h"
 
 
 /* Return the Exception Level targeted by debug exceptions. */
@@ -1134,3 +1135,243 @@ vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
 }
 
 #endif
+
+/* Maximum and current break/watch point counts */
+int max_hw_bps, max_hw_wps;
+GArray *hw_breakpoints, *hw_watchpoints;
+
+/**
+ * insert_hw_breakpoint()
+ * @addr: address of breakpoint
+ *
+ * See ARM ARM D2.9.1 for details but here we are only going to create
+ * simple un-linked breakpoints (i.e. we don't chain breakpoints
+ * together to match address and context or vmid). The hardware is
+ * capable of fancier matching but that will require exposing that
+ * fanciness to GDB's interface
+ *
+ * DBGBCR<n>_EL1, Debug Breakpoint Control Registers
+ *
+ *  31  24 23  20 19   16 15 14  13  12   9 8   5 4    3 2   1  0
+ * +------+------+-------+-----+----+------+-----+------+-----+---+
+ * | RES0 |  BT  |  LBN  | SSC | HMC| RES0 | BAS | RES0 | PMC | E |
+ * +------+------+-------+-----+----+------+-----+------+-----+---+
+ *
+ * BT: Breakpoint type (0 = unlinked address match)
+ * LBN: Linked BP number (0 = unused)
+ * SSC/HMC/PMC: Security, Higher and Priv access control (Table D-12)
+ * BAS: Byte Address Select (RES1 for AArch64)
+ * E: Enable bit
+ *
+ * DBGBVR<n>_EL1, Debug Breakpoint Value Registers
+ *
+ *  63  53 52       49 48       2  1 0
+ * +------+-----------+----------+-----+
+ * | RESS | VA[52:49] | VA[48:2] | 0 0 |
+ * +------+-----------+----------+-----+
+ *
+ * Depending on the addressing mode bits the top bits of the register
+ * are a sign extension of the highest applicable VA bit. Some
+ * versions of GDB don't do it correctly so we ensure they are correct
+ * here so future PC comparisons will work properly.
+ */
+
+int insert_hw_breakpoint(target_ulong addr)
+{
+    HWBreakpoint brk = {
+        .bcr = 0x1,                             /* BCR E=1, enable */
+        .bvr = sextract64(addr, 0, 53)
+    };
+
+    if (cur_hw_bps >= max_hw_bps) {
+        return -ENOBUFS;
+    }
+
+    brk.bcr = deposit32(brk.bcr, 1, 2, 0x3);   /* PMC = 11 */
+    brk.bcr = deposit32(brk.bcr, 5, 4, 0xf);   /* BAS = RES1 */
+
+    g_array_append_val(hw_breakpoints, brk);
+
+    return 0;
+}
+
+/**
+ * delete_hw_breakpoint()
+ * @pc: address of breakpoint
+ *
+ * Delete a breakpoint and shuffle any above down
+ */
+
+int delete_hw_breakpoint(target_ulong pc)
+{
+    int i;
+    for (i = 0; i < hw_breakpoints->len; i++) {
+        HWBreakpoint *brk = get_hw_bp(i);
+        if (brk->bvr == pc) {
+            g_array_remove_index(hw_breakpoints, i);
+            return 0;
+        }
+    }
+    return -ENOENT;
+}
+
+/**
+ * insert_hw_watchpoint()
+ * @addr: address of watch point
+ * @len: size of area
+ * @type: type of watch point
+ *
+ * See ARM ARM D2.10. As with the breakpoints we can do some advanced
+ * stuff if we want to. The watch points can be linked with the break
+ * points above to make them context aware. However for simplicity
+ * currently we only deal with simple read/write watch points.
+ *
+ * D7.3.11 DBGWCR<n>_EL1, Debug Watchpoint Control Registers
+ *
+ *  31  29 28   24 23  21  20  19 16 15 14  13   12  5 4   3 2   1  0
+ * +------+-------+------+----+-----+-----+-----+-----+-----+-----+---+
+ * | RES0 |  MASK | RES0 | WT | LBN | SSC | HMC | BAS | LSC | PAC | E |
+ * +------+-------+------+----+-----+-----+-----+-----+-----+-----+---+
+ *
+ * MASK: num bits addr mask (0=none,01/10=res,11=3 bits (8 bytes))
+ * WT: 0 - unlinked, 1 - linked (not currently used)
+ * LBN: Linked BP number (not currently used)
+ * SSC/HMC/PAC: Security, Higher and Priv access control (Table D2-11)
+ * BAS: Byte Address Select
+ * LSC: Load/Store control (01: load, 10: store, 11: both)
+ * E: Enable
+ *
+ * The bottom 2 bits of the value register are masked. Therefore to
+ * break on any sizes smaller than an unaligned word you need to set
+ * MASK=0, BAS=bit per byte in question. For larger regions (^2) you
+ * need to ensure you mask the address as required and set BAS=0xff
+ */
+
+int insert_hw_watchpoint(target_ulong addr,
+                                target_ulong len, int type)
+{
+    HWWatchpoint wp = {
+        .wcr = R_DBGWCR_E_MASK, /* E=1, enable */
+        .wvr = addr & (~0x7ULL),
+        .details = { .vaddr = addr, .len = len }
+    };
+
+    if (cur_hw_wps >= max_hw_wps) {
+        return -ENOBUFS;
+    }
+
+    /*
+     * HMC=0 SSC=0 PAC=3 will hit EL0 or EL1, any security state,
+     * valid whether EL3 is implemented or not
+     */
+    wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, PAC, 3);
+
+    switch (type) {
+    case GDB_WATCHPOINT_READ:
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 1);
+        wp.details.flags = BP_MEM_READ;
+        break;
+    case GDB_WATCHPOINT_WRITE:
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 2);
+        wp.details.flags = BP_MEM_WRITE;
+        break;
+    case GDB_WATCHPOINT_ACCESS:
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 3);
+        wp.details.flags = BP_MEM_ACCESS;
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+    if (len <= 8) {
+        /* we align the address and set the bits in BAS */
+        int off = addr & 0x7;
+        int bas = (1 << len) - 1;
+
+        wp.wcr = deposit32(wp.wcr, 5 + off, 8 - off, bas);
+    } else {
+        /* For ranges above 8 bytes we need to be a power of 2 */
+        if (is_power_of_2(len)) {
+            int bits = ctz64(len);
+
+            wp.wvr &= ~((1 << bits) - 1);
+            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, MASK, bits);
+            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, BAS, 0xff);
+        } else {
+            return -ENOBUFS;
+        }
+    }
+
+    g_array_append_val(hw_watchpoints, wp);
+    return 0;
+}
+
+bool check_watchpoint_in_range(int i, target_ulong addr)
+{
+    HWWatchpoint *wp = get_hw_wp(i);
+    uint64_t addr_top, addr_bottom = wp->wvr;
+    int bas = extract32(wp->wcr, 5, 8);
+    int mask = extract32(wp->wcr, 24, 4);
+
+    if (mask) {
+        addr_top = addr_bottom + (1 << mask);
+    } else {
+        /*
+         * BAS must be contiguous but can offset against the base
+         * address in DBGWVR
+         */
+        addr_bottom = addr_bottom + ctz32(bas);
+        addr_top = addr_bottom + clo32(bas);
+    }
+
+    if (addr >= addr_bottom && addr <= addr_top) {
+        return true;
+    }
+
+    return false;
+}
+
+/**
+ * delete_hw_watchpoint()
+ * @addr: address of breakpoint
+ *
+ * Delete a breakpoint and shuffle any above down
+ */
+
+int delete_hw_watchpoint(target_ulong addr,
+                                target_ulong len, int type)
+{
+    int i;
+    for (i = 0; i < cur_hw_wps; i++) {
+        if (check_watchpoint_in_range(i, addr)) {
+            g_array_remove_index(hw_watchpoints, i);
+            return 0;
+        }
+    }
+    return -ENOENT;
+}
+
+bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
+{
+    int i;
+
+    for (i = 0; i < cur_hw_bps; i++) {
+        HWBreakpoint *bp = get_hw_bp(i);
+        if (bp->bvr == pc) {
+            return true;
+        }
+    }
+    return false;
+}
+
+CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
+{
+    int i;
+
+    for (i = 0; i < cur_hw_wps; i++) {
+        if (check_watchpoint_in_range(i, addr)) {
+            return &get_hw_wp(i)->details;
+        }
+    }
+    return NULL;
+}
diff --git a/target/arm/internals.h b/target/arm/internals.h
index d9121d9ff8..54382e7d76 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1369,4 +1369,54 @@ static inline uint64_t arm_mdcr_el2_eff(CPUARMState *env)
     ((1 << (1 - 1)) | (1 << (2 - 1)) |                  \
      (1 << (4 - 1)) | (1 << (8 - 1)) | (1 << (16 - 1)))
 
+/*
+ * Although the ARM implementation of hardware assisted debugging
+ * allows for different breakpoints per-core, the current GDB
+ * interface treats them as a global pool of registers (which seems to
+ * be the case for x86, ppc and s390). As a result we store one copy
+ * of registers which is used for all active cores.
+ *
+ * Write access is serialised by virtue of the GDB protocol which
+ * updates things. Read access (i.e. when the values are copied to the
+ * vCPU) is also gated by GDB's run control.
+ *
+ * This is not unreasonable as most of the time debugging kernels you
+ * never know which core will eventually execute your function.
+ */
+
+typedef struct {
+    uint64_t bcr;
+    uint64_t bvr;
+} HWBreakpoint;
+
+/*
+ * The watchpoint registers can cover more area than the requested
+ * watchpoint so we need to store the additional information
+ * somewhere. We also need to supply a CPUWatchpoint to the GDB stub
+ * when the watchpoint is hit.
+ */
+typedef struct {
+    uint64_t wcr;
+    uint64_t wvr;
+    CPUWatchpoint details;
+} HWWatchpoint;
+
+/* Maximum and current break/watch point counts */
+extern int max_hw_bps, max_hw_wps;
+extern GArray *hw_breakpoints, *hw_watchpoints;
+
+#define cur_hw_wps      (hw_watchpoints->len)
+#define cur_hw_bps      (hw_breakpoints->len)
+#define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
+#define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
+
+bool find_hw_breakpoint(CPUState *cpu, target_ulong pc);
+int insert_hw_breakpoint(target_ulong pc);
+int delete_hw_breakpoint(target_ulong pc);
+
+bool check_watchpoint_in_range(int i, target_ulong addr);
+CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr);
+int insert_hw_watchpoint(target_ulong addr, target_ulong len, int type);
+int delete_hw_watchpoint(target_ulong addr, target_ulong len, int type);
+
 #endif
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12..fb7bb65947 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -34,46 +34,6 @@
 
 static bool have_guest_debug;
 
-/*
- * Although the ARM implementation of hardware assisted debugging
- * allows for different breakpoints per-core, the current GDB
- * interface treats them as a global pool of registers (which seems to
- * be the case for x86, ppc and s390). As a result we store one copy
- * of registers which is used for all active cores.
- *
- * Write access is serialised by virtue of the GDB protocol which
- * updates things. Read access (i.e. when the values are copied to the
- * vCPU) is also gated by GDB's run control.
- *
- * This is not unreasonable as most of the time debugging kernels you
- * never know which core will eventually execute your function.
- */
-
-typedef struct {
-    uint64_t bcr;
-    uint64_t bvr;
-} HWBreakpoint;
-
-/* The watchpoint registers can cover more area than the requested
- * watchpoint so we need to store the additional information
- * somewhere. We also need to supply a CPUWatchpoint to the GDB stub
- * when the watchpoint is hit.
- */
-typedef struct {
-    uint64_t wcr;
-    uint64_t wvr;
-    CPUWatchpoint details;
-} HWWatchpoint;
-
-/* Maximum and current break/watch point counts */
-int max_hw_bps, max_hw_wps;
-GArray *hw_breakpoints, *hw_watchpoints;
-
-#define cur_hw_wps      (hw_watchpoints->len)
-#define cur_hw_bps      (hw_breakpoints->len)
-#define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
-#define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
-
 /**
  * kvm_arm_init_debug() - check for guest debug capabilities
  * @cs: CPUState
@@ -97,217 +57,6 @@ static void kvm_arm_init_debug(CPUState *cs)
     return;
 }
 
-/**
- * insert_hw_breakpoint()
- * @addr: address of breakpoint
- *
- * See ARM ARM D2.9.1 for details but here we are only going to create
- * simple un-linked breakpoints (i.e. we don't chain breakpoints
- * together to match address and context or vmid). The hardware is
- * capable of fancier matching but that will require exposing that
- * fanciness to GDB's interface
- *
- * DBGBCR<n>_EL1, Debug Breakpoint Control Registers
- *
- *  31  24 23  20 19   16 15 14  13  12   9 8   5 4    3 2   1  0
- * +------+------+-------+-----+----+------+-----+------+-----+---+
- * | RES0 |  BT  |  LBN  | SSC | HMC| RES0 | BAS | RES0 | PMC | E |
- * +------+------+-------+-----+----+------+-----+------+-----+---+
- *
- * BT: Breakpoint type (0 = unlinked address match)
- * LBN: Linked BP number (0 = unused)
- * SSC/HMC/PMC: Security, Higher and Priv access control (Table D-12)
- * BAS: Byte Address Select (RES1 for AArch64)
- * E: Enable bit
- *
- * DBGBVR<n>_EL1, Debug Breakpoint Value Registers
- *
- *  63  53 52       49 48       2  1 0
- * +------+-----------+----------+-----+
- * | RESS | VA[52:49] | VA[48:2] | 0 0 |
- * +------+-----------+----------+-----+
- *
- * Depending on the addressing mode bits the top bits of the register
- * are a sign extension of the highest applicable VA bit. Some
- * versions of GDB don't do it correctly so we ensure they are correct
- * here so future PC comparisons will work properly.
- */
-
-static int insert_hw_breakpoint(target_ulong addr)
-{
-    HWBreakpoint brk = {
-        .bcr = 0x1,                             /* BCR E=1, enable */
-        .bvr = sextract64(addr, 0, 53)
-    };
-
-    if (cur_hw_bps >= max_hw_bps) {
-        return -ENOBUFS;
-    }
-
-    brk.bcr = deposit32(brk.bcr, 1, 2, 0x3);   /* PMC = 11 */
-    brk.bcr = deposit32(brk.bcr, 5, 4, 0xf);   /* BAS = RES1 */
-
-    g_array_append_val(hw_breakpoints, brk);
-
-    return 0;
-}
-
-/**
- * delete_hw_breakpoint()
- * @pc: address of breakpoint
- *
- * Delete a breakpoint and shuffle any above down
- */
-
-static int delete_hw_breakpoint(target_ulong pc)
-{
-    int i;
-    for (i = 0; i < hw_breakpoints->len; i++) {
-        HWBreakpoint *brk = get_hw_bp(i);
-        if (brk->bvr == pc) {
-            g_array_remove_index(hw_breakpoints, i);
-            return 0;
-        }
-    }
-    return -ENOENT;
-}
-
-/**
- * insert_hw_watchpoint()
- * @addr: address of watch point
- * @len: size of area
- * @type: type of watch point
- *
- * See ARM ARM D2.10. As with the breakpoints we can do some advanced
- * stuff if we want to. The watch points can be linked with the break
- * points above to make them context aware. However for simplicity
- * currently we only deal with simple read/write watch points.
- *
- * D7.3.11 DBGWCR<n>_EL1, Debug Watchpoint Control Registers
- *
- *  31  29 28   24 23  21  20  19 16 15 14  13   12  5 4   3 2   1  0
- * +------+-------+------+----+-----+-----+-----+-----+-----+-----+---+
- * | RES0 |  MASK | RES0 | WT | LBN | SSC | HMC | BAS | LSC | PAC | E |
- * +------+-------+------+----+-----+-----+-----+-----+-----+-----+---+
- *
- * MASK: num bits addr mask (0=none,01/10=res,11=3 bits (8 bytes))
- * WT: 0 - unlinked, 1 - linked (not currently used)
- * LBN: Linked BP number (not currently used)
- * SSC/HMC/PAC: Security, Higher and Priv access control (Table D2-11)
- * BAS: Byte Address Select
- * LSC: Load/Store control (01: load, 10: store, 11: both)
- * E: Enable
- *
- * The bottom 2 bits of the value register are masked. Therefore to
- * break on any sizes smaller than an unaligned word you need to set
- * MASK=0, BAS=bit per byte in question. For larger regions (^2) you
- * need to ensure you mask the address as required and set BAS=0xff
- */
-
-static int insert_hw_watchpoint(target_ulong addr,
-                                target_ulong len, int type)
-{
-    HWWatchpoint wp = {
-        .wcr = R_DBGWCR_E_MASK, /* E=1, enable */
-        .wvr = addr & (~0x7ULL),
-        .details = { .vaddr = addr, .len = len }
-    };
-
-    if (cur_hw_wps >= max_hw_wps) {
-        return -ENOBUFS;
-    }
-
-    /*
-     * HMC=0 SSC=0 PAC=3 will hit EL0 or EL1, any security state,
-     * valid whether EL3 is implemented or not
-     */
-    wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, PAC, 3);
-
-    switch (type) {
-    case GDB_WATCHPOINT_READ:
-        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 1);
-        wp.details.flags = BP_MEM_READ;
-        break;
-    case GDB_WATCHPOINT_WRITE:
-        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 2);
-        wp.details.flags = BP_MEM_WRITE;
-        break;
-    case GDB_WATCHPOINT_ACCESS:
-        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 3);
-        wp.details.flags = BP_MEM_ACCESS;
-        break;
-    default:
-        g_assert_not_reached();
-        break;
-    }
-    if (len <= 8) {
-        /* we align the address and set the bits in BAS */
-        int off = addr & 0x7;
-        int bas = (1 << len) - 1;
-
-        wp.wcr = deposit32(wp.wcr, 5 + off, 8 - off, bas);
-    } else {
-        /* For ranges above 8 bytes we need to be a power of 2 */
-        if (is_power_of_2(len)) {
-            int bits = ctz64(len);
-
-            wp.wvr &= ~((1 << bits) - 1);
-            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, MASK, bits);
-            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, BAS, 0xff);
-        } else {
-            return -ENOBUFS;
-        }
-    }
-
-    g_array_append_val(hw_watchpoints, wp);
-    return 0;
-}
-
-
-static bool check_watchpoint_in_range(int i, target_ulong addr)
-{
-    HWWatchpoint *wp = get_hw_wp(i);
-    uint64_t addr_top, addr_bottom = wp->wvr;
-    int bas = extract32(wp->wcr, 5, 8);
-    int mask = extract32(wp->wcr, 24, 4);
-
-    if (mask) {
-        addr_top = addr_bottom + (1 << mask);
-    } else {
-        /* BAS must be contiguous but can offset against the base
-         * address in DBGWVR */
-        addr_bottom = addr_bottom + ctz32(bas);
-        addr_top = addr_bottom + clo32(bas);
-    }
-
-    if (addr >= addr_bottom && addr <= addr_top) {
-        return true;
-    }
-
-    return false;
-}
-
-/**
- * delete_hw_watchpoint()
- * @addr: address of breakpoint
- *
- * Delete a breakpoint and shuffle any above down
- */
-
-static int delete_hw_watchpoint(target_ulong addr,
-                                target_ulong len, int type)
-{
-    int i;
-    for (i = 0; i < cur_hw_wps; i++) {
-        if (check_watchpoint_in_range(i, addr)) {
-            g_array_remove_index(hw_watchpoints, i);
-            return 0;
-        }
-    }
-    return -ENOENT;
-}
-
-
 int kvm_arch_insert_hw_breakpoint(target_ulong addr,
                                   target_ulong len, int type)
 {
@@ -372,31 +121,6 @@ bool kvm_arm_hw_debug_active(CPUState *cs)
     return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
 }
 
-static bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
-{
-    int i;
-
-    for (i = 0; i < cur_hw_bps; i++) {
-        HWBreakpoint *bp = get_hw_bp(i);
-        if (bp->bvr == pc) {
-            return true;
-        }
-    }
-    return false;
-}
-
-static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
-{
-    int i;
-
-    for (i = 0; i < cur_hw_wps; i++) {
-        if (check_watchpoint_in_range(i, addr)) {
-            return &get_hw_wp(i)->details;
-        }
-    }
-    return NULL;
-}
-
 static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
                                     const char *name)
 {
-- 
2.38.1



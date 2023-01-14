Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F6D66AC82
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 17:15:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGjAK-0008C0-1d; Sat, 14 Jan 2023 11:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pGjAI-0008Bc-NI; Sat, 14 Jan 2023 11:13:54 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pGjAF-0005zG-U9; Sat, 14 Jan 2023 11:13:54 -0500
Received: by mail-wr1-x429.google.com with SMTP id r9so864979wrw.4;
 Sat, 14 Jan 2023 08:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CNvD4W7gDzrm+GYmfk2E2CKCrUpAtRNGhMEJjb9L08I=;
 b=PW3AmaW+1DqSZZ9+zIf85KU5OJwEexzoR2Ba7uteCjwu4A7cmwdmFpeHaUnV04kTKs
 adYarFxllWUe2SRgzd22ZNnFPYAB0fInsm+RDl1wyXjOb2Za4PFKA9t0Nz2SCwRoDTUd
 Z8+nuF8mOYttGy3E921vMqhIxHB5OiJQV5bDANhfhh5YI3tB+DRs/GCc+7tLlXF459cA
 jLtnVp9oPAfqj9OrfvUn9XoTl14yJT8IWNMrmV/D08be5d1pgxlwwANEa7d0MOrFC185
 3a33+k5tNa37g7jeiO8VW+gNX9kTDY6nZqgLZwRiOY42lF+8NfOX64FlCHkP0tyqNu8M
 fVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CNvD4W7gDzrm+GYmfk2E2CKCrUpAtRNGhMEJjb9L08I=;
 b=aaPySY4KYuA5QwX//3JNSY7jGi5zb68MQqDEo5XPKPG47X1JndnD1ds8EU0zgul9nj
 xpCjJ2V+Srd+rfmQfX1zVMiwpOynRJ6oy96LFOFmLHZVYK5MOfv0OwhARIso0lrzwo2Q
 l8swP8Xj3JiQXSen1M2R3EpUOdH3D165/A7UZM4Riok9z51fIcqLzQQnibzUh02WUMo8
 dOrohNKFUwadO0rW99U7EK39oZez0T+WZaG9OfKZfLhwQT51TLiDKiw15/qYiNqrtsfv
 oyTkSumxsQJKXUvUVxVk6l9FASG7zysZbJ5Ujd/0b2jivPpRMnqDVHf5EeeI7rgZ1TF6
 Xz1Q==
X-Gm-Message-State: AFqh2krlwbysGRfDOfmac0VKzqD2DLM/MyOEVFdbyJeROKZgbJGJiYmE
 hwDCMBlaOZ05pCWIA9rCF/URtjjHabpW2Q==
X-Google-Smtp-Source: AMrXdXvrXG3vnD4HACRuSiod7YzHTZhKgfPwC7vUfmOp9valBYEGnK4vg2zczGPd8fyYsz1sVa7HoA==
X-Received: by 2002:adf:ea12:0:b0:2bd:c097:848b with SMTP id
 q18-20020adfea12000000b002bdc097848bmr11073222wrm.16.1673712830028; 
 Sat, 14 Jan 2023 08:13:50 -0800 (PST)
Received: from omega.lan (194.46.205.77.rev.sfr.net. [77.205.46.194])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d6152000000b002425be3c9e2sm21330040wrt.60.2023.01.14.08.13.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 14 Jan 2023 08:13:49 -0800 (PST)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, dirty@apple.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v3 1/3] arm: move KVM breakpoints helpers
Date: Sat, 14 Jan 2023 17:13:00 +0100
Message-Id: <20230114161302.94595-2-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114161302.94595-1-fcagnin@quarkslab.com>
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Francesco Cagnin <fcagnin@quarkslab.com>

These helpers will be also used for HVF. Aside from reformatting a
couple of comments for 'checkpatch.pl' and updating meson to compile
'hyp_gdbstub.c', this is just code motion.

Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
---
 target/arm/hyp_gdbstub.c | 242 ++++++++++++++++++++++++++++++++++
 target/arm/internals.h   |  50 +++++++
 target/arm/kvm64.c       | 276 ---------------------------------------
 target/arm/meson.build   |   3 +-
 4 files changed, 294 insertions(+), 277 deletions(-)
 create mode 100644 target/arm/hyp_gdbstub.c

diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
new file mode 100644
index 0000000000..22b2b7de7b
--- /dev/null
+++ b/target/arm/hyp_gdbstub.c
@@ -0,0 +1,242 @@
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/gdbstub.h"
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
+int insert_hw_watchpoint(target_ulong addr, target_ulong len, int type)
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
+int delete_hw_watchpoint(target_ulong addr, target_ulong len, int type)
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
index d9555309df..6b69d8c774 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1377,4 +1377,54 @@ static inline uint64_t arm_mdcr_el2_eff(CPUARMState *env)
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
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 87e911b27f..63f5d30dd8 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -40,7 +40,8 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
-- 
2.39.0



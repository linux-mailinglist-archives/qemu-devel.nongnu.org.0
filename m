Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E616E7F4D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:13:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAQD-0002yD-SY; Wed, 19 Apr 2023 12:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppAQB-0002y5-Ve
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:12:39 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppAQ9-0003r1-TV
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:12:39 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso96672465e9.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681920755; x=1684512755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=95gIRfQheSzev9hTdNusJJwuJeNjLs5oUsBvw6dLQVw=;
 b=kRJWnhfr41HjaeD1uOe9NU5jICDWbap61+PaoPL8g3nHmjnvo2A6QO8qJOyp3vd+A9
 BdBDwcr96h9WVW//Rn4lDclE56K6z5PCZkTxeedAZlXc0I2peqL2G9epYr9TBIT9Z/aG
 Vy+8LH3HQL/HfF8z+jKVlbwstOIgBVtqC6t4m3ZBdRMau8y9ALiU8jicJdVn+tYOGurC
 YNFglpwiJM5NIg6l8mqWPx8zaXUl8vGsgnHohYh2rktuR3IaC68vO/AwU8TbEO54TjwQ
 g2k0hoZrtF7ttBfqeB6k83EV9DtexrNSGLpWqi0gCtVNfG04Tl7qxukZg2hYAI7DMt77
 68Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681920755; x=1684512755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=95gIRfQheSzev9hTdNusJJwuJeNjLs5oUsBvw6dLQVw=;
 b=fcwXl9EfYX+jqsZAI+6CBirqUKiI9uyvNa2W7/+9FY9Ps9oVEU+jBD2QrJld7OSv4s
 5/r8sGCCPXOJTXTw8Nt9fNeojsk1D5YfhhFjdVzhmVkGoS3EwhOaXeOY7zdpVML2UCGs
 InHQZ8uJ5MN3hJqijUU+OY4D3J9q5Nws4tj6BiitrD0etr9gY2cBr98t9hmwwzu0LspX
 8vsMaHjlW/sW3nquXfIHDLjAWfmHtnabhLSU/DNZBE3bVNEFVrZI2Lnr0MZ0XOHh7l1I
 XrBbWPNg7PlluW+0eHI8tLqpRZeE8w/hPlAoriwJatUaCB8+TdFxVsvXYxm6Lw2OXKTd
 ZtRQ==
X-Gm-Message-State: AAQBX9dfql3muuKhoxKn3Kf8qVEaf7poy1RTDx1a5kyHfew46wc9GloE
 c9TFF/HZThP2xfM+k3etjUYQxw==
X-Google-Smtp-Source: AKy350YhG39XR3J8GH5x3ThPQdvZ8r+ZRKFqPKt1HsChjLifjuQV9HFN4mMyfMjcfqD+Zr5Cyvf4Aw==
X-Received: by 2002:adf:e8cc:0:b0:2f9:805f:eecb with SMTP id
 k12-20020adfe8cc000000b002f9805feecbmr2459657wrn.3.1681920755557; 
 Wed, 19 Apr 2023 09:12:35 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a5d538e000000b002f81b4227cesm12250011wrv.19.2023.04.19.09.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 09:12:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC0FA1FFB7;
 Wed, 19 Apr 2023 17:12:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Robert Henry <robhenry@microsoft.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] plugins: force slow path when plugins instrument memory
 ops
Date: Wed, 19 Apr 2023 17:12:26 +0100
Message-Id: <20230419161226.1012884-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The lack of SVE memory instrumentation has been an omission in plugin
handling since it was introduced. Fortunately we can utilise the
probe_* functions to force all all memory access to follow the slow
path. We do this by checking the access type and presence of plugin
memory callbacks and if set return the TLB_MMIO flag.

We have to jump through a few hoops in user mode to re-use the flag
but it was the desired effect:

 ./qemu-system-aarch64 -display none -serial mon:stdio \
   -M virt -cpu max -semihosting-config enable=on \
   -kernel ./tests/tcg/aarch64-softmmu/memory-sve \
   -plugin ./contrib/plugins/libexeclog.so,ifilter=st1w,afilter=0x40001808 -d plugin

gives (disas doesn't currently understand st1w):

  0, 0x40001808, 0xe54342a0, ".byte 0xa0, 0x42, 0x43, 0xe5", store, 0x40213010, RAM, store, 0x40213014, RAM, store, 0x40213018, RAM

And for user-mode:

  ./qemu-aarch64 \
    -plugin contrib/plugins/libexeclog.so,afilter=0x4007c0 \
    -d plugin \
    ./tests/tcg/aarch64-linux-user/sha512-sve

gives:

  1..10
  ok 1 - do_test(&tests[i])
  0, 0x4007c0, 0xa4004b80, ".byte 0x80, 0x4b, 0x00, 0xa4", load, 0x5500800370, load, 0x5500800371, load, 0x5500800372, load, 0x5500800373, load, 0x5500800374, load, 0x5500800375, load, 0x5500800376, load, 0x5500800377, load, 0x5500800378, load, 0x5500800379, load, 0x550080037a, load, 0x550080037b, load, 0x550080037c, load, 0x550080037d, load, 0x550080037e, load, 0x550080037f, load, 0x5500800380, load, 0x5500800381, load, 0x5500800382, load, 0x5500800383, load, 0x5500800384, load, 0x5500800385, load, 0x5500800386, lo
  ad, 0x5500800387, load, 0x5500800388, load, 0x5500800389, load, 0x550080038a, load, 0x550080038b, load, 0x550080038c, load, 0x550080038d, load, 0x550080038e, load, 0x550080038f, load, 0x5500800390, load, 0x5500800391, load, 0x5500800392, load, 0x5500800393, load, 0x5500800394, load, 0x5500800395, load, 0x5500800396, load, 0x5500800397, load, 0x5500800398, load, 0x5500800399, load, 0x550080039a, load, 0x550080039b, load, 0x550080039c, load, 0x550080039d, load, 0x550080039e, load, 0x550080039f, load, 0x55008003a0, load, 0x55008003a1, load, 0x55008003a2, load, 0x55008003a3, load, 0x55008003a4, load, 0x55008003a5, load, 0x55008003a6, load, 0x55008003a7, load, 0x55008003a8, load, 0x55008003a9, load, 0x55008003aa, load, 0x55008003ab, load, 0x55008003ac, load, 0x55008003ad, load, 0x55008003ae, load, 0x55008003af

(4007c0 is the ld1b in the sha512-sve)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Robert Henry <robhenry@microsoft.com>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 include/exec/cpu-all.h            |  2 +-
 include/hw/core/cpu.h             | 17 +++++++++++++++++
 accel/tcg/cputlb.c                |  6 +++++-
 accel/tcg/user-exec.c             |  6 +++++-
 target/arm/tcg/sve_helper.c       |  4 ----
 tests/tcg/aarch64/Makefile.target |  8 ++++++++
 6 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 090922e4a8..1064cb05b5 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -366,7 +366,7 @@ CPUArchState *cpu_copy(CPUArchState *env);
  * be signaled by probe_access_flags().
  */
 #define TLB_INVALID_MASK    (1 << (TARGET_PAGE_BITS_MIN - 1))
-#define TLB_MMIO            0
+#define TLB_MMIO            (1 << (TARGET_PAGE_BITS_MIN - 2))
 #define TLB_WATCHPOINT      0
 
 #else
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 397fd3ac68..2901b33013 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -979,6 +979,23 @@ void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
 void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
 #endif
 
+/**
+ * cpu_plugin_mem_cbs_enabled() - are plugin memory callbacks enabled?
+ * @cs: CPUState pointer
+ *
+ * The memory callbacks are installed if a plugin has instrumented an
+ * instruction for memory. This can be useful to know if you want to
+ * force a slow path for a series of memory accesses.
+ */
+static inline bool cpu_plugin_mem_cbs_enabled(const CPUState *cpu)
+{
+#ifdef CONFIG_PLUGIN
+    return !!cpu->plugin_mem_cbs;
+#else
+    return false;
+#endif
+}
+
 /**
  * cpu_get_address_space:
  * @cpu: CPU to get address space from
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e984a98dc4..0260587806 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1530,6 +1530,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     target_ulong tlb_addr, page_addr;
     size_t elt_ofs;
     int flags;
+    bool not_fetch = true;
 
     switch (access_type) {
     case MMU_DATA_LOAD:
@@ -1540,6 +1541,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
         break;
     case MMU_INST_FETCH:
         elt_ofs = offsetof(CPUTLBEntry, addr_code);
+        not_fetch = false;
         break;
     default:
         g_assert_not_reached();
@@ -1578,7 +1580,9 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     *pfull = &env_tlb(env)->d[mmu_idx].fulltlb[index];
 
     /* Fold all "mmio-like" bits into TLB_MMIO.  This is not RAM.  */
-    if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))) {
+    if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))
+        ||
+        (not_fetch && cpu_plugin_mem_cbs_enabled(env_cpu(env)))) {
         *phost = NULL;
         return TLB_MMIO;
     }
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a7e0c3e2f4..148d525810 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -745,6 +745,10 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     if (guest_addr_valid_untagged(addr)) {
         int page_flags = page_get_flags(addr);
         if (page_flags & acc_flag) {
+            if ((acc_flag == PAGE_READ || acc_flag == PAGE_WRITE)
+                && cpu_plugin_mem_cbs_enabled(env_cpu(env))) {
+                return TLB_MMIO;
+            }
             return 0; /* success */
         }
         maperr = !(page_flags & PAGE_VALID);
@@ -767,7 +771,7 @@ int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
 
     g_assert(-(addr | TARGET_PAGE_MASK) >= size);
     flags = probe_access_internal(env, addr, size, access_type, nonfault, ra);
-    *phost = flags ? NULL : g2h(env_cpu(env), addr);
+    *phost = (flags & TLB_INVALID_MASK) ? NULL : g2h(env_cpu(env), addr);
     return flags;
 }
 
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index ccf5e5beca..eb4ebee1e4 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -5688,9 +5688,6 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
 
     flags = info.page[0].flags | info.page[1].flags;
     if (unlikely(flags != 0)) {
-#ifdef CONFIG_USER_ONLY
-        g_assert_not_reached();
-#else
         /*
          * At least one page includes MMIO.
          * Any bus operation can fail with cpu_transaction_failed,
@@ -5727,7 +5724,6 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
             memcpy(&env->vfp.zregs[(rd + i) & 31], &scratch[i], reg_max);
         }
         return;
-#endif
     }
 
     /* The entire operation is in RAM, on valid pages. */
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 9e91a20b0d..35d3d2348e 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -81,6 +81,14 @@ sha512-vector: sha512.c
 
 TESTS += sha512-vector
 
+ifneq ($(CROSS_CC_HAS_SVE),)
+sha512-sve: CFLAGS=-O3 -march=armv8.1-a+sve
+sha512-sve: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+TESTS += sha512-sve
+endif
+
 ifeq ($(HOST_GDB_SUPPORTS_ARCH),y)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
-- 
2.39.2



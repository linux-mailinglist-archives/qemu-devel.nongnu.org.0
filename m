Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5709526044F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 20:12:03 +0200 (CEST)
Received: from localhost ([::1]:40176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLcY-0004vG-Eg
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 14:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFLVx-0003qY-7X
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:05:13 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:52368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFLVv-0002Ny-08
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:05:12 -0400
Received: by mail-pj1-x1042.google.com with SMTP id o16so7033367pjr.2
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 11:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9SsoToSMEh6dKfrGI01LaB8qyEfZ2YCbynKlKreMREc=;
 b=vSMx1dUJ0uEscPO3eGU3SDlGaKU3kQieIJJo2vT2RJM2DY53H+nNLMUEx1zBI6iwqK
 bheunhV4zBXjMZTkUeE2EJ9GVnrHIzAHS86vQGsoHOEzZjx+kYrvTUg8dfCvYVPbKCux
 a/Yu68zRE8gL9KNIUNvwRx4uW4PVK2XXN30Axlero1F+J4oHFEsMfqqlNlzDup5HgB3W
 hn1N0g9B3ZwoWMhvimDqeGWwamcNQRfOfmEXlrw4JBNoa2mLg6VtbL6uoBvMCLolghH/
 4/rrERC/8/bvIXNNcaEuZRzfil7CF4G7isLbJXOQJmnFBuB83lSVLBH4cu38rxZ4uUUO
 wIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9SsoToSMEh6dKfrGI01LaB8qyEfZ2YCbynKlKreMREc=;
 b=oDXZDEC5nfsuGSQyewlKyIUzxUhylYg9JzJAsMzZpYeMqn8XIDBUqahAWK5OFSgH7L
 NEvRuolQYCnW0lOvagGlEMo7gohfUN8k+qlVZ6/r+p/vawdK49bPodH4XUBBDIye8WlF
 toT7it6kIholF8Wgis9OH9S3v6sSB2Hewnr0UZgmwwUweZVLWlSG2tQFEajfjGF1JnS9
 WIhGaqF1xo60pNqxbWJxd6LSpAHYoqbMUADisMAAiTkOYYRrtgR9vfKR3G4EqYKuw1DE
 QYQVHUUyFdm3dJHH0G7eWvmnZq5KkX4ZqfE0/92jPiLpO8LpEeJodc4rfOJ3+l67lLmK
 XKTA==
X-Gm-Message-State: AOAM5338X7DO3qXm98xFiyQRisPQmlRq8HfD7O+Q2M6Ri4zg7UYZzeU3
 P7VPJ27mTC3rJk9Vn0+C71uPY3MF0eqRUg==
X-Google-Smtp-Source: ABdhPJwmu9haz+vE+t7K6NYQQhbrjN7ttAQAg+q531Jg86T/3ZvRqy7lcYilLuVKC0cVDDlsf/S8uw==
X-Received: by 2002:a17:90b:b0b:: with SMTP id
 bf11mr396811pjb.227.1599501909163; 
 Mon, 07 Sep 2020 11:05:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v6sm11367768pfi.38.2020.09.07.11.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 11:05:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/19] target/microblaze: Move mmu parameters to
 MicroBlazeCPUConfig
Date: Mon,  7 Sep 2020 11:04:56 -0700
Message-Id: <20200907180459.29025-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907180459.29025-1-richard.henderson@linaro.org>
References: <20200907175102.28027-1-richard.henderson@linaro.org>
 <20200907180459.29025-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The final 4 fields in MicroBlazeMMU are configuration constants.
Move them into MicroBlazeCPUConfig where they belong.

Remove the leading "c_" from the member names, as that presumably
implied "config", and that should not be explicit in the location.

Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h    |  5 +++++
 target/microblaze/mmu.h    |  7 +------
 target/microblaze/cpu.c    |  9 +++++----
 target/microblaze/helper.c |  4 ++--
 target/microblaze/mmu.c    | 30 +++++++++++++++++-------------
 5 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index ef96f2fe02..b54f99da61 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -295,6 +295,8 @@ struct CPUMBState {
 typedef struct {
     char *version;
 
+    uint64_t addr_mask;
+
     uint32_t base_vectors;
     uint32_t pvr_user2;
     uint32_t pvr_regs[13];
@@ -304,6 +306,9 @@ typedef struct {
     uint8_t use_hw_mul;
     uint8_t pvr_user1;
     uint8_t pvr;
+    uint8_t mmu;
+    uint8_t mmu_tlb_access;
+    uint8_t mmu_zones;
 
     bool stackprot;
     bool use_barrel;
diff --git a/target/microblaze/mmu.h b/target/microblaze/mmu.h
index c1feb811b9..7d0fbb8341 100644
--- a/target/microblaze/mmu.h
+++ b/target/microblaze/mmu.h
@@ -70,11 +70,6 @@ typedef struct {
     uint8_t tids[TLB_ENTRIES];
     /* Control flops.  */
     uint32_t regs[3];
-
-    int c_mmu;
-    int c_mmu_tlb_access;
-    int c_mmu_zones;
-    uint64_t c_addr_mask; /* Mask to apply to physical addresses.  */
 } MicroBlazeMMU;
 
 typedef struct {
@@ -88,7 +83,7 @@ typedef struct {
     } err;
 } MicroBlazeMMULookup;
 
-unsigned int mmu_translate(MicroBlazeMMU *mmu, MicroBlazeMMULookup *lu,
+unsigned int mmu_translate(MicroBlazeCPU *cpu, MicroBlazeMMULookup *lu,
                            target_ulong vaddr, int rw, int mmu_idx);
 uint32_t mmu_read(CPUMBState *env, bool ea, uint32_t rn);
 void mmu_write(CPUMBState *env, bool ea, uint32_t rn, uint32_t v);
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index b9bb7f0cc7..fde646a7ad 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -135,10 +135,6 @@ static void mb_cpu_reset(DeviceState *dev)
 #else
     mb_cpu_write_msr(env, 0);
     mmu_init(&env->mmu);
-    env->mmu.c_mmu = 3;
-    env->mmu.c_mmu_tlb_access = 3;
-    env->mmu.c_mmu_zones = 16;
-    env->mmu.c_addr_mask = MAKE_64BIT_MASK(0, cpu->cfg.addr_size);
 #endif
 }
 
@@ -232,6 +228,11 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
     cpu->cfg.pvr_regs[11] = ((cpu->cfg.use_mmu ? PVR11_USE_MMU : 0) |
                              16 << 17);
 
+    cpu->cfg.mmu = 3;
+    cpu->cfg.mmu_tlb_access = 3;
+    cpu->cfg.mmu_zones = 16;
+    cpu->cfg.addr_mask = MAKE_64BIT_MASK(0, cpu->cfg.addr_size);
+
     mcc->parent_realize(dev, errp);
 }
 
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index c9f236c897..3d6ce1b31b 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -64,7 +64,7 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         return true;
     }
 
-    hit = mmu_translate(&env->mmu, &lu, address, access_type, mmu_idx);
+    hit = mmu_translate(cpu, &lu, address, access_type, mmu_idx);
     if (likely(hit)) {
         uint32_t vaddr = address & TARGET_PAGE_MASK;
         uint32_t paddr = lu.paddr + vaddr - lu.vaddr;
@@ -240,7 +240,7 @@ hwaddr mb_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     unsigned int hit;
 
     if (mmu_idx != MMU_NOMMU_IDX) {
-        hit = mmu_translate(&env->mmu, &lu, addr, 0, 0);
+        hit = mmu_translate(cpu, &lu, addr, 0, 0);
         if (hit) {
             vaddr = addr & TARGET_PAGE_MASK;
             paddr = lu.paddr + vaddr - lu.vaddr;
diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index 0546cfd0bc..1dbbb271c4 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -73,9 +73,10 @@ static void mmu_change_pid(CPUMBState *env, unsigned int newpid)
 }
 
 /* rw - 0 = read, 1 = write, 2 = fetch.  */
-unsigned int mmu_translate(MicroBlazeMMU *mmu, MicroBlazeMMULookup *lu,
+unsigned int mmu_translate(MicroBlazeCPU *cpu, MicroBlazeMMULookup *lu,
                            target_ulong vaddr, int rw, int mmu_idx)
 {
+    MicroBlazeMMU *mmu = &cpu->env.mmu;
     unsigned int i, hit = 0;
     unsigned int tlb_ex = 0, tlb_wr = 0, tlb_zsel;
     uint64_t tlb_tag, tlb_rpn, mask;
@@ -114,13 +115,13 @@ unsigned int mmu_translate(MicroBlazeMMU *mmu, MicroBlazeMMULookup *lu,
             t0 = mmu->regs[MMU_R_ZPR] >> (30 - (tlb_zsel * 2));
             t0 &= 0x3;
 
-            if (tlb_zsel > mmu->c_mmu_zones) {
+            if (tlb_zsel > cpu->cfg.mmu_zones) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "tlb zone select out of range! %d\n", tlb_zsel);
                 t0 = 1; /* Ignore.  */
             }
 
-            if (mmu->c_mmu == 1) {
+            if (cpu->cfg.mmu == 1) {
                 t0 = 1; /* Zones are disabled.  */
             }
 
@@ -157,7 +158,7 @@ unsigned int mmu_translate(MicroBlazeMMU *mmu, MicroBlazeMMULookup *lu,
             tlb_rpn = d & TLB_RPN_MASK;
 
             lu->vaddr = tlb_tag;
-            lu->paddr = tlb_rpn & mmu->c_addr_mask;
+            lu->paddr = tlb_rpn & cpu->cfg.addr_mask;
             lu->size = tlb_size;
             lu->err = ERR_HIT;
             lu->idx = i;
@@ -175,10 +176,11 @@ done:
 /* Writes/reads to the MMU's special regs end up here.  */
 uint32_t mmu_read(CPUMBState *env, bool ext, uint32_t rn)
 {
+    MicroBlazeCPU *cpu = env_archcpu(env);
     unsigned int i;
     uint32_t r = 0;
 
-    if (env->mmu.c_mmu < 2 || !env->mmu.c_mmu_tlb_access) {
+    if (cpu->cfg.mmu < 2 || !cpu->cfg.mmu_tlb_access) {
         qemu_log_mask(LOG_GUEST_ERROR, "MMU access on MMU-less system\n");
         return 0;
     }
@@ -191,7 +193,7 @@ uint32_t mmu_read(CPUMBState *env, bool ext, uint32_t rn)
         /* Reads to HI/LO trig reads from the mmu rams.  */
         case MMU_R_TLBLO:
         case MMU_R_TLBHI:
-            if (!(env->mmu.c_mmu_tlb_access & 1)) {
+            if (!(cpu->cfg.mmu_tlb_access & 1)) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "Invalid access to MMU reg %d\n", rn);
                 return 0;
@@ -204,7 +206,7 @@ uint32_t mmu_read(CPUMBState *env, bool ext, uint32_t rn)
             break;
         case MMU_R_PID:
         case MMU_R_ZPR:
-            if (!(env->mmu.c_mmu_tlb_access & 1)) {
+            if (!(cpu->cfg.mmu_tlb_access & 1)) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "Invalid access to MMU reg %d\n", rn);
                 return 0;
@@ -227,12 +229,14 @@ uint32_t mmu_read(CPUMBState *env, bool ext, uint32_t rn)
 
 void mmu_write(CPUMBState *env, bool ext, uint32_t rn, uint32_t v)
 {
+    MicroBlazeCPU *cpu = env_archcpu(env);
     uint64_t tmp64;
     unsigned int i;
+
     qemu_log_mask(CPU_LOG_MMU,
                   "%s rn=%d=%x old=%x\n", __func__, rn, v, env->mmu.regs[rn]);
 
-    if (env->mmu.c_mmu < 2 || !env->mmu.c_mmu_tlb_access) {
+    if (cpu->cfg.mmu < 2 || !cpu->cfg.mmu_tlb_access) {
         qemu_log_mask(LOG_GUEST_ERROR, "MMU access on MMU-less system\n");
         return;
     }
@@ -258,7 +262,7 @@ void mmu_write(CPUMBState *env, bool ext, uint32_t rn, uint32_t v)
             env->mmu.rams[rn & 1][i] = deposit64(tmp64, ext * 32, 32, v);
             break;
         case MMU_R_ZPR:
-            if (env->mmu.c_mmu_tlb_access <= 1) {
+            if (cpu->cfg.mmu_tlb_access <= 1) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "Invalid access to MMU reg %d\n", rn);
                 return;
@@ -272,7 +276,7 @@ void mmu_write(CPUMBState *env, bool ext, uint32_t rn, uint32_t v)
             env->mmu.regs[rn] = v;
             break;
         case MMU_R_PID:
-            if (env->mmu.c_mmu_tlb_access <= 1) {
+            if (cpu->cfg.mmu_tlb_access <= 1) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "Invalid access to MMU reg %d\n", rn);
                 return;
@@ -292,14 +296,14 @@ void mmu_write(CPUMBState *env, bool ext, uint32_t rn, uint32_t v)
             MicroBlazeMMULookup lu;
             int hit;
 
-            if (env->mmu.c_mmu_tlb_access <= 1) {
+            if (cpu->cfg.mmu_tlb_access <= 1) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "Invalid access to MMU reg %d\n", rn);
                 return;
             }
 
-            hit = mmu_translate(&env->mmu, &lu,
-                                v & TLB_EPN_MASK, 0, cpu_mmu_index(env, false));
+            hit = mmu_translate(cpu, &lu, v & TLB_EPN_MASK,
+                                0, cpu_mmu_index(env, false));
             if (hit) {
                 env->mmu.regs[MMU_R_TLBX] = lu.idx;
             } else {
-- 
2.25.1



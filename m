Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272826C2A88
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 07:38:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peVc5-0000Qw-HA; Tue, 21 Mar 2023 02:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1peVc2-0000Pm-Hb; Tue, 21 Mar 2023 02:36:50 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1peVbz-0001ST-UO; Tue, 21 Mar 2023 02:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679380607; x=1710916607;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T20dgz041mAKoOsM1UKi64go9mCORNyet3agOm7n79Y=;
 b=cJrcWj6YVrbYUHDQUJM8GTAMLEDQ1vk4TTxOlAL59EpB7zbkdF5h6Wru
 zytcL9SEvfjQaJ2XxRhf1lpeL2/6xo3MwkhPx1I9sqmcZnZ4aioCMYl5U
 IgkI2ayNBh+SlaWIOkTa/OIUNjUJJfyFqdvyboDmneIo86gHnCw3KuO2N
 3v0vT4FUhIZq5fj378yJloSN8JrPDIkbFDvAkj4if65zhggE/fGmBZWuF
 PN664JnwT7qD8SiaVo5hHAmaxM9kWfGmd1wfdS2SOxGcEBqa3SPzcX+Mg
 RarETdccdj487wsbUQy7OUigLMpxKO0EAp4Sx9V9G//HtMBpLCK7jg5/w A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="319255497"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="319255497"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 23:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="1010815244"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="1010815244"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2023 23:36:33 -0700
From: fei2.wu@intel.com
To: 
Cc: Fei Wu <fei2.wu@intel.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] target/riscv: reduce overhead of MSTATUS_SUM change
Date: Tue, 21 Mar 2023 14:37:46 +0800
Message-Id: <20230321063746.151107-1-fei2.wu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=fei2.wu@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

From: Fei Wu <fei2.wu@intel.com>

Kernel needs to access user mode memory e.g. during syscalls, the window
is usually opened up for a very limited time through MSTATUS.SUM, the
overhead is too much if tlb_flush() gets called for every SUM change.
This patch saves addresses accessed when SUM=1, and flushs only these
pages when SUM changes to 0. If the buffer is not large enough to save
all the pages during SUM=1, it will fall back to tlb_flush when
necessary.

The buffer size is set to 4 since in this MSTATUS.SUM open-up window,
most of the time kernel accesses 1 or 2 pages, it's very rare to see
more than 4 pages accessed.

It's not necessary to save/restore these new added status, as
tlb_flush() is always called after restore.

Result of 'pipe 10' from unixbench boosts from 223656 to 1327407. Many
other syscalls benefit a lot from this one too.

Signed-off-by: Fei Wu <fei2.wu@intel.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.h        |  4 ++++
 target/riscv/cpu_helper.c |  7 +++++++
 target/riscv/csr.c        | 14 +++++++++++++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..926dbce59f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -383,6 +383,10 @@ struct CPUArchState {
     uint64_t kvm_timer_compare;
     uint64_t kvm_timer_state;
     uint64_t kvm_timer_frequency;
+
+#define MAX_CACHED_SUM_U_ADDR_NUM 4
+    uint64_t sum_u_count;
+    uint64_t sum_u_addr[MAX_CACHED_SUM_U_ADDR_NUM];
 };
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..5ad0418eb6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1068,6 +1068,13 @@ restart:
                     (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
                 *prot |= PAGE_WRITE;
             }
+            if ((pte & PTE_U) && (mode & PRV_S) &&
+                    get_field(env->mstatus, MSTATUS_SUM)) {
+                if (env->sum_u_count < MAX_CACHED_SUM_U_ADDR_NUM) {
+                    env->sum_u_addr[env->sum_u_count] = addr;
+                }
+                ++env->sum_u_count;
+            }
             return TRANSLATE_SUCCESS;
         }
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ab566639e5..74b7638c8a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1246,9 +1246,21 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
-            MSTATUS_MPRV | MSTATUS_SUM)) {
+            MSTATUS_MPRV)) {
         tlb_flush(env_cpu(env));
+        env->sum_u_count = 0;
+    } else if ((mstatus & MSTATUS_SUM) && !(val & MSTATUS_SUM)) {
+        if (env->sum_u_count > MAX_CACHED_SUM_U_ADDR_NUM) {
+            tlb_flush(env_cpu(env));
+        } else {
+            for (int i = 0; i < env->sum_u_count; ++i) {
+                tlb_flush_page_by_mmuidx(env_cpu(env), env->sum_u_addr[i],
+                                         1 << PRV_S | 1 << PRV_M);
+            }
+        }
+        env->sum_u_count = 0;
     }
+
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
         MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
-- 
2.25.1



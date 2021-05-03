Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4131837230D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:37:58 +0200 (CEST)
Received: from localhost ([::1]:46410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhCP-0002i3-7R
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrj-00073w-PQ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:35 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrd-0000Fd-9o
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080189; x=1651616189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w0SdTRmqXHH5oPpVmfVR5fdaYUPfuZPdbmGEgavaDUo=;
 b=AjKe508wzTsTEedsRblm6CIJ1N8StnSelRNWlAF+hQVuX/YhBoQ0zK+q
 jCtyqPFUYK1mcsj3Umnb72aQF/VkTKRMhuSTw52J3Oqblv/o7fupb3x98
 uS1elbRk71akaE105HdPaiNtvKvTmNXARHOFQhzsY66D40ZExtnpIIE+p
 KrtR6iqGfLM3LgmRX+g9e0Qed3Qv1UPMdxddTOlJrqsSx+0+doljebUvW
 motBiEybkWY8w29pOjt5E3/pABa1ib/sb13UCnYxcEb2zFXIO1u3kfyOM
 FSJbJegJpPOxjfv8/LBSnP/dgA4cpcykXD1fTWVBxf8/Aq+j5VEOJZH1S g==;
IronPort-SDR: smq13QI3w8rS831y0/jKq3WLRnQCvsTNslDSYDUU438TC+1CJQxJ2p1NpoTO1tUjuZquDC104t
 cWkGecRFjrRvKC3Z2I7efSlYHSgI2zgilP4bdIMd7vtvXrFflzeKQqx4h/G2v7EvfJJlr5/Wqp
 YCA6DtrZoJTlLtApPRcml8NHRoPdmrOHG1/Zw5+6nqIFUarY7x7dwvZIAsvXGdYFvD00YALbnI
 LR86da2GSGeIJZb7ww6/uGYphErPNmjKQDfwM/UvuDeAiXntAfBJujRugttkeh3UCqW6cK/ywG
 RRA=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114703"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:41 +0800
IronPort-SDR: KqyvzXtGmVVShviaf2gKE98EhapxLCnS1PjbcK++Uz9tR/sQOSqPgb0TTwavrxnjeKuyG102Is
 U+uGMIYiBHy6ycbNTvaDbAoMno/dwMG9ZXKJrCvOYUYMDPj/7qSulWdWJp/Y/aWGvafkbjV0I3
 ULqiETjxm2It9eOrkuLe6+OyquhxCGXjlvP6kLpAg6XrDto457gqrMq6Zk+p4W34X+GeAIj/18
 5aL14UXCy7q3wHgzDFRryHLfF+7Gc/VKJ42RNKNuTC77kmZ5YUn/BD7rauJ+vlaeDSRupw1SoZ
 jGf2LpiIsrPMr0M7uCDC+s/Q
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:52 -0700
IronPort-SDR: 3ZejuRDz8n0i/lhI5b7o/sVY3pkBO7husBnviZ0QpOTPBtTSQltBVsQgRIC+whVAjN23Fr8Xg6
 dBqPsLto0e73tR6t/hQdtO57ccaAWZa8Wpyk2XZvRMO5wZ4DWkayg9EOOQEUWiSsNrD8HNQXh6
 BudOfKWbITXqX9A8z/K3t7+yy9amIFtxK9Kw8DZ3tU59nPLZq7fYQh1lVpjqxbXObKwoa25kld
 D9hK3m7atyIlLUMVbGg/1pFmCCxL1Zs9/be9jMahf4KUzJsLvBD2CxMLEMTYMGrHPYRZSVw82w
 0eU=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 37/42] target/riscv: Remove the hardcoded SATP_MODE macro
Date: Tue,  4 May 2021 08:13:22 +1000
Message-Id: <20210503221327.3068768-38-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 6b701769d6621f45ba1739334198e36a64fe04df.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h   | 11 -----------
 target/riscv/cpu_helper.c | 32 ++++++++++++++++++++++++--------
 target/riscv/csr.c        | 19 +++++++++++++++----
 target/riscv/monitor.c    | 22 +++++++++++++++++-----
 4 files changed, 56 insertions(+), 28 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 6e30b312f0..d98f3bc8bc 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -432,17 +432,6 @@
 #define SATP64_ASID         0x0FFFF00000000000ULL
 #define SATP64_PPN          0x00000FFFFFFFFFFFULL
 
-#if defined(TARGET_RISCV32)
-#define SATP_MODE           SATP32_MODE
-#define SATP_ASID           SATP32_ASID
-#define SATP_PPN            SATP32_PPN
-#endif
-#if defined(TARGET_RISCV64)
-#define SATP_MODE           SATP64_MODE
-#define SATP_ASID           SATP64_ASID
-#define SATP_PPN            SATP64_PPN
-#endif
-
 /* VM modes (mstatus.vm) privileged ISA 1.9.1 */
 #define VM_1_09_MBARE       0
 #define VM_1_09_MBB         1
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d9defbdd34..968cb8046f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -405,11 +405,21 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     if (first_stage == true) {
         if (use_background) {
-            base = (hwaddr)get_field(env->vsatp, SATP_PPN) << PGSHIFT;
-            vm = get_field(env->vsatp, SATP_MODE);
+            if (riscv_cpu_is_32bit(env)) {
+                base = (hwaddr)get_field(env->vsatp, SATP32_PPN) << PGSHIFT;
+                vm = get_field(env->vsatp, SATP32_MODE);
+            } else {
+                base = (hwaddr)get_field(env->vsatp, SATP64_PPN) << PGSHIFT;
+                vm = get_field(env->vsatp, SATP64_MODE);
+            }
         } else {
-            base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
-            vm = get_field(env->satp, SATP_MODE);
+            if (riscv_cpu_is_32bit(env)) {
+                base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
+                vm = get_field(env->satp, SATP32_MODE);
+            } else {
+                base = (hwaddr)get_field(env->satp, SATP64_PPN) << PGSHIFT;
+                vm = get_field(env->satp, SATP64_MODE);
+            }
         }
         widened = 0;
     } else {
@@ -624,14 +634,20 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
 {
     CPUState *cs = env_cpu(env);
     int page_fault_exceptions, vm;
+    uint64_t stap_mode;
+
+    if (riscv_cpu_is_32bit(env)) {
+        stap_mode = SATP32_MODE;
+    } else {
+        stap_mode = SATP64_MODE;
+    }
 
     if (first_stage) {
-        vm = get_field(env->satp, SATP_MODE);
-    } else if (riscv_cpu_is_32bit(env)) {
-        vm = get_field(env->hgatp, SATP32_MODE);
+        vm = get_field(env->satp, stap_mode);
     } else {
-        vm = get_field(env->hgatp, SATP64_MODE);
+        vm = get_field(env->hgatp, stap_mode);
     }
+
     page_fault_exceptions = vm != VM_1_10_MBARE && !pmp_violation;
 
     switch (access_type) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e955753441..fe5628fea6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -997,16 +997,27 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
 static RISCVException write_satp(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
+    int vm, mask, asid;
+
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         return RISCV_EXCP_NONE;
     }
-    if (validate_vm(env, get_field(val, SATP_MODE)) &&
-        ((val ^ env->satp) & (SATP_MODE | SATP_ASID | SATP_PPN)))
-    {
+
+    if (riscv_cpu_is_32bit(env)) {
+        vm = validate_vm(env, get_field(val, SATP32_MODE));
+        mask = (val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN);
+        asid = (val ^ env->satp) & SATP32_ASID;
+    } else {
+        vm = validate_vm(env, get_field(val, SATP64_MODE));
+        mask = (val ^ env->satp) & (SATP64_MODE | SATP64_ASID | SATP64_PPN);
+        asid = (val ^ env->satp) & SATP64_ASID;
+    }
+
+    if (vm && mask) {
         if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
-            if ((val ^ env->satp) & SATP_ASID) {
+            if (asid) {
                 tlb_flush(env_cpu(env));
             }
             env->satp = val;
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index e51188f919..f7e6ea72b3 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -150,9 +150,14 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
     target_ulong last_size;
     int last_attr;
 
-    base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
+    if (riscv_cpu_is_32bit(env)) {
+        base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
+        vm = get_field(env->satp, SATP32_MODE);
+    } else {
+        base = (hwaddr)get_field(env->satp, SATP64_PPN) << PGSHIFT;
+        vm = get_field(env->satp, SATP64_MODE);
+    }
 
-    vm = get_field(env->satp, SATP_MODE);
     switch (vm) {
     case VM_1_10_SV32:
         levels = 2;
@@ -215,9 +220,16 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    if (!(env->satp & SATP_MODE)) {
-        monitor_printf(mon, "No translation or protection\n");
-        return;
+    if (riscv_cpu_is_32bit(env)) {
+        if (!(env->satp & SATP32_MODE)) {
+            monitor_printf(mon, "No translation or protection\n");
+            return;
+        }
+    } else {
+        if (!(env->satp & SATP64_MODE)) {
+            monitor_printf(mon, "No translation or protection\n");
+            return;
+        }
     }
 
     mem_info_svxx(mon, env);
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B976737A4ED
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:49:56 +0200 (CEST)
Received: from localhost ([::1]:48856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPxb-0001BI-RD
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXo-0003QM-8X
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:16 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXk-0006X1-Jt
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728592; x=1652264592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w0SdTRmqXHH5oPpVmfVR5fdaYUPfuZPdbmGEgavaDUo=;
 b=hlqv1ratYd/L7UKcq4jKbRojfssXomvwx+uWvB7N/5UNc03q5doCFzXg
 fmaDUw3aIdhU9/AbZAUFcAgGqVxPC2sCMah8QHwJpvMVlj0NOWjqBz+JF
 9EZ82cyQx2bfrYeA9eHZtrCnechaA8r+Mn1MwpVy8VSRzMC1rI6g70MYC
 y428XuuNyBSXzH5XoAKUsOjL7U0u6dUaf63uZybAo2FWyPkQBwvEBabCE
 fk19R7+bGC5SoL1iowSk6330MRX3ZwG7ym4ohzUzpqYmS0ef99OeJL43u
 xXPRUM0qwFKPNwdPLwVhcOJgaxpCRDBrB6QjzmOVegeKnryOCgKX6pVIy Q==;
IronPort-SDR: JRXGJdWD41tgW2eOlsGfQBJARe7THvBXF7RY9PpdmTXGSJKH22UAYrQs9Bc/6MdaLhhs0ntYFj
 sx04orYDtQViw8bPEm2ZYnj7aeFXLGv/fOMi+s2a5krHwJ2hUnOlxei+Twv/PNOm4Axl4EaUxY
 D9C5hYKj4mpAM7QENVQSJyzEI6COsxavaYN+B35/VAJtTdErdv7q7QCu1z2nslGKQF42B2bO2D
 849A0NlLDNRKnIa04i93PGD0iKvg06yGzduBSY5QO5TGQavRdAZVBxrlJEw4AY03E/viJJy0cR
 +Ys=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735504"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:22:02 +0800
IronPort-SDR: /TlkvjNJhKel8cxtja0eJcOndf/iH0VC9xlOgF56eRttgnfdYrxDXwKuYvEeUsZDHz6DTbQw0S
 DmwHBsMtalqcVGqy14XCJqfq0MIhwoencoLDCQPbJ7CWZ35JprYUZ3XdrSnTYrYBNr575hyMdS
 AzzCyXBrAfR2vEgRV+EcW4gteRbNPw7UAvsBe7GMOehMez+n/8TX58wryt1oCpe1xnCJW3fkF/
 sNGo/IFy0GDAS423mKX0PMzxopKp1uqWVQku9ImsJooxi8Uztt5BOEbtc1n4NEosNbYTU6VjJW
 BSW0/6d+HgjV+8Ejr6xQNnSh
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:02:02 -0700
IronPort-SDR: PtVPIyVCCm0/CZGbwQ5xMzEw6I1GSayoeVCbUNa4Oiy+fu3sBhaBtd/245DoLg3HEAD3oR1xvR
 WJg6oYOjNzAH0cMixXPQo5iiKA90t4O0EESBqef3CcUu8kP7yHO3XQ9/pDzEThrn4mWuscHHQL
 3c+FMbxJ7ToJDBKIhUqoIW+UD4yQaglSvi0lEd/+bkZJk+2VafARhFEmxVicNre4/UYjZWbGjw
 ktLamphswUqdo5eQzc3KQCACn1+Xpjc69/Wv7iPg9C4dbtWjcO9mc/I87RXnLCEAWqnXqNpxqs
 LZM=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:22:01 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 37/42] target/riscv: Remove the hardcoded SATP_MODE macro
Date: Tue, 11 May 2021 20:19:46 +1000
Message-Id: <20210511101951.165287-38-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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



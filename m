Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EEE372327
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:44:51 +0200 (CEST)
Received: from localhost ([::1]:38504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhJ4-0002dF-J6
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrT-0006ur-SU
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:19 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrQ-0000ID-KQ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080176; x=1651616176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WQcSS1oSxULsvx3rcazGUleTjavqMGxioohI8At+Ha4=;
 b=eG1VzidPzcHk5bFBWj632XVIxDpRl9W9oh52DLkr7PU2GuxkDvE5NlTw
 BwswVcul7h4hSxdqBNSee+PVbtVUCywVsthaa/3UuwRqcdrTGZmwwORyW
 lpFv2v/hS+YqntWNIQ/qZ1pRGLUz2lM9Ak20QSs64LmWJlkPDQYOBD54s
 ejFvgJ2wKVV3mNQMKYdwhOreKG9+hWeyuGJzdYM+gaclg0mB5Tti8IlxM
 XjOiGeO/YFSf/u/+zjQSTqfw3usBymFAheERwCTYWt+itxCqs5ls0vh5F
 1VEGjQnz2b+ar4JR6HB3yta249AsbF2oh2bRuzjbRjcj1IkPappssFYgX Q==;
IronPort-SDR: Cu1Wj/5tIN42rwSTABUEXPGw1WpHPkhYV6wOOvhgUa6Jt3nCwmfjB8pnqp1C1ivVz3io8qnlyF
 F09IOd7PIlOQilJE/y3uPUj704pmEYdQ16NQedNcMWS8bJFNYeYVhvUm/yf4fzfjghPW5YNVVg
 Pa5P5LWc2VPz82u8Nm/vdp8hrGiU/9aUJIB4xm7GIemXp21mVfr3yPeS0PrO/KlWgNi6QxXpCl
 BURDIU22O5ALzBGD/b+5cdBHbWk3SL7Wu700Zyy6JUCHFZ3sSyYySVMLDZ4ysm8nwNeEQQqN5z
 gPg=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114700"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:35 +0800
IronPort-SDR: aDSLIclS8Ih3/uPOuza5LBYrf4d8C5S8bnVN6iXZ9UTdhAyudB1uvZwTItWW6NabxFsK5wvk96
 jcvbeyICMBAZ/HlXp4ap9TlqJX40wFlCsLHlIuOCLciiRtJEkkp54hLwovuPJYnN2XcHF97CAg
 tycgZe5XAuQRMS/Z/e87cl6pGwtBHJqFW7fcCysP1ywlWMYQVviUCdadtFnSC9OJSoWooeQ+hn
 nKdNePH/XCQIkVdkQUV1FCBKExNcUcAw8ge84w6HOt5l8reyx3CV6uHfJmB08GFLitCpI+yMPA
 Ol6I9ocDRGMZnlZR6iGTBXOj
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:46 -0700
IronPort-SDR: XPQmYLeFzUXZPTmDR+7Y4iOHTxQxcHyUnrnkjwYLqXXteAN1D6l4J5K7pwCXvOPTSkq0YbeMyc
 UgrwwiT5muo7gHRUUoqUrbcDk6ARx2oXx5NyPV3q/WQkMUmPaGKOw4rLvF3BPtoYN2TsCCcgBs
 pRz8VJVtmzTVWaS4TjTghfyIYBw6+/gsURY4R1opEsRYe8I428Aek8rKnvuEpsiEtDT6F/vdkM
 qKN4BACyH8Gy7o13tMIjEgXR4855hM/T/8hP7/X60mBTUcPO8pQlOez22meJ03SkyGSio4vEKo
 gY8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 35/42] target/riscv: Remove the hardcoded HGATP_MODE macro
Date: Tue,  4 May 2021 08:13:20 +1000
Message-Id: <20210503221327.3068768-36-alistair.francis@wdc.com>
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
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 665f624bfdc2e3ca64265004b07de7489c77a766.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h   | 11 -----------
 target/riscv/cpu_helper.c | 24 +++++++++++++++---------
 2 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 3a0e79e545..d738e2fdbd 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -195,17 +195,6 @@
 #define CSR_HTIMEDELTA      0x605
 #define CSR_HTIMEDELTAH     0x615
 
-#if defined(TARGET_RISCV32)
-#define HGATP_MODE           SATP32_MODE
-#define HGATP_VMID           SATP32_ASID
-#define HGATP_PPN            SATP32_PPN
-#endif
-#if defined(TARGET_RISCV64)
-#define HGATP_MODE           SATP64_MODE
-#define HGATP_VMID           SATP64_ASID
-#define HGATP_PPN            SATP64_PPN
-#endif
-
 /* Virtual CSRs */
 #define CSR_VSSTATUS        0x200
 #define CSR_VSIE            0x204
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1018c0036d..d9defbdd34 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -413,8 +413,13 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 0;
     } else {
-        base = (hwaddr)get_field(env->hgatp, HGATP_PPN) << PGSHIFT;
-        vm = get_field(env->hgatp, HGATP_MODE);
+        if (riscv_cpu_is_32bit(env)) {
+            base = (hwaddr)get_field(env->hgatp, SATP32_PPN) << PGSHIFT;
+            vm = get_field(env->hgatp, SATP32_MODE);
+        } else {
+            base = (hwaddr)get_field(env->hgatp, SATP64_PPN) << PGSHIFT;
+            vm = get_field(env->hgatp, SATP64_MODE);
+        }
         widened = 2;
     }
     /* status.SUM will be ignored if execute on background */
@@ -618,16 +623,17 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
                                 bool first_stage, bool two_stage)
 {
     CPUState *cs = env_cpu(env);
-    int page_fault_exceptions;
+    int page_fault_exceptions, vm;
+
     if (first_stage) {
-        page_fault_exceptions =
-            get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
-            !pmp_violation;
+        vm = get_field(env->satp, SATP_MODE);
+    } else if (riscv_cpu_is_32bit(env)) {
+        vm = get_field(env->hgatp, SATP32_MODE);
     } else {
-        page_fault_exceptions =
-            get_field(env->hgatp, HGATP_MODE) != VM_1_10_MBARE &&
-            !pmp_violation;
+        vm = get_field(env->hgatp, SATP64_MODE);
     }
+    page_fault_exceptions = vm != VM_1_10_MBARE && !pmp_violation;
+
     switch (access_type) {
     case MMU_INST_FETCH:
         if (riscv_cpu_virt_enabled(env) && !first_stage) {
-- 
2.31.1



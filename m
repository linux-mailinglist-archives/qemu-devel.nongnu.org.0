Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84FD37A4C5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:41:49 +0200 (CEST)
Received: from localhost ([::1]:54906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPpj-0002xx-6o
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPW5-0000xI-PN
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:31 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVx-0006X1-JG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728480; x=1652264480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFRLTCdAcyqhfcygvlqGQ7lXNGX9GsANpwxchwLWEg0=;
 b=GT+EwpeloRar5M1I171SsdVPrumbVSEvYA9EeEgl6EElhJp+FaH93oIC
 aIkKp2fPIiodNRqz66AFjJIvKK57TG4mwELN4mXM8kXHjpY41mpScqJBl
 TWRBD3nBzr5U2Tik59Q2ffJf/ACwJb2+2I2Rk1U4yDoG3jSgNx+TWSUaM
 7yb84nqmpqyZ0WQZITO7JZjFIo9X5VQFy/1BBjtfBMJWZfftYeh9yfK1P
 Hk1cs8OkJGflcHk8gF6RPo/q8EnQ/RkSGFSxSKvG6JoLEkRC5n34NYflC
 yTGh1rGzifEtDCyfyTbdlaOtkhTYISX/1avNjGnpgyDxeoj0WAdxmH5xZ A==;
IronPort-SDR: cMussp7QcIrC8TrHS7BQzB/ebDuGpYxMTK/hS8zQ22xmV1jjJXQeOHnmlTbVAbONxde8uiD2s8
 clOHHNSkk5rf4iy1Le76S99gP6gLjMjZ3HqGFB0sSQIcFX4rA4tL72Ieiny0z/44T17U4rlttV
 Z7RxMNMIgvYuZjScEtTu+hZSZ71A6LqBZSFYG+Ss7PGQk6A1l9qjVMdZNexAw2P5KyeFgZ5aXu
 j/ZJNjfapAzWU+odmqf7KSTOP/HqtpAhqxAHHDrsFTl2DGcHisv4lQM5cgceu2EhSyqUsmjJoX
 4aI=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735397"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:57 +0800
IronPort-SDR: DC780OlySbHWSXkTpjB23bcdJlxEyxm70klgabuVbXdk7yHr6ansnc3wPIzy5RR+AHHYZaHZ3Q
 uisFroCQWlfyCKnzvJWMctK1/CPh5QdiaQKqqAI7I3NRMQJIWL4P2I7zIUC85I9TWVB5nzBwkI
 GESekVQXx9Xmd0Fxt1ETNTjxf69LGmQMv6O8TUBqq4wt+mZsyQw1bEJJPo3KsixjZ/Aehi/c5R
 mZ0Wnox3AujJU0ft9CK7hC+JMKyggBP3IDRq2zGcktcR/VHCgunFvNS4VI3Rc+p1FcyxREoEJV
 zeixoWYM+Xx1v808MZUn+AIU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:56 -0700
IronPort-SDR: VT4lCKtvdGENIOMUB2rBl4Tbu5V000ZhYkryxaeowS3/vnmhFfGT9OntpeasnFsQ0InLywOF1d
 HupOaxM1Ge3m6I6wPswQ3Aod31nII1r6oFP8TldZLYxfXUTXNBC7/TSlvy29P1ug9w4J4kgsMM
 mhIPU4/2qJb82Tqw6a1/L/0uFoIADOcwwnCySymk0PY1fJnO2kpbiuQGo3ezvHeI2mq3rTgCgr
 ovRfp9O57QDKYlMJ5n/Pb5pbMM205AHSPAbgzIAkesh3t2DQlDdEUz7eQL5gOnEJXcn3Ch4z36
 sRM=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:55 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 17/42] riscv: don't look at SUM when accessing memory from a
 debugger context
Date: Tue, 11 May 2021 20:19:26 +1000
Message-Id: <20210511101951.165287-18-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Jade Fink <qemu@jade.fyi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jade Fink <qemu@jade.fyi>

Previously the qemu monitor and gdbstub looked at SUM and refused to
perform accesses to user memory if it is off, which was an impediment to
debugging.

Signed-off-by: Jade Fink <qemu@jade.fyi>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210406113109.1031033-1-qemu@jade.fyi
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 99cc388db9..659ca8a173 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -342,12 +342,14 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
  * @first_stage: Are we in first stage translation?
  *               Second stage is used for hypervisor guest translation
  * @two_stage: Are we going to perform two stage translation
+ * @is_debug: Is this access from a debugger or the monitor?
  */
 static int get_physical_address(CPURISCVState *env, hwaddr *physical,
                                 int *prot, target_ulong addr,
                                 target_ulong *fault_pte_addr,
                                 int access_type, int mmu_idx,
-                                bool first_stage, bool two_stage)
+                                bool first_stage, bool two_stage,
+                                bool is_debug)
 {
     /* NOTE: the env->pc value visible here will not be
      * correct, but the value visible to the exception handler
@@ -416,7 +418,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         widened = 2;
     }
     /* status.SUM will be ignored if execute on background */
-    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background;
+    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background || is_debug;
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
@@ -475,7 +477,8 @@ restart:
             /* Do the second stage translation on the base PTE address. */
             int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
                                                  base, NULL, MMU_DATA_LOAD,
-                                                 mmu_idx, false, true);
+                                                 mmu_idx, false, true,
+                                                 is_debug);
 
             if (vbase_ret != TRANSLATE_SUCCESS) {
                 if (fault_pte_addr) {
@@ -666,13 +669,13 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int mmu_idx = cpu_mmu_index(&cpu->env, false);
 
     if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
-                             true, riscv_cpu_virt_enabled(env))) {
+                             true, riscv_cpu_virt_enabled(env), true)) {
         return -1;
     }
 
     if (riscv_cpu_virt_enabled(env)) {
         if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL,
-                                 0, mmu_idx, false, true)) {
+                                 0, mmu_idx, false, true, true)) {
             return -1;
         }
     }
@@ -768,7 +771,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         /* Two stage lookup */
         ret = get_physical_address(env, &pa, &prot, address,
                                    &env->guest_phys_fault_addr, access_type,
-                                   mmu_idx, true, true);
+                                   mmu_idx, true, true, false);
 
         /*
          * A G-stage exception may be triggered during two state lookup.
@@ -790,7 +793,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             im_address = pa;
 
             ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
-                                       access_type, mmu_idx, false, true);
+                                       access_type, mmu_idx, false, true,
+                                       false);
 
             qemu_log_mask(CPU_LOG_MMU,
                     "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
@@ -825,7 +829,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
-                                   access_type, mmu_idx, true, false);
+                                   access_type, mmu_idx, true, false, false);
 
         qemu_log_mask(CPU_LOG_MMU,
                       "%s address=%" VADDR_PRIx " ret %d physical "
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E31D3596E9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 09:55:38 +0200 (CEST)
Received: from localhost ([::1]:48866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUlzN-0001dD-Mx
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 03:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUltj-0002RY-Bj; Fri, 09 Apr 2021 03:49:47 -0400
Received: from mail142-25.mail.alibaba.com ([198.11.142.25]:27055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUltb-0003jh-Gv; Fri, 09 Apr 2021 03:49:47 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07700841|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.15412-0.00058156-0.845299;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JxL3BOG_1617954563; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JxL3BOG_1617954563) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 09 Apr 2021 15:49:26 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 11/11] target/riscv: Update interrupt return in CLIC mode
Date: Fri,  9 Apr 2021 15:48:57 +0800
Message-Id: <20210409074857.166082-12-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.25; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-25.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a vectored interrupt is selected and serviced, the hardware will
automatically clear the corresponding pending bit in edge-triggered mode.
This may lead to a lower priviledge interrupt pending forever.

Therefore when interrupts return, pull a pending interrupt to service.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/op_helper.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1eddcb94de..42563b22ba 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -24,6 +24,10 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/intc/riscv_clic.h"
+#endif
+
 /* Exceptions processing helpers */
 void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
                                           uint32_t exception, uintptr_t pc)
@@ -130,6 +134,17 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
         mstatus = set_field(mstatus, MSTATUS_SPIE, 1);
         mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
         env->mstatus = mstatus;
+
+        if (riscv_clic_is_clic_mode(env)) {
+            CPUState *cs = env_cpu(env);
+            target_ulong spil = get_field(env->scause, SCAUSE_SPIL);
+            env->mintstatus = set_field(env->mintstatus, MINTSTATUS_SIL, spil);
+            env->scause = set_field(env->scause, SCAUSE_SPIE, 0);
+            env->scause = set_field(env->scause, SCAUSE_SPP, PRV_U);
+            qemu_mutex_lock_iothread();
+            riscv_clic_get_next_interrupt(env->clic, cs->cpu_index);
+            qemu_mutex_unlock_iothread();
+        }
     }
 
     riscv_cpu_set_mode(env, prev_priv);
@@ -172,6 +187,16 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
         riscv_cpu_set_virt_enabled(env, prev_virt);
     }
 
+    if (riscv_clic_is_clic_mode(env)) {
+        CPUState *cs = env_cpu(env);
+        target_ulong mpil = get_field(env->mcause, MCAUSE_MPIL);
+        env->mintstatus = set_field(env->mintstatus, MINTSTATUS_MIL, mpil);
+        env->mcause = set_field(env->mcause, MCAUSE_MPIE, 0);
+        env->mcause = set_field(env->mcause, MCAUSE_MPP, PRV_U);
+        qemu_mutex_lock_iothread();
+        riscv_clic_get_next_interrupt(env->clic, cs->cpu_index);
+        qemu_mutex_unlock_iothread();
+    }
     return retpc;
 }
 
-- 
2.25.1



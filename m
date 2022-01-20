Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BAB495315
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:23:40 +0100 (CET)
Received: from localhost ([::1]:50382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAb9v-0006RD-6f
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:23:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAWda-00038B-9l; Thu, 20 Jan 2022 07:34:00 -0500
Received: from out28-1.mail.aliyun.com ([115.124.28.1]:41464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAWch-000164-8P; Thu, 20 Jan 2022 07:33:18 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08822103|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.261329-0.000289173-0.738382;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.MfwiVX9_1642681961; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfwiVX9_1642681961)
 by smtp.aliyun-inc.com(10.147.40.26); Thu, 20 Jan 2022 20:32:41 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 21/23] target/riscv: Set default XLEN for hypervisor
Date: Thu, 20 Jan 2022 20:20:48 +0800
Message-Id: <20220120122050.41546-22-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
References: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.1; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-1.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: guoren@linux.alibaba.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When swap regs for hypervisor, the value of vsstatus or mstatus_hs
should have the right XLEN. Otherwise, it will propagate to mstatus.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a120d474df..1cb0436187 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -422,6 +422,16 @@ static void riscv_cpu_reset(DeviceState *dev)
          */
         env->mstatus = set_field(env->mstatus, MSTATUS64_SXL, env->misa_mxl);
         env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
+        if (riscv_has_ext(env, RVH)) {
+            env->vsstatus = set_field(env->vsstatus,
+                                      MSTATUS64_SXL, env->misa_mxl);
+            env->vsstatus = set_field(env->vsstatus,
+                                      MSTATUS64_UXL, env->misa_mxl);
+            env->mstatus_hs = set_field(env->mstatus_hs,
+                                        MSTATUS64_SXL, env->misa_mxl);
+            env->mstatus_hs = set_field(env->mstatus_hs,
+                                        MSTATUS64_UXL, env->misa_mxl);
+        }
     }
     env->mcause = 0;
     env->pc = env->resetvec;
-- 
2.25.1



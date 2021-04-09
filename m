Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A73596BF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 09:51:36 +0200 (CEST)
Received: from localhost ([::1]:34372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUlvT-000482-CQ
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 03:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUlte-0002H7-QM; Fri, 09 Apr 2021 03:49:42 -0400
Received: from mail142-34.mail.alibaba.com ([198.11.142.34]:65454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUlta-0003hh-UU; Fri, 09 Apr 2021 03:49:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08305461|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.082169-0.00153044-0.916301;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JxL3BOG_1617954563; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JxL3BOG_1617954563) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 09 Apr 2021 15:49:25 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 05/11] target/riscv: Update CSR xip in CLIC mode
Date: Fri,  9 Apr 2021 15:48:51 +0800
Message-Id: <20210409074857.166082-6-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.34; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-34.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

The xip CSR appears hardwired to zero in CLIC mode, replaced by separate
memory-mapped interrupt pendings (clicintip[i]). Writes to xip will be
ignored and will not trap (i.e., no access faults).

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/csr.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 74bc7a08aa..f6c84b9fe4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -735,6 +735,11 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
     target_ulong mask = write_mask & delegable_ints & ~env->miclaim;
     uint32_t old_mip;
 
+     /* The xip CSR appears hardwired to zero in CLIC mode. (Section 4.3) */
+    if (riscv_clic_is_clic_mode(env)) {
+        *ret_value = 0;
+        return 0;
+    }
     if (mask) {
         old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
     } else {
@@ -922,6 +927,11 @@ static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
     if (riscv_cpu_virt_enabled(env)) {
         ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
     } else {
+        /* The xip CSR appears hardwired to zero in CLIC mode. (Section 4.3) */
+        if (riscv_clic_is_clic_mode(env)) {
+            *ret_value = 0;
+            return 0;
+        }
         ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
                       write_mask & env->mideleg & sip_writable_mask);
     }
-- 
2.25.1



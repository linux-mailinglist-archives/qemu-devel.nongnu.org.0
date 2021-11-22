Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5AD458D42
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:20:30 +0100 (CET)
Received: from localhost ([::1]:48152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7N7-0000lf-Ct
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:20:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mp77Y-0003bY-RL; Mon, 22 Nov 2021 06:04:25 -0500
Received: from out28-121.mail.aliyun.com ([115.124.28.121]:50358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mp77W-0001nQ-4x; Mon, 22 Nov 2021 06:04:24 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09926116|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00727349-9.70553e-05-0.992629;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LxASyLq_1637579054; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LxASyLq_1637579054)
 by smtp.aliyun-inc.com(10.147.41.143);
 Mon, 22 Nov 2021 19:04:14 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 3/5] target/riscv: Discard return value for
 pmp_is_range_in_tlb
Date: Mon, 22 Nov 2021 19:02:28 +0800
Message-Id: <20211122110230.38783-4-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
References: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.121; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-121.mail.aliyun.com
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/pmp.c | 11 ++---------
 target/riscv/pmp.h |  2 +-
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index ca38087574..4850a9cc5d 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -620,16 +620,15 @@ static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
  * Check is there a PMP entry which range covers this page. If so,
  * try to find the minimum granularity for the TLB size.
  */
-bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
+void pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
                          target_ulong *tlb_size)
 {
     int i;
     target_ulong val;
     target_ulong tlb_ea = (tlb_sa + *tlb_size - 1);
-    target_ulong old_size = *tlb_size;
 
     if (pmp_get_num_rules(env) == 0) {
-        return false;
+        return;
     }
 
     for (i = 0; i < MAX_RISCV_PMPS; i++) {
@@ -640,12 +639,6 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
             }
         }
     }
-
-    if (*tlb_size != old_size) {
-        return true;
-    }
-
-    return false;
 }
 
 /*
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index a9a0b363a7..69395472f9 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -71,7 +71,7 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
 bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
     target_ulong mode);
-bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
+void pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
                          target_ulong *tlb_size);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
-- 
2.25.1



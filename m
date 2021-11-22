Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086E3458D37
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:17:48 +0100 (CET)
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7KV-0004rO-5P
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:17:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mp771-0002GI-Q7; Mon, 22 Nov 2021 06:03:51 -0500
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:40492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mp76y-0001kL-Ts; Mon, 22 Nov 2021 06:03:51 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09561103|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.094969-0.000319391-0.904712;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LxAeiLa_1637579023; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LxAeiLa_1637579023)
 by smtp.aliyun-inc.com(10.147.42.22); Mon, 22 Nov 2021 19:03:43 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 2/5] target/riscv: Give a more generic size for tlb
Date: Mon, 22 Nov 2021 19:02:27 +0800
Message-Id: <20211122110230.38783-3-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
References: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.148; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-148.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

As the caller has given a tlb size parameter, we should use it
to keep pace with it.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu_helper.c | 5 +----
 target/riscv/pmp.c        | 7 ++++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9eeed38c7e..3f53744897 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -362,7 +362,6 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
                                     int mode)
 {
     pmp_priv_t pmp_priv;
-    target_ulong tlb_size_pmp = 0;
 
     if (!riscv_feature(env, RISCV_FEATURE_PMP)) {
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -377,9 +376,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
 
     *prot = pmp_priv_to_page_prot(pmp_priv);
     if (tlb_size != NULL) {
-        if (pmp_is_range_in_tlb(env, addr & ~(*tlb_size - 1), &tlb_size_pmp)) {
-            *tlb_size = tlb_size_pmp;
-        }
+        pmp_is_range_in_tlb(env, addr & ~(*tlb_size - 1), tlb_size);
     }
 
     return TRANSLATE_SUCCESS;
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 190ff59fab..ca38087574 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -625,7 +625,8 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
 {
     int i;
     target_ulong val;
-    target_ulong tlb_ea = (tlb_sa + TARGET_PAGE_SIZE - 1);
+    target_ulong tlb_ea = (tlb_sa + *tlb_size - 1);
+    target_ulong old_size = *tlb_size;
 
     if (pmp_get_num_rules(env) == 0) {
         return false;
@@ -634,13 +635,13 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
     for (i = 0; i < MAX_RISCV_PMPS; i++) {
         val = pmp_get_tlb_size(env, i, tlb_sa, tlb_ea);
         if (val) {
-            if (*tlb_size == 0 || *tlb_size > val) {
+            if (*tlb_size > val) {
                 *tlb_size = val;
             }
         }
     }
 
-    if (*tlb_size != 0) {
+    if (*tlb_size != old_size) {
         return true;
     }
 
-- 
2.25.1



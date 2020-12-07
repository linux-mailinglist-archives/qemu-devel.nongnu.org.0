Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC062D09D2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 05:49:29 +0100 (CET)
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km8Sm-0001dM-Ne
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 23:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1km8Qo-0008M6-88
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 23:47:26 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:36993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1km8Qh-00019T-Oh
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 23:47:26 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1042633|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0144142-0.00270011-0.982886; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047202; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.J3tRDLu_1607316427; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.J3tRDLu_1607316427)
 by smtp.aliyun-inc.com(10.147.41.199);
 Mon, 07 Dec 2020 12:47:08 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/arm: Fixup contiguous first-fault and no-fault
 loads
Date: Mon,  7 Dec 2020 12:46:53 +0800
Message-Id: <20201207044655.2312-3-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
References: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First-fault or no-fault doesn't mean only access one page.

When cross pages, for first-fault, if there is no fault in the first access,
the second page should be accessed. And for no-fault, the second page
should always be accessed.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/arm/sve_helper.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 91d1d24725..700a8a7585 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4916,17 +4916,6 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
         } while (reg_off <= reg_last && (reg_off & 63));
     } while (reg_off <= reg_last);
 
-    /*
-     * MemSingleNF is allowed to fail for any reason.  We have special
-     * code above to handle the first element crossing a page boundary.
-     * As an implementation choice, decline to handle a cross-page element
-     * in any other position.
-     */
-    reg_off = info.reg_off_split;
-    if (reg_off >= 0) {
-        goto do_fault;
-    }
-
  second_page:
     reg_off = info.reg_off_first[1];
     if (likely(reg_off < 0)) {
@@ -4934,6 +4923,30 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
         return;
     }
 
+    mem_off = info.mem_off_first[1];
+    reg_last = info.reg_off_last[1];
+    host = info.page[1].host;
+
+    do {
+        uint64_t pg = *(uint64_t *)(vg + (reg_off >> 3));
+        do {
+            if ((pg >> (reg_off & 63)) & 1) {
+                if (unlikely(flags & TLB_WATCHPOINT) &&
+                    (cpu_watchpoint_address_matches
+                     (env_cpu(env), addr + mem_off, 1 << msz)
+                     & BP_MEM_READ)) {
+                    goto do_fault;
+                }
+                if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
+                    goto do_fault;
+                }
+                host_fn(vd, reg_off, host + mem_off);
+            }
+            reg_off += 1 << esz;
+            mem_off += 1 << msz;
+        } while (reg_off <= reg_last && (reg_off & 63));
+    } while (reg_off <= reg_last);
+
     /*
      * MemSingleNF is allowed to fail for any reason.  As an implementation
      * choice, decline to handle elements on the second page.  This should
-- 
2.23.0



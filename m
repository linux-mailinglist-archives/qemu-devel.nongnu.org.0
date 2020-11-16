Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC632B3B89
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 03:53:12 +0100 (CET)
Received: from localhost ([::1]:49724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keUdh-0003Wz-Nl
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 21:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZk-0006YI-8T; Sun, 15 Nov 2020 21:49:04 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZg-0002sT-MM; Sun, 15 Nov 2020 21:49:03 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CZD6M5ZFpz6xHl;
 Mon, 16 Nov 2020 10:48:43 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 10:48:46 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v3 2/7] hw/intc/arm_gicv3_kvm: silence the compiler warnings
Date: Mon, 16 Nov 2020 10:48:05 +0800
Message-ID: <20201116024810.2415819-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 21:14:23
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 qemu-arm@nongnu.org, ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using -Wimplicit-fallthrough in our CFLAGS on GCC9, the compiler showed warning:
hw/intc/arm_gicv3_kvm.c: In function ‘kvm_arm_gicv3_put’:
hw/intc/arm_gicv3_kvm.c:484:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
             kvm_gicc_access(s, ICC_AP0R_EL1(1), ncpu, &reg64, true);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/intc/arm_gicv3_kvm.c:485:9: note: here
         default:
         ^~~~~~~
hw/intc/arm_gicv3_kvm.c:495:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
             kvm_gicc_access(s, ICC_AP1R_EL1(2), ncpu, &reg64, true);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/intc/arm_gicv3_kvm.c:496:9: note: here
         case 6:
         ^~~~
hw/intc/arm_gicv3_kvm.c:498:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
             kvm_gicc_access(s, ICC_AP1R_EL1(1), ncpu, &reg64, true);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/intc/arm_gicv3_kvm.c:499:9: note: here
         default:
         ^~~~~~~

hw/intc/arm_gicv3_kvm.c: In function ‘kvm_arm_gicv3_get’:
hw/intc/arm_gicv3_kvm.c:634:37: warning: this statement may fall through [-Wimplicit-fallthrough=]
             c->icc_apr[GICV3_G0][2] = reg64;
             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
hw/intc/arm_gicv3_kvm.c:635:9: note: here
         case 6:
         ^~~~
hw/intc/arm_gicv3_kvm.c:637:37: warning: this statement may fall through [-Wimplicit-fallthrough=]
             c->icc_apr[GICV3_G0][1] = reg64;
             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
hw/intc/arm_gicv3_kvm.c:638:9: note: here
         default:
         ^~~~~~~
hw/intc/arm_gicv3_kvm.c:648:39: warning: this statement may fall through [-Wimplicit-fallthrough=]
             c->icc_apr[GICV3_G1NS][2] = reg64;
             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
hw/intc/arm_gicv3_kvm.c:649:9: note: here
         case 6:
         ^~~~
hw/intc/arm_gicv3_kvm.c:651:39: warning: this statement may fall through [-Wimplicit-fallthrough=]
             c->icc_apr[GICV3_G1NS][1] = reg64;
             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
hw/intc/arm_gicv3_kvm.c:652:9: note: here
         default:
         ^~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 hw/intc/arm_gicv3_kvm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 187eb054e0..d040a5d1e9 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -478,9 +478,11 @@ static void kvm_arm_gicv3_put(GICv3State *s)
             kvm_gicc_access(s, ICC_AP0R_EL1(3), ncpu, &reg64, true);
             reg64 = c->icc_apr[GICV3_G0][2];
             kvm_gicc_access(s, ICC_AP0R_EL1(2), ncpu, &reg64, true);
+            /* fall through */
         case 6:
             reg64 = c->icc_apr[GICV3_G0][1];
             kvm_gicc_access(s, ICC_AP0R_EL1(1), ncpu, &reg64, true);
+            /* fall through */
         default:
             reg64 = c->icc_apr[GICV3_G0][0];
             kvm_gicc_access(s, ICC_AP0R_EL1(0), ncpu, &reg64, true);
@@ -492,9 +494,11 @@ static void kvm_arm_gicv3_put(GICv3State *s)
             kvm_gicc_access(s, ICC_AP1R_EL1(3), ncpu, &reg64, true);
             reg64 = c->icc_apr[GICV3_G1NS][2];
             kvm_gicc_access(s, ICC_AP1R_EL1(2), ncpu, &reg64, true);
+            /* fall through */
         case 6:
             reg64 = c->icc_apr[GICV3_G1NS][1];
             kvm_gicc_access(s, ICC_AP1R_EL1(1), ncpu, &reg64, true);
+            /* fall through */
         default:
             reg64 = c->icc_apr[GICV3_G1NS][0];
             kvm_gicc_access(s, ICC_AP1R_EL1(0), ncpu, &reg64, true);
@@ -631,9 +635,11 @@ static void kvm_arm_gicv3_get(GICv3State *s)
             c->icc_apr[GICV3_G0][3] = reg64;
             kvm_gicc_access(s, ICC_AP0R_EL1(2), ncpu, &reg64, false);
             c->icc_apr[GICV3_G0][2] = reg64;
+            /* fall through */
         case 6:
             kvm_gicc_access(s, ICC_AP0R_EL1(1), ncpu, &reg64, false);
             c->icc_apr[GICV3_G0][1] = reg64;
+            /* fall through */
         default:
             kvm_gicc_access(s, ICC_AP0R_EL1(0), ncpu, &reg64, false);
             c->icc_apr[GICV3_G0][0] = reg64;
@@ -645,9 +651,11 @@ static void kvm_arm_gicv3_get(GICv3State *s)
             c->icc_apr[GICV3_G1NS][3] = reg64;
             kvm_gicc_access(s, ICC_AP1R_EL1(2), ncpu, &reg64, false);
             c->icc_apr[GICV3_G1NS][2] = reg64;
+            /* fall through */
         case 6:
             kvm_gicc_access(s, ICC_AP1R_EL1(1), ncpu, &reg64, false);
             c->icc_apr[GICV3_G1NS][1] = reg64;
+            /* fall through */
         default:
             kvm_gicc_access(s, ICC_AP1R_EL1(0), ncpu, &reg64, false);
             c->icc_apr[GICV3_G1NS][0] = reg64;
-- 
2.27.0



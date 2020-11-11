Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B782AEA56
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 08:52:29 +0100 (CET)
Received: from localhost ([::1]:39644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kckvb-0005zO-M5
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 02:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kckrn-0004L1-DY; Wed, 11 Nov 2020 02:48:31 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kckrg-0006tK-TN; Wed, 11 Nov 2020 02:48:31 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWH073s0SzhkQM;
 Wed, 11 Nov 2020 15:48:07 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 15:48:08 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <i.mitsyanko@gmail.com>, <peter.maydell@linaro.org>
Subject: [PATCH] exynos: Fix bad printf format specifiers
Date: Wed, 11 Nov 2020 07:36:51 +0000
Message-ID: <20201111073651.72804-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 02:48:17
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/timer/exynos4210_mct.c | 4 ++--
 hw/timer/exynos4210_pwm.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 08ee3ca76c..439053acd2 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -537,7 +537,7 @@ static void exynos4210_gcomp_raise_irq(void *opaque, uint32_t id)
     /* If CSTAT is pending and IRQ is enabled */
     if ((s->reg.int_cstat & G_INT_CSTAT_COMP(id)) &&
             (s->reg.int_enb & G_INT_ENABLE(id))) {
-        DPRINTF("gcmp timer[%d] IRQ\n", id);
+        DPRINTF("gcmp timer[%u] IRQ\n", id);
         qemu_irq_raise(s->irq[id]);
     }
 }
@@ -1003,7 +1003,7 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
                     MCT_CFG_GET_DIVIDER(s->reg_mct_cfg));
 
     if (freq != s->freq) {
-        DPRINTF("freq=%dHz\n", s->freq);
+        DPRINTF("freq=%uHz\n", s->freq);
 
         /* global timer */
         tx_ptimer_set_freq(s->g_timer.ptimer_frc, s->freq);
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index 4fa3d87396..de181428b4 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -169,7 +169,7 @@ static void exynos4210_pwm_update_freq(Exynos4210PWMState *s, uint32_t id)
 
     if (freq != s->timer[id].freq) {
         ptimer_set_freq(s->timer[id].ptimer, s->timer[id].freq);
-        DPRINTF("freq=%dHz\n", s->timer[id].freq);
+        DPRINTF("freq=%uHz\n", s->timer[id].freq);
     }
 }
 
@@ -183,14 +183,14 @@ static void exynos4210_pwm_tick(void *opaque)
     uint32_t id = s->id;
     bool cmp;
 
-    DPRINTF("timer %d tick\n", id);
+    DPRINTF("timer %u tick\n", id);
 
     /* set irq status */
     p->reg_tint_cstat |= TINT_CSTAT_STATUS(id);
 
     /* raise IRQ */
     if (p->reg_tint_cstat & TINT_CSTAT_ENABLE(id)) {
-        DPRINTF("timer %d IRQ\n", id);
+        DPRINTF("timer %u IRQ\n", id);
         qemu_irq_raise(p->timer[id].irq);
     }
 
@@ -202,7 +202,7 @@ static void exynos4210_pwm_tick(void *opaque)
     }
 
     if (cmp) {
-        DPRINTF("auto reload timer %d count to %x\n", id,
+        DPRINTF("auto reload timer %u count to %x\n", id,
                 p->timer[id].reg_tcntb);
         ptimer_set_count(p->timer[id].ptimer, p->timer[id].reg_tcntb);
         ptimer_run(p->timer[id].ptimer, 1);
-- 
2.19.1



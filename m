Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1902B3B8A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 03:53:39 +0100 (CET)
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keUeA-0003jz-3I
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 21:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZm-0006cJ-42; Sun, 15 Nov 2020 21:49:06 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZk-0002t4-9j; Sun, 15 Nov 2020 21:49:05 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZD6N30F8zkYgD;
 Mon, 16 Nov 2020 10:48:44 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 10:48:52 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v3 6/7] ppc: Add a missing break for PPC6xx_INPUT_TBEN
Date: Mon, 16 Nov 2020 10:48:09 +0800
Message-ID: <20201116024810.2415819-7-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 21:16:58
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
Cc: Thomas Huth <thuth@redhat.com>, zhang.zhanghailiang@huawei.com,
 ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>,
 Chen Qun <kuhn.chenqun@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
hw/ppc/ppc.c: In function ‘ppc6xx_set_irq’:
hw/ppc/ppc.c:118:16: warning: this statement may fall through [-Wimplicit-fallthrough=]
  118 |             if (level) {
      |                ^
hw/ppc/ppc.c:123:9: note: here
  123 |         case PPC6xx_INPUT_INT:
      |         ^~~~

According to the discussion, a break statement needs to be added here.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
v1->v2: Add a "break" statement here instead of /* fall through */ comments
(Base on Thomas's and David review).

Cc: Thomas Huth <thuth@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 4a11fb1640..1b98272076 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -120,6 +120,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
             } else {
                 cpu_ppc_tb_stop(env);
             }
+            break;
         case PPC6xx_INPUT_INT:
             /* Level sensitive - active high */
             LOG_IRQ("%s: set the external IRQ state to %d\n",
-- 
2.27.0



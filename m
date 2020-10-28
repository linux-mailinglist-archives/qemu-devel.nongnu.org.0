Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B3B29CDD6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 05:31:21 +0100 (CET)
Received: from localhost ([::1]:38306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXd7I-0005WW-QC
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 00:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kXcvi-0001pF-Fs; Wed, 28 Oct 2020 00:19:22 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kXcve-0007cx-If; Wed, 28 Oct 2020 00:19:22 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CLb1f0d8mz6y74;
 Wed, 28 Oct 2020 12:19:18 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Wed, 28 Oct 2020
 12:19:04 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 7/9] ppc: silence the compiler warnings
Date: Wed, 28 Oct 2020 12:18:17 +0800
Message-ID: <20201028041819.2169003-8-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201028041819.2169003-1-kuhn.chenqun@huawei.com>
References: <20201028041819.2169003-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 00:19:14
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>, zhang.zhanghailiang@huawei.com,
 ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>
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

Add the corresponding "fall through" comment to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 4a11fb1640..f9eb8f21b4 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -120,6 +120,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
             } else {
                 cpu_ppc_tb_stop(env);
             }
+            /* fall through */
         case PPC6xx_INPUT_INT:
             /* Level sensitive - active high */
             LOG_IRQ("%s: set the external IRQ state to %d\n",
-- 
2.27.0



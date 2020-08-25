Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D402517AF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 13:32:41 +0200 (CEST)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAXBw-00038b-Sm
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 07:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kAX5s-0000Ym-9H; Tue, 25 Aug 2020 07:26:24 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39244 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kAX5q-0006iP-HE; Tue, 25 Aug 2020 07:26:24 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3587488DF51339F7D650;
 Tue, 25 Aug 2020 19:26:19 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 19:26:08 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 09/10] hw/intc: Remove redundant statement in
 exynos4210_combiner_read()
Date: Tue, 25 Aug 2020 19:24:46 +0800
Message-ID: <20200825112447.126308-10-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 07:26:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
 Igor Mitsyanko <i.mitsyanko@gmail.com>, pannengyuan@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang static code analyzer show warning:
hw/intc/exynos4210_combiner.c:231:9: warning: Value stored to 'val' is never read
        val = s->reg_set[offset >> 2];

The default value of 'val' is '0', so we can break the 'default' branch and return 'val'.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/exynos4210_combiner.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index b8561e4180..e2e745bbaa 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -228,8 +228,7 @@ exynos4210_combiner_read(void *opaque, hwaddr offset, unsigned size)
             hw_error("exynos4210.combiner: overflow of reg_set by 0x"
                     TARGET_FMT_plx "offset\n", offset);
         }
-        val = s->reg_set[offset >> 2];
-        return 0;
+        break;
     }
     return val;
 }
-- 
2.23.0



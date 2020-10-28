Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD129CDD3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 05:29:49 +0100 (CET)
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXd5o-0004jF-Ip
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 00:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kXcvk-0001rm-FE; Wed, 28 Oct 2020 00:19:24 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kXcve-0007cw-Ke; Wed, 28 Oct 2020 00:19:24 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CLb1f0MMlz6y4W;
 Wed, 28 Oct 2020 12:19:18 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Wed, 28 Oct 2020
 12:19:06 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 8/9] target/ppc: silence the compiler warnings
Date: Wed, 28 Oct 2020 12:18:18 +0800
Message-ID: <20201028041819.2169003-9-kuhn.chenqun@huawei.com>
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
target/ppc/mmu_helper.c: In function ‘dump_mmu’:
target/ppc/mmu_helper.c:1351:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
 1351 |         if (ppc64_v3_radix(env_archcpu(env))) {
      |            ^
target/ppc/mmu_helper.c:1358:5: note: here
 1358 |     default:
      |     ^~~~~~~

Add the corresponding "fall through" comment to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 8972714775..51749b62df 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1355,6 +1355,7 @@ void dump_mmu(CPUPPCState *env)
             break;
         }
 #endif
+        /* fall through */
     default:
         qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
     }
-- 
2.27.0



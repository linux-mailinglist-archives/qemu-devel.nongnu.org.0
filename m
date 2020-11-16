Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142192B3B8B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 03:53:59 +0100 (CET)
Received: from localhost ([::1]:51164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keUeU-00047W-1p
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 21:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZn-0006eT-14; Sun, 15 Nov 2020 21:49:07 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZk-0002t6-Bz; Sun, 15 Nov 2020 21:49:06 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZD6N39K6zkYgP;
 Mon, 16 Nov 2020 10:48:44 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 10:48:53 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v3 7/7] target/ppc: replaced the TODO with LOG_UNIMP and add
 break for silence warnings
Date: Mon, 16 Nov 2020 10:48:10 +0800
Message-ID: <20201116024810.2415819-8-kuhn.chenqun@huawei.com>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>,
 Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
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

Use "qemu_log_mask(LOG_UNIMP**)" instead of the TODO comment.
And add the break statement to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
v1->v2: replace the TODO by a LOG_UNIMP call and add break statement(Base on Philippe's comments)

Cc: Thomas Huth <thuth@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/ppc/mmu_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 8972714775..3bb50546f8 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1349,11 +1349,12 @@ void dump_mmu(CPUPPCState *env)
         break;
     case POWERPC_MMU_3_00:
         if (ppc64_v3_radix(env_archcpu(env))) {
-            /* TODO - Unsupported */
+            qemu_log_mask(LOG_UNIMP, "%s: the PPC64 MMU is unsupported\n",
+                          __func__);
         } else {
             dump_slb(env_archcpu(env));
-            break;
         }
+        break;
 #endif
     default:
         qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
-- 
2.27.0



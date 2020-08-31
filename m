Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3AE25742E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 09:18:46 +0200 (CEST)
Received: from localhost ([::1]:33070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCe5V-0004D3-MD
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 03:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kCe47-0002bo-J3
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 03:17:19 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:56132 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kCe45-0005sa-Hf
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 03:17:19 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8163A57252889B684A46;
 Mon, 31 Aug 2020 15:17:05 +0800 (CST)
Received: from opensource.huawei.com (10.175.100.152) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 31 Aug 2020 15:16:56 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 01/10] qga/channel-posix: Plug memory leak in
 ga_channel_write_all()
Date: Mon, 31 Aug 2020 09:43:06 -0400
Message-ID: <20200831134315.1221-2-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200831134315.1221-1-pannengyuan@huawei.com>
References: <20200831134315.1221-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.152]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:17:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, kuhn.chenqun@huawei.com,
 Pan Nengyuan <pannengyuan@huawei.com>, zhang.zhanghailiang@huawei.com,
 euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing g_error_free on error path in ga_channel_write_all(). Fix that.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
---
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
---
- V2: no changes in v2
---
 qga/channel-posix.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qga/channel-posix.c b/qga/channel-posix.c
index 8fc205ad21..0b151cb87b 100644
--- a/qga/channel-posix.c
+++ b/qga/channel-posix.c
@@ -249,7 +249,7 @@ GIOStatus ga_channel_write_all(GAChannel *c, const gchar *buf, gsize size)
             buf += written;
         } else if (status != G_IO_STATUS_AGAIN) {
             g_warning("error writing to channel: %s", err->message);
-            return status;
+            goto out;
         }
     }
 
@@ -261,6 +261,10 @@ GIOStatus ga_channel_write_all(GAChannel *c, const gchar *buf, gsize size)
         g_warning("error flushing channel: %s", err->message);
     }
 
+out:
+    if (err) {
+        g_error_free(err);
+    }
     return status;
 }
 
-- 
2.18.2



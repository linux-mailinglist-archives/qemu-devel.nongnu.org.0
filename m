Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE33724480B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:31:51 +0200 (CEST)
Received: from localhost ([::1]:47468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6X02-00008e-OX
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1k6W9a-0006cA-Sc
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:37:38 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4191 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1k6W9W-00061x-9Z
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:37:38 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 76DBE841F3AAD1BF9166;
 Fri, 14 Aug 2020 17:37:25 +0800 (CST)
Received: from opensource.huawei.com (10.175.100.152) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 14 Aug 2020 17:37:16 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 01/12] qga/channel-posix: Plug memory leak in
 ga_channel_write_all()
Date: Fri, 14 Aug 2020 12:02:30 -0400
Message-ID: <20200814160241.7915-2-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200814160241.7915-1-pannengyuan@huawei.com>
References: <20200814160241.7915-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.152]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 05:37:26
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
---
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
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



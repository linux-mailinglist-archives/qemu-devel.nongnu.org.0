Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E96310904
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:28:01 +0100 (CET)
Received: from localhost ([::1]:47890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yLI-0001Lg-8C
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7c-00032O-3J; Fri, 05 Feb 2021 05:13:52 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7W-00076r-LZ; Fri, 05 Feb 2021 05:13:51 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DXB6q64bXz7h5Y;
 Fri,  5 Feb 2021 18:12:19 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Feb 2021
 18:13:31 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 5/9] block-backend: Add timeout support for retry
Date: Fri, 5 Feb 2021 18:13:11 +0800
Message-ID: <20210205101315.13042-6-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205101315.13042-1-cenjiahui@huawei.com>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=cenjiahui@huawei.com;
 helo=szxga07-in.huawei.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, cenjiahui@huawei.com,
 zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 fangying1@huawei.com, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Retry should only be triggered when timeout is not reached, so let's check
timeout before retry. Device should also reset retry_start_time after
successful retry.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 block/block-backend.c          | 25 +++++++++++++++++++-
 include/sysemu/block-backend.h |  1 +
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index ab75cb1971..8ad1e5105d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1776,6 +1776,29 @@ void blk_drain_all(void)
     bdrv_drain_all_end();
 }
 
+static bool blk_error_retry_timeout(BlockBackend *blk)
+{
+    /* No timeout set, infinite retries. */
+    if (!blk->retry_timeout) {
+        return false;
+    }
+
+    /* The first time an error occurs. */
+    if (!blk->retry_start_time) {
+        blk->retry_start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+        return false;
+    }
+
+    return qemu_clock_get_ms(QEMU_CLOCK_REALTIME) > (blk->retry_start_time +
+                                                     blk->retry_timeout);
+}
+
+void blk_error_retry_reset_timeout(BlockBackend *blk)
+{
+    if (blk->retry_timer && blk->retry_start_time)
+        blk->retry_start_time = 0;
+}
+
 void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
                       BlockdevOnError on_write_error)
 {
@@ -1804,7 +1827,7 @@ BlockErrorAction blk_get_error_action(BlockBackend *blk, bool is_read,
     case BLOCKDEV_ON_ERROR_IGNORE:
         return BLOCK_ERROR_ACTION_IGNORE;
     case BLOCKDEV_ON_ERROR_RETRY:
-        return (blk->retry_timer) ?
+        return (blk->retry_timer && !blk_error_retry_timeout(blk)) ?
                BLOCK_ERROR_ACTION_RETRY : BLOCK_ERROR_ACTION_REPORT;
     case BLOCKDEV_ON_ERROR_AUTO:
     default:
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index d806852db5..286d2db918 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -188,6 +188,7 @@ void blk_inc_in_flight(BlockBackend *blk);
 void blk_dec_in_flight(BlockBackend *blk);
 void blk_drain(BlockBackend *blk);
 void blk_drain_all(void);
+void blk_error_retry_reset_timeout(BlockBackend *blk);
 void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
                       BlockdevOnError on_write_error);
 BlockdevOnError blk_get_on_error(BlockBackend *blk, bool is_read);
-- 
2.29.2



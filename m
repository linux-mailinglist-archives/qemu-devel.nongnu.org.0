Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAF03108F7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:25:00 +0100 (CET)
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yIN-0006di-9S
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7b-000319-M2; Fri, 05 Feb 2021 05:13:51 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7Y-00077Y-Aq; Fri, 05 Feb 2021 05:13:51 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DXB6s1hqjz7h16;
 Fri,  5 Feb 2021 18:12:21 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Feb 2021
 18:13:30 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 3/9] block-backend: Add device specific retry callback
Date: Fri, 5 Feb 2021 18:13:09 +0800
Message-ID: <20210205101315.13042-4-cenjiahui@huawei.com>
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

Add retry_request_cb in BlockDevOps to do device specific retry action.
Backend's timer would be registered only when the backend is set 'retry'
on errors and the device supports retry action.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 block/block-backend.c          | 8 ++++++++
 include/sysemu/block-backend.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index 3a9d55cbe3..a8bfaf6e4a 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -995,6 +995,14 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
     blk->dev_ops = ops;
     blk->dev_opaque = opaque;
 
+    if ((blk->on_read_error == BLOCKDEV_ON_ERROR_RETRY ||
+         blk->on_write_error == BLOCKDEV_ON_ERROR_RETRY) &&
+        ops->retry_request_cb) {
+        blk->retry_timer = aio_timer_new(blk->ctx, QEMU_CLOCK_REALTIME,
+                                         SCALE_MS, ops->retry_request_cb,
+                                         opaque);
+    }
+
     /* Are we currently quiesced? Should we enforce this right now? */
     if (blk->quiesce_counter && ops->drained_begin) {
         ops->drained_begin(opaque);
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 880e903293..d806852db5 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -66,6 +66,10 @@ typedef struct BlockDevOps {
      * Runs when the backend's last drain request ends.
      */
     void (*drained_end)(void *opaque);
+    /*
+     * Runs when retrying failed requests.
+     */
+    void (*retry_request_cb)(void *opaque);
 } BlockDevOps;
 
 /* This struct is embedded in (the private) BlockBackend struct and contains
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51F52DAD5D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 13:38:06 +0100 (CET)
Received: from localhost ([::1]:48130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp9af-0007Ag-Vz
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 07:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kp9Tn-0007vp-BF; Tue, 15 Dec 2020 07:30:59 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kp9Th-0006vJ-VE; Tue, 15 Dec 2020 07:30:59 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CwHdf6H6lz7FsH;
 Tue, 15 Dec 2020 20:29:58 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Tue, 15 Dec 2020
 20:30:26 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 4/7] block-backend: Enable retry action on errors
Date: Tue, 15 Dec 2020 20:30:08 +0800
Message-ID: <20201215123011.4048-5-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215123011.4048-1-cenjiahui@huawei.com>
References: <20201215123011.4048-1-cenjiahui@huawei.com>
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

Enable retry action when backend's retry timer is available. It would
trigger the timer to do device specific retry action.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 block/block-backend.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index bca7c581ee..9c6e50e568 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1803,6 +1803,9 @@ BlockErrorAction blk_get_error_action(BlockBackend *blk, bool is_read,
         return BLOCK_ERROR_ACTION_REPORT;
     case BLOCKDEV_ON_ERROR_IGNORE:
         return BLOCK_ERROR_ACTION_IGNORE;
+    case BLOCKDEV_ON_ERROR_RETRY:
+        return (blk->retry_timer) ?
+               BLOCK_ERROR_ACTION_RETRY : BLOCK_ERROR_ACTION_REPORT;
     case BLOCKDEV_ON_ERROR_AUTO:
     default:
         abort();
@@ -1850,6 +1853,10 @@ void blk_error_action(BlockBackend *blk, BlockErrorAction action,
         qemu_system_vmstop_request_prepare();
         send_qmp_error_event(blk, action, is_read, error);
         qemu_system_vmstop_request(RUN_STATE_IO_ERROR);
+    } else if (action == BLOCK_ERROR_ACTION_RETRY) {
+        timer_mod(blk->retry_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) +
+                                    blk->retry_interval);
+        send_qmp_error_event(blk, action, is_read, error);
     } else {
         send_qmp_error_event(blk, action, is_read, error);
     }
-- 
2.28.0



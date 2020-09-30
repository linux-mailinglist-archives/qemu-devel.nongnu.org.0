Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D7227E5A5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 11:51:05 +0200 (CEST)
Received: from localhost ([::1]:55626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNYlM-0002OF-5a
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 05:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kNYhR-00072w-Kl
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 05:47:01 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:40788 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kNYhM-0003oI-TM
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 05:47:01 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AEF0E67C36DC74AF360E;
 Wed, 30 Sep 2020 17:46:52 +0800 (CST)
Received: from localhost (10.174.186.107) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 30 Sep 2020
 17:46:46 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 8/8] qapi: add I/O hang and I/O hang timeout qapi event
Date: Wed, 30 Sep 2020 17:46:06 +0800
Message-ID: <20200930094606.5323-9-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930094606.5323-1-cenjiahui@huawei.com>
References: <20200930094606.5323-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.107]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=cenjiahui@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 05:46:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: kwolf@redhat.com, fangying1@huawei.com, cenjiahui@huawei.com,
 zhang.zhanghailiang@huawei.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes hypervisor management tools like libvirt may need to monitor
I/O hang events. Let's report I/O hang and I/O hang timeout event via qapi.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 block/block-backend.c |  3 +++
 qapi/block-core.json  | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index c812b3a9c7..42337ceb04 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2556,6 +2556,7 @@ static bool blk_iohang_handle(BlockBackend *blk, int new_status)
             /* Case when I/O Hang is recovered */
             blk->is_iohang_timeout = false;
             blk->iohang_time = 0;
+            qapi_event_send_block_io_hang(false);
         }
         break;
     case BLOCK_IO_HANG_STATUS_HANG:
@@ -2563,12 +2564,14 @@ static bool blk_iohang_handle(BlockBackend *blk, int new_status)
             /* Case when I/O hang is first triggered */
             blk->iohang_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
             need_rehandle = true;
+            qapi_event_send_block_io_hang(true);
         } else {
             if (!blk->is_iohang_timeout) {
                 now = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
                 if (now >= (blk->iohang_time + blk->iohang_timeout)) {
                     /* Case when I/O hang is timeout */
                     blk->is_iohang_timeout = true;
+                    qapi_event_send_block_io_hang_timeout(true);
                 } else {
                     /* Case when I/O hang is continued */
                     need_rehandle = true;
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 3c16f1e11d..7bdf75c6d7 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5535,3 +5535,29 @@
 { 'command': 'blockdev-snapshot-delete-internal-sync',
   'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
   'returns': 'SnapshotInfo' }
+
+##
+# @BLOCK_IO_HANG:
+#
+# Emitted when device I/O hang trigger event begin or end
+#
+# @set: true if I/O hang begin; false if I/O hang end.
+#
+# Since: 5.2
+#
+##
+{ 'event': 'BLOCK_IO_HANG',
+  'data': { 'set': 'bool' }}
+
+##
+# @BLOCK_IO_HANG_TIMEOUT:
+#
+# Emitted when device I/O hang timeout event set or clear
+#
+# @set: true if set; false if clear.
+#
+# Since: 5.2
+#
+##
+{ 'event': 'BLOCK_IO_HANG_TIMEOUT',
+  'data': { 'set': 'bool' }}
-- 
2.28.0



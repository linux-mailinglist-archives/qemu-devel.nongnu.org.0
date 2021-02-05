Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE75C3108F8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:25:06 +0100 (CET)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yIU-0006t1-10
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7Z-0002wU-G1; Fri, 05 Feb 2021 05:13:49 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7W-00078Y-EI; Fri, 05 Feb 2021 05:13:49 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DXB6v3Nzfz164xB;
 Fri,  5 Feb 2021 18:12:23 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Feb 2021
 18:13:33 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 9/9] scsi-disk: Add support for retry on errors
Date: Fri, 5 Feb 2021 18:13:15 +0800
Message-ID: <20210205101315.13042-10-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205101315.13042-1-cenjiahui@huawei.com>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=cenjiahui@huawei.com;
 helo=szxga04-in.huawei.com
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

Mark failed requests as to be retried and implement retry_request_cb to
handle these requests.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/scsi/scsi-disk.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index ed52fcd49f..687ed19822 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -184,6 +184,8 @@ static void scsi_disk_load_request(QEMUFile *f, SCSIRequest *req)
 
 static bool scsi_disk_req_check_error(SCSIDiskReq *r, int ret, bool acct_failed)
 {
+    SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
+
     if (r->req.io_canceled) {
         scsi_req_cancel_complete(&r->req);
         return true;
@@ -193,6 +195,7 @@ static bool scsi_disk_req_check_error(SCSIDiskReq *r, int ret, bool acct_failed)
         return scsi_handle_rw_error(r, -ret, acct_failed);
     }
 
+    blk_error_retry_reset_timeout(s->qdev.conf.blk);
     return false;
 }
 
@@ -499,6 +502,10 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
         }
     }
 
+    if (action == BLOCK_ERROR_ACTION_RETRY) {
+        scsi_req_retry(&r->req);
+    }
+
     blk_error_action(s->qdev.conf.blk, action, is_read, error);
     if (action == BLOCK_ERROR_ACTION_IGNORE) {
         scsi_req_complete(&r->req, 0);
@@ -2284,6 +2291,13 @@ static void scsi_disk_resize_cb(void *opaque)
     }
 }
 
+static void scsi_disk_retry_request(void *opaque)
+{
+    SCSIDiskState *s = opaque;
+
+    scsi_retry_requests(&s->qdev);
+}
+
 static void scsi_cd_change_media_cb(void *opaque, bool load, Error **errp)
 {
     SCSIDiskState *s = opaque;
@@ -2332,10 +2346,12 @@ static const BlockDevOps scsi_disk_removable_block_ops = {
     .is_medium_locked = scsi_cd_is_medium_locked,
 
     .resize_cb = scsi_disk_resize_cb,
+    .retry_request_cb = scsi_disk_retry_request,
 };
 
 static const BlockDevOps scsi_disk_block_ops = {
     .resize_cb = scsi_disk_resize_cb,
+    .retry_request_cb = scsi_disk_retry_request,
 };
 
 static void scsi_disk_unit_attention_reported(SCSIDevice *dev)
-- 
2.29.2



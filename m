Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4655E3108EE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:23:29 +0100 (CET)
Received: from localhost ([::1]:33810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yGu-0003om-AO
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7X-0002uQ-TL; Fri, 05 Feb 2021 05:13:47 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7U-00077b-JS; Fri, 05 Feb 2021 05:13:47 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DXB6s0Yrzz164WY;
 Fri,  5 Feb 2021 18:12:21 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Feb 2021
 18:13:33 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 8/9] scsi-bus: Refactor the code that retries requests
Date: Fri, 5 Feb 2021 18:13:14 +0800
Message-ID: <20210205101315.13042-9-cenjiahui@huawei.com>
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

Move the code that retries requests from scsi_dma_restart_bh() to its own,
non-static, function. This will allow us to call it from the
retry_request_cb() of scsi-disk in a future patch.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/scsi/scsi-bus.c     | 16 +++++++++++-----
 include/hw/scsi/scsi.h |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index c349fb7f2d..b2a174efe2 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -143,14 +143,10 @@ void scsi_bus_new(SCSIBus *bus, size_t bus_size, DeviceState *host,
     qbus_set_bus_hotplug_handler(BUS(bus));
 }
 
-static void scsi_dma_restart_bh(void *opaque)
+void scsi_retry_requests(SCSIDevice *s)
 {
-    SCSIDevice *s = opaque;
     SCSIRequest *req, *next;
 
-    qemu_bh_delete(s->bh);
-    s->bh = NULL;
-
     aio_context_acquire(blk_get_aio_context(s->conf.blk));
     QTAILQ_FOREACH_SAFE(req, &s->requests, next, next) {
         scsi_req_ref(req);
@@ -170,6 +166,16 @@ static void scsi_dma_restart_bh(void *opaque)
         scsi_req_unref(req);
     }
     aio_context_release(blk_get_aio_context(s->conf.blk));
+}
+
+static void scsi_dma_restart_bh(void *opaque)
+{
+    SCSIDevice *s = opaque;
+
+    qemu_bh_delete(s->bh);
+    s->bh = NULL;
+
+    scsi_retry_requests(s);
     /* Drop the reference that was acquired in scsi_dma_restart_cb */
     object_unref(OBJECT(s));
 }
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 09fa5c9d2a..28f330deaf 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -181,6 +181,7 @@ void scsi_req_cancel_complete(SCSIRequest *req);
 void scsi_req_cancel(SCSIRequest *req);
 void scsi_req_cancel_async(SCSIRequest *req, Notifier *notifier);
 void scsi_req_retry(SCSIRequest *req);
+void scsi_retry_requests(SCSIDevice *s);
 void scsi_device_purge_requests(SCSIDevice *sdev, SCSISense sense);
 void scsi_device_set_ua(SCSIDevice *sdev, SCSISense sense);
 void scsi_device_report_change(SCSIDevice *dev, SCSISense sense);
-- 
2.29.2



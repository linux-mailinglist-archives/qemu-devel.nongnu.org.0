Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00D23B6E9F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 09:17:09 +0200 (CEST)
Received: from localhost ([::1]:33642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly7zY-0003Wh-Oz
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 03:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjie88@huawei.com>)
 id 1ly7yK-0002qd-AP
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:15:52 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjie88@huawei.com>)
 id 1ly7yH-0006MV-AB
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:15:52 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GDbJt4xb9zZn8M;
 Tue, 29 Jun 2021 15:12:30 +0800 (CST)
Received: from dggpeml500007.china.huawei.com (7.185.36.75) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 29 Jun 2021 15:15:33 +0800
Received: from huawei.com (10.175.124.27) by dggpeml500007.china.huawei.com
 (7.185.36.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 29 Jun
 2021 15:15:32 +0800
From: Jie Wang <wangjie88@huawei.com>
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>, <fam@euphon.net>
Subject: [PATCH] scsi: fix bug scsi resp sense is 0 when expand disk
Date: Tue, 29 Jun 2021 15:12:26 +0800
Message-ID: <20210629071226.3890105-1-wangjie88@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500007.china.huawei.com (7.185.36.75)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=wangjie88@huawei.com;
 helo=szxga02-in.huawei.com
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
Cc: weidong.huang@huawei.com, wangjie88@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A large number of I/Os are delivered during disk capacity expansion.
Many I/Os are extracted from the Vring ring, and each one registers
reqops_unit_attention when new scsi req.
If the first registered req takes the ua, the ua is cleared
and other registered req is return 0 sense.

Let's add req_has_ua to avoid this kind of thing.

Signed-off-by: suruifeng <suruifeng@huawei.com>
Signed-off-by: Jie Wang <wangjie88@huawei.com>
---
 hw/scsi/scsi-bus.c     | 10 ++++++++--
 include/hw/scsi/scsi.h |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 2a0a98cac9..20ec4a5f74 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -722,7 +722,13 @@ SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
           * If we already have a pending unit attention condition,
           * report this one before triggering another one.
           */
-         !(buf[0] == REQUEST_SENSE && d->sense_is_ua))) {
+         !(buf[0] == REQUEST_SENSE && d->sense_is_ua)) &&
+         /*
+          * If we already have a req register ua ops,
+          * other req can not register.
+          */
+         !d->req_has_ua) {
+        d->req_has_ua = true;
         ops = &reqops_unit_attention;
     } else if (lun != d->lun ||
                buf[0] == REPORT_LUNS ||
@@ -822,7 +828,7 @@ static void scsi_clear_unit_attention(SCSIRequest *req)
           ua->ascq == SENSE_CODE(REPORTED_LUNS_CHANGED).ascq)) {
         return;
     }
-
+    req->dev->req_has_ua = false;
     *ua = SENSE_CODE(NO_SENSE);
 }
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 0b726bc78c..3d0cda68f6 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -74,6 +74,7 @@ struct SCSIDevice
     BlockConf conf;
     SCSISense unit_attention;
     bool sense_is_ua;
+    bool req_has_ua;
     uint8_t sense[SCSI_SENSE_BUF_SIZE];
     uint32_t sense_len;
     QTAILQ_HEAD(, SCSIRequest) requests;
-- 
2.23.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B5055DB40
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:24:27 +0200 (CEST)
Received: from localhost ([::1]:60646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BCc-000370-5h
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzU-0004VC-R1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzS-0008Ej-Tw
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656421850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98FV2Tp/Ibe7MnUymU+hTPI6gtBw4k1H7n2ZTmbW8MI=;
 b=bbJ1oKaHg0dfaem6Bz+1/ET6YHBeH1vXWrxbQoxUtK+LMPwXNjRtHysJx7rKuUstqRk82b
 +iwN7PdP+N+hazbT0c2rGiw05aIjAOoJTzxZIrbNi2Mv7IOLW+PZQiGj8uNmS/WAnak/sC
 G9Lr1Fl2VYKL04MQSgdX8W1ShgGlZTQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-jbypXfZiMVaxe5nQN-ub4Q-1; Tue, 28 Jun 2022 09:10:45 -0400
X-MC-Unique: jbypXfZiMVaxe5nQN-ub4Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B226B81D9EF;
 Tue, 28 Jun 2022 13:10:44 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D15C1492C3B;
 Tue, 28 Jun 2022 13:10:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PATCH 09/12] pc-bios/s390-ccw: Split virtio-scsi code from
 virtio_blk_setup_device()
Date: Tue, 28 Jun 2022 15:10:29 +0200
Message-Id: <20220628131032.213986-10-thuth@redhat.com>
In-Reply-To: <20220628131032.213986-1-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next patch is going to add more virtio-block specific code to
virtio_blk_setup_device(), and if the virtio-scsi code is also in
there, this is more cumbersome. And the calling function virtio_setup()
in main.c looks at the device type already anyway, so it's more
logical to separate the virtio-scsi stuff into a new function in
virtio-scsi.c instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/virtio-scsi.h   |  2 +-
 pc-bios/s390-ccw/main.c          | 24 +++++++++++++++++-------
 pc-bios/s390-ccw/virtio-blkdev.c | 20 ++------------------
 pc-bios/s390-ccw/virtio-scsi.c   | 19 ++++++++++++++++++-
 4 files changed, 38 insertions(+), 27 deletions(-)

diff --git a/pc-bios/s390-ccw/virtio-scsi.h b/pc-bios/s390-ccw/virtio-scsi.h
index 4b14c2c2f9..e6b6cd4815 100644
--- a/pc-bios/s390-ccw/virtio-scsi.h
+++ b/pc-bios/s390-ccw/virtio-scsi.h
@@ -67,8 +67,8 @@ static inline bool virtio_scsi_response_ok(const VirtioScsiCmdResp *r)
         return r->response == VIRTIO_SCSI_S_OK && r->status == CDB_STATUS_GOOD;
 }
 
-int virtio_scsi_setup(VDev *vdev);
 int virtio_scsi_read_many(VDev *vdev,
                           ulong sector, void *load_addr, int sec_num);
+int virtio_scsi_setup_device(SubChannelId schid);
 
 #endif /* VIRTIO_SCSI_H */
diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
index 835341457d..a2def83e82 100644
--- a/pc-bios/s390-ccw/main.c
+++ b/pc-bios/s390-ccw/main.c
@@ -14,6 +14,7 @@
 #include "s390-ccw.h"
 #include "cio.h"
 #include "virtio.h"
+#include "virtio-scsi.h"
 #include "dasd-ipl.h"
 
 char stack[PAGE_SIZE * 8] __attribute__((__aligned__(PAGE_SIZE)));
@@ -218,6 +219,7 @@ static int virtio_setup(void)
 {
     VDev *vdev = virtio_get_device();
     QemuIplParameters *early_qipl = (QemuIplParameters *)QIPL_ADDRESS;
+    int ret;
 
     memcpy(&qipl, early_qipl, sizeof(QemuIplParameters));
 
@@ -225,18 +227,26 @@ static int virtio_setup(void)
         menu_setup();
     }
 
-    if (virtio_get_device_type() == VIRTIO_ID_NET) {
+    switch (vdev->senseid.cu_model) {
+    case VIRTIO_ID_NET:
         sclp_print("Network boot device detected\n");
         vdev->netboot_start_addr = qipl.netboot_start_addr;
-    } else {
-        int ret = virtio_blk_setup_device(blk_schid);
-        if (ret) {
-            return ret;
-        }
+        return 0;
+    case VIRTIO_ID_BLOCK:
+        ret = virtio_blk_setup_device(blk_schid);
+        break;
+    case VIRTIO_ID_SCSI:
+        ret = virtio_scsi_setup_device(blk_schid);
+        break;
+    default:
+        panic("\n! No IPL device available !\n");
+    }
+
+    if (!ret) {
         IPL_assert(virtio_ipl_disk_is_valid(), "No valid IPL device detected");
     }
 
-    return 0;
+    return ret;
 }
 
 static void ipl_boot_device(void)
diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-ccw/virtio-blkdev.c
index 11820754f3..a2b157b2c0 100644
--- a/pc-bios/s390-ccw/virtio-blkdev.c
+++ b/pc-bios/s390-ccw/virtio-blkdev.c
@@ -222,27 +222,11 @@ uint64_t virtio_get_blocks(void)
 int virtio_blk_setup_device(SubChannelId schid)
 {
     VDev *vdev = virtio_get_device();
-    int ret = 0;
 
     vdev->schid = schid;
     virtio_setup_ccw(vdev);
 
-    switch (vdev->senseid.cu_model) {
-    case VIRTIO_ID_BLOCK:
-        sclp_print("Using virtio-blk.\n");
-        break;
-    case VIRTIO_ID_SCSI:
-        IPL_assert(vdev->config.scsi.sense_size == VIRTIO_SCSI_SENSE_SIZE,
-            "Config: sense size mismatch");
-        IPL_assert(vdev->config.scsi.cdb_size == VIRTIO_SCSI_CDB_SIZE,
-            "Config: CDB size mismatch");
+    sclp_print("Using virtio-blk.\n");
 
-        sclp_print("Using virtio-scsi.\n");
-        ret = virtio_scsi_setup(vdev);
-        break;
-    default:
-        panic("\n! No IPL device available !\n");
-    }
-
-    return ret;
+    return 0;
 }
diff --git a/pc-bios/s390-ccw/virtio-scsi.c b/pc-bios/s390-ccw/virtio-scsi.c
index 2c8d0f3097..3b7069270c 100644
--- a/pc-bios/s390-ccw/virtio-scsi.c
+++ b/pc-bios/s390-ccw/virtio-scsi.c
@@ -329,7 +329,7 @@ static void scsi_parse_capacity_report(void *data,
     }
 }
 
-int virtio_scsi_setup(VDev *vdev)
+static int virtio_scsi_setup(VDev *vdev)
 {
     int retry_test_unit_ready = 3;
     uint8_t data[256];
@@ -430,3 +430,20 @@ int virtio_scsi_setup(VDev *vdev)
 
     return 0;
 }
+
+int virtio_scsi_setup_device(SubChannelId schid)
+{
+    VDev *vdev = virtio_get_device();
+
+    vdev->schid = schid;
+    virtio_setup_ccw(vdev);
+
+    IPL_assert(vdev->config.scsi.sense_size == VIRTIO_SCSI_SENSE_SIZE,
+               "Config: sense size mismatch");
+    IPL_assert(vdev->config.scsi.cdb_size == VIRTIO_SCSI_CDB_SIZE,
+               "Config: CDB size mismatch");
+
+    sclp_print("Using virtio-scsi.\n");
+
+    return virtio_scsi_setup(vdev);
+}
-- 
2.31.1



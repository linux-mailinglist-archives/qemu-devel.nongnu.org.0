Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6CF569D28
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:19:51 +0200 (CEST)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Mjm-0004Iq-C9
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLg-0002oJ-EJ
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLc-0007X9-HT
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skQZLLrF+LsLen7O9ltwiKuSN7RaysfdHj5NAV6J3nY=;
 b=SsZU2FAzDGEY/vujf/g7MxHeJ8+gdrnZYdKeg7wH36Jz+JwfBaqn4fm3qS3zQU8FeaHSLA
 84+dnL17YO8B/0G0vMOCZwqrunLI/y41kjct4QX5LVOb+pwB3W9X+0v/5Ea/K7oe4yI8zs
 Nqhrup5gv4z3CynWmVI1H7G7hZW4nIE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-iraVQSTTP7O7nfWspnVVAw-1; Thu, 07 Jul 2022 03:54:46 -0400
X-MC-Unique: iraVQSTTP7O7nfWspnVVAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2C9E811E76;
 Thu,  7 Jul 2022 07:54:45 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEDB040CFD0A;
 Thu,  7 Jul 2022 07:54:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org,
	Eric Farman <farman@linux.ibm.com>
Subject: [PULL 10/18] pc-bios/s390-ccw: Split virtio-scsi code from
 virtio_blk_setup_device()
Date: Thu,  7 Jul 2022 09:54:18 +0200
Message-Id: <20220707075426.1163210-11-thuth@redhat.com>
In-Reply-To: <20220707075426.1163210-1-thuth@redhat.com>
References: <20220707075426.1163210-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

Message-Id: <20220704111903.62400-10-thuth@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
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
index db1f7f44aa..c175b66a47 100644
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



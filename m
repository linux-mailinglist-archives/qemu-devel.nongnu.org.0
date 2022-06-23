Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5DB5573B0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 09:15:52 +0200 (CEST)
Received: from localhost ([::1]:42900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4H4B-0002uT-Ga
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 03:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4H0H-0007Kj-Uz
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 03:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4H0G-0000gm-EY
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 03:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655968307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsLWia0bFwHdFX41JUDh3cW2c0Iwy39/DzKdCmHjUis=;
 b=Hruux8sj7AJNzGn8WbSZTa/zAHE0ijHLqXbO/XmFIezoXCkYXNSuHNNOqkG2JXNE04ezuD
 0XHMqCwBRGUZ42sk1bNcpDlp5RKS9XC1WTPImnPtNPA8GJCeWa6AX36by8in9wxyf1OhZo
 jaievgPujAQXxF4V5wlerLxJoT7G3B8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-7uarbxBGOjCtdubkKdSppw-1; Thu, 23 Jun 2022 03:11:37 -0400
X-MC-Unique: 7uarbxBGOjCtdubkKdSppw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D22A1C0518D;
 Thu, 23 Jun 2022 07:11:37 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9514440334F;
 Thu, 23 Jun 2022 07:11:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 1/2] pc-bios/s390-ccw/virtio: Set missing status bits while
 initializing
Date: Thu, 23 Jun 2022 09:11:30 +0200
Message-Id: <20220623071131.412457-2-thuth@redhat.com>
In-Reply-To: <20220623071131.412457-1-thuth@redhat.com>
References: <20220623071131.412457-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

According chapter "3.1.1 Driver Requirements: Device Initialization"
of the Virtio specification (v1.1), a driver for a device has to set
the ACKNOWLEDGE and DRIVER bits in the status field after resetting
the device. The s390-ccw bios skipped these steps so far and seems
like QEMU never cared. Anyway, it's better to follow the spec, so
let's set these bits now in the right spots, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/virtio.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
index 5d2c6e3381..4e85a2eb82 100644
--- a/pc-bios/s390-ccw/virtio.c
+++ b/pc-bios/s390-ccw/virtio.c
@@ -220,7 +220,7 @@ int virtio_run(VDev *vdev, int vqid, VirtioCmd *cmd)
 void virtio_setup_ccw(VDev *vdev)
 {
     int i, rc, cfg_size = 0;
-    unsigned char status = VIRTIO_CONFIG_S_DRIVER_OK;
+    uint8_t status;
     struct VirtioFeatureDesc {
         uint32_t features;
         uint8_t index;
@@ -234,6 +234,10 @@ void virtio_setup_ccw(VDev *vdev)
 
     run_ccw(vdev, CCW_CMD_VDEV_RESET, NULL, 0, false);
 
+    status = VIRTIO_CONFIG_S_ACKNOWLEDGE;
+    rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status), false);
+    IPL_assert(rc == 0, "Could not write ACKNOWLEDGE status to host");
+
     switch (vdev->senseid.cu_model) {
     case VIRTIO_ID_NET:
         vdev->nr_vqs = 2;
@@ -253,6 +257,11 @@ void virtio_setup_ccw(VDev *vdev)
     default:
         panic("Unsupported virtio device\n");
     }
+
+    status |= VIRTIO_CONFIG_S_DRIVER;
+    rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status), false);
+    IPL_assert(rc == 0, "Could not write DRIVER status to host");
+
     IPL_assert(
         run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size, false) == 0,
        "Could not get block device configuration");
@@ -291,9 +300,10 @@ void virtio_setup_ccw(VDev *vdev)
             run_ccw(vdev, CCW_CMD_SET_VQ, &info, sizeof(info), false) == 0,
             "Cannot set VQ info");
     }
-    IPL_assert(
-        run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status), false) == 0,
-        "Could not write status to host");
+
+    status |= VIRTIO_CONFIG_S_DRIVER_OK;
+    rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status), false);
+    IPL_assert(rc == 0, "Could not write DRIVER_OK status to host");
 }
 
 bool virtio_is_supported(SubChannelId schid)
-- 
2.31.1



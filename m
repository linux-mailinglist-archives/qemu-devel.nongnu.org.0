Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDCF55D623
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:16:29 +0200 (CEST)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6B4u-0004cV-SH
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzP-0004Dt-BR
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzN-0008Cv-MK
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656421845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnIq8K47yRUPyVjixpm1UOHdRgzZNEmdcXAHpHp++ig=;
 b=Dgaml56BtKdegdxHnZM0CdX9Dft41805ozalbSrEs3aP8H23nwnE1tCOtXnRtHgDgfPeO5
 URv2rL0cXA2BfvlmIjeNT2dxbD+3SD568T/bjQW0kcy9dbQtrXmGRBRCRBmKciRhTdufl/
 kUVpYcH0ElgQvp56+9Aorux2lXoplmM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-L5KHCe4lOLSQoeFlKx6Jjw-1; Tue, 28 Jun 2022 09:10:41 -0400
X-MC-Unique: L5KHCe4lOLSQoeFlKx6Jjw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79BA23815D33;
 Tue, 28 Jun 2022 13:10:41 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99BFB492C3B;
 Tue, 28 Jun 2022 13:10:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PATCH 06/12] pc-bios/s390-ccw/virtio: Set missing status bits while
 initializing
Date: Tue, 28 Jun 2022 15:10:26 +0200
Message-Id: <20220628131032.213986-7-thuth@redhat.com>
In-Reply-To: <20220628131032.213986-1-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
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



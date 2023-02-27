Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F5F6A40E1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:39:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWboC-0005W3-JE; Mon, 27 Feb 2023 06:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbo9-0005UO-9U
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbo7-0005fL-Ha
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aO3EBuZP2ABmdi0vBlEipdhvCOE2f/2c5NmCr4yWzzE=;
 b=NIj5qutHob3FV2bhnKcM45xRTYCxMUy/o3D+R3gc/3GPNdAmg0AqoK2Svi0PSZUx6edYjj
 CnfEk6AbzoVg56aAVEVxByjnr7L55YfB06MyZTY5l+09AZ0IhpDHfMZ0s5kHLmQVCoetW4
 kI7SPxGetApJUWBsQ0Ms6cr5yV4tfQA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-4CsjKjLZNQKgl1PqBDmo3Q-1; Mon, 27 Feb 2023 06:36:32 -0500
X-MC-Unique: 4CsjKjLZNQKgl1PqBDmo3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 183013C0E445;
 Mon, 27 Feb 2023 11:36:32 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F88D1121314;
 Mon, 27 Feb 2023 11:36:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Farman <farman@linux.ibm.com>
Subject: [PULL 07/33] hw/vfio/ccw: Replace DO_UPCAST(VFIOCCWDevice) by
 VFIO_CCW()
Date: Mon, 27 Feb 2023 12:35:55 +0100
Message-Id: <20230227113621.58468-8-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Use the VFIO_CCW() QOM type-checking macro to avoid DO_UPCAST().

Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230213170145.45666-7-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/vfio/ccw.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index cd66b66742..1e2fce83b0 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -76,8 +76,7 @@ struct VFIODeviceOps vfio_ccw_ops = {
 
 static IOInstEnding vfio_ccw_handle_request(SubchDev *sch)
 {
-    S390CCWDevice *cdev = sch->driver_data;
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(sch->driver_data);
     struct ccw_io_region *region = vcdev->io_region;
     int ret;
 
@@ -125,8 +124,7 @@ again:
 
 static IOInstEnding vfio_ccw_handle_store(SubchDev *sch)
 {
-    S390CCWDevice *cdev = sch->driver_data;
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(sch->driver_data);
     SCHIB *schib = &sch->curr_status;
     struct ccw_schib_region *region = vcdev->schib_region;
     SCHIB *s;
@@ -170,8 +168,7 @@ static IOInstEnding vfio_ccw_handle_store(SubchDev *sch)
 
 static int vfio_ccw_handle_clear(SubchDev *sch)
 {
-    S390CCWDevice *cdev = sch->driver_data;
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(sch->driver_data);
     struct ccw_cmd_region *region = vcdev->async_cmd_region;
     int ret;
 
@@ -210,8 +207,7 @@ again:
 
 static int vfio_ccw_handle_halt(SubchDev *sch)
 {
-    S390CCWDevice *cdev = sch->driver_data;
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(sch->driver_data);
     struct ccw_cmd_region *region = vcdev->async_cmd_region;
     int ret;
 
@@ -251,8 +247,7 @@ again:
 
 static void vfio_ccw_reset(DeviceState *dev)
 {
-    S390CCWDevice *cdev = S390_CCW_DEVICE(dev);
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(dev);
 
     ioctl(vcdev->vdev.fd, VFIO_DEVICE_RESET);
 }
@@ -656,7 +651,7 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
 {
     VFIOGroup *group;
     S390CCWDevice *cdev = S390_CCW_DEVICE(dev);
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(cdev);
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
     Error *err = NULL;
 
@@ -727,7 +722,7 @@ out_err_propagate:
 static void vfio_ccw_unrealize(DeviceState *dev)
 {
     S390CCWDevice *cdev = S390_CCW_DEVICE(dev);
-    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
+    VFIOCCWDevice *vcdev = VFIO_CCW(cdev);
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
     VFIOGroup *group = vcdev->vdev.group;
 
-- 
2.31.1



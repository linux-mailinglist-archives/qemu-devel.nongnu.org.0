Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F05289F4D
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 10:23:45 +0200 (CEST)
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRAAK-0005s4-D9
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 04:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kR9lY-0004dj-3L
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 03:58:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kR9lW-0006lp-49
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 03:58:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602316685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dOm/tm/s7vlLGUaUhM3KYMR3GBBc1c4+MT8F0OlIOdc=;
 b=at5eQ5j6yDb05UdE063CKDDvbfLR1i3hW6bxtze8RpVC1xoa2oj7KV8mMHJtu6Ww0/xNEO
 +2R6Nh5LIk2kqGgOIosg66RdPyHAtKELdQ3nkVCgDZ6Dt2iC8+8a8KxHJHtpHX358AT9gl
 RPf1Ojnej0teNa7xCDbo/cHy+tlYbDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108--Kt5wDJgOo2un513F5vyfA-1; Sat, 10 Oct 2020 03:58:02 -0400
X-MC-Unique: -Kt5wDJgOo2un513F5vyfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FBF8805F0D
 for <qemu-devel@nongnu.org>; Sat, 10 Oct 2020 07:58:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B79B1002393;
 Sat, 10 Oct 2020 07:58:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/39] scsi/scsi-bus: scsi_device_find: don't return unrealized
 devices
Date: Sat, 10 Oct 2020 03:57:35 -0400
Message-Id: <20201010075739.951385-36-pbonzini@redhat.com>
In-Reply-To: <20201010075739.951385-1-pbonzini@redhat.com>
References: <20201010075739.951385-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/10 03:36:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device core first places a device on the bus and then realizes it.
Make scsi_device_find avoid returing such devices to avoid
races in drivers that use an iothread (currently virtio-scsi)

Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1812399

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20200913160259.32145-7-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201006123904.610658-11-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-bus.c | 83 +++++++++++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 30 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 4ab9811cd8..7599113efe 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -24,6 +24,55 @@ static void scsi_target_free_buf(SCSIRequest *req);
 
 static int next_scsi_bus;
 
+static SCSIDevice *do_scsi_device_find(SCSIBus *bus,
+                                       int channel, int id, int lun,
+                                       bool include_unrealized)
+{
+    BusChild *kid;
+    SCSIDevice *retval = NULL;
+
+    QTAILQ_FOREACH_RCU(kid, &bus->qbus.children, sibling) {
+        DeviceState *qdev = kid->child;
+        SCSIDevice *dev = SCSI_DEVICE(qdev);
+
+        if (dev->channel == channel && dev->id == id) {
+            if (dev->lun == lun) {
+                retval = dev;
+                break;
+            }
+
+            /*
+             * If we don't find exact match (channel/bus/lun),
+             * we will return the first device which matches channel/bus
+             */
+
+            if (!retval) {
+                retval = dev;
+            }
+        }
+    }
+
+    /*
+     * This function might run on the IO thread and we might race against
+     * main thread hot-plugging the device.
+     * We assume that as soon as .realized is set to true we can let
+     * the user access the device.
+     */
+
+    if (retval && !include_unrealized &&
+        !qatomic_load_acquire(&retval->qdev.realized)) {
+        retval = NULL;
+    }
+
+    return retval;
+}
+
+SCSIDevice *scsi_device_find(SCSIBus *bus, int channel, int id, int lun)
+{
+    RCU_READ_LOCK_GUARD();
+    return do_scsi_device_find(bus, channel, id, lun, false);
+}
+
 static void scsi_device_realize(SCSIDevice *s, Error **errp)
 {
     SCSIDeviceClass *sc = SCSI_DEVICE_GET_CLASS(s);
@@ -137,7 +186,10 @@ static bool scsi_bus_is_address_free(SCSIBus *bus,
 				     int channel, int target, int lun,
 				     SCSIDevice **p_dev)
 {
-    SCSIDevice *d = scsi_device_find(bus, channel, target, lun);
+    SCSIDevice *d;
+
+    RCU_READ_LOCK_GUARD();
+    d = do_scsi_device_find(bus, channel, target, lun, true);
     if (d && d->lun == lun) {
         if (p_dev) {
             *p_dev = d;
@@ -1570,35 +1622,6 @@ static char *scsibus_get_fw_dev_path(DeviceState *dev)
                            qdev_fw_name(dev), d->id, d->lun);
 }
 
-SCSIDevice *scsi_device_find(SCSIBus *bus, int channel, int id, int lun)
-{
-    BusChild *kid;
-    SCSIDevice *target_dev = NULL;
-
-    RCU_READ_LOCK_GUARD();
-    QTAILQ_FOREACH_RCU(kid, &bus->qbus.children, sibling) {
-        DeviceState *qdev = kid->child;
-        SCSIDevice *dev = SCSI_DEVICE(qdev);
-
-        if (dev->channel == channel && dev->id == id) {
-            if (dev->lun == lun) {
-                return dev;
-            }
-
-            /*
-             * If we don't find exact match (channel/bus/lun),
-             * we will return the first device which matches channel/bus
-             */
-
-            if (!target_dev) {
-                target_dev = dev;
-            }
-        }
-    }
-
-    return target_dev;
-}
-
 /* SCSI request list.  For simplicity, pv points to the whole device */
 
 static int put_scsi_requests(QEMUFile *f, void *pv, size_t size,
-- 
2.26.2




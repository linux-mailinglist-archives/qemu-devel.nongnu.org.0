Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA04859B5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:00:21 +0100 (CET)
Received: from localhost ([::1]:60806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5CSK-0004xF-B9
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:00:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1n5CPE-0001pq-IG
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:57:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1n5CPB-0004xQ-ID
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641412624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xinduQ+JDgJIRvz+qrgEapQTR3szJWe1SLpGJIiKWjY=;
 b=MH/WokX4vKBExlZ3ZGoNADkcY+oCLVQALvc+WxraaIzmhg3ZYqCo7AimoDuHt10+A0AgfS
 tI6v5ljEo3EK+mivoeurdnexwDKnFkwCDPMmXUhae1gZB5Pz4j9GtatUOqAsO/4g/x1NeI
 BaeZQ/R7nOtCLAAqBO3NNIWWvxZTAxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-1hG5vrzUN3-37cDSHhdUNA-1; Wed, 05 Jan 2022 14:57:01 -0500
X-MC-Unique: 1hG5vrzUN3-37cDSHhdUNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1B8764083;
 Wed,  5 Jan 2022 19:57:00 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A04D5BE14;
 Wed,  5 Jan 2022 19:56:43 +0000 (UTC)
Subject: [PATCH] vfio/pci: Generate more relevant log messages for reset
 failures
From: Alex Williamson <alex.williamson@redhat.com>
To: alex.williamson@redhat.com, qemu-devel@nongnu.org
Date: Wed, 05 Jan 2022 12:56:42 -0700
Message-ID: <164141259622.4193261.8252690438434562107.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VFIO_DEVICE_RESET ioctl might be backed by several different reset
methods, including a device specific reset (ie. custom reset code in
kernel), an ACPI reset (ie. custom reset code in firmware), FLR, PM,
and bus resets.  This listing is also the default priority order used
by the kernel for trying reset methods.  Traditionally we've had some
FUD regarding the PM reset as the extent of a "Soft Reset" is not well
defined in the PCI specification.  Therefore we try to guess what type
of reset a device might use for the VFIO_DEVICE_RESET and insert a bus
reset via the vfio hot reset interface if we think it could be a PM
reset.

This results in a couple odd tests for PM reset in our hot reset code,
as we assume if we don't detect has_pm_reset support that we can't
reset the device otherwise.  Starting with kernel v5.15, the kernel
exposes a sysfs attribute for devices that can tell us the priority
order for device resets, so long term (not implemented here) we no
longer need to play this guessing game, and if permissions allow we
could manipulate the order ourselves so that we don't need to inject
our own hot reset.

In the shorter term, implemented here, let's not assume we're out of
reset methods if we can't perform a hot reset and the device doesn't
support PM reset.  We can use reset_works as the authority, which
allows us to generate more comprehensible error messages for the case
when it actually doesn't work.

The impetus for this change is a result of commit d5daff7d3126 ("pcie:
implement slot power control for pcie root ports"), where powering off
a slot now results in a device reset.  If the slot is powered off as a
result of qdev_unplug() via the device request event, that device
request is potentially the result of an unbind operation in the host.
That unbind operation holds the kernel device lock, which causes the
VFIO_DEVICE_RESET ioctl to fail (or in the case of some kernels, has
cleared the flag indicating support of a device reset function).  We
can then end up with an SR-IOV VF device trying to trigger a hot reset,
which finds that it needs ownership of the PF group to perform such a
reset, resulting in confusing log messages.

Ultimately the above commit still introduces a log message that we
didn't have prior on such an unplug, but it's not unjustified to
perform such a reset, though it might be considered unnecessary.
Arguably failure to reset the device should always generate some sort
of meaningful log message.

Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |   44 ++++++++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7b45353ce27f..ea697951556e 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2224,7 +2224,7 @@ static int vfio_pci_hot_reset(VFIOPCIDevice *vdev, bool single)
     ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_PCI_HOT_RESET_INFO, info);
     if (ret && errno != ENOSPC) {
         ret = -errno;
-        if (!vdev->has_pm_reset) {
+        if (!vdev->vbasedev.reset_works) {
             error_report("vfio: Cannot reset device %s, "
                          "no available reset mechanism.", vdev->vbasedev.name);
         }
@@ -2270,7 +2270,7 @@ static int vfio_pci_hot_reset(VFIOPCIDevice *vdev, bool single)
         }
 
         if (!group) {
-            if (!vdev->has_pm_reset) {
+            if (!vdev->vbasedev.reset_works) {
                 error_report("vfio: Cannot reset device %s, "
                              "depends on group %d which is not owned.",
                              vdev->vbasedev.name, devices[i].group_id);
@@ -3162,6 +3162,8 @@ static void vfio_exitfn(PCIDevice *pdev)
 static void vfio_pci_reset(DeviceState *dev)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(dev);
+    Error *err = NULL;
+    int ret;
 
     trace_vfio_pci_reset(vdev->vbasedev.name);
 
@@ -3175,26 +3177,44 @@ static void vfio_pci_reset(DeviceState *dev)
         goto post_reset;
     }
 
-    if (vdev->vbasedev.reset_works &&
-        (vdev->has_flr || !vdev->has_pm_reset) &&
-        !ioctl(vdev->vbasedev.fd, VFIO_DEVICE_RESET)) {
-        trace_vfio_pci_reset_flr(vdev->vbasedev.name);
-        goto post_reset;
+    if (vdev->vbasedev.reset_works && (vdev->has_flr || !vdev->has_pm_reset)) {
+        if (!ioctl(vdev->vbasedev.fd, VFIO_DEVICE_RESET)) {
+            trace_vfio_pci_reset_flr(vdev->vbasedev.name);
+            goto post_reset;
+        }
+
+        error_setg_errno(&err, errno, "Unable to reset device");
     }
 
     /* See if we can do our own bus reset */
-    if (!vfio_pci_hot_reset_one(vdev)) {
+    ret = vfio_pci_hot_reset_one(vdev);
+    if (!ret) {
         goto post_reset;
     }
 
+    if (!err) {
+        error_setg_errno(&err, -ret, "Unable to perform bus reset");
+    }
+
     /* If nothing else works and the device supports PM reset, use it */
-    if (vdev->vbasedev.reset_works && vdev->has_pm_reset &&
-        !ioctl(vdev->vbasedev.fd, VFIO_DEVICE_RESET)) {
-        trace_vfio_pci_reset_pm(vdev->vbasedev.name);
-        goto post_reset;
+    if (vdev->vbasedev.reset_works && vdev->has_pm_reset) {
+        /* Prefer to report the ioctl failure mode */
+        error_free(err);
+        err = NULL;
+
+        if (!ioctl(vdev->vbasedev.fd, VFIO_DEVICE_RESET)) {
+            trace_vfio_pci_reset_pm(vdev->vbasedev.name);
+            goto post_reset;
+        }
+
+        error_setg_errno(&err, errno, "Unable to reset device");
     }
 
+    warn_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+    err = NULL;
+
 post_reset:
+    error_free(err);
     vfio_pci_post_reset(vdev);
 }
 




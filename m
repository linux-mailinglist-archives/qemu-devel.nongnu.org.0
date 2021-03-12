Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE25A3381AC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:47:06 +0100 (CET)
Received: from localhost ([::1]:51276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKV1F-0004WH-QG
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lKUyb-0002He-4T
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:44:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lKUyZ-00037k-H3
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615506258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGKumofSyDRNMewvMjP3qpQZbEzggO4H0ygVMvhvFSY=;
 b=Dt1FGF2oue0lTA2ySY0OQQ5vcJ4/HOH00FDlrAmHdpAH5IpCzD4KoVTwKLH+uHcS/GOePL
 zg4aeK9IesL1HMvcbxv+PI+HKQEZdmd2EVYGaYbrxtG8xEGFeVTgkzcaiTPx9txk0UnTHb
 AYuROUayFa8vIklYabdkiSQiYhqnyls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-wwYlT6NrNCWjtrimyWEt_g-1; Thu, 11 Mar 2021 18:44:16 -0500
X-MC-Unique: wwYlT6NrNCWjtrimyWEt_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3151A100C660;
 Thu, 11 Mar 2021 23:44:15 +0000 (UTC)
Received: from gimli.home (ovpn-112-255.phx2.redhat.com [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C70CC19C47;
 Thu, 11 Mar 2021 23:44:11 +0000 (UTC)
Subject: [PULL 06/10] vfio: Move the saving of the config space to the right
 place in VFIO migration
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Mar 2021 16:44:11 -0700
Message-ID: <161550625144.21070.15676048812662873128.stgit@gimli.home>
In-Reply-To: <161550593889.21070.5662039089881992714.stgit@gimli.home>
References: <161550593889.21070.5662039089881992714.stgit@gimli.home>
User-Agent: StGit/0.21-2-g8ef5
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Shenming Lu <lushenming@huawei.com>, Kirti Wankhede <kwankhede@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shenming Lu <lushenming@huawei.com>

On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
setup, if the restoring of the VFIO PCI device config space is
before the VGIC, an error might occur in the kernel.

So we move the saving of the config space to the non-iterable
process, thus it will be called after the VGIC according to
their priorities.

As for the possible dependence of the device specific migration
data on it's config space, we can let the vendor driver to
include any config info it needs in its own data stream.

Signed-off-by: Shenming Lu <lushenming@huawei.com>
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
Message-Id: <20210310030233.1133-2-lushenming@huawei.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/migration.c |   25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 134bdccc4f8b..003786f3cd9a 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -575,11 +575,6 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_save_device_config_state(f, opaque);
-    if (ret) {
-        return ret;
-    }
-
     ret = vfio_update_pending(vbasedev);
     if (ret) {
         return ret;
@@ -620,6 +615,19 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     return ret;
 }
 
+static void vfio_save_state(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    int ret;
+
+    ret = vfio_save_device_config_state(f, opaque);
+    if (ret) {
+        error_report("%s: Failed to save device config space",
+                     vbasedev->name);
+        qemu_file_set_error(f, ret);
+    }
+}
+
 static int vfio_load_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -670,11 +678,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
         switch (data) {
         case VFIO_MIG_FLAG_DEV_CONFIG_STATE:
         {
-            ret = vfio_load_device_config_state(f, opaque);
-            if (ret) {
-                return ret;
-            }
-            break;
+            return vfio_load_device_config_state(f, opaque);
         }
         case VFIO_MIG_FLAG_DEV_SETUP_STATE:
         {
@@ -720,6 +724,7 @@ static SaveVMHandlers savevm_vfio_handlers = {
     .save_live_pending = vfio_save_pending,
     .save_live_iterate = vfio_save_iterate,
     .save_live_complete_precopy = vfio_save_complete_precopy,
+    .save_state = vfio_save_state,
     .load_setup = vfio_load_setup,
     .load_cleanup = vfio_load_cleanup,
     .load_state = vfio_load_state,



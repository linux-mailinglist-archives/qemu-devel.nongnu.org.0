Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC243FDE02
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:50:43 +0200 (CEST)
Received: from localhost ([::1]:37518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRZa-0000gS-62
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLMEE-0003Zo-KY
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:18 -0400
Received: from relay.sw.ru ([185.231.240.75]:35396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME6-0005OV-5U
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=5VSyo9u1as5v2w8EoWPqVnnzXFcNIWYd4SGEqLo2lYo=; b=s70xStYQPV9z
 wbR6d9Anr+ufJyVchI6YRZ4UwYsHkvTR/Jn6DWtThhIjGur4q+qsVmrh9IqTwg10fcSRngdv9PnCy
 Z1yRbC4RKLT5ESuajMCGrtkLktj/xo948pcNPMSWwO9Rk8rPHSZQBh/eVjQlKiK8DIxdjBcYnFnif
 I0V8U=;
Received: from [192.168.15.100] (helo=max-Swift-SF314-57.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME0-000RwD-TB; Wed, 01 Sep 2021 12:08:04 +0300
From: Maxim Davydov <maxim.davydov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@openvz.org, mst@redhat.com, stefanha@redhat.com, fam@euphon.net,
 amit@kernel.org, kraxel@redhat.com, berrange@redhat.com,
 Maxim Davydov <maxim.davydov@virtuozzo.com>
Subject: [PATCH v1 6/8] scsi: Add tracking of the acknowledged feature bits
Date: Wed,  1 Sep 2021 12:08:02 +0300
Message-Id: <20210901090804.7139-7-maxim.davydov@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
References: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=maxim.davydov@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Sep 2021 10:43:12 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add tracking of the VIRTIO_SCSI_F_HOTPLUG, VIRTIO_SCSI_F_CHANGE and
VIRTIO_SCSI_F_T10_PI bits acknowledged by the guest

Signed-off-by: Maxim Davydov <maxim.davydov@virtuozzo.com>
---
 hw/scsi/vhost-scsi.c      |  6 +++---
 hw/scsi/vhost-user-scsi.c | 18 +++++++++---------
 hw/scsi/virtio-scsi.c     | 10 ++++++----
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 8c611bf..4530295 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -277,9 +277,9 @@ static Property vhost_scsi_properties[] = {
     DEFINE_PROP_UINT32("max_sectors", VirtIOSCSICommon, conf.max_sectors,
                        0xFFFF),
     DEFINE_PROP_UINT32("cmd_per_lun", VirtIOSCSICommon, conf.cmd_per_lun, 128),
-    DEFINE_PROP_BIT64("t10_pi", VHostSCSICommon, host_features,
-                                                 VIRTIO_SCSI_F_T10_PI,
-                                                 false),
+    DEFINE_VIRTIO_FEATURE_BIT64("t10_pi", VHostSCSICommon,
+                                host_features, dev.acked_features,
+                                VIRTIO_SCSI_F_T10_PI, false),
     DEFINE_PROP_BOOL("migratable", VHostSCSICommon, migratable, false),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 1b2f7ee..40f885d 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -168,15 +168,15 @@ static Property vhost_user_scsi_properties[] = {
     DEFINE_PROP_UINT32("max_sectors", VirtIOSCSICommon, conf.max_sectors,
                        0xFFFF),
     DEFINE_PROP_UINT32("cmd_per_lun", VirtIOSCSICommon, conf.cmd_per_lun, 128),
-    DEFINE_PROP_BIT64("hotplug", VHostSCSICommon, host_features,
-                                                  VIRTIO_SCSI_F_HOTPLUG,
-                                                  true),
-    DEFINE_PROP_BIT64("param_change", VHostSCSICommon, host_features,
-                                                       VIRTIO_SCSI_F_CHANGE,
-                                                       true),
-    DEFINE_PROP_BIT64("t10_pi", VHostSCSICommon, host_features,
-                                                 VIRTIO_SCSI_F_T10_PI,
-                                                 false),
+    DEFINE_VIRTIO_FEATURE_BIT64("hotplug", VHostSCSICommon,
+                                host_features, dev.acked_features,
+                                VIRTIO_SCSI_F_HOTPLUG, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("param_change", VHostSCSICommon,
+                                host_features, dev.acked_features,
+                                VIRTIO_SCSI_F_CHANGE, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("t10_pi", VHostSCSICommon,
+                                host_features, dev.acked_features,
+                                VIRTIO_SCSI_F_T10_PI, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 6d80730..8f7dd14 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -1061,10 +1061,12 @@ static Property virtio_scsi_properties[] = {
                                                   0xFFFF),
     DEFINE_PROP_UINT32("cmd_per_lun", VirtIOSCSI, parent_obj.conf.cmd_per_lun,
                                                   128),
-    DEFINE_PROP_BIT("hotplug", VirtIOSCSI, host_features,
-                                           VIRTIO_SCSI_F_HOTPLUG, true),
-    DEFINE_PROP_BIT("param_change", VirtIOSCSI, host_features,
-                                                VIRTIO_SCSI_F_CHANGE, true),
+    DEFINE_VIRTIO_FEATURE_BIT("hotplug", VirtIOSCSI, host_features,
+                              parent_obj.parent_obj.guest_features,
+                              VIRTIO_SCSI_F_HOTPLUG, true),
+    DEFINE_VIRTIO_FEATURE_BIT("param_change", VirtIOSCSI, host_features,
+                              parent_obj.parent_obj.guest_features,
+                              VIRTIO_SCSI_F_CHANGE, true),
     DEFINE_PROP_LINK("iothread", VirtIOSCSI, parent_obj.conf.iothread,
                      TYPE_IOTHREAD, IOThread *),
     DEFINE_PROP_END_OF_LIST(),
-- 
1.8.3.1



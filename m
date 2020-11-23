Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C041E2C1278
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 18:59:26 +0100 (CET)
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khG7Z-0007D7-T3
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 12:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1khG5U-0005qu-NK
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 12:57:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1khG5S-000549-TT
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 12:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606154234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UwUGlNM+z9rXlSDEo1nPnLGGKPkrPBQ5++L+PrPDKcM=;
 b=AtzcYUJxlrq81buShpkHBwFnLI/i5wUyit+0l6txXJpjzewQ0K7mccLfmHCm2N/FnLOlRg
 Vb59Sqe8Ooea0HKzqe/OhxWRqQ7Z7Z5/7LL/QDsHl0PMJ4rFMNzgK4bhdXfukAFsCbH0qW
 fIPwCYSSzk9CnkgRWWBoumnoNDiY3eQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-9PpXi7hNMFyL2qCmoKNv-A-1; Mon, 23 Nov 2020 12:57:09 -0500
X-MC-Unique: 9PpXi7hNMFyL2qCmoKNv-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E1995212;
 Mon, 23 Nov 2020 17:57:08 +0000 (UTC)
Received: from gimli.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16F095D9CC;
 Mon, 23 Nov 2020 17:57:05 +0000 (UTC)
Subject: [PULL 2/2] vfio: Change default dirty pages tracking behavior
 during migration
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 23 Nov 2020 10:57:04 -0700
Message-ID: <160615422468.26810.11297474908661737858.stgit@gimli.home>
In-Reply-To: <160615410107.26810.2586812803373008210.stgit@gimli.home>
References: <160615410107.26810.2586812803373008210.stgit@gimli.home>
User-Agent: StGit/0.21-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kirti Wankhede <kwankhede@nvidia.com>

By default dirty pages tracking is enabled during iterative phase
(pre-copy phase).
Added per device opt-out option 'x-pre-copy-dirty-page-tracking' to
disable dirty pages tracking during iterative phase. If the option
'x-pre-copy-dirty-page-tracking=off' is set for any VFIO device, dirty
pages tracking during iterative phase will be disabled.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c              |   11 +++++++----
 hw/vfio/pci.c                 |    3 +++
 include/hw/vfio/vfio-common.h |    1 +
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index c1fdbf17f2e6..6ff1daa763f8 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -311,7 +311,7 @@ bool vfio_mig_active(void)
     return true;
 }
 
-static bool vfio_devices_all_stopped_and_saving(VFIOContainer *container)
+static bool vfio_devices_all_saving(VFIOContainer *container)
 {
     VFIOGroup *group;
     VFIODevice *vbasedev;
@@ -329,8 +329,11 @@ static bool vfio_devices_all_stopped_and_saving(VFIOContainer *container)
                 return false;
             }
 
-            if ((migration->device_state & VFIO_DEVICE_STATE_SAVING) &&
-                !(migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
+            if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
+                if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
+                    && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
+                        return false;
+                }
                 continue;
             } else {
                 return false;
@@ -1125,7 +1128,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
         return;
     }
 
-    if (vfio_devices_all_stopped_and_saving(container)) {
+    if (vfio_devices_all_saving(container)) {
         vfio_sync_dirty_bitmap(container, section);
     }
 }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1349b900e513..51dc37369504 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3182,6 +3182,9 @@ static void vfio_instance_init(Object *obj)
 static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
     DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
+    DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
+                            vbasedev.pre_copy_dirty_page_tracking,
+                            ON_OFF_AUTO_ON),
     DEFINE_PROP_ON_OFF_AUTO("display", VFIOPCIDevice,
                             display, ON_OFF_AUTO_OFF),
     DEFINE_PROP_UINT32("xres", VFIOPCIDevice, display_xres, 0),
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 2119872c8af1..6141162d7aea 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -130,6 +130,7 @@ typedef struct VFIODevice {
     unsigned int flags;
     VFIOMigration *migration;
     Error *migration_blocker;
+    OnOffAuto pre_copy_dirty_page_tracking;
 } VFIODevice;
 
 struct VFIODeviceOps {



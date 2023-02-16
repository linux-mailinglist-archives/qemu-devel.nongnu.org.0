Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751D269A209
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:03:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnH2-000234-TP; Thu, 16 Feb 2023 18:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnGo-00022f-Ou
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:02:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnGn-0005ac-5B
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676588548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EF1466CFA5bZYnbRW9vZlNZkS6xgeBfWu8B+++cAwhU=;
 b=YYTemMcp3R4xlqo2mRwQPRSayvl5VnfEO/mFD0UyGi0oAhKpiyxDUeW/UdecpdaOlTb5tX
 mQUQvJ9GzzzN/84mgN0rwssmDzJehX5pre+wYXPP0NcmMXvfrBOArVlMKTjNnS3MYhqL+e
 PLYnRuBI7T5mHvq9IM3YwspkcNbwQrI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-jHhx6ew2MCqmKl6xJzeqwg-1; Thu, 16 Feb 2023 18:02:24 -0500
X-MC-Unique: jHhx6ew2MCqmKl6xJzeqwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F52D85CBE0;
 Thu, 16 Feb 2023 23:02:24 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21951140EBF6;
 Thu, 16 Feb 2023 23:02:24 +0000 (UTC)
Subject: [PULL 06/12] vfio/migration: Move migration v1 logic to
 vfio_migration_init()
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com
Date: Thu, 16 Feb 2023 16:02:23 -0700
Message-ID: <167658854369.932837.1986645492026155917.stgit@omen>
In-Reply-To: <167658846945.932837.1420176491103357684.stgit@omen>
References: <167658846945.932837.1420176491103357684.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

From: Avihai Horon <avihaih@nvidia.com>

Move vfio_dev_get_region_info() logic from vfio_migration_probe() to
vfio_migration_init(). This logic is specific to v1 protocol and moving
it will make it easier to add the v2 protocol implementation later.
No functional changes intended.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Link: https://lore.kernel.org/r/20230216143630.25610-7-avihaih@nvidia.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/migration.c  |   30 +++++++++++++++---------------
 hw/vfio/trace-events |    2 +-
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 8e9699966962..a3bf7327a1d6 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -786,14 +786,14 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
     vbasedev->migration = NULL;
 }
 
-static int vfio_migration_init(VFIODevice *vbasedev,
-                               struct vfio_region_info *info)
+static int vfio_migration_init(VFIODevice *vbasedev)
 {
     int ret;
     Object *obj;
     VFIOMigration *migration;
     char id[256] = "";
     g_autofree char *path = NULL, *oid = NULL;
+    struct vfio_region_info *info;
 
     if (!vbasedev->ops->vfio_get_object) {
         return -EINVAL;
@@ -804,6 +804,14 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         return -EINVAL;
     }
 
+    ret = vfio_get_dev_region_info(vbasedev,
+                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
+                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
+                                   &info);
+    if (ret) {
+        return ret;
+    }
+
     vbasedev->migration = g_new0(VFIOMigration, 1);
     vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
     vbasedev->migration->vm_running = runstate_is_running();
@@ -823,6 +831,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         goto err;
     }
 
+    g_free(info);
+
     migration = vbasedev->migration;
     migration->vbasedev = vbasedev;
 
@@ -845,6 +855,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     return 0;
 
 err:
+    g_free(info);
     vfio_migration_exit(vbasedev);
     return ret;
 }
@@ -858,22 +869,13 @@ int64_t vfio_mig_bytes_transferred(void)
 
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
-    struct vfio_region_info *info = NULL;
     int ret = -ENOTSUP;
 
     if (!vbasedev->enable_migration) {
         goto add_blocker;
     }
 
-    ret = vfio_get_dev_region_info(vbasedev,
-                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
-                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
-                                   &info);
-    if (ret) {
-        goto add_blocker;
-    }
-
-    ret = vfio_migration_init(vbasedev, info);
+    ret = vfio_migration_init(vbasedev);
     if (ret) {
         goto add_blocker;
     }
@@ -883,14 +885,12 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         return ret;
     }
 
-    trace_vfio_migration_probe(vbasedev->name, info->index);
-    g_free(info);
+    trace_vfio_migration_probe(vbasedev->name);
     return 0;
 
 add_blocker:
     error_setg(&vbasedev->migration_blocker,
                "VFIO device doesn't support migration");
-    g_free(info);
 
     ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
     if (ret < 0) {
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 90a8aecb3765..6be5381cc973 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -148,7 +148,7 @@ vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
 vfio_display_edid_write_error(void) ""
 
 # migration.c
-vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
+vfio_migration_probe(const char *name) " (%s)"
 vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
 vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"




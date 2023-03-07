Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91976AF28E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:53:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZcRT-0004Ot-Ri; Tue, 07 Mar 2023 13:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcRR-00045Y-8u
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcRP-0002XY-LT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678215219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HDxzIIAmflIxpAmZ+98ffek6UCP+ID0KsU98PZI4+HA=;
 b=OdgDhE7qYEmeYceMlVvR8UJXjVhJKqqXm4u4+JpPLCDVa8h7YKMDc7CbDw+xu87EHZRBU1
 oElE4ofsEQWWXyGitGUD9lGg59jwgFTSxoEeBwDAB5X487tknOpeLdeTMUv9jZC3T8lbIE
 CabFUaGMXpaD26b9JL/l/D991E8qW24=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-C4suByXdNU-yyl8mWNankg-1; Tue, 07 Mar 2023 13:53:36 -0500
X-MC-Unique: C4suByXdNU-yyl8mWNankg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 863BC3850541;
 Tue,  7 Mar 2023 18:53:34 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.16.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D551C15BA0;
 Tue,  7 Mar 2023 18:53:34 +0000 (UTC)
Subject: [PULL 13/17] vfio/migration: Block migration with vIOMMU
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com,
 joao.m.martins@oracle.com
Date: Tue, 07 Mar 2023 11:53:33 -0700
Message-ID: <167821521373.619792.5140950265708875301.stgit@omen>
In-Reply-To: <167821508699.619792.1719671327865445814.stgit@omen>
References: <167821508699.619792.1719671327865445814.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

From: Joao Martins <joao.m.martins@oracle.com>

Migrating with vIOMMU will require either tracking maximum
IOMMU supported address space (e.g. 39/48 address width on Intel)
or range-track current mappings and dirty track the new ones
post starting dirty tracking. This will be done as a separate
series, so add a live migration blocker until that is fixed.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20230307125450.62409-14-joao.m.martins@oracle.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c              |   46 +++++++++++++++++++++++++++++++++++++++++
 hw/vfio/migration.c           |    5 ++++
 hw/vfio/pci.c                 |    1 +
 include/hw/vfio/vfio-common.h |    2 ++
 4 files changed, 54 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 334c62585829..539246e332b0 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -362,6 +362,7 @@ bool vfio_mig_active(void)
 }
 
 static Error *multiple_devices_migration_blocker;
+static Error *giommu_migration_blocker;
 
 static unsigned int vfio_migratable_device_num(void)
 {
@@ -413,6 +414,51 @@ void vfio_unblock_multiple_devices_migration(void)
     multiple_devices_migration_blocker = NULL;
 }
 
+static bool vfio_viommu_preset(void)
+{
+    VFIOAddressSpace *space;
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        if (space->as != &address_space_memory) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+int vfio_block_giommu_migration(Error **errp)
+{
+    int ret;
+
+    if (giommu_migration_blocker ||
+        !vfio_viommu_preset()) {
+        return 0;
+    }
+
+    error_setg(&giommu_migration_blocker,
+               "Migration is currently not supported with vIOMMU enabled");
+    ret = migrate_add_blocker(giommu_migration_blocker, errp);
+    if (ret < 0) {
+        error_free(giommu_migration_blocker);
+        giommu_migration_blocker = NULL;
+    }
+
+    return ret;
+}
+
+void vfio_unblock_giommu_migration(void)
+{
+    if (!giommu_migration_blocker ||
+        vfio_viommu_preset()) {
+        return;
+    }
+
+    migrate_del_blocker(giommu_migration_blocker);
+    error_free(giommu_migration_blocker);
+    giommu_migration_blocker = NULL;
+}
+
 static void vfio_set_migration_error(int err)
 {
     MigrationState *ms = migrate_get_current();
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index a2c3d9bade7f..776fd2d7cdf3 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -634,6 +634,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         return ret;
     }
 
+    ret = vfio_block_giommu_migration(errp);
+    if (ret) {
+        return ret;
+    }
+
     trace_vfio_migration_probe(vbasedev->name);
     return 0;
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a9e..30a271eab38c 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3185,6 +3185,7 @@ static void vfio_instance_finalize(Object *obj)
      */
     vfio_put_device(vdev);
     vfio_put_group(group);
+    vfio_unblock_giommu_migration();
 }
 
 static void vfio_exitfn(PCIDevice *pdev)
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 9551d2d43025..009bec34c4bc 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -222,6 +222,8 @@ extern VFIOGroupList vfio_group_list;
 bool vfio_mig_active(void);
 int vfio_block_multiple_devices_migration(Error **errp);
 void vfio_unblock_multiple_devices_migration(void);
+int vfio_block_giommu_migration(Error **errp);
+void vfio_unblock_giommu_migration(void);
 int64_t vfio_mig_bytes_transferred(void);
 
 #ifdef CONFIG_LINUX




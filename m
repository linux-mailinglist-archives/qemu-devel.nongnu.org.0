Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E89653230C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:23:36 +0200 (CEST)
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntNx8-00025Z-Ms
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNt0-0007jR-BE
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:18 -0400
Received: from mga17.intel.com ([192.55.52.151]:41945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNsy-0000EA-Fv
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373156; x=1684909156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vv7gnOasp6/ZZp3HaPei/aQKyYTdtUk1origL7k3ekM=;
 b=Mt1Yiby3fSnbReYn9ky7DEKB8Rs2lkh3QFA6p2HVcFPZP228V2JqElxJ
 0m2jGh5J9bUQbAuy8evckEj3z+h2F56GgxxLjqqPM3vXWkSriJkpreqCs
 goPTA+RvtFOowaUG9et8KyImJCamT3Bww+zgDz3T/DT0RRrKGY2/NvaW4
 BmgQLWFvRcr5lCC06zVXcpcvYuKuF47lwq5DfFRsHmN8bMsooz1cSORgy
 OvbwrSwPKljcTb4N5Rl3eQnzfcxC5K8lP98mF3y4i9t/vVVCoNBVxSsTH
 sJDPSgPVuOKO5YdyLeWahXeIK8SkBWub5e0SDVimzC/eFlMNb91xskKf+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943179"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943179"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059662"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:11 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 03/13] vfio/migration: move vfio_get_dev_region_info out
 of vfio_migration_probe
Date: Tue, 24 May 2022 14:18:38 +0800
Message-Id: <20220524061848.1615706-4-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524061848.1615706-1-lei.rao@intel.com>
References: <20220524061848.1615706-1-lei.rao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

vfio_get_dev_region_info() in vfio_migration_probe() is a specific operation of
In-Band approach.  So, it's better to put it in vfio_migration_init() because
most of the setup of In-Band approach are handled there. The vfio_migration_init
will be rename to vfio_migration_probe_local().

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 hw/vfio/migration.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 11ce87bb1a..e61c19171a 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -802,12 +802,12 @@ static int vfio_migration_check(VFIODevice *vbasedev)
     return 0;
 }
 
-static int vfio_migration_init(VFIODevice *vbasedev,
-                               struct vfio_region_info *info)
+static int vfio_migration_init(VFIODevice *vbasedev)
 {
     int ret;
     Object *obj;
     char id[256] = "";
+    struct vfio_region_info *info = NULL;
     g_autofree char *path = NULL, *oid = NULL;
     VFIOMigration *migration = vbasedev->migration;
 
@@ -816,6 +816,14 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         return -EINVAL;
     }
 
+    ret = vfio_get_dev_region_info(vbasedev,
+                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
+                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
+                                   &info);
+    if (ret) {
+        return -EINVAL;
+    }
+
     ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
                             info->index, "migration");
     if (ret) {
@@ -847,10 +855,14 @@ static int vfio_migration_init(VFIODevice *vbasedev,
                                                            vbasedev);
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);
+
+    trace_vfio_migration_probe(vbasedev->name, info->index);
+    g_free(info);
     return 0;
 
 err:
     vfio_migration_exit(vbasedev);
+    g_free(info);
     return ret;
 }
 
@@ -863,7 +875,6 @@ int64_t vfio_mig_bytes_transferred(void)
 
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
-    struct vfio_region_info *info = NULL;
     int ret = -ENOTSUP;
 
     ret = vfio_migration_check(vbasedev);
@@ -874,27 +885,16 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
     vbasedev->migration = g_new0(VFIOMigration, 1);
     vbasedev->migration->vbasedev = vbasedev;
 
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
 
-    trace_vfio_migration_probe(vbasedev->name, info->index);
-    g_free(info);
     return 0;
 
 add_blocker:
     error_setg(&vbasedev->migration_blocker,
                "VFIO device doesn't support migration");
-    g_free(info);
 
     ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
     if (ret < 0) {
-- 
2.32.0



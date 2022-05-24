Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBDA53230D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:23:36 +0200 (CEST)
Received: from localhost ([::1]:40354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntNxA-0002ED-06
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNsz-0007jE-S7
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:17 -0400
Received: from mga17.intel.com ([192.55.52.151]:41958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNst-0000Fo-9f
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373151; x=1684909151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ExdLP7W0V6Rn/8DcMpfXQ8tmFgDyolan+OBovJ9wppc=;
 b=DvNoS1Xl06TASXaxSc0Ni3Xw1LQZ54crQV5r1vQGTWNLK/BqR0EGZIPM
 svM5kfBjFRgx7ms0utyp5aCJ8SejKCcLFvxRiXFaowHbOYucA0Q19AW2p
 il73yhTcoxdEkgfNI4T8VSOhwhMAiqfiDAIeN+PZt38zocfjfhD2e4Jxu
 7Voxa7bZ6LhYib/VffNolcomTj/8Jv7Ic9mSjXn/jyTWw2kColxHW0Dhi
 lGrzTJMW1tU5ZdgkUpb5vxg+IJHO3b78n26i8CmPHmKVevXAYR8XgysQt
 XIaHHrwChUWP5InmrOVIyucPymWiiqZZG9a7720xNYBW1P6Fk65vW7Aqp A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943163"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943163"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059640"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:06 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 02/13] vfio/migration: move migration struct allocation
 out of vfio_migration_init
Date: Tue, 24 May 2022 14:18:37 +0800
Message-Id: <20220524061848.1615706-3-lei.rao@intel.com>
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

Migration struct is a common data structure. Memory allocation of migration
struct is not unique to In-Band approach. So, move it from vfio_migration_init()
to vfio_migration_probe().

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 hw/vfio/migration.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 770f535e81..11ce87bb1a 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -807,17 +807,15 @@ static int vfio_migration_init(VFIODevice *vbasedev,
 {
     int ret;
     Object *obj;
-    VFIOMigration *migration;
     char id[256] = "";
     g_autofree char *path = NULL, *oid = NULL;
+    VFIOMigration *migration = vbasedev->migration;
 
     obj = vbasedev->ops->vfio_get_object(vbasedev);
     if (!obj) {
         return -EINVAL;
     }
 
-    vbasedev->migration = g_new0(VFIOMigration, 1);
-
     ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
                             info->index, "migration");
     if (ret) {
@@ -833,9 +831,6 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         goto err;
     }
 
-    migration = vbasedev->migration;
-    migration->vbasedev = vbasedev;
-
     oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
     if (oid) {
         path = g_strdup_printf("%s/vfio", oid);
@@ -876,6 +871,9 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         goto add_blocker;
     }
 
+    vbasedev->migration = g_new0(VFIOMigration, 1);
+    vbasedev->migration->vbasedev = vbasedev;
+
     ret = vfio_get_dev_region_info(vbasedev,
                                    VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
                                    VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
@@ -903,6 +901,8 @@ add_blocker:
         error_free(vbasedev->migration_blocker);
         vbasedev->migration_blocker = NULL;
     }
+    g_free(vbasedev->migration);
+    vbasedev->migration = NULL;
     return ret;
 }
 
-- 
2.32.0



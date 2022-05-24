Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A63B53230E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:23:41 +0200 (CEST)
Received: from localhost ([::1]:40586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntNxE-0002Od-6a
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNt6-0007ti-Qh
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:41948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNsr-0000Fd-JQ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373149; x=1684909149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uvCzKu9Uu5PXiNmmvrkHXtmIZIyrXKybleaiUQQ6ZLg=;
 b=QW4MnK2B1BBp659TlpNtHszUkdeSDejc3bDzygW6F52Dy+hB1Mxv+/1p
 kNoTnzaTYCFq3URasF530H/PIL4l5muVyH6Y+PN/ADTvJ+i0sVyVVI9w+
 tLePe3QtdqVYJZd1wKvYx52vPD4/3USvkoxyWRndr+q1sgEOwn+jKbj9I
 wtElu34TuT/kPfhmnP6ClhJODE/qXnYCRrq8W3wj2k2sI+MTiSs6ww1i6
 YfpZ+17nA+amzKaennHzlYPbwRWwr8+Ch68cP2DG6GveSSgGHwDwV+HAQ
 QFvzv6R+diHNrKMp1FaHxGwOqeyZB4307L8pqdDvJSLCj9URxWbEZPS7P A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943141"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943141"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059609"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:02 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 01/13] vfio/migration: put together checks of migration
 initialization conditions
Date: Tue, 24 May 2022 14:18:36 +0800
Message-Id: <20220524061848.1615706-2-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524061848.1615706-1-lei.rao@intel.com>
References: <20220524061848.1615706-1-lei.rao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Current VFIO live migration initialization code is tightly coupled with
local migration region handling. It is necessary to decouple it to
facilitate the introduction of a generic VFIO live migration framework so
that other approaches can be possible besides the In-Band approach.

This patch puts various checks of migration initialization conditions into
one function vfio_migration_check().

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Eddie Dong <eddie.dong@intel.com>
---
 hw/vfio/migration.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index a6ad1f8945..770f535e81 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -787,6 +787,21 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
     vbasedev->migration = NULL;
 }
 
+static int vfio_migration_check(VFIODevice *vbasedev)
+{
+    VFIOContainer *container = vbasedev->group->container;
+
+    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
+        return -EINVAL;
+    }
+
+    if (!vbasedev->ops->vfio_get_object) {
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 static int vfio_migration_init(VFIODevice *vbasedev,
                                struct vfio_region_info *info)
 {
@@ -796,10 +811,6 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     char id[256] = "";
     g_autofree char *path = NULL, *oid = NULL;
 
-    if (!vbasedev->ops->vfio_get_object) {
-        return -EINVAL;
-    }
-
     obj = vbasedev->ops->vfio_get_object(vbasedev);
     if (!obj) {
         return -EINVAL;
@@ -857,11 +868,11 @@ int64_t vfio_mig_bytes_transferred(void)
 
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
-    VFIOContainer *container = vbasedev->group->container;
     struct vfio_region_info *info = NULL;
     int ret = -ENOTSUP;
 
-    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
+    ret = vfio_migration_check(vbasedev);
+    if (ret) {
         goto add_blocker;
     }
 
-- 
2.32.0



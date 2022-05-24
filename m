Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CF3532379
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:50:20 +0200 (CEST)
Received: from localhost ([::1]:38020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntON1-0004cm-2h
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtb-00005M-9i
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:55 -0400
Received: from mga17.intel.com ([192.55.52.151]:42013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtZ-0000MN-Hi
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373193; x=1684909193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BidQ/Lj4AzL1srh2FSCncmHpFcQXw1WY/Lep5pe1iY4=;
 b=V6dcbX6q1+r0g2WLfnZYyW3JiVduC/fshsd3yqLxLtudN3ozKHg1oJo5
 Qo5w/oBHKn0JI3Mc99Fps6nKV6jHEKGp0Pn2rcgoslZsB1tskGNq/BtZT
 wSBFcsbuTXTB5s/rbYStAgRFDhTJ1+D6OVBy4b9QNvU41x+NQCW2VBs3v
 DdOYRjioXMPrf5Z4clm7m40ZSMU/O/CgkYxRAIZuYL9lEe5cpxjoq0W0t
 FX6FEYwwJWnVOuIz7NrkB3aEqHKsyT3fIQwBon1y5fzNMaZFkt9aoWTFk
 qbzY/9F2JUTMkpdo9De13micMCV5aj99ncn5gOoW7DIeiaye2w8fGCN2D Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943289"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943289"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059892"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:49 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org, Lei Rao <lei.rao@intel.com>,
 Eddie Dong <eddie.dong@Intel.com>
Subject: [RFC PATCH 12/13] vfio/migration: add some trace-events for vfio
 migration plugin
Date: Tue, 24 May 2022 14:18:47 +0800
Message-Id: <20220524061848.1615706-13-lei.rao@intel.com>
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

Add some trace-events including trace_vfio_migration_plugin_probe
trace_vfio_plugin_save_buffer, trace_vfio_plugin_load_state_device_data
trace_vfio_update_pending, and trace_vfio_migration_set_state to make
debugging easier.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Eddie Dong <eddie.dong@Intel.com>
---
 hw/vfio/migration-plugin.c | 10 +++++++---
 hw/vfio/trace-events       |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/migration-plugin.c b/hw/vfio/migration-plugin.c
index 63124e1571..c545cbe334 100644
--- a/hw/vfio/migration-plugin.c
+++ b/hw/vfio/migration-plugin.c
@@ -19,6 +19,7 @@
 #include "qapi/error.h"
 #include "hw/vfio/vfio-migration-plugin.h"
 #include "sysemu/sysemu.h"
+#include "trace.h"
 
 #define CHUNK_SIZE (1024 * 1024)
 
@@ -128,7 +129,7 @@ static int vfio_migration_update_pending_plugin(VFIODevice *vbasedev)
         return ret;
     }
     migration->pending_bytes = pending_bytes;
-
+    trace_vfio_update_pending(vbasedev->name, pending_bytes);
     return 0;
 }
 
@@ -159,7 +160,7 @@ static int vfio_migration_set_state_plugin(VFIODevice *vbasedev, uint32_t mask,
     }
 
     vbasedev->migration->device_state = device_state;
-
+    trace_vfio_migration_set_state(vbasedev->name, device_state);
     return 0;
 }
 
@@ -179,6 +180,7 @@ static int vfio_migration_save_buffer_plugin(QEMUFile *f, VFIODevice *vbasedev,
     qemu_put_be64(f, data_size);
     tmp_size = data_size;
 
+    trace_vfio_save_buffer_plugin(vbasedev->name, data_size);
     while (tmp_size) {
         uint64_t sz = tmp_size <= CHUNK_SIZE ? tmp_size : CHUNK_SIZE;
         void *buf = g_try_malloc(sz);
@@ -214,6 +216,7 @@ static int vfio_migration_load_buffer_plugin(QEMUFile *f, VFIODevice *vbasedev,
     int ret = 0;
     VFIOMigrationPlugin *plugin = vbasedev->migration->plugin;
 
+    trace_vfio_load_state_device_data_plugin(vbasedev->name, data_size);
     while (data_size) {
         uint64_t sz = data_size <= CHUNK_SIZE ? data_size : CHUNK_SIZE;
         void *buf = g_try_malloc(sz);
@@ -257,6 +260,7 @@ int vfio_migration_probe_plugin(VFIODevice *vbasedev)
     }
 
     migration->ops = &vfio_plugin_method;
-
+    trace_vfio_migration_probe_plugin(vbasedev->name, vbasedev->desc.path,
+                                      vbasedev->desc.arg);
     return 0;
 }
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index ca85edeb11..6c2cba29fd 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -149,12 +149,14 @@ vfio_display_edid_write_error(void) ""
 
 # migration.c
 vfio_migration_probe_local(const char *name, uint32_t index) " (%s) Region %d"
+vfio_migration_probe_plugin(const char *name, const char *path, const char *arg) " (%s) Plugin path=%s arg=%s"
 vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
 vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
 vfio_save_setup(const char *name) " (%s)"
 vfio_save_cleanup(const char *name) " (%s)"
 vfio_save_buffer_local(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
+vfio_save_buffer_plugin(const char *name, uint64_t data_size) " (%s) data size 0x%"PRIx64
 vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
 vfio_save_device_config_state(const char *name) " (%s)"
 vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
@@ -163,6 +165,7 @@ vfio_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
 vfio_load_state_device_data_local(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
+vfio_load_state_device_data_plugin(const char *name, uint64_t data_size) " (%s) data size 0x%"PRIx64
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
-- 
2.32.0



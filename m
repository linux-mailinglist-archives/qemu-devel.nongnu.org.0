Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F146082FB
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 02:47:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om1AW-0006HQ-1P; Fri, 21 Oct 2022 19:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1om1AU-0006HC-1C
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 19:11:10 -0400
Received: from usmailhost21.kioxia.com ([12.0.68.226]
 helo=SJSMAIL01.us.kioxia.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1om1AG-0005ry-RR
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 19:11:09 -0400
Received: from localhost.localdomain (10.93.83.20) by SJSMAIL01.us.kioxia.com
 (10.90.133.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Fri, 21 Oct
 2022 16:10:50 -0700
From: <clay.mayers@kioxia.com>
To: <qemu-devel@nongnu.org>
CC: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Fam
 Zheng <fam@euphon.net>, =?UTF-8?q?Phlippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: [PATCH V2 1/4] hw/block/nvme: add ZONE_FINISH_RECOMMENDED
 functionality
Date: Fri, 21 Oct 2022 16:10:35 -0700
Message-ID: <20221021231038.1042659-2-clay.mayers@kioxia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221021231038.1042659-1-clay.mayers@kioxia.com>
References: <20221021231038.1042659-1-clay.mayers@kioxia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.93.83.20]
X-ClientProxiedBy: SJSMAIL01.us.kioxia.com (10.90.133.90) To
 SJSMAIL01.us.kioxia.com (10.90.133.90)
Received-SPF: pass client-ip=12.0.68.226; envelope-from=Clay.Mayers@kioxia.com;
 helo=SJSMAIL01.us.kioxia.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Clay Mayers <clay.mayers@kioxia.com>

Adds ns.param.zoned.finish_time, which sets the number of
seconds a zone can remain active before the zone attribute
ZONE_FINISH_RECOMMENDED is set.

This requires scanning the exp open, imp open and closed lists
of zones whenever a zone is marked as requiring finishing.  The
expectation is these lists will be short (10s of items) allowing a
simpler implementation than keeping the lists sorted.  It also
keeps the overhead during the exception of a timeout instead of
when zones change state between open and closed. For use cases
where this isn't true, finish_time should be 0 to disable this
feature (the default).

Signed-off-by: Clay Mayers <clay.mayers@kioxia.com>
---
 docs/system/devices/nvme.rst |  5 +++++
 hw/nvme/ctrl.c               | 35 +++++++++++++++++++++++++++++++++++
 hw/nvme/ns.c                 |  8 ++++++++
 hw/nvme/nvme.h               | 18 ++++++++++++++----
 4 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index 30f841ef62..1cb0ef844c 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -212,6 +212,11 @@ The namespace may be configured with additional parameters
   the minimum memory page size (CAP.MPSMIN). The default value (``0``)
   has this property inherit the ``mdts`` value.
 
+``zoned.finish_time=UINT32`` (default: ``0``)
+  Set the time in seconds for how long a zone can be active before setting the
+  zone attribute ``Zone Finish Recommended``.  The default value (``0``)
+  disables this feature.
+
 Metadata
 --------
 
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..d7e9fae0b0 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1516,6 +1516,38 @@ static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
     }
 }
 
+static void nvme_check_finish(NvmeNamespace *ns, NvmeZoneListHead *list)
+{
+    int64_t now = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
+    NvmeZone *zone;
+
+    QTAILQ_FOREACH(zone, list, entry) {
+        if (zone->finish_ms <= now) {
+            zone->finish_ms = INT64_MAX;
+            zone->d.za |= NVME_ZA_FINISH_RECOMMENDED;
+        } else if (zone->finish_ms != INT64_MAX) {
+            timer_mod_anticipate(ns->active_timer, zone->finish_ms);
+        }
+    }
+}
+
+void nvme_finish_needed(void *opaque)
+{
+    NvmeNamespace *ns = opaque;
+
+    nvme_check_finish(ns, &ns->exp_open_zones);
+    nvme_check_finish(ns, &ns->imp_open_zones);
+    nvme_check_finish(ns, &ns->closed_zones);
+}
+
+void nvme_set_active_timeout(NvmeNamespace *ns, NvmeZone *zone)
+{
+    if (ns->fto_ms) {
+        zone->finish_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + ns->fto_ms;
+        timer_mod_anticipate(ns->active_timer, zone->finish_ms);
+    }
+}
+
 static inline uint16_t nvme_check_mdts(NvmeCtrl *n, size_t len)
 {
     uint8_t mdts = n->params.mdts;
@@ -1791,6 +1823,7 @@ static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
 
         /* fallthrough */
     case NVME_ZONE_STATE_EMPTY:
+        zone->d.za &= ~NVME_ZA_FINISH_RECOMMENDED;
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_FULL);
         return NVME_SUCCESS;
 
@@ -1891,6 +1924,7 @@ static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
 
         if (act) {
             nvme_aor_inc_active(ns);
+            nvme_set_active_timeout(ns, zone);
         }
 
         nvme_aor_inc_open(ns);
@@ -3619,6 +3653,7 @@ static uint16_t nvme_set_zd_ext(NvmeNamespace *ns, NvmeZone *zone)
             return status;
         }
         nvme_aor_inc_active(ns);
+        nvme_set_active_timeout(ns, zone);
         zone->d.za |= NVME_ZA_ZD_EXT_VALID;
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
         return NVME_SUCCESS;
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 62a1f97be0..b577f2d8e0 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -322,6 +322,11 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
         ns->id_ns.nsfeat &= ~0x4;
     }
 
+    ns->fto_ms = ns->params.fto * INT64_C(1000);
+    if (ns->fto_ms) {
+        ns->active_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL, nvme_finish_needed,
+                                        ns);
+    }
     ns->id_ns_zoned = id_ns_z;
 }
 
@@ -338,6 +343,7 @@ static void nvme_clear_zone(NvmeNamespace *ns, NvmeZone *zone)
             nvme_set_zone_state(zone, NVME_ZONE_STATE_CLOSED);
         }
         nvme_aor_inc_active(ns);
+        nvme_set_active_timeout(ns, zone);
         QTAILQ_INSERT_HEAD(&ns->closed_zones, zone, entry);
     } else {
         trace_pci_nvme_clear_ns_reset(state, zone->d.zslba);
@@ -521,6 +527,7 @@ void nvme_ns_shutdown(NvmeNamespace *ns)
 void nvme_ns_cleanup(NvmeNamespace *ns)
 {
     if (ns->params.zoned) {
+        timer_free(ns->active_timer);
         g_free(ns->id_ns_zoned);
         g_free(ns->zone_array);
         g_free(ns->zd_extensions);
@@ -644,6 +651,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_SIZE("zoned.zrwafg", NvmeNamespace, params.zrwafg, -1),
     DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default,
                      false),
+    DEFINE_PROP_UINT32("zoned.finish_time", NvmeNamespace, params.fto, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 79f5c281c2..9a54dcdb32 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -93,6 +93,7 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
 typedef struct NvmeZone {
     NvmeZoneDescr   d;
     uint64_t        w_ptr;
+    int64_t         finish_ms;
     QTAILQ_ENTRY(NvmeZone) entry;
 } NvmeZone;
 
@@ -121,12 +122,15 @@ typedef struct NvmeNamespaceParams {
     uint32_t max_active_zones;
     uint32_t max_open_zones;
     uint32_t zd_extension_size;
+    uint32_t fto;
 
     uint32_t numzrwa;
     uint64_t zrwas;
     uint64_t zrwafg;
 } NvmeNamespaceParams;
 
+typedef QTAILQ_HEAD(, NvmeZone) NvmeZoneListHead;
+
 typedef struct NvmeNamespace {
     DeviceState  parent_obj;
     BlockConf    blkconf;
@@ -154,10 +158,10 @@ typedef struct NvmeNamespace {
 
     NvmeIdNsZoned   *id_ns_zoned;
     NvmeZone        *zone_array;
-    QTAILQ_HEAD(, NvmeZone) exp_open_zones;
-    QTAILQ_HEAD(, NvmeZone) imp_open_zones;
-    QTAILQ_HEAD(, NvmeZone) closed_zones;
-    QTAILQ_HEAD(, NvmeZone) full_zones;
+    NvmeZoneListHead exp_open_zones;
+    NvmeZoneListHead imp_open_zones;
+    NvmeZoneListHead closed_zones;
+    NvmeZoneListHead full_zones;
     uint32_t        num_zones;
     uint64_t        zone_size;
     uint64_t        zone_capacity;
@@ -166,6 +170,9 @@ typedef struct NvmeNamespace {
     int32_t         nr_open_zones;
     int32_t         nr_active_zones;
 
+    int64_t         fto_ms;
+    QEMUTimer       *active_timer;
+
     NvmeNamespaceParams params;
 
     struct {
@@ -274,6 +281,9 @@ static inline void nvme_aor_dec_active(NvmeNamespace *ns)
     assert(ns->nr_active_zones >= 0);
 }
 
+void nvme_set_active_timeout(NvmeNamespace *ns, NvmeZone *zone);
+void nvme_finish_needed(void *opaque);
+
 void nvme_ns_init_format(NvmeNamespace *ns);
 int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
-- 
2.27.0



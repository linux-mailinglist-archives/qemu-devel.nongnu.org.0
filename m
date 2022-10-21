Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9122D60822A
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 01:45:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om1Ab-0006Oo-Q6; Fri, 21 Oct 2022 19:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1om1Aa-0006Oe-JW
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 19:11:16 -0400
Received: from usmailhost21.kioxia.com ([12.0.68.226]
 helo=SJSMAIL01.us.kioxia.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1om1AU-0005ry-Am
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 19:11:16 -0400
Received: from localhost.localdomain (10.93.83.20) by SJSMAIL01.us.kioxia.com
 (10.90.133.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Fri, 21 Oct
 2022 16:10:51 -0700
From: <clay.mayers@kioxia.com>
To: <qemu-devel@nongnu.org>
CC: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Fam
 Zheng <fam@euphon.net>, =?UTF-8?q?Phlippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: [PATCH V2 2/4] hw/block/nvme: add zone descriptor changed log page
Date: Fri, 21 Oct 2022 16:10:36 -0700
Message-ID: <20221021231038.1042659-3-clay.mayers@kioxia.com>
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

Zones marked with ZONE_FINISH_RECOMMENDED are added to the zone
descriptor changed log page.  Once read with RAE cleared, they are
removed from the list.

Zones stay in the list regardless of what other states the zones may
go through so applications must be aware of ABA issues where finish
may be recommended, the zone freed and re-opened and now the attribute
is now clear.

Signed-off-by: Clay Mayers <clay.mayers@kioxia.com>
---
 hw/nvme/ctrl.c       | 57 ++++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/ns.c         |  6 +++++
 hw/nvme/nvme.h       |  8 +++++++
 hw/nvme/trace-events |  1 +
 include/block/nvme.h |  8 +++++++
 5 files changed, 80 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index d7e9fae0b0..5b5ceb90c2 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1516,15 +1516,42 @@ static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
     }
 }
 
+static void nvme_zdc_list(NvmeNamespace *ns, NvmeZoneIdList *zlist, bool reset)
+{
+    NvmeZdc *zdc;
+    NvmeZdc *next;
+    int index = 0;
+
+    QTAILQ_FOREACH_SAFE(zdc, &ns->zdc_list, entry, next) {
+        if (index >= ARRAY_SIZE(zlist->zids)) {
+            break;
+        }
+        zlist->zids[index++] = zdc->zone->d.zslba;
+        if (reset) {
+            QTAILQ_REMOVE(&ns->zdc_list, zdc, entry);
+            zdc->zone->zdc_entry = NULL;
+            g_free(zdc);
+        }
+    }
+    zlist->nzid = cpu_to_le16(index);
+}
+
 static void nvme_check_finish(NvmeNamespace *ns, NvmeZoneListHead *list)
 {
     int64_t now = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     NvmeZone *zone;
+    NvmeZdc  *zdc;
 
     QTAILQ_FOREACH(zone, list, entry) {
         if (zone->finish_ms <= now) {
             zone->finish_ms = INT64_MAX;
             zone->d.za |= NVME_ZA_FINISH_RECOMMENDED;
+            if (!zone->zdc_entry) {
+                zdc = g_malloc0(sizeof(*zdc));
+                zdc->zone = zone;
+                zone->zdc_entry = zdc;
+                QTAILQ_INSERT_TAIL(&ns->zdc_list, zdc, entry);
+            }
         } else if (zone->finish_ms != INT64_MAX) {
             timer_mod_anticipate(ns->active_timer, zone->finish_ms);
         }
@@ -4675,6 +4702,34 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
     return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
 }
 
+static uint16_t nvme_changed_zones(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
+                                    uint64_t off, NvmeRequest *req)
+{
+    NvmeNamespace *ns;
+    NvmeCmd *cmd = &req->cmd;
+    uint32_t nsid = le32_to_cpu(cmd->nsid);
+    NvmeZoneIdList zlist = { };
+    uint32_t trans_len;
+
+    if (off >= sizeof(zlist)) {
+        trace_pci_nvme_err_invalid_log_page_offset(off, sizeof(zlist));
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    nsid = le32_to_cpu(cmd->nsid);
+    trace_pci_nvme_changed_zones(nsid);
+
+    ns = nvme_ns(n, nsid);
+    if (!ns) {
+        return NVME_INVALID_NSID | NVME_DNR;
+    }
+    nvme_zdc_list(ns, &zlist, !rae);
+
+    trans_len = MIN(sizeof(zlist) - off, buf_len);
+
+    return nvme_c2h(n, ((uint8_t *)&zlist) + off, trans_len, req);
+}
+
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -4722,6 +4777,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_changed_nslist(n, rae, len, off, req);
     case NVME_LOG_CMD_EFFECTS:
         return nvme_cmd_effects(n, csi, len, off, req);
+    case NVME_LOG_CHANGED_ZONE:
+        return nvme_changed_zones(n, rae, len, off, req);
     default:
         trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
         return NVME_INVALID_FIELD | NVME_DNR;
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index b577f2d8e0..25cd490c99 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -240,6 +240,7 @@ static void nvme_ns_zoned_init_state(NvmeNamespace *ns)
     QTAILQ_INIT(&ns->imp_open_zones);
     QTAILQ_INIT(&ns->closed_zones);
     QTAILQ_INIT(&ns->full_zones);
+    QTAILQ_INIT(&ns->zdc_list);
 
     zone = ns->zone_array;
     for (i = 0; i < ns->num_zones; i++, zone++) {
@@ -526,8 +527,13 @@ void nvme_ns_shutdown(NvmeNamespace *ns)
 
 void nvme_ns_cleanup(NvmeNamespace *ns)
 {
+    NvmeZdc *zdc;
+
     if (ns->params.zoned) {
         timer_free(ns->active_timer);
+        while ((zdc = QTAILQ_FIRST(&ns->zdc_list))) {
+            g_free(zdc);
+        }
         g_free(ns->id_ns_zoned);
         g_free(ns->zone_array);
         g_free(ns->zd_extensions);
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 9a54dcdb32..ae65226150 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -32,6 +32,7 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROADCAST - 1);
 
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
+typedef struct NvmeZone NvmeZone;
 
 #define TYPE_NVME_BUS "nvme-bus"
 OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
@@ -90,10 +91,16 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
 #define NVME_NS(obj) \
     OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
 
+typedef struct NvmeZdc {
+    QTAILQ_ENTRY(NvmeZdc) entry;
+    NvmeZone *zone;
+} NvmeZdc;
+
 typedef struct NvmeZone {
     NvmeZoneDescr   d;
     uint64_t        w_ptr;
     int64_t         finish_ms;
+    NvmeZdc         *zdc_entry;
     QTAILQ_ENTRY(NvmeZone) entry;
 } NvmeZone;
 
@@ -172,6 +179,7 @@ typedef struct NvmeNamespace {
 
     int64_t         fto_ms;
     QEMUTimer       *active_timer;
+    QTAILQ_HEAD(, NvmeZdc) zdc_list;
 
     NvmeNamespaceParams params;
 
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index fccb79f489..337927e607 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -64,6 +64,7 @@ pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
 pci_nvme_identify_cmd_set(void) "identify i/o command set"
 pci_nvme_identify_ns_descr_list(uint32_t ns) "nsid %"PRIu32""
+pci_nvme_changed_zones(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_get_log(uint16_t cid, uint8_t lid, uint8_t lsp, uint8_t rae, uint32_t len, uint64_t off) "cid %"PRIu16" lid 0x%"PRIx8" lsp 0x%"PRIx8" rae 0x%"PRIx8" len %"PRIu32" off %"PRIu64""
 pci_nvme_getfeat(uint16_t cid, uint32_t nsid, uint8_t fid, uint8_t sel, uint32_t cdw11) "cid %"PRIu16" nsid 0x%"PRIx32" fid 0x%"PRIx8" sel 0x%"PRIx8" cdw11 0x%"PRIx32""
 pci_nvme_setfeat(uint16_t cid, uint32_t nsid, uint8_t fid, uint8_t save, uint32_t cdw11) "cid %"PRIu16" nsid 0x%"PRIx32" fid 0x%"PRIx8" save 0x%"PRIx8" cdw11 0x%"PRIx32""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 8027b7126b..c747cc4948 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1010,6 +1010,7 @@ enum NvmeLogIdentifier {
     NVME_LOG_FW_SLOT_INFO   = 0x03,
     NVME_LOG_CHANGED_NSLIST = 0x04,
     NVME_LOG_CMD_EFFECTS    = 0x05,
+    NVME_LOG_CHANGED_ZONE   = 0xbf,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -1617,6 +1618,12 @@ typedef enum NvmeVirtualResourceType {
     NVME_VIRT_RES_INTERRUPT     = 0x01,
 } NvmeVirtualResourceType;
 
+typedef struct QEMU_PACKED NvmeZoneIdList {
+    uint16_t nzid;
+    uint16_t rsvd2[3];
+    uint64_t zids[511];
+} NvmeZoneIdList;
+
 static inline void _nvme_check_size(void)
 {
     QEMU_BUILD_BUG_ON(sizeof(NvmeBar) != 4096);
@@ -1655,5 +1662,6 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmePriCtrlCap) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlEntry) != 32);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlList) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeZoneIdList) != 4096);
 }
 #endif
-- 
2.27.0



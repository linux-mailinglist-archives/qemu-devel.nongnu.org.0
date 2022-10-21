Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80581606C81
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 02:36:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olg1D-0002EF-Kz
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 20:36:11 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olg02-0001lQ-Eo
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 20:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1olfzv-0001jh-DG
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 20:34:51 -0400
Received: from usmailhost21.kioxia.com ([12.0.68.226]
 helo=SJSMAIL01.us.kioxia.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1olfzl-0004k2-Fv
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 20:34:50 -0400
Received: from localhost.localdomain (10.93.83.20) by SJSMAIL01.us.kioxia.com
 (10.90.133.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 20 Oct
 2022 17:18:54 -0700
From: <clay.mayers@kioxia.com>
To: <qemu-devel@nongnu.org>
CC: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Fam
 Zheng <fam@euphon.net>, =?UTF-8?q?Phlippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: [PATCH 4/4] hw/block/nvme: add zone descriptor changed AEN
Date: Thu, 20 Oct 2022 17:18:35 -0700
Message-ID: <20221021001835.942642-5-clay.mayers@kioxia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221021001835.942642-1-clay.mayers@kioxia.com>
References: <20221021001835.942642-1-clay.mayers@kioxia.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Clay Mayers <clay.mayers@kioxia.com>

If a namespace's param.zoned.finish_time is non-zero,
controllers register with the namespace to be notified
when entries are added to its zone-descriptor-changed
log page.  If the zone-descriptor-changed aen is enabled,
this will cause an AEN to be sent from that controller.

Signed-off-by: Clay Mayers <clay.mayers@kioxia.com>
---
 hw/nvme/ctrl.c       | 62 +++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/ns.c         |  1 +
 hw/nvme/nvme.h       |  9 +++++++
 include/block/nvme.h |  2 ++
 4 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index c7ee54ef5e..f1cfa272b4 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1519,6 +1519,52 @@ static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
     }
 }
 
+static void nvme_zdc_watch(NvmeCtrl *n, NvmeNamespace *ns, NvmeNotifyFnc fnc)
+{
+    NvmeZdcNotify *watcher = g_malloc0(sizeof(*watcher));
+
+    watcher->n = n;
+    watcher->notify = fnc;
+    QTAILQ_INSERT_TAIL(&ns->zdc_watchers, watcher, entry);
+}
+
+static void nvme_zdc_unwatch(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    NvmeZdcNotify *watcher;
+
+    QTAILQ_FOREACH(watcher, &ns->zdc_watchers, entry) {
+        if (watcher->n == n) {
+            QTAILQ_REMOVE(&ns->zdc_watchers, watcher, entry);
+            break;
+        }
+    }
+}
+
+static void nvme_zdc_notify(NvmeNamespace *ns)
+{
+    NvmeZdcNotify *watcher;
+
+    QTAILQ_FOREACH(watcher, &ns->zdc_watchers, entry) {
+        (*watcher->notify)(watcher->n, ns);
+    }
+}
+
+static void nvme_zdc_aen(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    g_assert(n->id_ctrl.oaes & (1 << 27));
+
+    if (!NVME_AEC_ZONE_CHANGED(n->features.async_config)) {
+        return;
+    }
+
+    if (!n->zdc_event_queued) {
+        n->zdc_event_queued = true;
+        nvme_enqueue_event(n, NVME_AER_TYPE_NOTICE,
+                            NVME_AER_INFO_NOTICE_ZONE_DESC_CHANGED,
+                            NVME_LOG_CHANGED_ZONE, ns->params.nsid);
+    }
+}
+
 static void nvme_zdc_list(NvmeNamespace *ns, NvmeZoneIdList *zlist, bool reset)
 {
     NvmeZdc *zdc;
@@ -1554,6 +1600,7 @@ static void nvme_check_finish(NvmeNamespace *ns, NvmeZoneListHead *list)
                 zdc->zone = zone;
                 zone->zdc_entry = zdc;
                 QTAILQ_INSERT_TAIL(&ns->zdc_list, zdc, entry);
+                nvme_zdc_notify(ns);
             }
         } else if (zone->finish_ms != INT64_MAX) {
             timer_mod_anticipate(ns->active_timer, zone->finish_ms);
@@ -4722,6 +4769,14 @@ static uint16_t nvme_changed_zones(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
         return NVME_INVALID_NSID | NVME_DNR;
     }
     nvme_zdc_list(ns, &zlist, !rae);
+    if (!rae) {
+        n->zdc_event_queued = false;
+        nvme_clear_events(n, NVME_AER_TYPE_NOTICE);
+        /* send a new aen if there are still zdc entries */
+        if (!QTAILQ_EMPTY(&ns->zdc_list)) {
+            nvme_zdc_notify(ns);
+        }
+    }
 
     return nvme_c2h(n, ((uint8_t *)&zlist) + off, trans_len, req);
 }
@@ -5808,6 +5863,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
             }
 
+            nvme_zdc_unwatch(n, ns);
             ctrl->namespaces[nsid] = NULL;
             ns->attached--;
 
@@ -7535,7 +7591,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->cntlid = cpu_to_le16(n->cntlid);
 
-    id->oaes = cpu_to_le32(NVME_OAES_NS_ATTR);
+    id->oaes = cpu_to_le32(NVME_OAES_NS_ATTR | NVME_OAES_ZDC);
     id->ctratt |= cpu_to_le32(NVME_CTRATT_ELBAS);
 
     id->rab = 6;
@@ -7652,6 +7708,10 @@ void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
 
     n->dmrsl = MIN_NON_ZERO(n->dmrsl,
                             BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
+
+    if (ns->params.fto) {
+        nvme_zdc_watch(n, ns, nvme_zdc_aen);
+    }
 }
 
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 25cd490c99..5629b61302 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -241,6 +241,7 @@ static void nvme_ns_zoned_init_state(NvmeNamespace *ns)
     QTAILQ_INIT(&ns->closed_zones);
     QTAILQ_INIT(&ns->full_zones);
     QTAILQ_INIT(&ns->zdc_list);
+    QTAILQ_INIT(&ns->zdc_watchers);
 
     zone = ns->zone_array;
     for (i = 0; i < ns->num_zones; i++, zone++) {
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 2b7997e4a7..5499105e7b 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -91,6 +91,14 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
 #define NVME_NS(obj) \
     OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
 
+typedef void (*NvmeNotifyFnc)(NvmeCtrl *n, NvmeNamespace *ns);
+
+typedef struct NvmeZdcNotify {
+    QTAILQ_ENTRY(NvmeZdcNotify) entry;
+    NvmeNotifyFnc notify;
+    NvmeCtrl *n;
+} NvmeZdcNotify;
+
 typedef struct NvmeZdc {
     QTAILQ_ENTRY(NvmeZdc) entry;
     NvmeZone *zone;
@@ -179,6 +187,7 @@ typedef struct NvmeNamespace {
 
     int64_t         fto_ms;
     QEMUTimer       *active_timer;
+    QTAILQ_HEAD(, NvmeZdcNotify) zdc_watchers;
     QTAILQ_HEAD(, NvmeZdc) zdc_list;
 
     NvmeNamespaceParams params;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 9467d4b939..1662046c0d 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -830,6 +830,7 @@ enum NvmeAsyncEventRequest {
     NVME_AER_INFO_SMART_TEMP_THRESH         = 1,
     NVME_AER_INFO_SMART_SPARE_THRESH        = 2,
     NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED    = 0,
+    NVME_AER_INFO_NOTICE_ZONE_DESC_CHANGED  = 0xef,
 };
 
 typedef struct QEMU_PACKED NvmeAerResult {
@@ -1133,6 +1134,7 @@ typedef struct NvmeIdCtrlNvm {
 
 enum NvmeIdCtrlOaes {
     NVME_OAES_NS_ATTR   = 1 << 8,
+    NVME_OAES_ZDC       = 1 << 27,
 };
 
 enum NvmeIdCtrlCtratt {
-- 
2.27.0



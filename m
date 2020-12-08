Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7BF2D34E3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:13:10 +0100 (CET)
Received: from localhost ([::1]:45874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkIH-00078b-Sk
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjEE-0002dO-1Y; Tue, 08 Dec 2020 15:04:54 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjE5-00063N-P1; Tue, 08 Dec 2020 15:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607458864; x=1638994864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YYdJbstkh+aRV4BM+aA/DjDY5eQaoZFmh58Kl1dML9g=;
 b=mC/WVapf43jfjUw38hMUc6VUs4wnNef01aCyeeC53QL5hL9RT7C+xKV5
 sQjjR+uXRG7s2rbzuTQ1CKeEU/Utnvyn40wWrvvc0HdM5tAe9sx1WVmDW
 iHnXXuTI1xUr04DlYB4Glg64vcX+ro2fF16E9OoSvANpwlX7T6tsvw8Nl
 RND0pfy8XFau9vTEoMNBzJHrlGhpciMmH+sPTa4ohLCl0o5n3D+SaLkTp
 xxiJ8ShNKotWFrOQ+ANKliPc3R6aaR+PBPEDd7ev7+9IsuHVY2PDi7yEu
 GRd8ZfwscA1BIxin0PMP6bXIsHi/cMjsw6YRPZ4DJcPNCeJwtjv+ZKD1K A==;
IronPort-SDR: x55pw8SIEQIst9auC6VBoaLGH0qYIhArQb5hgNXgmcVbk1lqOa8qabQIgHWUq9q0s5wUQDRqFc
 iejKzNqH8qmOEIWdmI0775aG/D+9dukRjL12gvNxku2Hvd/kC9Fn6Go1zoGvKhUT7kMYsBdirp
 vDU7Vf34dzr+xcYABtHKx1x4twi4DaVW/6SOVNh1SU8UYZ5m10URWPpI1eix1Ziw0F6b6qnTQA
 0p48vK0J8p1m/3aS3Z7F+OwbPy1CP18cgb899qcUjbRiR3GtrhBXfIEDRzr+aJMb+3tA0pX3/s
 nlQ=
X-IronPort-AV: E=Sophos;i="5.78,403,1599494400"; d="scan'208";a="258433473"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 04:20:55 +0800
IronPort-SDR: /h/AIaYrN1w37Qf+imYVyZjtL9sVaFcKSKynG+xpUS+QIlUGKrDNTx6Ap9wu3RbMZm9JXJhH8y
 wjQ+kYfsTnvkv4ovYks3I75FpW+nFwkTQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 11:48:39 -0800
IronPort-SDR: gL5ce9xBDatBaNKS7dXprJPV3tQX/ctaXuFN0hILrr4wik1aO0F/UD/OxLgaMAIJh8ow2zInux
 Sd66413xhRiA==
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 12:04:38 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v11 11/13] hw/block/nvme: Support Zone Descriptor Extensions
Date: Wed,  9 Dec 2020 05:04:08 +0900
Message-Id: <20201208200410.27900-12-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
References: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=604abd949=dmitry.fomichev@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zone Descriptor Extension is a label that can be assigned to a zone.
It can be set to an Empty zone and it stays assigned until the zone
is reset.

This commit adds a new optional module property,
"zoned.descr_ext_size". Its value must be a multiple of 64 bytes.
If this value is non-zero, it becomes possible to assign extensions
of that size to any Empty zones. The default value for this property
is 0, therefore setting extensions is disabled by default.

Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
---
 hw/block/nvme-ns.h    |  8 +++++++
 hw/block/nvme-ns.c    | 25 ++++++++++++++++++--
 hw/block/nvme.c       | 53 +++++++++++++++++++++++++++++++++++++++++--
 hw/block/trace-events |  2 ++
 4 files changed, 84 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 7e1fd26909..f8f3c28c36 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -35,6 +35,7 @@ typedef struct NvmeNamespaceParams {
     uint64_t zone_cap_bs;
     uint32_t max_active_zones;
     uint32_t max_open_zones;
+    uint32_t zd_extension_size;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
@@ -56,6 +57,7 @@ typedef struct NvmeNamespace {
     uint64_t        zone_size;
     uint64_t        zone_capacity;
     uint32_t        zone_size_log2;
+    uint8_t         *zd_extensions;
     int32_t         nr_open_zones;
     int32_t         nr_active_zones;
 
@@ -129,6 +131,12 @@ static inline bool nvme_wp_is_valid(NvmeZone *zone)
            st != NVME_ZONE_STATE_OFFLINE;
 }
 
+static inline uint8_t *nvme_get_zd_extension(NvmeNamespace *ns,
+                                             uint32_t zone_idx)
+{
+    return &ns->zd_extensions[zone_idx * ns->params.zd_extension_size];
+}
+
 static inline void nvme_aor_inc_open(NvmeNamespace *ns)
 {
     assert(ns->nr_open_zones >= 0);
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index aaef69fb47..c5a7bafcf7 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -151,6 +151,18 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    if (ns->params.zd_extension_size) {
+        if (ns->params.zd_extension_size & 0x3f) {
+            error_setg(errp,
+                "zone descriptor extension size must be a multiple of 64B");
+            return -1;
+        }
+        if ((ns->params.zd_extension_size >> 6) > 0xff) {
+            error_setg(errp, "zone descriptor extension size is too large");
+            return -1;
+        }
+    }
+
     return 0;
 }
 
@@ -162,6 +174,10 @@ static void nvme_ns_zoned_init_state(NvmeNamespace *ns)
     int i;
 
     ns->zone_array = g_new0(NvmeZone, ns->num_zones);
+    if (ns->params.zd_extension_size) {
+        ns->zd_extensions = g_malloc0(ns->params.zd_extension_size *
+                                      ns->num_zones);
+    }
 
     QTAILQ_INIT(&ns->exp_open_zones);
     QTAILQ_INIT(&ns->imp_open_zones);
@@ -204,7 +220,8 @@ static void nvme_ns_init_zoned(NvmeCtrl *n, NvmeNamespace *ns, int lba_index)
     id_ns_z->ozcs = ns->params.cross_zone_read ? 0x01 : 0x00;
 
     id_ns_z->lbafe[lba_index].zsze = cpu_to_le64(ns->zone_size);
-    id_ns_z->lbafe[lba_index].zdes = 0;
+    id_ns_z->lbafe[lba_index].zdes =
+        ns->params.zd_extension_size >> 6; /* Units of 64B */
 
     ns->csi = NVME_CSI_ZONED;
     ns->id_ns.nsze = cpu_to_le64(ns->num_zones * ns->zone_size);
@@ -220,7 +237,8 @@ static void nvme_clear_zone(NvmeNamespace *ns, NvmeZone *zone)
 
     zone->w_ptr = zone->d.wp;
     state = nvme_get_zone_state(zone);
-    if (zone->d.wp != zone->d.zslba) {
+    if (zone->d.wp != zone->d.zslba ||
+        (zone->d.za & NVME_ZA_ZD_EXT_VALID)) {
         if (state != NVME_ZONE_STATE_CLOSED) {
             trace_pci_nvme_clear_ns_close(state, zone->d.zslba);
             nvme_set_zone_state(zone, NVME_ZONE_STATE_CLOSED);
@@ -316,6 +334,7 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
     if (ns->params.zoned) {
         g_free(ns->id_ns_zoned);
         g_free(ns->zone_array);
+        g_free(ns->zd_extensions);
     }
 }
 
@@ -347,6 +366,8 @@ static Property nvme_ns_props[] = {
                        params.max_active_zones, 0),
     DEFINE_PROP_UINT32("zoned.max_open", NvmeNamespace,
                        params.max_open_zones, 0),
+    DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
+                       params.zd_extension_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8b97b713a3..c2336bfd67 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1715,6 +1715,25 @@ static uint16_t nvme_offline_zone(NvmeNamespace *ns, NvmeZone *zone,
     }
 }
 
+static uint16_t nvme_set_zd_ext(NvmeNamespace *ns, NvmeZone *zone)
+{
+    uint16_t status;
+    uint8_t state = nvme_get_zone_state(zone);
+
+    if (state == NVME_ZONE_STATE_EMPTY) {
+        status = nvme_aor_check(ns, 1, 0);
+        if (status != NVME_SUCCESS) {
+            return status;
+        }
+        nvme_aor_inc_active(ns);
+        zone->d.za |= NVME_ZA_ZD_EXT_VALID;
+        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
+        return NVME_SUCCESS;
+    }
+
+    return NVME_ZONE_INVAL_TRANSITION;
+}
+
 static uint16_t nvme_bulk_proc_zone(NvmeNamespace *ns, NvmeZone *zone,
                                     enum NvmeZoneProcessingMask proc_mask,
                                     op_handler_t op_hndlr)
@@ -1813,6 +1832,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
     NvmeCmd *cmd = (NvmeCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
     NvmeZone *zone;
+    uint8_t *zd_ext;
     uint32_t dw13 = le32_to_cpu(cmd->cdw13);
     uint64_t slba = 0;
     uint32_t zone_idx = 0;
@@ -1885,7 +1905,22 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
 
     case NVME_ZONE_ACTION_SET_ZD_EXT:
         trace_pci_nvme_set_descriptor_extension(slba, zone_idx);
-        return NVME_INVALID_FIELD | NVME_DNR;
+        if (all || !ns->params.zd_extension_size) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+        zd_ext = nvme_get_zd_extension(ns, zone_idx);
+        status = nvme_dma(n, zd_ext, ns->params.zd_extension_size,
+                          DMA_DIRECTION_TO_DEVICE, req);
+        if (status) {
+            trace_pci_nvme_err_zd_extension_map_error(zone_idx);
+            return status;
+        }
+
+        status = nvme_set_zd_ext(ns, zone);
+        if (status == NVME_SUCCESS) {
+            trace_pci_nvme_zd_extension_set(zone_idx);
+            return status;
+        }
         break;
 
     default:
@@ -1955,7 +1990,10 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
     }
 
     zra = dw13 & 0xff;
-    if (zra != NVME_ZONE_REPORT) {
+    if (zra != NVME_ZONE_REPORT && zra != NVME_ZONE_REPORT_EXTENDED) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+    if (zra == NVME_ZONE_REPORT_EXTENDED && !ns->params.zd_extension_size) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -1977,6 +2015,9 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
     partial = (dw13 >> 16) & 0x01;
 
     zone_entry_sz = sizeof(NvmeZoneDescr);
+    if (zra == NVME_ZONE_REPORT_EXTENDED) {
+        zone_entry_sz += ns->params.zd_extension_size;
+    }
 
     max_zones = (data_size - sizeof(NvmeZoneReportHeader)) / zone_entry_sz;
     buf = g_malloc0(data_size);
@@ -2012,6 +2053,14 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
                 z->wp = cpu_to_le64(~0ULL);
             }
 
+            if (zra == NVME_ZONE_REPORT_EXTENDED) {
+                if (zone->d.za & NVME_ZA_ZD_EXT_VALID) {
+                    memcpy(buf_p, nvme_get_zd_extension(ns, zone_idx),
+                           ns->params.zd_extension_size);
+                }
+                buf_p += ns->params.zd_extension_size;
+            }
+
             max_zones--;
         }
     }
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 0b8564e028..0b7a132c88 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -99,6 +99,7 @@ pci_nvme_finish_zone(uint64_t slba, uint32_t zone_idx, int all) "finish zone, sl
 pci_nvme_reset_zone(uint64_t slba, uint32_t zone_idx, int all) "reset zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_offline_zone(uint64_t slba, uint32_t zone_idx, int all) "offline zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_set_descriptor_extension(uint64_t slba, uint32_t zone_idx) "set zone descriptor extension, slba=%"PRIu64", idx=%"PRIu32""
+pci_nvme_zd_extension_set(uint32_t zone_idx) "set descriptor extension for zone_idx=%"PRIu32""
 pci_nvme_clear_ns_close(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Closed state"
 pci_nvme_clear_ns_reset(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Empty state"
 
@@ -128,6 +129,7 @@ pci_nvme_err_zone_read_not_ok(uint64_t slba, uint32_t nlb, uint32_t status) "slb
 pci_nvme_err_append_too_large(uint64_t slba, uint32_t nlb, uint8_t zasl) "slba=%"PRIu64", nlb=%"PRIu32", zasl=%"PRIu8""
 pci_nvme_err_insuff_active_res(uint32_t max_active) "max_active=%"PRIu32" zone limit exceeded"
 pci_nvme_err_insuff_open_res(uint32_t max_open) "max_open=%"PRIu32" zone limit exceeded"
+pci_nvme_err_zd_extension_map_error(uint32_t zone_idx) "can't map descriptor extension for zone_idx=%"PRIu32""
 pci_nvme_err_invalid_iocsci(uint32_t idx) "unsupported command set combination index %"PRIu32""
 pci_nvme_err_invalid_del_sq(uint16_t qid) "invalid submission queue deletion, sid=%"PRIu16""
 pci_nvme_err_invalid_create_sq_cqid(uint16_t cqid) "failed creating submission queue, invalid cqid=%"PRIu16""
-- 
2.28.0



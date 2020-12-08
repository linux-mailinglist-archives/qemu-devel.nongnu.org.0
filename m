Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A72D3549
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:33:53 +0100 (CET)
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkcI-0008EZ-Pj
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:33:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjED-0002bI-6H; Tue, 08 Dec 2020 15:04:53 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjE1-00062i-VQ; Tue, 08 Dec 2020 15:04:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607458858; x=1638994858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OLGX0xngCO6Our+nf6pD0c4JnA9mM74HF1AfqLGmux0=;
 b=FL03Q2TC9InZMRpL07W/J0q+m0DoQbltZobBszsevOPLntyF1IZf+dmp
 tbbdNm3aim21Mrhorrn8LRlehMNWoAuAA8Uk76V2FD2tX/CQpVk9Z4u4S
 uR766uLyX5VHoxanpAb5+g72cbtkQoYuYNH29xCo+iud7YOTHCx1Oj6cV
 1UMRGk78JcUa3Got3QJi/7nUWNNnKB0kE/0Kr0+74qoTlYSmoenQyMKuF
 ENinuOfzgGk+m87TKWlySB+YPaZ4GcKw2q5SzmzBdidAhftzGI7PFT/RH
 jHkbLXgimJXpEcX8FJNJ4PyMLvfCexRBCdQu5HftT5EhNKvZ3/WgliNRu Q==;
IronPort-SDR: qBQd2rtvJymyGEhGQ7m1AxbvwQJAWgeghGrCI4/9ymarcfhK2bSRTRxk2LfuENqVkZjFWI7CEE
 WAyzeOjqmX2EioDvLnQCBbVLfsncX3xbau2WGeg+72Xz5ELT0MMNCacshu0eUoXKs3e1qZQNaD
 P47gdnlROeW3SK9ficQpjWCh7B8mHKcdssqwHNyNSIjcLp/K3irRtHjHbUwkakGJg2o5bUm4b+
 2oPWEXB1WXAqc4igf0pkEKInxgQlvBS4QNBzdhzjKbWgjASQzxFnKzktQWtnOjFoKtXaNKNYaf
 M94=
X-IronPort-AV: E=Sophos;i="5.78,403,1599494400"; d="scan'208";a="258433468"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 04:20:51 +0800
IronPort-SDR: PEnBLwWzEeHxxq9wVOfeZQTfIPgrlTSDYRAPb6DxLW0xBgK++ELUrKfZH2me1iCkVRGCCjGs1M
 903eQQ3KWD7I/238Ppby/jtgsyA3b4OZs=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 11:48:37 -0800
IronPort-SDR: YM9qPhs63aCO5hJoOxeuPXnc0mDhDT+L9EG/+tt9oCaraqULoEA4I+JK1qsX0N2ShprNTpQsb5
 LWPvPKJ/m8Vw==
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 12:04:36 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v11 10/13] hw/block/nvme: Introduce max active and open zone
 limits
Date: Wed,  9 Dec 2020 05:04:07 +0900
Message-Id: <20201208200410.27900-11-dmitry.fomichev@wdc.com>
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

Add two module properties, "zoned.max_active" and "zoned.max_open"
to control the maximum number of zones that can be active or open.
Once these variables are set to non-default values, these limits are
checked during I/O and Too Many Active or Too Many Open command status
is returned if they are exceeded.

Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
---
 hw/block/nvme-ns.h    | 41 +++++++++++++++++++
 hw/block/nvme-ns.c    | 31 ++++++++++++++-
 hw/block/nvme.c       | 92 +++++++++++++++++++++++++++++++++++++++++++
 hw/block/trace-events |  2 +
 4 files changed, 164 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 388381dda0..7e1fd26909 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -33,6 +33,8 @@ typedef struct NvmeNamespaceParams {
     bool     cross_zone_read;
     uint64_t zone_size_bs;
     uint64_t zone_cap_bs;
+    uint32_t max_active_zones;
+    uint32_t max_open_zones;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
@@ -54,6 +56,8 @@ typedef struct NvmeNamespace {
     uint64_t        zone_size;
     uint64_t        zone_capacity;
     uint32_t        zone_size_log2;
+    int32_t         nr_open_zones;
+    int32_t         nr_active_zones;
 
     NvmeNamespaceParams params;
 
@@ -125,6 +129,43 @@ static inline bool nvme_wp_is_valid(NvmeZone *zone)
            st != NVME_ZONE_STATE_OFFLINE;
 }
 
+static inline void nvme_aor_inc_open(NvmeNamespace *ns)
+{
+    assert(ns->nr_open_zones >= 0);
+    if (ns->params.max_open_zones) {
+        ns->nr_open_zones++;
+        assert(ns->nr_open_zones <= ns->params.max_open_zones);
+    }
+}
+
+static inline void nvme_aor_dec_open(NvmeNamespace *ns)
+{
+    if (ns->params.max_open_zones) {
+        assert(ns->nr_open_zones > 0);
+        ns->nr_open_zones--;
+    }
+    assert(ns->nr_open_zones >= 0);
+}
+
+static inline void nvme_aor_inc_active(NvmeNamespace *ns)
+{
+    assert(ns->nr_active_zones >= 0);
+    if (ns->params.max_active_zones) {
+        ns->nr_active_zones++;
+        assert(ns->nr_active_zones <= ns->params.max_active_zones);
+    }
+}
+
+static inline void nvme_aor_dec_active(NvmeNamespace *ns)
+{
+    if (ns->params.max_active_zones) {
+        assert(ns->nr_active_zones > 0);
+        ns->nr_active_zones--;
+        assert(ns->nr_active_zones >= ns->nr_open_zones);
+    }
+    assert(ns->nr_active_zones >= 0);
+}
+
 int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 1df45bbe35..aaef69fb47 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -136,6 +136,21 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
     ns->zone_size = zone_size / lbasz;
     ns->zone_capacity = zone_cap / lbasz;
     ns->num_zones = ns->size / lbasz / ns->zone_size;
+
+    /* Do a few more sanity checks of ZNS properties */
+    if (ns->params.max_open_zones > ns->num_zones) {
+        error_setg(errp,
+                   "max_open_zones value %u exceeds the number of zones %u",
+                   ns->params.max_open_zones, ns->num_zones);
+        return -1;
+    }
+    if (ns->params.max_active_zones > ns->num_zones) {
+        error_setg(errp,
+                   "max_active_zones value %u exceeds the number of zones %u",
+                   ns->params.max_active_zones, ns->num_zones);
+        return -1;
+    }
+
     return 0;
 }
 
@@ -183,8 +198,8 @@ static void nvme_ns_init_zoned(NvmeCtrl *n, NvmeNamespace *ns, int lba_index)
     id_ns_z = g_malloc0(sizeof(NvmeIdNsZoned));
 
     /* MAR/MOR are zeroes-based, 0xffffffff means no limit */
-    id_ns_z->mar = 0xffffffff;
-    id_ns_z->mor = 0xffffffff;
+    id_ns_z->mar = cpu_to_le32(ns->params.max_active_zones - 1);
+    id_ns_z->mor = cpu_to_le32(ns->params.max_open_zones - 1);
     id_ns_z->zoc = 0;
     id_ns_z->ozcs = ns->params.cross_zone_read ? 0x01 : 0x00;
 
@@ -210,6 +225,7 @@ static void nvme_clear_zone(NvmeNamespace *ns, NvmeZone *zone)
             trace_pci_nvme_clear_ns_close(state, zone->d.zslba);
             nvme_set_zone_state(zone, NVME_ZONE_STATE_CLOSED);
         }
+        nvme_aor_inc_active(ns);
         QTAILQ_INSERT_HEAD(&ns->closed_zones, zone, entry);
     } else {
         trace_pci_nvme_clear_ns_reset(state, zone->d.zslba);
@@ -226,16 +242,23 @@ static void nvme_zoned_ns_shutdown(NvmeNamespace *ns)
 
     QTAILQ_FOREACH_SAFE(zone, &ns->closed_zones, entry, next) {
         QTAILQ_REMOVE(&ns->closed_zones, zone, entry);
+        nvme_aor_dec_active(ns);
         nvme_clear_zone(ns, zone);
     }
     QTAILQ_FOREACH_SAFE(zone, &ns->imp_open_zones, entry, next) {
         QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
+        nvme_aor_dec_open(ns);
+        nvme_aor_dec_active(ns);
         nvme_clear_zone(ns, zone);
     }
     QTAILQ_FOREACH_SAFE(zone, &ns->exp_open_zones, entry, next) {
         QTAILQ_REMOVE(&ns->exp_open_zones, zone, entry);
+        nvme_aor_dec_open(ns);
+        nvme_aor_dec_active(ns);
         nvme_clear_zone(ns, zone);
     }
+
+    assert(ns->nr_open_zones == 0);
 }
 
 static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
@@ -320,6 +343,10 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_SIZE("zoned.zcap", NvmeNamespace, params.zone_cap_bs, 0),
     DEFINE_PROP_BOOL("zoned.cross_read", NvmeNamespace,
                      params.cross_zone_read, false),
+    DEFINE_PROP_UINT32("zoned.max_active", NvmeNamespace,
+                       params.max_active_zones, 0),
+    DEFINE_PROP_UINT32("zoned.max_open", NvmeNamespace,
+                       params.max_open_zones, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d1c57cb322..8b97b713a3 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -202,6 +202,26 @@ static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
     }
 }
 
+/*
+ * Check if we can open a zone without exceeding open/active limits.
+ * AOR stands for "Active and Open Resources" (see TP 4053 section 2.5).
+ */
+static int nvme_aor_check(NvmeNamespace *ns, uint32_t act, uint32_t opn)
+{
+    if (ns->params.max_active_zones != 0 &&
+        ns->nr_active_zones + act > ns->params.max_active_zones) {
+        trace_pci_nvme_err_insuff_active_res(ns->params.max_active_zones);
+        return NVME_ZONE_TOO_MANY_ACTIVE | NVME_DNR;
+    }
+    if (ns->params.max_open_zones != 0 &&
+        ns->nr_open_zones + opn > ns->params.max_open_zones) {
+        trace_pci_nvme_err_insuff_open_res(ns->params.max_open_zones);
+        return NVME_ZONE_TOO_MANY_OPEN | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
 {
     hwaddr low = n->ctrl_mem.addr;
@@ -1127,6 +1147,40 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
     return status;
 }
 
+static void nvme_auto_transition_zone(NvmeNamespace *ns)
+{
+    NvmeZone *zone;
+
+    if (ns->params.max_open_zones &&
+        ns->nr_open_zones == ns->params.max_open_zones) {
+        zone = QTAILQ_FIRST(&ns->imp_open_zones);
+        if (zone) {
+            /*
+             * Automatically close this implicitly open zone.
+             */
+            QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
+            nvme_aor_dec_open(ns);
+            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
+        }
+    }
+}
+
+static uint16_t nvme_auto_open_zone(NvmeNamespace *ns, NvmeZone *zone)
+{
+    uint16_t status = NVME_SUCCESS;
+    uint8_t zs = nvme_get_zone_state(zone);
+
+    if (zs == NVME_ZONE_STATE_EMPTY) {
+        nvme_auto_transition_zone(ns);
+        status = nvme_aor_check(ns, 1, 1);
+    } else if (zs == NVME_ZONE_STATE_CLOSED) {
+        nvme_auto_transition_zone(ns);
+        status = nvme_aor_check(ns, 0, 1);
+    }
+
+    return status;
+}
+
 static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
                                       bool failed)
 {
@@ -1147,7 +1201,11 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
         switch (nvme_get_zone_state(zone)) {
         case NVME_ZONE_STATE_IMPLICITLY_OPEN:
         case NVME_ZONE_STATE_EXPLICITLY_OPEN:
+            nvme_aor_dec_open(ns);
+            /* fall through */
         case NVME_ZONE_STATE_CLOSED:
+            nvme_aor_dec_active(ns);
+            /* fall through */
         case NVME_ZONE_STATE_EMPTY:
             nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_FULL);
             /* fall through */
@@ -1174,7 +1232,10 @@ static uint64_t nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
         zs = nvme_get_zone_state(zone);
         switch (zs) {
         case NVME_ZONE_STATE_EMPTY:
+            nvme_aor_inc_active(ns);
+            /* fall through */
         case NVME_ZONE_STATE_CLOSED:
+            nvme_aor_inc_open(ns);
             nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_OPEN);
         }
     }
@@ -1448,6 +1509,11 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
             goto invalid;
         }
 
+        status = nvme_auto_open_zone(ns, zone);
+        if (status != NVME_SUCCESS) {
+            goto invalid;
+        }
+
         if (append) {
             slba = zone->w_ptr;
         }
@@ -1543,9 +1609,26 @@ enum NvmeZoneProcessingMask {
 static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
                                enum NvmeZoneState state)
 {
+    uint16_t status;
+
     switch (state) {
     case NVME_ZONE_STATE_EMPTY:
+        status = nvme_aor_check(ns, 1, 0);
+        if (status != NVME_SUCCESS) {
+            return status;
+        }
+        nvme_aor_inc_active(ns);
+        /* fall through */
     case NVME_ZONE_STATE_CLOSED:
+        status = nvme_aor_check(ns, 0, 1);
+        if (status != NVME_SUCCESS) {
+            if (state == NVME_ZONE_STATE_EMPTY) {
+                nvme_aor_dec_active(ns);
+            }
+            return status;
+        }
+        nvme_aor_inc_open(ns);
+        /* fall through */
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EXPLICITLY_OPEN);
         /* fall through */
@@ -1562,6 +1645,7 @@ static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(ns);
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
         /* fall through */
     case NVME_ZONE_STATE_CLOSED:
@@ -1577,7 +1661,11 @@ static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(ns);
+        /* fall through */
     case NVME_ZONE_STATE_CLOSED:
+        nvme_aor_dec_active(ns);
+        /* fall through */
     case NVME_ZONE_STATE_EMPTY:
         zone->w_ptr = nvme_zone_wr_boundary(zone);
         zone->d.wp = zone->w_ptr;
@@ -1596,7 +1684,11 @@ static uint16_t nvme_reset_zone(NvmeNamespace *ns, NvmeZone *zone,
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(ns);
+        /* fall through */
     case NVME_ZONE_STATE_CLOSED:
+        nvme_aor_dec_active(ns);
+        /* fall through */
     case NVME_ZONE_STATE_FULL:
         zone->w_ptr = zone->d.zslba;
         zone->d.wp = zone->w_ptr;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 63db3a353e..0b8564e028 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -126,6 +126,8 @@ pci_nvme_err_append_not_at_start(uint64_t slba, uint64_t zone) "appending at slb
 pci_nvme_err_zone_write_not_ok(uint64_t slba, uint32_t nlb, uint32_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
 pci_nvme_err_zone_read_not_ok(uint64_t slba, uint32_t nlb, uint32_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
 pci_nvme_err_append_too_large(uint64_t slba, uint32_t nlb, uint8_t zasl) "slba=%"PRIu64", nlb=%"PRIu32", zasl=%"PRIu8""
+pci_nvme_err_insuff_active_res(uint32_t max_active) "max_active=%"PRIu32" zone limit exceeded"
+pci_nvme_err_insuff_open_res(uint32_t max_open) "max_open=%"PRIu32" zone limit exceeded"
 pci_nvme_err_invalid_iocsci(uint32_t idx) "unsupported command set combination index %"PRIu32""
 pci_nvme_err_invalid_del_sq(uint16_t qid) "invalid submission queue deletion, sid=%"PRIu16""
 pci_nvme_err_invalid_create_sq_cqid(uint16_t cqid) "failed creating submission queue, invalid cqid=%"PRIu16""
-- 
2.28.0



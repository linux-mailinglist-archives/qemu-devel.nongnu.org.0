Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661AA29211D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 04:24:33 +0200 (CEST)
Received: from localhost ([::1]:51676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUKqe-0007W3-Fb
	for lists+qemu-devel@lfdr.de; Sun, 18 Oct 2020 22:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5541069a6=dmitry.fomichev@wdc.com>)
 id 1kUKk9-0008Cm-PW; Sun, 18 Oct 2020 22:17:49 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:44111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5541069a6=dmitry.fomichev@wdc.com>)
 id 1kUKk7-0004HN-46; Sun, 18 Oct 2020 22:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603073866; x=1634609866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZInA5bc05tdFpX0RBH8fz4YxYzhOl0To+LlACckGMJw=;
 b=Q7CJJRJ+bxNPpcGBzkp09iHwtLO+lpMjM7LYGd4nFwUUXTQDpnTGnpq5
 lib2HMD1QCin9EEfO0gF18nSVnA+vHyL9ZqZCgxyK30WGtFKiiWVZNL5+
 lbxNgqqraN9K1guPBgjFyMLwLKfskozhHPwiWO7MP8RB+JhAMruFHs/2u
 3Bt4F+qBnZdY6dLfQuxcUZcfCEbmpGByS7O2ewg52VY0Y4ZiZmIBp6soW
 zfnOeSD+MC4vw8DUuJTHh7f+NmJoJQkItSedh+Ytdrw2GcVNuSlscBkWz
 +PycojppzbCWFPFgHj7WNvj6lhw4CZWX9JuzWBHfoaytdiA7eh4tJZZbk A==;
IronPort-SDR: JzmqYAvZGsRqwp8odk/M4ttAOiBkuitZ4vdpyt4hDdvgZ+FgKer/2eh4USXbVEwMAdpX8uAqCK
 ZNIPhK9qs/LfUJynlLlMJih/KC7vk7Fjy8t+YiK9paVIuixVjwANFgmJozOi8VX4CnnmvqoSID
 DVw54o+uZZJm3W3Ly2Ku7WWbffWNVi8PJW1fNkA0071QYx9XwGY3VSJppu7nvRmWs/nuQeW1ac
 xIo05aMlUlcocKfZNb6VBrd+EU9hCMKuacF/3fPQmE30mq3Y1S/Pk88F9ZTACQY0FZqnAWmtCx
 /Uc=
X-IronPort-AV: E=Sophos;i="5.77,393,1596470400"; d="scan'208";a="150207968"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Oct 2020 10:17:45 +0800
IronPort-SDR: fJy5E9WJh8ZcpCuimt498pL8/u7ax86wHDPvPhWfluXyOokme85isdMvuHN2RFs0uZ/iPaNnqQ
 HZeWb/1mT1TFcUH3klOSo1ZyR/4hUP2D4+f38COB0pPQilpg/N/CdYaGbCGROY7Rqgs6z/ZRhE
 hQtReLclQT4bCD+Ap634J69Z3rzZoGP8YTLlU5F0x28JdrQuMwe2nWhiFYlWkrqi5xIOZfqKWH
 HRtamk7IQyjtc3La+g6I0ICfnsXQxwH9+gAXr7Gb4NdSu3FN4HhwVlxEzRsH2hk76/LvEYnYEw
 KpJPZa1SWHPn/MZ7dOCaN5gD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2020 19:03:22 -0700
IronPort-SDR: 5uS793SbGhehkBZVYXnBpf5l/oQrJhdI3MSJkvI4+ZedfZuowlAYU7P4oCdgA+f+PtCLU/YMXt
 3h+3Bh0pPHnTIR7kW3HbdFVgbYBq5x5ffZeWwlseOE349ci+l7cVDvQTrKRCPGDHpyUE5pIpN+
 kSC0vz90edamH/GN8MwMmnbkcWWTRe+Qzrd5hnT2rlvJJNs0LutwT93RhsEuuY68/Reus6G+fR
 Ln1oCiYlGTmsC8WQgzGmj7+w93xOoZQCGuWzy0GCq4M9XDvyVya9h8LcKnps0lelkqfm0duGlr
 B0Q=
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Oct 2020 19:17:44 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v7 06/11] hw/block/nvme: Introduce max active and open zone
 limits
Date: Mon, 19 Oct 2020 11:17:21 +0900
Message-Id: <20201019021726.12048-7-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201019021726.12048-1-dmitry.fomichev@wdc.com>
References: <20201019021726.12048-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=5541069a6=dmitry.fomichev@wdc.com; helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/18 22:17:33
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

Add two module properties, "max_active" and "max_open" to control
the maximum number of zones that can be active or open. Once these
variables are set to non-default values, these limits are checked
during I/O and Too Many Active or Too Many Open command status is
returned if they are exceeded.

Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme-ns.c | 28 ++++++++++++-
 hw/block/nvme-ns.h | 41 +++++++++++++++++++
 hw/block/nvme.c    | 99 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index fedfad595c..8d9e11eef2 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -118,6 +118,20 @@ static int nvme_calc_zone_geometry(NvmeNamespace *ns, Error **errp)
         ns->zone_size_log2 = 63 - clz64(ns->zone_size);
     }
 
+    /* Make sure that the values of all ZNS properties are sane */
+    if (ns->params.max_open_zones > nz) {
+        error_setg(errp,
+                   "max_open_zones value %u exceeds the number of zones %u",
+                   ns->params.max_open_zones, nz);
+        return -1;
+    }
+    if (ns->params.max_active_zones > nz) {
+        error_setg(errp,
+                   "max_active_zones value %u exceeds the number of zones %u",
+                   ns->params.max_active_zones, nz);
+        return -1;
+    }
+
     return 0;
 }
 
@@ -172,8 +186,8 @@ static int nvme_zoned_init_ns(NvmeCtrl *n, NvmeNamespace *ns, int lba_index,
     id_ns_z = g_malloc0(sizeof(NvmeIdNsZoned));
 
     /* MAR/MOR are zeroes-based, 0xffffffff means no limit */
-    id_ns_z->mar = 0xffffffff;
-    id_ns_z->mor = 0xffffffff;
+    id_ns_z->mar = cpu_to_le32(ns->params.max_active_zones - 1);
+    id_ns_z->mor = cpu_to_le32(ns->params.max_open_zones - 1);
     id_ns_z->zoc = 0;
     id_ns_z->ozcs = ns->params.cross_zone_read ? 0x01 : 0x00;
 
@@ -199,6 +213,9 @@ static void nvme_zoned_clear_ns(NvmeNamespace *ns)
     uint32_t set_state;
     int i;
 
+    ns->nr_active_zones = 0;
+    ns->nr_open_zones = 0;
+
     zone = ns->zone_array;
     for (i = 0; i < ns->num_zones; i++, zone++) {
         switch (nvme_get_zone_state(zone)) {
@@ -209,6 +226,7 @@ static void nvme_zoned_clear_ns(NvmeNamespace *ns)
             QTAILQ_REMOVE(&ns->exp_open_zones, zone, entry);
             break;
         case NVME_ZONE_STATE_CLOSED:
+            nvme_aor_inc_active(ns);
             /* fall through */
         default:
             continue;
@@ -216,6 +234,9 @@ static void nvme_zoned_clear_ns(NvmeNamespace *ns)
 
         if (zone->d.wp == zone->d.zslba) {
             set_state = NVME_ZONE_STATE_EMPTY;
+        } else if (ns->params.max_active_zones == 0 ||
+                   ns->nr_active_zones < ns->params.max_active_zones) {
+            set_state = NVME_ZONE_STATE_CLOSED;
         } else {
             set_state = NVME_ZONE_STATE_CLOSED;
         }
@@ -224,6 +245,7 @@ static void nvme_zoned_clear_ns(NvmeNamespace *ns)
         case NVME_ZONE_STATE_CLOSED:
             trace_pci_nvme_clear_ns_close(nvme_get_zone_state(zone),
                                           zone->d.zslba);
+            nvme_aor_inc_active(ns);
             QTAILQ_INSERT_TAIL(&ns->closed_zones, zone, entry);
             break;
         case NVME_ZONE_STATE_EMPTY:
@@ -326,6 +348,8 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_SIZE("zone_capacity", NvmeNamespace, params.zone_cap_bs, 0),
     DEFINE_PROP_BOOL("cross_zone_read", NvmeNamespace,
                      params.cross_zone_read, false),
+    DEFINE_PROP_UINT32("max_active", NvmeNamespace, params.max_active_zones, 0),
+    DEFINE_PROP_UINT32("max_open", NvmeNamespace, params.max_open_zones, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 170cbb8cdc..b0633d0def 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -34,6 +34,8 @@ typedef struct NvmeNamespaceParams {
     bool     cross_zone_read;
     uint64_t zone_size_bs;
     uint64_t zone_cap_bs;
+    uint32_t max_active_zones;
+    uint32_t max_open_zones;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
@@ -56,6 +58,8 @@ typedef struct NvmeNamespace {
     uint64_t        zone_capacity;
     uint64_t        zone_array_size;
     uint32_t        zone_size_log2;
+    int32_t         nr_open_zones;
+    int32_t         nr_active_zones;
 
     NvmeNamespaceParams params;
 } NvmeNamespace;
@@ -123,6 +127,43 @@ static inline bool nvme_wp_is_valid(NvmeZone *zone)
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
 void nvme_ns_flush(NvmeNamespace *ns);
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 34d0d0250d..b3cdfccdfb 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -199,6 +199,26 @@ static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
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
@@ -1207,6 +1227,41 @@ static uint16_t nvme_check_zone_read(NvmeNamespace *ns, NvmeZone *zone,
     return status;
 }
 
+static void nvme_auto_transition_zone(NvmeNamespace *ns, bool implicit,
+                                      bool adding_active)
+{
+    NvmeZone *zone;
+
+    if (implicit && ns->params.max_open_zones &&
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
+        nvme_auto_transition_zone(ns, true, true);
+        status = nvme_aor_check(ns, 1, 1);
+    } else if (zs == NVME_ZONE_STATE_CLOSED) {
+        nvme_auto_transition_zone(ns, true, false);
+        status = nvme_aor_check(ns, 0, 1);
+    }
+
+    return status;
+}
+
 static bool nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
                                       bool failed)
 {
@@ -1243,7 +1298,11 @@ static bool nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
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
@@ -1272,7 +1331,10 @@ static uint64_t nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
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
@@ -1378,6 +1440,11 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
             goto invalid;
         }
 
+        status = nvme_auto_open_zone(ns, zone);
+        if (status != NVME_SUCCESS) {
+            goto invalid;
+        }
+
         req->cqe.result64 = nvme_advance_zone_wp(ns, zone, nlb);
     }
 
@@ -1436,6 +1503,11 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req, bool append)
                 slba = zone->w_ptr;
             }
 
+            status = nvme_auto_open_zone(ns, zone);
+            if (status != NVME_SUCCESS) {
+                goto invalid;
+            }
+
             req->cqe.result64 = nvme_advance_zone_wp(ns, zone, nlb);
         } else {
             status = nvme_check_zone_read(ns, zone, slba, nlb, &rfc);
@@ -1537,9 +1609,27 @@ static uint16_t nvme_get_mgmt_zone_slba_idx(NvmeNamespace *ns, NvmeCmd *c,
 static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
                                uint8_t state)
 {
+    uint16_t status;
+
     switch (state) {
     case NVME_ZONE_STATE_EMPTY:
+        nvme_auto_transition_zone(ns, false, true);
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
@@ -1561,6 +1651,7 @@ static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(ns);
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
         /* fall through */
     case NVME_ZONE_STATE_CLOSED:
@@ -1582,7 +1673,11 @@ static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
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
@@ -1608,7 +1703,11 @@ static uint16_t nvme_reset_zone(NvmeNamespace *ns, NvmeZone *zone,
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
-- 
2.21.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1823267CCC
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Sep 2020 00:58:59 +0200 (CEST)
Received: from localhost ([::1]:59464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHETy-000359-MF
	for lists+qemu-devel@lfdr.de; Sat, 12 Sep 2020 18:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=517336518=dmitry.fomichev@wdc.com>)
 id 1kHEQE-0004Le-6S; Sat, 12 Sep 2020 18:55:06 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=517336518=dmitry.fomichev@wdc.com>)
 id 1kHEQB-0005R7-3Y; Sat, 12 Sep 2020 18:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1599951302; x=1631487302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d1RT9MutixJLktOervHixvGvgRTaqnkc5lEkoE9fCGs=;
 b=EqRVtjME6Y16dTKeXdyyzsVPo3BWohon16KwlnVibjd97PJTB2xHH7Jx
 1hlqOJGxdDbrOILd2wxsfzBzkCjF5sbwfOdfCM3ObsnmGm8OT5znd0vZq
 7os5wvkdW1trb7F/8nzREdDSX6sLENsgOjhagF9HlX2bx00l4RCpSpIpY
 1EWLf/wcBdsAHoEYQgaN7flUX9toCSUmQc2LXXTsrWMkojIUVFc33QWSC
 KbxJ7tc8ZrxfWi4B105O77b+TEoLgx5XSsp68T8NbThIx9BxNDPAgS83U
 WOxdKXAFyOPaPudm+77LSu+cMtvqIMFk1Ds9ukiqHR6V7LMLrn0c87Zih w==;
IronPort-SDR: cL0GJa1fWO+hBCTqxvPLws4EcdqK3bLn5w77x6VMfmSc2FoukEEt5JxdlBjCY8T/eXzv1R+WBw
 7g8nKGTk2FSvtkltXw7H4r/2MEJuUy0xL/UHrQNoRKXESrUcD0T8eOn+LscFO046tzajUMGXHN
 2iZDFjyoox1foPkuceOCf0zgdhEulx1js2Mv/tpvzp/6Z1Ruq5AC3zSlzz7jnIoc7BbpYbatMA
 laOCl4dGbIrGeE9N5g4ld1b7eYBS0D121yX76mSMCf43/TzQE50V54aWYqag1j2YKMeH383AGu
 YTo=
X-IronPort-AV: E=Sophos;i="5.76,420,1592841600"; d="scan'208";a="256834862"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Sep 2020 06:55:01 +0800
IronPort-SDR: GC3eRfAOlhZWqTaVBlP/YQ1UI329F+ZrE3h4Ef84u98vPJyN2GYcO9HfgeOt2n3Ih56Sfhljww
 wgjue71IgrAQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2020 15:41:21 -0700
IronPort-SDR: UG4YrvMaHOYwX0lyDXNeoWWkZK2rw7k5XDNNKTFWIORIci74J5qkBVXm5WzWYBdo9GVjRio1Mt
 t4B4ugKMBzSw==
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 12 Sep 2020 15:55:00 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Maxim Levitsky <mlevitsky@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v2 11/15] hw/block/nvme: Introduce max active and open zone
 limits
Date: Sun, 13 Sep 2020 07:54:26 +0900
Message-Id: <20200912225430.1772-12-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200912225430.1772-1-dmitry.fomichev@wdc.com>
References: <20200912225430.1772-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=517336518=dmitry.fomichev@wdc.com; helo=esa1.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/12 18:54:38
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

Added two module properties, "max_active" and "max_open" to control
the maximum number of zones that can be active or open. Once these
variables are set to non-default values, these limits are checked
during I/O and Too Many Active or Too Many Open command status is
returned if they are exceeded.

Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c | 179 +++++++++++++++++++++++++++++++++++++++++++++++-
 hw/block/nvme.h |   4 ++
 2 files changed, 181 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 1b0e06002c..df536fd736 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -176,6 +176,87 @@ static void nvme_remove_zone(NvmeCtrl *n, NvmeNamespace *ns, NvmeZoneList *zl,
     zone->prev = zone->next = 0;
 }
 
+/*
+ * Take the first zone out from a list, return NULL if the list is empty.
+ */
+static NvmeZone *nvme_remove_zone_head(NvmeCtrl *n, NvmeNamespace *ns,
+                                       NvmeZoneList *zl)
+{
+    NvmeZone *zone = nvme_peek_zone_head(ns, zl);
+
+    if (zone) {
+        --zl->size;
+        if (zl->size == 0) {
+            zl->head = NVME_ZONE_LIST_NIL;
+            zl->tail = NVME_ZONE_LIST_NIL;
+        } else {
+            zl->head = zone->next;
+            ns->zone_array[zl->head].prev = NVME_ZONE_LIST_NIL;
+        }
+        zone->prev = zone->next = 0;
+    }
+
+    return zone;
+}
+
+/*
+ * Check if we can open a zone without exceeding open/active limits.
+ * AOR stands for "Active and Open Resources" (see TP 4053 section 2.5).
+ */
+static int nvme_aor_check(NvmeCtrl *n, NvmeNamespace *ns,
+                          uint32_t act, uint32_t opn)
+{
+    if (n->params.max_active_zones != 0 &&
+        ns->nr_active_zones + act > n->params.max_active_zones) {
+        trace_pci_nvme_err_insuff_active_res(n->params.max_active_zones);
+        return NVME_ZONE_TOO_MANY_ACTIVE | NVME_DNR;
+    }
+    if (n->params.max_open_zones != 0 &&
+        ns->nr_open_zones + opn > n->params.max_open_zones) {
+        trace_pci_nvme_err_insuff_open_res(n->params.max_open_zones);
+        return NVME_ZONE_TOO_MANY_OPEN | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static inline void nvme_aor_inc_open(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    assert(ns->nr_open_zones >= 0);
+    if (n->params.max_open_zones) {
+        ns->nr_open_zones++;
+        assert(ns->nr_open_zones <= n->params.max_open_zones);
+    }
+}
+
+static inline void nvme_aor_dec_open(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    if (n->params.max_open_zones) {
+        assert(ns->nr_open_zones > 0);
+        ns->nr_open_zones--;
+    }
+    assert(ns->nr_open_zones >= 0);
+}
+
+static inline void nvme_aor_inc_active(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    assert(ns->nr_active_zones >= 0);
+    if (n->params.max_active_zones) {
+        ns->nr_active_zones++;
+        assert(ns->nr_active_zones <= n->params.max_active_zones);
+    }
+}
+
+static inline void nvme_aor_dec_active(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    if (n->params.max_active_zones) {
+        assert(ns->nr_active_zones > 0);
+        ns->nr_active_zones--;
+        assert(ns->nr_active_zones >= ns->nr_open_zones);
+    }
+    assert(ns->nr_active_zones >= 0);
+}
+
 static void nvme_assign_zone_state(NvmeCtrl *n, NvmeNamespace *ns,
                                    NvmeZone *zone, uint8_t state)
 {
@@ -715,6 +796,24 @@ static inline uint16_t nvme_check_bounds(NvmeCtrl *n, NvmeNamespace *ns,
     return NVME_SUCCESS;
 }
 
+static void nvme_auto_transition_zone(NvmeCtrl *n, NvmeNamespace *ns,
+                                      bool implicit, bool adding_active)
+{
+    NvmeZone *zone;
+
+    if (implicit && n->params.max_open_zones &&
+        ns->nr_open_zones == n->params.max_open_zones) {
+        zone = nvme_remove_zone_head(n, ns, ns->imp_open_zones);
+        if (zone) {
+            /*
+             * Automatically close this implicitly open zone.
+             */
+            nvme_aor_dec_open(n, ns);
+            nvme_assign_zone_state(n, ns, zone, NVME_ZONE_STATE_CLOSED);
+        }
+    }
+}
+
 static uint16_t nvme_check_zone_write(NvmeZone *zone, uint64_t slba,
                                       uint32_t nlb)
 {
@@ -792,6 +891,23 @@ static uint16_t nvme_check_zone_read(NvmeCtrl *n, NvmeZone *zone, uint64_t slba,
     return status;
 }
 
+static uint16_t nvme_auto_open_zone(NvmeCtrl *n, NvmeNamespace *ns,
+                                    NvmeZone *zone)
+{
+    uint16_t status = NVME_SUCCESS;
+    uint8_t zs = nvme_get_zone_state(zone);
+
+    if (zs == NVME_ZONE_STATE_EMPTY) {
+        nvme_auto_transition_zone(n, ns, true, true);
+        status = nvme_aor_check(n, ns, 1, 1);
+    } else if (zs == NVME_ZONE_STATE_CLOSED) {
+        nvme_auto_transition_zone(n, ns, true, false);
+        status = nvme_aor_check(n, ns, 0, 1);
+    }
+
+    return status;
+}
+
 static inline uint32_t nvme_zone_idx(NvmeCtrl *n, uint64_t slba)
 {
     return n->zone_size_log2 > 0 ? slba >> n->zone_size_log2 :
@@ -827,7 +943,11 @@ static void nvme_finalize_zone_write(NvmeCtrl *n, NvmeRequest *req)
         switch (zs) {
         case NVME_ZONE_STATE_IMPLICITLY_OPEN:
         case NVME_ZONE_STATE_EXPLICITLY_OPEN:
+            nvme_aor_dec_open(n, ns);
+            /* fall through */
         case NVME_ZONE_STATE_CLOSED:
+            nvme_aor_dec_active(n, ns);
+            /* fall through */
         case NVME_ZONE_STATE_EMPTY:
             break;
         default:
@@ -837,7 +957,10 @@ static void nvme_finalize_zone_write(NvmeCtrl *n, NvmeRequest *req)
     } else {
         switch (zs) {
         case NVME_ZONE_STATE_EMPTY:
+            nvme_aor_inc_active(n, ns);
+            /* fall through */
         case NVME_ZONE_STATE_CLOSED:
+            nvme_aor_inc_open(n, ns);
             nvme_assign_zone_state(n, ns, zone,
                                    NVME_ZONE_STATE_IMPLICITLY_OPEN);
         }
@@ -922,6 +1045,11 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
                                                zone->d.wp);
             return NVME_ZONE_INVALID_WRITE | NVME_DNR;
         }
+
+        status = nvme_auto_open_zone(n, ns, zone);
+        if (status != NVME_SUCCESS) {
+            return status;
+        }
     }
 
     block_acct_start(blk_get_stats(n->conf.blk), &req->acct, 0,
@@ -993,6 +1121,12 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req, bool append)
                                                    zone->d.wp);
                 return NVME_ZONE_INVALID_WRITE | NVME_DNR;
             }
+
+            status = nvme_auto_open_zone(n, ns, zone);
+            if (status != NVME_SUCCESS) {
+                return status;
+            }
+
             req->fill_ofs = -1LL;
         } else {
             status = nvme_check_zone_read(n, zone, slba, nlb,
@@ -1085,9 +1219,27 @@ static uint16_t nvme_get_mgmt_zone_slba_idx(NvmeCtrl *n, NvmeNamespace *ns,
 static uint16_t nvme_open_zone(NvmeCtrl *n, NvmeNamespace *ns,
                                NvmeZone *zone, uint8_t state)
 {
+    uint16_t status;
+
     switch (state) {
     case NVME_ZONE_STATE_EMPTY:
+        nvme_auto_transition_zone(n, ns, false, true);
+        status = nvme_aor_check(n, ns, 1, 0);
+        if (status != NVME_SUCCESS) {
+            return status;
+        }
+        nvme_aor_inc_active(n, ns);
+        /* fall through */
     case NVME_ZONE_STATE_CLOSED:
+        status = nvme_aor_check(n, ns, 0, 1);
+        if (status != NVME_SUCCESS) {
+            if (state == NVME_ZONE_STATE_EMPTY) {
+                nvme_aor_dec_active(n, ns);
+            }
+            return status;
+        }
+        nvme_aor_inc_open(n, ns);
+        /* fall through */
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
         nvme_assign_zone_state(n, ns, zone, NVME_ZONE_STATE_EXPLICITLY_OPEN);
         /* fall through */
@@ -1109,6 +1261,7 @@ static uint16_t nvme_close_zone(NvmeCtrl *n,  NvmeNamespace *ns,
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(n, ns);
         nvme_assign_zone_state(n, ns, zone, NVME_ZONE_STATE_CLOSED);
         /* fall through */
     case NVME_ZONE_STATE_CLOSED:
@@ -1130,7 +1283,11 @@ static uint16_t nvme_finish_zone(NvmeCtrl *n, NvmeNamespace *ns,
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(n, ns);
+        /* fall through */
     case NVME_ZONE_STATE_CLOSED:
+        nvme_aor_dec_active(n, ns);
+        /* fall through */
     case NVME_ZONE_STATE_EMPTY:
         zone->d.wp = nvme_zone_wr_boundary(zone);
         nvme_assign_zone_state(n, ns, zone, NVME_ZONE_STATE_FULL);
@@ -1155,7 +1312,11 @@ static uint16_t nvme_reset_zone(NvmeCtrl *n, NvmeNamespace *ns,
     switch (state) {
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(n, ns);
+        /* fall through */
     case NVME_ZONE_STATE_CLOSED:
+        nvme_aor_dec_active(n, ns);
+        /* fall through */
     case NVME_ZONE_STATE_FULL:
         zone->d.wp = zone->d.zslba;
         nvme_assign_zone_state(n, ns, zone, NVME_ZONE_STATE_EMPTY);
@@ -3218,6 +3379,18 @@ static void nvme_zoned_init_ctrl(NvmeCtrl *n, Error **errp)
         n->zasl_bs = n->params.zasl_kb * KiB;
     }
 
+    /* Make sure that the values of all Zoned Command Set properties are sane */
+    if (n->params.max_open_zones > nz) {
+        warn_report("max_open_zones value %u exceeds the number of zones %u,"
+                    " adjusting", n->params.max_open_zones, nz);
+        n->params.max_open_zones = nz;
+    }
+    if (n->params.max_active_zones > nz) {
+        warn_report("max_active_zones value %u exceeds the number of zones %u,"
+                    " adjusting", n->params.max_active_zones, nz);
+        n->params.max_active_zones = nz;
+    }
+
     return;
 }
 
@@ -3235,8 +3408,8 @@ static int nvme_zoned_init_ns(NvmeCtrl *n, NvmeNamespace *ns, int lba_index,
     ns->id_ns_zoned = g_malloc0(sizeof(*ns->id_ns_zoned));
 
     /* MAR/MOR are zeroes-based, 0xffffffff means no limit */
-    ns->id_ns_zoned->mar = 0xffffffff;
-    ns->id_ns_zoned->mor = 0xffffffff;
+    ns->id_ns_zoned->mar = cpu_to_le32(n->params.max_active_zones - 1);
+    ns->id_ns_zoned->mor = cpu_to_le32(n->params.max_open_zones - 1);
     ns->id_ns_zoned->zoc = 0;
     ns->id_ns_zoned->ozcs = n->params.cross_zone_read ? 0x01 : 0x00;
 
@@ -3632,6 +3805,8 @@ static Property nvme_props[] = {
                        NVME_DEFAULT_ZONE_SIZE),
     DEFINE_PROP_UINT64("zone_capacity", NvmeCtrl, params.zone_capacity_mb, 0),
     DEFINE_PROP_UINT32("zone_append_size_limit", NvmeCtrl, params.zasl_kb, 0),
+    DEFINE_PROP_UINT32("max_active", NvmeCtrl, params.max_active_zones, 0),
+    DEFINE_PROP_UINT32("max_open", NvmeCtrl, params.max_open_zones, 0),
     DEFINE_PROP_BOOL("cross_zone_read", NvmeCtrl, params.cross_zone_read, true),
     DEFINE_PROP_UINT8("fill_pattern", NvmeCtrl, params.fill_pattern, 0),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 9514c58919..4a3b23ed72 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -22,6 +22,8 @@ typedef struct NvmeParams {
     uint32_t    zasl_kb;
     uint64_t    zone_size_mb;
     uint64_t    zone_capacity_mb;
+    uint32_t    max_active_zones;
+    uint32_t    max_open_zones;
 } NvmeParams;
 
 typedef struct NvmeAsyncEvent {
@@ -103,6 +105,8 @@ typedef struct NvmeNamespace {
     NvmeZoneList    *imp_open_zones;
     NvmeZoneList    *closed_zones;
     NvmeZoneList    *full_zones;
+    int32_t         nr_open_zones;
+    int32_t         nr_active_zones;
 } NvmeNamespace;
 
 static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
-- 
2.21.0



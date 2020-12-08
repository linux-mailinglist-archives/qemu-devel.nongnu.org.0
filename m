Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E57C2D354C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:36:03 +0100 (CET)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkeQ-0003BI-Ig
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjEV-00033E-I0; Tue, 08 Dec 2020 15:05:11 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjET-000629-IE; Tue, 08 Dec 2020 15:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607458900; x=1638994900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T/oSkf5co6fKvQt3ZORqKoEh2faB4xCiTnvi9Se7Pwo=;
 b=ahDKvG51EE/UeYTtAiJ5piTlOXoQxomjqLzRxEcTdGmk+SO4WT9RvGJ5
 9VngavzGCH0IsGgu7LkNNn4MQYUc4V5/fNUm5YmfzlTe2JFrNuhga8cUx
 0tXj+2XvBdE5Vl2Zz9tyOtV+gcPmqRoOlIZSQJcCnmIOacfxpyIIV8rd3
 k0IelwsZoxeWSIHiTATj5a2bhfCkUiAlGVDPR6Li+RrV6KZ/3ilk0PB6U
 cAO4XalwCXjMCpuS0f/Bap8IrgrPSExO2gRm1QE+nYX73BmmF3Xe+SImM
 jSiCEihQuuMdbkhk4/smhUw/y9urySzELfLItZ5Hx7Lsy6aw3zEsFq7Ri Q==;
IronPort-SDR: vCkdPSrDu/kh+0MIpd84p/9FGpaYY4ovrc5067ENglRKruViDGwWXv448bA3hSVpdPOift4c0c
 WpzCmmLtCwN1xTUUUdphuQCsH5XqYajLCApA05GrvKqNFx9Ss4KTjlanMabMEqjG1OizigcGa1
 IxbOUuIJU+I7XqK9tqGVk3XERnkhzo3u3uQKmkELHFcMB5G16gvzXhs1s9vpucs8FCOD+i26qk
 DPAQ9d47mBCVC0N0GKMBIGJcl8+7ANqXBZYsZLyeaHYIbAaLq8VdJI+z8+CyQ045fdeq2TGiLy
 lbI=
X-IronPort-AV: E=Sophos;i="5.78,403,1599494400"; d="scan'208";a="258433477"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 04:20:58 +0800
IronPort-SDR: kLil+wDbz/CMxTAWNBREH5HjQUIZ9EMSnrHOf+LNr9Z7RYlRXt4qibJKOcrG3iRDPTPXghSsDj
 rsNQk3gmb7R86bIX1kAXvRPJ4qE//Z+1o=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 11:48:42 -0800
IronPort-SDR: +DIUjFUUA0kSevVfoDjEXtqlL9UZAsQbuSDvENZrbpKOlCTlj/Dc7rp0zMWZ1ww7/RkPJwQosl
 IBdttgjOSVDQ==
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 12:04:40 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v11 12/13] hw/block/nvme: Add injection of Offline/Read-Only
 zones
Date: Wed,  9 Dec 2020 05:04:09 +0900
Message-Id: <20201208200410.27900-13-dmitry.fomichev@wdc.com>
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

ZNS specification defines two zone conditions for the zones that no
longer can function properly, possibly because of flash wear or other
internal fault. It is useful to be able to "inject" a small number of
such zones for testing purposes.

This commit defines two optional device properties, "offline_zones"
and "rdonly_zones". Users can assign non-zero values to these variables
to specify the number of zones to be initialized as Offline or
Read-Only. The actual number of injected zones may be smaller than the
requested amount - Read-Only and Offline counts are expected to be much
smaller than the total number of zones on a drive.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
---
 hw/block/nvme-ns.h |  2 ++
 hw/block/nvme-ns.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index f8f3c28c36..1196865b7a 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -36,6 +36,8 @@ typedef struct NvmeNamespaceParams {
     uint32_t max_active_zones;
     uint32_t max_open_zones;
     uint32_t zd_extension_size;
+    uint32_t nr_offline_zones;
+    uint32_t nr_rdonly_zones;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index c5a7bafcf7..0a8b741bc9 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -21,6 +21,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
+#include "crypto/random.h"
 
 #include "hw/qdev-properties.h"
 #include "hw/qdev-core.h"
@@ -163,6 +164,21 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
         }
     }
 
+    if (ns->params.max_open_zones < ns->num_zones) {
+        if (ns->params.nr_offline_zones >
+            ns->num_zones - ns->params.max_open_zones) {
+            error_setg(errp, "offline_zones value %u is too large",
+                ns->params.nr_offline_zones);
+            return -1;
+        }
+        if (ns->params.nr_rdonly_zones + ns->params.nr_offline_zones >
+            ns->num_zones - ns->params.max_open_zones) {
+            error_setg(errp, "rdonly_zones value %u is too large",
+                ns->params.nr_rdonly_zones);
+            return -1;
+        }
+    }
+
     return 0;
 }
 
@@ -171,7 +187,9 @@ static void nvme_ns_zoned_init_state(NvmeNamespace *ns)
     uint64_t start = 0, zone_size = ns->zone_size;
     uint64_t capacity = ns->num_zones * zone_size;
     NvmeZone *zone;
+    uint32_t rnd;
     int i;
+    uint16_t zs;
 
     ns->zone_array = g_new0(NvmeZone, ns->num_zones);
     if (ns->params.zd_extension_size) {
@@ -203,6 +221,37 @@ static void nvme_ns_zoned_init_state(NvmeNamespace *ns)
     if (is_power_of_2(ns->zone_size)) {
         ns->zone_size_log2 = 63 - clz64(ns->zone_size);
     }
+
+    /* If required, make some zones Offline or Read Only */
+
+    for (i = 0; i < ns->params.nr_offline_zones; i++) {
+        do {
+            qcrypto_random_bytes(&rnd, sizeof(rnd), NULL);
+            rnd %= ns->num_zones;
+        } while (rnd < ns->params.max_open_zones);
+        zone = &ns->zone_array[rnd];
+        zs = nvme_get_zone_state(zone);
+        if (zs != NVME_ZONE_STATE_OFFLINE) {
+            nvme_set_zone_state(zone, NVME_ZONE_STATE_OFFLINE);
+        } else {
+            i--;
+        }
+    }
+
+    for (i = 0; i < ns->params.nr_rdonly_zones; i++) {
+        do {
+            qcrypto_random_bytes(&rnd, sizeof(rnd), NULL);
+            rnd %= ns->num_zones;
+        } while (rnd < ns->params.max_open_zones);
+        zone = &ns->zone_array[rnd];
+        zs = nvme_get_zone_state(zone);
+        if (zs != NVME_ZONE_STATE_OFFLINE &&
+            zs != NVME_ZONE_STATE_READ_ONLY) {
+            nvme_set_zone_state(zone, NVME_ZONE_STATE_READ_ONLY);
+        } else {
+            i--;
+        }
+    }
 }
 
 static void nvme_ns_init_zoned(NvmeCtrl *n, NvmeNamespace *ns, int lba_index)
@@ -368,6 +417,10 @@ static Property nvme_ns_props[] = {
                        params.max_open_zones, 0),
     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
                        params.zd_extension_size, 0),
+    DEFINE_PROP_UINT32("zoned.offline_zones", NvmeNamespace,
+                       params.nr_offline_zones, 0),
+    DEFINE_PROP_UINT32("zoned.rdonly_zones", NvmeNamespace,
+                       params.nr_rdonly_zones, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.28.0



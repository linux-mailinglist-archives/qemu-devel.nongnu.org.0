Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F593E2321
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 08:10:04 +0200 (CEST)
Received: from localhost ([::1]:34414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBt3T-0006Ed-Um
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 02:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao3.xu@intel.com>) id 1mBt2O-0004xt-8c
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:08:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:41321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao3.xu@intel.com>) id 1mBt2L-0002tI-Fq
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:08:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="194586274"
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="194586274"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 23:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="513072998"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.55])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2021 23:08:48 -0700
From: Tao Xu <tao3.xu@intel.com>
To: chen.zhang@intel.com,
	lizhijian@cn.fujitsu.com,
	jasowang@redhat.com
Subject: [PATCH] net/colo: check vnet_hdr_support flag when using virtio-net
Date: Fri,  6 Aug 2021 14:08:37 +0800
Message-Id: <20210806060837.62774-1-tao3.xu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=tao3.xu@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tao Xu <tao3.xu@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When COLO use only one vnet_hdr_support parameter between
COLO network filter(filter-mirror, filter-redirector or
filter-rewriter and colo-compare, packet will not be parsed
correctly. Acquire network driver related to COLO, if it is
nirtio-net, check vnet_hdr_support flag of COLO network filter
and colo-compare.

Signed-off-by: Tao Xu <tao3.xu@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c    | 25 +++++++++++++++++++++++++
 net/colo.c            | 20 ++++++++++++++++++++
 net/colo.h            |  4 ++++
 net/filter-mirror.c   | 17 +++++++++++++++++
 net/filter-rewriter.c |  9 +++++++++
 5 files changed, 75 insertions(+)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index b100e7b51f..bc1cc951c0 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -838,6 +838,23 @@ static int compare_chr_can_read(void *opaque)
     return COMPARE_READ_LEN_MAX;
 }
 
+/* check vnet_hdr_support flag through COLO filter modules */
+static int colo_vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp)
+{
+    const char *colo_obj_type;
+
+    colo_obj_type = qemu_opt_get(opts, "qom-type");
+
+    if (strcmp(colo_obj_type, "filter-mirror") == 0 ||
+        strcmp(colo_obj_type, "filter-redirector") == 0 ||
+        strcmp(colo_obj_type, "filter-rewriter") == 0) {
+        if (qemu_opt_get(opts, "vnet_hdr_support")) {
+            return 1;
+        }
+    }
+    return 0;
+}
+
 /*
  * Called from the main thread on the primary for packets
  * arriving over the socket from the primary.
@@ -1289,6 +1306,14 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
         return;
     }
 
+    if (!s->vnet_hdr &&
+        qemu_opts_foreach(qemu_find_opts("object"),
+                          colo_vnet_driver_check, NULL, NULL)) {
+        error_setg(errp, "colo compare needs 'vnet_hdr_support' "
+                   "when colo filter modules work on virtio-net");
+        return;
+    }
+
     net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet_hdr);
     net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize, s->vnet_hdr);
 
diff --git a/net/colo.c b/net/colo.c
index 3a3e6e89a0..4a03780f45 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -243,3 +243,23 @@ bool connection_has_tracked(GHashTable *connection_track_table,
 
     return conn ? true : false;
 }
+
+/* check the network driver related to COLO, return 1 if it is virtio-net */
+int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp)
+{
+    const char *driver_type, *netdev_from_driver;
+    char *netdev_from_filter = (char *)opaque;
+
+    driver_type = qemu_opt_get(opts, "driver");
+    netdev_from_driver = qemu_opt_get(opts, "netdev");
+
+    if (!driver_type || !netdev_from_driver || !netdev_from_filter) {
+        return 0;
+    }
+
+    if (g_str_has_prefix(driver_type, "virtio-net") &&
+        strcmp(netdev_from_driver, netdev_from_filter) == 0) {
+        return 1;
+    }
+    return 0;
+}
diff --git a/net/colo.h b/net/colo.h
index d91cd245c4..d401fc76b6 100644
--- a/net/colo.h
+++ b/net/colo.h
@@ -18,6 +18,9 @@
 #include "qemu/jhash.h"
 #include "qemu/timer.h"
 #include "net/eth.h"
+#include "qemu/option.h"
+#include "qemu/option_int.h"
+#include "qemu/config-file.h"
 
 #define HASHTABLE_MAX_SIZE 16384
 
@@ -104,5 +107,6 @@ Packet *packet_new(const void *data, int size, int vnet_hdr_len);
 Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len);
 void packet_destroy(void *opaque, void *user_data);
 void packet_destroy_partial(void *opaque, void *user_data);
+int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp);
 
 #endif /* NET_COLO_H */
diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index f20240cc9f..b8b3f2fe1d 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "net/filter.h"
 #include "net/net.h"
+#include "net/colo.h"
 #include "qapi/error.h"
 #include "qom/object.h"
 #include "qemu/main-loop.h"
@@ -224,6 +225,14 @@ static void filter_mirror_setup(NetFilterState *nf, Error **errp)
         return;
     }
 
+    if (!s->vnet_hdr &&
+        qemu_opts_foreach(qemu_find_opts("device"),
+                         vnet_driver_check, nf->netdev_id, NULL)) {
+        error_setg(errp, "filter mirror needs 'vnet_hdr_support' "
+                   "when network driver is virtio-net");
+        return;
+    }
+
     qemu_chr_fe_init(&s->chr_out, chr, errp);
 }
 
@@ -252,6 +261,14 @@ static void filter_redirector_setup(NetFilterState *nf, Error **errp)
         }
     }
 
+    if (!s->vnet_hdr &&
+        qemu_opts_foreach(qemu_find_opts("device"),
+                         vnet_driver_check, nf->netdev_id, NULL)) {
+        error_setg(errp, "filter redirector needs 'vnet_hdr_support' "
+                   "when network driver is virtio-net");
+        return;
+    }
+
     net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
 
     if (s->indev) {
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index cb3a96cde1..0e84eac1f8 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -14,6 +14,7 @@
 #include "colo.h"
 #include "net/filter.h"
 #include "net/net.h"
+#include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qom/object.h"
 #include "qemu/main-loop.h"
@@ -388,6 +389,14 @@ static void colo_rewriter_setup(NetFilterState *nf, Error **errp)
 {
     RewriterState *s = FILTER_REWRITER(nf);
 
+    if (!s->vnet_hdr &&
+        qemu_opts_foreach(qemu_find_opts("device"),
+                         vnet_driver_check, nf->netdev_id, NULL)) {
+        error_setg(errp, "filter rewriter needs 'vnet_hdr_support' "
+                   "when network driver is virtio-net");
+        return;
+    }
+
     s->connection_track_table = g_hash_table_new_full(connection_key_hash,
                                                       connection_key_equal,
                                                       g_free,
-- 
2.31.1



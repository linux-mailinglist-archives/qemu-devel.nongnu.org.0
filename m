Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61814102EC
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 04:14:57 +0200 (CEST)
Received: from localhost ([::1]:39686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRPsW-0006YJ-DB
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 22:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mRPrQ-0005sU-MR
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 22:13:48 -0400
Received: from mga02.intel.com ([134.134.136.20]:31335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mRPrM-0002zw-BZ
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 22:13:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="210143393"
X-IronPort-AV: E=Sophos;i="5.85,303,1624345200"; d="scan'208";a="210143393"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 19:13:36 -0700
X-IronPort-AV: E=Sophos;i="5.85,303,1624345200"; d="scan'208";a="546747395"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 19:13:33 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH V3] net/colo: check vnet_hdr_support flag when using virtio-net
Date: Sat, 18 Sep 2021 10:04:37 +0800
Message-Id: <20210918020437.1822937-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>, Tao Xu <tao3.xu@intel.com>,
 Lukas Straub <lukasstraub2@web.de>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
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

Changelog:
v3:
    Fix some typos.
    Rebased for Qemu 6.2.

v2:
    Detect virtio-net driver and apply vnet_hdr_support
    automatically. (Jason)
---
 net/colo-compare.c    | 57 +++++++++++++++++++++++++++++++++++++++++++
 net/colo.c            | 20 +++++++++++++++
 net/colo.h            |  4 +++
 net/filter-mirror.c   | 21 ++++++++++++++++
 net/filter-rewriter.c | 10 ++++++++
 qapi/qom.json         |  6 +++++
 qemu-options.hx       |  6 +++--
 7 files changed, 122 insertions(+), 2 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index b100e7b51f..870bd05a41 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -110,6 +110,7 @@ struct CompareState {
     char *sec_indev;
     char *outdev;
     char *notify_dev;
+    char *netdev;
     CharBackend chr_pri_in;
     CharBackend chr_sec_in;
     CharBackend chr_out;
@@ -838,6 +839,28 @@ static int compare_chr_can_read(void *opaque)
     return COMPARE_READ_LEN_MAX;
 }
 
+static int colo_set_default_netdev(void *opaque, QemuOpts *opts, Error **errp)
+{
+    const char *colo_obj_type, *netdev_from_filter;
+    char **netdev = (char **)opaque;
+
+    colo_obj_type = qemu_opt_get(opts, "qom-type");
+
+    if (colo_obj_type &&
+        (strcmp(colo_obj_type, "filter-mirror") == 0 ||
+         strcmp(colo_obj_type, "filter-redirector") == 0 ||
+         strcmp(colo_obj_type, "filter-rewriter") == 0)) {
+        netdev_from_filter = qemu_opt_get(opts, "netdev");
+        if (*netdev == NULL) {
+            *netdev = g_strdup(netdev_from_filter);
+        } else if (strcmp(*netdev, netdev_from_filter) != 0) {
+            warn_report("%s is using a different netdev from other COLO "
+                        "component", colo_obj_type);
+        }
+    }
+    return 0;
+}
+
 /*
  * Called from the main thread on the primary for packets
  * arriving over the socket from the primary.
@@ -1050,6 +1073,21 @@ static void compare_set_vnet_hdr(Object *obj,
     s->vnet_hdr = value;
 }
 
+static char *compare_get_netdev(Object *obj, Error **errp)
+{
+    CompareState *s = COLO_COMPARE(obj);
+
+    return g_strdup(s->netdev);
+}
+
+static void compare_set_netdev(Object *obj, const char *value, Error **errp)
+{
+    CompareState *s = COLO_COMPARE(obj);
+
+    g_free(s->netdev);
+    s->netdev = g_strdup(value);
+}
+
 static char *compare_get_notify_dev(Object *obj, Error **errp)
 {
     CompareState *s = COLO_COMPARE(obj);
@@ -1274,6 +1312,12 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
         max_queue_size = MAX_QUEUE_SIZE;
     }
 
+    if (!s->netdev) {
+        /* Set default netdev as the first colo netfilter found */
+        qemu_opts_foreach(qemu_find_opts("object"),
+                          colo_set_default_netdev, &s->netdev, NULL);
+    }
+
     if (find_and_check_chardev(&chr, s->pri_indev, errp) ||
         !qemu_chr_fe_init(&s->chr_pri_in, chr, errp)) {
         return;
@@ -1289,6 +1333,16 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
         return;
     }
 
+    if (!s->vnet_hdr &&
+        qemu_opts_foreach(qemu_find_opts("device"),
+                          vnet_driver_check, s->netdev, NULL)) {
+        /*
+         * colo compare needs 'vnet_hdr_support' when it works on virtio-net,
+         * add 'vnet_hdr_support' automatically
+         */
+        s->vnet_hdr = true;
+    }
+
     net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet_hdr);
     net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize, s->vnet_hdr);
 
@@ -1400,6 +1454,9 @@ static void colo_compare_init(Object *obj)
     s->vnet_hdr = false;
     object_property_add_bool(obj, "vnet_hdr_support", compare_get_vnet_hdr,
                              compare_set_vnet_hdr);
+    /* colo compare can't varify that netdev is correct */
+    object_property_add_str(obj, "netdev", compare_get_netdev,
+                            compare_set_netdev);
 }
 
 void colo_compare_cleanup(void)
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
index f20240cc9f..69ca9c9839 100644
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
@@ -224,6 +225,16 @@ static void filter_mirror_setup(NetFilterState *nf, Error **errp)
         return;
     }
 
+    if (!s->vnet_hdr &&
+        qemu_opts_foreach(qemu_find_opts("device"),
+                          vnet_driver_check, nf->netdev_id, NULL)) {
+        /*
+         * filter mirror needs 'vnet_hdr_support' when colo filter modules
+         * work on virtio-net, add 'vnet_hdr_support' automatically
+         */
+        s->vnet_hdr = true;
+    }
+
     qemu_chr_fe_init(&s->chr_out, chr, errp);
 }
 
@@ -252,6 +263,16 @@ static void filter_redirector_setup(NetFilterState *nf, Error **errp)
         }
     }
 
+    if (!s->vnet_hdr &&
+        qemu_opts_foreach(qemu_find_opts("device"),
+                          vnet_driver_check, nf->netdev_id, NULL)) {
+        /*
+         * filter redirector needs 'vnet_hdr_support' when colo filter modules
+         * work on virtio-net, add 'vnet_hdr_support' automatically
+         */
+        s->vnet_hdr = true;
+    }
+
     net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
 
     if (s->indev) {
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index cb3a96cde1..637ef4ce71 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -388,6 +388,16 @@ static void colo_rewriter_setup(NetFilterState *nf, Error **errp)
 {
     RewriterState *s = FILTER_REWRITER(nf);
 
+    if (!s->vnet_hdr &&
+        qemu_opts_foreach(qemu_find_opts("device"),
+                          vnet_driver_check, nf->netdev_id, NULL)) {
+        /*
+         * filter rewriter needs 'vnet_hdr_support' when colo filter modules
+         * work on virtio-net, add 'vnet_hdr_support' automatically
+         */
+        s->vnet_hdr = true;
+    }
+
     s->connection_track_table = g_hash_table_new_full(connection_key_hash,
                                                       connection_key_equal,
                                                       g_free,
diff --git a/qapi/qom.json b/qapi/qom.json
index a25616bc7a..5760107160 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -241,6 +241,11 @@
 # @notify_dev: name of the character device backend to be used to communicate
 #              with the remote colo-frame (only for Xen COLO)
 #
+# @netdev: id of the network device backend to colo-compare. Although
+#          colo-compare doesn't depend on network device directly, this
+#          parameter helps colo-compare know what network driver it is
+#          working on.(since 6.2)
+#
 # @compare_timeout: the maximum time to hold a packet from @primary_in for
 #                   comparison with an incoming packet on @secondary_in in
 #                   milliseconds (default: 3000)
@@ -264,6 +269,7 @@
             'outdev': 'str',
             'iothread': 'str',
             '*notify_dev': 'str',
+            '*netdev': 'str',
             '*compare_timeout': 'uint64',
             '*expired_scan_cycle': 'uint32',
             '*max_queue_size': 'uint32',
diff --git a/qemu-options.hx b/qemu-options.hx
index 8f603cc7e6..250937fbbf 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4964,12 +4964,14 @@ SRST
         stored. The file format is libpcap, so it can be analyzed with
         tools such as tcpdump or Wireshark.
 
-    ``-object colo-compare,id=id,primary_in=chardevid,secondary_in=chardevid,outdev=chardevid,iothread=id[,vnet_hdr_support][,notify_dev=id][,compare_timeout=@var{ms}][,expired_scan_cycle=@var{ms}][,max_queue_size=@var{size}]``
+    ``-object colo-compare,id=id,primary_in=chardevid,secondary_in=chardevid,outdev=chardevid,iothread=id[,netdev=netdevid][,vnet_hdr_support][,notify_dev=id][,compare_timeout=@var{ms}][,expired_scan_cycle=@var{ms}][,max_queue_size=@var{size}]``
         Colo-compare gets packet from primary\_in chardevid and
         secondary\_in, then compare whether the payload of primary packet
         and secondary packet are the same. If same, it will output
         primary packet to out\_dev, else it will notify COLO-framework to do
-        checkpoint and send primary packet to out\_dev. In order to
+        checkpoint and send primary packet to out\_dev. Although colo-compare
+        does not depend on network device directly, netdevid helps
+        colo-compare know what network driver it is working on. In order to
         improve efficiency, we need to put the task of comparison in
         another iothread. If it has the vnet\_hdr\_support flag,
         colo compare will send/recv packet with vnet\_hdr\_len.
-- 
2.25.1



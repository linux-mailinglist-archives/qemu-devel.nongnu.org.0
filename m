Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C1B613B11
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 17:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opXVg-0006dB-G0; Mon, 31 Oct 2022 12:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1opXVZ-0006XA-23
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 12:19:33 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1opXVR-0001MH-NF
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 12:19:24 -0400
HMM_SOURCE_IP: 172.18.0.218:50162.1127588867
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.180.88 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 680422800C5;
 Tue,  1 Nov 2022 00:19:13 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([182.138.180.88])
 by app0025 with ESMTP id 7f8eb476621d449fb18ac80b3619253f for
 qemu-devel@nongnu.org; Tue, 01 Nov 2022 00:19:15 CST
X-Transaction-ID: 7f8eb476621d449fb18ac80b3619253f
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 182.138.180.88
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH RFC 1/4] net: Introduce qmp cmd "query-netdev"
Date: Tue,  1 Nov 2022 00:18:59 +0800
Message-Id: <d254324983817fb380411995155c9e927edaeb92.1667232396.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1667232396.git.huangy81@chinatelecom.cn>
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1667232396.git.huangy81@chinatelecom.cn>
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

For netdev device that can offload virtio-net dataplane to slave,
such as vhost-net, vhost-user and vhost-vdpa, exporting it's
capability information and acked features would be more friendly for
developers. These infomation can be analyzed and compare to slave
capability provided by, eg dpdk or other slaves directly, helping to
draw conclusions about if vm network interface works normally, if
it vm can be migrated to another feature-compatible destination or
whatever else.

For developers who devote to offload virtio-net dataplane to DPU
and make efforts to migrate vm lively from software-based source
host to DPU-offload destination host smoothly, virtio-net feature
compatibility is an serious issue, exporting the key capability
and acked_features of netdev could also help to debug greatly.

So we export out the key capabilities of netdev, which may affect
the final negotiated virtio-net features, meanwhile, backed-up
acked_features also exported, which is used to initialize or
restore features negotiated between qemu and vhost slave when
starting vhost_dev device.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 net/net.c     | 44 +++++++++++++++++++++++++++++++++++++++
 qapi/net.json | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/net/net.c b/net/net.c
index 2db160e..5d11674 100644
--- a/net/net.c
+++ b/net/net.c
@@ -53,6 +53,7 @@
 #include "sysemu/runstate.h"
 #include "net/colo-compare.h"
 #include "net/filter.h"
+#include "net/vhost-user.h"
 #include "qapi/string-output-visitor.h"
 
 /* Net bridge is currently not supported for W32. */
@@ -1224,6 +1225,49 @@ void qmp_netdev_del(const char *id, Error **errp)
     }
 }
 
+static NetDevInfo *query_netdev(NetClientState *nc)
+{
+    NetDevInfo *info = NULL;
+
+    if (!nc || !nc->is_netdev) {
+        return NULL;
+    }
+
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strdup(nc->name);
+    info->type = nc->info->type;
+    info->ufo = nc->info->has_ufo;
+    info->vnet_hdr = nc->info->has_vnet_hdr;
+    info->vnet_hdr_len = nc->info->has_vnet_hdr_len;
+
+    if (nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
+        info->has_acked_features = true;
+        info->acked_features = vhost_user_get_acked_features(nc);
+    }
+
+    return info;
+}
+
+NetDevInfoList *qmp_query_netdev(Error **errp)
+{
+    NetClientState *nc;
+    NetDevInfo *info = NULL;
+    NetDevInfoList *head = NULL, **tail = &head;
+
+    QTAILQ_FOREACH(nc, &net_clients, next) {
+        if (nc->info->type == NET_CLIENT_DRIVER_NIC) {
+            continue;
+        }
+
+        info = query_netdev(nc);
+        if (info) {
+            QAPI_LIST_APPEND(tail, info);
+        }
+    }
+
+    return head;
+}
+
 static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
 {
     char *str;
diff --git a/qapi/net.json b/qapi/net.json
index dd088c0..76a6513 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -631,6 +631,72 @@
                        'if': 'CONFIG_VMNET' } } }
 
 ##
+# @NetDevInfo:
+#
+# NetDev information.  This structure describes a NetDev information, including
+# capabilities and negotiated features.
+#
+# @name: The NetDev name.
+#
+# @type: Type of NetDev.
+#
+# @ufo: True if NetDev has ufo capability.
+#
+# @vnet-hdr: True if NetDev has vnet_hdr.
+#
+# @vnet-hdr-len: True if given length can be assigned to NetDev.
+#
+# @acked-features: Negotiated features with vhost slave device if device support
+#                  dataplane offload.
+#
+# Since:  7.1
+##
+{'struct': 'NetDevInfo',
+ 'data': {
+    'name': 'str',
+    'type': 'NetClientDriver',
+    'ufo':'bool',
+    'vnet-hdr':'bool',
+    'vnet-hdr-len':'bool',
+    '*acked-features': 'uint64' } }
+
+##
+# @query-netdev:
+#
+# Get a list of NetDevInfo for all virtual netdev peer devices.
+#
+# Returns: a list of @NetDevInfo describing each virtual netdev peer device.
+#
+# Since: 7.1
+#
+# Example:
+#
+# -> { "execute": "query-netdev" }
+# <- {
+#       "return":[
+#          {
+#             "name":"hostnet0",
+#             "type":"vhost-user",
+#             "ufo":true,
+#             "vnet-hdr":true,
+#             "vnet-hdr-len":true,
+#             "acked-features":"5111807907",
+#          },
+#          {
+#             "name":"hostnet1",
+#             "type":"vhost-user",
+#             "ufo":true,
+#             "vnet-hdr":true,
+#             "vnet-hdr-len":true,
+#             "acked-features":"5111807907",
+#          }
+#       ]
+#    }
+#
+##
+{ 'command': 'query-netdev', 'returns': ['NetDevInfo'] }
+
+##
 # @RxState:
 #
 # Packets receiving state
-- 
1.8.3.1



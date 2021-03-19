Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00233413F6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 05:03:26 +0100 (CET)
Received: from localhost ([::1]:56104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN6M9-0000LV-O8
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 00:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jz-00070O-KP
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:01:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:65171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jx-0004V3-5l
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:01:11 -0400
IronPort-SDR: K2ekOhanxZhuqYUAcmfZKz34soNKI9V0zHdaUGgfb9NYClQEWO8+3EKmLYba7RUDVwi1ZjnJ3g
 2vjsQ+5ddV4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="177409927"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="177409927"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:01:01 -0700
IronPort-SDR: zv2k3sPmY+2ghq3z+H4dxg+HuVzVG/SJcKKw0Gn+NjsS4lODg5ipW3NxpSLM2/75vTBRbpTtRp
 1xhBYHH8S21A==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606456759"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:59 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V4 7/7] net/net.c: Add handler for COLO passthrough connection
Date: Fri, 19 Mar 2021 11:55:08 +0800
Message-Id: <20210319035508.113741-8-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319035508.113741-1-chen.zhang@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
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
Cc: Zhang Chen <chen.zhang@intel.com>, Lukas Straub <lukasstraub2@web.de>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use connection protocol,src port,dst port,src ip,dst ip as the key
to bypass certain network traffic in COLO compare.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/net.c | 153 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/net/net.c b/net/net.c
index 7c7cefe0e0..4a9ab29cca 100644
--- a/net/net.c
+++ b/net/net.c
@@ -56,6 +56,8 @@
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
 #include "qapi/hmp-output-visitor.h"
+#include "net/colo-compare.h"
+#include "qom/object_interfaces.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -1199,14 +1201,165 @@ void qmp_netdev_del(const char *id, Error **errp)
     }
 }
 
+static CompareState *colo_passthrough_check(L4_Connection *conn, Error **errp)
+{
+    Object *container;
+    Object *obj;
+    CompareState *s;
+
+    if (!conn->id) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id",
+                   "Need input colo-compare object id");
+        return NULL;
+    }
+
+    container = object_get_objects_root();
+    obj = object_resolve_path_component(container, conn->id);
+    if (!obj) {
+        error_setg(errp, "colo-compare '%s' not found", conn->id);
+        return NULL;
+    }
+
+    s = COLO_COMPARE(obj);
+
+    if (conn->protocol == -1) {
+        error_setg(errp, "COLO pass through get wrong protocol");
+        return NULL;
+    }
+
+    if ((conn->src_ip && !qemu_isdigit(conn->src_ip[0])) ||
+        (conn->dst_ip && !qemu_isdigit(conn->dst_ip[0]))) {
+        error_setg(errp, "COLO pass through get wrong IP");
+        return NULL;
+    }
+
+    if (conn->src_port > 65536 || conn->src_port < 0 ||
+        conn->dst_port > 65536 || conn->dst_port < 0) {
+        error_setg(errp, "COLO pass through get wrong port");
+        return NULL;
+    }
+
+    return s;
+}
+
+static void compare_passthrough_add(CompareState *s,
+                                    L4_Connection *conn,
+                                    Error **errp)
+{
+    PassthroughEntry *bypass = NULL, *next = NULL, *origin = NULL;
+
+    bypass = g_new0(PassthroughEntry, 1);
+
+    bypass->l4_protocol = conn->protocol;
+    bypass->src_port = conn->src_port;
+    bypass->dst_port = conn->dst_port;
+
+    if (!inet_aton(conn->src_ip, &bypass->src_ip)) {
+        bypass->src_ip.s_addr = 0;
+    }
+
+    if (!inet_aton(conn->dst_ip, &bypass->dst_ip)) {
+        bypass->dst_ip.s_addr = 0;
+    }
+
+    qemu_mutex_lock(&s->passthroughlist_mutex);
+    if (!QLIST_EMPTY(&s->passthroughlist)) {
+        QLIST_FOREACH_SAFE(origin, &s->passthroughlist, node, next) {
+            if ((bypass->l4_protocol == origin->l4_protocol) &&
+                (bypass->src_port == origin->src_port) &&
+                (bypass->src_ip.s_addr == origin->src_ip.s_addr) &&
+                (bypass->dst_ip.s_addr == origin->dst_ip.s_addr)) {
+                error_setg(errp, "The pass through connection already exists");
+                g_free(bypass);
+                qemu_mutex_unlock(&s->passthroughlist_mutex);
+                return;
+            }
+        }
+    }
+
+    QLIST_INSERT_HEAD(&s->passthroughlist, bypass, node);
+    qemu_mutex_unlock(&s->passthroughlist_mutex);
+}
+
+static void compare_passthrough_del(CompareState *s,
+                                    L4_Connection *conn,
+                                    Error **errp)
+{
+    PassthroughEntry *bypass = NULL, *next = NULL, *origin = NULL;
+
+    bypass = g_new0(PassthroughEntry, 1);
+
+    bypass->l4_protocol = conn->protocol;
+    bypass->src_port = conn->src_port;
+    bypass->dst_port = conn->dst_port;
+
+    if (!inet_aton(conn->src_ip, &bypass->src_ip)) {
+        bypass->src_ip.s_addr = 0;
+    }
+
+    if (!inet_aton(conn->dst_ip, &bypass->dst_ip)) {
+        bypass->dst_ip.s_addr = 0;
+    }
+
+    qemu_mutex_lock(&s->passthroughlist_mutex);
+    if (!QLIST_EMPTY(&s->passthroughlist)) {
+        QLIST_FOREACH_SAFE(origin, &s->passthroughlist, node, next) {
+            if ((bypass->l4_protocol == origin->l4_protocol) &&
+                (bypass->src_port == origin->src_port) &&
+                (bypass->src_ip.s_addr == origin->src_ip.s_addr) &&
+                (bypass->dst_ip.s_addr == origin->dst_ip.s_addr)) {
+                QLIST_REMOVE(origin, node);
+                g_free(origin);
+                g_free(bypass);
+                qemu_mutex_unlock(&s->passthroughlist_mutex);
+                return;
+            }
+        }
+        error_setg(errp, "The pass through list can't find the connection");
+    } else {
+        error_setg(errp, "The pass through connection list is empty");
+    }
+
+    g_free(bypass);
+    qemu_mutex_unlock(&s->passthroughlist_mutex);
+}
+
 void qmp_colo_passthrough_add(L4_Connection *conn, Error **errp)
 {
     /* Setup passthrough connection */
+    CompareState *s;
+    Error *err = NULL;
+
+    s = colo_passthrough_check(conn, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    compare_passthrough_add(s, conn, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 }
 
 void qmp_colo_passthrough_del(L4_Connection *conn, Error **errp)
 {
     /* Delete passthrough connection */
+    CompareState *s;
+    Error *err = NULL;
+
+    s = colo_passthrough_check(conn, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    compare_passthrough_del(s, conn, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 }
 
 static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
-- 
2.25.1



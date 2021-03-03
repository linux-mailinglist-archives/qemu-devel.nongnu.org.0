Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B91232B3F5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 05:26:46 +0100 (CET)
Received: from localhost ([::1]:44240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHJ5x-0003qY-9M
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 23:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0h-0005Zl-Gj
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:19 -0500
Received: from mga18.intel.com ([134.134.136.126]:42971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0f-000591-Lk
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:19 -0500
IronPort-SDR: c6sSmGNwNMF3EU2guDSFMWsFD1CLbCNfkmlb6xkWOpkMkzCgQK01W3hL6p+FIG4oNJuD3jgPqN
 mTbROP1J7OpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174732275"
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="174732275"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:16 -0800
IronPort-SDR: +lu9/Q1VmDE6ugOySlaMreQQ/pedaItRtrBGaWK/wojhxY6LGbIxBvaT6g8Sv18A2hDtZWkh2y
 qS1fOBaJ5fRQ==
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="407060060"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:14 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH V2 7/7] net/net.c: Add handler for COLO passthrough connection
Date: Wed,  3 Mar 2021 12:15:39 +0800
Message-Id: <20210303041539.1032415-8-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303041539.1032415-1-chen.zhang@intel.com>
References: <20210303041539.1032415-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=1.624,
 FROM_WSP_TRAIL=1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Use connection protocol,src port,dst port,src ip,dst ip as the key
to bypass certain network traffic in COLO compare.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/net.c | 147 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/net/net.c b/net/net.c
index 037dcc5973..bb2fb1d8b5 100644
--- a/net/net.c
+++ b/net/net.c
@@ -55,6 +55,8 @@
 #include "sysemu/sysemu.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
+#include "net/colo-compare.h"
+#include "qom/object_interfaces.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -1151,14 +1153,159 @@ void qmp_netdev_del(const char *id, Error **errp)
     qemu_del_net_client(nc);
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
+    if (!QLIST_EMPTY(&s->passthroughlist)) {
+        QLIST_FOREACH_SAFE(origin, &s->passthroughlist, node, next) {
+            if ((bypass->l4_protocol == origin->l4_protocol) &&
+                (bypass->src_port == origin->src_port) &&
+                (bypass->src_ip.s_addr == origin->src_ip.s_addr) &&
+                (bypass->dst_ip.s_addr == origin->dst_ip.s_addr)) {
+                error_setg(errp, "The pass through connection already exists");
+                g_free(bypass);
+                return;
+            }
+        }
+    }
+
+    QLIST_INSERT_HEAD(&s->passthroughlist, bypass, node);
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
+    if (!QLIST_EMPTY(&s->passthroughlist)) {
+        QLIST_FOREACH_SAFE(origin, &s->passthroughlist, node, next) {
+            if ((bypass->l4_protocol == origin->l4_protocol) &&
+                (bypass->src_port == origin->src_port) &&
+                (bypass->src_ip.s_addr == origin->src_ip.s_addr) &&
+                (bypass->dst_ip.s_addr == origin->dst_ip.s_addr)) {
+                QLIST_REMOVE(origin, node);
+                g_free(origin);
+                g_free(bypass);
+                return;
+            }
+        }
+        error_setg(errp, "The pass through list can't find the connection");
+    } else {
+        error_setg(errp, "The pass through connection list is empty");
+    }
+
+    g_free(bypass);
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



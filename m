Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244A43CD03A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:12:36 +0200 (CEST)
Received: from localhost ([::1]:57932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PKF-0001AC-7m
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m5PGl-00021B-AD
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:08:59 -0400
Received: from mga05.intel.com ([192.55.52.43]:20947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m5PGj-0004RY-9o
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:08:59 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="296581757"
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="296581757"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 02:08:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="499842199"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 02:08:53 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL V3 for 6.2 6/6] net/net.c: Add handler for passthrough filter
 command
Date: Mon, 19 Jul 2021 17:00:51 +0800
Message-Id: <20210719090051.3824672-7-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719090051.3824672-1-chen.zhang@intel.com>
References: <20210719090051.3824672-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Zhang Chen <chen.zhang@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the connection protocol,src port,dst port,src ip,dst ip as the key
to passthrough certain network traffic in object with network packet
processing function.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/net.c | 199 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 197 insertions(+), 2 deletions(-)

diff --git a/net/net.c b/net/net.c
index 00f2be7a58..9ede98d166 100644
--- a/net/net.c
+++ b/net/net.c
@@ -55,6 +55,8 @@
 #include "net/colo-compare.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
+#include "net/colo-compare.h"
+#include "qom/object_interfaces.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -1195,14 +1197,207 @@ void qmp_netdev_del(const char *id, Error **errp)
     }
 }
 
+static int check_addr(InetSocketAddressBase *addr)
+{
+    if (!addr || (addr->host && !qemu_isdigit(addr->host[0]))) {
+        return -1;
+    }
+
+    if (atoi(addr->port) > 65536 || atoi(addr->port) < 0) {
+        return -1;
+    }
+
+    return 0;
+}
+
+/* The initial version only supports colo-compare */
+static CompareState *passthrough_filter_check(IPFlowSpec *spec, Error **errp)
+{
+    Object *container;
+    Object *obj;
+    CompareState *s;
+
+    if (!spec->object_name) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "object-name",
+                   "Need input object name");
+        return NULL;
+    }
+
+    container = object_get_objects_root();
+    obj = object_resolve_path_component(container, spec->object_name);
+    if (!obj) {
+        error_setg(errp, "object '%s' not found", spec->object_name);
+        return NULL;
+    }
+
+    s = COLO_COMPARE(obj);
+
+    if (!getprotobyname(spec->protocol)) {
+        error_setg(errp, "Passthrough filter get wrong protocol");
+        return NULL;
+    }
+
+    if (spec->source) {
+        if (check_addr(spec->source)) {
+            error_setg(errp, "Passthrough filter get wrong source");
+            return NULL;
+        }
+    }
+
+    if (spec->destination) {
+        if (check_addr(spec->destination)) {
+            error_setg(errp, "Passthrough filter get wrong destination");
+            return NULL;
+        }
+    }
+
+    return s;
+}
+
+/* The initial version only supports colo-compare */
+static COLOPassthroughEntry *passthrough_filter_find(CompareState *s,
+                                                     COLOPassthroughEntry *ent)
+{
+    COLOPassthroughEntry *next = NULL, *origin = NULL;
+
+    if (!QLIST_EMPTY(&s->passthroughlist)) {
+        QLIST_FOREACH_SAFE(origin, &s->passthroughlist, node, next) {
+            if ((ent->l4_protocol.p_proto == origin->l4_protocol.p_proto) &&
+                (ent->src_port == origin->src_port) &&
+                (ent->dst_port == origin->dst_port) &&
+                (ent->src_ip.s_addr == origin->src_ip.s_addr) &&
+                (ent->dst_ip.s_addr == origin->dst_ip.s_addr)) {
+                return origin;
+            }
+        }
+    }
+
+    return NULL;
+}
+
+/* The initial version only supports colo-compare */
+static void passthrough_filter_add(CompareState *s,
+                                   IPFlowSpec *spec,
+                                   Error **errp)
+{
+    COLOPassthroughEntry *pass = NULL;
+
+    pass = g_new0(COLOPassthroughEntry, 1);
+
+    if (spec->protocol) {
+        memcpy(&pass->l4_protocol, getprotobyname(spec->protocol),
+               sizeof(struct protoent));
+    }
+
+    if (spec->source) {
+        if (!inet_aton(spec->source->host, &pass->src_ip)) {
+            pass->src_ip.s_addr = 0;
+        }
+
+        pass->src_port = atoi(spec->source->port);
+    }
+
+    if (spec->destination) {
+        if (!inet_aton(spec->destination->host, &pass->dst_ip)) {
+            pass->dst_ip.s_addr = 0;
+        }
+
+        pass->dst_port = atoi(spec->destination->port);
+    }
+
+    qemu_mutex_lock(&s->passthroughlist_mutex);
+    if (passthrough_filter_find(s, pass)) {
+        error_setg(errp, "The pass through connection already exists");
+        g_free(pass);
+        qemu_mutex_unlock(&s->passthroughlist_mutex);
+        return;
+    }
+
+    QLIST_INSERT_HEAD(&s->passthroughlist, pass, node);
+    qemu_mutex_unlock(&s->passthroughlist_mutex);
+}
+
+/* The initial version only supports colo-compare */
+static void passthrough_filter_del(CompareState *s,
+                                   IPFlowSpec *spec,
+                                   Error **errp)
+{
+    COLOPassthroughEntry *pass = NULL, *result = NULL;
+
+    pass = g_new0(COLOPassthroughEntry, 1);
+
+    if (spec->protocol) {
+        memcpy(&pass->l4_protocol, getprotobyname(spec->protocol),
+               sizeof(struct protoent));
+    }
+
+    if (spec->source) {
+        if (!inet_aton(spec->source->host, &pass->src_ip)) {
+            pass->src_ip.s_addr = 0;
+        }
+
+        pass->src_port = atoi(spec->source->port);
+    }
+
+    if (spec->destination) {
+        if (!inet_aton(spec->destination->host, &pass->dst_ip)) {
+            pass->dst_ip.s_addr = 0;
+        }
+
+        pass->dst_port = atoi(spec->destination->port);
+    }
+
+    qemu_mutex_lock(&s->passthroughlist_mutex);
+
+    result = passthrough_filter_find(s, pass);
+    if (result) {
+        QLIST_REMOVE(result, node);
+        g_free(result);
+    } else {
+        error_setg(errp, "Can't find the IP flow Spec");
+    }
+
+    g_free(pass);
+    g_free(spec);
+    qemu_mutex_unlock(&s->passthroughlist_mutex);
+}
+
+/* The initial version only supports colo-compare */
 void qmp_passthrough_filter_add(IPFlowSpec *spec, Error **errp)
 {
-    /* TODO implement setup passthrough rule */
+    CompareState *s;
+    Error *err = NULL;
+
+    s = passthrough_filter_check(spec, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    passthrough_filter_add(s, spec, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 }
 
+/* The initial version only supports colo-compare */
 void qmp_passthrough_filter_del(IPFlowSpec *spec, Error **errp)
 {
-    /* TODO implement delete passthrough rule */
+    CompareState *s;
+    Error *err = NULL;
+
+    s = passthrough_filter_check(spec, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    passthrough_filter_del(s, spec, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 }
 
 static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
-- 
2.25.1



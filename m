Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C4D36075F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:43:46 +0200 (CEST)
Received: from localhost ([::1]:50320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzTN-0002dm-3M
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzRM-0000xb-IB
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:41:40 -0400
Received: from mga06.intel.com ([134.134.136.31]:54482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzRK-00029d-9L
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:41:40 -0400
IronPort-SDR: q5kKl12lpLsfa1ntOeq16tweo25qdukn+W0G1+J+iUYPpu8uCZ0torHTuO4Gbdg7phxtwKZf0e
 NqNXeTcdXTNA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="256146946"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="256146946"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:41:34 -0700
IronPort-SDR: Xd8SwXq5dnB/0YvlmCr7Cch4qNOHHPDVDjwJui903OCrfIbVm/OYuJRYkLOt+w48SzaYJ4j0Z3
 pPBZ/IUERxKw==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="425135015"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:41:31 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V5 6/6] net/net.c: Add handler for COLO passthrough connection
Date: Thu, 15 Apr 2021 18:35:15 +0800
Message-Id: <20210415103515.1251386-7-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415103515.1251386-1-chen.zhang@intel.com>
References: <20210415103515.1251386-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
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
 net/net.c | 158 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 156 insertions(+), 2 deletions(-)

diff --git a/net/net.c b/net/net.c
index 2a6e5f3886..31b36bcd79 100644
--- a/net/net.c
+++ b/net/net.c
@@ -56,6 +56,8 @@
 #include "sysemu/sysemu.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
+#include "net/colo-compare.h"
+#include "qom/object_interfaces.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -1196,14 +1198,166 @@ void qmp_netdev_del(const char *id, Error **errp)
     }
 }
 
+static CompareState *colo_passthrough_check(IPFlowSpec *spec, Error **errp)
+{
+    Object *container;
+    Object *obj;
+    CompareState *s;
+
+    if (!spec->object_name) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id",
+                   "Need input colo-compare object id");
+        return NULL;
+    }
+
+    container = object_get_objects_root();
+    obj = object_resolve_path_component(container, spec->object_name);
+    if (!obj) {
+        error_setg(errp, "colo-compare '%s' not found", spec->object_name);
+        return NULL;
+    }
+
+    s = COLO_COMPARE(obj);
+
+    if (spec->protocol == -1) {
+        error_setg(errp, "COLO pass through get wrong protocol");
+        return NULL;
+    }
+
+    if ((spec->source->host && !qemu_isdigit(spec->source->host[0])) ||
+        (spec->destination->host &&
+        !qemu_isdigit(spec->destination->host[0]))) {
+        error_setg(errp, "COLO pass through get wrong IP");
+        return NULL;
+    }
+
+    if (atoi(spec->source->port) > 65536 || atoi(spec->source->port) < 0 ||
+        atoi(spec->destination->port) > 65536 ||
+        atoi(spec->destination->port) < 0) {
+        error_setg(errp, "COLO pass through get wrong port");
+        return NULL;
+    }
+
+    return s;
+}
+
+static void compare_passthrough_add(CompareState *s,
+                                    IPFlowSpec *spec,
+                                    Error **errp)
+{
+    COLOPassthroughEntry *pass = NULL, *next = NULL, *origin = NULL;
+
+    pass = g_new0(COLOPassthroughEntry, 1);
+
+    pass->l4_protocol = spec->protocol;
+    pass->src_port = atoi(spec->source->port);
+    pass->dst_port = atoi(spec->destination->port);
+
+    if (!inet_aton(spec->source->host, &pass->src_ip)) {
+        pass->src_ip.s_addr = 0;
+    }
+
+    if (!inet_aton(spec->destination->host, &pass->dst_ip)) {
+        pass->dst_ip.s_addr = 0;
+    }
+
+    qemu_mutex_lock(&s->passthroughlist_mutex);
+    if (!QLIST_EMPTY(&s->passthroughlist)) {
+        QLIST_FOREACH_SAFE(origin, &s->passthroughlist, node, next) {
+            if ((pass->l4_protocol == origin->l4_protocol) &&
+                (pass->src_port == origin->src_port) &&
+                (pass->src_ip.s_addr == origin->src_ip.s_addr) &&
+                (pass->dst_ip.s_addr == origin->dst_ip.s_addr)) {
+                error_setg(errp, "The pass through connection already exists");
+                g_free(pass);
+                qemu_mutex_unlock(&s->passthroughlist_mutex);
+                return;
+            }
+        }
+    }
+
+    QLIST_INSERT_HEAD(&s->passthroughlist, pass, node);
+    qemu_mutex_unlock(&s->passthroughlist_mutex);
+}
+
+static void compare_passthrough_del(CompareState *s,
+                                    IPFlowSpec *spec,
+                                    Error **errp)
+{
+    COLOPassthroughEntry *pass = NULL, *next = NULL, *origin = NULL;
+
+    pass = g_new0(COLOPassthroughEntry, 1);
+
+    pass->l4_protocol = spec->protocol;
+    pass->src_port = atoi(spec->source->port);
+    pass->dst_port = atoi(spec->destination->port);
+
+    if (!inet_aton(spec->source->host, &pass->src_ip)) {
+        pass->src_ip.s_addr = 0;
+    }
+
+    if (!inet_aton(spec->destination->host, &pass->dst_ip)) {
+        pass->dst_ip.s_addr = 0;
+    }
+
+    qemu_mutex_lock(&s->passthroughlist_mutex);
+    if (!QLIST_EMPTY(&s->passthroughlist)) {
+        QLIST_FOREACH_SAFE(origin, &s->passthroughlist, node, next) {
+            if ((pass->l4_protocol == origin->l4_protocol) &&
+                (pass->src_port == origin->src_port) &&
+                (pass->src_ip.s_addr == origin->src_ip.s_addr) &&
+                (pass->dst_ip.s_addr == origin->dst_ip.s_addr)) {
+                QLIST_REMOVE(origin, node);
+                g_free(origin);
+                g_free(pass);
+                qemu_mutex_unlock(&s->passthroughlist_mutex);
+                return;
+            }
+        }
+        error_setg(errp, "The pass through list can't find the connection");
+    } else {
+        error_setg(errp, "The pass through connection list is empty");
+    }
+
+    g_free(pass);
+    qemu_mutex_unlock(&s->passthroughlist_mutex);
+}
+
+
 void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp)
 {
-    /* TODO implement setup passthrough rule */
+    CompareState *s;
+    Error *err = NULL;
+
+    s = colo_passthrough_check(spec, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    compare_passthrough_add(s, spec, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 }
 
 void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp)
 {
-    /* TODO implement delete passthrough rule */
+    CompareState *s;
+    Error *err = NULL;
+
+    s = colo_passthrough_check(spec, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    compare_passthrough_del(s, spec, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 }
 
 static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
-- 
2.25.1



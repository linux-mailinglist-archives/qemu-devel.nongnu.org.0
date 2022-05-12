Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077F75247C7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 10:22:44 +0200 (CEST)
Received: from localhost ([::1]:52902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np45r-0007E3-4o
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 04:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1np3tK-0006iv-42
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1np3tG-0002jS-Ll
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652342981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKI6hNUsjCLqN1eTripctfg71+iCqOFyNz8Iz7pO/9Q=;
 b=bWiD2DxMwcXcxa0Ojj6JeWXgOgzpi2et4lhT1eWpq25Ai7ZbP8sru2mK20bKaHpmzyIjvJ
 z6smPTWSCsFZQpVTvEipPirUVpu84Jn3SP114XVIjI1ODtd0MwOQPkz8Vnjm2nP3wWt1zh
 LTJyZn2twYbXzpREQDBrK11EEZd8mvc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-M7OM_UO-NtqAb2POTIGDrg-1; Thu, 12 May 2022 04:09:38 -0400
X-MC-Unique: M7OM_UO-NtqAb2POTIGDrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3BB390E985
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:09:37 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 380AF40CF8F4;
 Thu, 12 May 2022 08:09:37 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v2 2/8] qapi: net: introduce a way to bypass
 qemu_opts_parse_noisily()
Date: Thu, 12 May 2022 10:09:26 +0200
Message-Id: <20220512080932.735962-3-lvivier@redhat.com>
In-Reply-To: <20220512080932.735962-1-lvivier@redhat.com>
References: <20220512080932.735962-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As qemu_opts_parse_noisily() flattens the QAPI structures ("type" field
of Netdev structure can collides with "type" field of SocketAddress),
we introduce a way to bypass qemu_opts_parse_noisily() and use directly
visit_type_Netdev() to parse the backend parameters.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 net/net.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/net/net.c b/net/net.c
index 58c05c200622..2aab7167316c 100644
--- a/net/net.c
+++ b/net/net.c
@@ -54,6 +54,7 @@
 #include "net/colo-compare.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
+#include "qapi/qobject-input-visitor.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -63,6 +64,17 @@
 static VMChangeStateEntry *net_change_state_entry;
 static QTAILQ_HEAD(, NetClientState) net_clients;
 
+typedef struct NetdevQueueEntry {
+    bool is_netdev;
+    Netdev *nd;
+    Location loc;
+    QSIMPLEQ_ENTRY(NetdevQueueEntry) entry;
+} NetdevQueueEntry;
+
+typedef QSIMPLEQ_HEAD(, NetdevQueueEntry) NetdevQueue;
+
+static NetdevQueue nd_queue = QSIMPLEQ_HEAD_INITIALIZER(nd_queue);
+
 /***********************************************************/
 /* network device redirectors */
 
@@ -1559,6 +1571,19 @@ int net_init_clients(Error **errp)
 
     QTAILQ_INIT(&net_clients);
 
+    while (!QSIMPLEQ_EMPTY(&nd_queue)) {
+        NetdevQueueEntry *nd = QSIMPLEQ_FIRST(&nd_queue);
+
+        QSIMPLEQ_REMOVE_HEAD(&nd_queue, entry);
+        loc_push_restore(&nd->loc);
+        if (net_client_init1(nd->nd, nd->is_netdev, errp) < 0) {
+            return -1;
+        }
+        loc_pop(&nd->loc);
+        qapi_free_Netdev(nd->nd);
+        g_free(nd);
+    }
+
     if (qemu_opts_foreach(qemu_find_opts("netdev"),
                           net_init_netdev, NULL, errp)) {
         return -1;
@@ -1575,8 +1600,37 @@ int net_init_clients(Error **errp)
     return 0;
 }
 
+/*
+ * netdev_is_modern() returns true when the backend needs to bypass
+ * qemu_opts_parse_noisily()
+ */
+static bool netdev_is_modern(const char *optarg)
+{
+    return false;
+}
+
 int net_client_parse(QemuOptsList *opts_list, const char *optarg)
 {
+    if (netdev_is_modern(optarg)) {
+            /*
+             * We need to bypass qemu_opts_parse_noisily() to accept
+             * new style object like addr.type=inet in SocketAddress
+             */
+            Visitor *v;
+            NetdevQueueEntry *nd;
+
+            v = qobject_input_visitor_new_str(optarg, "type",
+                                              &error_fatal);
+            nd = g_new(NetdevQueueEntry, 1);
+            visit_type_Netdev(v, NULL, &nd->nd, &error_fatal);
+            visit_free(v);
+            loc_save(&nd->loc);
+            nd->is_netdev = strcmp(opts_list->name, "netdev") == 0;
+
+            QSIMPLEQ_INSERT_TAIL(&nd_queue, nd, entry);
+            return 0;
+    }
+
     if (!qemu_opts_parse_noisily(opts_list, optarg, true)) {
         return -1;
     }
-- 
2.35.3



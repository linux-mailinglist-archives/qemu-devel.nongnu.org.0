Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73DF30700B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 08:50:04 +0100 (CET)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5243-0003sF-QR
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 02:50:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l51zP-0007RJ-KB
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:45:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l51zN-00016a-0D
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611819912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8e3hq0bdWLHicFKvyaWOhScRwaHe3ujd+0Q2NIjZsNg=;
 b=e6Vf0/fPkdr6fSr+TMdB9xVbkOqYW41FwC1UGfT69NxFX4XOhkvx3q7ZRUdeiaFtrRLlSL
 ulAPH1xpdfEg1Mp9pG75o8wBIZjsu9+Boj3ce/cryOyPycRk875owObvq7JpZdPoIEHhni
 e5TFwk9OA+vuQnTrnR+B5VwAv05i2lU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-8Uk1UPFNPJq-YBLveXOBRg-1; Thu, 28 Jan 2021 02:45:09 -0500
X-MC-Unique: 8Uk1UPFNPJq-YBLveXOBRg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FC8F1DE11;
 Thu, 28 Jan 2021 07:45:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 408D35C1BB;
 Thu, 28 Jan 2021 07:45:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C8FFE1138461; Thu, 28 Jan 2021 08:45:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] qapi: A couple more QAPI_LIST_PREPEND() stragglers
Date: Thu, 28 Jan 2021 08:45:03 +0100
Message-Id: <20210128074506.2725379-3-armbru@redhat.com>
In-Reply-To: <20210128074506.2725379-1-armbru@redhat.com>
References: <20210128074506.2725379-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

Commit 54aa3de72e switched multiple sites to use QAPI_LIST_PREPEND
instead of open-coding, but missed a couple of spots.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210113221013.390592-3-eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 32 +++++++++++---------------------
 monitor/qmp-cmds-control.c |  9 ++++-----
 2 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index affffe0c4a..156223a344 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -293,41 +293,31 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
 static int query_memdev(Object *obj, void *opaque)
 {
     MemdevList **list = opaque;
-    MemdevList *m = NULL;
+    Memdev *m;
     QObject *host_nodes;
     Visitor *v;
 
     if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND)) {
         m = g_malloc0(sizeof(*m));
 
-        m->value = g_malloc0(sizeof(*m->value));
+        m->id = g_strdup(object_get_canonical_path_component(obj));
+        m->has_id = !!m->id;
 
-        m->value->id = g_strdup(object_get_canonical_path_component(obj));
-        m->value->has_id = !!m->value->id;
-
-        m->value->size = object_property_get_uint(obj, "size",
-                                                  &error_abort);
-        m->value->merge = object_property_get_bool(obj, "merge",
-                                                   &error_abort);
-        m->value->dump = object_property_get_bool(obj, "dump",
-                                                  &error_abort);
-        m->value->prealloc = object_property_get_bool(obj,
-                                                      "prealloc",
-                                                      &error_abort);
-        m->value->policy = object_property_get_enum(obj,
-                                                    "policy",
-                                                    "HostMemPolicy",
-                                                    &error_abort);
+        m->size = object_property_get_uint(obj, "size", &error_abort);
+        m->merge = object_property_get_bool(obj, "merge", &error_abort);
+        m->dump = object_property_get_bool(obj, "dump", &error_abort);
+        m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
+        m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
+                                             &error_abort);
         host_nodes = object_property_get_qobject(obj,
                                                  "host-nodes",
                                                  &error_abort);
         v = qobject_input_visitor_new(host_nodes);
-        visit_type_uint16List(v, NULL, &m->value->host_nodes, &error_abort);
+        visit_type_uint16List(v, NULL, &m->host_nodes, &error_abort);
         visit_free(v);
         qobject_unref(host_nodes);
 
-        m->next = *list;
-        *list = m;
+        QAPI_LIST_PREPEND(*list, m);
     }
 
     return 0;
diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
index 17514f4959..509ae870bd 100644
--- a/monitor/qmp-cmds-control.c
+++ b/monitor/qmp-cmds-control.c
@@ -104,17 +104,16 @@ VersionInfo *qmp_query_version(Error **errp)
 
 static void query_commands_cb(const QmpCommand *cmd, void *opaque)
 {
-    CommandInfoList *info, **list = opaque;
+    CommandInfo *info;
+    CommandInfoList **list = opaque;
 
     if (!cmd->enabled) {
         return;
     }
 
     info = g_malloc0(sizeof(*info));
-    info->value = g_malloc0(sizeof(*info->value));
-    info->value->name = g_strdup(cmd->name);
-    info->next = *list;
-    *list = info;
+    info->name = g_strdup(cmd->name);
+    QAPI_LIST_PREPEND(*list, info);
 }
 
 CommandInfoList *qmp_query_commands(Error **errp)
-- 
2.26.2



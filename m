Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64232F54D8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 23:14:41 +0100 (CET)
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzoPY-0005Pr-S6
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 17:14:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzoLY-0001Jz-Vz
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:10:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzoLM-0001hD-NR
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:10:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610575819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BMFdqO9E25eW/8JwnsSaPPQ4utTcuPrvy+4EgiwA7Mg=;
 b=aCcV4J+eH+T/7rZ7ewpYZMKkUXS1i18Q6bi0RdTv+CqYWcLqqs3TEFMhr7nbBvwaK/66np
 oZPTKWloV3k67d6BJo1kNn04cXd4/USebNjZSlhbhW94ya/ir/t/wRkqIvSWivks8FNaaE
 6P5QVeVjI9kEhV5a/hGSGaWZF8H7qTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-zjtBfFDENNO76jlXM0a7iw-1; Wed, 13 Jan 2021 17:10:18 -0500
X-MC-Unique: zjtBfFDENNO76jlXM0a7iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ED7A10766C7;
 Wed, 13 Jan 2021 22:10:17 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86D7B10016FF;
 Wed, 13 Jan 2021 22:10:16 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] qapi: A couple more QAPI_LIST_PREPEND() stragglers
Date: Wed, 13 Jan 2021 16:10:10 -0600
Message-Id: <20210113221013.390592-3-eblake@redhat.com>
In-Reply-To: <20210113221013.390592-1-eblake@redhat.com>
References: <20210113221013.390592-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vsementsov@virtuozzo.com, armbru@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 54aa3de72e switched multiple sites to use QAPI_LIST_PREPEND
instead of open-coding, but missed a couple of spots.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 32 +++++++++++---------------------
 monitor/qmp-cmds-control.c |  9 ++++-----
 2 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index affffe0c4abf..156223a344ed 100644
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
index 17514f495965..509ae870bd31 100644
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
2.30.0



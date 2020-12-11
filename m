Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589472D7D9C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:06:39 +0100 (CET)
Received: from localhost ([::1]:41044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmoK-00058c-I9
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxq-0007W9-TX
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxa-0003Pq-Dj
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=twEDrTATGE/m9Fdul3mIOI5kGkUiJsB+/E/AkewMWb4=;
 b=fBbI8hhzDBBsOn2U9Bl/0wmoasixdcxudmLY19gnpNZe/9zKZMks4K8yucWBsMOjN1lSwE
 G7cr2crD9XdTYVYUWARwFTt6LGabpOwG9YGVuyEubVg6P1Bla1/4oz92i7F7W9NY3UEWwI
 1SBDnHAChA11gbYtjaPYyyyH6OBm2zA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-_97e1VFBPTCWMTDdLlee0A-1; Fri, 11 Dec 2020 12:11:57 -0500
X-MC-Unique: _97e1VFBPTCWMTDdLlee0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C72D800D53;
 Fri, 11 Dec 2020 17:11:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D142D5D9DD;
 Fri, 11 Dec 2020 17:11:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BA8E6112F00D; Fri, 11 Dec 2020 18:11:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/20] qmp: Fix tracing of non-string command IDs
Date: Fri, 11 Dec 2020 18:11:41 +0100
Message-Id: <20201211171152.146877-10-armbru@redhat.com>
In-Reply-To: <20201211171152.146877-1-armbru@redhat.com>
References: <20201211171152.146877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tracepoints monitor_qmp_cmd_in_band and
monitor_qmp_cmd_out_of_band (commit cf869d5317 "qmp: support
out-of-band (oob) execution") treat non-string "id" like absent "id".
Fix that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/qmp.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 374bb4b81c..8f91af32be 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -31,7 +31,6 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qlist.h"
-#include "qapi/qmp/qstring.h"
 #include "trace.h"
 
 struct QMPRequest {
@@ -276,9 +275,15 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
             mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX - 1;
         qemu_mutex_unlock(&mon->qmp_queue_lock);
         if (req_obj->req) {
-            QDict *qdict = qobject_to(QDict, req_obj->req);
-            QObject *id = qdict ? qdict_get(qdict, "id") : NULL;
-            trace_monitor_qmp_cmd_in_band(qobject_get_try_str(id) ?: "");
+            if (trace_event_get_state(TRACE_MONITOR_QMP_CMD_IN_BAND)) {
+                QDict *qdict = qobject_to(QDict, req_obj->req);
+                QObject *id = qdict ? qdict_get(qdict, "id") : NULL;
+                GString *id_json;
+
+                id_json = id ? qobject_to_json(id) : g_string_new(NULL);
+                trace_monitor_qmp_cmd_in_band(id_json->str);
+                g_string_free(id_json, true);
+            }
             monitor_qmp_dispatch(mon, req_obj->req);
         } else {
             assert(req_obj->err);
@@ -308,17 +313,11 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
 static void handle_qmp_command(void *opaque, QObject *req, Error *err)
 {
     MonitorQMP *mon = opaque;
-    QObject *id = NULL;
-    QDict *qdict;
+    QDict *qdict = qobject_to(QDict, req);
     QMPRequest *req_obj;
 
     assert(!req != !err);
 
-    qdict = qobject_to(QDict, req);
-    if (qdict) {
-        id = qdict_get(qdict, "id");
-    } /* else will fail qmp_dispatch() */
-
     if (req && trace_event_get_state_backends(TRACE_HANDLE_QMP_COMMAND)) {
         GString *req_json = qobject_to_json(req);
         trace_handle_qmp_command(mon, req_json->str);
@@ -327,7 +326,14 @@ static void handle_qmp_command(void *opaque, QObject *req, Error *err)
 
     if (qdict && qmp_is_oob(qdict)) {
         /* OOB commands are executed immediately */
-        trace_monitor_qmp_cmd_out_of_band(qobject_get_try_str(id) ?: "");
+        if (trace_event_get_state(TRACE_MONITOR_QMP_CMD_OUT_OF_BAND)) {
+            QObject *id = qdict_get(qdict, "id");
+            GString *id_json;
+
+            id_json = id ? qobject_to_json(id) : g_string_new(NULL);
+            trace_monitor_qmp_cmd_out_of_band(id_json->str);
+            g_string_free(id_json, true);
+        }
         monitor_qmp_dispatch(mon, req);
         qobject_unref(req);
         return;
-- 
2.26.2



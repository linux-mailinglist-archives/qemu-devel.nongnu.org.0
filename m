Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91849E548
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:57:34 +0100 (CET)
Received: from localhost ([::1]:48168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD6DN-00067R-5C
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:57:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5fL-0007ep-Rh
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5fK-0003PJ-3Z
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643293341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAE4/uxm5nEiNKnBfQnCpAQ9p9jfXH/3iDAiVZ2ztPk=;
 b=aGuqM5+T7xfvnkzqkjsjC07bzwfjLbs5SHTGwJA9hxtsvF/O1JnypyByrDdJvGBmmOYpOG
 wjzCAD0w9Cb9QJufEtw0+E7ISf7t5MrcnXScykHcnDDih5Bw/ROqW9KUDCmS0NaSYTu47D
 60Wy/pW8psJ+bUu0tq17aNRJEdjVANc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-kc185jK3NCmdk23G5ENNfA-1; Thu, 27 Jan 2022 09:22:20 -0500
X-MC-Unique: kc185jK3NCmdk23G5ENNfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4221A15720;
 Thu, 27 Jan 2022 14:22:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68ABE70D43;
 Thu, 27 Jan 2022 14:22:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AEB2D1138224; Thu, 27 Jan 2022 15:22:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 6/8] docs/qapi-code-gen: update to cover trace events code
 generation
Date: Thu, 27 Jan 2022 15:22:00 +0100
Message-Id: <20220127142202.236638-7-armbru@redhat.com>
In-Reply-To: <20220127142202.236638-1-armbru@redhat.com>
References: <20220127142202.236638-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Previous commits enabled trace events generation for most of QAPI
generated code (except for tests/ and qga/). Let's update documentation
to illustrate it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20220126161130.3240892-6-vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 23 +++++++++++++++++++++++
 docs/devel/tracing.rst       |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index feafed79b5..246709ede8 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1630,6 +1630,9 @@ The following files are generated:
  ``$(prefix)qapi-commands.h``
      Function prototypes for the QMP commands specified in the schema
 
+ ``$(prefix)qapi-commands.trace-events``
+     Trace event declarations, see :ref:`tracing`.
+
  ``$(prefix)qapi-init-commands.h``
      Command initialization prototype
 
@@ -1650,6 +1653,13 @@ Example::
     void qmp_marshal_my_command(QDict *args, QObject **ret, Error **errp);
 
     #endif /* EXAMPLE_QAPI_COMMANDS_H */
+
+    $ cat qapi-generated/example-qapi-commands.trace-events
+    # AUTOMATICALLY GENERATED, DO NOT MODIFY
+
+    qmp_enter_my_command(const char *json) "%s"
+    qmp_exit_my_command(const char *result, bool succeeded) "%s %d"
+
     $ cat qapi-generated/example-qapi-commands.c
     [Uninteresting stuff omitted...]
 
@@ -1689,14 +1699,27 @@ Example::
             goto out;
         }
 
+        if (trace_event_get_state_backends(TRACE_QMP_ENTER_MY_COMMAND)) {
+            g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
+
+            trace_qmp_enter_my_command(req_json->str);
+        }
+
         retval = qmp_my_command(arg.arg1, &err);
         if (err) {
+            trace_qmp_exit_my_command(error_get_pretty(err), false);
             error_propagate(errp, err);
             goto out;
         }
 
         qmp_marshal_output_UserDefOne(retval, ret, errp);
 
+        if (trace_event_get_state_backends(TRACE_QMP_EXIT_MY_COMMAND)) {
+            g_autoptr(GString) ret_json = qobject_to_json(*ret);
+
+            trace_qmp_exit_my_command(ret_json->str, true);
+        }
+
     out:
         visit_free(v);
         v = qapi_dealloc_visitor_new();
diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
index ba83954899..4290ac42ee 100644
--- a/docs/devel/tracing.rst
+++ b/docs/devel/tracing.rst
@@ -1,3 +1,5 @@
+.. _tracing:
+
 =======
 Tracing
 =======
-- 
2.31.1



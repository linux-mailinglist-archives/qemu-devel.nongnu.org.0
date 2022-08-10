Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6B558ECBE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:06:50 +0200 (CEST)
Received: from localhost ([::1]:47912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlQ9-0002kt-9U
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLl9Z-0001go-AP
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLl9X-0007Rv-MW
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660135779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hrfDTuWUgST19eVeDMl7zAEG1isktyWLHIrGlJyRbsM=;
 b=hXLakgPI1WMnnB3KSpu+dZN61GYmhPDfA3b5XFDl64pZvoaY+EJ2AEnXBt/WrjMz3mFTaB
 XBqjrlywe3YtbXHkVAkNGqJIclfgysMs9Lvv0TmHh9OZ6adglN22IaJ4dXLSRp0LBlyrvJ
 RZU4V4Nt00ODZi5ofhpOdPQ8JIQ5ypQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-TkR5iolJMRWwUe88HJSJbA-1; Wed, 10 Aug 2022 08:49:37 -0400
X-MC-Unique: TkR5iolJMRWwUe88HJSJbA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19BC31C16B4B;
 Wed, 10 Aug 2022 12:49:37 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E26C4492C3B;
 Wed, 10 Aug 2022 12:49:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 07/16] qapi: remove QEMU-specific monitor dependency from
 dispatch
Date: Wed, 10 Aug 2022 16:48:48 +0400
Message-Id: <20220810124857.1360211-8-marcandre.lureau@redhat.com>
In-Reply-To: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
References: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The monitor is specific to QEMU. Instead of passing a Monitor type
argument to the exec handler, use a generic void* pointer. This simplify
also the unit dependency, as now the dispatching code is free from
QEMU-specifics.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qapi/qmp/dispatch.h | 5 ++---
 monitor/qmp.c               | 3 ++-
 qapi/qmp-dispatch.c         | 4 ++--
 stubs/qmp-dispatch-exec.c   | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 6941a759a7..ee8a05015a 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -14,7 +14,6 @@
 #ifndef QAPI_QMP_DISPATCH_H
 #define QAPI_QMP_DISPATCH_H
 
-#include "monitor/monitor.h"
 #include "qemu/queue.h"
 
 typedef void (QmpCommandFunc)(QDict *, QObject **, Error **);
@@ -41,7 +40,7 @@ typedef struct QmpCommand
 
 typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
 
-void qmp_dispatch_exec(const QmpCommand *cmd, bool oob, Monitor *cur_mon,
+void qmp_dispatch_exec(const QmpCommand *cmd, bool oob, void *exec_data,
                        QDict *args, QObject **ret, Error **err);
 
 void qmp_register_command(QmpCommandList *cmds, const char *name,
@@ -59,7 +58,7 @@ const char *qmp_command_name(const QmpCommand *cmd);
 bool qmp_has_success_response(const QmpCommand *cmd);
 QDict *qmp_error_response(Error *err);
 QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
-                    bool allow_oob, Monitor *cur_mon);
+                    bool allow_oob, void *exec_data);
 bool qmp_is_oob(const QDict *dict);
 
 typedef void (*qmp_cmd_callback_fn)(const QmpCommand *cmd, void *opaque);
diff --git a/monitor/qmp.c b/monitor/qmp.c
index b9b109a40a..4f0eb6e200 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -156,9 +156,10 @@ static void do_qmp_dispatch_bh(void *opaque)
  * Runs outside of coroutine context for OOB commands, but in coroutine
  * context for everything else.
  */
-void qmp_dispatch_exec(const QmpCommand *cmd, bool oob, Monitor *cur_mon,
+void qmp_dispatch_exec(const QmpCommand *cmd, bool oob, void *exec_data,
                        QDict *args, QObject **ret, Error **errp)
 {
+    Monitor *cur_mon = exec_data;
     assert(!(oob && qemu_in_coroutine()));
     assert(monitor_cur() == NULL);
 
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index bec07e4958..2fea789fd3 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -108,7 +108,7 @@ bool qmp_is_oob(const QDict *dict)
 }
 
 QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
-                    bool allow_oob, Monitor *cur_mon)
+                    bool allow_oob, void *exec_data)
 {
     Error *err = NULL;
     bool oob;
@@ -176,7 +176,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
         qobject_ref(args);
     }
 
-    qmp_dispatch_exec(cmd, oob, cur_mon, args, &ret, &err);
+    qmp_dispatch_exec(cmd, oob, exec_data, args, &ret, &err);
 
     qobject_unref(args);
     if (err) {
diff --git a/stubs/qmp-dispatch-exec.c b/stubs/qmp-dispatch-exec.c
index 4aef28d198..4740f55222 100644
--- a/stubs/qmp-dispatch-exec.c
+++ b/stubs/qmp-dispatch-exec.c
@@ -1,7 +1,7 @@
 #include "qemu/osdep.h"
 #include "qapi/qmp/dispatch.h"
 
-void qmp_dispatch_exec(const QmpCommand *cmd, bool oob, Monitor *cur_mon,
+void qmp_dispatch_exec(const QmpCommand *cmd, bool oob, void *exec_data,
                        QDict *args, QObject **ret, Error **err)
 {
     cmd->fn(args, ret, err);
-- 
2.37.1



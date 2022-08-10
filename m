Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135258ECA0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:00:27 +0200 (CEST)
Received: from localhost ([::1]:39490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlJx-00052J-V2
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLl9T-0001di-PF
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLl9R-0007RH-SR
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660135773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2PfwAuutwAKnpypBFRb1CerbqElSAVHx5Gghw+w17c=;
 b=EUHVeVogPY1djTHhpXzIbs/yeiqcz6CmlbrmREiumEqr3MHYqGXdwGGY8wzUXcvcifbYI9
 CQJ+uNZE08R2z4FcR1SMKKZotw4RbaFsmP6/QDq2znK21HTb8L2iYvv8eJFdiB4Nspi4zs
 9/i0prPsO0huZiCmMQzMNOxO5XYdVeg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-w7ixzOknMbWxIOceRfL8UA-1; Wed, 10 Aug 2022 08:49:32 -0400
X-MC-Unique: w7ixzOknMbWxIOceRfL8UA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD4ED103942C;
 Wed, 10 Aug 2022 12:49:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50A9140315E;
 Wed, 10 Aug 2022 12:49:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 06/16] qapi: move QEMU-specific dispatch code in monitor
Date: Wed, 10 Aug 2022 16:48:47 +0400
Message-Id: <20220810124857.1360211-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
References: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Make QMP-dispatch code free from QEMU-specific OOB dispatch/async
coroutine handling. This will allow to move the base code to
qemu-common, and clear other users from potential mis-ususe (QGA doesn't
have OOB or coroutines).

Introduce an overridable qmp_dispatch_exec() function, with a default a
stub implementation, while the oob & coroutine dispatch logic is moved
to monitor/qmp.c.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qapi/qmp/dispatch.h |  3 ++
 monitor/qmp.c               | 63 +++++++++++++++++++++++++++++++++++++
 qapi/qmp-dispatch.c         | 60 +----------------------------------
 stubs/qmp-dispatch-exec.c   |  8 +++++
 stubs/meson.build           |  1 +
 5 files changed, 76 insertions(+), 59 deletions(-)
 create mode 100644 stubs/qmp-dispatch-exec.c

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 1e4240fd0d..6941a759a7 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -41,6 +41,9 @@ typedef struct QmpCommand
 
 typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
 
+void qmp_dispatch_exec(const QmpCommand *cmd, bool oob, Monitor *cur_mon,
+                       QDict *args, QObject **ret, Error **err);
+
 void qmp_register_command(QmpCommandList *cmds, const char *name,
                           QmpCommandFunc *fn, QmpCommandOptions options,
                           unsigned special_features);
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 092c527b6f..b9b109a40a 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -132,6 +132,69 @@ static void monitor_qmp_respond(MonitorQMP *mon, QDict *rsp)
     }
 }
 
+typedef struct QmpDispatchBH {
+    const QmpCommand *cmd;
+    Monitor *cur_mon;
+    QDict *args;
+    QObject **ret;
+    Error **errp;
+    Coroutine *co;
+} QmpDispatchBH;
+
+static void do_qmp_dispatch_bh(void *opaque)
+{
+    QmpDispatchBH *data = opaque;
+
+    assert(monitor_cur() == NULL);
+    monitor_set_cur(qemu_coroutine_self(), data->cur_mon);
+    data->cmd->fn(data->args, data->ret, data->errp);
+    monitor_set_cur(qemu_coroutine_self(), NULL);
+    aio_co_wake(data->co);
+}
+
+/*
+ * Runs outside of coroutine context for OOB commands, but in coroutine
+ * context for everything else.
+ */
+void qmp_dispatch_exec(const QmpCommand *cmd, bool oob, Monitor *cur_mon,
+                       QDict *args, QObject **ret, Error **errp)
+{
+    assert(!(oob && qemu_in_coroutine()));
+    assert(monitor_cur() == NULL);
+
+    if (!!(cmd->options & QCO_COROUTINE) == qemu_in_coroutine()) {
+        monitor_set_cur(qemu_coroutine_self(), cur_mon);
+        cmd->fn(args, ret, errp);
+        monitor_set_cur(qemu_coroutine_self(), NULL);
+    } else {
+       /*
+        * Actual context doesn't match the one the command needs.
+        *
+        * Case 1: we are in coroutine context, but command does not
+        * have QCO_COROUTINE.  We need to drop out of coroutine
+        * context for executing it.
+        *
+        * Case 2: we are outside coroutine context, but command has
+        * QCO_COROUTINE.  Can't actually happen, because we get here
+        * outside coroutine context only when executing a command
+        * out of band, and OOB commands never have QCO_COROUTINE.
+        */
+        assert(!oob && qemu_in_coroutine() && !(cmd->options & QCO_COROUTINE));
+
+        QmpDispatchBH data = {
+            .cur_mon    = cur_mon,
+            .cmd        = cmd,
+            .args       = args,
+            .ret        = ret,
+            .errp       = errp,
+            .co         = qemu_coroutine_self(),
+        };
+        aio_bh_schedule_oneshot(qemu_get_aio_context(), do_qmp_dispatch_bh,
+                                &data);
+        qemu_coroutine_yield();
+    }
+}
+
 /*
  * Runs outside of coroutine context for OOB commands, but in
  * coroutine context for everything else.
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 0990873ec8..bec07e4958 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 
-#include "block/aio.h"
 #include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/dispatch.h"
@@ -22,8 +21,6 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qobject-output-visitor.h"
 #include "qapi/qmp/qbool.h"
-#include "qemu/coroutine.h"
-#include "qemu/main-loop.h"
 
 Visitor *qobject_input_visitor_new_qmp(QObject *obj)
 {
@@ -110,30 +107,6 @@ bool qmp_is_oob(const QDict *dict)
         && !qdict_haskey(dict, "execute");
 }
 
-typedef struct QmpDispatchBH {
-    const QmpCommand *cmd;
-    Monitor *cur_mon;
-    QDict *args;
-    QObject **ret;
-    Error **errp;
-    Coroutine *co;
-} QmpDispatchBH;
-
-static void do_qmp_dispatch_bh(void *opaque)
-{
-    QmpDispatchBH *data = opaque;
-
-    assert(monitor_cur() == NULL);
-    monitor_set_cur(qemu_coroutine_self(), data->cur_mon);
-    data->cmd->fn(data->args, data->ret, data->errp);
-    monitor_set_cur(qemu_coroutine_self(), NULL);
-    aio_co_wake(data->co);
-}
-
-/*
- * Runs outside of coroutine context for OOB commands, but in coroutine
- * context for everything else.
- */
 QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
                     bool allow_oob, Monitor *cur_mon)
 {
@@ -203,39 +176,8 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
         qobject_ref(args);
     }
 
-    assert(!(oob && qemu_in_coroutine()));
-    assert(monitor_cur() == NULL);
-    if (!!(cmd->options & QCO_COROUTINE) == qemu_in_coroutine()) {
-        monitor_set_cur(qemu_coroutine_self(), cur_mon);
-        cmd->fn(args, &ret, &err);
-        monitor_set_cur(qemu_coroutine_self(), NULL);
-    } else {
-       /*
-        * Actual context doesn't match the one the command needs.
-        *
-        * Case 1: we are in coroutine context, but command does not
-        * have QCO_COROUTINE.  We need to drop out of coroutine
-        * context for executing it.
-        *
-        * Case 2: we are outside coroutine context, but command has
-        * QCO_COROUTINE.  Can't actually happen, because we get here
-        * outside coroutine context only when executing a command
-        * out of band, and OOB commands never have QCO_COROUTINE.
-        */
-        assert(!oob && qemu_in_coroutine() && !(cmd->options & QCO_COROUTINE));
+    qmp_dispatch_exec(cmd, oob, cur_mon, args, &ret, &err);
 
-        QmpDispatchBH data = {
-            .cur_mon    = cur_mon,
-            .cmd        = cmd,
-            .args       = args,
-            .ret        = &ret,
-            .errp       = &err,
-            .co         = qemu_coroutine_self(),
-        };
-        aio_bh_schedule_oneshot(qemu_get_aio_context(), do_qmp_dispatch_bh,
-                                &data);
-        qemu_coroutine_yield();
-    }
     qobject_unref(args);
     if (err) {
         /* or assert(!ret) after reviewing all handlers: */
diff --git a/stubs/qmp-dispatch-exec.c b/stubs/qmp-dispatch-exec.c
new file mode 100644
index 0000000000..4aef28d198
--- /dev/null
+++ b/stubs/qmp-dispatch-exec.c
@@ -0,0 +1,8 @@
+#include "qemu/osdep.h"
+#include "qapi/qmp/dispatch.h"
+
+void qmp_dispatch_exec(const QmpCommand *cmd, bool oob, Monitor *cur_mon,
+                       QDict *args, QObject **ret, Error **err)
+{
+    cmd->fn(args, ret, err);
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index 0f3a782824..14548633b0 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -32,6 +32,7 @@ stub_ss.add(files('monitor.c'))
 stub_ss.add(files('monitor-core.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
 stub_ss.add(files('qmp_memory_device.c'))
+stub_ss.add(files('qmp-dispatch-exec.c'))
 stub_ss.add(files('qmp-command-available.c'))
 stub_ss.add(files('qmp-quit.c'))
 stub_ss.add(files('qtest.c'))
-- 
2.37.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320FB263061
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 17:19:48 +0200 (CEST)
Received: from localhost ([::1]:47822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG1sx-0004Ck-8s
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 11:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kG1ly-00022C-RR
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 11:12:34 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37311
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kG1ln-0003pt-RU
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 11:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599664342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPq3rM6ZMMv/7dmGNLv5CWGXMaj6732/fHE7gjjW2hs=;
 b=I/uV9zU0oahQMbrt2VfgxIv9IRAuctDaVJGfdJwPVDrT9kPq6NrI/eD1rDCHm9JM3RghXX
 XtVxwJkgqAeAS7Q6hGJWbqvtmbYfymxhJeWJ3CcOzWZnsss6XKdGJ/Mza6/r13EVKviO+5
 fY3dbLC8IAoYHi43dYIcYayBcNfKqz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-X6_P_yfsN6-Iy1RiJ1uocQ-1; Wed, 09 Sep 2020 11:12:20 -0400
X-MC-Unique: X6_P_yfsN6-Iy1RiJ1uocQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9307B1005E6A;
 Wed,  9 Sep 2020 15:12:19 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-221.ams2.redhat.com
 [10.36.113.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D51A60C07;
 Wed,  9 Sep 2020 15:12:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 10/13] hmp: Add support for coroutine command handlers
Date: Wed,  9 Sep 2020 17:11:46 +0200
Message-Id: <20200909151149.490589-11-kwolf@redhat.com>
In-Reply-To: <20200909151149.490589-1-kwolf@redhat.com>
References: <20200909151149.490589-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:20:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Often, QMP command handlers are not only called to handle QMP commands,
but also from a corresponding HMP command handler. In order to give them
a consistent environment, optionally run HMP command handlers in a
coroutine, too.

The implementation is a lot simpler than in QMP because for HMP, we
still block the VM while the coroutine is running.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 monitor/monitor-internal.h |  1 +
 monitor/hmp.c              | 37 ++++++++++++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index b55d6df07f..ad2e64be13 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -74,6 +74,7 @@ typedef struct HMPCommand {
     const char *help;
     const char *flags; /* p=preconfig */
     void (*cmd)(Monitor *mon, const QDict *qdict);
+    bool coroutine;
     /*
      * @sub_table is a list of 2nd level of commands. If it does not exist,
      * cmd should be used. If it exists, sub_table[?].cmd should be
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 4b66ca1cd6..b858b0dbde 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1056,12 +1056,26 @@ fail:
     return NULL;
 }
 
+typedef struct HandleHmpCommandCo {
+    Monitor *mon;
+    const HMPCommand *cmd;
+    QDict *qdict;
+    bool done;
+} HandleHmpCommandCo;
+
+static void handle_hmp_command_co(void *opaque)
+{
+    HandleHmpCommandCo *data = opaque;
+    data->cmd->cmd(data->mon, data->qdict);
+    monitor_set_cur(qemu_coroutine_self(), NULL);
+    data->done = true;
+}
+
 void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
 {
     QDict *qdict;
     const HMPCommand *cmd;
     const char *cmd_start = cmdline;
-    Monitor *old_mon;
 
     trace_handle_hmp_command(mon, cmdline);
 
@@ -1080,10 +1094,23 @@ void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
         return;
     }
 
-    /* old_mon is non-NULL when called from qmp_human_monitor_command() */
-    old_mon = monitor_set_cur(qemu_coroutine_self(), &mon->common);
-    cmd->cmd(&mon->common, qdict);
-    monitor_set_cur(qemu_coroutine_self(), old_mon);
+    if (!cmd->coroutine) {
+        /* old_mon is non-NULL when called from qmp_human_monitor_command() */
+        Monitor *old_mon = monitor_set_cur(qemu_coroutine_self(), &mon->common);
+        cmd->cmd(&mon->common, qdict);
+        monitor_set_cur(qemu_coroutine_self(), old_mon);
+    } else {
+        HandleHmpCommandCo data = {
+            .mon = &mon->common,
+            .cmd = cmd,
+            .qdict = qdict,
+            .done = false,
+        };
+        Coroutine *co = qemu_coroutine_create(handle_hmp_command_co, &data);
+        monitor_set_cur(co, &mon->common);
+        aio_co_enter(qemu_get_aio_context(), co);
+        AIO_WAIT_WHILE(qemu_get_aio_context(), !data.done);
+    }
 
     qobject_unref(qdict);
 }
-- 
2.25.4



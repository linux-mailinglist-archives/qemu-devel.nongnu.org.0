Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D815F212BC6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 20:00:11 +0200 (CEST)
Received: from localhost ([::1]:50456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr3VK-00033a-TX
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 14:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jr3TZ-0001aH-JT
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 13:58:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54861
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jr3TX-0003jy-NN
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 13:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593712698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/KbAh7YIy0hQqSIXEtGCgEiFAmAOg4VajFO8j8Qfd0=;
 b=beJe3wmowNDpna3A9w75roFho74g1EKVi2qgk4XaTqQuZEhnImEWT/lYtWmmTH4fcVqxa/
 9RSIlNUUxwf524bnMXyP53lkOYvOioW2i7GOXOmNd4V4gJQT5LWpZz8FhHgWfF1gY7LzXs
 TpwJLQmhai0td4p5PRm/wvmwt4yYeQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-0-VGJiDFPeervNVqmd3eRQ-1; Thu, 02 Jul 2020 13:58:17 -0400
X-MC-Unique: 0-VGJiDFPeervNVqmd3eRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5857C8031F6;
 Thu,  2 Jul 2020 17:58:16 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3D1B7554F;
 Thu,  2 Jul 2020 17:58:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] migration: introduce savevm, loadvm, delvm QMP commands
Date: Thu,  2 Jul 2020 18:57:50 +0100
Message-Id: <20200702175754.2211821-3-berrange@redhat.com>
In-Reply-To: <20200702175754.2211821-1-berrange@redhat.com>
References: <20200702175754.2211821-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

savevm, loadvm and delvm are some of the few commands that have never
been converted to use QMP. The primary reason for this lack of
conversion is that they block execution of the thread for as long as
they run.

Despite this downside, however, libvirt and applications using libvirt
has used these commands for as long as QMP has existed, via the
"human-monitor-command" passthrough command. IOW, while it is clearly
desirable to be able to fix the blocking problem, this is not an
immediate obstacle to real world usage.

Meanwhile there is a need for other features which involve adding new
parameters to the commands. This is possible with HMP passthrough, but
it provides no reliable way for apps to introspect features, so using
QAPI modelling is highly desirable.

This patch thus introduces trival savevm, loadvm, delvm commands
to QMP that are functionally identical to the HMP counterpart, including
the blocking problem.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/savevm.c  | 27 ++++++++++++++++
 monitor/hmp-cmds.c  | 18 ++---------
 qapi/migration.json | 76 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 106 insertions(+), 15 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 72dbad95ed..53586a6406 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2943,3 +2943,30 @@ bool vmstate_check_only_migratable(const VMStateDescription *vmsd)
 
     return !(vmsd && vmsd->unmigratable);
 }
+
+void qmp_savevm(const char *tag, Error **errp)
+{
+    save_snapshot(tag, errp);
+}
+
+void qmp_loadvm(const char *tag, Error **errp)
+{
+    int saved_vm_running  = runstate_is_running();
+
+    vm_stop(RUN_STATE_RESTORE_VM);
+
+    if (load_snapshot(tag, errp) == 0 && saved_vm_running) {
+        vm_start();
+    }
+}
+
+void qmp_delvm(const char *tag, Error **errp)
+{
+    BlockDriverState *bs;
+
+    if (bdrv_all_delete_snapshot(tag, &bs, errp) < 0) {
+        error_prepend(errp,
+                      "deleting snapshot on device '%s': ",
+                      bdrv_get_device_or_node_name(bs));
+    }
+}
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2b0b58a336..26a5a1a701 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1089,15 +1089,9 @@ void hmp_balloon(Monitor *mon, const QDict *qdict)
 
 void hmp_loadvm(Monitor *mon, const QDict *qdict)
 {
-    int saved_vm_running  = runstate_is_running();
-    const char *name = qdict_get_str(qdict, "name");
     Error *err = NULL;
 
-    vm_stop(RUN_STATE_RESTORE_VM);
-
-    if (load_snapshot(name, &err) == 0 && saved_vm_running) {
-        vm_start();
-    }
+    qmp_loadvm(qdict_get_str(qdict, "name"), &err);
     hmp_handle_error(mon, err);
 }
 
@@ -1105,21 +1099,15 @@ void hmp_savevm(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
 
-    save_snapshot(qdict_get_try_str(qdict, "name"), &err);
+    qmp_savevm(qdict_get_try_str(qdict, "name"), &err);
     hmp_handle_error(mon, err);
 }
 
 void hmp_delvm(Monitor *mon, const QDict *qdict)
 {
-    BlockDriverState *bs;
     Error *err = NULL;
-    const char *name = qdict_get_str(qdict, "name");
 
-    if (bdrv_all_delete_snapshot(name, &bs, &err) < 0) {
-        error_prepend(&err,
-                      "deleting snapshot on device '%s': ",
-                      bdrv_get_device_name(bs));
-    }
+    qmp_delvm(qdict_get_str(qdict, "name"), &err);
     hmp_handle_error(mon, err);
 }
 
diff --git a/qapi/migration.json b/qapi/migration.json
index d5000558c6..849de38fb0 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1621,3 +1621,79 @@
 ##
 { 'event': 'UNPLUG_PRIMARY',
   'data': { 'device-id': 'str' } }
+
+##
+# @savevm:
+#
+# Save a VM snapshot
+#
+# @tag: name of the snapshot to create. If it already
+# exists it will be replaced.
+#
+# Note that execution of the VM will be paused during the time
+# it takes to save the snapshot
+#
+# Returns: nothing
+#
+# Example:
+#
+# -> { "execute": "savevm",
+#      "data": {
+#         "tag": "my-snap"
+#      }
+#    }
+# <- { "return": { } }
+#
+# Since: 5.2
+##
+{ 'command': 'savevm',
+  'data': { 'tag': 'str' } }
+
+##
+# @loadvm:
+#
+# Load a VM snapshot
+#
+# @tag: name of the snapshot to load.
+#
+# Returns: nothing
+#
+# Example:
+#
+# -> { "execute": "loadvm",
+#      "data": {
+#         "tag": "my-snap"
+#      }
+#    }
+# <- { "return": { } }
+#
+# Since: 5.2
+##
+{ 'command': 'loadvm',
+  'data': { 'tag': 'str' } }
+
+##
+# @delvm:
+#
+# Delete a VM snapshot
+#
+# @tag: name of the snapshot to delete.
+#
+# Note that execution of the VM will be paused during the time
+# it takes to delete the snapshot
+#
+# Returns: nothing
+#
+# Example:
+#
+# -> { "execute": "delvm",
+#      "data": {
+#         "tag": "my-snap"
+#      }
+#    }
+# <- { "return": { } }
+#
+# Since: 5.2
+##
+{ 'command': 'delvm',
+  'data': { 'tag': 'str' } }
-- 
2.26.2



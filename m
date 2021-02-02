Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D81230C4FA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:10:35 +0100 (CET)
Received: from localhost ([::1]:57504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yGA-000541-7D
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6xox-0008Tr-R0
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:42:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6xol-0003gY-34
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612280531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qqeiCgEZg2PLbZVD4giB8t/P0lxMiRtGZG6B3a2Qks=;
 b=SEaPwrYF4CVuOMcjm9NiURl8NNOpTRuJQpwJjoutgZIJYyyASDwGgozCeKUOPjmqtLg5V5
 Rt1gxgG1HHKNmPeRNPQQjsDpGrZyFbfk+TOMcQk9xC1m+ubVqFFOGJS7Be0zxeC3fTaowY
 hqH61loxWSFGyE3uNjjr/jpAVPGb4UM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-ICU0ubxMPnO7_fMJItT_5g-1; Tue, 02 Feb 2021 10:42:10 -0500
X-MC-Unique: ICU0ubxMPnO7_fMJItT_5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1671F80400E;
 Tue,  2 Feb 2021 15:42:09 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-202.ams2.redhat.com
 [10.36.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 379021980D;
 Tue,  2 Feb 2021 15:42:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 07/12] migration: control whether snapshots are ovewritten
Date: Tue,  2 Feb 2021 15:41:33 +0000
Message-Id: <20210202154138.246464-8-berrange@redhat.com>
In-Reply-To: <20210202154138.246464-1-berrange@redhat.com>
References: <20210202154138.246464-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The traditional HMP "savevm" command will overwrite an existing snapshot
if it already exists with the requested name. This new flag allows this
to be controlled allowing for safer behaviour with a future QMP command.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/migration/snapshot.h |  3 ++-
 migration/savevm.c           | 19 ++++++++++++++++---
 monitor/hmp-cmds.c           |  2 +-
 replay/replay-debugging.c    |  2 +-
 replay/replay-snapshot.c     |  2 +-
 5 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/include/migration/snapshot.h b/include/migration/snapshot.h
index d7d210820c..d8c22d343c 100644
--- a/include/migration/snapshot.h
+++ b/include/migration/snapshot.h
@@ -18,11 +18,12 @@
 /**
  * save_snapshot: Save an internal snapshot.
  * @name: name of internal snapshot
+ * @overwrite: replace existing snapshot with @name
  * @errp: pointer to error object
  * On success, return %true.
  * On failure, store an error through @errp and return %false.
  */
-bool save_snapshot(const char *name, Error **errp);
+bool save_snapshot(const char *name, bool overwrite, Error **errp);
 
 /**
  * load_snapshot: Load an internal snapshot.
diff --git a/migration/savevm.c b/migration/savevm.c
index 5cd3408dfe..a98f65c165 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2729,7 +2729,7 @@ int qemu_load_device_state(QEMUFile *f)
     return 0;
 }
 
-bool save_snapshot(const char *name, Error **errp)
+bool save_snapshot(const char *name, bool overwrite, Error **errp)
 {
     BlockDriverState *bs;
     QEMUSnapshotInfo sn1, *sn = &sn1;
@@ -2757,8 +2757,21 @@ bool save_snapshot(const char *name, Error **errp)
 
     /* Delete old snapshots of the same name */
     if (name) {
-        if (bdrv_all_delete_snapshot(name, false, NULL, errp) < 0) {
-            return false;
+        if (overwrite) {
+            if (bdrv_all_delete_snapshot(name, false, NULL, errp) < 0) {
+                return false;
+            }
+        } else {
+            ret2 = bdrv_all_has_snapshot(name, false, NULL, errp);
+            if (ret2 < 0) {
+                return false;
+            }
+            if (ret2 == 1) {
+                error_setg(errp,
+                           "Snapshot '%s' already exists in one or more devices",
+                           name);
+                return false;
+            }
         }
     }
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index d382918b23..8a3387b72e 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1140,7 +1140,7 @@ void hmp_savevm(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
 
-    save_snapshot(qdict_get_try_str(qdict, "name"), &err);
+    save_snapshot(qdict_get_try_str(qdict, "name"), true, &err);
     hmp_handle_error(mon, err);
 }
 
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index 098ef8e0f5..0ae6785b3b 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -327,7 +327,7 @@ void replay_gdb_attached(void)
      */
     if (replay_mode == REPLAY_MODE_PLAY
         && !replay_snapshot) {
-        if (!save_snapshot("start_debugging", NULL)) {
+        if (!save_snapshot("start_debugging", true, NULL)) {
             /* Can't create the snapshot. Continue conventional debugging. */
         }
     }
diff --git a/replay/replay-snapshot.c b/replay/replay-snapshot.c
index b289365937..31c5a8702b 100644
--- a/replay/replay-snapshot.c
+++ b/replay/replay-snapshot.c
@@ -77,7 +77,7 @@ void replay_vmstate_init(void)
 
     if (replay_snapshot) {
         if (replay_mode == REPLAY_MODE_RECORD) {
-            if (!save_snapshot(replay_snapshot, &err)) {
+            if (!save_snapshot(replay_snapshot, true, &err)) {
                 error_report_err(err);
                 error_report("Could not create snapshot for icount record");
                 exit(1);
-- 
2.29.2



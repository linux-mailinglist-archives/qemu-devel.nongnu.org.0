Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FCB2FCE13
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:51:26 +0100 (CET)
Received: from localhost ([::1]:41410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2B5B-0000DP-5u
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2Az3-0002rn-1x
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:45:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2Ayx-0006fw-QH
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611139499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=clduRjFtpmGhitixL1BNxgHCSNOdo9tzDvE25yq8OG4=;
 b=LqElmwb3wMDhO3HkgPV5n8ay8ajwM1v2bdVx7upXpfVq45rOTtPbxVevogyB3OtlT6ZnkK
 3i1EUbypeAYTG9m//Ij41rszlHj4gJGZBrWYATmSaD5rT0BHUky4MHaAIVHxWhQoBi912d
 HNslG2JhtVaUHppvX27T62ULMnMZl1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-DkOFx4iTPVOM11xSeEo6Vw-1; Wed, 20 Jan 2021 05:44:57 -0500
X-MC-Unique: DkOFx4iTPVOM11xSeEo6Vw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46C111800D42;
 Wed, 20 Jan 2021 10:44:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-126.ams2.redhat.com
 [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 164B571D57;
 Wed, 20 Jan 2021 10:44:52 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 07/11] migration: control whether snapshots are ovewritten
Date: Wed, 20 Jan 2021 10:44:07 +0000
Message-Id: <20210120104411.3084801-8-berrange@redhat.com>
In-Reply-To: <20210120104411.3084801-1-berrange@redhat.com>
References: <20210120104411.3084801-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
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
index 3bc45c62f2..312ebef66c 100644
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
index b096791320..503e082394 100644
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



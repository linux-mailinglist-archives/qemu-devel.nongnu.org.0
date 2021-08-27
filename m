Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A1D3F93DA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:57:57 +0200 (CEST)
Received: from localhost ([::1]:46954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTwC-0005Zy-CS
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpQ-0008NE-Uo
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpP-0000w4-6L
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630039854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6xabf60UgqTGCEOo05hM5dsvuCrL5rPaPCO8WXi1tz4=;
 b=SapG/IWC6A5UlBecaRs33WbZ9QanOVc8sDELZyRoN22284JRmhE9hmeIgf/TyT3nVioi2T
 HntlZk7hSFkTFIW4NV9wBuv8VsHiqKHV8PbR+kvDHAPt0R8Ebd21UXGydLUyLeLG5ft6jb
 DfuzE9gnkbOqmD886mq7LvmqmFhUs78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-ZooRchS6N6C8aiogU96lvQ-1; Fri, 27 Aug 2021 00:50:53 -0400
X-MC-Unique: ZooRchS6N6C8aiogU96lvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4EBF1082922;
 Fri, 27 Aug 2021 04:50:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BF5127CA4;
 Fri, 27 Aug 2021 04:50:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9DBCD11380CC; Fri, 27 Aug 2021 06:50:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/15] migration: Handle migration_incoming_setup() errors
 consistently
Date: Fri, 27 Aug 2021 06:50:39 +0200
Message-Id: <20210827045044.388748-11-armbru@redhat.com>
In-Reply-To: <20210827045044.388748-1-armbru@redhat.com>
References: <20210827045044.388748-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit b673eab4e2 "multifd: Make multifd_load_setup() get an Error
parameter" changed migration_incoming_setup() to take an Error **
argument, and adjusted the callers accordingly.  It neglected to
change adjust multifd_load_setup(): it still exit()s on error.  Clean
that up.

The error now gets propagated up two call chains: via
migration_fd_process_incoming() to rdma_accept_incoming_migration(),
and via migration_ioc_process_incoming() to
migration_channel_process_incoming().  Both chain ends report the
error with error_report_err(), but otherwise ignore it.  Behavioral
change: we no longer exit() on this error.

This is consistent with how we handle other errors here, e.g. from
multifd_recv_new_channel() via migration_ioc_process_incoming() to
migration_channel_process_incoming().  Whether it's consistently right
or consistently wrong I can't tell.

Also clean up the return value from the unusual 0 on success, 1 on
error to the more common true on success, false on error.

Cc: Juan Quintela <quintela@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210720125408.387910-11-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 migration/migration.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index b169943f35..bb909781b7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -611,30 +611,25 @@ fail:
 }
 
 /**
- * @migration_incoming_setup: Setup incoming migration
- *
- * Returns 0 for no error or 1 for error
- *
+ * migration_incoming_setup: Setup incoming migration
  * @f: file for main migration channel
  * @errp: where to put errors
+ *
+ * Returns: %true on success, %false on error.
  */
-static int migration_incoming_setup(QEMUFile *f, Error **errp)
+static bool migration_incoming_setup(QEMUFile *f, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
-    Error *local_err = NULL;
 
-    if (multifd_load_setup(&local_err) != 0) {
-        /* We haven't been able to create multifd threads
-           nothing better to do */
-        error_report_err(local_err);
-        exit(EXIT_FAILURE);
+    if (multifd_load_setup(errp) != 0) {
+        return false;
     }
 
     if (!mis->from_src_file) {
         mis->from_src_file = f;
     }
     qemu_file_set_blocking(f, false);
-    return 0;
+    return true;
 }
 
 void migration_incoming_process(void)
@@ -677,14 +672,11 @@ static bool postcopy_try_recover(QEMUFile *f)
 
 void migration_fd_process_incoming(QEMUFile *f, Error **errp)
 {
-    Error *local_err = NULL;
-
     if (postcopy_try_recover(f)) {
         return;
     }
 
-    if (migration_incoming_setup(f, &local_err)) {
-        error_propagate(errp, local_err);
+    if (!migration_incoming_setup(f, errp)) {
         return;
     }
     migration_incoming_process();
@@ -705,8 +697,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
             return;
         }
 
-        if (migration_incoming_setup(f, &local_err)) {
-            error_propagate(errp, local_err);
+        if (!migration_incoming_setup(f, errp)) {
             return;
         }
 
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73F3D59C7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:49:27 +0200 (CEST)
Received: from localhost ([::1]:43226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m802w-00009Y-7u
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zyL-0001gf-FA
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:44:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zyJ-00089w-LC
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627303479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KVqPMCmcEXoYQlwYkqd9YGtwnCkdLCYcKuTtdht7dw=;
 b=BtbR/MKJAkqk4MyBPLEgmW382mIPSAvA7fy5n43+tJNwdppHVhC3mxum0qBl6vAlvGPqdK
 2guirMG42GrS83u+YkePCk60+ZN7Z3IWYW2/OtbdiuzAYJUlvmbrHH9oW1jhPcwGpv8VBU
 H7+toDWscAHmeC1cwIeK9GLgFChNEIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-GAHFusUwNKmYHYeJk5kaFg-1; Mon, 26 Jul 2021 08:44:37 -0400
X-MC-Unique: GAHFusUwNKmYHYeJk5kaFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78C19802CBE;
 Mon, 26 Jul 2021 12:44:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-117.ams2.redhat.com
 [10.36.113.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60D1A60C81;
 Mon, 26 Jul 2021 12:44:13 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	wei.w.wang@intel.com,
	peterx@redhat.com
Subject: [PULL 6/7] migration: Move the yank unregister of channel_close out
Date: Mon, 26 Jul 2021 13:43:30 +0100
Message-Id: <20210726124331.124710-7-dgilbert@redhat.com>
In-Reply-To: <20210726124331.124710-1-dgilbert@redhat.com>
References: <20210726124331.124710-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, leobras@redhat.com, david@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

It's efficient, but hackish to call yank unregister calls in channel_close(),
especially it'll be hard to debug when qemu crashed with some yank function
leaked.

Remove that hack, but instead explicitly unregister yank functions at the
places where needed, they are:

  (on src)
  - migrate_fd_cleanup
  - postcopy_pause

  (on dst)
  - migration_incoming_state_destroy
  - postcopy_pause_incoming

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210722175841.938739-6-peterx@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c         | 14 +++++++++++++-
 migration/qemu-file-channel.c |  3 ---
 migration/savevm.c            |  7 +++++++
 migration/yank_functions.c    | 14 ++++++++++++++
 migration/yank_functions.h    |  1 +
 5 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 62dbcb7d52..041b8451a6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -59,6 +59,7 @@
 #include "multifd.h"
 #include "qemu/yank.h"
 #include "sysemu/cpus.h"
+#include "yank_functions.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -273,6 +274,7 @@ void migration_incoming_state_destroy(void)
     }
 
     if (mis->from_src_file) {
+        migration_ioc_unregister_yank_from_file(mis->from_src_file);
         qemu_fclose(mis->from_src_file);
         mis->from_src_file = NULL;
     }
@@ -1811,6 +1813,7 @@ static void migrate_fd_cleanup(MigrationState *s)
          * Close the file handle without the lock to make sure the
          * critical section won't block for long.
          */
+        migration_ioc_unregister_yank_from_file(tmp);
         qemu_fclose(tmp);
     }
 
@@ -3351,8 +3354,17 @@ static MigThrError postcopy_pause(MigrationState *s)
     while (true) {
         QEMUFile *file;
 
-        /* Current channel is possibly broken. Release it. */
+        /*
+         * Current channel is possibly broken. Release it.  Note that this is
+         * guaranteed even without lock because to_dst_file should only be
+         * modified by the migration thread.  That also guarantees that the
+         * unregister of yank is safe too without the lock.  It should be safe
+         * even to be within the qemu_file_lock, but we didn't do that to avoid
+         * taking more mutex (yank_lock) within qemu_file_lock.  TL;DR: we make
+         * the qemu_file_lock critical section as small as possible.
+         */
         assert(s->to_dst_file);
+        migration_ioc_unregister_yank_from_file(s->to_dst_file);
         qemu_mutex_lock(&s->qemu_file_lock);
         file = s->to_dst_file;
         s->to_dst_file = NULL;
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index 2f8b1fcd46..bb5a5752df 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -107,9 +107,6 @@ static int channel_close(void *opaque, Error **errp)
     int ret;
     QIOChannel *ioc = QIO_CHANNEL(opaque);
     ret = qio_channel_close(ioc, errp);
-    if (OBJECT(ioc)->ref == 1) {
-        migration_ioc_unregister_yank(ioc);
-    }
     object_unref(OBJECT(ioc));
     return ret;
 }
diff --git a/migration/savevm.c b/migration/savevm.c
index 96b5e5d639..7b7b64bd13 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -65,6 +65,7 @@
 #include "qemu/bitmap.h"
 #include "net/announce.h"
 #include "qemu/yank.h"
+#include "yank_functions.h"
 
 const unsigned int postcopy_ram_discard_version;
 
@@ -2568,6 +2569,12 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
     /* Clear the triggered bit to allow one recovery */
     mis->postcopy_recover_triggered = false;
 
+    /*
+     * Unregister yank with either from/to src would work, since ioc behind it
+     * is the same
+     */
+    migration_ioc_unregister_yank_from_file(mis->from_src_file);
+
     assert(mis->from_src_file);
     qemu_file_shutdown(mis->from_src_file);
     qemu_fclose(mis->from_src_file);
diff --git a/migration/yank_functions.c b/migration/yank_functions.c
index 23697173ae..8c08aef14a 100644
--- a/migration/yank_functions.c
+++ b/migration/yank_functions.c
@@ -14,6 +14,7 @@
 #include "qemu/yank.h"
 #include "io/channel-socket.h"
 #include "io/channel-tls.h"
+#include "qemu-file.h"
 
 void migration_yank_iochannel(void *opaque)
 {
@@ -46,3 +47,16 @@ void migration_ioc_unregister_yank(QIOChannel *ioc)
                                  QIO_CHANNEL(ioc));
     }
 }
+
+void migration_ioc_unregister_yank_from_file(QEMUFile *file)
+{
+    QIOChannel *ioc = qemu_file_get_ioc(file);
+
+    if (ioc) {
+        /*
+         * For migration qemufiles, we'll always reach here.  Though we'll skip
+         * calls from e.g. savevm/loadvm as they don't use yank.
+         */
+        migration_ioc_unregister_yank(ioc);
+    }
+}
diff --git a/migration/yank_functions.h b/migration/yank_functions.h
index 74c7f18c91..a7577955ed 100644
--- a/migration/yank_functions.h
+++ b/migration/yank_functions.h
@@ -17,3 +17,4 @@
 void migration_yank_iochannel(void *opaque);
 void migration_ioc_register_yank(QIOChannel *ioc);
 void migration_ioc_unregister_yank(QIOChannel *ioc);
+void migration_ioc_unregister_yank_from_file(QEMUFile *file);
-- 
2.31.1



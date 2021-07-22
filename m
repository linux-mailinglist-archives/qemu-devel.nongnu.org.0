Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B093D2BD2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:20:29 +0200 (CEST)
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6dJ6-0001KT-AM
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cyJ-0005Nf-HB
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6cyH-0006BX-Ez
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hF+7xtGuVKQZvHq4jyUAcy84OuZgE4buGXnLhdZjuc=;
 b=HvzFVxs6dkrKj4mdRxHVum+ekkSAsDlobdAVFRJ62p+Tj5pBpbbPm1AGgw7KPTgMenKKuL
 dIk96R5dgMHUs/AH3w0gYuJLAQxyZYxgAn/tJMyvieUEGwE+/I7SyhgNxFHQho39HynYLM
 wASD4dDR0uCX/OlWVv7GnhMeP2MsIrY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-1ReLYlKnMc6uTWDjBCGYdQ-1; Thu, 22 Jul 2021 13:58:55 -0400
X-MC-Unique: 1ReLYlKnMc6uTWDjBCGYdQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 h12-20020a0562140dacb029030449450d37so80359qvh.14
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+hF+7xtGuVKQZvHq4jyUAcy84OuZgE4buGXnLhdZjuc=;
 b=r6vtYJS0+bGK9d99z/5yiiulVB9yWg2GmjE3QUCaZ9i1OXOAdrJhce+rPp7DVVCLgI
 +mkqLnlZ1YmSZZQNWoOa0OWeteg6IH0ZUk+MplOc00MtJUrELysvwihDUIjKzI2HTxjf
 K37bk5RWJjYrwUTeaxhpD6CmscBTAaazLln81iL5pf0O8pM1hmFJHb6FA0jgsi6VAXgN
 wZju1Dm2rbQiqv/K5X8zszcjolJEwqgbartEbgKOxtW4pUtPNrdhLcHytfBcAght0LCJ
 pc0VMlAQnrM+7Dy9k+6ktQhFf1YemiX8JYXM2TU+Jz5YRC8IbmznBOBoZMMcxWjljyTz
 ubDA==
X-Gm-Message-State: AOAM530hlFOl/gAN6ojvAepENa04z5kq0dUXOF/WH5G8A+cBktOwO+6W
 rjXQo8/XjxcUKM40+86JLuyJ904u57+pChykfVRLHp/UjTjo9cUrBpwT8XxEt9VwdZI8WYSdBvr
 c5PgV/5bN4EeiG3ts3TCeR8BLvmJQzlM8G8CByj4+47PXbIE2SCMzbMD/CFTmcabC
X-Received: by 2002:a37:9d41:: with SMTP id g62mr818075qke.55.1626976734725;
 Thu, 22 Jul 2021 10:58:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPDkGswJTWHrh+SgGCfBUU+nwisKOl4U0VYZQMEGU2toXXt4WforeUhhFFQhYfv/RerP84MQ==
X-Received: by 2002:a37:9d41:: with SMTP id g62mr818045qke.55.1626976734453;
 Thu, 22 Jul 2021 10:58:54 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j20sm10418018qtq.14.2021.07.22.10.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:58:53 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] migration: Move the yank unregister of channel_close
 out
Date: Thu, 22 Jul 2021 13:58:41 -0400
Message-Id: <20210722175841.938739-6-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722175841.938739-1-peterx@redhat.com>
References: <20210722175841.938739-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 migration/migration.c         | 14 +++++++++++++-
 migration/qemu-file-channel.c |  3 ---
 migration/savevm.c            |  7 +++++++
 migration/yank_functions.c    | 14 ++++++++++++++
 migration/yank_functions.h    |  1 +
 5 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index b2c48b7e17..a50330016c 100644
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



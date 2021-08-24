Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFD33F619C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:29:05 +0200 (CEST)
Received: from localhost ([::1]:58580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYMK-0004F2-Pj
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIYKq-00022h-GA
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:27:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIYKo-0006ib-OW
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629818849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05wrd8rIW6nKro+F8yobZZdRrJtDZVauslriY61c9Ag=;
 b=bBMzZV36TkyojbRdNbylyPEVOzFSsF5UFdjV+yJzQFdoJHs9j5XWnT72h1wDHVUixZMAej
 Juy1G2kjVqlHnHuEPG6e6peo+o9PDRZpeR5GmSeWhQFEd5b62nQFc0nx8Vk0QDHZ4aJEl3
 Rx7iU1I9mrqAEbhcj0ez8txYXOXwu9A=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-nKy1tGyMMKe4pbneJdmaLA-1; Tue, 24 Aug 2021 11:27:28 -0400
X-MC-Unique: nKy1tGyMMKe4pbneJdmaLA-1
Received: by mail-qv1-f69.google.com with SMTP id
 b8-20020a0562141148b02902f1474ce8b7so15084001qvt.20
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 08:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=05wrd8rIW6nKro+F8yobZZdRrJtDZVauslriY61c9Ag=;
 b=fotJqoxXEYgKU70e0N6wDoupIMuLivO5OoGvJBpzhqYQhi17o0JwUrfeTb+tZQwv8H
 D9jmhUiUUOKZ/7ke4ixCi2uqjb7JRHphBJt1PLlgaemcHUybVE2aUsE62S9UyUcejcbK
 4ocvB2rAsefPTNvo5w8G+25FbMrdp81M00eDOIXFbDjOK7F1nmrTCzAlCRCUlyknWqQf
 9Vl3dvAnf6TVJCZRIgrBeM0udlgPggMWvF5tQIzxYvxJR80XaRDLc9Rwr/8hvxSnG5vm
 Ewy9EsYzbdYpo/3l2BjQa8RHkrW7LbgEUf1oWKBhwvBbHx51YsJuotADrUvTRGLCHdmL
 e9iQ==
X-Gm-Message-State: AOAM531cOsIYkDO4zyHl/YkknlENoKyV2UHgelBdoHZdgpaIDqUDVls4
 yKf/4CILcXln1pVBqhyaF0Lkc8WYVTbKLLzWsKOpV1Oc96ESzwPlGsTqs7vRyQg+Puz23f01A0z
 /Vha1XMdfKnwvWESo1KXa6EgRCoq6qTzvBUYSUssjQ1reGYyqM8Egx/id5eIVk+LO
X-Received: by 2002:a0c:aac3:: with SMTP id g3mr22418149qvb.14.1629818847985; 
 Tue, 24 Aug 2021 08:27:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc008iARgjQeS7QDBo0t7U0ZYYqu7hQjvwpfxLauOWl14/X2xYU12K9WVBWYVBQX2Up7C15g==
X-Received: by 2002:a0c:aac3:: with SMTP id g3mr22418112qvb.14.1629818847684; 
 Tue, 24 Aug 2021 08:27:27 -0700 (PDT)
Received: from t490s.phub.net.cable.rogers.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id j127sm10939754qkf.20.2021.08.24.08.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 08:27:27 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] dump-guest-memory: Block live migration
Date: Tue, 24 Aug 2021 11:27:21 -0400
Message-Id: <20210824152721.79747-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824152721.79747-1-peterx@redhat.com>
References: <20210824152721.79747-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both dump-guest-memory and live migration caches vm state at the beginning.
Either of them entering the other one will cause race on the vm state, and even
more severe on that (please refer to the crash report in the bug link).

Let's block live migration in dump-guest-memory, and that'll also block
dump-guest-memory if it detected that we're during a live migration.

Side note: migrate_del_blocker() can be called even if the blocker is not
inserted yet, so it's safe to unconditionally delete that blocker in
dump_cleanup (g_slist_remove allows no-entry-found case).

Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1996609
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 dump/dump.c           | 20 +++++++++++++++-----
 include/sysemu/dump.h |  1 +
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index ab625909f3..7996d7a6c5 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -29,6 +29,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "hw/misc/vmcoreinfo.h"
+#include "migration/blocker.h"
 
 #ifdef TARGET_X86_64
 #include "win_dump.h"
@@ -101,6 +102,7 @@ static int dump_cleanup(DumpState *s)
             qemu_mutex_unlock_iothread();
         }
     }
+    migrate_del_blocker(s->dump_migration_blocker);
 
     return 0;
 }
@@ -1857,6 +1859,19 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         }
     }
 
+    if (!s->dump_migration_blocker) {
+        error_setg(&s->dump_migration_blocker,
+                   "Live migration disabled: dump-guest-memory in progress");
+    }
+
+    /*
+     * Allows even for -only-migratable, but forbid migration during the
+     * process of dump guest memory.
+     */
+    if (migrate_add_blocker_internal(s->dump_migration_blocker, errp)) {
+        goto cleanup;
+    }
+
     return;
 
 cleanup:
@@ -1927,11 +1942,6 @@ void qmp_dump_guest_memory(bool paging, const char *file,
     Error *local_err = NULL;
     bool detach_p = false;
 
-    if (runstate_check(RUN_STATE_INMIGRATE)) {
-        error_setg(errp, "Dump not allowed during incoming migration.");
-        return;
-    }
-
     /* if there is a dump in background, we should wait until the dump
      * finished */
     if (dump_in_progress()) {
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 250143cb5a..7b619c2a43 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -195,6 +195,7 @@ typedef struct DumpState {
                                   * finished. */
     uint8_t *guest_note;         /* ELF note content */
     size_t guest_note_size;
+    Error *dump_migration_blocker; /* Blocker for live migration */
 } DumpState;
 
 uint16_t cpu_to_dump16(DumpState *s, uint16_t val);
-- 
2.31.1



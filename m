Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7768F3F8E6C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:03:39 +0200 (CEST)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJKek-0008TT-Ij
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJKa2-0002tC-7A
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:58:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJKa0-0001BM-Fi
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630004303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62MuU3H3NB0I9MePyooMeyPJWMxyy9cKmJ9raN3w+eQ=;
 b=UxmNMzx4MP8yPF1ccK883A97THsHD3GdLRelfJQWMR1QuWMG0hjXNhu08/IkQUcABKdnKE
 VES2fd0dIalnKrWos6mglnC+kUU3yFyBvHFd9EzmusDbcj/rDjWaKauscQz8f84XuS3eim
 glxrqy5/SCrTGBwTFvzm0/818QayujI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-VjYWJA4FOzKGvxQmgkVmcg-1; Thu, 26 Aug 2021 14:58:22 -0400
X-MC-Unique: VjYWJA4FOzKGvxQmgkVmcg-1
Received: by mail-qv1-f70.google.com with SMTP id
 u11-20020a0562141c0b00b0036201580785so459187qvc.11
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 11:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62MuU3H3NB0I9MePyooMeyPJWMxyy9cKmJ9raN3w+eQ=;
 b=pLdbimQkrA1N1FxiHnzwiZICLt1ChIc35554RF2PvVgPTmF/xnYc8e9IUaVO4jEAOC
 94VWLvTnVLXrZGoU465FGDDh4AknecQyKQQgcIDPCW1SVmm2ekbXHQfQaOOFHgkFFmyM
 M0IdmqbzFdQelj9WhvLcXiZMfe6y7u6TdNq+i8qLjzWpb3eFUUaqrg6/Aa+DrqitLu5P
 HUlI1WsodqEbXgqUNLxZBgRDvsFKKFjqMN0/2S1w8BTJX8gGdseCesQh760pzcrTPNx0
 zJRbuLd4uNGIfVH+v5/I5vjDgqjqlBp+GhXgfDTlKwe/j/apN1468nYsYZsRaMcyIWgj
 zIfw==
X-Gm-Message-State: AOAM532Tlfjl8clEOaEHAqGLxuaDazxnkylvEdMLTeMp9HMUS5D6DAW0
 5BxYwByvlszyWw0FsWcNDAvqE1Zzw+xLtWAt58iRk1ZwJ7MgauEYRTga0Cnj16a6kH/OZJki/0i
 Po0Hrg8SLAHjhQ8tOnclRAju8islVPOKe0DTHvyk0JF+EeTN6dyRP9CyRAs49fr3B
X-Received: by 2002:ac8:47d7:: with SMTP id d23mr4797681qtr.73.1630004301611; 
 Thu, 26 Aug 2021 11:58:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylBYg0Rob+9iYme7i9LL+c2D+hE186/hyvCegT5FMcbfuqUq6IqNh1wFdHxK1Eai2cJ/4PiQ==
X-Received: by 2002:ac8:47d7:: with SMTP id d23mr4797648qtr.73.1630004301332; 
 Thu, 26 Aug 2021 11:58:21 -0700 (PDT)
Received: from t490s.phub.net.cable.rogers.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id t8sm2328195qtn.37.2021.08.26.11.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 11:58:20 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] dump-guest-memory: Block live migration
Date: Thu, 26 Aug 2021 14:58:13 -0400
Message-Id: <20210826185813.248441-4-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826185813.248441-1-peterx@redhat.com>
References: <20210826185813.248441-1-peterx@redhat.com>
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
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
 dump/dump.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index ab625909f3..9c1c1fb738 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -29,6 +29,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "hw/misc/vmcoreinfo.h"
+#include "migration/blocker.h"
 
 #ifdef TARGET_X86_64
 #include "win_dump.h"
@@ -47,6 +48,8 @@
 
 #define MAX_GUEST_NOTE_SIZE (1 << 20) /* 1MB should be enough */
 
+static Error *dump_migration_blocker;
+
 #define ELF_NOTE_SIZE(hdr_size, name_size, desc_size)   \
     ((DIV_ROUND_UP((hdr_size), 4) +                     \
       DIV_ROUND_UP((name_size), 4) +                    \
@@ -101,6 +104,7 @@ static int dump_cleanup(DumpState *s)
             qemu_mutex_unlock_iothread();
         }
     }
+    migrate_del_blocker(dump_migration_blocker);
 
     return 0;
 }
@@ -1927,11 +1931,6 @@ void qmp_dump_guest_memory(bool paging, const char *file,
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
@@ -2005,6 +2004,21 @@ void qmp_dump_guest_memory(bool paging, const char *file,
         return;
     }
 
+    if (!dump_migration_blocker) {
+        error_setg(&dump_migration_blocker,
+                   "Live migration disabled: dump-guest-memory in progress");
+    }
+
+    /*
+     * Allows even for -only-migratable, but forbid migration during the
+     * process of dump guest memory.
+     */
+    if (migrate_add_blocker_internal(dump_migration_blocker, errp)) {
+        /* Remember to release the fd before passing it over to dump state */
+        close(fd);
+        return;
+    }
+
     s = &dump_state_global;
     dump_state_prepare(s);
 
-- 
2.31.1



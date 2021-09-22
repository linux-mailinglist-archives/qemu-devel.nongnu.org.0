Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5AF414F88
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:01:43 +0200 (CEST)
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT6Yw-0004NC-VO
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT4yz-0007pU-A3
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:20:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT4yw-0000jk-NG
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632327625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIEoX8C4rt317Lbcem8lIPCypmHung6wiz+VWorucyc=;
 b=HNMXQ2GCdL/YaQPd6U+wYuIRW5tXjgCiJJE7L1WAnUK7vvSvBBbvVHyITG+ZjfEVJrs34S
 RMyUjviFHh9g1NIYmC0v/VZzJuV5rCQn3yrGELrTmBpTsTgJQm9NSrI0rA/C/++M0fozZU
 wf+147HTK1pyx5h9nlmxiiouLa2oKMw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-sc4kdDmiP8qUxaVMw8S9SA-1; Wed, 22 Sep 2021 12:20:18 -0400
X-MC-Unique: sc4kdDmiP8qUxaVMw8S9SA-1
Received: by mail-qv1-f70.google.com with SMTP id
 z6-20020a056214060600b0037a3f6bd9abso13393747qvw.3
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 09:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IIEoX8C4rt317Lbcem8lIPCypmHung6wiz+VWorucyc=;
 b=dsU5wYqGV7NvEGfVYZRImeO1yrwoXe80YeKmwdPRQZ334Kt9YHrfunxQzR4rIKwIz0
 0ooarCkippMokoPkfnVTjm2AEQF1X6hERG1HkPUrm3zKTARFNpAp0C5n4ItUW/SArrSL
 XkVT9eyYsY3YurXm3A1iW8zRqwhix1F/7j2cPKu1DF8YluytEiHIKCFdY4gqVtnklznX
 Mfb9GzjU9GNmJ3kCtfVd5d5UN/zsS3wtxj70UpsbizgtEd/r7qcWumn6xWAW320GboP/
 7gUkiv5RJ0VmJsGAR6jWl33mGpg4WT5BKTAtUtjdhjpVNF/VAiksKWWWnE0a4ViX9R77
 XJVQ==
X-Gm-Message-State: AOAM533lmR8YCzGKHcknLjAffBNFnSbacY673V6GhRC7rILomw++BX67
 oovaWqsciwdlVflEeomIY1m7y7zunoRNtKswvAMQb631sCuhCkqRgXJO0cBrXs2Tyv68OeZqlC5
 vS7juSmjMIsvKpqqSDnJjQH1eLyNty+P0v7OyaBtAu36cuwnE/0mcvCGzv1OEAYKq
X-Received: by 2002:a05:620a:5b4:: with SMTP id q20mr97795qkq.8.1632327617728; 
 Wed, 22 Sep 2021 09:20:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcy8gWGB60XeOjHC6FqjGTdZrcAt47ht9t1JBbLi+miTbfabG5DeGU71CmTxwR7/prXq/2oQ==
X-Received: by 2002:a05:620a:5b4:: with SMTP id q20mr97755qkq.8.1632327617404; 
 Wed, 22 Sep 2021 09:20:17 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id z186sm2094811qke.59.2021.09.22.09.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 09:20:16 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] dump-guest-memory: Block live migration
Date: Wed, 22 Sep 2021 12:20:09 -0400
Message-Id: <20210922162009.125622-4-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922162009.125622-1-peterx@redhat.com>
References: <20210922162009.125622-1-peterx@redhat.com>
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
 dump/dump.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/dump/dump.c b/dump/dump.c
index ab625909f3..662d0a62cd 100644
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
@@ -2005,6 +2009,21 @@ void qmp_dump_guest_memory(bool paging, const char *file,
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



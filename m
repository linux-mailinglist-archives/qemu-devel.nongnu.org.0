Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E196669188A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:33:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQMx6-00056t-TS; Fri, 10 Feb 2023 01:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1pQMx4-00056Y-8c
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:32:06 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1pQMx2-0007g5-C4
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:32:05 -0500
Received: by mail-oi1-x22d.google.com with SMTP id n132so3684081oih.7
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 22:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2OC0+N8bmkMf5K9Lhs0x8cPe/2V5a2HvI4ivvTW8fNQ=;
 b=n597P01IaHyqihMvnik1HEsUlM0SUZbZm8N5pEs0Bk7U/VHMpZB2qtSjH0EAyTKS85
 aQbytKjU5a9dFfdhSwR64BF6822y5foMLJaE/TbKNYSWh5FbYNg1u0xokn7pZvXKG66X
 LhyZteZTEtosdjGN9rQ0WSrOGpF4ierSUGbZZBYcuzc0uMd58xx0oGWrapfbUBFocAzI
 nkDiJXMTjEQ+DkWKODx9QIkkN9AxM4PFEHrReNIISNrixUXWH4CdZ2G0AS4JSreK3a/p
 hmKeIu0vCLkHaTQDgzZuTf5kO9L+/KvwaZpgSfzmkvCqRrTIVLnz18mJYRmlJLZ25d11
 T1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2OC0+N8bmkMf5K9Lhs0x8cPe/2V5a2HvI4ivvTW8fNQ=;
 b=nnn5goKlg0jPntMmZUFrSHK56/4sI/nAJxm6N37h7qArz4ln8gd0jw1AkvktMH0/su
 bKpG2Hz/o9X6XB9Em0JjaDinI/CX+0Wh/2NYnHE46SGW/ApI37D8tTe995OeGgwQStfO
 iab03tdAXvLB31TQ5R1nQmKTMmfg+pP19i+i/VOvPSW80g6GcN7+DuhHAoqq70dmF1zO
 +7t91GjIEjSm7ODHBpgs5PZYuzFWXSZokhdDXxdq9ux2++bV/u9Mt/VjUgl16eVw6gIj
 KtTZbY0rh75Dpf7GaIMIA6fkQFlwiFC6yo50kdBa6oW7jP0m1fNHcc3PC4g18oZr9cHi
 e4uQ==
X-Gm-Message-State: AO0yUKVYE1PrzeKqay95HLM+4iglHlxyqG9N63d1FMROILErY2305pRl
 cm/ZTDE93yq+P6oZVWbct3s=
X-Google-Smtp-Source: AK7set8xYPA4UEnWre4Tc1FzVOF+TO81RZetBAA2crW4cshUrFUDVVjy3QEJ6iAGpPgjmq8ELqbVmw==
X-Received: by 2002:a05:6808:3cf:b0:36e:bb55:d51a with SMTP id
 o15-20020a05680803cf00b0036ebb55d51amr6522550oie.52.1676010722617; 
 Thu, 09 Feb 2023 22:32:02 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a800:9aa9:fdcb:7dec:9680:8417])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a9d6a52000000b00688449397d3sm1686285otn.15.2023.02.09.22.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 22:32:02 -0800 (PST)
From: Leonardo Bras <leobras.c@gmail.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras.c@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 1/4] migration/multifd: Change multifd_load_cleanup()
 signature and usage
Date: Fri, 10 Feb 2023 03:31:42 -0300
Message-Id: <20230210063145.530952-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=leobras.c@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since it's introduction in commit f986c3d256 ("migration: Create multifd
migration threads"), multifd_load_cleanup() never returned any value
different than 0, neither set up any error on errp.

Even though, on process_incoming_migration_bh() an if clause uses it's
return value to decide on setting autostart = false, which will never
happen.

In order to simplify the codebase, change multifd_load_cleanup() signature
to 'void multifd_load_cleanup(void)', and for every usage remove error
handling or decision made based on return value != 0.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 migration/multifd.h   |  2 +-
 migration/migration.c | 14 ++++----------
 migration/multifd.c   |  6 ++----
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index ff3aa2e2e9..9a7e1a8826 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -16,7 +16,7 @@
 int multifd_save_setup(Error **errp);
 void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
-int multifd_load_cleanup(Error **errp);
+void multifd_load_cleanup(void);
 bool multifd_recv_all_channels_created(void);
 void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
diff --git a/migration/migration.c b/migration/migration.c
index 7a14aa98d8..ce962ea577 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -543,13 +543,7 @@ static void process_incoming_migration_bh(void *opaque)
      */
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
-    if (multifd_load_cleanup(&local_err) != 0) {
-        error_report_err(local_err);
-        autostart = false;
-    }
-    /* If global state section was not received or we are in running
-       state, we need to obey autostart. Any other state is set with
-       runstate_set. */
+    multifd_load_cleanup();
 
     dirty_bitmap_mig_before_vm_start();
 
@@ -649,9 +643,9 @@ fail:
     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
                       MIGRATION_STATUS_FAILED);
     qemu_fclose(mis->from_src_file);
-    if (multifd_load_cleanup(&local_err) != 0) {
-        error_report_err(local_err);
-    }
+
+    multifd_load_cleanup();
+
     exit(EXIT_FAILURE);
 }
 
diff --git a/migration/multifd.c b/migration/multifd.c
index b7ad7002e0..174726982c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1022,12 +1022,12 @@ static void multifd_recv_terminate_threads(Error *err)
     }
 }
 
-int multifd_load_cleanup(Error **errp)
+void multifd_load_cleanup(void)
 {
     int i;
 
     if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
-        return 0;
+        return;
     }
     multifd_recv_terminate_threads(NULL);
     for (i = 0; i < migrate_multifd_channels(); i++) {
@@ -1067,8 +1067,6 @@ int multifd_load_cleanup(Error **errp)
     multifd_recv_state->params = NULL;
     g_free(multifd_recv_state);
     multifd_recv_state = NULL;
-
-    return 0;
 }
 
 void multifd_recv_sync_main(void)
-- 
2.39.1



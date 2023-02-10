Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD8469188F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:37:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQN1f-00007E-K9; Fri, 10 Feb 2023 01:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pQN1b-000071-Qc
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:36:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pQN1Z-0008Oz-Ss
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676011004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SpJDOYOVmyUfceCLTAVLc5sGZEYkikb7PzS/WP4DK/k=;
 b=JNg1uoepBWjOQoqWh2vLUYa7T46DJpgoRgPr54qA/S3msgnmlAOWrJ8v4ZLC+/ECgdj7OH
 1frFSQHcNqwcItYTALHFQcQ1OKsfVo1lZOCW8Ru1XJdO0KVPX1Ju1Q3gBgA/T4lHu5NgPu
 /7+NarsGlQs1etu8oAR19V79LuhlYQk=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-SCRNLl1LNASQ48qI3_orqQ-1; Fri, 10 Feb 2023 01:36:43 -0500
X-MC-Unique: SCRNLl1LNASQ48qI3_orqQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 m47-20020a05683026ef00b0068bbc172013so1870081otu.12
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 22:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SpJDOYOVmyUfceCLTAVLc5sGZEYkikb7PzS/WP4DK/k=;
 b=DaroD4RalqKOpsnLOeVx5iuuozHbd2+GtZ2FcYGbqoQinrrrbES+NW+A4ApHIYzk3y
 JPs4CVxQGoB/Y4dYRpS4uR3OZYiOVPgfiIMS6dnApxbDpSBRdGtLupjNv2fznzfh1fjw
 M6nVdKhjlT6q6k6ECn0r+g+lORBpJ128mRGbz087BRxXpv25TN3d66s1WbaksCqwkaWB
 TSuQhPQ7sPjlo0+LEHvRDEKgJ1LAdHbzN0kjbuxsq6kYanBdv4F6hEIjq5v8dfk2+8Bu
 /s9cKOAuWSN0/Vp2Ch5SB/dW2XpHHrZl0H0mR3hoYyOKj2IHxkX9WKM3vGe4qeZ4P71D
 UxKA==
X-Gm-Message-State: AO0yUKW0Ncg1KnnmT+H6QKuCPws2PIUm9vQMF03hlZuB6Gk65sEzRRQC
 sVZjREt+xAnZ+FHgqMWpO8rEOaUp1I+uccQ7RSNVu+2xLXU9e+k7I5l0lF0Dn98k+o6j8bSwtJx
 4Gz0iPk+1Nn0i2bw=
X-Received: by 2002:a05:6808:aae:b0:360:d307:c23c with SMTP id
 r14-20020a0568080aae00b00360d307c23cmr813971oij.25.1676011002359; 
 Thu, 09 Feb 2023 22:36:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/w/NSnxFIdP+CC7xY29XV9x46Cb+b9haZbQuYmgwJiEB/MU6HdmTSn2EZyTOFbjZzyvUQVnw==
X-Received: by 2002:a05:6808:aae:b0:360:d307:c23c with SMTP id
 r14-20020a0568080aae00b00360d307c23cmr813963oij.25.1676011002000; 
 Thu, 09 Feb 2023 22:36:42 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a800:9aa9:fdcb:7dec:9680:8417])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05683018e800b00670679748f9sm1705285otf.49.2023.02.09.22.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 22:36:41 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 1/4] migration/multifd: Change multifd_load_cleanup()
 signature and usage
Date: Fri, 10 Feb 2023 03:36:28 -0300
Message-Id: <20230210063630.532185-1-leobras@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Leonardo Bras <leobras@redhat.com>
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



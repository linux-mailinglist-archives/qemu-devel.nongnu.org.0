Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B876223A2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 06:57:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ose51-0003Pt-HI; Wed, 09 Nov 2022 00:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1ose4z-0003Pk-Pd
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 00:56:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1ose4y-0006O0-D0
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 00:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667973411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SOKRnnXpp7vYyitg3Uc0RCgUFSMckDlufycZRj0bgmA=;
 b=AuFC2L99kPpOz7mx9HPz3ksRq9yyil+RpH+rChTRfF4VBWwQOVq0HZlYNFYGluY54LUi4d
 qx99QJLVY43JAbqHnBsCqz1gY/czDCQa6jvf+x2L6ZCHCXP22O6lQgMKz9qkBH/nChIRgJ
 bQWmcCeI/dcOO2PAq/6Bunlk9zjvkkU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-300-aGpT0a60N5a6l9zlJSd1EA-1; Wed, 09 Nov 2022 00:56:48 -0500
X-MC-Unique: aGpT0a60N5a6l9zlJSd1EA-1
Received: by mail-qk1-f200.google.com with SMTP id
 x2-20020a05620a448200b006fa7dad5c1cso13701731qkp.10
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 21:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SOKRnnXpp7vYyitg3Uc0RCgUFSMckDlufycZRj0bgmA=;
 b=rVb2avUoDAgd8ZWSS2+X+Jj4uXaNcPlUkr1KBAj74FwbqYrC0vA9i1TJA8KQ8wNI89
 vIezYI/7G/+K0EDp0p/APqLtC/qRqDFfCRdhgd27pgpXK5+8CF1Ineua1qGQHKendUuU
 mAsQskMz96kzp9PXdQl/IkNF02eMHPbdfFdW7N5PgSf3RmaEzd1u0iQYnnvehPiCaEOD
 FR5vDD7jTCqTk+Crxs5ebM2Vtp/pkT7RrN7OuE+ERsNqucd+AhnWo5Q962RlLItZSn4m
 a49Z72qNUctS8Uo4WTa1z4a1Pq4gs0mzyOZGNIrqsFq7PIkeH27SF3AzIsRpTTHYa6vY
 OZeQ==
X-Gm-Message-State: ACrzQf1zGQEl4Aw3bJFiC8bx6H0EqhdQpcMheAa6Fy3KqVPAoRjq7xCf
 8S21v1jep5LEe2W4fC3XKiNuGyQuSOB3W8jN/sNrpx17ZrK1AqBW1rkJAHXTEIC55zF+T+YoijQ
 RibrBoBFGXJ1cWUY=
X-Received: by 2002:ac8:7f48:0:b0:3a5:4234:8a18 with SMTP id
 g8-20020ac87f48000000b003a542348a18mr31544369qtk.340.1667973408492; 
 Tue, 08 Nov 2022 21:56:48 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7yssvBfAHn8sYcUSgW9qnCQgiJaRdmggoViEj9R7kuiNXIk2yKMvR4juluucMb4fBsTTA7BA==
X-Received: by 2002:ac8:7f48:0:b0:3a5:4234:8a18 with SMTP id
 g8-20020ac87f48000000b003a542348a18mr31544361qtk.340.1667973408263; 
 Tue, 08 Nov 2022 21:56:48 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a802:4b05:8a1d:4f87:5d1a:2c54])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05622a138900b003a582090530sm7900826qtk.83.2022.11.08.21.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 21:56:47 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Li Xiaohui <xiaohli@redhat.com>
Subject: [PATCH v1 1/1] migration: Fix yank on postcopy multifd crashing guest
 after migration
Date: Wed,  9 Nov 2022 02:56:29 -0300
Message-Id: <20221109055629.789795-1-leobras@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URG_BIZ=0.573 autolearn=no autolearn_force=no
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

When multifd and postcopy-ram capabilities are enabled, if a
migrate-start-postcopy is attempted, the migration will finish sending the
memory pages and then crash with the following error:

qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance: Assertion
`QLIST_EMPTY(&entry->yankfns)' failed.

This happens because even though all multifd channels could
yank_register_function(), none of them could unregister it before
unregistering the MIGRATION_YANK_INSTANCE, causing the assert to fail.

Fix that by calling multifd_load_cleanup() on postcopy_ram_listen_thread()
before MIGRATION_YANK_INSTANCE is unregistered.

Fixes: b5eea99ec2 ("migration: Add yank feature")
Reported-by: Li Xiaohui <xiaohli@redhat.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/migration.h |  1 +
 migration/migration.c | 18 +++++++++++++-----
 migration/savevm.c    |  2 ++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index cdad8aceaa..240f64efb0 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -473,6 +473,7 @@ void migration_make_urgent_request(void);
 void migration_consume_urgent_request(void);
 bool migration_rate_limit(void);
 void migration_cancel(const Error *error);
+bool migration_load_cleanup(void);
 
 void populate_vfio_info(MigrationInfo *info);
 void postcopy_temp_page_reset(PostcopyTmpPage *tmp_page);
diff --git a/migration/migration.c b/migration/migration.c
index 739bb683f3..4f363b2a95 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -486,6 +486,17 @@ void migrate_add_address(SocketAddress *address)
                       QAPI_CLONE(SocketAddress, address));
 }
 
+bool migration_load_cleanup(void)
+{
+    Error *local_err = NULL;
+
+    if (multifd_load_cleanup(&local_err)) {
+        error_report_err(local_err);
+        return true;
+    }
+    return false;
+}
+
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
@@ -540,8 +551,7 @@ static void process_incoming_migration_bh(void *opaque)
      */
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
-    if (multifd_load_cleanup(&local_err) != 0) {
-        error_report_err(local_err);
+    if (migration_load_cleanup()) {
         autostart = false;
     }
     /* If global state section was not received or we are in running
@@ -646,9 +656,7 @@ fail:
     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
                       MIGRATION_STATUS_FAILED);
     qemu_fclose(mis->from_src_file);
-    if (multifd_load_cleanup(&local_err) != 0) {
-        error_report_err(local_err);
-    }
+    migration_load_cleanup();
     exit(EXIT_FAILURE);
 }
 
diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..250caff7f4 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1889,6 +1889,8 @@ static void *postcopy_ram_listen_thread(void *opaque)
         exit(EXIT_FAILURE);
     }
 
+    migration_load_cleanup();
+
     migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
                                    MIGRATION_STATUS_COMPLETED);
     /*
-- 
2.38.1



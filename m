Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5103D065B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 03:23:07 +0200 (CEST)
Received: from localhost ([::1]:45904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m60x0-0005Mk-GD
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 21:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m60vg-0003Wp-Gm
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m60vd-0003vx-Jw
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626830501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UvhtafGD3Ymn3C3W4dMKfrisCtiTD2OdOUpBlGB1+zw=;
 b=hG+RMHTIruBcMKCUfGj7YTy5MAkvr2jVRBHpK9fWGQK/BVYNQpY8I1WORLZ8TfCas6zmMy
 P1yF6bt5piWITJLCaBiJ4jQKx+T6Tp91mtUPaylm3NoRqUiHBwPG2i9LcacJxtDdWAd6aj
 FwARLI/AAeuzDEbsod/hBjvTJqY9M68=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-RSxdPLgSMru4WBcBFWk85w-1; Tue, 20 Jul 2021 21:21:40 -0400
X-MC-Unique: RSxdPLgSMru4WBcBFWk85w-1
Received: by mail-qv1-f69.google.com with SMTP id
 t7-20020a0562140c67b02902f36ca6afdcso374151qvj.7
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 18:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UvhtafGD3Ymn3C3W4dMKfrisCtiTD2OdOUpBlGB1+zw=;
 b=ASnGtDknTW8BMe2NOvDLhFRXjJjpzDSNRJylxULPXySkg4D2EYMyjljsSxIb/8uwQN
 fxRWc9cwv8NvhI/cVRJEVTVrW6qxcuOQv/6ogJiXhPRIVcQ9XhYZELE1fT+9mLsD4wxH
 ANz7RV/hXAeuYIHiWWZiVx02Gm8PN/GqzTjkkkwjtUaWUxgM6sGAJ2sbnIYwS+voy+4c
 86xRDDCi5SG76gKV0eagL3UtlTyJkYWhn8yNmjXhvRGTY6mhbhoSe08ExlF09qaMv2j1
 9M3NAfYwg69WlSGpiIBknw8nFkllxxoavMvH6PE6w4EhwwN+OQ25PsbDQuuV72lULpK3
 R26g==
X-Gm-Message-State: AOAM531gsAHxLOJ/TX7MUrzBZ425GzmFPNnIYwlJJXEIdwJVB/QiKtTQ
 An3c2KL9A0pr4oycgZifd3yUzuWMX4QGPoe88NQiQD6w3SyOvS0gR2GJzIadne+Kn3SzosYLDDv
 wYFQTBHFfYS8OnDNnKoM9/jYR4BQoEwzXhqG3hHTWZ9I2nuahBTPPtStrscnsaBtx
X-Received: by 2002:a05:620a:235:: with SMTP id
 u21mr32895725qkm.450.1626830499227; 
 Tue, 20 Jul 2021 18:21:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGRfCO2RXNla7RBoELv9fjFD50visuXoO5b+iQcSAP0q6S/4ZNqaDbtQhnNbvHHqudv/NRcQ==
X-Received: by 2002:a05:620a:235:: with SMTP id
 u21mr32895701qkm.450.1626830498952; 
 Tue, 20 Jul 2021 18:21:38 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id t26sm8399469qtc.44.2021.07.20.18.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 18:21:38 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] migration: Fix missing join() of rp_thread
Date: Tue, 20 Jul 2021 21:21:30 -0400
Message-Id: <20210721012134.792845-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721012134.792845-1-peterx@redhat.com>
References: <20210721012134.792845-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
 Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's possible that the migration thread skip the join() of the rp_thread in
below race and crash on src right at finishing migration:

       migration_thread                     rp_thread
       ----------------                     ---------
    migration_completion()
                                        (before rp_thread quits)
                                        from_dst_file=NULL
                                        [thread got scheduled out]
      s->rp_state.from_dst_file==NULL
        (skip join() of rp_thread)
    migrate_fd_cleanup()
      qemu_fclose(s->to_dst_file)
      yank_unregister_instance()
        assert(yank_find_entry())  <------- crash

It could mostly happen with postcopy, but that shouldn't be required, e.g., I
think it could also trigger with MIGRATION_CAPABILITY_RETURN_PATH set.

It's suspected that above race could be the root cause of a recent (but rare)
migration-test break reported by either Dave or PMM:

https://lore.kernel.org/qemu-devel/YPamXAHwan%2FPPXLf@work-vm/

The issue is: from_dst_file is reset in the rp_thread, so if the thread reset
it to NULL fast enough then the migration thread will assume there's no
rp_thread at all.

This could potentially cause more severe issue (e.g. crash) after the yank code.

Fix it by using a boolean to keep "whether we've created rp_thread".

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 4 +++-
 migration/migration.h | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2d306582eb..21b94f75a3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2867,6 +2867,7 @@ static int open_return_path_on_source(MigrationState *ms,
 
     qemu_thread_create(&ms->rp_state.rp_thread, "return path",
                        source_return_path_thread, ms, QEMU_THREAD_JOINABLE);
+    ms->rp_state.rp_thread_created = true;
 
     trace_open_return_path_on_source_continue();
 
@@ -2891,6 +2892,7 @@ static int await_return_path_close_on_source(MigrationState *ms)
     }
     trace_await_return_path_close_on_source_joining();
     qemu_thread_join(&ms->rp_state.rp_thread);
+    ms->rp_state.rp_thread_created = false;
     trace_await_return_path_close_on_source_close();
     return ms->rp_state.error;
 }
@@ -3170,7 +3172,7 @@ static void migration_completion(MigrationState *s)
      * it will wait for the destination to send it's status in
      * a SHUT command).
      */
-    if (s->rp_state.from_dst_file) {
+    if (s->rp_state.rp_thread_created) {
         int rp_error;
         trace_migration_return_path_end_before();
         rp_error = await_return_path_close_on_source(s);
diff --git a/migration/migration.h b/migration/migration.h
index 2ebb740dfa..c302879fad 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -195,6 +195,13 @@ struct MigrationState {
         QEMUFile     *from_dst_file;
         QemuThread    rp_thread;
         bool          error;
+        /*
+         * We can also check non-zero of rp_thread, but there's no "official"
+         * way to do this, so this bool makes it slightly more elegant.
+         * Checking from_dst_file for this is racy because from_dst_file will
+         * be cleared in the rp_thread!
+         */
+        bool          rp_thread_created;
         QemuSemaphore rp_sem;
     } rp_state;
 
-- 
2.31.1



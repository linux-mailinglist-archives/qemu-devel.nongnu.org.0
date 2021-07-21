Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88D3D1726
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 21:36:10 +0200 (CEST)
Received: from localhost ([::1]:42152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6I0n-0002ry-UU
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 15:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6Hz2-0000fv-9w
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:34:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6Hyz-00050o-Gt
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626896056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psIdSZ42TG6zIOWJSN4HC5NZuEOzx+F89j4lZhOXZEk=;
 b=ixkhQ0WPmyfSs6oTtdVP9j8KZxG8pHqLg4Wp5VZdF1Nz3GjYKwGW9/iMlselX36sW4kRsP
 a3iqVuah0dbSwFVgKUvIMMnBcvZ7tBntESTC0pMTWnmNMBpNr+l6mg5mEiqZIeIcuxOzvI
 wbhS2ZH2Vhhe0db1tEKV9Q6sTF3gZoU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-NUyE21bGPHyucKk8u_g2hQ-1; Wed, 21 Jul 2021 15:34:15 -0400
X-MC-Unique: NUyE21bGPHyucKk8u_g2hQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 k12-20020a05620a414cb02903b9ade0af31so1812401qko.1
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 12:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=psIdSZ42TG6zIOWJSN4HC5NZuEOzx+F89j4lZhOXZEk=;
 b=keb7ihhYRVqp4OSPpB76QC22hBJBSD4pA7f4AEiq7GJ6+sTyXMjShfUUlGH1DpHm/F
 IgFGHm54Bf9YQfN3uTP4NYJT2FQ4m9hH+D5YXZDABys/dLaghfjdIfyADT3ZkCXlH3bS
 73CRPxC0erZvnRG5wZZSJfXO4cGTP/9VqvP/h05XfTg0NEPPcWSxkfHPBdSndkoGwDaW
 +ZJRQ7US36UZ7Coiwd+sAGOoqHnOSMfI4zOofdsmQxNXNGSvxUdC1G/RetwD8nxxqrpI
 h0Pux4nSjCiUfEFFanAoEOUxLztVOuHkHu4LY1O/8t5YkMr/kI7QlMzRfmE6leEGvMKF
 Ty4g==
X-Gm-Message-State: AOAM530vuRAzheYiW1s3QUb9SgbMD3UNxJut7V5e6XKlH9qSAOZBWEbk
 90QLs0X1csWuntq4CiX0GGoNUZlqibQPFK20s3e4YmddMxvkJw7zZFfxOKhr+m2q6MGd02OxXWd
 jaBOEe1qrwJTepxKWTLIOwpy7TDjj69oEqlm0oTd1J5edrKyb3cE2XE+O42xzNcoE
X-Received: by 2002:ac8:5a12:: with SMTP id n18mr21026744qta.3.1626896054956; 
 Wed, 21 Jul 2021 12:34:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsFAXPZSXNucehq1+QhFIKFJXNu7np77gCAiCKCpnum1qyh/SE2Qb+7ETKyuhu+/PhkpDINg==
X-Received: by 2002:ac8:5a12:: with SMTP id n18mr21026717qta.3.1626896054614; 
 Wed, 21 Jul 2021 12:34:14 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id 8sm10755867qkb.105.2021.07.21.12.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 12:34:13 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] migration: Fix missing join() of rp_thread
Date: Wed, 21 Jul 2021 15:34:05 -0400
Message-Id: <20210721193409.910462-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721193409.910462-1-peterx@redhat.com>
References: <20210721193409.910462-1-peterx@redhat.com>
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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



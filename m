Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0489850A77D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:53:48 +0200 (CEST)
Received: from localhost ([::1]:51754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhazz-0000v1-2W
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZri-0007o6-FD
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:41:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrg-00034t-Pc
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650559268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i4y/sV/7WxjmCNVfQLhpWy52ZVfRQdZ+hhZSK4X9lOQ=;
 b=KfqTLybi/MajNOyqP4+R2yKhDNboQs3W31teiC71AyqtJXUONZAxJ2jngzLCb3Pc21ZaMx
 grGKLmsLiNYwZ+CpttSvDF9hdfI3H3a5273dhB33ZviJTLrOYKM8MLGHtmN+Ts5tzYpMzz
 g7/9XhC8ZcZrXOLG6P9QGDCo3ZyvsnA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-fV1FEfzyNm6GO5EkL2k_1Q-1; Thu, 21 Apr 2022 12:41:06 -0400
X-MC-Unique: fV1FEfzyNm6GO5EkL2k_1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CCD680A0AD
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 16:41:06 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B705B40D016E;
 Thu, 21 Apr 2022 16:41:05 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 16/18] migration: Allow migrate-recover to run multiple times
Date: Thu, 21 Apr 2022 17:40:41 +0100
Message-Id: <20220421164043.209703-17-dgilbert@redhat.com>
In-Reply-To: <20220421164043.209703-1-dgilbert@redhat.com>
References: <20220421164043.209703-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Previously migration didn't have an easy way to cleanup the listening
transport, migrate recovery only allows to execute once.  That's done with a
trick flag in postcopy_recover_triggered.

Now the facility is already there.

Drop postcopy_recover_triggered and instead allows a new migrate-recover to
release the previous listener transport.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220331150857.74406-8-peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 13 ++-----------
 migration/migration.h |  1 -
 migration/savevm.c    |  3 ---
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 1405b95b95..03ae53074b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2164,11 +2164,8 @@ void qmp_migrate_recover(const char *uri, Error **errp)
         return;
     }
 
-    if (qatomic_cmpxchg(&mis->postcopy_recover_triggered,
-                       false, true) == true) {
-        error_setg(errp, "Migrate recovery is triggered already");
-        return;
-    }
+    /* If there's an existing transport, release it */
+    migration_incoming_transport_cleanup(mis);
 
     /*
      * Note that this call will never start a real migration; it will
@@ -2176,12 +2173,6 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * to continue using that newly established channel.
      */
     qemu_start_incoming_migration(uri, errp);
-
-    /* Safe to dereference with the assert above */
-    if (*errp) {
-        /* Reset the flag so user could still retry */
-        qatomic_set(&mis->postcopy_recover_triggered, false);
-    }
 }
 
 void qmp_migrate_pause(Error **errp)
diff --git a/migration/migration.h b/migration/migration.h
index f17ccc657c..a863032b71 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -139,7 +139,6 @@ struct MigrationIncomingState {
     struct PostcopyBlocktimeContext *blocktime_ctx;
 
     /* notify PAUSED postcopy incoming migrations to try to continue */
-    bool postcopy_recover_triggered;
     QemuSemaphore postcopy_pause_sem_dst;
     QemuSemaphore postcopy_pause_sem_fault;
 
diff --git a/migration/savevm.c b/migration/savevm.c
index 02ed94c180..d9076897b8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2589,9 +2589,6 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
 
     assert(migrate_postcopy_ram());
 
-    /* Clear the triggered bit to allow one recovery */
-    mis->postcopy_recover_triggered = false;
-
     /*
      * Unregister yank with either from/to src would work, since ioc behind it
      * is the same
-- 
2.35.1



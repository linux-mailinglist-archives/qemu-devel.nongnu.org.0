Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1276FE3AB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:11:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwoGP-0002XX-5I; Wed, 10 May 2023 14:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwoGM-0002WV-Tz
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:10:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwoGL-0000wu-Ck
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683742204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FkzGd1Bvpoh/DyCWKI9fX6OxDfMq7Vk1oY8YoTcNE1c=;
 b=NohvCyTpXLdKccU97fTDihtUFAKnTDCCdcOfPXVvKUDJfliM99ruiknt+9K4SiA6yiPNEZ
 h26cV8IT26G3lAFjARTkbEsTnzo6qZ2TNQUkhTyCkRam8FWISHJ8mViiZtoEt7y9CpEGmU
 7jw/u930f7TH2HToKL7oLE3yfY9FbGk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-6ITXXNBkMhqi7aZNAktuqQ-1; Wed, 10 May 2023 14:10:03 -0400
X-MC-Unique: 6ITXXNBkMhqi7aZNAktuqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACC00185A7A2;
 Wed, 10 May 2023 18:10:02 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 392E614171BC;
 Wed, 10 May 2023 18:10:00 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 qemu-block@nongnu.org, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Zhang Chen <chen.zhang@intel.com>
Subject: [PULL 07/10] migration: drop colo_incoming_thread from
 MigrationIncomingState
Date: Wed, 10 May 2023 20:09:35 +0200
Message-Id: <20230510180938.6338-8-quintela@redhat.com>
In-Reply-To: <20230510180938.6338-1-quintela@redhat.com>
References: <20230510180938.6338-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

have_colo_incoming_thread variable is unused. colo_incoming_thread can
be local.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Message-Id: <20230428194928.1426370-6-vsementsov@yandex-team.ru>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h | 2 --
 migration/migration.c | 7 ++++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 3a918514e7..7721c7658b 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -162,8 +162,6 @@ struct MigrationIncomingState {
 
     int state;
 
-    bool have_colo_incoming_thread;
-    QemuThread colo_incoming_thread;
     /* The coroutine we should enter (back) after failover */
     Coroutine *migration_incoming_co;
     QemuSemaphore colo_incoming_sem;
diff --git a/migration/migration.c b/migration/migration.c
index 61b316245d..c7f628caa6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -544,6 +544,8 @@ process_incoming_migration_co(void *opaque)
 
     /* we get COLO info, and know if we are in COLO mode */
     if (!ret && migration_incoming_colo_enabled()) {
+        QemuThread colo_incoming_thread;
+
         /* Make sure all file formats throw away their mutable metadata */
         bdrv_activate_all(&local_err);
         if (local_err) {
@@ -551,14 +553,13 @@ process_incoming_migration_co(void *opaque)
             goto fail;
         }
 
-        qemu_thread_create(&mis->colo_incoming_thread, "COLO incoming",
+        qemu_thread_create(&colo_incoming_thread, "COLO incoming",
              colo_process_incoming_thread, mis, QEMU_THREAD_JOINABLE);
-        mis->have_colo_incoming_thread = true;
         qemu_coroutine_yield();
 
         qemu_mutex_unlock_iothread();
         /* Wait checkpoint incoming thread exit before free resource */
-        qemu_thread_join(&mis->colo_incoming_thread);
+        qemu_thread_join(&colo_incoming_thread);
         qemu_mutex_lock_iothread();
         /* We hold the global iothread lock, so it is safe here */
         colo_release_ram_cache();
-- 
2.40.1



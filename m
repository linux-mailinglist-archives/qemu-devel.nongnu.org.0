Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6192C6FCE68
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 21:18:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSqQ-0004AC-78; Tue, 09 May 2023 15:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSqO-00048F-0X
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSqM-0006aH-GP
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683659869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMwqFrekBrHNVs7iPH8fTanv0PAFiGUUYVML+ojz91k=;
 b=JFsepuQkQFI2+STbSKctNZSOfbB3WDKB6kTgDNR56qsBQVCCf6sFmii9P0WyfW7Ej3pcKB
 3z4Ts/2yKXWQTaWDJ22s9Ksj/IMuD5K4fW8TrIlSIv8PHsEb1WX1WblNGOBC8SoGi1DVDL
 gpFm4wuOhWx5QR5mAUtznsM04/+CCdQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-_hu-Jl1dNkOtJnawOcz5Tg-1; Tue, 09 May 2023 15:17:46 -0400
X-MC-Unique: _hu-Jl1dNkOtJnawOcz5Tg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCD0F1C09A40;
 Tue,  9 May 2023 19:17:45 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E65E63F84;
 Tue,  9 May 2023 19:17:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Leonardo Bras <leobras@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Zhang Chen <chen.zhang@intel.com>
Subject: [PULL 07/10] migration: drop colo_incoming_thread from
 MigrationIncomingState
Date: Tue,  9 May 2023 21:17:21 +0200
Message-Id: <20230509191724.86159-8-quintela@redhat.com>
In-Reply-To: <20230509191724.86159-1-quintela@redhat.com>
References: <20230509191724.86159-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 migration/migration.c | 7 ++++---
 migration/migration.h | 2 --
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 01ee92e699..3ab3b1c3e6 100644
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
-- 
2.40.0



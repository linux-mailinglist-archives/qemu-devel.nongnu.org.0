Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B05E6A870A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:42:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlur-0001ly-3D; Thu, 02 Mar 2023 11:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlu6-0000jQ-Dw
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltz-00089f-3i
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNO5JPVXQVsOJKTImGsW6K0gJUshCvfuJpxAhcKoniU=;
 b=MJcgseQO8+MJB5WJMBtFoUfOw1xlhuUsYoGFMa0AP/Prdw8dV+DEZGh9gNhaEUe+5CiK8E
 h5VNeAZhrv/D/WNFq/dmr6XGlMJ9NR7HAEBOeFysOfTEYHemBd+CMNCyqzTmA137ZgYTpJ
 tQH4ahbzmHFoS/hAIRdl4cfJmzvRbDE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-UKy7z9oMOXag1pdR5l11Gg-1; Thu, 02 Mar 2023 11:35:17 -0500
X-MC-Unique: UKy7z9oMOXag1pdR5l11Gg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0CA51C3D380;
 Thu,  2 Mar 2023 16:35:16 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED409492C3E;
 Thu,  2 Mar 2023 16:35:14 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 22/43] migration: Create migrate_checkpoint_delay()
Date: Thu,  2 Mar 2023 17:33:49 +0100
Message-Id: <20230302163410.11399-23-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.h | 1 +
 migration/colo.c    | 5 ++---
 migration/options.c | 9 +++++++++
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index c9955e87f8..ccdeebfee7 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -48,6 +48,7 @@ bool migrate_cap_set(int cap, bool value, Error **errp);
 /* parameters */
 
 bool migrate_block_incremental(void);
+uint32_t migrate_checkpoint_delay(void);
 int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
diff --git a/migration/colo.c b/migration/colo.c
index 93b78c9270..07bfa21fea 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -576,7 +576,7 @@ static void colo_process_checkpoint(MigrationState *s)
     trace_colo_vm_state_change("stop", "run");
 
     timer_mod(s->colo_delay_timer, qemu_clock_get_ms(QEMU_CLOCK_HOST) +
-              s->parameters.x_checkpoint_delay);
+              migrate_checkpoint_delay());
 
     while (s->state == MIGRATION_STATUS_COLO) {
         if (failover_get_state() != FAILOVER_STATUS_NONE) {
@@ -651,8 +651,7 @@ void colo_checkpoint_notify(void *opaque)
 
     qemu_event_set(&s->colo_checkpoint_event);
     s->colo_checkpoint_time = qemu_clock_get_ms(QEMU_CLOCK_HOST);
-    next_notify_time = s->colo_checkpoint_time +
-                    s->parameters.x_checkpoint_delay;
+    next_notify_time = s->colo_checkpoint_time + migrate_checkpoint_delay();
     timer_mod(s->colo_delay_timer, next_notify_time);
 }
 
diff --git a/migration/options.c b/migration/options.c
index 50d982673c..0dbc4bdea8 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -474,6 +474,15 @@ bool migrate_block_incremental(void)
     return s->parameters.block_incremental;
 }
 
+uint32_t migrate_checkpoint_delay(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.x_checkpoint_delay;
+}
+
 int migrate_compress_level(void)
 {
     MigrationState *s;
-- 
2.39.2



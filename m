Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73136ECF47
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:39:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwG1-0008U2-SN; Mon, 24 Apr 2023 09:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFZ-0007PM-0b
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:29:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFT-0001XM-G7
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682342926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BW2cEofA38FvKkbq7h7UpdhmSKQ87+6bcNHyn8dKC0=;
 b=dgeZ0jYuVLqcVn/ERB//Q8czleQvC2rUxOtwe8tncnQ1L5G40JNz1CTTJq7LuDKnjVUSHa
 UpBZh0AgySUA0Tjdp+qzLRp8ZLiSDH9SZbPMHbq3dlL0F11DPY5bvxpUK44OXZtno+/mwf
 h1H4euiEsd6ZYo4t5A5SUj/FLWzWCBs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-mbwHkHWWPWuatBNRtRtMxA-1; Mon, 24 Apr 2023 09:28:43 -0400
X-MC-Unique: mbwHkHWWPWuatBNRtRtMxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C72A02A5957D;
 Mon, 24 Apr 2023 13:28:42 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3195914171B8;
 Mon, 24 Apr 2023 13:28:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: [PULL 23/30] migration: Create migrate_checkpoint_delay()
Date: Mon, 24 Apr 2023 15:27:23 +0200
Message-Id: <20230424132730.70752-24-quintela@redhat.com>
In-Reply-To: <20230424132730.70752-1-quintela@redhat.com>
References: <20230424132730.70752-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
---
 migration/colo.c    | 5 ++---
 migration/options.c | 9 +++++++++
 migration/options.h | 1 +
 3 files changed, 12 insertions(+), 3 deletions(-)

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
index b9f3815f7e..0e102e5700 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -472,6 +472,15 @@ bool migrate_block_incremental(void)
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
diff --git a/migration/options.h b/migration/options.h
index aa54443353..adc2879bbb 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -46,6 +46,7 @@ bool migrate_cap_set(int cap, bool value, Error **errp);
 /* parameters */
 
 bool migrate_block_incremental(void);
+uint32_t migrate_checkpoint_delay(void);
 int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
-- 
2.39.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DED86F6A40
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:40:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXId-000632-Fn; Thu, 04 May 2023 07:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXIa-00061X-Q5
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:39:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXIY-0003M2-Li
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683200338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNYP6gXWN4YEF8JQ67vf370brW7bveMPnAZ0ezFyvfE=;
 b=A300OfMHdwUr79jh9dScq3z9z1mKLrIdZOptiCTltQVlByyUp/vZiLRmqwhc+LM61aBLOU
 DTXaIJ8vK0PX1JIvWEe6OpxuSwP9wyZ5sqoHPRVHv7wxHZP3/wsAGcuYdlovHvDLrLHTXK
 TeLROLr6MHq8U8CDiWshMN4IA4XKLts=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-t5uH05mPPrOTWSbUkZLvZQ-1; Thu, 04 May 2023 07:38:48 -0400
X-MC-Unique: t5uH05mPPrOTWSbUkZLvZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A9EA800B35;
 Thu,  4 May 2023 11:38:48 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A1DB2166B32;
 Thu,  4 May 2023 11:38:47 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 3/9] qemu-file: make qemu_file_[sg]et_rate_limit() use an
 uint64_t
Date: Thu,  4 May 2023 13:38:35 +0200
Message-Id: <20230504113841.23130-4-quintela@redhat.com>
In-Reply-To: <20230504113841.23130-1-quintela@redhat.com>
References: <20230504113841.23130-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It is really size_t.  Everything else uses uint64_t, so move this to
uint64_t as well.  A size can't be negative anyways.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 6 +++---
 migration/qemu-file.c | 8 ++++----
 migration/qemu-file.h | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 232e387109..ee75c6cfbd 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2119,7 +2119,7 @@ static int postcopy_start(MigrationState *ms)
      */
     /* 0 max-postcopy-bandwidth means unlimited */
     if (!bandwidth) {
-        qemu_file_set_rate_limit(ms->to_dst_file, INT64_MAX);
+        qemu_file_set_rate_limit(ms->to_dst_file, UINT64_MAX);
     } else {
         qemu_file_set_rate_limit(ms->to_dst_file, bandwidth / XFER_LIMIT_RATIO);
     }
@@ -2301,7 +2301,7 @@ static void migration_completion(MigrationState *s)
             }
             if (ret >= 0) {
                 s->block_inactive = !migrate_colo();
-                qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
+                qemu_file_set_rate_limit(s->to_dst_file, UINT64_MAX);
                 ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
                                                          s->block_inactive);
             }
@@ -3049,7 +3049,7 @@ static void *bg_migration_thread(void *opaque)
     rcu_register_thread();
     object_ref(OBJECT(s));
 
-    qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
+    qemu_file_set_rate_limit(s->to_dst_file, UINT64_MAX);
 
     setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     /*
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index ee04240a21..b322b363cf 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -43,7 +43,7 @@ struct QEMUFile {
      * Maximum amount of data in bytes to transfer during one
      * rate limiting time window
      */
-    int64_t rate_limit_max;
+    uint64_t rate_limit_max;
     /*
      * Total amount of data in bytes queued for transfer
      * during this rate limiting time window
@@ -748,18 +748,18 @@ int qemu_file_rate_limit(QEMUFile *f)
     if (qemu_file_get_error(f)) {
         return 1;
     }
-    if (f->rate_limit_max > 0 && f->rate_limit_used > f->rate_limit_max) {
+    if (f->rate_limit_used > f->rate_limit_max) {
         return 1;
     }
     return 0;
 }
 
-int64_t qemu_file_get_rate_limit(QEMUFile *f)
+uint64_t qemu_file_get_rate_limit(QEMUFile *f)
 {
     return f->rate_limit_max;
 }
 
-void qemu_file_set_rate_limit(QEMUFile *f, int64_t limit)
+void qemu_file_set_rate_limit(QEMUFile *f, uint64_t limit)
 {
     f->rate_limit_max = limit;
 }
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index d16cd50448..9e158c00f6 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -138,8 +138,8 @@ void qemu_file_reset_rate_limit(QEMUFile *f);
  * need to be applied to the rate limiting calcuations
  */
 void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len);
-void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
-int64_t qemu_file_get_rate_limit(QEMUFile *f);
+void qemu_file_set_rate_limit(QEMUFile *f, uint64_t new_rate);
+uint64_t qemu_file_get_rate_limit(QEMUFile *f);
 int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
 int qemu_file_get_error_obj_any(QEMUFile *f1, QEMUFile *f2, Error **errp);
 void qemu_file_set_error_obj(QEMUFile *f, int ret, Error *err);
-- 
2.40.0



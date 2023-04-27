Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4216F0834
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:26:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3VI-0003LP-9P; Thu, 27 Apr 2023 11:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3Uc-00035W-U8
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:25:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3UZ-0000YX-Kn
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682609107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VDeqWFKzV0z60L2xcqjGeWejmqVFcssqvM/1sNGP7DI=;
 b=ShekHSHHY6BuArswtJFApticob3vkHSPzs84CIv75Bzufgz3uXI7I5n6j7lYg+P8sSR5kw
 filPY3Jtr0hNuPT74ROLG0YIM9d1+ga1s+A+sUdh7QRIFAbkuLgIdGvViWImZYk73tp4ym
 DKzBiIVtmI5Uzz5MdFxdXCXiHsfZqQY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-3zV7MOE6NlCc2i3wm3SQZA-1; Thu, 27 Apr 2023 11:24:54 -0400
X-MC-Unique: 3zV7MOE6NlCc2i3wm3SQZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A2DE8A5B62;
 Thu, 27 Apr 2023 15:23:30 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D43B540C2064;
 Thu, 27 Apr 2023 15:23:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, John Snow <jsnow@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 17/18] migration: Make dirty_pages_rate atomic
Date: Thu, 27 Apr 2023 17:22:33 +0200
Message-Id: <20230427152234.25400-18-quintela@redhat.com>
In-Reply-To: <20230427152234.25400-1-quintela@redhat.com>
References: <20230427152234.25400-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>

---

Don't use __nocheck() variants
Use stat64_get()
---
 migration/migration.c | 6 ++++--
 migration/ram.c       | 5 +++--
 migration/ram.h       | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3adcdfe286..9367bb2afc 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -958,7 +958,8 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
 
     if (s->state != MIGRATION_STATUS_COMPLETED) {
         info->ram->remaining = ram_bytes_remaining();
-        info->ram->dirty_pages_rate = ram_counters.dirty_pages_rate;
+        info->ram->dirty_pages_rate =
+           stat64_get(&ram_counters.dirty_pages_rate);
     }
 }
 
@@ -2689,7 +2690,8 @@ static void migration_update_counters(MigrationState *s,
      * if we haven't sent anything, we don't want to
      * recalculate. 10000 is a small enough number for our purposes
      */
-    if (ram_counters.dirty_pages_rate && transferred > 10000) {
+    if (stat64_get(&ram_counters.dirty_pages_rate) &&
+        transferred > 10000) {
         s->expected_downtime = ram_counters.remaining / bandwidth;
     }
 
diff --git a/migration/ram.c b/migration/ram.c
index e9dcda8b9d..5846f6e27f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1130,8 +1130,9 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
     double compressed_size;
 
     /* calculate period counters */
-    ram_counters.dirty_pages_rate = rs->num_dirty_pages_period * 1000
-                / (end_time - rs->time_last_bitmap_sync);
+    stat64_set(&ram_counters.dirty_pages_rate,
+               rs->num_dirty_pages_period * 1000 /
+               (end_time - rs->time_last_bitmap_sync));
 
     if (!page_count) {
         return;
diff --git a/migration/ram.h b/migration/ram.h
index a6e0d70226..f189cc79f8 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -41,7 +41,7 @@
  * one thread).
  */
 typedef struct {
-    int64_t dirty_pages_rate;
+    Stat64 dirty_pages_rate;
     Stat64 dirty_sync_count;
     Stat64 dirty_sync_missed_zero_copy;
     Stat64 downtime_bytes;
-- 
2.40.0



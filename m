Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF826806D6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:04:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMP8e-00020N-7x; Mon, 30 Jan 2023 03:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMP8c-0001z4-G9
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMP8a-00013W-4K
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675065815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WpnvIH3TZ/8iZ1ArVTqJJxIBFy6rJKX1QfsQoLI7Mu0=;
 b=W2010SdQXUGNCsFsTD8T3x65hJQKF1Soo6RH66+d17zmG7HC/n7LSTRopbV66l79FZZynC
 Uj9K5V1ISIi7SXDQuEoM9PzTTOjv2Q9AsqIOl88q2LIzHM9cNz3AytXAStqYjiEQMxiC3r
 CjHrnjmE4O4OuiLBRk0klI4b1A8rz34=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-6syNW15DNtO-V_93a8vtUA-1; Mon, 30 Jan 2023 03:03:29 -0500
X-MC-Unique: 6syNW15DNtO-V_93a8vtUA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E2D13C0DDC0;
 Mon, 30 Jan 2023 08:03:28 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABDB7492B01;
 Mon, 30 Jan 2023 08:03:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 5/5] migration: simplify migration_iteration_run()
Date: Mon, 30 Jan 2023 09:03:07 +0100
Message-Id: <20230130080307.1792-6-quintela@redhat.com>
In-Reply-To: <20230130080307.1792-1-quintela@redhat.com>
References: <20230130080307.1792-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 594a42f085..644c61e91d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3764,23 +3764,23 @@ static MigIterateState migration_iteration_run(MigrationState *s)
                                     pend_pre, pend_compat, pend_post);
     }
 
-    if (pending_size && pending_size >= s->threshold_size) {
-        /* Still a significant amount to transfer */
-        if (!in_postcopy && pend_pre <= s->threshold_size &&
-            qatomic_read(&s->start_postcopy)) {
-            if (postcopy_start(s)) {
-                error_report("%s: postcopy failed to start", __func__);
-            }
-            return MIG_ITERATE_SKIP;
-        }
-        /* Just another iteration step */
-        qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
-    } else {
+    if (pending_size < s->threshold_size) {
         trace_migration_thread_low_pending(pending_size);
         migration_completion(s);
         return MIG_ITERATE_BREAK;
     }
 
+    /* Still a significant amount to transfer */
+    if (!in_postcopy && pend_pre <= s->threshold_size &&
+        qatomic_read(&s->start_postcopy)) {
+        if (postcopy_start(s)) {
+            error_report("%s: postcopy failed to start", __func__);
+        }
+        return MIG_ITERATE_SKIP;
+    }
+
+    /* Just another iteration step */
+    qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
     return MIG_ITERATE_RESUME;
 }
 
-- 
2.39.1



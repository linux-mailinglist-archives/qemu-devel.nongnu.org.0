Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F36426BB
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:35:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28GM-00077H-EY; Mon, 05 Dec 2022 04:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28GE-0006zN-3o
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:59:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28G6-0008Jk-EV
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670234370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsXt0Mo+YraOe+nVpUCs7+EEHIwsfkziC7U7eKyeVHo=;
 b=iNFeRrp5GxnrylrGo5sCJHe2BL5JMTAZpStE9b7fSH9KFm0OEZVXWbUrpNdQJzNRFxtv0E
 Z378E/0HtsHu6hLDVd5bXdLO+VNOuIS5t0AYH+zNpFJEjS1mamRKk6DVRAABNdD+wTIvKY
 bogZ5n7WOsCduGkjCfX9EogWxgsN5GU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-GxyJAN8aPheGjp7hlT7Stg-1; Mon, 05 Dec 2022 04:59:22 -0500
X-MC-Unique: GxyJAN8aPheGjp7hlT7Stg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10C38185A794;
 Mon,  5 Dec 2022 09:59:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15D182166B29;
 Mon,  5 Dec 2022 09:59:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <huth@tuxfamily.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 virtio-fs@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, qemu-block@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Keith Busch <kbusch@kernel.org>, David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 51/51] migration: simplify migration_iteration_run()
Date: Mon,  5 Dec 2022 10:52:28 +0100
Message-Id: <20221205095228.1314-52-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index b54e4657ce..b2c974f166 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3769,23 +3769,23 @@ static MigIterateState migration_iteration_run(MigrationState *s)
         trace_migrate_pending_exact(pending_size, s->threshold_size, pend_pre, pend_post);
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
2.38.1



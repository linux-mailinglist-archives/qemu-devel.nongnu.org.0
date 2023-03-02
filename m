Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A546A86CA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:37:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlv2-0002HM-OC; Thu, 02 Mar 2023 11:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlu9-0000mZ-7m
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlu7-0008C1-0l
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nVxgTElpHLNBsMsEBnufbWFYXUWBieuHuodWUOpHLF8=;
 b=EKDSZNO2W9U8VsgVwkuOaD9QXiPh3FOyHmzxEBJKclbaugpkRuRnT6GVvmP7MJSbbUQ5jF
 ny2KIuh073gGKrmxdDqGeTSt0cShfQnAagIVZVmks8TCMaldvVjFW5oyQlaQ9MGAzxgu3S
 5BJg+yuQXdYz63tmvQ31P0vK6zLnew4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-MhS5kYPaPSqkaSUPPv_i2w-1; Thu, 02 Mar 2023 11:35:35 -0500
X-MC-Unique: MhS5kYPaPSqkaSUPPv_i2w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB25B85A588;
 Thu,  2 Mar 2023 16:35:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB38A492C3E;
 Thu,  2 Mar 2023 16:35:32 +0000 (UTC)
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
Subject: [PATCH 30/43] migration: Create migrate_max_bandwidth() function
Date: Thu,  2 Mar 2023 17:33:57 +0100
Message-Id: <20230302163410.11399-31-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 migration/options.h   | 1 +
 migration/migration.c | 2 +-
 migration/options.c   | 9 +++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/migration/options.h b/migration/options.h
index 4214bebcb7..17ac53429e 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -67,6 +67,7 @@ uint8_t migrate_cpu_throttle_initial(void);
 bool migrate_cpu_throttle_tailslow(void);
 int migrate_decompress_threads(void);
 uint8_t migrate_max_cpu_throttle(void);
+uint64_t migrate_max_bandwidth(void);
 int64_t migrate_max_postcopy_bandwidth(void);
 int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
diff --git a/migration/migration.c b/migration/migration.c
index e091663af9..40453ba454 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3758,7 +3758,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
             XFER_LIMIT_RATIO;
     } else {
         /* This is a fresh new migration */
-        rate_limit = s->parameters.max_bandwidth / XFER_LIMIT_RATIO;
+        rate_limit = migrate_max_bandwidth() / XFER_LIMIT_RATIO;
 
         /* Notify before starting migration thread */
         notifier_list_notify(&migration_state_notifiers, s);
diff --git a/migration/options.c b/migration/options.c
index d9383afa35..4f6298bdc5 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -575,6 +575,15 @@ uint8_t migrate_max_cpu_throttle(void)
     return s->parameters.max_cpu_throttle;
 }
 
+uint64_t migrate_max_bandwidth(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.max_bandwidth;
+}
+
 int64_t migrate_max_postcopy_bandwidth(void)
 {
     MigrationState *s;
-- 
2.39.2



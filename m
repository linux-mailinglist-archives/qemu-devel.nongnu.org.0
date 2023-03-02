Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1146A6A86E1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:39:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlv7-0002fO-0Q; Thu, 02 Mar 2023 11:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlu6-0000jR-E0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltz-00089p-3x
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6mou6nBoMLJ2nHWCwtgrwNZUpK1r3rKau02RSC8mBc=;
 b=PnS+EGUn2MokNyyCxSy/9rdCNFxWVzAEnbK3OGkOHOt3iahXmi833v/RzGpNbBWDnJwftg
 RmrKvN15h5BCnzvaVk9KYR2aeHDV3oWU83f6Fn09MOJdimcsBX5AER52Qm96qpnQJyjpEK
 TtFvFMcxZfOp665kUxYR+aILTyocop8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-G4l2qjuENJGY8AkPcVXRMw-1; Thu, 02 Mar 2023 11:35:26 -0500
X-MC-Unique: G4l2qjuENJGY8AkPcVXRMw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8A2F3C14850;
 Thu,  2 Mar 2023 16:35:25 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0127E492B00;
 Thu,  2 Mar 2023 16:35:23 +0000 (UTC)
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
Subject: [PATCH 26/43] migration: Create migrate_cpu_throttle_increment()
 function
Date: Thu,  2 Mar 2023 17:33:53 +0100
Message-Id: <20230302163410.11399-27-quintela@redhat.com>
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
 migration/options.h | 1 +
 migration/options.c | 9 +++++++++
 migration/ram.c     | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/migration/options.h b/migration/options.h
index fc34ad49c7..253c7f73e6 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -52,6 +52,7 @@ uint32_t migrate_checkpoint_delay(void);
 int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
+uint8_t migrate_cpu_throttle_increment(void);
 uint8_t migrate_cpu_throttle_initial(void);
 int migrate_decompress_threads(void);
 uint8_t migrate_max_cpu_throttle(void);
diff --git a/migration/options.c b/migration/options.c
index f7dd7280b9..c9ef08483c 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -511,6 +511,15 @@ int migrate_compress_wait_thread(void)
     return s->parameters.compress_wait_thread;
 }
 
+uint8_t migrate_cpu_throttle_increment(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.cpu_throttle_increment;
+}
+
 uint8_t migrate_cpu_throttle_initial(void)
 {
     MigrationState *s;
diff --git a/migration/ram.c b/migration/ram.c
index 416688f508..7c764bbb3d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -719,7 +719,7 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
 {
     MigrationState *s = migrate_get_current();
     uint64_t pct_initial = migrate_cpu_throttle_initial();
-    uint64_t pct_increment = s->parameters.cpu_throttle_increment;
+    uint64_t pct_increment = migrate_cpu_throttle_increment();
     bool pct_tailslow = s->parameters.cpu_throttle_tailslow;
     int pct_max = migrate_max_cpu_throttle();
 
-- 
2.39.2



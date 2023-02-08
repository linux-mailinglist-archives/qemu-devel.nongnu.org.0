Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F3568EFC0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:31:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkX8-0000eH-DW; Wed, 08 Feb 2023 08:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkWq-0000Wz-GE
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:30:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkWo-0007Ai-1E
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675863025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBOPUfcJWVwmgQ09J+Sr8M4g+/Ln6cFlGFlcEe57tcs=;
 b=dnQrDIFZiDWVGzpCAQ5zHbqkcmJvWbv9bYHS9HD048eDwkUgdQy17+vtwiECWTQVagz0+T
 DltbtFr+04bzowrJQz+XtBI4v7QQCAlsz6av6SJ+a5hoXWeb3uFhshVPn5JyE8PxNN+uri
 oyNIkd//U8pTFeWN6sHlkpeVoVxscXY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-UiC0DHn9Pg2gTQLiVAfQdw-1; Wed, 08 Feb 2023 08:30:21 -0500
X-MC-Unique: UiC0DHn9Pg2gTQLiVAfQdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7923388904E;
 Wed,  8 Feb 2023 13:30:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78B3DC15BA0;
 Wed,  8 Feb 2023 13:30:19 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 3/6] migration: Simplify ram_find_and_save_block()
Date: Wed,  8 Feb 2023 14:30:07 +0100
Message-Id: <20230208133010.17323-4-quintela@redhat.com>
In-Reply-To: <20230208133010.17323-1-quintela@redhat.com>
References: <20230208133010.17323-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

We will need later that find_dirty_block() return errors, so
simplify the loop.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 0f0fd5c36a..5c406f2c1d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2542,7 +2542,6 @@ static int ram_find_and_save_block(RAMState *rs)
 {
     PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
     int pages = 0;
-    bool again, found;
 
     /* No dirty page as there is zero RAM */
     if (!ram_bytes_total()) {
@@ -2564,18 +2563,17 @@ static int ram_find_and_save_block(RAMState *rs)
     pss_init(pss, rs->last_seen_block, rs->last_page);
 
     do {
-        again = true;
-        found = get_queued_page(rs, pss);
-
-        if (!found) {
+        if (!get_queued_page(rs, pss)) {
             /* priority queue empty, so just search for something dirty */
-            found = find_dirty_block(rs, pss, &again);
-        }
-
-        if (found) {
+            bool again = true;
+            if (!find_dirty_block(rs, pss, &again)) {
+                if (!again) {
+                    break;
+                }
+            }
             pages = ram_save_host_page(rs, pss);
         }
-    } while (!pages && again);
+    } while (!pages);
 
     rs->last_seen_block = pss->block;
     rs->last_page = pss->page;
-- 
2.39.1



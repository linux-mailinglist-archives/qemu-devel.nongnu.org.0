Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A972D583E4A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:05:56 +0200 (CEST)
Received: from localhost ([::1]:54144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH2H5-0007HG-Ck
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oH2Ba-0001Od-Sn
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oH2BX-0001vS-88
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659009610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9eQXzjiIYrGn1Mps/yU0K3o9rMppIzKMyUPjXLAgpqQ=;
 b=gHmiXRx43TjhiE5jSiFsYvBoPiNTwP5947dMV9qIRIHZtHoZ29RU4eVlChxA+BQ3u7gNMU
 ISuhpinIPBVd2U2yCVTRasrMdQJQ8Z5l9KHgDFr1CHGw6d4GT7vyjbcEf5Qj/vYz0Ou3aC
 dUqbbxxVNVs+xxPGjGy1CguLTt7ZxSg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-Hjzye1uRM5SYLVh21JOHrw-1; Thu, 28 Jul 2022 08:00:07 -0400
X-MC-Unique: Hjzye1uRM5SYLVh21JOHrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E627F3C0CD53;
 Thu, 28 Jul 2022 12:00:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 729C790A04;
 Thu, 28 Jul 2022 12:00:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v2 3/6] migration: Simplify ram_find_and_save_block()
Date: Thu, 28 Jul 2022 13:59:54 +0200
Message-Id: <20220728115957.5554-4-quintela@redhat.com>
In-Reply-To: <20220728115957.5554-1-quintela@redhat.com>
References: <20220728115957.5554-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need later that find_dirty_block() return errors, so
simplify the loop.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 6b71ce74f6..c2c939ee03 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2524,7 +2524,6 @@ static int ram_find_and_save_block(RAMState *rs)
 {
     PageSearchStatus pss;
     int pages = 0;
-    bool again, found;
 
     /* No dirty page as there is zero RAM */
     if (!ram_bytes_total()) {
@@ -2540,27 +2539,25 @@ static int ram_find_and_save_block(RAMState *rs)
     }
 
     do {
-        again = true;
-        found = get_queued_page(rs, &pss);
-
-        if (!found) {
+        if (!get_queued_page(rs, &pss)) {
             /*
              * Recover previous precopy ramblock/offset if postcopy has
              * preempted precopy.  Otherwise find the next dirty bit.
              */
             if (postcopy_preempt_triggered(rs)) {
                 postcopy_preempt_restore(rs, &pss, false);
-                found = true;
             } else {
                 /* priority queue empty, so just search for something dirty */
-                found = find_dirty_block(rs, &pss, &again);
+                bool again = true;
+                if (!find_dirty_block(rs, &pss, &again)) {
+                    if (!again) {
+                        break;
+                    }
+                }
             }
         }
-
-        if (found) {
-            pages = ram_save_host_page(rs, &pss);
-        }
-    } while (!pages && again);
+        pages = ram_save_host_page(rs, &pss);
+    } while (!pages);
 
     rs->last_seen_block = pss.block;
     rs->last_page = pss.page;
-- 
2.37.1



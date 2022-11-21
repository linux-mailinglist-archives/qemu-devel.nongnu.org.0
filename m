Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B346322EE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:00:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6OV-0001a0-0z; Mon, 21 Nov 2022 07:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6OT-0001Za-AN
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:59:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6OR-0006Qj-TY
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669035563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C43sXzuDPrCVxw3vYvZA3vkx4qjmhBG5GAMoIDyKDro=;
 b=YOJzGVdwAtnOnGSRfnOZiNZGFRu27wFDlPCh5oaf4VWxigpAb8x1653mhpj6MPTASGs8fc
 E0Yuih6P66O9ZCFUZLuSKOeMqGcJ3JIlg0SNyZPVjszZqY0ppl0T+3ztPT3WzzmtU9ghrq
 1/XEAOwt732wVE4a4x56AIGbjf9nmqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-clqyI-BYPgiqhT9ZfcFXAA-1; Mon, 21 Nov 2022 07:59:20 -0500
X-MC-Unique: clqyI-BYPgiqhT9ZfcFXAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3E1C101A528;
 Mon, 21 Nov 2022 12:59:19 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E12AC15BB3;
 Mon, 21 Nov 2022 12:59:17 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 3/8] migration: Fix possible infinite loop of ram save process
Date: Mon, 21 Nov 2022 13:59:02 +0100
Message-Id: <20221121125907.62469-4-quintela@redhat.com>
In-Reply-To: <20221121125907.62469-1-quintela@redhat.com>
References: <20221121125907.62469-1-quintela@redhat.com>
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

From: Peter Xu <peterx@redhat.com>

When starting ram saving procedure (especially at the completion phase),
always set last_seen_block to non-NULL to make sure we can always correctly
detect the case where "we've migrated all the dirty pages".

Then we'll guarantee both last_seen_block and pss.block will be valid
always before the loop starts.

See the comment in the code for some details.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index dc1de9ddbc..1d42414ecc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2546,14 +2546,22 @@ static int ram_find_and_save_block(RAMState *rs)
         return pages;
     }
 
+    /*
+     * Always keep last_seen_block/last_page valid during this procedure,
+     * because find_dirty_block() relies on these values (e.g., we compare
+     * last_seen_block with pss.block to see whether we searched all the
+     * ramblocks) to detect the completion of migration.  Having NULL value
+     * of last_seen_block can conditionally cause below loop to run forever.
+     */
+    if (!rs->last_seen_block) {
+        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);
+        rs->last_page = 0;
+    }
+
     pss.block = rs->last_seen_block;
     pss.page = rs->last_page;
     pss.complete_round = false;
 
-    if (!pss.block) {
-        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
-    }
-
     do {
         again = true;
         found = get_queued_page(rs, &pss);
-- 
2.38.1



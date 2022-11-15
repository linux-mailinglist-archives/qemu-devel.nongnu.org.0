Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68015629DE0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 16:44:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouxyn-0005rF-OE; Tue, 15 Nov 2022 10:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxyi-0005nf-38
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:36:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxyg-0008NE-Kp
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668526558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8sTZ2tLPTwfI8PVRQNhye5uLdMdQcsdyAavf636xeAI=;
 b=ANwOSRP8CeC7/E+V8ze52KNSblwBdUeZYykcM+051XVMnZc3JSlwKeRgETpUhK0nIUTgyd
 g2v27gpWrc4J662k2+s4RVRKg7kZXA/Rc6UWWWKf8NL7nzLr27jVv8uJCejjPbJ1BEWwql
 DDpDp8mZuy0BcICy27ASpMDlhT3drhE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-BWnpH5dGP1OECfgnGdByKg-1; Tue, 15 Nov 2022 10:35:54 -0500
X-MC-Unique: BWnpH5dGP1OECfgnGdByKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 403702A5954B;
 Tue, 15 Nov 2022 15:35:54 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5A1D2166B2B;
 Tue, 15 Nov 2022 15:35:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>
Subject: [PULL 10/30] migration: Fix possible infinite loop of ram save process
Date: Tue, 15 Nov 2022 16:34:54 +0100
Message-Id: <20221115153514.28003-11-quintela@redhat.com>
In-Reply-To: <20221115153514.28003-1-quintela@redhat.com>
References: <20221115153514.28003-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index bb4f08bfed..c0f5d6d287 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2574,14 +2574,22 @@ static int ram_find_and_save_block(RAMState *rs)
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



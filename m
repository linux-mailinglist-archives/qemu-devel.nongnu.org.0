Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511F8629DD0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 16:41:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouxz1-000684-Iw; Tue, 15 Nov 2022 10:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxyw-00063F-1O
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:36:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxys-0008Ox-2i
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668526569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYeIQe/j3B37yyq4ayWjo2p+YUwHJONfvHLwiEzscgk=;
 b=f2OLUZQ6XrzNGC8mBaX1p7W215E072yYuv2xzbmFwVAcShmlbUyaArCO6LBatH1FlPxtQ1
 BJOU+KY2Fm27jvGpm9OXj7fDdBCbf1XCQ/Lg9wQfIbhd7z9wM2Ek3Ppo/ocZDY1TlCWEKW
 CcSVLUGzhsmvfni7L/kUiptficOlNEI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-ldi5aoEdNZG6nfzwo5Frpg-1; Tue, 15 Nov 2022 10:36:06 -0500
X-MC-Unique: ldi5aoEdNZG6nfzwo5Frpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2877A1C075B6;
 Tue, 15 Nov 2022 15:36:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 739082166B2C;
 Tue, 15 Nov 2022 15:36:03 +0000 (UTC)
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
Subject: [PULL 14/30] migration: Disable multifd explicitly with compression
Date: Tue, 15 Nov 2022 16:34:58 +0100
Message-Id: <20221115153514.28003-15-quintela@redhat.com>
In-Reply-To: <20221115153514.28003-1-quintela@redhat.com>
References: <20221115153514.28003-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Multifd thread model does not work for compression, explicitly disable it.

Note that previuosly even we can enable both of them, nothing will go
wrong, because the compression code has higher priority so multifd feature
will just be ignored.  Now we'll fail even earlier at config time so the
user should be aware of the consequence better.

Note that there can be a slight chance of breaking existing users, but
let's assume they're not majority and not serious users, or they should
have found that multifd is not working already.

With that, we can safely drop the check in ram_save_target_page() for using
multifd, because when multifd=on then compression=off, then the removed
check on save_page_use_compression() will also always return false too.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c |  7 +++++++
 migration/ram.c       | 11 +++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 0bc3fce4b7..9fbed8819a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1370,6 +1370,13 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
+        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
+            error_setg(errp, "Multifd is not compatible with compress");
+            return false;
+        }
+    }
+
     return true;
 }
 
diff --git a/migration/ram.c b/migration/ram.c
index c0f5d6d287..2fcce796d0 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2333,13 +2333,12 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
     }
 
     /*
-     * Do not use multifd for:
-     * 1. Compression as the first page in the new block should be posted out
-     *    before sending the compressed page
-     * 2. In postcopy as one whole host page should be placed
+     * Do not use multifd in postcopy as one whole host page should be
+     * placed.  Meanwhile postcopy requires atomic update of pages, so even
+     * if host page size == guest page size the dest guest during run may
+     * still see partially copied pages which is data corruption.
      */
-    if (!save_page_use_compression(rs) && migrate_use_multifd()
-        && !migration_in_postcopy()) {
+    if (migrate_use_multifd() && !migration_in_postcopy()) {
         return ram_save_multifd_page(rs, block, offset);
     }
 
-- 
2.38.1



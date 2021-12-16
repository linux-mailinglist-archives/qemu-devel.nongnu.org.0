Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA6476D38
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:18:20 +0100 (CET)
Received: from localhost ([::1]:47090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmu2-0002CF-PL
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:18:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxmqV-0006Lq-HA
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:14:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxmqQ-0001K6-Kh
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:14:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639646074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FF8W7YtBxn/vCL3JVGrFOkdA75bmJ1AY6gSAozqT/aI=;
 b=EzY3nv1ZakclpO++/7XjT6kkU/iLxNOQ17P6M9ZRueCkqCH80JZPv0pQqzHPMI+Bdm+QTh
 Itda1GO13qLDQK9nMELC0Ygr/rhtegVR3XO1YwbDm6DjKW6Xm4EZw6CHuCmWAKcFPRGEkx
 pHv81HQzUnJ1yrlCGvP14p4t816Gcvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-cUV1bv4NPk6NGiWWgPBRlQ-1; Thu, 16 Dec 2021 04:14:33 -0500
X-MC-Unique: cUV1bv4NPk6NGiWWgPBRlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F91C36393
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 09:14:32 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C324377440;
 Thu, 16 Dec 2021 09:14:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] migration: Move ram_release_pages() call to
 save_zero_page_to_file()
Date: Thu, 16 Dec 2021 10:13:32 +0100
Message-Id: <20211216091332.25681-6-quintela@redhat.com>
In-Reply-To: <20211216091332.25681-1-quintela@redhat.com>
References: <20211216091332.25681-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We always need to call it when we find a zero page, so put it in a
single place.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 0911811ed9..eeeeb0b888 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1158,6 +1158,15 @@ static void migration_bitmap_sync_precopy(RAMState *rs)
     }
 }
 
+static void ram_release_page(const char *rbname, uint64_t offset)
+{
+    if (!migrate_release_ram() || !migration_in_postcopy()) {
+        return;
+    }
+
+    ram_discard_range(rbname, offset, ((ram_addr_t)1) << TARGET_PAGE_BITS);
+}
+
 /**
  * save_zero_page_to_file: send the zero page to the file
  *
@@ -1179,6 +1188,7 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
         len += save_page_header(rs, file, block, offset | RAM_SAVE_FLAG_ZERO);
         qemu_put_byte(file, 0);
         len += 1;
+        ram_release_page(block->idstr, offset & TARGET_PAGE_MASK);
     }
     return len;
 }
@@ -1204,15 +1214,6 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
     return -1;
 }
 
-static void ram_release_page(const char *rbname, uint64_t offset)
-{
-    if (!migrate_release_ram() || !migration_in_postcopy()) {
-        return;
-    }
-
-    ram_discard_range(rbname, offset, ((ram_addr_t)1) << TARGET_PAGE_BITS);
-}
-
 /*
  * @pages: the number of pages written by the control path,
  *        < 0 - error
@@ -1344,7 +1345,6 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
     int ret;
 
     if (save_zero_page_to_file(rs, f, block, offset)) {
-        ram_release_page(block->idstr, offset & TARGET_PAGE_MASK);
         return true;
     }
 
@@ -2148,7 +2148,6 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
             xbzrle_cache_zero_page(rs, block->offset + offset);
             XBZRLE_cache_unlock();
         }
-        ram_release_page(block->idstr, offset);
         return res;
     }
 
-- 
2.33.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E5047C03C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 13:59:44 +0100 (CET)
Received: from localhost ([::1]:35494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzek3-0002RC-10
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 07:59:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mzefD-0003Wj-NZ
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 07:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mzef7-0003do-AD
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 07:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640091276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2oA7NNvAmRNk2PBAwEVoe0kKRsv4CI8kP1tvBxDOK9o=;
 b=HZfsjk4rtf8w3UHNpyWZogz4Ftd5iiCd3lioILTJ2OodgktatpN8VHS8UcJyS0Wyv+aOc9
 joA9KMcCShcVqiFNwgK9n1QvMeRzSFVEjmrekFVW5v5vCMJzvWONTLS+cyghGk/xT/rVMJ
 UbYWvhO1Iyr6hpnYmJsbN2XfzZ6MZDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-aoYKudFNPZScBkFOdC66SA-1; Tue, 21 Dec 2021 07:54:35 -0500
X-MC-Unique: aoYKudFNPZScBkFOdC66SA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA9F21014BE4
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 12:54:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E2955C23A;
 Tue, 21 Dec 2021 12:54:33 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] migration: Move ram_release_pages() call to
 save_zero_page_to_file()
Date: Tue, 21 Dec 2021 13:52:35 +0100
Message-Id: <20211221125235.67414-7-quintela@redhat.com>
In-Reply-To: <20211221125235.67414-1-quintela@redhat.com>
References: <20211221125235.67414-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index eddc85ffb0..3cd98e19d5 100644
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
+    ram_discard_range(rbname, offset, 1ULL << TARGET_PAGE_BITS);
+}
+
 /**
  * save_zero_page_to_file: send the zero page to the file
  *
@@ -1179,6 +1188,7 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
         len += save_page_header(rs, file, block, offset | RAM_SAVE_FLAG_ZERO);
         qemu_put_byte(file, 0);
         len += 1;
+        ram_release_page(block->idstr, offset);
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
-    ram_discard_range(rbname, offset, 1ULL << TARGET_PAGE_BITS);
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



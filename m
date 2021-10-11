Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CD34296A0
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 20:14:42 +0200 (CEST)
Received: from localhost ([::1]:33122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzov-00049U-IZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 14:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzYw-0002n5-Md
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:58:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzYu-0004Iq-Uw
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633975088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=io/zt988Dg8S6Zu9Ne0KKC+57ohEf+yYEI9rI8GQI+c=;
 b=fVMVtoslXas2tIoU0vhi1JbIid5hqwj00+pZypgpCAU6olZtGUyEX5G+r+v2uTlDt4JUoo
 wldmBLHTyRu4t6A2S97T9yy/APUdEboDNUtQPgBeiF60VzXdmTkIj6Y+GUabigBUQgSUn3
 wpjZ/c1wpmIeqmL1hPDRWssH4QUWd4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-L8EfT7s8PgWm6hHF8aL-xA-1; Mon, 11 Oct 2021 13:58:05 -0400
X-MC-Unique: L8EfT7s8PgWm6hHF8aL-xA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 109CA801A92;
 Mon, 11 Oct 2021 17:58:04 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5C6319E7E;
 Mon, 11 Oct 2021 17:57:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 8/9] migration/ram: Factor out populating pages readable in
 ram_block_populate_pages()
Date: Mon, 11 Oct 2021 19:53:45 +0200
Message-Id: <20211011175346.15499-9-david@redhat.com>
In-Reply-To: <20211011175346.15499-1-david@redhat.com>
References: <20211011175346.15499-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's factor out prefaulting/populating to make further changes easier to
review and add a comment what we are actually expecting to happen. While at
it, use the actual page size of the ramblock, which defaults to
qemu_real_host_page_size for anonymous memory. Further, rename
ram_block_populate_pages() to ram_block_populate_read() as well, to make
it clearer what we are doing.

In the future, we might want to use MADV_POPULATE_READ to speed up
population.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b225ec7507..c212081f85 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1639,26 +1639,35 @@ out:
     return ret;
 }
 
+static inline void populate_read_range(RAMBlock *block, ram_addr_t offset,
+                                       ram_addr_t size)
+{
+    /*
+     * We read one byte of each page; this will preallocate page tables if
+     * required and populate the shared zeropage on MAP_PRIVATE anonymous memory
+     * where no page was populated yet. This might require adaption when
+     * supporting other mappings, like shmem.
+     */
+    for (; offset < size; offset += block->page_size) {
+        char tmp = *((char *)block->host + offset);
+
+        /* Don't optimize the read out */
+        asm volatile("" : "+r" (tmp));
+    }
+}
+
 /*
- * ram_block_populate_pages: populate memory in the RAM block by reading
- *   an integer from the beginning of each page.
+ * ram_block_populate_read: preallocate page tables and populate pages in the
+ *   RAM block by reading a byte of each page.
  *
  * Since it's solely used for userfault_fd WP feature, here we just
  *   hardcode page size to qemu_real_host_page_size.
  *
  * @block: RAM block to populate
  */
-static void ram_block_populate_pages(RAMBlock *block)
+static void ram_block_populate_read(RAMBlock *block)
 {
-    char *ptr = (char *) block->host;
-
-    for (ram_addr_t offset = 0; offset < block->used_length;
-            offset += qemu_real_host_page_size) {
-        char tmp = *(ptr + offset);
-
-        /* Don't optimize the read out */
-        asm volatile("" : "+r" (tmp));
-    }
+    populate_read_range(block, 0, block->used_length);
 }
 
 /*
@@ -1684,7 +1693,7 @@ void ram_write_tracking_prepare(void)
          * UFFDIO_WRITEPROTECT_MODE_WP mode setting would silently skip
          * pages with pte_none() entries in page table.
          */
-        ram_block_populate_pages(block);
+        ram_block_populate_read(block);
     }
 }
 
-- 
2.31.1



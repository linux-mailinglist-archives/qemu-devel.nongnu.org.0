Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C0B3FEEF3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:48:13 +0200 (CEST)
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLn4e-0007wI-JX
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLmZZ-0008U1-3k
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:16:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLmZX-0007dF-LC
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630588563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8b35ZIinybLtLOoP8O99AfG1rOqf0tc1DYwfIDvwWrY=;
 b=EAB20yVu7/cPiaH/HHQMmezHl7xfYTnaHYZ9u+UwqIWnTVg6X5mA2FNHUCCHVmnYIyhwbI
 tcJ/5NDgkB+mw0BafyzNmGT2j/KISmWQxCwtuZYl6zoUJIMP+tgJ3Hg2d+MO+ohbVP1M5Y
 g9UsahTGgXSMM+FAw0Om7YaKKteImT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-WukEggKIOqO4zbtg3wJe3A-1; Thu, 02 Sep 2021 09:16:02 -0400
X-MC-Unique: WukEggKIOqO4zbtg3wJe3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C622D189C440;
 Thu,  2 Sep 2021 13:16:00 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32B366B541;
 Thu,  2 Sep 2021 13:15:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 8/9] migration/ram: Factor out populating pages readable in
 ram_block_populate_pages()
Date: Thu,  2 Sep 2021 15:14:31 +0200
Message-Id: <20210902131432.23103-9-david@redhat.com>
In-Reply-To: <20210902131432.23103-1-david@redhat.com>
References: <20210902131432.23103-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
review. While at it, use the actual page size of the ramblock, which
defaults to qemu_real_host_page_size for anonymous memory.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index e1c158dc92..de47650c90 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1639,6 +1639,17 @@ out:
     return ret;
 }
 
+static inline void populate_range(RAMBlock *block, ram_addr_t offset,
+                                  ram_addr_t size)
+{
+    for (; offset < size; offset += block->page_size) {
+        char tmp = *((char *)block->host + offset);
+
+        /* Don't optimize the read out */
+        asm volatile("" : "+r" (tmp));
+    }
+}
+
 /*
  * ram_block_populate_pages: populate memory in the RAM block by reading
  *   an integer from the beginning of each page.
@@ -1650,15 +1661,7 @@ out:
  */
 static void ram_block_populate_pages(RAMBlock *block)
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
+    populate_range(block, 0, block->used_length);
 }
 
 /*
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB1744235C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:24:21 +0100 (CET)
Received: from localhost ([::1]:44704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfj2-0001mn-Ep
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfV7-0007hZ-7k
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUq-0000eO-LB
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ut0I0bOpeQjRvVatojvb4Hc5X8NOzmNkKKtiHDMU41A=;
 b=gzyhy7V4xAMCfoQzM/w4JM1eoePeySG3Bz0CiV0t1svj8eSFZZ2e95vEhOPdZnZPU2058W
 bS7tsQxqakm5CJI6OsxyL2T75QIVZwMiQAHwZJvMmRFVe9CZStXT1gqAAwK5sxaNC1EiQg
 4byQbJPq+jg+1jZKE4LZuzhoNbu4ll0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-tbqrSfhhOfKmma9YQY2m5g-1; Mon, 01 Nov 2021 18:09:38 -0400
X-MC-Unique: tbqrSfhhOfKmma9YQY2m5g-1
Received: by mail-wm1-f71.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso166133wml.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ut0I0bOpeQjRvVatojvb4Hc5X8NOzmNkKKtiHDMU41A=;
 b=WRMSEFKec5vRzfI8+JVFuLF9T83ojQnymZ2CFesmbG98jkKnPAfbkzNTi+wFv/SotY
 Yskzi8RdA6mr/KbOLAqwtntUjfbmWLeSn5Wh5mbGrCmVSTeAB1zSoGySxiNxvxBrKzjd
 MOO/ph5w7iU6T2rtRNVYQM8bCUH0Q/AJirqhoqfqwu5/eC6VlUXRUfB8JjeHtPxrWkW8
 aehBA3N9Udv1ruKhWJuNSdjN4/VMyHkAn+Zv/DRu6WUGBqJDnDRYHrrW3E7lrkjhZ5dr
 KkZi6kYe03lDnbQki9o1Elu+k8oPjJzjeMR7NxC49UmX7Y0P84KeNBN81l3+E4hAuZ9j
 M0SA==
X-Gm-Message-State: AOAM531aoJWMW9Qqkk32ZoMgPKY1Ml+Fa/zA6AfNCyHK8lKirKiK2Vly
 HSb1rvwxJgFcsBO5TduuyGu4AvO2Low60maUcVJBZT6CJW5U6zD8LexbJ3vyChKA+5hCl2TEtyc
 JFc0YyKWUIH4Utx2lJBOkjZIxW5PvepS2rRH2TlZ/b1UDSa41G/6+UcPMpynkNkeUWoU=
X-Received: by 2002:a05:600c:4f92:: with SMTP id
 n18mr1960085wmq.22.1635804577516; 
 Mon, 01 Nov 2021 15:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk1mlsAWBnPV3UAdQaOyBp79mHrO95iLydgSFEaD+slGORmkvNAM202r9ngtyh0byPMnYLqg==
X-Received: by 2002:a05:600c:4f92:: with SMTP id
 n18mr1960047wmq.22.1635804577205; 
 Mon, 01 Nov 2021 15:09:37 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id f1sm14841974wrc.74.2021.11.01.15.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:36 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/20] migration/ram: Factor out populating pages readable in
 ram_block_populate_pages()
Date: Mon,  1 Nov 2021 23:09:09 +0100
Message-Id: <20211101220912.10039-18-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.734, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 54df5dc0fc..92c7b788ae 100644
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
2.33.1



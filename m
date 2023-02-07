Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6B468CB8A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 01:58:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPCJ6-0003OL-I3; Mon, 06 Feb 2023 19:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCJ4-0003Nu-Ob
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:57:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCJ3-0003jL-2q
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675731476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYITrzVxeANIn4myE/xtt+IWMtwojgiIpFXvIFEzIJQ=;
 b=i53eXb+LE/FkyehmV6fnJlF/jIG9oTtnyLsX/fqeFNIo3e7em0CbzWnwfOodEJoTgIPw4X
 YuaSJdSmHoTM26aPBVwIeUdCVumx6gefNYsIhHl7jesIGv5Vd2t5Jr/sQXWDujOx2RHgf3
 CrgBM994D4lUQiaVKoIPkJcZanJ6/0c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-I1wun_KfPuyJwkeiCjBvVA-1; Mon, 06 Feb 2023 19:57:53 -0500
X-MC-Unique: I1wun_KfPuyJwkeiCjBvVA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFB4285A5A3;
 Tue,  7 Feb 2023 00:57:52 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0216F492C3C;
 Tue,  7 Feb 2023 00:57:47 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 11/30] migration/ram: Optimize ram_write_tracking_start() for
 RamDiscardManager
Date: Tue,  7 Feb 2023 01:56:31 +0100
Message-Id: <20230207005650.1810-12-quintela@redhat.com>
In-Reply-To: <20230207005650.1810-1-quintela@redhat.com>
References: <20230207005650.1810-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

From: David Hildenbrand <david@redhat.com>

ram_block_populate_read() already optimizes for RamDiscardManager.
However, ram_write_tracking_start() will still try protecting discarded
memory ranges.

Let's optimize, because discarded ranges don't map any pages and

(1) For anonymous memory, trying to protect using uffd-wp without a mapped
    page is ignored by the kernel and consequently a NOP.

(2) For shared/file-backed memory, we will fill present page tables in the
    range with PTE markers. However, we will even allocate page tables
    just to fill them with unnecessary PTE markers and effectively
    waste memory.

So let's exclude these ranges, just like ram_block_populate_read()
already does.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index a6956c9e7d..7f6d5efe8d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1865,6 +1865,39 @@ void ram_write_tracking_prepare(void)
     }
 }
 
+static inline int uffd_protect_section(MemoryRegionSection *section,
+                                       void *opaque)
+{
+    const hwaddr size = int128_get64(section->size);
+    const hwaddr offset = section->offset_within_region;
+    RAMBlock *rb = section->mr->ram_block;
+    int uffd_fd = (uintptr_t)opaque;
+
+    return uffd_change_protection(uffd_fd, rb->host + offset, size, true,
+                                  false);
+}
+
+static int ram_block_uffd_protect(RAMBlock *rb, int uffd_fd)
+{
+    assert(rb->flags & RAM_UF_WRITEPROTECT);
+
+    /* See ram_block_populate_read() */
+    if (rb->mr && memory_region_has_ram_discard_manager(rb->mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
+        MemoryRegionSection section = {
+            .mr = rb->mr,
+            .offset_within_region = 0,
+            .size = rb->mr->size,
+        };
+
+        return ram_discard_manager_replay_populated(rdm, &section,
+                                                    uffd_protect_section,
+                                                    (void *)(uintptr_t)uffd_fd);
+    }
+    return uffd_change_protection(uffd_fd, rb->host,
+                                  rb->used_length, true, false);
+}
+
 /*
  * ram_write_tracking_start: start UFFD-WP memory tracking
  *
@@ -1900,8 +1933,7 @@ int ram_write_tracking_start(void)
         memory_region_ref(block->mr);
 
         /* Apply UFFD write protection to the block memory range */
-        if (uffd_change_protection(rs->uffdio_fd, block->host,
-                                   block->used_length, true, false)) {
+        if (ram_block_uffd_protect(block, uffd_fd)) {
             goto fail;
         }
 
-- 
2.39.1



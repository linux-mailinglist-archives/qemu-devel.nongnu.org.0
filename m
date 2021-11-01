Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A7144236B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:28:49 +0100 (CET)
Received: from localhost ([::1]:53586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfnM-0007z2-Df
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUu-0007Nh-DZ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUr-0000ee-Qu
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unY7TGVSo3gAzWqEez72wIx+FCQs3PCeVqZ11RSh+wo=;
 b=bqi+VRkl1Cf/lk0pITlieMwISEITO1lHRQenmPcMwXdKiXTocaA+KJQXoGYcPqR97MiR6a
 7tTn7mikjoT34lGW99BSD7oL/RZsmDPSA7lfg9qGetptlNj7dmOuXDmBLi4/DKRO/XFajN
 M47xwDPGNWLLtYg9EIpEnCs6E/3Ou5g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481--8lW2qdiPUCmOQlNOLCUPQ-1; Mon, 01 Nov 2021 18:09:40 -0400
X-MC-Unique: -8lW2qdiPUCmOQlNOLCUPQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso3734817wrq.16
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=unY7TGVSo3gAzWqEez72wIx+FCQs3PCeVqZ11RSh+wo=;
 b=dG8OebAEdMUWsQ4nQYcF11rvOFzyKk2lO8xP22fI9/xsjvM+VuTOA+UC/FXN+DcFtB
 6ZjZo1R4PfU+CUCR/vs8nPB31E6WTf2Z/h1kK7PhTHoS1gsniUBxlp/VrZHHabH8lLfR
 Nc9cAO9TFr81AjjWv9/RqNM5g9oUotC6Zo34TVbdfolZz/SNx9f/EZDr/7NgQQoiA0Ru
 HcurDbRCAGuBXNOlpkAK1PEnmB60cTJyEqaYDdlLnc1lEN0KQGEnk9HS1R8CamlDJXZd
 KVW5ervZppBc0NAEUtBGR42yfV4qvr7zZszQOrL8SPrsch0FvV0qSdPdQOZvf9ojmOQd
 lMkA==
X-Gm-Message-State: AOAM531GyUUpuBbvXw+iwRrm2Fdh9qPiH3qLspiMobEna+3LTwOEgsIf
 vRoKrqhdJkiNpLhkgqbnqjqKptrJiEga2YF/JhryFq22pQ3G+5B0YPnp6LjroAU/B+G9U4W1FFT
 k4qKYg4A/cPPRoYPZJSsPaXgAvv1fdRjSOYYWF7d3A7jlkrFyssbvFuHkXMVP44HyN8w=
X-Received: by 2002:a5d:568c:: with SMTP id f12mr30759753wrv.240.1635804578818; 
 Mon, 01 Nov 2021 15:09:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNZg4k6DRhmX852xk77R95Xufg4HlBWhkQxhZujNVoSP0nUJe8lhm/J27V+ocUqFpop+mG2g==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr30759714wrv.240.1635804578506; 
 Mon, 01 Nov 2021 15:09:38 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id o1sm7544314wrn.63.2021.11.01.15.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/20] migration/ram: Handle RAMBlocks with a RamDiscardManager
 on background snapshots
Date: Mon,  1 Nov 2021 23:09:10 +0100
Message-Id: <20211101220912.10039-19-quintela@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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

We already don't ever migrate memory that corresponds to discarded ranges
as managed by a RamDiscardManager responsible for the mapped memory region
of the RAMBlock.

virtio-mem uses this mechanism to logically unplug parts of a RAMBlock.
Right now, we still populate zeropages for the whole usable part of the
RAMBlock, which is undesired because:

1. Even populating the shared zeropage will result in memory getting
   consumed for page tables.
2. Memory backends without a shared zeropage (like hugetlbfs and shmem)
   will populate an actual, fresh page, resulting in an unintended
   memory consumption.

Discarded ("logically unplugged") parts have to remain discarded. As
these pages are never part of the migration stream, there is no need to
track modifications via userfaultfd WP reliably for these parts.

Further, any writes to these ranges by the VM are invalid and the
behavior is undefined.

Note that Linux only supports userfaultfd WP on private anonymous memory
for now, which usually results in the shared zeropage getting populated.
The issue will become more relevant once userfaultfd WP supports shmem
and hugetlb.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 92c7b788ae..680a5158aa 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1656,6 +1656,17 @@ static inline void populate_read_range(RAMBlock *block, ram_addr_t offset,
     }
 }
 
+static inline int populate_read_section(MemoryRegionSection *section,
+                                        void *opaque)
+{
+    const hwaddr size = int128_get64(section->size);
+    hwaddr offset = section->offset_within_region;
+    RAMBlock *block = section->mr->ram_block;
+
+    populate_read_range(block, offset, size);
+    return 0;
+}
+
 /*
  * ram_block_populate_read: preallocate page tables and populate pages in the
  *   RAM block by reading a byte of each page.
@@ -1665,9 +1676,32 @@ static inline void populate_read_range(RAMBlock *block, ram_addr_t offset,
  *
  * @block: RAM block to populate
  */
-static void ram_block_populate_read(RAMBlock *block)
+static void ram_block_populate_read(RAMBlock *rb)
 {
-    populate_read_range(block, 0, block->used_length);
+    /*
+     * Skip populating all pages that fall into a discarded range as managed by
+     * a RamDiscardManager responsible for the mapped memory region of the
+     * RAMBlock. Such discarded ("logically unplugged") parts of a RAMBlock
+     * must not get populated automatically. We don't have to track
+     * modifications via userfaultfd WP reliably, because these pages will
+     * not be part of the migration stream either way -- see
+     * ramblock_dirty_bitmap_exclude_discarded_pages().
+     *
+     * Note: The result is only stable while migrating (precopy/postcopy).
+     */
+    if (rb->mr && memory_region_has_ram_discard_manager(rb->mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
+        MemoryRegionSection section = {
+            .mr = rb->mr,
+            .offset_within_region = 0,
+            .size = rb->mr->size,
+        };
+
+        ram_discard_manager_replay_populated(rdm, &section,
+                                             populate_read_section, NULL);
+    } else {
+        populate_read_range(rb, 0, rb->used_length);
+    }
 }
 
 /*
-- 
2.33.1



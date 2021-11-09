Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FFB44A81F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 09:05:13 +0100 (CET)
Received: from localhost ([::1]:40424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkM80-0001Md-Ko
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 03:05:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkM5r-0007oT-5A
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:02:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkM5o-0002Ao-Cq
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636444975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/6Qi49GjgS9oa+N7U8Dbq9g7j3/fB7gPw5LowLrOPE=;
 b=WSse4D7aYZqGrSbTC1IQLTkmGEh9kdQ8eUpKcXRamFYoQ83/gZX0G8/sT/6kDOuEJ84CBD
 7VNCoJXY4Hu2kUuHhbT5lu0X0p4NO+fodxe0HUGEjCRErdeynEAuQSgoOD3EcJZGs70qsT
 0NaOPIUGa1OyD0gE75pecTtLqVJ0kRI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-ze7d5rmfNDmIFFfGdWiCGw-1; Tue, 09 Nov 2021 03:02:55 -0500
X-MC-Unique: ze7d5rmfNDmIFFfGdWiCGw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q7-20020adff507000000b0017d160d35a8so4621366wro.4
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/6Qi49GjgS9oa+N7U8Dbq9g7j3/fB7gPw5LowLrOPE=;
 b=dA2haXLbnhi/sDoh9XkwcWZ6ThKr0WvKmNaiH+jS68YVEXTMYp5gVE6duD+lQNe6fm
 o0Xl+e5cMVu+N+BIUXNQGuupRJzBsGIK8Zzzzaa9WMtn6Lj1cB3eOCMf7tIrABJH3svI
 L0pyc3OmAU5m7u0pCoiWY7xK1BTUO+K/yyrSPQbvXKADV2iG1y0bIhX5ObZE3j1sxFh+
 4bPEh5SQWyVCRcWB4+E17uFUpIxlsBjYepzLaAG4rQMyuv/TNRbAIZre+xho+yc6KMvL
 giIRo3XFSMtek4GOR4QkxgLVw1u2DeP29DdPuTY7eXoP0QYudJHYVJXEH3VRNzJKEEzf
 ytlg==
X-Gm-Message-State: AOAM533dgtj4jhJNN1hfGKB+EcW5VCQ1dDej2fRhmzmTRfmOhH8gbU70
 aTmg3T4qjOubUiWteLsc3wZ5yC9MoI2yDvNUf8shJZHPDRPL2RKW/P0rgiGM6dZXHJ+rmCQblza
 51Rp1Sa2h8VGWI/nvPsw8SzhoXH2HrK8UVKFdtz0lVmlcNs8VIEXSFCWtaxbs94lOrvs=
X-Received: by 2002:a05:600c:6016:: with SMTP id
 az22mr4248434wmb.11.1636444973527; 
 Tue, 09 Nov 2021 00:02:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyr4td6ClbyoVYe/SVAZmPtPzP+oT8fNU7OSnt/CevkB4/bsHBKxjM1jLHdcbddUFF6DWNBBA==
X-Received: by 2002:a05:600c:6016:: with SMTP id
 az22mr4248400wmb.11.1636444973228; 
 Tue, 09 Nov 2021 00:02:53 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id a22sm1653443wme.19.2021.11.09.00.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 00:02:52 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] Reduce the PVM stop time during Checkpoint
Date: Tue,  9 Nov 2021 09:02:46 +0100
Message-Id: <20211109080247.62559-3-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109080247.62559-1-quintela@redhat.com>
References: <20211109080247.62559-1-quintela@redhat.com>
MIME-Version: 1.0
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, "Rao, Lei" <lei.rao@intel.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

When flushing memory from ram cache to ram during every checkpoint
on secondary VM, we can copy continuous chunks of memory instead of
4096 bytes per time to reduce the time of VM stop during checkpoint.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Tested-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 847af461f2..f48cf4b0a5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -836,6 +836,41 @@ migration_clear_memory_region_dirty_bitmap_range(RAMBlock *rb,
     }
 }
 
+/*
+ * colo_bitmap_find_diry:find contiguous dirty pages from start
+ *
+ * Returns the page offset within memory region of the start of the contiguout
+ * dirty page
+ *
+ * @rs: current RAM state
+ * @rb: RAMBlock where to search for dirty pages
+ * @start: page where we start the search
+ * @num: the number of contiguous dirty pages
+ */
+static inline
+unsigned long colo_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
+                                     unsigned long start, unsigned long *num)
+{
+    unsigned long size = rb->used_length >> TARGET_PAGE_BITS;
+    unsigned long *bitmap = rb->bmap;
+    unsigned long first, next;
+
+    *num = 0;
+
+    if (ramblock_is_ignored(rb)) {
+        return size;
+    }
+
+    first = find_next_bit(bitmap, size, start);
+    if (first >= size) {
+        return first;
+    }
+    next = find_next_zero_bit(bitmap, size, first + 1);
+    assert(next >= first);
+    *num = next - first;
+    return first;
+}
+
 static inline bool migration_bitmap_clear_dirty(RAMState *rs,
                                                 RAMBlock *rb,
                                                 unsigned long page)
@@ -3886,19 +3921,26 @@ void colo_flush_ram_cache(void)
         block = QLIST_FIRST_RCU(&ram_list.blocks);
 
         while (block) {
-            offset = migration_bitmap_find_dirty(ram_state, block, offset);
+            unsigned long num = 0;
 
+            offset = colo_bitmap_find_dirty(ram_state, block, offset, &num);
             if (!offset_in_ramblock(block,
                                     ((ram_addr_t)offset) << TARGET_PAGE_BITS)) {
                 offset = 0;
+                num = 0;
                 block = QLIST_NEXT_RCU(block, next);
             } else {
-                migration_bitmap_clear_dirty(ram_state, block, offset);
+                unsigned long i = 0;
+
+                for (i = 0; i < num; i++) {
+                    migration_bitmap_clear_dirty(ram_state, block, offset + i);
+                }
                 dst_host = block->host
                          + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
                 src_host = block->colo_cache
                          + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
-                memcpy(dst_host, src_host, TARGET_PAGE_SIZE);
+                memcpy(dst_host, src_host, TARGET_PAGE_SIZE * num);
+                offset += num;
             }
         }
     }
-- 
2.33.1



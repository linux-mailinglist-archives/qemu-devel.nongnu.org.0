Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1727440ACE9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:58:31 +0200 (CEST)
Received: from localhost ([::1]:56260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ753-0006oB-P9
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mQ6z0-0005IU-Ec
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:52:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mQ6yu-0007Nl-AK
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631620327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xiin61qQHRQJuFfJtZIvj/8PDAv1mtm9Lzc4rxWOruY=;
 b=NosT5jVJQMLuxVzxDi9SXtYvqcGgkBtNI/ETd3sTbkVGfRwZrAxD5LF6Cf+uO6k4KGSplb
 Iyv8+z4DaT8vnk5a9/3rkgSLfSnEdpLBbi1FBbzS6RT55oTjckRpxZNPVb8xFckL1iILN2
 qTRE6aNGOX2TSNCdFOHO2wT384aZLT0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-Zx1B-oW8PDiQHqn0cLjhVg-1; Tue, 14 Sep 2021 07:52:06 -0400
X-MC-Unique: Zx1B-oW8PDiQHqn0cLjhVg-1
Received: by mail-wr1-f70.google.com with SMTP id
 m1-20020a056000180100b0015e1ec30ac3so576088wrh.8
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 04:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xiin61qQHRQJuFfJtZIvj/8PDAv1mtm9Lzc4rxWOruY=;
 b=iMa5fyeAGytVZ1a+H73fNDNd2JMlYb8fFiSieLD7dlvuwtRmTtch9nybsQFSs5jFmi
 m+PmaEias4TDf4wzcoOuPEIGEXHqZzwYEPAImbeA96WTI9UFjaHqwFCjTJHj0X6VvpQ5
 TmSgcWq7ZfzenkfLF2dBsEbMcgoOJn389mluncIugOC1+gF6me3j4yKe98N1FT9HcsEK
 Xd/4RKvQTn8RdGFfhAjARcLe+cXCRhv59lWQva/bKX/eW9UZ6KAlgmB+ZZxRSweBoLuG
 n4CXv90Xrbo0Y8B0Aen3gLdgZX99CmtBLcMvhcsp5lSG7ifL5pEM0kSUHdQETQWP3JqJ
 8mow==
X-Gm-Message-State: AOAM531cuqG87ZUEu8FIKGpYu+znJmqykIekip/MjZ9Q9xVNhuUWA/o2
 WnZJZzWnd1Np3Gr1CFAJK7wZDt+fBn0f2CP+gjsGTPwam/JnEJ94OPgBfun08hGZyGFl2qqITx+
 WkJQUZzKbGCJdrpdnKCjDczS3ma3iCuJsVa1Rz1Ft58FjoiOauzRFz8WsPgQX8guu3uY=
X-Received: by 2002:a1c:a94a:: with SMTP id s71mr1724112wme.32.1631620325440; 
 Tue, 14 Sep 2021 04:52:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbsN00r2NRbe2A3OFgGAMKFhWY/yMOVIr+d7cIJTwKJ8+Ca/8sBJTAKo7idmF++0iJaCBMsw==
X-Received: by 2002:a1c:a94a:: with SMTP id s71mr1724071wme.32.1631620325107; 
 Tue, 14 Sep 2021 04:52:05 -0700 (PDT)
Received: from localhost (static-109-144-85-188.ipcom.comunitel.net.
 [188.85.144.109])
 by smtp.gmail.com with ESMTPSA id q11sm919335wmc.41.2021.09.14.04.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 04:52:04 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] migration/ram: Don't passs RAMState to
 migration_clear_memory_region_dirty_bitmap_*()
Date: Tue, 14 Sep 2021 13:51:57 +0200
Message-Id: <20210914115157.35868-6-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210914115157.35868-1-quintela@redhat.com>
References: <20210914115157.35868-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

The parameter is unused, let's drop it.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7a43bfd7af..bb908822d5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -789,8 +789,7 @@ unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
     return find_next_bit(bitmap, size, start);
 }
 
-static void migration_clear_memory_region_dirty_bitmap(RAMState *rs,
-                                                       RAMBlock *rb,
+static void migration_clear_memory_region_dirty_bitmap(RAMBlock *rb,
                                                        unsigned long page)
 {
     uint8_t shift;
@@ -818,8 +817,7 @@ static void migration_clear_memory_region_dirty_bitmap(RAMState *rs,
 }
 
 static void
-migration_clear_memory_region_dirty_bitmap_range(RAMState *rs,
-                                                 RAMBlock *rb,
+migration_clear_memory_region_dirty_bitmap_range(RAMBlock *rb,
                                                  unsigned long start,
                                                  unsigned long npages)
 {
@@ -832,7 +830,7 @@ migration_clear_memory_region_dirty_bitmap_range(RAMState *rs,
      * exclusive.
      */
     for (i = chunk_start; i < chunk_end; i += chunk_pages) {
-        migration_clear_memory_region_dirty_bitmap(rs, rb, i);
+        migration_clear_memory_region_dirty_bitmap(rb, i);
     }
 }
 
@@ -850,7 +848,7 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
      * the page in the chunk we clear the remote dirty bitmap for all.
      * Clearing it earlier won't be a problem, but too late will.
      */
-    migration_clear_memory_region_dirty_bitmap(rs, rb, page);
+    migration_clear_memory_region_dirty_bitmap(rb, page);
 
     ret = test_and_clear_bit(page, rb->bmap);
     if (ret) {
@@ -2777,8 +2775,7 @@ void qemu_guest_free_page_hint(void *addr, size_t len)
          * are initially set. Otherwise those skipped pages will be sent in
          * the next round after syncing from the memory region bitmap.
          */
-        migration_clear_memory_region_dirty_bitmap_range(ram_state, block,
-                                                         start, npages);
+        migration_clear_memory_region_dirty_bitmap_range(block, start, npages);
         ram_state->migration_dirty_pages -=
                       bitmap_count_one_with_offset(block->bmap, start, npages);
         bitmap_clear(block->bmap, start, npages);
-- 
2.31.1



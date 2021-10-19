Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0C4433275
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:38:04 +0200 (CEST)
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclZL-0008MA-HD
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclR7-0004PO-Ko
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQr-0005dZ-9d
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634635756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xiin61qQHRQJuFfJtZIvj/8PDAv1mtm9Lzc4rxWOruY=;
 b=dRlJmDo6G97noKFGlkvWBzG3xsN7I4+UE9BQa76DdoIF0+uxZkAOc3825uDkcWLIN2WUoR
 JgR+vqSoIsl2P2i2Ioq/36UQ4h4F7wu68L5l8HrEIvlMfk05qElq+4o11HgGlB9alFOndJ
 n19/UcBWEhtZZbKCzzuVugbY3KQC9Dw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-WJliWjDBPm2OzsX9a8MIiw-1; Tue, 19 Oct 2021 05:29:15 -0400
X-MC-Unique: WJliWjDBPm2OzsX9a8MIiw-1
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso608124wmq.0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xiin61qQHRQJuFfJtZIvj/8PDAv1mtm9Lzc4rxWOruY=;
 b=hnRW3DN4IQMY3kJoPbgZw9m1rWrkqiJ1n+lIU5vzPo2mFpbAMpe1rJYrGACO2eqz4U
 AghaPr4+7JZlYwEzV2dnsifjUq+gr1X3HwD0pS+Aa7t7aGIGT2GdliX3B3janoo1gPzc
 8jfYRNsDtPf+2kvp87Ti3eNzz0oQVscrHPdx03Mg0myEb6maJk+l0G3qo2UWh2TSp2v0
 42JZhu+BkhdxaIX1VFRJTU8T2wwLb0B+oCXu5YKgkyrm+fEGF2q9xq4wDLDa4mQTWP95
 fC3qSFGwiap7PvWQKlt8FY0to5Iyjx8Gc1g34eSlmCmkj0/W5kqfdMIO6oeBiZkoRpV7
 RP4g==
X-Gm-Message-State: AOAM533BeNGzd+tyjyWAS1eEzY0YQiM/NIzGV1iePL8eJNMhlSku14Sd
 k3lqiN2IgH1NYz0xLPcGJoFaoxJDTCRShw4V4lQhayuHlSmqG1VsKUwMPIjLAhcoOaUIxUZD2g7
 xrRof0gQBfTTwc/E+P08UO3rEaPaxLDX651rN395Cz26UDU3oHkI7ETR+wYKhcxleAAA=
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr4788630wmo.125.1634635754121; 
 Tue, 19 Oct 2021 02:29:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydWRELIJrwDPwo8c3E131bNzk6+8/WlO7ZY7+nhTRe/zqlURFJru1WcqDvMBbReNwR5kv1LQ==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr4788604wmo.125.1634635753910; 
 Tue, 19 Oct 2021 02:29:13 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id c185sm1749652wma.8.2021.10.19.02.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:29:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] migration/ram: Don't passs RAMState to
 migration_clear_memory_region_dirty_bitmap_*()
Date: Tue, 19 Oct 2021 11:29:03 +0200
Message-Id: <20211019092907.5255-4-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019092907.5255-1-quintela@redhat.com>
References: <20211019092907.5255-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E666E404890
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:37:57 +0200 (CEST)
Received: from localhost ([::1]:49938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHRM-0002Wy-RY
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNc-000397-5F
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:34:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNU-0002vW-Vp
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631183636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xiin61qQHRQJuFfJtZIvj/8PDAv1mtm9Lzc4rxWOruY=;
 b=MWYfXL/E5lT6gNEvt+I+1Hb2jD8Vd4KvcHKSOlhtvQ4xojjQdCozZjhArSZHRU3QGcuv0d
 7m/yn3Cr9bnvLEjTyZgjmqkNNQnvUTSa/khBKXX1lfdldXk93vPxvfe61cHWspw45jZhhv
 UVuiYb6sf1NOmaMkuxN3ltYFcGHbjUo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-ZLbDSfPFNxacrlNsrPMQhw-1; Thu, 09 Sep 2021 06:33:55 -0400
X-MC-Unique: ZLbDSfPFNxacrlNsrPMQhw-1
Received: by mail-wr1-f71.google.com with SMTP id
 u2-20020adfdd42000000b001579f5d6779so364393wrm.8
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 03:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xiin61qQHRQJuFfJtZIvj/8PDAv1mtm9Lzc4rxWOruY=;
 b=mJeYxq7HXY09oLxmQ7x2Xdkrf7AdYCXqhYk0pcFW9/1cx/IPQRejBGNm2bOjFXDL8S
 rGhY9fjagMfZ/YUj/JkK+P6GFT5grMVFbWvWqGz2XkYt1tLC9SaWjDcdklLpeptwmrZS
 ahNcX3/PFQSVMe+35DHi5hWhgNigQ5WR9xl6Zaq6uJSlFGQedEjwWg9L+Bf614jw1hIY
 Sg6pXiZcQSZ/B5YlWY8LgC2MME3D0i93VB/nQ19gA5dZNGgSjrHMLp/ih++GngvKsWHQ
 7YlxWXLKEhEJ998ZXJEBdinMtG6VOk81ZiOkEXbzySY4GbTvTWMGg9ELUpidVp0ogGQP
 rDCA==
X-Gm-Message-State: AOAM532jNMa0qGR3ymkH3wOp32C4RvpOmTe39aCw8NVhSF8d1b2p30CJ
 8FX6oOESOOu3lBAZNaZ6MaQPA6LsRZ1iEC20iUVOy+AcIAdi9IDuGJm134+aWuVNm3Uyiz+VuPY
 ws32I9YSKVLwFz9+7GehfgckFldqdZreAe16ADNJBtIacLSexmZEdGpIiY3shbHIcT4w=
X-Received: by 2002:adf:e40b:: with SMTP id g11mr1041071wrm.313.1631183634025; 
 Thu, 09 Sep 2021 03:33:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD/X/bIM2THfPYJFbhDVOR3Wo3k23zLVsZ00dQz2tG9BNnglYqzmZofyjdxgkwGJZ5yHFFJw==
X-Received: by 2002:adf:e40b:: with SMTP id g11mr1041040wrm.313.1631183633704; 
 Thu, 09 Sep 2021 03:33:53 -0700 (PDT)
Received: from localhost (static-201-64-63-95.ipcom.comunitel.net.
 [95.63.64.201])
 by smtp.gmail.com with ESMTPSA id d9sm1714852wrb.36.2021.09.09.03.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 03:33:53 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] migration/ram: Don't passs RAMState to
 migration_clear_memory_region_dirty_bitmap_*()
Date: Thu,  9 Sep 2021 12:33:44 +0200
Message-Id: <20210909103346.1990-6-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909103346.1990-1-quintela@redhat.com>
References: <20210909103346.1990-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



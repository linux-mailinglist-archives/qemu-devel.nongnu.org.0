Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA55A527D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:02:48 +0200 (CEST)
Received: from localhost ([::1]:34018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSi9v-0008Fx-Jc
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4X-0002ci-Hr
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4U-0008FW-62
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661792227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQ5Ra+ruvStjfFrbVSdey9x+7/jgCpP+KsGMmIk95tM=;
 b=YJKVzIPb/DmfjSXPq4W820nSi1iG9L0xi8ctB6NUW1+4HkbGgtHq/NA2G4WWHpk7h35obR
 r8g+g5EAgPxVgw6xEhLgcIqW3tlpQfnx+5RCk2xqeVN5eztj3hTP9VAmDSFk4t8N7fZMcZ
 fWKjq/k8M4ViO2AyQlVznmArwvu4HaM=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-418-IDmkA_NUOx-SXvcYUtVBbg-1; Mon, 29 Aug 2022 12:57:06 -0400
X-MC-Unique: IDmkA_NUOx-SXvcYUtVBbg-1
Received: by mail-io1-f72.google.com with SMTP id
 o10-20020a6b5a0a000000b0068aba769d73so5057234iob.4
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 09:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=iQ5Ra+ruvStjfFrbVSdey9x+7/jgCpP+KsGMmIk95tM=;
 b=z1W+jAhEdvuo7+qPCS2vwO/TJMZphG1LFoc6i9eCVReYmflp+eZ68Qf0TEaV1Cw+iY
 DmdT+69djnYq+/H//yVOOfieFt8OCyzzerteLmxHcvKu9vePfyWY71NEfEllyhFG1fJI
 9oT6REz5k9cug5pL9ub73rdcy1BJTaI1/5d3C5YaCdXynHYsBdcuAH1CvvNNWl770OKT
 tpx+R0YKbciqOzPX0pXzhga2ITE+mQ20UJ70W9mpHmO16vGtg+869gVR0z2QzwpVcB5/
 z8ZQlUojmAnnd7iPTSjgYC7sCV29Z35DVMOmj51kUXgUw6rJHg72FsMxeq7vA93E+3Wk
 LnMQ==
X-Gm-Message-State: ACgBeo0VnjMTJchPKfDgYP98ATwkeajen544qcXQtrMyPXHitF6j7euI
 IZekQUqFdKVRPHKGo/mUyTf0fKazEzVUQrfFNJ7B2Jjcf+p0TVx7PoziB2jKNhG/Rfz5ii+BEdM
 rXXCpdd1Pf0HGwda70RMv5mTBfyjckfG+/KE2Q6Qp350KM0loMeEMC7HhceBdRhxT
X-Received: by 2002:a02:29c2:0:b0:34a:195e:9574 with SMTP id
 p185-20020a0229c2000000b0034a195e9574mr10302904jap.79.1661792224972; 
 Mon, 29 Aug 2022 09:57:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7DENDl2POjwg2ICP6sziCNGLmMtWInpPiZoHQUi+oV14X9MJZ1gsgTrMJ85Lcn16BmMzDkLQ==
X-Received: by 2002:a02:29c2:0:b0:34a:195e:9574 with SMTP id
 p185-20020a0229c2000000b0034a195e9574mr10302887jap.79.1661792224701; 
 Mon, 29 Aug 2022 09:57:04 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056638228900b00344c3de5ec7sm4404709jas.150.2022.08.29.09.57.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Aug 2022 09:57:04 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 01/13] migration: Use non-atomic ops for clear log bitmap
Date: Mon, 29 Aug 2022 12:56:47 -0400
Message-Id: <20220829165659.96046-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220829165659.96046-1-peterx@redhat.com>
References: <20220829165659.96046-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we already have bitmap_mutex to protect either the dirty bitmap or
the clear log bitmap, we don't need atomic operations to set/clear/test on
the clear log bitmap.  Switching all ops from atomic to non-atomic
versions, meanwhile touch up the comments to show which lock is in charge.

Introduced non-atomic version of bitmap_test_and_clear_atomic(), mostly the
same as the atomic version but simplified a few places, e.g. dropped the
"old_bits" variable, and also the explicit memory barriers.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/ram_addr.h | 11 +++++-----
 include/qemu/bitmap.h   |  1 +
 util/bitmap.c           | 45 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f3e0c78161..5092a2e0ff 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -42,7 +42,8 @@ static inline long clear_bmap_size(uint64_t pages, uint8_t shift)
 }
 
 /**
- * clear_bmap_set: set clear bitmap for the page range
+ * clear_bmap_set: set clear bitmap for the page range.  Must be with
+ * bitmap_mutex held.
  *
  * @rb: the ramblock to operate on
  * @start: the start page number
@@ -55,12 +56,12 @@ static inline void clear_bmap_set(RAMBlock *rb, uint64_t start,
 {
     uint8_t shift = rb->clear_bmap_shift;
 
-    bitmap_set_atomic(rb->clear_bmap, start >> shift,
-                      clear_bmap_size(npages, shift));
+    bitmap_set(rb->clear_bmap, start >> shift, clear_bmap_size(npages, shift));
 }
 
 /**
- * clear_bmap_test_and_clear: test clear bitmap for the page, clear if set
+ * clear_bmap_test_and_clear: test clear bitmap for the page, clear if set.
+ * Must be with bitmap_mutex held.
  *
  * @rb: the ramblock to operate on
  * @page: the page number to check
@@ -71,7 +72,7 @@ static inline bool clear_bmap_test_and_clear(RAMBlock *rb, uint64_t page)
 {
     uint8_t shift = rb->clear_bmap_shift;
 
-    return bitmap_test_and_clear_atomic(rb->clear_bmap, page >> shift, 1);
+    return bitmap_test_and_clear(rb->clear_bmap, page >> shift, 1);
 }
 
 static inline bool offset_in_ramblock(RAMBlock *b, ram_addr_t offset)
diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index 82a1d2f41f..3ccb00865f 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -253,6 +253,7 @@ void bitmap_set(unsigned long *map, long i, long len);
 void bitmap_set_atomic(unsigned long *map, long i, long len);
 void bitmap_clear(unsigned long *map, long start, long nr);
 bool bitmap_test_and_clear_atomic(unsigned long *map, long start, long nr);
+bool bitmap_test_and_clear(unsigned long *map, long start, long nr);
 void bitmap_copy_and_clear_atomic(unsigned long *dst, unsigned long *src,
                                   long nr);
 unsigned long bitmap_find_next_zero_area(unsigned long *map,
diff --git a/util/bitmap.c b/util/bitmap.c
index f81d8057a7..8d12e90a5a 100644
--- a/util/bitmap.c
+++ b/util/bitmap.c
@@ -240,6 +240,51 @@ void bitmap_clear(unsigned long *map, long start, long nr)
     }
 }
 
+bool bitmap_test_and_clear(unsigned long *map, long start, long nr)
+{
+    unsigned long *p = map + BIT_WORD(start);
+    const long size = start + nr;
+    int bits_to_clear = BITS_PER_LONG - (start % BITS_PER_LONG);
+    unsigned long mask_to_clear = BITMAP_FIRST_WORD_MASK(start);
+    bool dirty = false;
+
+    assert(start >= 0 && nr >= 0);
+
+    /* First word */
+    if (nr - bits_to_clear > 0) {
+        if ((*p) & mask_to_clear) {
+            dirty = true;
+        }
+        *p &= ~mask_to_clear;
+        nr -= bits_to_clear;
+        bits_to_clear = BITS_PER_LONG;
+        p++;
+    }
+
+    /* Full words */
+    if (bits_to_clear == BITS_PER_LONG) {
+        while (nr >= BITS_PER_LONG) {
+            if (*p) {
+                dirty = true;
+                *p = 0;
+            }
+            nr -= BITS_PER_LONG;
+            p++;
+        }
+    }
+
+    /* Last word */
+    if (nr) {
+        mask_to_clear &= BITMAP_LAST_WORD_MASK(size);
+        if ((*p) & mask_to_clear) {
+            dirty = true;
+        }
+        *p &= ~mask_to_clear;
+    }
+
+    return dirty;
+}
+
 bool bitmap_test_and_clear_atomic(unsigned long *map, long start, long nr)
 {
     unsigned long *p = map + BIT_WORD(start);
-- 
2.32.0



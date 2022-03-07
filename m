Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34BE4CFCF9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:32:54 +0100 (CET)
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBbh-00069S-TD
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:32:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjB-0005Bd-IV
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAj9-0008Hi-5C
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NhD4JDjBPDIhVgKGrfRj+2tH5hO7FhL7KXXo/YmXk1g=;
 b=dBE4XWTFW8wHsFM1FSewQ3xXSjJWre+f/WwMK3jORijnHi0H9XsOJoMgiW4W133BNBa2eV
 x6dBktUSOkzeS6quoRsmPqYra1CQOXGyaHT4j/zZbfHLCA/AKPiq7i4aB84VfUJzZWgeOx
 j2OH7VjENLEt94uVcBbmY+KeJwjAQf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-8ECoqMepM3Cgur1XbVtYng-1; Mon, 07 Mar 2022 05:36:29 -0500
X-MC-Unique: 8ECoqMepM3Cgur1XbVtYng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80BA31006AA6;
 Mon,  7 Mar 2022 10:36:28 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 286956FB19;
 Mon,  7 Mar 2022 10:36:27 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/23] block/block-copy: add block_copy_reset()
Date: Mon,  7 Mar 2022 11:35:38 +0100
Message-Id: <20220307103549.808809-13-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Split block_copy_reset() out of block_copy_reset_unallocated() to be
used separately later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220303194349.2304213-6-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block-copy.h |  1 +
 block/block-copy.c         | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index b80ad02299..68bbd344b2 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -35,6 +35,7 @@ void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
 
+void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes);
 int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 8aa6ee6a5c..0834e29b6e 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -692,6 +692,18 @@ static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
     }
 }
 
+void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes)
+{
+    QEMU_LOCK_GUARD(&s->lock);
+
+    bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
+    if (s->progress) {
+        progress_set_remaining(s->progress,
+                               bdrv_get_dirty_count(s->copy_bitmap) +
+                               s->in_flight_bytes);
+    }
+}
+
 /*
  * Reset bits in copy_bitmap starting at offset if they represent unallocated
  * data in the image. May reset subsequent contiguous bits.
@@ -712,14 +724,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
     bytes = clusters * s->cluster_size;
 
     if (!ret) {
-        qemu_co_mutex_lock(&s->lock);
-        bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-        if (s->progress) {
-            progress_set_remaining(s->progress,
-                                   bdrv_get_dirty_count(s->copy_bitmap) +
-                                   s->in_flight_bytes);
-        }
-        qemu_co_mutex_unlock(&s->lock);
+        block_copy_reset(s, offset, bytes);
     }
 
     *count = bytes;
-- 
2.34.1



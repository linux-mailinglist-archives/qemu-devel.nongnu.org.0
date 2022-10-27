Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8518161010A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:02:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7iq-0007UT-QQ; Thu, 27 Oct 2022 14:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7h7-0002F0-Gv
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gf-0002dv-Nv
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIV4qzpo8jFBxLNgpn1xZs1ugX5CZD+9vCk/EbiQT1E=;
 b=Jfes2+KGHJ9nicNHnbjq4DfuKxDiBH4i10Xp0U3ifnwDLWNLWXENMd4WEhRp5BC6Q2oHR1
 hStAIN9sQqlaxRJonXM8IhEnaXHLahNW+eZKo0+nxxRDm9u9y2T3u3ArBibtGYbWyyaLRQ
 Cki0yq1K6uyd/RBc7Dh9B4Z02Li4WNQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-bZYsw72kMQiPeumEYo_q9g-1; Thu, 27 Oct 2022 14:33:00 -0400
X-MC-Unique: bZYsw72kMQiPeumEYo_q9g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 536E3101A528;
 Thu, 27 Oct 2022 18:33:00 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92C671121320;
 Thu, 27 Oct 2022 18:32:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 50/58] parallels: switch to *_co_* functions
Date: Thu, 27 Oct 2022 20:31:38 +0200
Message-Id: <20221027183146.463129-51-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-18-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/parallels.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 27c81cee40..892e9ec8d9 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -205,18 +205,18 @@ static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
          * force the safer-but-slower fallocate.
          */
         if (s->prealloc_mode == PRL_PREALLOC_MODE_TRUNCATE) {
-            ret = bdrv_truncate(bs->file,
-                                (s->data_end + space) << BDRV_SECTOR_BITS,
-                                false, PREALLOC_MODE_OFF, BDRV_REQ_ZERO_WRITE,
-                                NULL);
+            ret = bdrv_co_truncate(bs->file,
+                                   (s->data_end + space) << BDRV_SECTOR_BITS,
+                                   false, PREALLOC_MODE_OFF,
+                                   BDRV_REQ_ZERO_WRITE, NULL);
             if (ret == -ENOTSUP) {
                 s->prealloc_mode = PRL_PREALLOC_MODE_FALLOCATE;
             }
         }
         if (s->prealloc_mode == PRL_PREALLOC_MODE_FALLOCATE) {
-            ret = bdrv_pwrite_zeroes(bs->file,
-                                     s->data_end << BDRV_SECTOR_BITS,
-                                     space << BDRV_SECTOR_BITS, 0);
+            ret = bdrv_co_pwrite_zeroes(bs->file,
+                                        s->data_end << BDRV_SECTOR_BITS,
+                                        space << BDRV_SECTOR_BITS, 0);
         }
         if (ret < 0) {
             return ret;
@@ -278,8 +278,8 @@ static coroutine_fn int parallels_co_flush_to_os(BlockDriverState *bs)
         if (off + to_write > s->header_size) {
             to_write = s->header_size - off;
         }
-        ret = bdrv_pwrite(bs->file, off, to_write, (uint8_t *)s->header + off,
-                          0);
+        ret = bdrv_co_pwrite(bs->file, off, to_write,
+                             (uint8_t *)s->header + off, 0);
         if (ret < 0) {
             qemu_co_mutex_unlock(&s->lock);
             return ret;
@@ -504,8 +504,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
              * In order to really repair the image, we must shrink it.
              * That means we have to pass exact=true.
              */
-            ret = bdrv_truncate(bs->file, res->image_end_offset, true,
-                                PREALLOC_MODE_OFF, 0, &local_err);
+            ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
+                                   PREALLOC_MODE_OFF, 0, &local_err);
             if (ret < 0) {
                 error_report_err(local_err);
                 res->check_errors++;
@@ -600,12 +600,12 @@ static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
     memset(tmp, 0, sizeof(tmp));
     memcpy(tmp, &header, sizeof(header));
 
-    ret = blk_pwrite(blk, 0, BDRV_SECTOR_SIZE, tmp, 0);
+    ret = blk_co_pwrite(blk, 0, BDRV_SECTOR_SIZE, tmp, 0);
     if (ret < 0) {
         goto exit;
     }
-    ret = blk_pwrite_zeroes(blk, BDRV_SECTOR_SIZE,
-                            (bat_sectors - 1) << BDRV_SECTOR_BITS, 0);
+    ret = blk_co_pwrite_zeroes(blk, BDRV_SECTOR_SIZE,
+                               (bat_sectors - 1) << BDRV_SECTOR_BITS, 0);
     if (ret < 0) {
         goto exit;
     }
-- 
2.37.3



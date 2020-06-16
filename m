Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3841FB474
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:32:48 +0200 (CEST)
Received: from localhost ([::1]:47358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCdr-0000gt-Aa
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCPd-000227-0R; Tue, 16 Jun 2020 10:18:07 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:39447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCPb-0006dZ-8o; Tue, 16 Jun 2020 10:18:04 -0400
Received: by mail-ot1-x335.google.com with SMTP id g5so16040760otg.6;
 Tue, 16 Jun 2020 07:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uo5NBIm2cxnhSjvYiJ5dgn9L44biFO1V2yRV8iP8HBw=;
 b=niBW7Q0VARkBS49zf41NK7miUfUOSWoHf5dpeRNv0HPIddYBI99pW6fbOdP6QCKgv1
 fnj99th3S+srHe22TtWNG1t85aJx5vDBwsnGle3NLUDB86QGBJTWWOfnYdFS8mxlgg9e
 fJuCnV3W2brvSKvqVdaTvvgqwnyMibweovK8hRbzVVEGXmR3oVAPQ2MVfF1GwnjbCucQ
 WzlSXUpE61J0zv0kw0xRkPzCwVOBW/8+0zT+oAFyTImFoKpqTv3nroWeZWn7msYoaHhf
 Jm3PXlIazO20S+cgb/E22/VZDgKc2kSFB7uALvgTfZ+7Qt6h320OE9lxRR65EHSAZh1v
 +2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=uo5NBIm2cxnhSjvYiJ5dgn9L44biFO1V2yRV8iP8HBw=;
 b=KrvJ7Y8krzrsA53ZZdEJ+UCxk/pYFPpHxULX5dPuijAuFDdQTOIUdbVzusJXS71Sfr
 P79g37nafKBHS62eEvUGg5zXif6C3abPtSUmdX/FFasNOnu+wYqcTKFfIfkGwczDgRZ5
 9w5GTwvVQ+4IgBfPU9fVZGh0uTpz7IF10S0YriiALftONUDUwo49dwZcQN3Gg8GyGmgd
 qwXvSn6i0DgV55K7qXWT97EIqAIbkbUYjxxHgZitQWvGP23y94VoTLFx/ikCGgnQzj9h
 IuaLAyrKFlEF9fn3f22vNGGM+2CrwLmmxutTUqdqBHKMuxKhpyedPD4v2fLeq/yXv/lA
 kbYA==
X-Gm-Message-State: AOAM532dsrITsX4w6+bh2eyd4iJUkXQNm7GqCpoYNE3QT2bEh8x35kVZ
 Ywa1RjAo9/bwrG7w6Q3ZSWptef4V
X-Google-Smtp-Source: ABdhPJzIUDQHE8ptc01vYFwEOmF/oMXNoD2XIky0GmCKk4yfAOCTSoGxFMC/m3s2tFlOMbclywLX3A==
X-Received: by 2002:a05:6830:4c4:: with SMTP id
 s4mr2513231otd.72.1592317081192; 
 Tue, 16 Jun 2020 07:18:01 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id l195sm4210549oib.40.2020.06.16.07.18.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:18:00 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/78] qcow2-bitmaps: fix qcow2_can_store_new_dirty_bitmap
Date: Tue, 16 Jun 2020 09:14:55 -0500
Message-Id: <20200616141547.24664-27-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-stable@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

qcow2_can_store_new_dirty_bitmap works wrong, as it considers only
bitmaps already stored in the qcow2 image and ignores persistent
BdrvDirtyBitmap objects.

So, let's instead count persistent BdrvDirtyBitmaps. We load all qcow2
bitmaps on open, so there should not be any bitmap in the image for
which we don't have BdrvDirtyBitmaps version. If it is - it's a kind of
corruption, and no reason to check for corruptions here (open() and
close() are better places for it).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20191014115126.15360-2-vsementsov@virtuozzo.com
Reviewed-by: Max Reitz <mreitz@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
(cherry picked from commit a1db8733d28d615bc0daeada6c406a6dd5c5d5ef)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 block/qcow2-bitmap.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index c6c8ebbe89..d41f5d049b 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1703,8 +1703,14 @@ bool coroutine_fn qcow2_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
                                                       Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
-    bool found;
-    Qcow2BitmapList *bm_list;
+    BdrvDirtyBitmap *bitmap;
+    uint64_t bitmap_directory_size = 0;
+    uint32_t nb_bitmaps = 0;
+
+    if (bdrv_find_dirty_bitmap(bs, name)) {
+        error_setg(errp, "Bitmap already exists: %s", name);
+        return false;
+    }
 
     if (s->qcow_version < 3) {
         /* Without autoclear_features, we would always have to assume
@@ -1720,38 +1726,27 @@ bool coroutine_fn qcow2_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
         goto fail;
     }
 
-    if (s->nb_bitmaps == 0) {
-        return true;
+    FOR_EACH_DIRTY_BITMAP(bs, bitmap) {
+        if (bdrv_dirty_bitmap_get_persistence(bitmap)) {
+            nb_bitmaps++;
+            bitmap_directory_size +=
+                calc_dir_entry_size(strlen(bdrv_dirty_bitmap_name(bitmap)), 0);
+        }
     }
+    nb_bitmaps++;
+    bitmap_directory_size += calc_dir_entry_size(strlen(name), 0);
 
-    if (s->nb_bitmaps >= QCOW2_MAX_BITMAPS) {
+    if (nb_bitmaps > QCOW2_MAX_BITMAPS) {
         error_setg(errp,
                    "Maximum number of persistent bitmaps is already reached");
         goto fail;
     }
 
-    if (s->bitmap_directory_size + calc_dir_entry_size(strlen(name), 0) >
-        QCOW2_MAX_BITMAP_DIRECTORY_SIZE)
-    {
+    if (bitmap_directory_size > QCOW2_MAX_BITMAP_DIRECTORY_SIZE) {
         error_setg(errp, "Not enough space in the bitmap directory");
         goto fail;
     }
 
-    qemu_co_mutex_lock(&s->lock);
-    bm_list = bitmap_list_load(bs, s->bitmap_directory_offset,
-                               s->bitmap_directory_size, errp);
-    qemu_co_mutex_unlock(&s->lock);
-    if (bm_list == NULL) {
-        goto fail;
-    }
-
-    found = find_bitmap_by_name(bm_list, name);
-    bitmap_list_free(bm_list);
-    if (found) {
-        error_setg(errp, "Bitmap with the same name is already stored");
-        goto fail;
-    }
-
     return true;
 
 fail:
-- 
2.17.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD71339E87F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:33:36 +0200 (CEST)
Received: from localhost ([::1]:39604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLwF-0004PV-UR
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1lqLlI-00026n-GO; Mon, 07 Jun 2021 16:22:16 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1lqLlF-0004lN-IT; Mon, 07 Jun 2021 16:22:16 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q5so19051095wrm.1;
 Mon, 07 Jun 2021 13:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UrBhMUNVv6m9BStZpKSHQzrthLFC0lC1XwEqm2D+7ew=;
 b=qOKy6003ql8bCX4LTH7EWEPAr78ipiI6WlkiSobYGyrULRnalKSTyOQecLu8o2xktw
 K4HtUvg7TCGlyeswvpycU8JnRoBsJzYm8/qQFWgiKw2sGVY6PvHkNQRQJiqqAsQ/Vtem
 p6noQ0FRO703z47vqz3wcPJwM6/K1JLdv7s9I0/mTF2ieI4BxX+8hQtaeMLRzH3I4Eem
 l//1YWZs7UW/Hzviox/GFyMpRDx+UIzehspj57cr/yu1bD5HKLKVt33tpO7jLkB8wFu2
 99V7nDccuPSzoZRKF4Hllmj/qLqkDJRyIPUIIHj8jjbh8Uu91gb8UDZZ+Ys+iY7VjUBt
 dh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UrBhMUNVv6m9BStZpKSHQzrthLFC0lC1XwEqm2D+7ew=;
 b=FaYFFP8h12Mx+pyZ+T57s1fdpTlfU4+fHYIlkBQZK/GVasmVbUr/UIc1q5JaVzVvIc
 Q06cQjt1Lf0mUc1sX9/mplP35aj0aFTgqINVNSYWhzT7F3CfoqDGpbsylFhnrShPcpVT
 AqQyibswcV1o+0jfPjqlnQrAqKVzZnlem3IsXRzUW7yhuSvtXEsFc/YIHpxon9kmKQ5v
 msfyZldfy6tW6RHDX9vkY7vAvP8otPTPZQLFDWaWnQE92uzrlzqDol4aNtW0lQv/pw3f
 FqiZwRUIXeBrMCyuD1K9NRbse6oY6v1vWAmD2k1auyng8XKcyloeJ0jKvjNF4wu6s6pX
 a2wA==
X-Gm-Message-State: AOAM530xMUVlwpOfxCW1PSd8n5rvAdrEyzPZTgST/5FYP0EWQdIAvJxk
 SYRyI0tEprU0xPYxk6Sea0HU7zgkimWqaw==
X-Google-Smtp-Source: ABdhPJzzMs/ew9iOjPHiw/0iziIae8kdJT76DrCGy+X/6PAN+V6jrYBRHAmXmoq1HiTE6xSTTVSfUQ==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr19501489wrs.63.1623097330507; 
 Mon, 07 Jun 2021 13:22:10 -0700 (PDT)
Received: from sparse.redhat.com ([147.161.13.185])
 by smtp.gmail.com with ESMTPSA id t4sm17450979wru.53.2021.06.07.13.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 13:22:09 -0700 (PDT)
From: Nir Soffer <nirsof@gmail.com>
X-Google-Original-From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
Date: Mon,  7 Jun 2021 23:22:04 +0300
Message-Id: <20210607202204.1805199-1-nsoffer@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=nirsof@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When zeroing a cluster in an image with backing file, qemu-img and
qemu-nbd reported the area as a hole. This does not affect the guest
since the area is read as zero, but breaks code trying to reconstruct
the image chain based on qemu-img map or qemu-nbd block status response.

Here is simpler reproducer:

    # Create a qcow2 image with a raw backing file:
    $ qemu-img create base.raw $((4*64*1024))
    $ qemu-img create -f qcow2 -b base.raw -F raw top.qcow2

    # Write to first 3 clusters of base:
    $ qemu-io -f raw -c "write -P 65 0 64k" base.raw
    $ qemu-io -f raw -c "write -P 66 64k 64k" base.raw
    $ qemu-io -f raw -c "write -P 67 128k 64k" base.raw

    # Write to second cluster of top, hiding second cluster of base:
    $ qemu-io -f qcow2 -c "write -P 69 64k 64k" top.qcow2

    # Write zeroes to third cluster of top, hiding third cluster of base:
    $ qemu-io -f qcow2 -c "write -z 128k 64k" top.qcow2

This creates:

    top:  -D0-
    base: ABC-

How current qemu-img and qemu-nbd report the state:

    $ qemu-img map --output json top.qcow2
    [{ "start": 0, "length": 65536, "depth": 1, "zero": false, "data": true, "offset": 0},
    { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
    { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
    { "start": 196608, "length": 65536, "depth": 1, "zero": true, "data": false, "offset": 196608}]

    $ qemu-nbd -r -t -f qcow2 top.qcow2 &
    $ qemu-img map --output json nbd://localhost
    [{ "start": 0, "length": 131072, "depth": 0, "zero": false, "data": true, "offset": 0},
    { "start": 131072, "length": 131072, "depth": 0, "zero": true, "data": false, "offset": 131072}]

    $ nbdinfo --map nbd://localhost
             0      131072    0  allocated
        131072      131072    3  hole,zero

The third extents is reported as a hole in both cases. In qmeu-nbd the
cluster is merged with forth cluster which is actually a hole.

This is incorrect since if it was a hole, the third cluster would be
exposed to the guest. Programs using qemu-nbd output to reconstruct the
image chain on other storage would be confused and copy only the first 2
cluster. The results of this copy will be an image exposing the third
cluster from the base image, corrupting the guest data.

I found that it can be fixed using BDRV_BLOCK_OFFSET_VALID when
reporting the status of the extent. When we have a valid offset, we
report based on BDRV_BLOCK_DATA. Otherwise we report based on
BDRV_BLOCK_ALLOCATED.

With this fix we get:

    $ build/qemu-img map --output json top.qcow2
    [{ "start": 0, "length": 65536, "depth": 1, "zero": false, "data": true, "offset": 0},
    { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
    { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": true},
    { "start": 196608, "length": 65536, "depth": 1, "zero": true, "data": false, "offset": 196608}]

    $ build/qemu-nbd -r -t -f qcow2 top.qcow2 &
    $ qemu-img map --output json nbd://localhost
    [{ "start": 0, "length": 131072, "depth": 0, "zero": false, "data": true, "offset": 0},
    { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": true, "offset": 131072},
    { "start": 196608, "length": 65536, "depth": 0, "zero": true, "data": false, "offset": 196608}]

    $ nbdinfo --map nbd://localhost
             0      131072    0  allocated
        131072       65536    2  zero
        196608       65536    3  hole,zero

The issue was found by ovirt-imageio functional tests:
https://github.com/oVirt/ovirt-imageio/blob/master/daemon/test/client_test.py

I did not update any of the existing tests, and I'm sure many tests are
missing, and the documentation should change to describe the new
behavior. Posting as is for early review.

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
Resolves: https://bugzilla.redhat.com/1968693
---
 nbd/server.c | 8 ++++++--
 qemu-img.c   | 4 +++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index b60ebc3ab6..adf37905d5 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2127,8 +2127,12 @@ static int blockstatus_to_extents(BlockDriverState *bs, uint64_t offset,
             return ret;
         }
 
-        flags = (ret & BDRV_BLOCK_DATA ? 0 : NBD_STATE_HOLE) |
-                (ret & BDRV_BLOCK_ZERO ? NBD_STATE_ZERO : 0);
+        flags = (ret & BDRV_BLOCK_ZERO ? NBD_STATE_ZERO : 0);
+
+        if (ret & BDRV_BLOCK_OFFSET_VALID)
+            flags |= (ret & BDRV_BLOCK_DATA ? 0 : NBD_STATE_HOLE);
+        else
+            flags |= (ret & BDRV_BLOCK_ALLOCATED ? 0 : NBD_STATE_HOLE);
 
         if (nbd_extent_array_add(ea, num, flags) < 0) {
             return 0;
diff --git a/qemu-img.c b/qemu-img.c
index a5993682aa..6808e12d87 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3039,7 +3039,9 @@ static int get_block_status(BlockDriverState *bs, int64_t offset,
     *e = (MapEntry) {
         .start = offset,
         .length = bytes,
-        .data = !!(ret & BDRV_BLOCK_DATA),
+        .data = !!(has_offset
+            ? ret & BDRV_BLOCK_DATA
+            : ret & BDRV_BLOCK_ALLOCATED),
         .zero = !!(ret & BDRV_BLOCK_ZERO),
         .offset = map,
         .has_offset = has_offset,
-- 
2.26.3



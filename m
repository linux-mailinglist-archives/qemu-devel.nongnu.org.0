Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3F731F0E8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:23:04 +0100 (CET)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCppH-0002JU-40
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCpiP-0005Kd-Bt
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:16:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCpiD-0000Iw-F9
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613679344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCOEY2aazGCOIFvFQIRJGGlpCSBGnj3Ux92aLuQ3nr0=;
 b=BM1h4rIfghQNfhjB4bUyFtXz9QVeTZC8eOoNeJIxaW8Pyuk1Xx+TqWMvU0O73tjz4v+V9f
 0GINFRsuucvIaMbiNWDtKp9kFOasMv6xHPieO2lsC1F9Fpllpp4p6a5d2HwhMejr96hpep
 zKZh74yup6Ct563Bo6EmG15Gw5qIQ+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-AoDuBSwhMnu8XdtqFE8cMw-1; Thu, 18 Feb 2021 15:15:43 -0500
X-MC-Unique: AoDuBSwhMnu8XdtqFE8cMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D103427C1;
 Thu, 18 Feb 2021 20:15:42 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-156.phx2.redhat.com [10.3.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0D045B4B0;
 Thu, 18 Feb 2021 20:15:36 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] nbd/server: Avoid unaligned dirty-bitmap status
Date: Thu, 18 Feb 2021 14:15:27 -0600
Message-Id: <20210218201528.127099-5-eblake@redhat.com>
In-Reply-To: <20210218201528.127099-1-eblake@redhat.com>
References: <20210218201528.127099-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The NBD spec requires that responses to NBD_CMD_BLOCK_STATUS be
aligned to the server's advertised min_block alignment, if the client
agreed to abide by alignments. In general, since dirty bitmap
granularity cannot go below 512, and it is hard to provoke qcow2 to go
above an alignment of 512, this is not an issue. But now that the
block layer can see through filters, it is possible to use blkdebug to
show a scenario where where the server is provoked into supplying a
non-compliant reply, as show in iotest 241.

Thus, it is time to fix the dirty bitmap code to round requests to
aligned boundaries.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c               | 30 ++++++++++++++++++++++++++----
 tests/qemu-iotests/241     |  5 ++---
 tests/qemu-iotests/241.out |  2 +-
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 40847276ca64..31462abaee63 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1,5 +1,5 @@
 /*
- *  Copyright (C) 2016-2020 Red Hat, Inc.
+ *  Copyright (C) 2016-2021 Red Hat, Inc.
  *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
  *
  *  Network Block Device Server Side
@@ -2175,7 +2175,8 @@ static int nbd_co_send_block_status(NBDClient *client, uint64_t handle,
 }

 /* Populate @ea from a dirty bitmap. */
-static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,
+static void bitmap_to_extents(uint32_t align,
+                              BdrvDirtyBitmap *bitmap,
                               uint64_t offset, uint64_t length,
                               NBDExtentArray *es)
 {
@@ -2186,10 +2187,23 @@ static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,
     bdrv_dirty_bitmap_lock(bitmap);

     for (start = offset;
-         bdrv_dirty_bitmap_next_dirty_area(bitmap, start, end, INT32_MAX,
+         bdrv_dirty_bitmap_next_dirty_area(bitmap, start, end,
+                                           INT32_MAX - align + 1,
                                            &dirty_start, &dirty_count);
          start = dirty_start + dirty_count)
     {
+        /*
+         * Round unaligned bits: any transition mid-alignment makes
+         * that entire aligned region appear dirty.
+         */
+        assert(QEMU_IS_ALIGNED(start, align));
+        if (!QEMU_IS_ALIGNED(dirty_start, align)) {
+            dirty_count += dirty_start - QEMU_ALIGN_DOWN(dirty_start, align);
+            dirty_start = QEMU_ALIGN_DOWN(dirty_start, align);
+        }
+        if (!QEMU_IS_ALIGNED(dirty_count, align)) {
+            dirty_count = QEMU_ALIGN_UP(dirty_count, align);
+        }
         if ((nbd_extent_array_add(es, dirty_start - start, 0) < 0) ||
             (nbd_extent_array_add(es, dirty_count, NBD_STATE_DIRTY) < 0))
         {
@@ -2214,7 +2228,15 @@ static int nbd_co_send_bitmap(NBDClient *client, uint64_t handle,
     unsigned int nb_extents = dont_fragment ? 1 : NBD_MAX_BLOCK_STATUS_EXTENTS;
     g_autoptr(NBDExtentArray) ea = nbd_extent_array_new(nb_extents);

-    bitmap_to_extents(bitmap, offset, length, ea);
+    /* Easiest to just refuse to answer an unaligned query */
+    if (client->check_align &&
+        !QEMU_IS_ALIGNED(offset | length, client->check_align)) {
+        return nbd_co_send_structured_error(client, handle, -EINVAL,
+                                            "unaligned dirty bitmap request",
+                                            errp);
+    }
+
+    bitmap_to_extents(client->check_align ?: 1, bitmap, offset, length, ea);

     return nbd_co_send_extents(client, handle, ea, last, context_id, errp);
 }
diff --git a/tests/qemu-iotests/241 b/tests/qemu-iotests/241
index 49e2bc09e5bc..b4d2e1934d66 100755
--- a/tests/qemu-iotests/241
+++ b/tests/qemu-iotests/241
@@ -124,9 +124,8 @@ nbd_server_start_unix_socket -B b0 -A --image-opts \

 TEST_IMG="driver=nbd,server.type=unix,server.path=$nbd_unix_socket"
 $QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '\(size\|min\)'
-# FIXME: this should report a single 4k block of "data":false which translates
-# to the dirty bitmap being set for at least part of the region; "data":true
-# is wrong unless the entire 4k is clean.
+# Reports a single 4k block of "data":false, meaning dirty.  Reporting
+# "data":true would be wrong (the entire region is not clean).
 $QEMU_IMG map --output=json --image-opts \
 	  "$TEST_IMG",x-dirty-bitmap=qemu:dirty-bitmap:b0 | _filter_qemu_img_map
 # Reports a single 4k block of "zero":true,"data":true, meaning allocated
diff --git a/tests/qemu-iotests/241.out b/tests/qemu-iotests/241.out
index 12a899ba9181..2368b71054d3 100644
--- a/tests/qemu-iotests/241.out
+++ b/tests/qemu-iotests/241.out
@@ -43,6 +43,6 @@ wrote 512/512 bytes at offset 512
 Formatting 'TEST_DIR/t.IMGFMT.qcow2', fmt=qcow2 size=4096 backing_file=TEST_DIR/t.IMGFMT.mid backing_fmt=qcow2
   size:  4096
   min block: 4096
-[{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
+[{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": false}]
 [{ "start": 0, "length": 4096, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
 *** done
-- 
2.30.1



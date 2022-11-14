Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D515D628DDE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:01:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouieR-0003XR-IE; Mon, 14 Nov 2022 18:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouids-0001hU-Da
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiGE-0002Mp-RV
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arqevMePL9jAQyKPEZW3LJy1uVj4/5W9Ai4SJGjTr2w=;
 b=YQJg2KGsDpCfrKQioAY42WpgV2XDPbwo0yoTbYS+GbPFKe39ZvYw/f/LbqMWwxRPaE2IJU
 v/skCYKJfodtFTN9+uVL2xp7R6B/8Pl3yKBZJnE8j/OELaxSTI/p0uF9jePezOYfYAO6S2
 GjozBqK6X+kPmSddEH+tbbCn+Re2stQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-Kw0mlnUeNdWlBOVKCDboWw-1; Mon, 14 Nov 2022 17:49:00 -0500
X-MC-Unique: Kw0mlnUeNdWlBOVKCDboWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E7913C0DDD0;
 Mon, 14 Nov 2022 22:49:00 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0840C40AE7EF;
 Mon, 14 Nov 2022 22:48:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v2 08/15] nbd/server: Support 64-bit block status
Date: Mon, 14 Nov 2022 16:48:41 -0600
Message-Id: <20221114224848.2186298-9-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The previous patch handled extended headers by truncating large block
status requests from the client back to 32 bits.  But this is not
ideal; for cases where we can truly determine the status of the entire
image quickly (for example, when reporting the entire image as
non-sparse because we lack the ability to probe for holes), this
causes more network traffic for the client to iterate through 4G
chunks than for us to just report the entire image at once.  For ease
of implementation, if extended headers were negotiated, then we always
reply with 64-bit block status replies, even when the result could
have fit in the older 32-bit block status chunk (clients supporting
extended headers have to be prepared for either chunk type, so
temporarily reverting this patch proves whether a client is
compliant).

For now, all metacontexts that we know how to export never populate
more than 32 bits of information, so we don't have to worry about
NBD_REP_ERR_EXT_HEADER_REQD or filtering during handshake, and we
always send all zeroes for the upper 32 bits of status during
NBD_CMD_BLOCK_STATUS.

Note that we previously had some interesting size-juggling on call
chains, such as:

nbd_co_send_block_status(uint32_t length)
-> blockstatus_to_extents(uint32_t bytes)
  -> bdrv_block_status_above(bytes, &uint64_t num)
  -> nbd_extent_array_add(uint64_t num)
    -> store num in 32-bit length

But we were lucky that it never overflowed: bdrv_block_status_above
never sets num larger than bytes, and we had previously been capping
'bytes' at 32 bits (either by the protocol, or in the previous patch
with an explicit truncation).  This patch adds some assertions that
ensure we continue to avoid overflowing 32 bits for a narrow client,
while fully utilizing 64-bits all the way through when the client
understands that.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 86 +++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 59 insertions(+), 27 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index b46655b4d8..f21f8098c1 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2145,20 +2145,30 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
 }

 typedef struct NBDExtentArray {
-    NBDExtent *extents;
+    union {
+        NBDStructuredMeta id;
+        NBDStructuredMetaExt meta;
+    };
+    union {
+        NBDExtent *narrow;
+        NBDExtentExt *extents;
+    };
     unsigned int nb_alloc;
     unsigned int count;
     uint64_t total_length;
+    bool extended; /* Whether 64-bit extents are allowed */
     bool can_add;
     bool converted_to_be;
 } NBDExtentArray;

-static NBDExtentArray *nbd_extent_array_new(unsigned int nb_alloc)
+static NBDExtentArray *nbd_extent_array_new(unsigned int nb_alloc,
+                                            bool extended)
 {
     NBDExtentArray *ea = g_new0(NBDExtentArray, 1);

     ea->nb_alloc = nb_alloc;
-    ea->extents = g_new(NBDExtent, nb_alloc);
+    ea->extents = g_new(NBDExtentExt, nb_alloc);
+    ea->extended = extended;
     ea->can_add = true;

     return ea;
@@ -2172,17 +2182,37 @@ static void nbd_extent_array_free(NBDExtentArray *ea)
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(NBDExtentArray, nbd_extent_array_free)

 /* Further modifications of the array after conversion are abandoned */
-static void nbd_extent_array_convert_to_be(NBDExtentArray *ea)
+static void nbd_extent_array_convert_to_be(NBDExtentArray *ea,
+                                           uint32_t context_id,
+                                           struct iovec *iov)
 {
     int i;

     assert(!ea->converted_to_be);
+    assert(iov[0].iov_base == &ea->meta);
+    assert(iov[1].iov_base == ea->extents);
     ea->can_add = false;
     ea->converted_to_be = true;

-    for (i = 0; i < ea->count; i++) {
-        ea->extents[i].flags = cpu_to_be32(ea->extents[i].flags);
-        ea->extents[i].length = cpu_to_be32(ea->extents[i].length);
+    stl_be_p(&ea->meta.context_id, context_id);
+    if (ea->extended) {
+        stl_be_p(&ea->meta.count, ea->count);
+        for (i = 0; i < ea->count; i++) {
+            ea->extents[i].length = cpu_to_be64(ea->extents[i].length);
+            ea->extents[i].flags = cpu_to_be64(ea->extents[i].flags);
+        }
+        iov[0].iov_len = sizeof(ea->meta);
+        iov[1].iov_len = ea->count * sizeof(ea->extents[0]);
+    } else {
+        /* Conversion reduces memory usage, order of iteration matters */
+        for (i = 0; i < ea->count; i++) {
+            assert(ea->extents[i].length <= UINT32_MAX);
+            assert((uint32_t) ea->extents[i].flags == ea->extents[i].flags);
+            ea->narrow[i].length = cpu_to_be32(ea->extents[i].length);
+            ea->narrow[i].flags = cpu_to_be32(ea->extents[i].flags);
+        }
+        iov[0].iov_len = sizeof(ea->id);
+        iov[1].iov_len = ea->count * sizeof(ea->narrow[0]);
     }
 }

@@ -2196,19 +2226,23 @@ static void nbd_extent_array_convert_to_be(NBDExtentArray *ea)
  * would result in an incorrect range reported to the client)
  */
 static int nbd_extent_array_add(NBDExtentArray *ea,
-                                uint32_t length, uint32_t flags)
+                                uint64_t length, uint32_t flags)
 {
     assert(ea->can_add);

     if (!length) {
         return 0;
     }
+    if (!ea->extended) {
+        assert(length <= UINT32_MAX);
+    }

     /* Extend previous extent if flags are the same */
     if (ea->count > 0 && flags == ea->extents[ea->count - 1].flags) {
-        uint64_t sum = (uint64_t)length + ea->extents[ea->count - 1].length;
+        uint64_t sum = length + ea->extents[ea->count - 1].length;

-        if (sum <= UINT32_MAX) {
+        assert(sum >= length);
+        if (sum <= UINT32_MAX || ea->extended) {
             ea->extents[ea->count - 1].length = sum;
             ea->total_length += length;
             return 0;
@@ -2221,7 +2255,7 @@ static int nbd_extent_array_add(NBDExtentArray *ea,
     }

     ea->total_length += length;
-    ea->extents[ea->count] = (NBDExtent) {.length = length, .flags = flags};
+    ea->extents[ea->count] = (NBDExtentExt) {.length = length, .flags = flags};
     ea->count++;

     return 0;
@@ -2288,21 +2322,20 @@ static int nbd_co_send_extents(NBDClient *client, NBDRequest *request,
                                bool last, uint32_t context_id, Error **errp)
 {
     NBDReply hdr;
-    NBDStructuredMeta chunk;
     struct iovec iov[] = {
         {.iov_base = &hdr},
-        {.iov_base = &chunk, .iov_len = sizeof(chunk)},
-        {.iov_base = ea->extents, .iov_len = ea->count * sizeof(ea->extents[0])}
+        {.iov_base = &ea->meta},
+        {.iov_base = ea->extents}
     };

-    nbd_extent_array_convert_to_be(ea);
+    nbd_extent_array_convert_to_be(ea, context_id, &iov[1]);

     trace_nbd_co_send_extents(request->handle, ea->count, context_id,
                               ea->total_length, last);
     set_be_chunk(client, &iov[0], last ? NBD_REPLY_FLAG_DONE : 0,
-                 NBD_REPLY_TYPE_BLOCK_STATUS,
+                 client->extended_headers ? NBD_REPLY_TYPE_BLOCK_STATUS_EXT
+                 : NBD_REPLY_TYPE_BLOCK_STATUS,
                  request, iov[1].iov_len + iov[2].iov_len);
-    stl_be_p(&chunk.context_id, context_id);

     return nbd_co_send_iov(client, iov, 3, errp);
 }
@@ -2310,13 +2343,14 @@ static int nbd_co_send_extents(NBDClient *client, NBDRequest *request,
 /* Get block status from the exported device and send it to the client */
 static int nbd_co_send_block_status(NBDClient *client, NBDRequest *request,
                                     BlockDriverState *bs, uint64_t offset,
-                                    uint32_t length, bool dont_fragment,
+                                    uint64_t length, bool dont_fragment,
                                     bool last, uint32_t context_id,
                                     Error **errp)
 {
     int ret;
     unsigned int nb_extents = dont_fragment ? 1 : NBD_MAX_BLOCK_STATUS_EXTENTS;
-    g_autoptr(NBDExtentArray) ea = nbd_extent_array_new(nb_extents);
+    g_autoptr(NBDExtentArray) ea =
+        nbd_extent_array_new(nb_extents, client->extended_headers);

     if (context_id == NBD_META_ID_BASE_ALLOCATION) {
         ret = blockstatus_to_extents(bs, offset, length, ea);
@@ -2343,7 +2377,8 @@ static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,
     bdrv_dirty_bitmap_lock(bitmap);

     for (start = offset;
-         bdrv_dirty_bitmap_next_dirty_area(bitmap, start, end, INT32_MAX,
+         bdrv_dirty_bitmap_next_dirty_area(bitmap, start, end,
+                                           es->extended ? INT64_MAX : INT32_MAX,
                                            &dirty_start, &dirty_count);
          start = dirty_start + dirty_count)
     {
@@ -2365,11 +2400,12 @@ static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,

 static int nbd_co_send_bitmap(NBDClient *client, NBDRequest *request,
                               BdrvDirtyBitmap *bitmap, uint64_t offset,
-                              uint32_t length, bool dont_fragment, bool last,
+                              uint64_t length, bool dont_fragment, bool last,
                               uint32_t context_id, Error **errp)
 {
     unsigned int nb_extents = dont_fragment ? 1 : NBD_MAX_BLOCK_STATUS_EXTENTS;
-    g_autoptr(NBDExtentArray) ea = nbd_extent_array_new(nb_extents);
+    g_autoptr(NBDExtentArray) ea =
+        nbd_extent_array_new(nb_extents, client->extended_headers);

     bitmap_to_extents(bitmap, offset, length, ea);

@@ -2665,11 +2701,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             return nbd_send_generic_reply(client, request, -EINVAL,
                                           "need non-zero length", errp);
         }
-        if (request->len > UINT32_MAX) {
-            /* For now, truncate our response to a 32 bit window */
-            request->len = QEMU_ALIGN_DOWN(BDRV_REQUEST_MAX_BYTES,
-                                           client->check_align ?: 1);
-        }
+        assert(client->extended_headers || request->len <= UINT32_MAX);
         if (client->export_meta.count) {
             bool dont_fragment = request->flags & NBD_CMD_FLAG_REQ_ONE;
             int contexts_remaining = client->export_meta.count;
-- 
2.38.1



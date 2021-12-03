Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A7468059
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:27:06 +0100 (CET)
Received: from localhost ([::1]:47534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHxJ-00039K-6V
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHnA-0007lu-GC
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHn4-00039Y-P8
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XL3xf0GX+E6TSHDfhlS+aVqXH9zLrccK26EofTKa6aY=;
 b=VQdOTPj2IUssDMKdKURORYmvgp0wSZRqiXVXe+3lxTr9cQzvwrfnnqYwY+/WUhRj80kcr6
 +/KUEu+OGkltDhJ8D2aaruyilmR1XtdJU7eVXmBw8jEvIfGZy0z6G3eSWqIWeHdNcL0Yup
 /Ihwqx1U1HNrOLJijntKOj042WvW8iA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-0wQoYguXOw2bcK6K2EqpDg-1; Fri, 03 Dec 2021 18:16:26 -0500
X-MC-Unique: 0wQoYguXOw2bcK6K2EqpDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C5DC80402F;
 Fri,  3 Dec 2021 23:16:25 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A977C5D9D5;
 Fri,  3 Dec 2021 23:16:20 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/14] nbd/server: Support 64-bit block status
Date: Fri,  3 Dec 2021 17:15:34 -0600
Message-Id: <20211203231539.3900865-10-eblake@redhat.com>
In-Reply-To: <20211203231539.3900865-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231539.3900865-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, libguestfs@redhat.com,
 qemu-block@nongnu.org, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

Note that we previously had some interesting size-juggling on call
chains, such as:

nbd_co_send_block_status(uint32_t length)
-> blockstatus_to_extends(uint32_t bytes)
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
 nbd/server.c | 72 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 24 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 0e496f60ffbd..7e6140350797 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2106,20 +2106,26 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
 }

 typedef struct NBDExtentArray {
-    NBDExtent *extents;
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
@@ -2133,17 +2139,31 @@ static void nbd_extent_array_free(NBDExtentArray *ea)
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(NBDExtentArray, nbd_extent_array_free);

 /* Further modifications of the array after conversion are abandoned */
-static void nbd_extent_array_convert_to_be(NBDExtentArray *ea)
+static void nbd_extent_array_convert_to_be(NBDExtentArray *ea,
+                                           struct iovec *iov)
 {
     int i;

     assert(!ea->converted_to_be);
+    assert(iov->iov_base == ea->extents);
     ea->can_add = false;
     ea->converted_to_be = true;

-    for (i = 0; i < ea->count; i++) {
-        ea->extents[i].flags = cpu_to_be32(ea->extents[i].flags);
-        ea->extents[i].length = cpu_to_be32(ea->extents[i].length);
+    if (ea->extended) {
+        for (i = 0; i < ea->count; i++) {
+            ea->extents[i].length = cpu_to_be64(ea->extents[i].length);
+            ea->extents[i].flags = cpu_to_be32(ea->extents[i].flags);
+            assert(ea->extents[i]._pad == 0);
+        }
+        iov->iov_len = ea->count * sizeof(ea->extents[0]);
+    } else {
+        /* Conversion reduces memory usage, order of iteration matters */
+        for (i = 0; i < ea->count; i++) {
+            assert(ea->extents[i].length <= UINT32_MAX);
+            ea->narrow[i].length = cpu_to_be32(ea->extents[i].length);
+            ea->narrow[i].flags = cpu_to_be32(ea->extents[i].flags);
+        }
+        iov->iov_len = ea->count * sizeof(ea->narrow[0]);
     }
 }

@@ -2157,19 +2177,23 @@ static void nbd_extent_array_convert_to_be(NBDExtentArray *ea)
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
@@ -2182,7 +2206,7 @@ static int nbd_extent_array_add(NBDExtentArray *ea,
     }

     ea->total_length += length;
-    ea->extents[ea->count] = (NBDExtent) {.length = length, .flags = flags};
+    ea->extents[ea->count] = (NBDExtentExt) {.length = length, .flags = flags};
     ea->count++;

     return 0;
@@ -2253,15 +2277,16 @@ static int nbd_co_send_extents(NBDClient *client, uint64_t handle,
     struct iovec iov[] = {
         {.iov_base = &hdr},
         {.iov_base = &chunk, .iov_len = sizeof(chunk)},
-        {.iov_base = ea->extents, .iov_len = ea->count * sizeof(ea->extents[0])}
+        {.iov_base = ea->extents}
     };

-    nbd_extent_array_convert_to_be(ea);
+    nbd_extent_array_convert_to_be(ea, &iov[2]);

     trace_nbd_co_send_extents(handle, ea->count, context_id, ea->total_length,
                               last);
     set_be_chunk(client, &iov[0], last ? NBD_REPLY_FLAG_DONE : 0,
-                 NBD_REPLY_TYPE_BLOCK_STATUS,
+                 client->extended_headers ? NBD_REPLY_TYPE_BLOCK_STATUS_EXT
+                 : NBD_REPLY_TYPE_BLOCK_STATUS,
                  handle, iov[1].iov_len + iov[2].iov_len);
     stl_be_p(&chunk.context_id, context_id);

@@ -2271,13 +2296,14 @@ static int nbd_co_send_extents(NBDClient *client, uint64_t handle,
 /* Get block status from the exported device and send it to the client */
 static int nbd_co_send_block_status(NBDClient *client, uint64_t handle,
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
@@ -2304,7 +2330,8 @@ static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,
     bdrv_dirty_bitmap_lock(bitmap);

     for (start = offset;
-         bdrv_dirty_bitmap_next_dirty_area(bitmap, start, end, INT32_MAX,
+         bdrv_dirty_bitmap_next_dirty_area(bitmap, start, end,
+                                           es->extended ? INT64_MAX : INT32_MAX,
                                            &dirty_start, &dirty_count);
          start = dirty_start + dirty_count)
     {
@@ -2326,11 +2353,12 @@ static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,

 static int nbd_co_send_bitmap(NBDClient *client, uint64_t handle,
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

@@ -2607,11 +2635,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             return nbd_send_generic_reply(client, request->handle, -EINVAL,
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
2.33.1



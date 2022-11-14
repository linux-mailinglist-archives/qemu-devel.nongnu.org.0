Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46678628D7C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:35:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouie4-0002Hg-Uk; Mon, 14 Nov 2022 18:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidq-0001df-Fe
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiGS-0002RT-Qf
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhXWmjjMMvetiJJGQOaMHI4cWIKTWMJVS4R37MRRDFY=;
 b=HOYPRgc7I/irY9HFg6PFajmibb2GPme/jYwHjLLKrRFxbE+JfONmviRpcTi4Z0bBN1pFpb
 tw2J3MFhiHSOFn8V1q3MNEAEWEJGEA1NFxVzCALCzOe4qiEEmk4o8ZFXHrXxvbo1zKz6v4
 ZaM8Ag23rpdD9H6jyrihoA729i3ZV9k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-HOZzzlkEMVK76COZWP2WeA-1; Mon, 14 Nov 2022 17:48:59 -0500
X-MC-Unique: HOZzzlkEMVK76COZWP2WeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E52D1C08792;
 Mon, 14 Nov 2022 22:48:59 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC33040AE7EF;
 Mon, 14 Nov 2022 22:48:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v2 06/15] nbd/server: Refactor to pass full request around
Date: Mon, 14 Nov 2022 16:48:39 -0600
Message-Id: <20221114224848.2186298-7-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Part of NBD's 64-bit headers extension involves passing the client's
requested offset back as part of the reply header (one reason for this
change: converting absolute offsets stored in
NBD_REPLY_TYPE_OFFSET_DATA to relative offsets within the buffer is
easier if the absolute offset of the buffer is also available).  This
is a refactoring patch to pass the full request around the reply
stack, rather than just the handle, so that later patches can then
access request->from when extended headers are active.  But for this
patch, there are no semantic changes.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 109 ++++++++++++++++++++++++++-------------------------
 1 file changed, 55 insertions(+), 54 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index ad5c2052b5..4d1400430b 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1890,18 +1890,17 @@ static int coroutine_fn nbd_co_send_iov(NBDClient *client, struct iovec *iov,
 }

 static inline void set_be_simple_reply(NBDClient *client, struct iovec *iov,
-                                       uint64_t error, uint64_t handle)
+                                       uint64_t error, NBDRequest *request)
 {
     NBDSimpleReply *reply = iov->iov_base;

     iov->iov_len = sizeof(*reply);
     stl_be_p(&reply->magic, NBD_SIMPLE_REPLY_MAGIC);
     stl_be_p(&reply->error, error);
-    stq_be_p(&reply->handle, handle);
+    stq_be_p(&reply->handle, request->handle);
 }

-static int nbd_co_send_simple_reply(NBDClient *client,
-                                    uint64_t handle,
+static int nbd_co_send_simple_reply(NBDClient *client, NBDRequest *request,
                                     uint32_t error,
                                     void *data,
                                     size_t len,
@@ -1914,16 +1913,16 @@ static int nbd_co_send_simple_reply(NBDClient *client,
         {.iov_base = data, .iov_len = len}
     };

-    trace_nbd_co_send_simple_reply(handle, nbd_err, nbd_err_lookup(nbd_err),
-                                   len);
-    set_be_simple_reply(client, &iov[0], nbd_err, handle);
+    trace_nbd_co_send_simple_reply(request->handle, nbd_err,
+                                   nbd_err_lookup(nbd_err), len);
+    set_be_simple_reply(client, &iov[0], nbd_err, request);

     return nbd_co_send_iov(client, iov, len ? 2 : 1, errp);
 }

 static inline void set_be_chunk(NBDClient *client, struct iovec *iov,
                                 uint16_t flags, uint16_t type,
-                                uint64_t handle, uint32_t length)
+                                NBDRequest *request, uint32_t length)
 {
     NBDStructuredReplyChunk *chunk = iov->iov_base;

@@ -1931,12 +1930,12 @@ static inline void set_be_chunk(NBDClient *client, struct iovec *iov,
     stl_be_p(&chunk->magic, NBD_STRUCTURED_REPLY_MAGIC);
     stw_be_p(&chunk->flags, flags);
     stw_be_p(&chunk->type, type);
-    stq_be_p(&chunk->handle, handle);
+    stq_be_p(&chunk->handle, request->handle);
     stl_be_p(&chunk->length, length);
 }

 static int coroutine_fn nbd_co_send_structured_done(NBDClient *client,
-                                                    uint64_t handle,
+                                                    NBDRequest *request,
                                                     Error **errp)
 {
     NBDReply hdr;
@@ -1944,15 +1943,15 @@ static int coroutine_fn nbd_co_send_structured_done(NBDClient *client,
         {.iov_base = &hdr},
     };

-    trace_nbd_co_send_structured_done(handle);
+    trace_nbd_co_send_structured_done(request->handle);
     set_be_chunk(client, &iov[0], NBD_REPLY_FLAG_DONE,
-                 NBD_REPLY_TYPE_NONE, handle, 0);
+                 NBD_REPLY_TYPE_NONE, request, 0);

     return nbd_co_send_iov(client, iov, 1, errp);
 }

 static int coroutine_fn nbd_co_send_structured_read(NBDClient *client,
-                                                    uint64_t handle,
+                                                    NBDRequest *request,
                                                     uint64_t offset,
                                                     void *data,
                                                     size_t size,
@@ -1968,16 +1967,16 @@ static int coroutine_fn nbd_co_send_structured_read(NBDClient *client,
     };

     assert(size);
-    trace_nbd_co_send_structured_read(handle, offset, data, size);
+    trace_nbd_co_send_structured_read(request->handle, offset, data, size);
     set_be_chunk(client, &iov[0], final ? NBD_REPLY_FLAG_DONE : 0,
-                 NBD_REPLY_TYPE_OFFSET_DATA, handle, iov[1].iov_len + size);
+                 NBD_REPLY_TYPE_OFFSET_DATA, request, iov[1].iov_len + size);
     stq_be_p(&chunk.offset, offset);

     return nbd_co_send_iov(client, iov, 3, errp);
 }

 static int coroutine_fn nbd_co_send_structured_error(NBDClient *client,
-                                                     uint64_t handle,
+                                                     NBDRequest *request,
                                                      uint32_t error,
                                                      const char *msg,
                                                      Error **errp)
@@ -1992,10 +1991,11 @@ static int coroutine_fn nbd_co_send_structured_error(NBDClient *client,
     };

     assert(nbd_err);
-    trace_nbd_co_send_structured_error(handle, nbd_err,
+    trace_nbd_co_send_structured_error(request->handle, nbd_err,
                                        nbd_err_lookup(nbd_err), msg ? msg : "");
     set_be_chunk(client, &iov[0], NBD_REPLY_FLAG_DONE,
-                 NBD_REPLY_TYPE_ERROR, handle, iov[1].iov_len + iov[2].iov_len);
+                 NBD_REPLY_TYPE_ERROR, request,
+                 iov[1].iov_len + iov[2].iov_len);
     stl_be_p(&chunk.error, nbd_err);
     stw_be_p(&chunk.message_length, iov[2].iov_len);

@@ -2007,7 +2007,7 @@ static int coroutine_fn nbd_co_send_structured_error(NBDClient *client,
  * reported to the client, at which point this function succeeds.
  */
 static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
-                                                uint64_t handle,
+                                                NBDRequest *request,
                                                 uint64_t offset,
                                                 uint8_t *data,
                                                 size_t size,
@@ -2029,7 +2029,7 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
             char *msg = g_strdup_printf("unable to check for holes: %s",
                                         strerror(-status));

-            ret = nbd_co_send_structured_error(client, handle, -status, msg,
+            ret = nbd_co_send_structured_error(client, request, -status, msg,
                                                errp);
             g_free(msg);
             return ret;
@@ -2044,12 +2044,12 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
                 {.iov_base = &chunk, .iov_len = sizeof(chunk)},
             };

-            trace_nbd_co_send_structured_read_hole(handle, offset + progress,
+            trace_nbd_co_send_structured_read_hole(request->handle,
+                                                   offset + progress,
                                                    pnum);
             set_be_chunk(client, &iov[0],
                          final ? NBD_REPLY_FLAG_DONE : 0,
-                         NBD_REPLY_TYPE_OFFSET_HOLE,
-                         handle, iov[1].iov_len);
+                         NBD_REPLY_TYPE_OFFSET_HOLE, request, iov[1].iov_len);
             stq_be_p(&chunk.offset, offset + progress);
             stl_be_p(&chunk.length, pnum);
             ret = nbd_co_send_iov(client, iov, 2, errp);
@@ -2060,7 +2060,8 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
                 error_setg_errno(errp, -ret, "reading from file failed");
                 break;
             }
-            ret = nbd_co_send_structured_read(client, handle, offset + progress,
+            ret = nbd_co_send_structured_read(client, request,
+                                              offset + progress,
                                               data + progress, pnum, final,
                                               errp);
         }
@@ -2212,7 +2213,7 @@ static int blockalloc_to_extents(BlockDriverState *bs, uint64_t offset,
  * @ea is converted to BE by the function
  * @last controls whether NBD_REPLY_FLAG_DONE is sent.
  */
-static int nbd_co_send_extents(NBDClient *client, uint64_t handle,
+static int nbd_co_send_extents(NBDClient *client, NBDRequest *request,
                                NBDExtentArray *ea,
                                bool last, uint32_t context_id, Error **errp)
 {
@@ -2226,18 +2227,18 @@ static int nbd_co_send_extents(NBDClient *client, uint64_t handle,

     nbd_extent_array_convert_to_be(ea);

-    trace_nbd_co_send_extents(handle, ea->count, context_id, ea->total_length,
-                              last);
+    trace_nbd_co_send_extents(request->handle, ea->count, context_id,
+                              ea->total_length, last);
     set_be_chunk(client, &iov[0], last ? NBD_REPLY_FLAG_DONE : 0,
                  NBD_REPLY_TYPE_BLOCK_STATUS,
-                 handle, iov[1].iov_len + iov[2].iov_len);
+                 request, iov[1].iov_len + iov[2].iov_len);
     stl_be_p(&chunk.context_id, context_id);

     return nbd_co_send_iov(client, iov, 3, errp);
 }

 /* Get block status from the exported device and send it to the client */
-static int nbd_co_send_block_status(NBDClient *client, uint64_t handle,
+static int nbd_co_send_block_status(NBDClient *client, NBDRequest *request,
                                     BlockDriverState *bs, uint64_t offset,
                                     uint32_t length, bool dont_fragment,
                                     bool last, uint32_t context_id,
@@ -2254,10 +2255,10 @@ static int nbd_co_send_block_status(NBDClient *client, uint64_t handle,
     }
     if (ret < 0) {
         return nbd_co_send_structured_error(
-                client, handle, -ret, "can't get block status", errp);
+                client, request, -ret, "can't get block status", errp);
     }

-    return nbd_co_send_extents(client, handle, ea, last, context_id, errp);
+    return nbd_co_send_extents(client, request, ea, last, context_id, errp);
 }

 /* Populate @ea from a dirty bitmap. */
@@ -2292,7 +2293,7 @@ static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,
     bdrv_dirty_bitmap_unlock(bitmap);
 }

-static int nbd_co_send_bitmap(NBDClient *client, uint64_t handle,
+static int nbd_co_send_bitmap(NBDClient *client, NBDRequest *request,
                               BdrvDirtyBitmap *bitmap, uint64_t offset,
                               uint32_t length, bool dont_fragment, bool last,
                               uint32_t context_id, Error **errp)
@@ -2302,7 +2303,7 @@ static int nbd_co_send_bitmap(NBDClient *client, uint64_t handle,

     bitmap_to_extents(bitmap, offset, length, ea);

-    return nbd_co_send_extents(client, handle, ea, last, context_id, errp);
+    return nbd_co_send_extents(client, request, ea, last, context_id, errp);
 }

 /* nbd_co_receive_request
@@ -2440,16 +2441,16 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
  * Returns 0 if connection is still live, -errno on failure to talk to client
  */
 static coroutine_fn int nbd_send_generic_reply(NBDClient *client,
-                                               uint64_t handle,
+                                               NBDRequest *request,
                                                int ret,
                                                const char *error_msg,
                                                Error **errp)
 {
     if (client->structured_reply && ret < 0) {
-        return nbd_co_send_structured_error(client, handle, -ret, error_msg,
+        return nbd_co_send_structured_error(client, request, -ret, error_msg,
                                             errp);
     } else {
-        return nbd_co_send_simple_reply(client, handle, ret < 0 ? -ret : 0,
+        return nbd_co_send_simple_reply(client, request, ret < 0 ? -ret : 0,
                                         NULL, 0, errp);
     }
 }
@@ -2470,7 +2471,7 @@ static coroutine_fn int nbd_do_cmd_read(NBDClient *client, NBDRequest *request,
     if (request->flags & NBD_CMD_FLAG_FUA) {
         ret = blk_co_flush(exp->common.blk);
         if (ret < 0) {
-            return nbd_send_generic_reply(client, request->handle, ret,
+            return nbd_send_generic_reply(client, request, ret,
                                           "flush failed", errp);
         }
     }
@@ -2478,26 +2479,26 @@ static coroutine_fn int nbd_do_cmd_read(NBDClient *client, NBDRequest *request,
     if (client->structured_reply && !(request->flags & NBD_CMD_FLAG_DF) &&
         request->len)
     {
-        return nbd_co_send_sparse_read(client, request->handle, request->from,
+        return nbd_co_send_sparse_read(client, request, request->from,
                                        data, request->len, errp);
     }

     ret = blk_pread(exp->common.blk, request->from, request->len, data, 0);
     if (ret < 0) {
-        return nbd_send_generic_reply(client, request->handle, ret,
+        return nbd_send_generic_reply(client, request, ret,
                                       "reading from file failed", errp);
     }

     if (client->structured_reply) {
         if (request->len) {
-            return nbd_co_send_structured_read(client, request->handle,
+            return nbd_co_send_structured_read(client, request,
                                                request->from, data,
                                                request->len, true, errp);
         } else {
-            return nbd_co_send_structured_done(client, request->handle, errp);
+            return nbd_co_send_structured_done(client, request, errp);
         }
     } else {
-        return nbd_co_send_simple_reply(client, request->handle, 0,
+        return nbd_co_send_simple_reply(client, request, 0,
                                         data, request->len, errp);
     }
 }
@@ -2521,7 +2522,7 @@ static coroutine_fn int nbd_do_cmd_cache(NBDClient *client, NBDRequest *request,
     ret = blk_co_preadv(exp->common.blk, request->from, request->len,
                         NULL, BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH);

-    return nbd_send_generic_reply(client, request->handle, ret,
+    return nbd_send_generic_reply(client, request, ret,
                                   "caching data failed", errp);
 }

@@ -2553,7 +2554,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
         assert(request->len <= NBD_MAX_BUFFER_SIZE);
         ret = blk_pwrite(exp->common.blk, request->from, request->len, data,
                          flags);
-        return nbd_send_generic_reply(client, request->handle, ret,
+        return nbd_send_generic_reply(client, request, ret,
                                       "writing to file failed", errp);

     case NBD_CMD_WRITE_ZEROES:
@@ -2569,7 +2570,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
         }
         ret = blk_pwrite_zeroes(exp->common.blk, request->from, request->len,
                                 flags);
-        return nbd_send_generic_reply(client, request->handle, ret,
+        return nbd_send_generic_reply(client, request, ret,
                                       "writing to file failed", errp);

     case NBD_CMD_DISC:
@@ -2578,7 +2579,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,

     case NBD_CMD_FLUSH:
         ret = blk_co_flush(exp->common.blk);
-        return nbd_send_generic_reply(client, request->handle, ret,
+        return nbd_send_generic_reply(client, request, ret,
                                       "flush failed", errp);

     case NBD_CMD_TRIM:
@@ -2586,12 +2587,12 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
         if (ret >= 0 && request->flags & NBD_CMD_FLAG_FUA) {
             ret = blk_co_flush(exp->common.blk);
         }
-        return nbd_send_generic_reply(client, request->handle, ret,
+        return nbd_send_generic_reply(client, request, ret,
                                       "discard failed", errp);

     case NBD_CMD_BLOCK_STATUS:
         if (!request->len) {
-            return nbd_send_generic_reply(client, request->handle, -EINVAL,
+            return nbd_send_generic_reply(client, request, -EINVAL,
                                           "need non-zero length", errp);
         }
         assert(request->len <= UINT32_MAX);
@@ -2600,7 +2601,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             int contexts_remaining = client->export_meta.count;

             if (client->export_meta.base_allocation) {
-                ret = nbd_co_send_block_status(client, request->handle,
+                ret = nbd_co_send_block_status(client, request,
                                                blk_bs(exp->common.blk),
                                                request->from,
                                                request->len, dont_fragment,
@@ -2613,7 +2614,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             }

             if (client->export_meta.allocation_depth) {
-                ret = nbd_co_send_block_status(client, request->handle,
+                ret = nbd_co_send_block_status(client, request,
                                                blk_bs(exp->common.blk),
                                                request->from, request->len,
                                                dont_fragment,
@@ -2629,7 +2630,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
                 if (!client->export_meta.bitmaps[i]) {
                     continue;
                 }
-                ret = nbd_co_send_bitmap(client, request->handle,
+                ret = nbd_co_send_bitmap(client, request,
                                          client->exp->export_bitmaps[i],
                                          request->from, request->len,
                                          dont_fragment, !--contexts_remaining,
@@ -2643,7 +2644,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,

             return 0;
         } else {
-            return nbd_send_generic_reply(client, request->handle, -EINVAL,
+            return nbd_send_generic_reply(client, request, -EINVAL,
                                           "CMD_BLOCK_STATUS not negotiated",
                                           errp);
         }
@@ -2651,7 +2652,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
     default:
         msg = g_strdup_printf("invalid request type (%" PRIu32 ") received",
                               request->type);
-        ret = nbd_send_generic_reply(client, request->handle, -EINVAL, msg,
+        ret = nbd_send_generic_reply(client, request, -EINVAL, msg,
                                      errp);
         g_free(msg);
         return ret;
@@ -2712,7 +2713,7 @@ static coroutine_fn void nbd_trip(void *opaque)
         Error *export_err = local_err;

         local_err = NULL;
-        ret = nbd_send_generic_reply(client, request.handle, -EINVAL,
+        ret = nbd_send_generic_reply(client, &request, -EINVAL,
                                      error_get_pretty(export_err), &local_err);
         error_free(export_err);
     } else {
-- 
2.38.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D27468052
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:23:52 +0100 (CET)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHuB-0002qw-CS
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:23:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHnE-0007sp-2m
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHnA-00039w-84
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4d2M5BA91p7+DJAjYJCDI39MXWP4gGbmjmAjOVcJ0kU=;
 b=X1sXiZTjmRMN2pgpejlrZgFgTXWb4bkaoH3ZSr+mWmwjimXcUTTo5gJTaB9C8Zd46V7asT
 NEL/EDv/0lVqtq9rS9y/F9cNyrRjoayG9TcjTevCIqyHPLP6SuR+2F1nhoJLAK3QfAIgDp
 GkuiWsXLRoY/323xuNNoyxr3IC7CpDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-5KLcAAhqNeejpY6Wu7hv_w-1; Fri, 03 Dec 2021 18:16:28 -0500
X-MC-Unique: 5KLcAAhqNeejpY6Wu7hv_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF4A794EE0;
 Fri,  3 Dec 2021 23:16:26 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6DC95D9D5;
 Fri,  3 Dec 2021 23:16:25 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/14] nbd/client: Initial support for extended headers
Date: Fri,  3 Dec 2021 17:15:35 -0600
Message-Id: <20211203231539.3900865-11-eblake@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, nbd@other.debian.org, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the client code to be able to send an extended request, and
parse an extended header from the server.  Note that since we reject
any structured reply with a too-large payload, we can always normalize
a valid header back into the compact form, so that the caller need not
deal with two branches of a union.  Still, until a later patch lets
the client negotiate extended headers, the code added here should not
be reached.  Note that because of the different magic numbers, it is
just as easy to trace and then tolerate a non-compliant server sending
the wrong header reply as it would be to insist that the server is
compliant.

The only caller to nbd_receive_reply() always passed NULL for errp;
since we are changing the signature anyways, I decided to sink the
decision to ignore errors one layer lower.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h |   2 +-
 block/nbd.c         |   3 +-
 nbd/client.c        | 112 +++++++++++++++++++++++++++++++-------------
 nbd/trace-events    |   1 +
 4 files changed, 84 insertions(+), 34 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5f9d86a86352..d489c67d98dc 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -366,7 +366,7 @@ int nbd_init(int fd, QIOChannelSocket *sioc, NBDExportInfo *info,
              Error **errp);
 int nbd_send_request(QIOChannel *ioc, NBDRequest *request, bool ext_hdr);
 int coroutine_fn nbd_receive_reply(BlockDriverState *bs, QIOChannel *ioc,
-                                   NBDReply *reply, Error **errp);
+                                   NBDReply *reply, bool ext_hdrs);
 int nbd_client(int fd);
 int nbd_disconnect(int fd);
 int nbd_errno_to_system_errno(int err);
diff --git a/block/nbd.c b/block/nbd.c
index 3e9875241bec..da5e6ac2d9a5 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -401,7 +401,8 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)

         /* We are under mutex and handle is 0. We have to do the dirty work. */
         assert(s->reply.handle == 0);
-        ret = nbd_receive_reply(s->bs, s->ioc, &s->reply, NULL);
+        ret = nbd_receive_reply(s->bs, s->ioc, &s->reply,
+                                s->info.extended_headers);
         if (ret <= 0) {
             ret = ret ? ret : -EIO;
             nbd_channel_error(s, ret);
diff --git a/nbd/client.c b/nbd/client.c
index aa162b9d08d5..f1aa5256c8bf 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -1347,22 +1347,28 @@ int nbd_disconnect(int fd)

 int nbd_send_request(QIOChannel *ioc, NBDRequest *request, bool ext_hdr)
 {
-    uint8_t buf[NBD_REQUEST_SIZE];
+    uint8_t buf[NBD_REQUEST_EXT_SIZE];
+    size_t len;

-    assert(!ext_hdr);
-    assert(request->len <= UINT32_MAX);
     trace_nbd_send_request(request->from, request->len, request->handle,
                            request->flags, request->type,
                            nbd_cmd_lookup(request->type));

-    stl_be_p(buf, NBD_REQUEST_MAGIC);
+    stl_be_p(buf, ext_hdr ? NBD_REQUEST_EXT_MAGIC : NBD_REQUEST_MAGIC);
     stw_be_p(buf + 4, request->flags);
     stw_be_p(buf + 6, request->type);
     stq_be_p(buf + 8, request->handle);
     stq_be_p(buf + 16, request->from);
-    stl_be_p(buf + 24, request->len);
+    if (ext_hdr) {
+        stq_be_p(buf + 24, request->len);
+        len = NBD_REQUEST_EXT_SIZE;
+    } else {
+        assert(request->len <= UINT32_MAX);
+        stl_be_p(buf + 24, request->len);
+        len = NBD_REQUEST_SIZE;
+    }

-    return nbd_write(ioc, buf, sizeof(buf), NULL);
+    return nbd_write(ioc, buf, len, NULL);
 }

 /* nbd_receive_simple_reply
@@ -1370,49 +1376,69 @@ int nbd_send_request(QIOChannel *ioc, NBDRequest *request, bool ext_hdr)
  * Payload is not read (payload is possible for CMD_READ, but here we even
  * don't know whether it take place or not).
  */
-static int nbd_receive_simple_reply(QIOChannel *ioc, NBDSimpleReply *reply,
+static int nbd_receive_simple_reply(QIOChannel *ioc, NBDReply *reply,
                                     Error **errp)
 {
     int ret;
+    size_t len;

-    assert(reply->magic == NBD_SIMPLE_REPLY_MAGIC);
+    if (reply->magic == NBD_SIMPLE_REPLY_MAGIC) {
+        len = sizeof(reply->simple);
+    } else {
+        assert(reply->magic == NBD_SIMPLE_REPLY_EXT_MAGIC);
+        len = sizeof(reply->simple_ext);
+    }

     ret = nbd_read(ioc, (uint8_t *)reply + sizeof(reply->magic),
-                   sizeof(*reply) - sizeof(reply->magic), "reply", errp);
+                   len - sizeof(reply->magic), "reply", errp);
     if (ret < 0) {
         return ret;
     }

-    reply->error = be32_to_cpu(reply->error);
-    reply->handle = be64_to_cpu(reply->handle);
+    /* error and handle occupy same space between forms */
+    reply->simple.error = be32_to_cpu(reply->simple.error);
+    reply->simple.handle = be64_to_cpu(reply->handle);
+    if (reply->magic == NBD_SIMPLE_REPLY_EXT_MAGIC) {
+        if (reply->simple_ext._pad1 || reply->simple_ext._pad2) {
+            error_setg(errp, "Server used non-zero padding in extended header");
+            return -EINVAL;
+        }
+        reply->magic = NBD_SIMPLE_REPLY_MAGIC;
+    }

     return 0;
 }

 /* nbd_receive_structured_reply_chunk
  * Read structured reply chunk except magic field (which should be already
- * read).
+ * read).  Normalize into the compact form.
  * Payload is not read.
  */
-static int nbd_receive_structured_reply_chunk(QIOChannel *ioc,
-                                              NBDStructuredReplyChunk *chunk,
+static int nbd_receive_structured_reply_chunk(QIOChannel *ioc, NBDReply *chunk,
                                               Error **errp)
 {
     int ret;
+    size_t len;
+    uint64_t payload_len;

-    assert(chunk->magic == NBD_STRUCTURED_REPLY_MAGIC);
+    if (chunk->magic == NBD_STRUCTURED_REPLY_MAGIC) {
+        len = sizeof(chunk->structured);
+    } else {
+        assert(chunk->magic == NBD_STRUCTURED_REPLY_EXT_MAGIC);
+        len = sizeof(chunk->structured_ext);
+    }

     ret = nbd_read(ioc, (uint8_t *)chunk + sizeof(chunk->magic),
-                   sizeof(*chunk) - sizeof(chunk->magic), "structured chunk",
+                   len - sizeof(chunk->magic), "structured chunk",
                    errp);
     if (ret < 0) {
         return ret;
     }

-    chunk->flags = be16_to_cpu(chunk->flags);
-    chunk->type = be16_to_cpu(chunk->type);
-    chunk->handle = be64_to_cpu(chunk->handle);
-    chunk->length = be32_to_cpu(chunk->length);
+    /* flags, type, and handle occupy same space between forms */
+    chunk->structured.flags = be16_to_cpu(chunk->structured.flags);
+    chunk->structured.type = be16_to_cpu(chunk->structured.type);
+    chunk->structured.handle = be64_to_cpu(chunk->structured.handle);

     /*
      * Because we use BLOCK_STATUS with REQ_ONE, and cap READ requests
@@ -1420,11 +1446,23 @@ static int nbd_receive_structured_reply_chunk(QIOChannel *ioc,
      * this.  Even if we stopped using REQ_ONE, sane servers will cap
      * the number of extents they return for block status.
      */
-    if (chunk->length > NBD_MAX_BUFFER_SIZE + sizeof(NBDStructuredReadData)) {
+    if (chunk->magic == NBD_STRUCTURED_REPLY_MAGIC) {
+        payload_len = be32_to_cpu(chunk->structured.length);
+    } else {
+        payload_len = be64_to_cpu(chunk->structured_ext.length);
+        if (chunk->structured_ext._pad) {
+            error_setg(errp, "Server used non-zero padding in extended header");
+            return -EINVAL;
+        }
+        chunk->magic = NBD_STRUCTURED_REPLY_MAGIC;
+    }
+    if (payload_len > NBD_MAX_BUFFER_SIZE + sizeof(NBDStructuredReadData)) {
         error_setg(errp, "server chunk %" PRIu32 " (%s) payload is too long",
-                   chunk->type, nbd_rep_lookup(chunk->type));
+                   chunk->structured.type,
+                   nbd_rep_lookup(chunk->structured.type));
         return -EINVAL;
     }
+    chunk->structured.length = payload_len;

     return 0;
 }
@@ -1471,30 +1509,36 @@ nbd_read_eof(BlockDriverState *bs, QIOChannel *ioc, void *buffer, size_t size,

 /* nbd_receive_reply
  *
- * Decreases bs->in_flight while waiting for a new reply. This yield is where
- * we wait indefinitely and the coroutine must be able to be safely reentered
- * for nbd_client_attach_aio_context().
+ * Wait for a new reply. If this yields, the coroutine must be able to be
+ * safely reentered for nbd_client_attach_aio_context().  @ext_hdrs determines
+ * which reply magic we are expecting, although this normalizes the result
+ * so that the caller only has to work with compact headers.
  *
  * Returns 1 on success
- *         0 on eof, when no data was read (errp is not set)
- *         negative errno on failure (errp is set)
+ *         0 on eof, when no data was read
+ *         negative errno on failure
  */
 int coroutine_fn nbd_receive_reply(BlockDriverState *bs, QIOChannel *ioc,
-                                   NBDReply *reply, Error **errp)
+                                   NBDReply *reply, bool ext_hdrs)
 {
     int ret;
     const char *type;

-    ret = nbd_read_eof(bs, ioc, &reply->magic, sizeof(reply->magic), errp);
+    ret = nbd_read_eof(bs, ioc, &reply->magic, sizeof(reply->magic), NULL);
     if (ret <= 0) {
         return ret;
     }

     reply->magic = be32_to_cpu(reply->magic);

+    /* Diagnose but accept wrong-width header */
     switch (reply->magic) {
     case NBD_SIMPLE_REPLY_MAGIC:
-        ret = nbd_receive_simple_reply(ioc, &reply->simple, errp);
+    case NBD_SIMPLE_REPLY_EXT_MAGIC:
+        if (ext_hdrs != (reply->magic == NBD_SIMPLE_REPLY_EXT_MAGIC)) {
+            trace_nbd_receive_wrong_header(reply->magic);
+        }
+        ret = nbd_receive_simple_reply(ioc, reply, NULL);
         if (ret < 0) {
             break;
         }
@@ -1503,7 +1547,11 @@ int coroutine_fn nbd_receive_reply(BlockDriverState *bs, QIOChannel *ioc,
                                        reply->handle);
         break;
     case NBD_STRUCTURED_REPLY_MAGIC:
-        ret = nbd_receive_structured_reply_chunk(ioc, &reply->structured, errp);
+    case NBD_STRUCTURED_REPLY_EXT_MAGIC:
+        if (ext_hdrs != (reply->magic == NBD_STRUCTURED_REPLY_EXT_MAGIC)) {
+            trace_nbd_receive_wrong_header(reply->magic);
+        }
+        ret = nbd_receive_structured_reply_chunk(ioc, reply, NULL);
         if (ret < 0) {
             break;
         }
@@ -1514,7 +1562,7 @@ int coroutine_fn nbd_receive_reply(BlockDriverState *bs, QIOChannel *ioc,
                                                  reply->structured.length);
         break;
     default:
-        error_setg(errp, "invalid magic (got 0x%" PRIx32 ")", reply->magic);
+        trace_nbd_receive_wrong_header(reply->magic);
         return -EINVAL;
     }
     if (ret < 0) {
diff --git a/nbd/trace-events b/nbd/trace-events
index d18da8b0b743..ad63e565fd6e 100644
--- a/nbd/trace-events
+++ b/nbd/trace-events
@@ -34,6 +34,7 @@ nbd_client_clear_socket(void) "Clearing NBD socket"
 nbd_send_request(uint64_t from, uint64_t len, uint64_t handle, uint16_t flags, uint16_t type, const char *name) "Sending request to server: { .from = %" PRIu64", .len = %" PRIu64 ", .handle = %" PRIu64 ", .flags = 0x%" PRIx16 ", .type = %" PRIu16 " (%s) }"
 nbd_receive_simple_reply(int32_t error, const char *errname, uint64_t handle) "Got simple reply: { .error = %" PRId32 " (%s), handle = %" PRIu64" }"
 nbd_receive_structured_reply_chunk(uint16_t flags, uint16_t type, const char *name, uint64_t handle, uint32_t length) "Got structured reply chunk: { flags = 0x%" PRIx16 ", type = %d (%s), handle = %" PRIu64 ", length = %" PRIu32 " }"
+nbd_receive_wrong_header(uint32_t magic) "Server sent unexpected magic 0x%" PRIx32

 # common.c
 nbd_unknown_error(int err) "Squashing unexpected error %d to EINVAL"
-- 
2.33.1



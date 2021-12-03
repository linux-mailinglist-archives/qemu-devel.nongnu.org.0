Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0590E468055
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:25:01 +0100 (CET)
Received: from localhost ([::1]:39344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHvI-0005xV-2e
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:25:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHn1-0007e3-Ce
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHmz-00038p-Eg
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XaDVs2WNSNjepM2A0DQuO940MO4WbUd6KdFQbYivIR8=;
 b=LT/jsgWfKpgbRnMkGv2BjvK+IjzBle6YNFx40RKyydOZGoH0KDiguI8cwYtOwzTr3YC6Y5
 7IpkOx1gvX5qJXgBSNiRxb/eb/xp396MUr8q0oHsQsN3QUxtnk1et/ld7vHOIVN5bunAtg
 iWTro1fEhzjkYFChkWF7smAwUAmZSY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-1F6oKMxpM2G_9PydWp8vrw-1; Fri, 03 Dec 2021 18:16:21 -0500
X-MC-Unique: 1F6oKMxpM2G_9PydWp8vrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6472C190A7A0;
 Fri,  3 Dec 2021 23:16:20 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 814AC5D9D5;
 Fri,  3 Dec 2021 23:16:10 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/14] nbd/server: Initial support for extended headers
Date: Fri,  3 Dec 2021 17:15:33 -0600
Message-Id: <20211203231539.3900865-9-eblake@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We have no reason to send NBD_REPLY_TYPE_OFFSET_HOLE_EXT since we
already cap NBD_CMD_READ to 32M.  For NBD_CMD_WRITE_ZEROES and
NBD_CMD_TRIM, the block layer already supports 64-bit operations
without any effort on our part.  For NBD_CMD_BLOCK_STATUS, the
client's length is a hint; the easiest approach is to truncate our
answer back to 32 bits, letting us delay the effort of implementing
NBD_REPLY_TYPE_BLOCK_STATUS_EXT to a separate patch.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/nbd-internal.h |   5 ++-
 nbd/server.c       | 106 ++++++++++++++++++++++++++++++++++-----------
 2 files changed, 85 insertions(+), 26 deletions(-)

diff --git a/nbd/nbd-internal.h b/nbd/nbd-internal.h
index 0016793ff4b1..875b6204c28c 100644
--- a/nbd/nbd-internal.h
+++ b/nbd/nbd-internal.h
@@ -35,8 +35,11 @@
  * https://github.com/yoe/nbd/blob/master/doc/proto.md
  */

-/* Size of all NBD_OPT_*, without payload */
+/* Size of all compact NBD_CMD_*, without payload */
 #define NBD_REQUEST_SIZE            (4 + 2 + 2 + 8 + 8 + 4)
+/* Size of all extended NBD_CMD_*, without payload */
+#define NBD_REQUEST_EXT_SIZE        (4 + 2 + 2 + 8 + 8 + 8)
+
 /* Size of all NBD_REP_* sent in answer to most NBD_OPT_*, without payload */
 #define NBD_REPLY_SIZE              (4 + 4 + 8)
 /* Size of reply to NBD_OPT_EXPORT_NAME */
diff --git a/nbd/server.c b/nbd/server.c
index 4306fa7b426c..0e496f60ffbd 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -142,6 +142,7 @@ struct NBDClient {
     uint32_t check_align; /* If non-zero, check for aligned client requests */

     bool structured_reply;
+    bool extended_headers;
     NBDExportMetaContexts export_meta;

     uint32_t opt; /* Current option being negotiated */
@@ -1275,6 +1276,19 @@ static int nbd_negotiate_options(NBDClient *client, Error **errp)
                                                  errp);
                 break;

+            case NBD_OPT_EXTENDED_HEADERS:
+                if (length) {
+                    ret = nbd_reject_length(client, false, errp);
+                } else if (client->extended_headers) {
+                    ret = nbd_negotiate_send_rep_err(
+                        client, NBD_REP_ERR_INVALID, errp,
+                        "extended headers already negotiated");
+                } else {
+                    ret = nbd_negotiate_send_rep(client, NBD_REP_ACK, errp);
+                    client->extended_headers = true;
+                }
+                break;
+
             default:
                 ret = nbd_opt_drop(client, NBD_REP_ERR_UNSUP, errp,
                                    "Unsupported option %" PRIu32 " (%s)",
@@ -1410,11 +1424,13 @@ nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **errp)
 static int nbd_receive_request(NBDClient *client, NBDRequest *request,
                                Error **errp)
 {
-    uint8_t buf[NBD_REQUEST_SIZE];
-    uint32_t magic;
+    uint8_t buf[NBD_REQUEST_EXT_SIZE];
+    uint32_t magic, expect;
     int ret;
+    size_t size = client->extended_headers ? NBD_REQUEST_EXT_SIZE
+        : NBD_REQUEST_SIZE;

-    ret = nbd_read_eof(client, buf, sizeof(buf), errp);
+    ret = nbd_read_eof(client, buf, size, errp);
     if (ret < 0) {
         return ret;
     }
@@ -1422,13 +1438,21 @@ static int nbd_receive_request(NBDClient *client, NBDRequest *request,
         return -EIO;
     }

-    /* Request
-       [ 0 ..  3]   magic   (NBD_REQUEST_MAGIC)
-       [ 4 ..  5]   flags   (NBD_CMD_FLAG_FUA, ...)
-       [ 6 ..  7]   type    (NBD_CMD_READ, ...)
-       [ 8 .. 15]   handle
-       [16 .. 23]   from
-       [24 .. 27]   len
+    /*
+     * Compact request
+     *  [ 0 ..  3]   magic   (NBD_REQUEST_MAGIC)
+     *  [ 4 ..  5]   flags   (NBD_CMD_FLAG_FUA, ...)
+     *  [ 6 ..  7]   type    (NBD_CMD_READ, ...)
+     *  [ 8 .. 15]   handle
+     *  [16 .. 23]   from
+     *  [24 .. 27]   len
+     * Extended request
+     *  [ 0 ..  3]   magic   (NBD_REQUEST_EXT_MAGIC)
+     *  [ 4 ..  5]   flags   (NBD_CMD_FLAG_FUA, ...)
+     *  [ 6 ..  7]   type    (NBD_CMD_READ, ...)
+     *  [ 8 .. 15]   handle
+     *  [16 .. 23]   from
+     *  [24 .. 31]   len
      */

     magic = ldl_be_p(buf);
@@ -1436,12 +1460,18 @@ static int nbd_receive_request(NBDClient *client, NBDRequest *request,
     request->type   = lduw_be_p(buf + 6);
     request->handle = ldq_be_p(buf + 8);
     request->from   = ldq_be_p(buf + 16);
-    request->len    = ldl_be_p(buf + 24); /* widen 32 to 64 bits */
+    if (client->extended_headers) {
+        request->len = ldq_be_p(buf + 24);
+        expect = NBD_REQUEST_EXT_MAGIC;
+    } else {
+        request->len = ldl_be_p(buf + 24); /* widen 32 to 64 bits */
+        expect = NBD_REQUEST_MAGIC;
+    }

     trace_nbd_receive_request(magic, request->flags, request->type,
                               request->from, request->len);

-    if (magic != NBD_REQUEST_MAGIC) {
+    if (magic != expect) {
         error_setg(errp, "invalid magic (got 0x%" PRIx32 ")", magic);
         return -EINVAL;
     }
@@ -1872,12 +1902,22 @@ static int coroutine_fn nbd_co_send_iov(NBDClient *client, struct iovec *iov,
 static inline void set_be_simple_reply(NBDClient *client, struct iovec *iov,
                                        uint64_t error, uint64_t handle)
 {
-    NBDSimpleReply *reply = iov->iov_base;
+    if (client->extended_headers) {
+        NBDSimpleReplyExt *reply = iov->iov_base;

-    iov->iov_len = sizeof(*reply);
-    stl_be_p(&reply->magic, NBD_SIMPLE_REPLY_MAGIC);
-    stl_be_p(&reply->error, error);
-    stq_be_p(&reply->handle, handle);
+        iov->iov_len = sizeof(*reply);
+        stl_be_p(&reply->magic, NBD_SIMPLE_REPLY_EXT_MAGIC);
+        stl_be_p(&reply->error, error);
+        stq_be_p(&reply->handle, handle);
+        reply->_pad1 = reply->_pad2 = 0;
+    } else {
+        NBDSimpleReply *reply = iov->iov_base;
+
+        iov->iov_len = sizeof(*reply);
+        stl_be_p(&reply->magic, NBD_SIMPLE_REPLY_MAGIC);
+        stl_be_p(&reply->error, error);
+        stq_be_p(&reply->handle, handle);
+    }
 }

 static int nbd_co_send_simple_reply(NBDClient *client,
@@ -1905,14 +1945,26 @@ static inline void set_be_chunk(NBDClient *client, struct iovec *iov,
                                 uint16_t flags, uint16_t type,
                                 uint64_t handle, uint32_t length)
 {
-    NBDStructuredReplyChunk *chunk = iov->iov_base;
+    if (client->extended_headers) {
+        NBDStructuredReplyChunkExt *chunk = iov->iov_base;

-    iov->iov_len = sizeof(*chunk);
-    stl_be_p(&chunk->magic, NBD_STRUCTURED_REPLY_MAGIC);
-    stw_be_p(&chunk->flags, flags);
-    stw_be_p(&chunk->type, type);
-    stq_be_p(&chunk->handle, handle);
-    stl_be_p(&chunk->length, length);
+        iov->iov_len = sizeof(*chunk);
+        stl_be_p(&chunk->magic, NBD_STRUCTURED_REPLY_EXT_MAGIC);
+        stw_be_p(&chunk->flags, flags);
+        stw_be_p(&chunk->type, type);
+        stq_be_p(&chunk->handle, handle);
+        stq_be_p(&chunk->length, length);
+        chunk->_pad = 0;
+    } else {
+        NBDStructuredReplyChunk *chunk = iov->iov_base;
+
+        iov->iov_len = sizeof(*chunk);
+        stl_be_p(&chunk->magic, NBD_STRUCTURED_REPLY_MAGIC);
+        stw_be_p(&chunk->flags, flags);
+        stw_be_p(&chunk->type, type);
+        stq_be_p(&chunk->handle, handle);
+        stl_be_p(&chunk->length, length);
+    }
 }

 static int coroutine_fn nbd_co_send_structured_done(NBDClient *client,
@@ -2555,7 +2607,11 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             return nbd_send_generic_reply(client, request->handle, -EINVAL,
                                           "need non-zero length", errp);
         }
-        assert(request->len <= UINT32_MAX);
+        if (request->len > UINT32_MAX) {
+            /* For now, truncate our response to a 32 bit window */
+            request->len = QEMU_ALIGN_DOWN(BDRV_REQUEST_MAX_BYTES,
+                                           client->check_align ?: 1);
+        }
         if (client->export_meta.count) {
             bool dont_fragment = request->flags & NBD_CMD_FLAG_REQ_ONE;
             int contexts_remaining = client->export_meta.count;
-- 
2.33.1



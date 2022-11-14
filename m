Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90347628D6C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:29:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouieD-0002jN-Cl; Mon, 14 Nov 2022 18:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidr-0001df-Vm
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiGI-0002OZ-E4
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhjaJStUuLPK/R3vMxs8VI5rugu1a9ay15tYrbDlKAg=;
 b=ZAWo4+K3LUMODgmZdygtrBRlOr56IN5A0cWwtiJPVoCoFbMpWESpgQcNd9kKEGFun60zPX
 W/UM0PQ3KTTuRops/v3iZNpcXG8mop63XGpw3jDwTqa2bnBXx/Y0tWa4cxcn7QrMfXxUU0
 GMalw3nMrgtO2xjSdbgQEHZQL+i6rbk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-c9vmJOToNCSgezP9DKJmmg-1; Mon, 14 Nov 2022 17:49:00 -0500
X-MC-Unique: c9vmJOToNCSgezP9DKJmmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1B791C087B7;
 Mon, 14 Nov 2022 22:48:59 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A32F40AE7F0;
 Mon, 14 Nov 2022 22:48:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v2 07/15] nbd/server: Initial support for extended headers
Date: Mon, 14 Nov 2022 16:48:40 -0600
Message-Id: <20221114224848.2186298-8-eblake@redhat.com>
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

Even though the NBD spec has been altered to allow us to accept
NBD_CMD_READ larger than the max payload size (provided our response
is a hole or broken up over more than one data chunk), we are not
planning to take advantage of that, and continue to cap NBD_CMD_READ
to 32M regardless of header size.

For NBD_CMD_WRITE_ZEROES and NBD_CMD_TRIM, the block layer already
supports 64-bit operations without any effort on our part.  For
NBD_CMD_BLOCK_STATUS, the client's length is a hint; the easiest
approach for now is to truncate our answer back to 32 bits, which lets
us delay the effort of implementing NBD_REPLY_TYPE_BLOCK_STATUS_EXT to
a separate patch.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/nbd-internal.h |   7 ++-
 nbd/server.c       | 132 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 108 insertions(+), 31 deletions(-)

diff --git a/nbd/nbd-internal.h b/nbd/nbd-internal.h
index 0016793ff4..f9fe0b6ce3 100644
--- a/nbd/nbd-internal.h
+++ b/nbd/nbd-internal.h
@@ -1,7 +1,7 @@
 /*
  * NBD Internal Declarations
  *
- * Copyright (C) 2016-2021 Red Hat, Inc.
+ * Copyright (C) 2016-2022 Red Hat, Inc.
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -35,8 +35,11 @@
  * https://github.com/yoe/nbd/blob/master/doc/proto.md
  */

-/* Size of all NBD_OPT_*, without payload */
+/* Size of all compact NBD_CMD_*, without payload */
 #define NBD_REQUEST_SIZE            (4 + 2 + 2 + 8 + 8 + 4)
+/* Size of all extended NBD_CMD_*, without payload */
+#define NBD_EXTENDED_REQUEST_SIZE   (4 + 2 + 2 + 8 + 8 + 8)
+
 /* Size of all NBD_REP_* sent in answer to most NBD_OPT_*, without payload */
 #define NBD_REPLY_SIZE              (4 + 4 + 8)
 /* Size of reply to NBD_OPT_EXPORT_NAME */
diff --git a/nbd/server.c b/nbd/server.c
index 4d1400430b..b46655b4d8 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -141,7 +141,7 @@ struct NBDClient {

     uint32_t check_align; /* If non-zero, check for aligned client requests */

-    bool structured_reply;
+    bool structured_reply; /* also set true if extended_headers is set */
     bool extended_headers;
     NBDExportMetaContexts export_meta;

@@ -1260,6 +1260,10 @@ static int nbd_negotiate_options(NBDClient *client, Error **errp)
             case NBD_OPT_STRUCTURED_REPLY:
                 if (length) {
                     ret = nbd_reject_length(client, false, errp);
+                } else if (client->extended_headers) {
+                    ret = nbd_negotiate_send_rep_err(
+                        client, NBD_REP_ERR_EXT_HEADER_REQD, errp,
+                        "extended headers already negotiated");
                 } else if (client->structured_reply) {
                     ret = nbd_negotiate_send_rep_err(
                         client, NBD_REP_ERR_INVALID, errp,
@@ -1276,6 +1280,19 @@ static int nbd_negotiate_options(NBDClient *client, Error **errp)
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
+                    client->structured_reply = client->extended_headers = true;
+                }
+                break;
+
             default:
                 ret = nbd_opt_drop(client, NBD_REP_ERR_UNSUP, errp,
                                    "Unsupported option %" PRIu32 " (%s)",
@@ -1411,11 +1428,13 @@ nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **errp)
 static int nbd_receive_request(NBDClient *client, NBDRequest *request,
                                Error **errp)
 {
-    uint8_t buf[NBD_REQUEST_SIZE];
-    uint32_t magic;
+    uint8_t buf[NBD_EXTENDED_REQUEST_SIZE];
+    uint32_t magic, expect;
     int ret;
+    size_t size = client->extended_headers ? NBD_EXTENDED_REQUEST_SIZE
+        : NBD_REQUEST_SIZE;

-    ret = nbd_read_eof(client, buf, sizeof(buf), errp);
+    ret = nbd_read_eof(client, buf, size, errp);
     if (ret < 0) {
         return ret;
     }
@@ -1423,13 +1442,21 @@ static int nbd_receive_request(NBDClient *client, NBDRequest *request,
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
+     *  [ 0 ..  3]   magic   (NBD_EXTENDED_REQUEST_MAGIC)
+     *  [ 4 ..  5]   flags   (NBD_CMD_FLAG_FUA, NBD_CMD_FLAG_PAYLOAD_LEN, ...)
+     *  [ 6 ..  7]   type    (NBD_CMD_READ, ...)
+     *  [ 8 .. 15]   handle
+     *  [16 .. 23]   from
+     *  [24 .. 31]   len
      */

     magic = ldl_be_p(buf);
@@ -1437,12 +1464,18 @@ static int nbd_receive_request(NBDClient *client, NBDRequest *request,
     request->type   = lduw_be_p(buf + 6);
     request->handle = ldq_be_p(buf + 8);
     request->from   = ldq_be_p(buf + 16);
-    request->len    = ldl_be_p(buf + 24); /* widen 32 to 64 bits */
+    if (client->extended_headers) {
+        request->len = ldq_be_p(buf + 24);
+        expect = NBD_EXTENDED_REQUEST_MAGIC;
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
@@ -1890,14 +1923,37 @@ static int coroutine_fn nbd_co_send_iov(NBDClient *client, struct iovec *iov,
 }

 static inline void set_be_simple_reply(NBDClient *client, struct iovec *iov,
-                                       uint64_t error, NBDRequest *request)
+                                       uint32_t error, NBDStructuredError *err,
+                                       NBDRequest *request)
 {
-    NBDSimpleReply *reply = iov->iov_base;
+    if (client->extended_headers) {
+        NBDExtendedReplyChunk *chunk = iov->iov_base;

-    iov->iov_len = sizeof(*reply);
-    stl_be_p(&reply->magic, NBD_SIMPLE_REPLY_MAGIC);
-    stl_be_p(&reply->error, error);
-    stq_be_p(&reply->handle, request->handle);
+        iov->iov_len = sizeof(*chunk);
+        stl_be_p(&chunk->magic, NBD_EXTENDED_REPLY_MAGIC);
+        stw_be_p(&chunk->flags, NBD_REPLY_FLAG_DONE);
+        stq_be_p(&chunk->handle, request->handle);
+        stq_be_p(&chunk->offset, request->from);
+        if (error) {
+            assert(!iov[1].iov_base);
+            iov[1].iov_base = err;
+            iov[1].iov_len = sizeof(*err);
+            stw_be_p(&chunk->type, NBD_REPLY_TYPE_ERROR);
+            stq_be_p(&chunk->length, sizeof(*err));
+            stl_be_p(&err->error, error);
+            stw_be_p(&err->message_length, 0);
+        } else {
+            stw_be_p(&chunk->type, NBD_REPLY_TYPE_NONE);
+            stq_be_p(&chunk->length, 0);
+        }
+    } else {
+        NBDSimpleReply *reply = iov->iov_base;
+
+        iov->iov_len = sizeof(*reply);
+        stl_be_p(&reply->magic, NBD_SIMPLE_REPLY_MAGIC);
+        stl_be_p(&reply->error, error);
+        stq_be_p(&reply->handle, request->handle);
+    }
 }

 static int nbd_co_send_simple_reply(NBDClient *client, NBDRequest *request,
@@ -1908,30 +1964,44 @@ static int nbd_co_send_simple_reply(NBDClient *client, NBDRequest *request,
 {
     NBDReply hdr;
     int nbd_err = system_errno_to_nbd_errno(error);
+    NBDStructuredError err;
     struct iovec iov[] = {
         {.iov_base = &hdr},
         {.iov_base = data, .iov_len = len}
     };

+    assert(!len || !nbd_err);
     trace_nbd_co_send_simple_reply(request->handle, nbd_err,
                                    nbd_err_lookup(nbd_err), len);
-    set_be_simple_reply(client, &iov[0], nbd_err, request);
+    set_be_simple_reply(client, &iov[0], nbd_err, &err, request);

-    return nbd_co_send_iov(client, iov, len ? 2 : 1, errp);
+    return nbd_co_send_iov(client, iov, iov[1].iov_len ? 2 : 1, errp);
 }

 static inline void set_be_chunk(NBDClient *client, struct iovec *iov,
                                 uint16_t flags, uint16_t type,
                                 NBDRequest *request, uint32_t length)
 {
-    NBDStructuredReplyChunk *chunk = iov->iov_base;
+    if (client->extended_headers) {
+        NBDExtendedReplyChunk *chunk = iov->iov_base;

-    iov->iov_len = sizeof(*chunk);
-    stl_be_p(&chunk->magic, NBD_STRUCTURED_REPLY_MAGIC);
-    stw_be_p(&chunk->flags, flags);
-    stw_be_p(&chunk->type, type);
-    stq_be_p(&chunk->handle, request->handle);
-    stl_be_p(&chunk->length, length);
+        iov->iov_len = sizeof(*chunk);
+        stl_be_p(&chunk->magic, NBD_EXTENDED_REPLY_MAGIC);
+        stw_be_p(&chunk->flags, flags);
+        stw_be_p(&chunk->type, type);
+        stq_be_p(&chunk->handle, request->handle);
+        stq_be_p(&chunk->offset, request->from);
+        stq_be_p(&chunk->length, length);
+    } else {
+        NBDStructuredReplyChunk *chunk = iov->iov_base;
+
+        iov->iov_len = sizeof(*chunk);
+        stl_be_p(&chunk->magic, NBD_STRUCTURED_REPLY_MAGIC);
+        stw_be_p(&chunk->flags, flags);
+        stw_be_p(&chunk->type, type);
+        stq_be_p(&chunk->handle, request->handle);
+        stl_be_p(&chunk->length, length);
+    }
 }

 static int coroutine_fn nbd_co_send_structured_done(NBDClient *client,
@@ -2595,7 +2665,11 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             return nbd_send_generic_reply(client, request, -EINVAL,
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
2.38.1



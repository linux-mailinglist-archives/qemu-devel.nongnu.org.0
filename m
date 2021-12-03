Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ACC468036
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:19:41 +0100 (CET)
Received: from localhost ([::1]:51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHq8-00030n-ON
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:19:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHmq-0007Od-A0
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHmn-00035i-KT
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Xn4eGnXhtbCzT+Y2C8YtDpc6Mjj6t9VR75rJyrRD5o=;
 b=Tj8jsOHU2tC92lXgoDerNgR/VzbP+2YazjeyailQd3igJJOwluBmwCGS0rob0x4qQ8nYLp
 tteistXFmjJFHsDH1MdwH6RRPfmKnVh7gHG0Og2wxgbJuic/hSms+So7xu3Iut7VM0jQh6
 Pk46zTNqbrI7VLWP2WfpDyZcmJMjjII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-U1AN9G9NMzqAf9BLlE8gyA-1; Fri, 03 Dec 2021 18:16:09 -0500
X-MC-Unique: U1AN9G9NMzqAf9BLlE8gyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2488190A7A0;
 Fri,  3 Dec 2021 23:16:08 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D28E5D9D5;
 Fri,  3 Dec 2021 23:16:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/14] nbd: Prepare for 64-bit requests
Date: Fri,  3 Dec 2021 17:15:31 -0600
Message-Id: <20211203231539.3900865-7-eblake@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, nbd@other.debian.org, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Widen the length field of NBDRequest to 64-bits, although we can
assert that all current uses are still under 32 bits.  Move the
request magic number to nbd.h, to live alongside the reply magic
number.  Add a bool that will eventually track whether the client
successfully negotiated extended headers with the server, allowing the
nbd driver to pass larger requests along where possible; although in
this patch it always remains false for no semantic change yet.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h | 19 +++++++++++--------
 nbd/nbd-internal.h  |  3 +--
 block/nbd.c         | 35 ++++++++++++++++++++++++-----------
 nbd/client.c        |  8 +++++---
 nbd/server.c        | 11 ++++++++---
 nbd/trace-events    |  8 ++++----
 6 files changed, 53 insertions(+), 31 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 3d0689b69367..732314aaba11 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -52,17 +52,16 @@ typedef struct NBDOptionReplyMetaContext {

 /* Transmission phase structs
  *
- * Note: these are _NOT_ the same as the network representation of an NBD
- * request and reply!
+ * Note: NBDRequest is _NOT_ the same as the network representation of an NBD
+ * request!
  */
-struct NBDRequest {
+typedef struct NBDRequest {
     uint64_t handle;
     uint64_t from;
-    uint32_t len;
+    uint64_t len;   /* Must fit 32 bits unless extended headers negotiated */
     uint16_t flags; /* NBD_CMD_FLAG_* */
-    uint16_t type; /* NBD_CMD_* */
-};
-typedef struct NBDRequest NBDRequest;
+    uint16_t type;  /* NBD_CMD_* */
+} NBDRequest;

 typedef struct NBDSimpleReply {
     uint32_t magic;  /* NBD_SIMPLE_REPLY_MAGIC */
@@ -235,6 +234,9 @@ enum {
  */
 #define NBD_MAX_STRING_SIZE 4096

+/* Transmission request structure */
+#define NBD_REQUEST_MAGIC           0x25609513
+
 /* Two types of reply structures */
 #define NBD_SIMPLE_REPLY_MAGIC      0x67446698
 #define NBD_STRUCTURED_REPLY_MAGIC  0x668e33ef
@@ -293,6 +295,7 @@ struct NBDExportInfo {
     /* In-out fields, set by client before nbd_receive_negotiate() and
      * updated by server results during nbd_receive_negotiate() */
     bool structured_reply;
+    bool extended_headers;
     bool base_allocation; /* base:allocation context for NBD_CMD_BLOCK_STATUS */

     /* Set by server results during nbd_receive_negotiate() and
@@ -322,7 +325,7 @@ int nbd_receive_export_list(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
                             Error **errp);
 int nbd_init(int fd, QIOChannelSocket *sioc, NBDExportInfo *info,
              Error **errp);
-int nbd_send_request(QIOChannel *ioc, NBDRequest *request);
+int nbd_send_request(QIOChannel *ioc, NBDRequest *request, bool ext_hdr);
 int coroutine_fn nbd_receive_reply(BlockDriverState *bs, QIOChannel *ioc,
                                    NBDReply *reply, Error **errp);
 int nbd_client(int fd);
diff --git a/nbd/nbd-internal.h b/nbd/nbd-internal.h
index 1b2141ab4b2d..0016793ff4b1 100644
--- a/nbd/nbd-internal.h
+++ b/nbd/nbd-internal.h
@@ -1,7 +1,7 @@
 /*
  * NBD Internal Declarations
  *
- * Copyright (C) 2016 Red Hat, Inc.
+ * Copyright (C) 2016-2021 Red Hat, Inc.
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -45,7 +45,6 @@
 #define NBD_OLDSTYLE_NEGOTIATE_SIZE (8 + 8 + 8 + 4 + 124)

 #define NBD_INIT_MAGIC              0x4e42444d41474943LL /* ASCII "NBDMAGIC" */
-#define NBD_REQUEST_MAGIC           0x25609513
 #define NBD_OPTS_MAGIC              0x49484156454F5054LL /* ASCII "IHAVEOPT" */
 #define NBD_CLIENT_MAGIC            0x0000420281861253LL
 #define NBD_REP_MAGIC               0x0003e889045565a9LL
diff --git a/block/nbd.c b/block/nbd.c
index 5ef462db1b7f..3e9875241bec 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2,7 +2,7 @@
  * QEMU Block driver for  NBD
  *
  * Copyright (c) 2019 Virtuozzo International GmbH.
- * Copyright (C) 2016 Red Hat, Inc.
+ * Copyright (C) 2016-2021 Red Hat, Inc.
  * Copyright (C) 2008 Bull S.A.S.
  *     Author: Laurent Vivier <Laurent.Vivier@bull.net>
  *
@@ -300,7 +300,7 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
          */
         NBDRequest request = { .type = NBD_CMD_DISC };

-        nbd_send_request(s->ioc, &request);
+        nbd_send_request(s->ioc, &request, s->info.extended_headers);

         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
                                  nbd_yank, bs);
@@ -470,7 +470,7 @@ static int nbd_co_send_request(BlockDriverState *bs,

     if (qiov) {
         qio_channel_set_cork(s->ioc, true);
-        rc = nbd_send_request(s->ioc, request);
+        rc = nbd_send_request(s->ioc, request, s->info.extended_headers);
         if (nbd_client_connected(s) && rc >= 0) {
             if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
                                        NULL) < 0) {
@@ -481,7 +481,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
         }
         qio_channel_set_cork(s->ioc, false);
     } else {
-        rc = nbd_send_request(s->ioc, request);
+        rc = nbd_send_request(s->ioc, request, s->info.extended_headers);
     }

 err:
@@ -1252,10 +1252,11 @@ static int nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
     NBDRequest request = {
         .type = NBD_CMD_WRITE_ZEROES,
         .from = offset,
-        .len = bytes,  /* .len is uint32_t actually */
+        .len = bytes,
     };

-    assert(bytes <= UINT32_MAX); /* rely on max_pwrite_zeroes */
+    /* rely on max_pwrite_zeroes */
+    assert(bytes <= UINT32_MAX || s->info.extended_headers);

     assert(!(s->info.flags & NBD_FLAG_READ_ONLY));
     if (!(s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES)) {
@@ -1302,10 +1303,11 @@ static int nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset,
     NBDRequest request = {
         .type = NBD_CMD_TRIM,
         .from = offset,
-        .len = bytes, /* len is uint32_t */
+        .len = bytes,
     };

-    assert(bytes <= UINT32_MAX); /* rely on max_pdiscard */
+    /* rely on max_pdiscard */
+    assert(bytes <= UINT32_MAX || s->info.extended_headers);

     assert(!(s->info.flags & NBD_FLAG_READ_ONLY));
     if (!(s->info.flags & NBD_FLAG_SEND_TRIM) || !bytes) {
@@ -1327,8 +1329,7 @@ static int coroutine_fn nbd_client_co_block_status(
     NBDRequest request = {
         .type = NBD_CMD_BLOCK_STATUS,
         .from = offset,
-        .len = MIN(QEMU_ALIGN_DOWN(INT_MAX, bs->bl.request_alignment),
-                   MIN(bytes, s->info.size - offset)),
+        .len = MIN(bytes, s->info.size - offset),
         .flags = NBD_CMD_FLAG_REQ_ONE,
     };

@@ -1338,6 +1339,10 @@ static int coroutine_fn nbd_client_co_block_status(
         *file = bs;
         return BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
     }
+    if (!s->info.extended_headers) {
+        request.len = MIN(QEMU_ALIGN_DOWN(INT_MAX, bs->bl.request_alignment),
+                          request.len);
+    }

     /*
      * Work around the fact that the block layer doesn't do
@@ -1415,7 +1420,7 @@ static void nbd_client_close(BlockDriverState *bs)
     NBDRequest request = { .type = NBD_CMD_DISC };

     if (s->ioc) {
-        nbd_send_request(s->ioc, &request);
+        nbd_send_request(s->ioc, &request, s->info.extended_headers);
     }

     nbd_teardown_connection(bs);
@@ -1877,6 +1882,14 @@ static void nbd_refresh_limits(BlockDriverState *bs, Error **errp)
     bs->bl.max_pwrite_zeroes = max;
     bs->bl.max_transfer = max;

+    /*
+     * Assume that if the server supports extended headers, it also
+     * supports unlimited size zero and trim commands.
+     */
+    if (s->info.extended_headers) {
+        bs->bl.max_pdiscard = bs->bl.max_pwrite_zeroes = 0;
+    }
+
     if (s->info.opt_block &&
         s->info.opt_block > bs->bl.opt_transfer) {
         bs->bl.opt_transfer = s->info.opt_block;
diff --git a/nbd/client.c b/nbd/client.c
index 8f137c2320bb..aa162b9d08d5 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -1,5 +1,5 @@
 /*
- *  Copyright (C) 2016-2019 Red Hat, Inc.
+ *  Copyright (C) 2016-2021 Red Hat, Inc.
  *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
  *
  *  Network Block Device Client Side
@@ -1221,7 +1221,7 @@ int nbd_receive_export_list(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
         if (nbd_drop(ioc, 124, NULL) == 0) {
             NBDRequest request = { .type = NBD_CMD_DISC };

-            nbd_send_request(ioc, &request);
+            nbd_send_request(ioc, &request, false);
         }
         break;
     default:
@@ -1345,10 +1345,12 @@ int nbd_disconnect(int fd)

 #endif /* __linux__ */

-int nbd_send_request(QIOChannel *ioc, NBDRequest *request)
+int nbd_send_request(QIOChannel *ioc, NBDRequest *request, bool ext_hdr)
 {
     uint8_t buf[NBD_REQUEST_SIZE];

+    assert(!ext_hdr);
+    assert(request->len <= UINT32_MAX);
     trace_nbd_send_request(request->from, request->len, request->handle,
                            request->flags, request->type,
                            nbd_cmd_lookup(request->type));
diff --git a/nbd/server.c b/nbd/server.c
index 64845542fd6b..4306fa7b426c 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1436,7 +1436,7 @@ static int nbd_receive_request(NBDClient *client, NBDRequest *request,
     request->type   = lduw_be_p(buf + 6);
     request->handle = ldq_be_p(buf + 8);
     request->from   = ldq_be_p(buf + 16);
-    request->len    = ldl_be_p(buf + 24);
+    request->len    = ldl_be_p(buf + 24); /* widen 32 to 64 bits */

     trace_nbd_receive_request(magic, request->flags, request->type,
                               request->from, request->len);
@@ -2324,7 +2324,7 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
         request->type == NBD_CMD_CACHE)
     {
         if (request->len > NBD_MAX_BUFFER_SIZE) {
-            error_setg(errp, "len (%" PRIu32" ) is larger than max len (%u)",
+            error_setg(errp, "len (%" PRIu64" ) is larger than max len (%u)",
                        request->len, NBD_MAX_BUFFER_SIZE);
             return -EINVAL;
         }
@@ -2340,6 +2340,7 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
     }

     if (request->type == NBD_CMD_WRITE) {
+        assert(request->len <= UINT32_MAX);
         if (nbd_read(client->ioc, req->data, request->len, "CMD_WRITE data",
                      errp) < 0)
         {
@@ -2361,7 +2362,7 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
     }
     if (request->from > client->exp->size ||
         request->len > client->exp->size - request->from) {
-        error_setg(errp, "operation past EOF; From: %" PRIu64 ", Len: %" PRIu32
+        error_setg(errp, "operation past EOF; From: %" PRIu64 ", Len: %" PRIu64
                    ", Size: %" PRIu64, request->from, request->len,
                    client->exp->size);
         return (request->type == NBD_CMD_WRITE ||
@@ -2424,6 +2425,7 @@ static coroutine_fn int nbd_do_cmd_read(NBDClient *client, NBDRequest *request,
     NBDExport *exp = client->exp;

     assert(request->type == NBD_CMD_READ);
+    assert(request->len <= INT_MAX);

     /* XXX: NBD Protocol only documents use of FUA with WRITE */
     if (request->flags & NBD_CMD_FLAG_FUA) {
@@ -2475,6 +2477,7 @@ static coroutine_fn int nbd_do_cmd_cache(NBDClient *client, NBDRequest *request,
     NBDExport *exp = client->exp;

     assert(request->type == NBD_CMD_CACHE);
+    assert(request->len <= INT_MAX);

     ret = blk_co_preadv(exp->common.blk, request->from, request->len,
                         NULL, BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH);
@@ -2508,6 +2511,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
         if (request->flags & NBD_CMD_FLAG_FUA) {
             flags |= BDRV_REQ_FUA;
         }
+        assert(request->len <= INT_MAX);
         ret = blk_pwrite(exp->common.blk, request->from, data, request->len,
                          flags);
         return nbd_send_generic_reply(client, request->handle, ret,
@@ -2551,6 +2555,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             return nbd_send_generic_reply(client, request->handle, -EINVAL,
                                           "need non-zero length", errp);
         }
+        assert(request->len <= UINT32_MAX);
         if (client->export_meta.count) {
             bool dont_fragment = request->flags & NBD_CMD_FLAG_REQ_ONE;
             int contexts_remaining = client->export_meta.count;
diff --git a/nbd/trace-events b/nbd/trace-events
index c4919a2dd581..d18da8b0b743 100644
--- a/nbd/trace-events
+++ b/nbd/trace-events
@@ -31,7 +31,7 @@ nbd_client_loop(void) "Doing NBD loop"
 nbd_client_loop_ret(int ret, const char *error) "NBD loop returned %d: %s"
 nbd_client_clear_queue(void) "Clearing NBD queue"
 nbd_client_clear_socket(void) "Clearing NBD socket"
-nbd_send_request(uint64_t from, uint32_t len, uint64_t handle, uint16_t flags, uint16_t type, const char *name) "Sending request to server: { .from = %" PRIu64", .len = %" PRIu32 ", .handle = %" PRIu64 ", .flags = 0x%" PRIx16 ", .type = %" PRIu16 " (%s) }"
+nbd_send_request(uint64_t from, uint64_t len, uint64_t handle, uint16_t flags, uint16_t type, const char *name) "Sending request to server: { .from = %" PRIu64", .len = %" PRIu64 ", .handle = %" PRIu64 ", .flags = 0x%" PRIx16 ", .type = %" PRIu16 " (%s) }"
 nbd_receive_simple_reply(int32_t error, const char *errname, uint64_t handle) "Got simple reply: { .error = %" PRId32 " (%s), handle = %" PRIu64" }"
 nbd_receive_structured_reply_chunk(uint16_t flags, uint16_t type, const char *name, uint64_t handle, uint32_t length) "Got structured reply chunk: { flags = 0x%" PRIx16 ", type = %d (%s), handle = %" PRIu64 ", length = %" PRIu32 " }"

@@ -60,7 +60,7 @@ nbd_negotiate_options_check_option(uint32_t option, const char *name) "Checking
 nbd_negotiate_begin(void) "Beginning negotiation"
 nbd_negotiate_new_style_size_flags(uint64_t size, unsigned flags) "advertising size %" PRIu64 " and flags 0x%x"
 nbd_negotiate_success(void) "Negotiation succeeded"
-nbd_receive_request(uint32_t magic, uint16_t flags, uint16_t type, uint64_t from, uint32_t len) "Got request: { magic = 0x%" PRIx32 ", .flags = 0x%" PRIx16 ", .type = 0x%" PRIx16 ", from = %" PRIu64 ", len = %" PRIu32 " }"
+nbd_receive_request(uint32_t magic, uint16_t flags, uint16_t type, uint64_t from, uint64_t len) "Got request: { magic = 0x%" PRIx32 ", .flags = 0x%" PRIx16 ", .type = 0x%" PRIx16 ", from = %" PRIu64 ", len = %" PRIu64 " }"
 nbd_blk_aio_attached(const char *name, void *ctx) "Export %s: Attaching clients to AIO context %p"
 nbd_blk_aio_detach(const char *name, void *ctx) "Export %s: Detaching clients from AIO context %p"
 nbd_co_send_simple_reply(uint64_t handle, uint32_t error, const char *errname, int len) "Send simple reply: handle = %" PRIu64 ", error = %" PRIu32 " (%s), len = %d"
@@ -70,6 +70,6 @@ nbd_co_send_structured_read_hole(uint64_t handle, uint64_t offset, size_t size)
 nbd_co_send_extents(uint64_t handle, unsigned int extents, uint32_t id, uint64_t length, int last) "Send block status reply: handle = %" PRIu64 ", extents = %u, context = %d (extents cover %" PRIu64 " bytes, last chunk = %d)"
 nbd_co_send_structured_error(uint64_t handle, int err, const char *errname, const char *msg) "Send structured error reply: handle = %" PRIu64 ", error = %d (%s), msg = '%s'"
 nbd_co_receive_request_decode_type(uint64_t handle, uint16_t type, const char *name) "Decoding type: handle = %" PRIu64 ", type = %" PRIu16 " (%s)"
-nbd_co_receive_request_payload_received(uint64_t handle, uint32_t len) "Payload received: handle = %" PRIu64 ", len = %" PRIu32
-nbd_co_receive_align_compliance(const char *op, uint64_t from, uint32_t len, uint32_t align) "client sent non-compliant unaligned %s request: from=0x%" PRIx64 ", len=0x%" PRIx32 ", align=0x%" PRIx32
+nbd_co_receive_request_payload_received(uint64_t handle, uint64_t len) "Payload received: handle = %" PRIu64 ", len = %" PRIu64
+nbd_co_receive_align_compliance(const char *op, uint64_t from, uint64_t len, uint32_t align) "client sent non-compliant unaligned %s request: from=0x%" PRIx64 ", len=0x%" PRIx64 ", align=0x%" PRIx32
 nbd_trip(void) "Reading request"
-- 
2.33.1



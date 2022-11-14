Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F02628E9C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:46:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouie7-0002QQ-JL; Mon, 14 Nov 2022 18:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidr-0001df-IM
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiGL-0002PN-2S
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7SMkdLnmr8zQDA/YEAOaatXmRMb68RmmXxsoqFCaBY=;
 b=Uy1mFv+iwV/gtyp6jAWSTzmgpNEYu9QmcFUW/CaltOrvkOAF4kkRT+PwliZFf/KAIvgWnF
 SSN3fn8PtkxlKUck1RwXq0ZnPnckgH1K6DU8mUK2LHOOapxga6Mp/JhQSYVrhoarSS+ULZ
 9UBgw8J5BWx0m7cslqLsz8rmjLmSevs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-1zK3yDK6OMyfoYX5N6GVJg-1; Mon, 14 Nov 2022 17:49:05 -0500
X-MC-Unique: 1zK3yDK6OMyfoYX5N6GVJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C724C3C0DDDB;
 Mon, 14 Nov 2022 22:49:04 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E07E40E42E3;
 Mon, 14 Nov 2022 22:49:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 13/15] nbd/server: Add FLAG_PAYLOAD support to
 CMD_BLOCK_STATUS
Date: Mon, 14 Nov 2022 16:48:46 -0600
Message-Id: <20221114224848.2186298-14-eblake@redhat.com>
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

Allow a client to request a subset of negotiated meta contexts.  For
example, a client may ask to use a single connection to learn about
both block status and dirty bitmaps, but where the dirty bitmap
queries only need to be performed on a subset of the disk; forcing the
server to compute that information on block status queries in the rest
of the disk is wasted effort (both at the server, and on the amount of
traffic sent over the wire to be parsed and ignored by the client).

Qemu as an NBD client never requests to use more than one meta
context, so it has no need to use block status payloads.  Testing this
instead requires support from libnbd, which CAN access multiple meta
contexts in parallel from a single NBD connection; an interop test
submitted to the libnbd project at the same time as this patch
demonstrates the feature working, as well as testing some corner cases
(for example, when the payload length is longer than the export
length), although other corner cases (like passing the same id
duplicated) requires a protocol fuzzer because libnbd is not wired up
to break the protocol that badly.

This also includes tweaks to 'qemu-nbd --list' to show when a server
is advertising the capability, and to the testsuite to reflect the
addition to that output.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/interop/nbd.txt                          |   2 +-
 include/block/nbd.h                           |  32 ++++--
 nbd/server.c                                  | 106 +++++++++++++++++-
 qemu-nbd.c                                    |   1 +
 nbd/trace-events                              |   1 +
 tests/qemu-iotests/223.out                    |  12 +-
 tests/qemu-iotests/307.out                    |  10 +-
 .../tests/nbd-qemu-allocation.out             |   2 +-
 8 files changed, 136 insertions(+), 30 deletions(-)

diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
index 988c072697..b7893043a3 100644
--- a/docs/interop/nbd.txt
+++ b/docs/interop/nbd.txt
@@ -69,4 +69,4 @@ NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
 NBD_CMD_FLAG_FAST_ZERO
 * 5.2: NBD_CMD_BLOCK_STATUS for "qemu:allocation-depth"
 * 7.1: NBD_FLAG_CAN_MULTI_CONN for shareable writable exports
-* 7.2: NBD_OPT_EXTENDED_HEADERS
+* 7.2: NBD_OPT_EXTENDED_HEADERS, NBD_FLAG_BLOCK_STATUS_PAYLOAD
diff --git a/include/block/nbd.h b/include/block/nbd.h
index 9a8ac1c8a5..2a65c606c9 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -167,6 +167,12 @@ typedef struct NBDExtentExt {
     uint64_t flags; /* NBD_STATE_* */
 } QEMU_PACKED NBDExtentExt;

+/* Client payload for limiting NBD_CMD_BLOCK_STATUS reply */
+typedef struct NBDBlockStatusPayload {
+    uint64_t effect_length;
+    /* uint32_t ids[] follows, array length implied by header */
+} QEMU_PACKED NBDBlockStatusPayload;
+
 /* Transmission (export) flags: sent from server to client during handshake,
    but describe what will happen during transmission */
 enum {
@@ -183,20 +189,22 @@ enum {
     NBD_FLAG_SEND_RESIZE_BIT        =  9, /* Send resize */
     NBD_FLAG_SEND_CACHE_BIT         = 10, /* Send CACHE (prefetch) */
     NBD_FLAG_SEND_FAST_ZERO_BIT     = 11, /* FAST_ZERO flag for WRITE_ZEROES */
+    NBD_FLAG_BLOCK_STAT_PAYLOAD_BIT = 12, /* PAYLOAD flag for BLOCK_STATUS */
 };

-#define NBD_FLAG_HAS_FLAGS         (1 << NBD_FLAG_HAS_FLAGS_BIT)
-#define NBD_FLAG_READ_ONLY         (1 << NBD_FLAG_READ_ONLY_BIT)
-#define NBD_FLAG_SEND_FLUSH        (1 << NBD_FLAG_SEND_FLUSH_BIT)
-#define NBD_FLAG_SEND_FUA          (1 << NBD_FLAG_SEND_FUA_BIT)
-#define NBD_FLAG_ROTATIONAL        (1 << NBD_FLAG_ROTATIONAL_BIT)
-#define NBD_FLAG_SEND_TRIM         (1 << NBD_FLAG_SEND_TRIM_BIT)
-#define NBD_FLAG_SEND_WRITE_ZEROES (1 << NBD_FLAG_SEND_WRITE_ZEROES_BIT)
-#define NBD_FLAG_SEND_DF           (1 << NBD_FLAG_SEND_DF_BIT)
-#define NBD_FLAG_CAN_MULTI_CONN    (1 << NBD_FLAG_CAN_MULTI_CONN_BIT)
-#define NBD_FLAG_SEND_RESIZE       (1 << NBD_FLAG_SEND_RESIZE_BIT)
-#define NBD_FLAG_SEND_CACHE        (1 << NBD_FLAG_SEND_CACHE_BIT)
-#define NBD_FLAG_SEND_FAST_ZERO    (1 << NBD_FLAG_SEND_FAST_ZERO_BIT)
+#define NBD_FLAG_HAS_FLAGS          (1 << NBD_FLAG_HAS_FLAGS_BIT)
+#define NBD_FLAG_READ_ONLY          (1 << NBD_FLAG_READ_ONLY_BIT)
+#define NBD_FLAG_SEND_FLUSH         (1 << NBD_FLAG_SEND_FLUSH_BIT)
+#define NBD_FLAG_SEND_FUA           (1 << NBD_FLAG_SEND_FUA_BIT)
+#define NBD_FLAG_ROTATIONAL         (1 << NBD_FLAG_ROTATIONAL_BIT)
+#define NBD_FLAG_SEND_TRIM          (1 << NBD_FLAG_SEND_TRIM_BIT)
+#define NBD_FLAG_SEND_WRITE_ZEROES  (1 << NBD_FLAG_SEND_WRITE_ZEROES_BIT)
+#define NBD_FLAG_SEND_DF            (1 << NBD_FLAG_SEND_DF_BIT)
+#define NBD_FLAG_CAN_MULTI_CONN     (1 << NBD_FLAG_CAN_MULTI_CONN_BIT)
+#define NBD_FLAG_SEND_RESIZE        (1 << NBD_FLAG_SEND_RESIZE_BIT)
+#define NBD_FLAG_SEND_CACHE         (1 << NBD_FLAG_SEND_CACHE_BIT)
+#define NBD_FLAG_SEND_FAST_ZERO     (1 << NBD_FLAG_SEND_FAST_ZERO_BIT)
+#define NBD_FLAG_BLOCK_STAT_PAYLOAD (1 << NBD_FLAG_BLOCK_STAT_PAYLOAD_BIT)

 /* New-style handshake (global) flags, sent from server to client, and
    control what will happen during handshake phase. */
diff --git a/nbd/server.c b/nbd/server.c
index 1fd1f32028..cd280f1721 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -441,9 +441,9 @@ static int nbd_negotiate_handle_list(NBDClient *client, Error **errp)
     return nbd_negotiate_send_rep(client, NBD_REP_ACK, errp);
 }

-static void nbd_check_meta_export(NBDClient *client)
+static void nbd_check_meta_export(NBDClient *client, NBDExport *exp)
 {
-    if (client->exp != client->context_exp) {
+    if (exp != client->context_exp) {
         client->contexts.count = 0;
     }
 }
@@ -486,11 +486,15 @@ static int nbd_negotiate_handle_export_name(NBDClient *client, bool no_zeroes,
         error_setg(errp, "export not found");
         return -EINVAL;
     }
+    nbd_check_meta_export(client, client->exp);

     myflags = client->exp->nbdflags;
     if (client->structured_reply) {
         myflags |= NBD_FLAG_SEND_DF;
     }
+    if (client->extended_headers && client->contexts.count) {
+        myflags |= NBD_FLAG_BLOCK_STAT_PAYLOAD;
+    }
     trace_nbd_negotiate_new_style_size_flags(client->exp->size, myflags);
     stq_be_p(buf, client->exp->size);
     stw_be_p(buf + 8, myflags);
@@ -503,7 +507,6 @@ static int nbd_negotiate_handle_export_name(NBDClient *client, bool no_zeroes,

     QTAILQ_INSERT_TAIL(&client->exp->clients, client, next);
     blk_exp_ref(&client->exp->common);
-    nbd_check_meta_export(client);

     return 0;
 }
@@ -623,6 +626,9 @@ static int nbd_negotiate_handle_info(NBDClient *client, Error **errp)
                                           errp, "export '%s' not present",
                                           sane_name);
     }
+    if (client->opt == NBD_OPT_GO) {
+        nbd_check_meta_export(client, exp);
+    }

     /* Don't bother sending NBD_INFO_NAME unless client requested it */
     if (sendname) {
@@ -676,6 +682,10 @@ static int nbd_negotiate_handle_info(NBDClient *client, Error **errp)
     if (client->structured_reply) {
         myflags |= NBD_FLAG_SEND_DF;
     }
+    if (client->extended_headers &&
+        (client->contexts.count || client->opt == NBD_OPT_INFO)) {
+        myflags |= NBD_FLAG_BLOCK_STAT_PAYLOAD;
+    }
     trace_nbd_negotiate_new_style_size_flags(exp->size, myflags);
     stq_be_p(buf, exp->size);
     stw_be_p(buf + 8, myflags);
@@ -711,7 +721,6 @@ static int nbd_negotiate_handle_info(NBDClient *client, Error **errp)
         client->check_align = check_align;
         QTAILQ_INSERT_TAIL(&client->exp->clients, client, next);
         blk_exp_ref(&client->exp->common);
-        nbd_check_meta_export(client);
         rc = 1;
     }
     return rc;
@@ -2406,6 +2415,83 @@ static int nbd_co_send_bitmap(NBDClient *client, NBDRequest *request,
     return nbd_co_send_extents(client, request, ea, last, context_id, errp);
 }

+/*
+ * nbd_co_block_status_payload_read
+ * Called when a client wants a subset of negotiated contexts via a
+ * BLOCK_STATUS payload.  Check the payload for valid length and
+ * contents.  On success, return 0 with request updated to effective
+ * length.  If request was invalid but payload consumed, return 0 with
+ * request->len and request->contexts.count set to 0 (which will
+ * trigger an appropriate NBD_EINVAL response later on).  On I/O
+ * error, return -EIO.
+ */
+static int
+nbd_co_block_status_payload_read(NBDClient *client, NBDRequest *request,
+                                 Error **errp)
+{
+    int payload_len = request->len;
+    g_autofree char *buf = NULL;
+    g_autofree bool *bitmaps = NULL;
+    size_t count, i;
+    uint32_t id;
+
+    assert(request->len <= NBD_MAX_BUFFER_SIZE);
+    if (payload_len % sizeof(uint32_t) ||
+        payload_len < sizeof(NBDBlockStatusPayload) ||
+        payload_len > (sizeof(NBDBlockStatusPayload) +
+                       sizeof(id) * client->contexts.count)) {
+        goto skip;
+    }
+
+    buf = g_malloc(payload_len);
+    if (nbd_read(client->ioc, buf, payload_len,
+                 "CMD_BLOCK_STATUS data", errp) < 0) {
+        return -EIO;
+    }
+    trace_nbd_co_receive_request_payload_received(request->handle,
+                                                  payload_len);
+    memset(&request->contexts, 0, sizeof(request->contexts));
+    request->contexts.nr_bitmaps = client->context_exp->nr_export_bitmaps;
+    bitmaps = g_new0(bool, request->contexts.nr_bitmaps);
+    count = (payload_len - sizeof(NBDBlockStatusPayload)) / sizeof(id);
+    payload_len = 0;
+
+    for (i = 0; i < count; i++) {
+
+        id = ldl_be_p(buf + sizeof(NBDBlockStatusPayload) + sizeof(id) * i);
+        if (id == NBD_META_ID_BASE_ALLOCATION) {
+            if (request->contexts.base_allocation) {
+                goto skip;
+            }
+            request->contexts.base_allocation = true;
+        } else if (id == NBD_META_ID_ALLOCATION_DEPTH) {
+            if (request->contexts.allocation_depth) {
+                goto skip;
+            }
+            request->contexts.allocation_depth = true;
+        } else {
+            if (id - NBD_META_ID_DIRTY_BITMAP >
+                request->contexts.nr_bitmaps ||
+                bitmaps[id - NBD_META_ID_DIRTY_BITMAP]) {
+                goto skip;
+            }
+            bitmaps[id - NBD_META_ID_DIRTY_BITMAP] = true;
+        }
+    }
+
+    request->len = ldq_be_p(buf);
+    request->contexts.count = count;
+    request->contexts.bitmaps = bitmaps;
+    bitmaps = NULL;
+    return 0;
+
+ skip:
+    trace_nbd_co_receive_block_status_payload_compliance(request->from,
+                                                         request->len);
+    request->len = request->contexts.count = 0;
+    return nbd_drop(client->ioc, payload_len, errp);
+}
+
 /* nbd_co_receive_request
  * Collect a client request. Return 0 if request looks valid, -EIO to drop
  * connection right away, -EAGAIN to indicate we were interrupted and the
@@ -2452,7 +2538,14 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,

         if (request->type == NBD_CMD_WRITE || extended_with_payload) {
             payload_len = request->len;
-            if (request->type != NBD_CMD_WRITE) {
+            if (request->type == NBD_CMD_BLOCK_STATUS) {
+                payload_len = nbd_co_block_status_payload_read(client,
+                                                               request,
+                                                               errp);
+                if (payload_len < 0) {
+                    return -EIO;
+                }
+            } else if (request->type != NBD_CMD_WRITE) {
                 /*
                  * For now, we don't support payloads on other
                  * commands; but we can keep the connection alive.
@@ -2528,6 +2621,9 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
         valid_flags |= NBD_CMD_FLAG_NO_HOLE | NBD_CMD_FLAG_FAST_ZERO;
     } else if (request->type == NBD_CMD_BLOCK_STATUS) {
         valid_flags |= NBD_CMD_FLAG_REQ_ONE;
+        if (client->extended_headers && client->contexts.count) {
+            valid_flags |= NBD_CMD_FLAG_PAYLOAD_LEN;
+        }
     }
     if (request->flags & ~valid_flags) {
         error_setg(errp, "unsupported flags for command %s (got 0x%x)",
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 9404164487..4ae5c5e73e 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -222,6 +222,7 @@ static int qemu_nbd_client_list(SocketAddress *saddr, QCryptoTLSCreds *tls,
                 [NBD_FLAG_SEND_RESIZE_BIT]          = "resize",
                 [NBD_FLAG_SEND_CACHE_BIT]           = "cache",
                 [NBD_FLAG_SEND_FAST_ZERO_BIT]       = "fast-zero",
+                [NBD_FLAG_BLOCK_STAT_PAYLOAD_BIT]   = "block-status-payload",
             };

             printf("  size:  %" PRIu64 "\n", list[i].size);
diff --git a/nbd/trace-events b/nbd/trace-events
index c20df33a43..da92fe1b56 100644
--- a/nbd/trace-events
+++ b/nbd/trace-events
@@ -70,6 +70,7 @@ nbd_co_send_structured_read(uint64_t handle, uint64_t offset, void *data, size_t
 nbd_co_send_structured_read_hole(uint64_t handle, uint64_t offset, size_t size) "Send structured read hole reply: handle = %" PRIu64 ", offset = %" PRIu64 ", len = %zu"
 nbd_co_send_extents(uint64_t handle, unsigned int extents, uint32_t id, uint64_t length, int last) "Send block status reply: handle = %" PRIu64 ", extents = %u, context = %d (extents cover %" PRIu64 " bytes, last chunk = %d)"
 nbd_co_send_structured_error(uint64_t handle, int err, const char *errname, const char *msg) "Send structured error reply: handle = %" PRIu64 ", error = %d (%s), msg = '%s'"
+nbd_co_receive_block_status_payload_compliance(uint64_t from, int len) "client sent unusable block status payload: from=0x%" PRIx64 ", len=0x%x"
 nbd_co_receive_request_decode_type(uint64_t handle, uint16_t type, const char *name) "Decoding type: handle = %" PRIu64 ", type = %" PRIu16 " (%s)"
 nbd_co_receive_request_payload_received(uint64_t handle, uint64_t len) "Payload received: handle = %" PRIu64 ", len = %" PRIu64
 nbd_co_receive_ext_payload_compliance(uint64_t from, uint64_t len) "client sent non-compliant write without payload flag: from=0x%" PRIx64 ", len=0x%" PRIx64
diff --git a/tests/qemu-iotests/223.out b/tests/qemu-iotests/223.out
index b98582c38e..b38f0b7963 100644
--- a/tests/qemu-iotests/223.out
+++ b/tests/qemu-iotests/223.out
@@ -83,7 +83,7 @@ exports available: 0
 exports available: 3
  export: 'n'
   size:  4194304
-  flags: 0x58f ( readonly flush fua df multi cache )
+  flags: 0x158f ( readonly flush fua df multi cache block-status-payload )
   min block: 1
   opt block: 4096
   max block: 33554432
@@ -94,7 +94,7 @@ exports available: 3
  export: 'n2'
   description: some text
   size:  4194304
-  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
+  flags: 0x1ded ( flush fua trim zeroes df multi cache fast-zero block-status-payload )
   min block: 1
   opt block: 4096
   max block: 33554432
@@ -104,7 +104,7 @@ exports available: 3
    qemu:dirty-bitmap:b2
  export: 'n3'
   size:  4194304
-  flags: 0x58f ( readonly flush fua df multi cache )
+  flags: 0x158f ( readonly flush fua df multi cache block-status-payload )
   min block: 1
   opt block: 4096
   max block: 33554432
@@ -205,7 +205,7 @@ exports available: 0
 exports available: 3
  export: 'n'
   size:  4194304
-  flags: 0x58f ( readonly flush fua df multi cache )
+  flags: 0x158f ( readonly flush fua df multi cache block-status-payload )
   min block: 1
   opt block: 4096
   max block: 33554432
@@ -216,7 +216,7 @@ exports available: 3
  export: 'n2'
   description: some text
   size:  4194304
-  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
+  flags: 0x1ded ( flush fua trim zeroes df multi cache fast-zero block-status-payload )
   min block: 1
   opt block: 4096
   max block: 33554432
@@ -226,7 +226,7 @@ exports available: 3
    qemu:dirty-bitmap:b2
  export: 'n3'
   size:  4194304
-  flags: 0x58f ( readonly flush fua df multi cache )
+  flags: 0x158f ( readonly flush fua df multi cache block-status-payload )
   min block: 1
   opt block: 4096
   max block: 33554432
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index 2b9a6a67a1..f645f3315f 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -15,7 +15,7 @@ wrote 4096/4096 bytes at offset 0
 exports available: 1
  export: 'fmt'
   size:  67108864
-  flags: 0x58f ( readonly flush fua df multi cache )
+  flags: 0x158f ( readonly flush fua df multi cache block-status-payload )
   min block: XXX
   opt block: XXX
   max block: XXX
@@ -44,7 +44,7 @@ exports available: 1
 exports available: 1
  export: 'fmt'
   size:  67108864
-  flags: 0x58f ( readonly flush fua df multi cache )
+  flags: 0x158f ( readonly flush fua df multi cache block-status-payload )
   min block: XXX
   opt block: XXX
   max block: XXX
@@ -76,7 +76,7 @@ exports available: 1
 exports available: 2
  export: 'fmt'
   size:  67108864
-  flags: 0x58f ( readonly flush fua df multi cache )
+  flags: 0x158f ( readonly flush fua df multi cache block-status-payload )
   min block: XXX
   opt block: XXX
   max block: XXX
@@ -86,7 +86,7 @@ exports available: 2
  export: 'export1'
   description: This is the writable second export
   size:  67108864
-  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
+  flags: 0x1ded ( flush fua trim zeroes df multi cache fast-zero block-status-payload )
   min block: XXX
   opt block: XXX
   max block: XXX
@@ -113,7 +113,7 @@ exports available: 1
  export: 'export1'
   description: This is the writable second export
   size:  67108864
-  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
+  flags: 0x1ded ( flush fua trim zeroes df multi cache fast-zero block-status-payload )
   min block: XXX
   opt block: XXX
   max block: XXX
diff --git a/tests/qemu-iotests/tests/nbd-qemu-allocation.out b/tests/qemu-iotests/tests/nbd-qemu-allocation.out
index 659276032b..794d1bfce6 100644
--- a/tests/qemu-iotests/tests/nbd-qemu-allocation.out
+++ b/tests/qemu-iotests/tests/nbd-qemu-allocation.out
@@ -17,7 +17,7 @@ wrote 2097152/2097152 bytes at offset 1048576
 exports available: 1
  export: ''
   size:  4194304
-  flags: 0x48f ( readonly flush fua df cache )
+  flags: 0x148f ( readonly flush fua df cache block-status-payload )
   min block: 1
   opt block: 4096
   max block: 33554432
-- 
2.38.1



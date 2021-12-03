Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F446805E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:29:47 +0100 (CET)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHzu-0000ff-F9
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:29:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHnE-0007sn-2W
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHnA-0003AJ-8o
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJ9jZN2mFIPKC1TvOx/EIHpjsFOSdT4uXj0cLOay0Io=;
 b=AuFA2fBwYFJ3PyAtRJZQiry4PJI9oiiGyAWpC7gj6Dhq61i8V4XAwFnP3nh3+jCmqm26/q
 KHJSx3DQS5FXXpKYEUbeRbNm4l6CS/RL4Cg2r1REB8vTeyK5k9ypBmuwltyHJAflJ/wp6K
 u/zPD3Y9OOtpWnJC53mJbqYqCyR0qb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-syNAAt3rPAistbgMmqGFWw-1; Fri, 03 Dec 2021 18:16:34 -0500
X-MC-Unique: syNAAt3rPAistbgMmqGFWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 643D494EE0;
 Fri,  3 Dec 2021 23:16:33 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CD6F5D9D5;
 Fri,  3 Dec 2021 23:16:28 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/14] nbd/client: Accept 64-bit block status chunks
Date: Fri,  3 Dec 2021 17:15:37 -0600
Message-Id: <20211203231539.3900865-13-eblake@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, nbd@other.debian.org, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because we use NBD_CMD_FLAG_REQ_ONE with NBD_CMD_BLOCK_STATUS, a
client in narrow mode should not be able to provoke a server into
sending a block status result larger than the client's 32-bit request.
But in extended mode, a 64-bit status request must be able to handle a
64-bit status result, once a future patch enables the client
requesting extended mode.  We can also tolerate a non-compliant server
sending the new chunk even when it should not.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index c5dea864ebb6..bd4a9c407bde 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -563,13 +563,15 @@ static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
  */
 static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
                                          NBDStructuredReplyChunk *chunk,
-                                         uint8_t *payload, uint64_t orig_length,
-                                         NBDExtent *extent, Error **errp)
+                                         uint8_t *payload, bool wide,
+                                         uint64_t orig_length,
+                                         NBDExtentExt *extent, Error **errp)
 {
     uint32_t context_id;
+    size_t len = wide ? sizeof(*extent) : sizeof(NBDExtent);

     /* The server succeeded, so it must have sent [at least] one extent */
-    if (chunk->length < sizeof(context_id) + sizeof(*extent)) {
+    if (chunk->length < sizeof(context_id) + len) {
         error_setg(errp, "Protocol error: invalid payload for "
                          "NBD_REPLY_TYPE_BLOCK_STATUS");
         return -EINVAL;
@@ -584,8 +586,16 @@ static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
         return -EINVAL;
     }

-    extent->length = payload_advance32(&payload);
-    extent->flags = payload_advance32(&payload);
+    if (wide) {
+        extent->length = payload_advance64(&payload);
+        extent->flags = payload_advance32(&payload);
+        if (payload_advance32(&payload) != 0) {
+            trace_nbd_parse_blockstatus_compliance("non-zero extent padding");
+        }
+    } else {
+        extent->length = payload_advance32(&payload);
+        extent->flags = payload_advance32(&payload);
+    }

     if (extent->length == 0) {
         error_setg(errp, "Protocol error: server sent status chunk with "
@@ -625,7 +635,7 @@ static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
      * connection; just ignore trailing extents, and clamp things to
      * the length of our request.
      */
-    if (chunk->length > sizeof(context_id) + sizeof(*extent)) {
+    if (chunk->length > sizeof(context_id) + len) {
         trace_nbd_parse_blockstatus_compliance("more than one extent");
     }
     if (extent->length > orig_length) {
@@ -1081,7 +1091,7 @@ static int nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t handle,

 static int nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
                                             uint64_t handle, uint64_t length,
-                                            NBDExtent *extent,
+                                            NBDExtentExt *extent,
                                             int *request_ret, Error **errp)
 {
     NBDReplyChunkIter iter;
@@ -1098,6 +1108,11 @@ static int nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
         assert(nbd_reply_is_structured(&reply));

         switch (chunk->type) {
+        case NBD_REPLY_TYPE_BLOCK_STATUS_EXT:
+            if (!s->info.extended_headers) {
+                trace_nbd_extended_headers_compliance("block_status_ext");
+            }
+            /* fallthrough */
         case NBD_REPLY_TYPE_BLOCK_STATUS:
             if (received) {
                 nbd_channel_error(s, -EINVAL);
@@ -1106,9 +1121,10 @@ static int nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
             }
             received = true;

-            ret = nbd_parse_blockstatus_payload(s, &reply.structured,
-                                                payload, length, extent,
-                                                &local_err);
+            ret = nbd_parse_blockstatus_payload(
+                s, &reply.structured, payload,
+                chunk->type == NBD_REPLY_TYPE_BLOCK_STATUS_EXT,
+                length, extent, &local_err);
             if (ret < 0) {
                 nbd_channel_error(s, ret);
                 nbd_iter_channel_error(&iter, ret, &local_err);
@@ -1337,7 +1353,7 @@ static int coroutine_fn nbd_client_co_block_status(
         int64_t *pnum, int64_t *map, BlockDriverState **file)
 {
     int ret, request_ret;
-    NBDExtent extent = { 0 };
+    NBDExtentExt extent = { 0 };
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     Error *local_err = NULL;

-- 
2.33.1



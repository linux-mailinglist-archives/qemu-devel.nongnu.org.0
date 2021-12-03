Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8204A468061
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:31:08 +0100 (CET)
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtI1D-0003Wd-Is
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:31:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoc-0002PI-9b
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoX-0003Jy-PG
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFgsUcfC1h8az0y3VTWWm6qG/l5X1huw2oQ+ZNKlM1I=;
 b=bZRUoiqL8C4ZdyQq8jWKwMP8uaBUFNaSO/boYonQITOEcutkkgKR5B8Cftk9l6Ivr1a2Jf
 rmZktCGGYNVcNIgvjqUzsg19jf5UwoSL665yhXwNdJBDu9j/EJRz6zWJqGnDTSHg0uNtTw
 U+4cdAOFGVaggPJndivXsIP8+/kArjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-40-PZayFiBgP-qbyP7yhIDTlQ-1; Fri, 03 Dec 2021 18:18:00 -0500
X-MC-Unique: PZayFiBgP-qbyP7yhIDTlQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 022DF2F25;
 Fri,  3 Dec 2021 23:17:59 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FAB65DF37;
 Fri,  3 Dec 2021 23:17:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Subject: [libnbd PATCH 06/13] protocol: Accept 64-bit holes during pread
Date: Fri,  3 Dec 2021 17:17:34 -0600
Message-Id: <20211203231741.3901263-7-eblake@redhat.com>
In-Reply-To: <20211203231741.3901263-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231741.3901263-1-eblake@redhat.com>
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though we don't allow the user to request NBD_CMD_READ with more
than 64M (and even if we did, our API signature caps us at SIZE_MAX,
which is 32 bits on a 32-bit machine), the NBD extension to allow
64-bit requests implies that for symmetry we have to be able to
support 64-bit holes over the wire.  Note that we don't have to change
the signature of the callback for nbd_pread_structured; nor is it
worth adding a counterpart to LIBNBD_READ_HOLE, because it is unlikely
that a user callback will ever need to distinguish between which size
was sent over the wire, when the value is always less than 32 bits.

While we cannot guarantee which size structured reply the server will
use, it is easy enough to handle both sizes, even for a non-compliant
server that sends wide replies when extended headers were not
negotiated.  Of course, until a later patch enables extended headers
negotiation, no compliant server will trigger the new code here.
---
 lib/internal.h                      |  1 +
 generator/states-reply-structured.c | 41 +++++++++++++++++++++++++----
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index c9f84441..06f3a65c 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -231,6 +231,7 @@ struct nbd_handle {
       union {
         struct nbd_structured_reply_offset_data offset_data;
         struct nbd_structured_reply_offset_hole offset_hole;
+        struct nbd_structured_reply_offset_hole_ext offset_hole_ext;
         struct {
           struct nbd_structured_reply_error error;
           char msg[NBD_MAX_STRING]; /* Common to all error types */
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index 1b675e8d..a3e0e2ac 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -26,15 +26,16 @@
  * requesting command.
  */
 static bool
-structured_reply_in_bounds (uint64_t offset, uint32_t length,
+structured_reply_in_bounds (uint64_t offset, uint64_t length,
                             const struct command *cmd)
 {
   if (offset < cmd->offset ||
       offset >= cmd->offset + cmd->count ||
-      offset + length > cmd->offset + cmd->count) {
+      length > cmd->offset + cmd->count ||
+      offset > cmd->offset + cmd->count - length) {
     set_error (0, "range of structured reply is out of bounds, "
                "offset=%" PRIu64 ", cmd->offset=%" PRIu64 ", "
-               "length=%" PRIu32 ", cmd->count=%" PRIu64 ": "
+               "length=%" PRIu64 ", cmd->count=%" PRIu64 ": "
                "this is likely to be a bug in the NBD server",
                offset, cmd->offset, length, cmd->count);
     return false;
@@ -182,6 +183,25 @@ STATE_MACHINE {
     SET_NEXT_STATE (%RECV_OFFSET_HOLE);
     return 0;
   }
+  else if (type == NBD_REPLY_TYPE_OFFSET_HOLE_EXT) {
+    if (cmd->type != NBD_CMD_READ) {
+      SET_NEXT_STATE (%.DEAD);
+      set_error (0, "invalid command for receiving offset-hole chunk, "
+                 "cmd->type=%" PRIu16 ", "
+                 "this is likely to be a bug in the server",
+                 cmd->type);
+      return 0;
+    }
+    if (length != sizeof h->sbuf.sr.payload.offset_hole_ext) {
+      SET_NEXT_STATE (%.DEAD);
+      set_error (0, "invalid length in NBD_REPLY_TYPE_OFFSET_HOLE_EXT");
+      return 0;
+    }
+    h->rbuf = &h->sbuf.sr.payload.offset_hole_ext;
+    h->rlen = sizeof h->sbuf.sr.payload.offset_hole_ext;
+    SET_NEXT_STATE (%RECV_OFFSET_HOLE);
+    return 0;
+  }
   else if (type == NBD_REPLY_TYPE_BLOCK_STATUS) {
     if (cmd->type != NBD_CMD_BLOCK_STATUS) {
       SET_NEXT_STATE (%.DEAD);
@@ -415,7 +435,8 @@ STATE_MACHINE {
  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
   struct command *cmd = h->reply_cmd;
   uint64_t offset;
-  uint32_t length;
+  uint64_t length;
+  uint16_t type;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -425,7 +446,14 @@ STATE_MACHINE {
     return 0;
   case 0:
     offset = be64toh (h->sbuf.sr.payload.offset_hole.offset);
-    length = be32toh (h->sbuf.sr.payload.offset_hole.length);
+    type = be16toh (h->sbuf.sr.hdr.structured_reply.type);
+
+    if (type == NBD_REPLY_TYPE_OFFSET_HOLE)
+      length = be32toh (h->sbuf.sr.payload.offset_hole.length);
+    else {
+      /* XXX Insist on h->extended_headers? */
+      length = be64toh (h->sbuf.sr.payload.offset_hole_ext.length);
+    }

     assert (cmd); /* guaranteed by CHECK */

@@ -443,7 +471,10 @@ STATE_MACHINE {
     /* The spec states that 0-length requests are unspecified, but
      * 0-length replies are broken. Still, it's easy enough to support
      * them as an extension, and this works even when length == 0.
+     * Although length is 64 bits, the bounds check above ensures that
+     * it is no larger than the 64M cap we put on NBD_CMD_READ.
      */
+    assert (length <= SIZE_MAX);
     memset (cmd->data + offset, 0, length);
     if (CALLBACK_IS_NOT_NULL (cmd->cb.fn.chunk)) {
       int error = cmd->error;
-- 
2.33.1



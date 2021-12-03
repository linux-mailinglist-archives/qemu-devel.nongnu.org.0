Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4046805A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:28:00 +0100 (CET)
Received: from localhost ([::1]:51616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHyB-00064e-Vv
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:28:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoa-0002Jj-Rw
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoX-0003J8-Lh
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTpBsqjX/tDSRP89cOo6/sPp8ri6Mo4ddFoj0TZLdkA=;
 b=Rq0OG1ZfUrIjksh53MeyoB7KJSa9Ip/mQSxu3elt4UAhGlBhyNYJcLlUDUswgESUju9kXx
 sWo8tBxaV7ktz6fZqn9J7j9K/OqksdlvOfM4gbUbWQBSwLLqo5y8GKpdfORf5LzpNUXPU+
 kX5Ft4KxcbINs6UwNVeeV9h4GWv6NOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-V1nvNtiePZaZ2BbwnDcmZw-1; Fri, 03 Dec 2021 18:17:59 -0500
X-MC-Unique: V1nvNtiePZaZ2BbwnDcmZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0B3F801B01;
 Fri,  3 Dec 2021 23:17:57 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AB2C5DF2B;
 Fri,  3 Dec 2021 23:17:56 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Subject: [libnbd PATCH 05/13] protocol: Prepare to receive 64-bit replies
Date: Fri,  3 Dec 2021 17:17:33 -0600
Message-Id: <20211203231741.3901263-6-eblake@redhat.com>
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support receiving headers for 64-bit replies if extended headers were
negotiated.  We already insist that the server not send us too much
payload in one reply, so we can exploit that and merge the 64-bit
length back into a normalized 32-bit field for the rest of the payload
length calculations.  The NBD protocol specifically made extended
simple and structured replies both occupy 32 bytes, while the handle
field is still in the same offset between all reply types.

Note that if we negotiate extended headers, but a non-compliant server
replies with a non-extended header, we will stall waiting for the
server to send more bytes rather than noticing that the magic number
is wrong.  The alternative would be to read just the first 4 bytes of
magic, then determine how many more bytes to expect; but that would
require more states and syscalls, and not worth it since the typical
server will be compliant.

At this point, h->extended_headers is permanently false (we can't
enable it until all other aspects of the protocol have likewise been
converted).
---
 lib/internal.h                      |  8 +++-
 generator/states-reply-structured.c | 59 +++++++++++++++++++----------
 generator/states-reply.c            | 31 +++++++++++----
 3 files changed, 68 insertions(+), 30 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 07378588..c9f84441 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -222,8 +222,12 @@ struct nbd_handle {
     }  __attribute__((packed)) or;
     struct nbd_export_name_option_reply export_name_reply;
     struct nbd_simple_reply simple_reply;
+    struct nbd_simple_reply_ext simple_reply_ext;
     struct {
-      struct nbd_structured_reply structured_reply;
+      union {
+        struct nbd_structured_reply structured_reply;
+        struct nbd_structured_reply_ext structured_reply_ext;
+      } hdr;
       union {
         struct nbd_structured_reply_offset_data offset_data;
         struct nbd_structured_reply_offset_hole offset_hole;
@@ -233,7 +237,7 @@ struct nbd_handle {
           uint64_t offset; /* Only used for NBD_REPLY_TYPE_ERROR_OFFSET */
         } __attribute__((packed)) error;
       } payload;
-    }  __attribute__((packed)) sr;
+    } sr;
     uint16_t gflags;
     uint32_t cflags;
     uint32_t len;
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index 5524e000..1b675e8d 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -45,19 +45,23 @@ structured_reply_in_bounds (uint64_t offset, uint32_t length,

 STATE_MACHINE {
  REPLY.STRUCTURED_REPLY.START:
-  /* We've only read the simple_reply.  The structured_reply is longer,
-   * so read the remaining part.
+  /* We've only read the simple_reply.  Unless we have extended headers,
+   * the structured_reply is longer, so read the remaining part.
    */
   if (!h->structured_replies) {
     set_error (0, "server sent unexpected structured reply");
     SET_NEXT_STATE(%.DEAD);
     return 0;
   }
-  h->rbuf = &h->sbuf;
-  h->rbuf += sizeof h->sbuf.simple_reply;
-  h->rlen = sizeof h->sbuf.sr.structured_reply;
-  h->rlen -= sizeof h->sbuf.simple_reply;
-  SET_NEXT_STATE (%RECV_REMAINING);
+  if (h->extended_headers)
+    SET_NEXT_STATE (%CHECK);
+  else {
+    h->rbuf = &h->sbuf;
+    h->rbuf += sizeof h->sbuf.simple_reply;
+    h->rlen = sizeof h->sbuf.sr.hdr.structured_reply;
+    h->rlen -= sizeof h->sbuf.simple_reply;
+    SET_NEXT_STATE (%RECV_REMAINING);
+  }
   return 0;

  REPLY.STRUCTURED_REPLY.RECV_REMAINING:
@@ -75,12 +79,21 @@ STATE_MACHINE {
   struct command *cmd = h->reply_cmd;
   uint16_t flags, type;
   uint64_t cookie;
-  uint32_t length;
+  uint64_t length;

-  flags = be16toh (h->sbuf.sr.structured_reply.flags);
-  type = be16toh (h->sbuf.sr.structured_reply.type);
-  cookie = be64toh (h->sbuf.sr.structured_reply.handle);
-  length = be32toh (h->sbuf.sr.structured_reply.length);
+  flags = be16toh (h->sbuf.sr.hdr.structured_reply.flags);
+  type = be16toh (h->sbuf.sr.hdr.structured_reply.type);
+  cookie = be64toh (h->sbuf.sr.hdr.structured_reply.handle);
+  if (h->extended_headers) {
+    length = be64toh (h->sbuf.sr.hdr.structured_reply_ext.length);
+    if (h->sbuf.sr.hdr.structured_reply_ext.pad) {
+      set_error (0, "server sent non-zero padding in structured reply header");
+      SET_NEXT_STATE(%.DEAD);
+      return 0;
+    }
+  }
+  else
+    length = be32toh (h->sbuf.sr.hdr.structured_reply.length);

   assert (cmd);
   assert (cmd->cookie == cookie);
@@ -97,6 +110,10 @@ STATE_MACHINE {
     SET_NEXT_STATE (%.DEAD);
     return 0;
   }
+  /* For convenience, we now normalize extended replies into compact,
+   * doable since we validated length fits in 32 bits.
+   */
+  h->sbuf.sr.hdr.structured_reply.length = length;

   if (NBD_REPLY_TYPE_IS_ERR (type)) {
     if (length < sizeof h->sbuf.sr.payload.error.error) {
@@ -207,7 +224,7 @@ STATE_MACHINE {
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.sr.structured_reply.length);
+    length = h->sbuf.sr.hdr.structured_reply.length; /* normalized in CHECK */
     msglen = be16toh (h->sbuf.sr.payload.error.error.len);
     if (msglen > length - sizeof h->sbuf.sr.payload.error.error ||
         msglen > sizeof h->sbuf.sr.payload.error.msg) {
@@ -233,9 +250,9 @@ STATE_MACHINE {
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.sr.structured_reply.length);
+    length = h->sbuf.sr.hdr.structured_reply.length; /* normalized in CHECK */
     msglen = be16toh (h->sbuf.sr.payload.error.error.len);
-    type = be16toh (h->sbuf.sr.structured_reply.type);
+    type = be16toh (h->sbuf.sr.hdr.structured_reply.type);

     length -= sizeof h->sbuf.sr.payload.error.error + msglen;

@@ -281,7 +298,7 @@ STATE_MACHINE {
     return 0;
   case 0:
     error = be32toh (h->sbuf.sr.payload.error.error.error);
-    type = be16toh (h->sbuf.sr.structured_reply.type);
+    type = be16toh (h->sbuf.sr.hdr.structured_reply.type);

     assert (cmd); /* guaranteed by CHECK */
     error = nbd_internal_errno_of_nbd_error (error);
@@ -339,7 +356,7 @@ STATE_MACHINE {
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.sr.structured_reply.length);
+    length = h->sbuf.sr.hdr.structured_reply.length; /* normalized in CHECK */
     offset = be64toh (h->sbuf.sr.payload.offset_data.offset);

     assert (cmd); /* guaranteed by CHECK */
@@ -377,7 +394,7 @@ STATE_MACHINE {
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.sr.structured_reply.length);
+    length = h->sbuf.sr.hdr.structured_reply.length; /* normalized in CHECK */
     offset = be64toh (h->sbuf.sr.payload.offset_data.offset);

     assert (cmd); /* guaranteed by CHECK */
@@ -454,7 +471,7 @@ STATE_MACHINE {
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.sr.structured_reply.length);
+    length = h->sbuf.sr.hdr.structured_reply.length; /* normalized in CHECK */

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
@@ -489,7 +506,7 @@ STATE_MACHINE {
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.sr.structured_reply.length);
+    length = h->sbuf.sr.hdr.structured_reply.length; /* normalized in CHECK */

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
@@ -535,7 +552,7 @@ STATE_MACHINE {
  REPLY.STRUCTURED_REPLY.FINISH:
   uint16_t flags;

-  flags = be16toh (h->sbuf.sr.structured_reply.flags);
+  flags = be16toh (h->sbuf.sr.hdr.structured_reply.flags);
   if (flags & NBD_REPLY_FLAG_DONE) {
     SET_NEXT_STATE (%^FINISH_COMMAND);
   }
diff --git a/generator/states-reply.c b/generator/states-reply.c
index 9099a76a..949e982e 100644
--- a/generator/states-reply.c
+++ b/generator/states-reply.c
@@ -1,5 +1,5 @@
 /* nbd client library in userspace: state machine
- * Copyright (C) 2013-2019 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -68,7 +68,10 @@ STATE_MACHINE {
   assert (h->rlen == 0);

   h->rbuf = &h->sbuf;
-  h->rlen = sizeof h->sbuf.simple_reply;
+  if (h->extended_headers)
+    h->rlen = sizeof h->sbuf.simple_reply_ext;
+  else
+    h->rlen = sizeof h->sbuf.simple_reply;

   r = h->sock->ops->recv (h, h->sock, h->rbuf, h->rlen);
   if (r == -1) {
@@ -113,13 +116,27 @@ STATE_MACHINE {
   uint64_t cookie;

   magic = be32toh (h->sbuf.simple_reply.magic);
-  if (magic == NBD_SIMPLE_REPLY_MAGIC) {
+  switch (magic) {
+  case NBD_SIMPLE_REPLY_MAGIC:
+  case NBD_SIMPLE_REPLY_EXT_MAGIC:
+    if ((magic == NBD_SIMPLE_REPLY_MAGIC) == h->extended_headers)
+      goto invalid;
+    if (magic == NBD_SIMPLE_REPLY_EXT_MAGIC &&
+        (h->sbuf.simple_reply_ext.pad1 || h->sbuf.simple_reply_ext.pad2)) {
+      set_error (0, "server sent non-zero padding in simple reply header");
+      SET_NEXT_STATE (%.DEAD);
+      return 0;
+    }
     SET_NEXT_STATE (%SIMPLE_REPLY.START);
-  }
-  else if (magic == NBD_STRUCTURED_REPLY_MAGIC) {
+    break;
+  case NBD_STRUCTURED_REPLY_MAGIC:
+  case NBD_STRUCTURED_REPLY_EXT_MAGIC:
+    if ((magic == NBD_STRUCTURED_REPLY_MAGIC) == h->extended_headers)
+      goto invalid;
     SET_NEXT_STATE (%STRUCTURED_REPLY.START);
-  }
-  else {
+    break;
+  default:
+  invalid:
     SET_NEXT_STATE (%.DEAD); /* We've probably lost synchronization. */
     set_error (0, "invalid reply magic");
     return 0;
-- 
2.33.1



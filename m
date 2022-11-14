Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC05628D6B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:28:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouieG-0002tw-R6; Mon, 14 Nov 2022 18:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouido-0001m0-OI
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJF-00034a-BQ
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kWDF5Wsuz6zyFA0zKG8H8k3mlK2VookbMr7BHQU/T78=;
 b=SAcDzO8qnH8DCLaUXgiIW9xan/Dt52XB5dyuHZyzTHRJh/BEFzgPJNkMsZvBQ6Xl7/higg
 VP6yKjUByO94kuFUyPeaIq2Kn9njkjuG9lcUuL8meqYyaX6Q7/Cn4OMCoj8FWa4oiLLMG9
 rOKLHMm6FN7WXdljh3LYGmCUlArA2Hs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-8mg6OTf-PMmfdH1Agz96Fg-1; Mon, 14 Nov 2022 17:52:05 -0500
X-MC-Unique: 8mg6OTf-PMmfdH1Agz96Fg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D017687B2B2;
 Mon, 14 Nov 2022 22:52:04 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B37340E9787;
 Mon, 14 Nov 2022 22:52:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 05/23] states: Prepare to receive 64-bit replies
Date: Mon, 14 Nov 2022 16:51:40 -0600
Message-Id: <20221114225158.2186742-6-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
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

Support receiving headers for 64-bit replies if extended headers were
negotiated.  We already insist that the server not send us too much
payload in one reply, so we can exploit that and merge the 64-bit
length back into a normalized 32-bit field for the rest of the payload
length calculations.  The NBD protocol specifically documents that
extended mode takes precedence over structured replies, and that there
are no simple replies in extended mode.  We can also take advantage
that the handle field is in the same offset in all the various reply
types.

Note that if we negotiate extended headers, but a non-compliant server
replies with a non-extended header, this patch will stall waiting for
the server to send more bytes rather than noticing that the magic
number is wrong (for aio operations, you'll get a magic number
mismatch once you send a second command that elicits a reply; but for
blocking operations, we basically deadlock).  The easy alternative
would be to read just the first 4 bytes of magic, then determine how
many more bytes to expect; but that would require more states and
syscalls, and not worth it since the typical server will be compliant.
The other alternative is what the next patch implements: teaching
REPLY.RECV_REPLY to handle short reads that were at least long enough
to transmit magic to specifically look for magic number mismatch.

At this point, h->extended_headers is permanently false (we can't
enable it until all other aspects of the protocol have likewise been
converted).
---
 lib/internal.h                      |  1 +
 generator/states-reply-structured.c | 52 +++++++++++++++++++----------
 generator/states-reply.c            | 31 +++++++++++------
 3 files changed, 57 insertions(+), 27 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index e900eca3..73fd24c0 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -242,6 +242,7 @@ struct nbd_handle {
       union {
         struct nbd_simple_reply simple;
         struct nbd_structured_reply structured;
+        struct nbd_extended_reply extended;
       } hdr;
       union {
         struct nbd_structured_reply_offset_data offset_data;
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index 6f187f14..da9894c6 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -45,14 +45,20 @@ structured_reply_in_bounds (uint64_t offset, uint32_t length,

 STATE_MACHINE {
  REPLY.STRUCTURED_REPLY.START:
-  /* We've only read the simple_reply.  The structured_reply is longer,
-   * so read the remaining part.
+  /* If we have extended headers, we've already read the entire header.
+   * Otherwise, we've only read enough for a simple_reply; since structured
+   * replies are longer, read the remaining part.
    */
-  h->rbuf = &h->sbuf;
-  h->rbuf = (char *) h->rbuf + sizeof h->sbuf.reply.hdr.simple;
-  h->rlen = sizeof h->sbuf.reply.hdr.structured;
-  h->rlen -= sizeof h->sbuf.reply.hdr.simple;
-  SET_NEXT_STATE (%RECV_REMAINING);
+  if (h->extended_headers) {
+    assert (h->rbuf == sizeof h->sbuf.reply.hdr.extended + (char*) &h->sbuf);
+    SET_NEXT_STATE (%CHECK);
+  }
+  else {
+    assert (h->rbuf == sizeof h->sbuf.reply.hdr.simple + (char*) &h->sbuf);
+    h->rlen = sizeof h->sbuf.reply.hdr.structured -
+      sizeof h->sbuf.reply.hdr.simple;
+    SET_NEXT_STATE (%RECV_REMAINING);
+  }
   return 0;

  REPLY.STRUCTURED_REPLY.RECV_REMAINING:
@@ -69,11 +75,18 @@  REPLY.STRUCTURED_REPLY.RECV_REMAINING:
  REPLY.STRUCTURED_REPLY.CHECK:
   struct command *cmd = h->reply_cmd;
   uint16_t flags, type;
-  uint32_t length;
+  uint64_t length;
+  uint64_t offset = -1;

+  assert (cmd);
   flags = be16toh (h->sbuf.reply.hdr.structured.flags);
   type = be16toh (h->sbuf.reply.hdr.structured.type);
-  length = be32toh (h->sbuf.reply.hdr.structured.length);
+  if (h->extended_headers) {
+    length = be64toh (h->sbuf.reply.hdr.extended.length);
+    offset = be64toh (h->sbuf.reply.hdr.extended.offset);
+  }
+  else
+    length = be32toh (h->sbuf.reply.hdr.structured.length);

   /* Reject a server that replies with too much information, but don't
    * reject a single structured reply to NBD_CMD_READ on the largest
@@ -83,13 +96,18 @@  REPLY.STRUCTURED_REPLY.CHECK:
    * not worth keeping the connection alive.
    */
   if (length > MAX_REQUEST_SIZE + sizeof h->sbuf.reply.payload.offset_data) {
-    set_error (0, "invalid server reply length %" PRIu32, length);
+    set_error (0, "invalid server reply length %" PRIu64, length);
     SET_NEXT_STATE (%.DEAD);
     return 0;
   }
+  /* For convenience, we now normalize extended replies into compact,
+   * doable since we validated length fits in 32 bits.
+   */
+  h->sbuf.reply.hdr.structured.length = length;

   /* Skip an unexpected structured reply, including to an unknown cookie. */
-  if (cmd == NULL || !h->structured_replies)
+  if (cmd == NULL || !h->structured_replies ||
+      (h->extended_headers && offset != cmd->offset))
     goto resync;

   switch (type) {
@@ -168,7 +186,7 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
     assert (length >= sizeof h->sbuf.reply.payload.error.error.error);
     assert (cmd);

@@ -207,7 +225,7 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR_MESSAGE:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
     msglen = be16toh (h->sbuf.reply.payload.error.error.len);
     type = be16toh (h->sbuf.reply.hdr.structured.type);

@@ -307,7 +325,7 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_DATA:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
     offset = be64toh (h->sbuf.reply.payload.offset_data.offset);

     assert (cmd); /* guaranteed by CHECK */
@@ -346,7 +364,7 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_DATA_DATA:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
     offset = be64toh (h->sbuf.reply.payload.offset_data.offset);

     assert (cmd); /* guaranteed by CHECK */
@@ -426,7 +444,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
@@ -460,7 +478,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
diff --git a/generator/states-reply.c b/generator/states-reply.c
index 845973a4..dde23b39 100644
--- a/generator/states-reply.c
+++ b/generator/states-reply.c
@@ -62,15 +62,19 @@  REPLY.START:
    */
   ssize_t r;

-  /* We read all replies initially as if they are simple replies, but
-   * check the magic in CHECK_SIMPLE_OR_STRUCTURED_REPLY below.
-   * This works because the structured_reply header is larger.
+  /* With extended headers, there is only one size to read, so we can do it
+   * all in one syscall.  But for older structured replies, we don't know if
+   * we have a simple or structured reply until we read the magic number,
+   * requiring a two-part read with CHECK_SIMPLE_OR_STRUCTURED_REPLY below.
    */
   assert (h->reply_cmd == NULL);
   assert (h->rlen == 0);

   h->rbuf = &h->sbuf.reply.hdr;
-  h->rlen = sizeof h->sbuf.reply.hdr.simple;
+  if (h->extended_headers)
+    h->rlen = sizeof h->sbuf.reply.hdr.extended;
+  else
+    h->rlen = sizeof h->sbuf.reply.hdr.simple;

   r = h->sock->ops->recv (h, h->sock, h->rbuf, h->rlen);
   if (r == -1) {
@@ -116,15 +120,22 @@  REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY:
   uint64_t cookie;

   magic = be32toh (h->sbuf.reply.hdr.simple.magic);
-  if (magic == NBD_SIMPLE_REPLY_MAGIC) {
+  switch (magic) {
+  case NBD_SIMPLE_REPLY_MAGIC:
+    if (h->extended_headers)
+      goto invalid;
     SET_NEXT_STATE (%SIMPLE_REPLY.START);
-  }
-  else if (magic == NBD_STRUCTURED_REPLY_MAGIC) {
+    break;
+  case NBD_STRUCTURED_REPLY_MAGIC:
+  case NBD_EXTENDED_REPLY_MAGIC:
+    if ((magic == NBD_STRUCTURED_REPLY_MAGIC) == h->extended_headers)
+      goto invalid;
     SET_NEXT_STATE (%STRUCTURED_REPLY.START);
-  }
-  else {
+    break;
+  default:
+  invalid:
     SET_NEXT_STATE (%.DEAD); /* We've probably lost synchronization. */
-    set_error (0, "invalid reply magic 0x%" PRIx32, magic);
+    set_error (0, "invalid or unexpected reply magic 0x%" PRIx32, magic);
     return 0;
   }

-- 
2.38.1



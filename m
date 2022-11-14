Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE459628E2D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:20:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidv-0001uM-Fw; Mon, 14 Nov 2022 18:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouido-0001eb-9m
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJH-00035O-Ll
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qoAWbegsBTfEv47rBxOGcuvfh/pdMnVmqyolAT0+VnU=;
 b=ZFURzNBBah6c+cEc+xL/2ZKwZZZKgQThNY7ZPrecwwUvnt7+UCZDw6275nwGbAVfs7XEEa
 VXFIBqpZK3liXfu7a4sb1pSO8R4ULYirf7Z+oA1BNaWGCuhxJ0/Nph/1PdeqHI5ytJqZ/p
 BqbXttSbRkpf9OByMWSyiQ8x0VE1zBE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-0cOpsB4XOQ2s_ZGD88tnzQ-1; Mon, 14 Nov 2022 17:52:07 -0500
X-MC-Unique: 0cOpsB4XOQ2s_ZGD88tnzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A8EE802556;
 Mon, 14 Nov 2022 22:52:07 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBB9840E9794;
 Mon, 14 Nov 2022 22:52:06 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 09/23] block_status: Accept 64-bit extents during
 block status
Date: Mon, 14 Nov 2022 16:51:44 -0600
Message-Id: <20221114225158.2186742-10-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
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

Support a server giving us a 64-bit extent.  Note that the protocol
says a server should not give a 64-bit answer when extended headers
are not negotiated; we can handle that by reporting EPROTO but
otherwise accepting the information.  Meanwhile, when extended headers
are in effect, even a 32-bit original query can produce a 64-bit
answer; and likewise, a 64-bit query may have so much information that
the server truncates it to a 32-bit answer, so we must be prepared for
either type of response.  Since we already store 64-bit extents
internally, the user's 32-bit callback doesn't have to care which
reply chunk the server uses (the shim takes care of that, and an
upcoming patch adds new APIs to let the client use a 64-bit callback).
Of course, until a later patch enables extended headers negotiation,
no compliant server will trigger the new code here.

Implementation-wise, 'normal' and 'wide' are two different types but
have the same underlying size; keeping the two names makes it easier
to reason about when values are still in network byte order from the
server or native endian for local processing.
---
 lib/internal.h                      |  3 +
 generator/states-reply-structured.c | 88 ++++++++++++++++++++++-------
 2 files changed, 72 insertions(+), 19 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 0c23f882..b91fe6f6 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -248,6 +248,7 @@ struct nbd_handle {
         struct nbd_structured_reply_offset_data offset_data;
         struct nbd_structured_reply_offset_hole offset_hole;
         struct nbd_structured_reply_block_status_hdr bs_hdr;
+        struct nbd_structured_reply_block_status_ext_hdr bs_ext_hdr;
         struct {
           struct nbd_structured_reply_error error;
           char msg[NBD_MAX_STRING]; /* Common to all error types */
@@ -306,6 +307,8 @@ struct nbd_handle {
     char *storage;      /* malloc's view */
     nbd_extent *normal; /* Our 64-bit preferred internal form; n slots */
     uint32_t *narrow;   /* 32-bit NBD_REPLY_TYPE_BLOCK_STATUS form; n*2 slots */
+    struct nbd_block_descriptor_ext *wide;
+                        /* 64-bit NBD_REPLY_TYPE_BLOCK_STATUS_EXT; n slots */
   } bs_entries;

   /* Commands which are waiting to be issued [meaning the request
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index d23e56a9..7e313b5a 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -22,6 +22,8 @@
 #include <stdint.h>
 #include <inttypes.h>

+#include "minmax.h"
+
 /* Structured reply must be completely inside the bounds of the
  * requesting command.
  */
@@ -147,6 +149,24 @@  REPLY.STRUCTURED_REPLY.CHECK:
     /* Start by reading the context ID. */
     h->rbuf = &h->sbuf.reply.payload.bs_hdr;
     h->rlen = sizeof h->sbuf.reply.payload.bs_hdr;
+    h->sbuf.reply.payload.bs_ext_hdr.count = 0;
+    SET_NEXT_STATE (%RECV_BS_HEADER);
+    break;
+
+  case NBD_REPLY_TYPE_BLOCK_STATUS_EXT:
+    if (cmd->type != NBD_CMD_BLOCK_STATUS ||
+        length < 24 ||
+        (length-8) % sizeof(struct nbd_block_descriptor_ext))
+      goto resync;
+    if (!h->extended_headers) {
+      debug (h, "unexpected 64-bit block status without extended headers, "
+             "this is probably a server bug");
+      if (cmd->error == 0)
+        cmd->error = EPROTO;
+    }
+    /* Start by reading the context ID. */
+    h->rbuf = &h->sbuf.reply.payload.bs_ext_hdr;
+    h->rlen = sizeof h->sbuf.reply.payload.bs_ext_hdr;
     SET_NEXT_STATE (%RECV_BS_HEADER);
     break;

@@ -437,6 +457,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
   struct command *cmd = h->reply_cmd;
   uint32_t length;
   uint32_t count;
+  uint16_t type;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -446,24 +467,44 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
     return 0;
   case 0:
     length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
+    type = be16toh (h->sbuf.reply.hdr.structured.type);

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
-    assert (length >= 12);
-    length -= sizeof h->sbuf.reply.payload.bs_hdr;
-    count = length / (2 * sizeof (uint32_t));

-    /* Read raw data into a subset of h->bs_entries, then expand it
+    if (type == NBD_REPLY_TYPE_BLOCK_STATUS) {
+      assert (length >= 12);
+      length -= sizeof h->sbuf.reply.payload.bs_hdr;
+      count = length / (2 * sizeof (uint32_t));
+    }
+    else {
+      assert (type == NBD_REPLY_TYPE_BLOCK_STATUS_EXT);
+      assert (length >= 24);
+      length -= sizeof h->sbuf.reply.payload.bs_ext_hdr;
+      count = length / sizeof (struct nbd_block_descriptor_ext);
+      if (h->sbuf.reply.payload.bs_ext_hdr.count &&
+          count != be32toh (h->sbuf.reply.payload.bs_ext_hdr.count)) {
+        h->rbuf = NULL;
+        h->rlen = length;
+        SET_NEXT_STATE (%RESYNC);
+        return 0;
+      }
+    }
+    /* Normalize count for later use. */
+    h->sbuf.reply.payload.bs_ext_hdr.count = count;
+
+    /* Read raw data into an overlap of h->bs_entries, then move it
      * into place later during byte-swapping.
      */
     free (h->bs_entries.storage);
-    h->bs_entries.storage = malloc (count * sizeof *h->bs_entries.normal);
+    h->bs_entries.storage = malloc (MAX (count * sizeof *h->bs_entries.normal,
+                                         length));
     if (h->bs_entries.storage == NULL) {
       SET_NEXT_STATE (%.DEAD);
       set_error (errno, "malloc");
       return 0;
     }
-    h->rbuf = h->bs_entries.narrow;
+    h->rbuf = h->bs_entries.storage;
     h->rlen = length;
     SET_NEXT_STATE (%RECV_BS_ENTRIES);
   }
@@ -471,11 +512,10 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:

  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
   struct command *cmd = h->reply_cmd;
-  uint32_t length;
   uint32_t count;
   size_t i;
   uint32_t context_id;
-  uint32_t *raw;
+  uint16_t type;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -484,25 +524,35 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
+    type = be16toh (h->sbuf.reply.hdr.structured.type);
+    count = h->sbuf.reply.payload.bs_ext_hdr.count; /* normalized in BS_HEADER */

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
-    assert (h->bs_entries.normal);
-    assert (length >= 12);
+    assert (h->bs_entries.normal && count);
     assert (h->meta_valid);
-    count = (length - sizeof h->sbuf.reply.payload.bs_hdr) /
-      (2 * sizeof (uint32_t));

     /* Need to byte-swap the entries returned, but apart from that we
-     * don't validate them.  Reverse order is essential, since we are
-     * expanding in-place from narrow to wider type.
+     * don't validate them.
      */
-    raw = h->bs_entries.narrow;
-    for (i = count; i-- > 0; ) {
-      h->bs_entries.normal[i].flags = be32toh (raw[i * 2 + 1]);
-      h->bs_entries.normal[i].length = be32toh (raw[i * 2]);
+    if (type == NBD_REPLY_TYPE_BLOCK_STATUS) {
+      uint32_t *raw = h->bs_entries.narrow;
+
+      /* Expanding in-place from narrow to wide, must use reverse order. */
+      for (i = count; i-- > 0; ) {
+        h->bs_entries.normal[i].flags = be32toh (raw[i * 2 + 1]);
+        h->bs_entries.normal[i].length = be32toh (raw[i * 2]);
+      }
+    }
+    else {
+      struct nbd_block_descriptor_ext *wide = h->bs_entries.wide;
+
+      assert (type == NBD_REPLY_TYPE_BLOCK_STATUS_EXT);
+      for (i = 0; i < count; i++) {
+        h->bs_entries.normal[i].length = be64toh (wide[i].length);
+        h->bs_entries.normal[i].flags = be64toh (wide[i].status_flags);
+      }
     }

     /* Look up the context ID. */
-- 
2.38.1



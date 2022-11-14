Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD2628DBA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:48:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouie1-0002A4-V4; Mon, 14 Nov 2022 18:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidp-0001df-1z
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJE-000344-0b
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L7tAutWYxsCeeX40NRb/7ZHQ/rU/csbg541R8KjQ+DU=;
 b=b5u1Qc6Vmc7LPW/FP3z4EBe1IYhIEYaWP4OkrGN+BP39HlTR0GYG1Et1NOkt+Q938IRh9O
 QuevlvcpY7FzbjEBrG9BujmK2/MBsStkxlW+n3F19UAjymQaYf1B9QvYUVKNX2E186/RwS
 Kt2+fIEDpeQEpE1M7iotne1OpQiJv6Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-p1pO5aOMP_O9Ow7IFKOVBg-1; Mon, 14 Nov 2022 17:52:02 -0500
X-MC-Unique: p1pO5aOMP_O9Ow7IFKOVBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67CC6811E7A;
 Mon, 14 Nov 2022 22:52:02 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04B9340E9786;
 Mon, 14 Nov 2022 22:52:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 01/23] block_status: Refactor array storage
Date: Mon, 14 Nov 2022 16:51:36 -0600
Message-Id: <20221114225158.2186742-2-eblake@redhat.com>
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

For 32-bit block status, we were able to cheat and use an array with
an odd number of elements, with array[0] holding the context id, and
passing &array[1] to the user's callback.  But once we have 64-bit
extents, we can no longer abuse array element 0 like that, for two
reasons: 64-bit extents contain uint64_t which might not be
alignment-compatible with an array of uint32_t on all architectures,
and the new NBD_REPLY_TYPE_BLOCK_STATUS_EXT adds an additional count
field before the array.

Split out a new state STRUCTURED_REPLY.BS_HEADER to receive the
context id (and eventually the new count field for 64-bit replies)
separately from the extents array, and add another structured_reply
type in the payload section for tracking it.  No behavioral change,
other than the rare possibility of landing in the new state.
---
 lib/internal.h                      |  1 +
 lib/nbd-protocol.h                  | 19 ++++++----
 generator/state_machine.ml          |  9 ++++-
 generator/states-reply-structured.c | 56 ++++++++++++++++++++---------
 4 files changed, 61 insertions(+), 24 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index bbbd2639..fe81f1a0 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -241,6 +241,7 @@ struct nbd_handle {
       union {
         struct nbd_structured_reply_offset_data offset_data;
         struct nbd_structured_reply_offset_hole offset_hole;
+        struct nbd_structured_reply_block_status_hdr bs_hdr;
         struct {
           struct nbd_structured_reply_error error;
           char msg[NBD_MAX_STRING]; /* Common to all error types */
diff --git a/lib/nbd-protocol.h b/lib/nbd-protocol.h
index e5d6404b..4400d3ab 100644
--- a/lib/nbd-protocol.h
+++ b/lib/nbd-protocol.h
@@ -1,5 +1,5 @@
 /* nbdkit
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2022 Red Hat Inc.
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
@@ -182,12 +182,6 @@ struct nbd_fixed_new_option_reply_meta_context {
   /* followed by a string */
 } NBD_ATTRIBUTE_PACKED;

-/* NBD_REPLY_TYPE_BLOCK_STATUS block descriptor. */
-struct nbd_block_descriptor {
-  uint32_t length;              /* length of block */
-  uint32_t status_flags;        /* block type (hole etc) */
-} NBD_ATTRIBUTE_PACKED;
-
 /* Request (client -> server). */
 struct nbd_request {
   uint32_t magic;               /* NBD_REQUEST_MAGIC. */
@@ -224,6 +218,17 @@ struct nbd_structured_reply_offset_hole {
   uint32_t length;              /* Length of hole. */
 } NBD_ATTRIBUTE_PACKED;

+/* NBD_REPLY_TYPE_BLOCK_STATUS block descriptor. */
+struct nbd_block_descriptor {
+  uint32_t length;              /* length of block */
+  uint32_t status_flags;        /* block type (hole etc) */
+} NBD_ATTRIBUTE_PACKED;
+
+struct nbd_structured_reply_block_status_hdr {
+  uint32_t context_id;          /* metadata context ID */
+  /* followed by array of nbd_block_descriptor extents */
+} NBD_ATTRIBUTE_PACKED;
+
 struct nbd_structured_reply_error {
   uint32_t error;               /* NBD_E* error number */
   uint16_t len;                 /* Length of human readable error. */
diff --git a/generator/state_machine.ml b/generator/state_machine.ml
index 257cb4f4..d2c326f3 100644
--- a/generator/state_machine.ml
+++ b/generator/state_machine.ml
@@ -871,10 +871,17 @@ and
     external_events = [];
   };

+  State {
+    default_state with
+    name = "RECV_BS_HEADER";
+    comment = "Receive header of structured reply block-status payload";
+    external_events = [];
+  };
+
   State {
     default_state with
     name = "RECV_BS_ENTRIES";
-    comment = "Receive a structured reply block-status payload";
+    comment = "Receive entries array of structured reply block-status payload";
     external_events = [];
   };

diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index 2456e6da..bbd3de0c 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -126,19 +126,10 @@  REPLY.STRUCTURED_REPLY.CHECK:
         length < 12 || ((length-4) & 7) != 0)
       goto resync;
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
-    /* We read the context ID followed by all the entries into a
-     * single array and deal with it at the end.
-     */
-    free (h->bs_entries);
-    h->bs_entries = malloc (length);
-    if (h->bs_entries == NULL) {
-      SET_NEXT_STATE (%.DEAD);
-      set_error (errno, "malloc");
-      break;
-    }
-    h->rbuf = h->bs_entries;
-    h->rlen = length;
-    SET_NEXT_STATE (%RECV_BS_ENTRIES);
+    /* Start by reading the context ID. */
+    h->rbuf = &h->sbuf.sr.payload.bs_hdr;
+    h->rlen = sizeof h->sbuf.sr.payload.bs_hdr;
+    SET_NEXT_STATE (%RECV_BS_HEADER);
     break;

   default:
@@ -424,9 +415,41 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
   }
   return 0;

+ REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
+  struct command *cmd = h->reply_cmd;
+  uint32_t length;
+
+  switch (recv_into_rbuf (h)) {
+  case -1: SET_NEXT_STATE (%.DEAD); return 0;
+  case 1:
+    save_reply_state (h);
+    SET_NEXT_STATE (%.READY);
+    return 0;
+  case 0:
+    length = be32toh (h->sbuf.sr.structured_reply.length);
+
+    assert (cmd); /* guaranteed by CHECK */
+    assert (cmd->type == NBD_CMD_BLOCK_STATUS);
+    assert (length >= 12);
+    length -= sizeof h->sbuf.sr.payload.bs_hdr;
+
+    free (h->bs_entries);
+    h->bs_entries = malloc (length);
+    if (h->bs_entries == NULL) {
+      SET_NEXT_STATE (%.DEAD);
+      set_error (errno, "malloc");
+      return 0;
+    }
+    h->rbuf = h->bs_entries;
+    h->rlen = length;
+    SET_NEXT_STATE (%RECV_BS_ENTRIES);
+  }
+  return 0;
+
  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
   struct command *cmd = h->reply_cmd;
   uint32_t length;
+  uint32_t count;
   size_t i;
   uint32_t context_id;

@@ -445,15 +468,16 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
     assert (h->bs_entries);
     assert (length >= 12);
     assert (h->meta_valid);
+    count = (length - sizeof h->sbuf.sr.payload.bs_hdr) / sizeof *h->bs_entries;

     /* Need to byte-swap the entries returned, but apart from that we
      * don't validate them.
      */
-    for (i = 0; i < length/4; ++i)
+    for (i = 0; i < count; ++i)
       h->bs_entries[i] = be32toh (h->bs_entries[i]);

     /* Look up the context ID. */
-    context_id = h->bs_entries[0];
+    context_id = be32toh (h->sbuf.sr.payload.bs_hdr.context_id);
     for (i = 0; i < h->meta_contexts.len; ++i)
       if (context_id == h->meta_contexts.ptr[i].context_id)
         break;
@@ -464,7 +488,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:

       if (CALL_CALLBACK (cmd->cb.fn.extent,
                          h->meta_contexts.ptr[i].name, cmd->offset,
-                         &h->bs_entries[1], (length-4) / 4,
+                         h->bs_entries, count,
                          &error) == -1)
         if (cmd->error == 0)
           cmd->error = error ? error : EPROTO;
-- 
2.38.1



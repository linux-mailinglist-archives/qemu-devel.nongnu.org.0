Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B55628D66
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:27:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidw-0001wv-93; Mon, 14 Nov 2022 18:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouido-0001X6-79
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJH-00035H-J4
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1cemSvuHYPXOo5uQfvR6U2aeVGuLoDft6zMTDXWL10Y=;
 b=AI8Tc9OsDU+MzHVr0lT72n5dO8JLwqS1gLVmEp63MFI5zDpE7jgcxFVHJl4JJRPX5GgkTM
 YEKXJH0MZLNfj23CSRDmS+8acC/JqwdxDqm/+OQEFeuoLOd4olmlQ/I9UXWRZ5yl/qen6B
 gyJhe7Y/kRAODGhaNPNreN6BgLom6vA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-ua_psouvN3WsrSJyGMDkFw-1; Mon, 14 Nov 2022 17:52:06 -0500
X-MC-Unique: ua_psouvN3WsrSJyGMDkFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91B84196EF8B;
 Mon, 14 Nov 2022 22:52:06 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D68440E9786;
 Mon, 14 Nov 2022 22:52:06 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 08/23] block_status: Track 64-bit extents internally
Date: Mon, 14 Nov 2022 16:51:43 -0600
Message-Id: <20221114225158.2186742-9-eblake@redhat.com>
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

When extended headers are in use, the server can send us 64-bit
extents, even for a 32-bit query (if the server knows the entire image
is data, for example, or if the metacontext has a status definition
that uses more than 32 bits).  Also, while most contexts only have
32-bit flags, a server is allowed to negotiate contexts with 64-bit
flags when extended headers are in use.  Thus, for maximum
flexibility, we are better off storing 64-bit data internally, with a
goal of letting the client's 32-bit interface work as much as
possible, and for a future API addition of a 64-bit interface to work
even when the server only gave 32-bit results.

For backwards compatibility, a client that never negotiates a 64-bit
status context can be handled without errors by truncating any 64-bit
lengths down to just under 4G; so the old 32-bit interface will
continue to work in most cases.  But we can't truncate status down; if
a user requests an extended status, the 32-bit interface can now
report EOVERFLOW for that context (although that situation can't
happen until a later patch actually turns on the use of extended
headers).

Note that the existing 32-bit nbd_block_status() API is now slightly
slower, particularly when talking with a server that lacks extended
headers: we are doing double size conversions.  But this speed penalty
is likely in the noise compared to the network delays, and ideally
clients will switch over to the new 64-bit interfaces as more and more
servers start supporting extended headers.

One of the trickier aspects of this patch is auditing that both the
user's extent and our malloc'd shim get cleaned up once on all
possible paths, so that there is neither a leak nor a double free.
---
 lib/internal.h                      |  8 +++-
 generator/states-reply-structured.c | 30 ++++++++-----
 lib/handle.c                        |  2 +-
 lib/rw.c                            | 70 ++++++++++++++++++++++++++++-
 4 files changed, 95 insertions(+), 15 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 73fd24c0..0c23f882 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -80,7 +80,7 @@ struct export {

 struct command_cb {
   union {
-    nbd_extent_callback extent;
+    nbd_extent64_callback extent;
     nbd_chunk_callback chunk;
     nbd_list_callback list;
     nbd_context_callback context;
@@ -302,7 +302,11 @@ struct nbd_handle {
   size_t querynum;

   /* When receiving block status, this is used. */
-  uint32_t *bs_entries;
+  union {
+    char *storage;      /* malloc's view */
+    nbd_extent *normal; /* Our 64-bit preferred internal form; n slots */
+    uint32_t *narrow;   /* 32-bit NBD_REPLY_TYPE_BLOCK_STATUS form; n*2 slots */
+  } bs_entries;

   /* Commands which are waiting to be issued [meaning the request
    * packet is sent to the server].  This is used as a simple linked
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index da9894c6..d23e56a9 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -436,6 +436,7 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
   struct command *cmd = h->reply_cmd;
   uint32_t length;
+  uint32_t count;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -450,15 +451,19 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
     assert (length >= 12);
     length -= sizeof h->sbuf.reply.payload.bs_hdr;
+    count = length / (2 * sizeof (uint32_t));

-    free (h->bs_entries);
-    h->bs_entries = malloc (length);
-    if (h->bs_entries == NULL) {
+    /* Read raw data into a subset of h->bs_entries, then expand it
+     * into place later during byte-swapping.
+     */
+    free (h->bs_entries.storage);
+    h->bs_entries.storage = malloc (count * sizeof *h->bs_entries.normal);
+    if (h->bs_entries.storage == NULL) {
       SET_NEXT_STATE (%.DEAD);
       set_error (errno, "malloc");
       return 0;
     }
-    h->rbuf = h->bs_entries;
+    h->rbuf = h->bs_entries.narrow;
     h->rlen = length;
     SET_NEXT_STATE (%RECV_BS_ENTRIES);
   }
@@ -470,6 +475,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
   uint32_t count;
   size_t i;
   uint32_t context_id;
+  uint32_t *raw;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -483,17 +489,21 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
-    assert (h->bs_entries);
+    assert (h->bs_entries.normal);
     assert (length >= 12);
     assert (h->meta_valid);
     count = (length - sizeof h->sbuf.reply.payload.bs_hdr) /
-      sizeof *h->bs_entries;
+      (2 * sizeof (uint32_t));

     /* Need to byte-swap the entries returned, but apart from that we
-     * don't validate them.
+     * don't validate them.  Reverse order is essential, since we are
+     * expanding in-place from narrow to wider type.
      */
-    for (i = 0; i < count; ++i)
-      h->bs_entries[i] = be32toh (h->bs_entries[i]);
+    raw = h->bs_entries.narrow;
+    for (i = count; i-- > 0; ) {
+      h->bs_entries.normal[i].flags = be32toh (raw[i * 2 + 1]);
+      h->bs_entries.normal[i].length = be32toh (raw[i * 2]);
+    }

     /* Look up the context ID. */
     context_id = be32toh (h->sbuf.reply.payload.bs_hdr.context_id);
@@ -507,7 +517,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:

       if (CALL_CALLBACK (cmd->cb.fn.extent,
                          h->meta_contexts.ptr[i].name, cmd->offset,
-                         h->bs_entries, count,
+                         h->bs_entries.normal, count,
                          &error) == -1)
         if (cmd->error == 0)
           cmd->error = error ? error : EPROTO;
diff --git a/lib/handle.c b/lib/handle.c
index 4a186f8f..41e442e7 100644
--- a/lib/handle.c
+++ b/lib/handle.c
@@ -130,7 +130,7 @@ nbd_close (struct nbd_handle *h)

   string_vector_iter (&h->querylist, (void *) free);
   free (h->querylist.ptr);
-  free (h->bs_entries);
+  free (h->bs_entries.storage);
   nbd_internal_reset_size_and_flags (h);
   for (i = 0; i < h->meta_contexts.len; ++i)
     free (h->meta_contexts.ptr[i].name);
diff --git a/lib/rw.c b/lib/rw.c
index 81dded3f..6212bf4c 100644
--- a/lib/rw.c
+++ b/lib/rw.c
@@ -42,6 +42,61 @@ wait_for_command (struct nbd_handle *h, int64_t cookie)
   return r == -1 ? -1 : 0;
 }

+/* Convert from 64-bit to 32-bit extent callback. */
+static int
+nbd_convert_extent (void *data, const char *metacontext, uint64_t offset,
+                    nbd_extent *entries, size_t nr_entries, int *error)
+{
+  nbd_extent_callback *cb = data;
+  uint32_t *array = malloc (nr_entries * 2 * sizeof *array);
+  size_t i;
+  int ret;
+  bool fail = false;
+
+  if (array == NULL) {
+    set_error (*error = errno, "malloc");
+    return -1;
+  }
+
+  for (i = 0; i < nr_entries; i++) {
+    array[i * 2] = entries[i].length;
+    array[i * 2 + 1] = entries[i].flags;
+    /* If an extent is larger than 32 bits, silently truncate the rest
+     * of the server's response; the client can then make progress
+     * instead of needing to see failure.  Rather than track the
+     * connection's alignment, just clamp the large extent to 4G-64M.
+     * However, if flags doesn't fit in 32 bits, it's better to inform
+     * the caller of an EOVERFLOW failure.
+     *
+     * Technically, a server with 64-bit answers is non-compliant if
+     * the client did not negotiate extended headers - contexts that
+     * include 64-bit flags should not have been negotiated in that
+     * case.
+     */
+    if (entries[i].length > UINT32_MAX) {
+      array[i++ * 2] = -MAX_REQUEST_SIZE;
+      break;
+    }
+    if (entries[i].flags > UINT32_MAX) {
+      *error = EOVERFLOW;
+      fail = true;
+      break;
+    }
+  }
+
+  ret = CALL_CALLBACK (*cb, metacontext, offset, array, i * 2, error);
+  free (array);
+  return fail ? -1 : ret;
+}
+
+static void
+nbd_convert_extent_free (void *data)
+{
+  nbd_extent_callback *cb = data;
+  FREE_CALLBACK (*cb);
+  free (cb);
+}
+
 /* Issue a read command and wait for the reply. */
 int
 nbd_unlocked_pread (struct nbd_handle *h, void *buf,
@@ -487,12 +542,23 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
                                nbd_completion_callback *completion,
                                uint32_t flags)
 {
-  struct command_cb cb = { .fn.extent = *extent,
+  nbd_extent_callback *shim = malloc (sizeof *shim);
+  struct command_cb cb = { .fn.extent.callback = nbd_convert_extent,
+                           .fn.extent.user_data = shim,
+                           .fn.extent.free = nbd_convert_extent_free,
                            .completion = *completion };

+  if (shim == NULL) {
+    set_error (errno, "malloc");
+    return -1;
+  }
+  *shim = *extent;
+  SET_CALLBACK_TO_NULL (*extent);
+
   if (h->strict & LIBNBD_STRICT_COMMANDS) {
     if (!h->structured_replies) {
       set_error (ENOTSUP, "server does not support structured replies");
+      FREE_CALLBACK (cb.fn.extent);
       return -1;
     }

@@ -500,11 +566,11 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
       set_error (ENOTSUP, "did not negotiate any metadata contexts, "
                  "either you did not call nbd_add_meta_context before "
                  "connecting or the server does not support it");
+      FREE_CALLBACK (cb.fn.extent);
       return -1;
     }
   }

-  SET_CALLBACK_TO_NULL (*extent);
   SET_CALLBACK_TO_NULL (*completion);
   return nbd_internal_command_common (h, flags, NBD_CMD_BLOCK_STATUS, offset,
                                       count, EINVAL, NULL, &cb);
-- 
2.38.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDD1628E18
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:15:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidt-0001s6-4p; Mon, 14 Nov 2022 18:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidm-0001eb-8o
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJP-00037R-CR
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StorDyubBALrANG8hGrEVg7Xtd/kvhy4GHUimD5k1FU=;
 b=I4V9RfYgLcwsEP5RC9r620cRr5RtK/ig9rGrvOkqVxbMyH22NjI9xMxxdNnARYqRFfCH8X
 +HobOSmU80BmCKWm2OB60HANgaqOgULoBr5mJ7JfnhCy2tVXqPJIHwIg2HnXw21vocJ5Dk
 z3yzHDQdXioqYmx4SaCkTMj8MDSfJjo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-zW9DR_UNP32LNKnhAWP3jA-1; Mon, 14 Nov 2022 17:52:14 -0500
X-MC-Unique: zW9DR_UNP32LNKnhAWP3jA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A8CF101E9B5;
 Mon, 14 Nov 2022 22:52:14 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 076C840E9786;
 Mon, 14 Nov 2022 22:52:13 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 22/23] api: Add nbd_[aio_]block_status_filter()
Date: Mon, 14 Nov 2022 16:51:57 -0600
Message-Id: <20221114225158.2186742-23-eblake@redhat.com>
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

As part of extending NBD to support 64-bit lengths, the protocol also
added an option for servers to allow clients to request filtered
responses to NBD_CMD_BLOCK_STATUS when more than one meta-context is
negotiated (see NBD commit XXX[*]).  At the same time as this patch,
qemu-nbd was taught to support and advertise this feature as a server,
but does not utilize it as a client (qemu doesn't yet need to connect
to multiple contexts at once).  Thus, addding generic client support
and enhancing the interop/ test in libnbd is needed to prove that the
feature is viable and worth standardizing.

---
[*] FIXME with actual commit id
---
 lib/internal.h                   |   5 +-
 generator/API.ml                 |  71 +++++++++++++++--
 generator/states-issue-command.c |   4 +-
 lib/aio.c                        |   7 +-
 lib/rw.c                         | 127 ++++++++++++++++++++++++++++++-
 interop/block-status-payload.c   | 117 +++++++++++++++++++++++++++-
 interop/block-status-payload.sh  |  14 +++-
 info/info-can.sh                 |   3 +
 8 files changed, 336 insertions(+), 12 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 1abb21cb..ac8d99c4 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -73,6 +73,8 @@ struct meta_context {
 };
 DEFINE_VECTOR_TYPE(meta_vector, struct meta_context);

+DEFINE_VECTOR_TYPE(uint32_vector, uint32_t);
+
 struct export {
   char *name;
   char *description;
@@ -379,7 +381,8 @@ struct command {
   uint64_t cookie;
   uint64_t offset;
   uint64_t count;
-  void *data; /* Buffer for read/write */
+  void *data; /* Buffer for read/write, uint32_vector* for status payload */
+  uint32_vector *ids; /* For block status with payload */
   struct command_cb cb;
   bool initialized; /* For read, true if getting a hole may skip memset */
   uint32_t data_seen; /* For read, cumulative size of data chunks seen */
diff --git a/generator/API.ml b/generator/API.ml
index bbf7c0bb..6bf67de0 100644
--- a/generator/API.ml
+++ b/generator/API.ml
@@ -2287,12 +2287,13 @@   "can_block_status_payload", {
     longdesc = "\
 Returns true if the server supports the use of the
 C<LIBNBD_CMD_FLAG_PAYLOAD_LEN> flag to allow filtering of the
-block status command.  Returns
+block status command (see L<nbd_block_status_filter(3)>).  Returns
 false if the server does not.  Note that this will never return
 true if L<nbd_get_extended_headers_negotiated(3)> is false."
 ^ non_blocking_test_call_description;
     see_also = [SectionLink "Flag calls"; Link "opt_info";
-                Link "get_extended_headers_negotiated"];
+                Link "get_extended_headers_negotiated";
+                Link "block_status_filter"];
     example = Some "examples/server-flags.c";
   };

@@ -2361,6 +2362,10 @@   "can_meta_context", {
 meta contexts were requested but there is a missing or failed
 attempt at NBD_OPT_SET_META_CONTEXT during option negotiation.

+If the server supports block status filtering (see
+L<nbd_can_block_status_payload(3)>, this function must return
+true for any filter name passed to L<nbd_block_status_filter(3)>.
+
 The single parameter is the name of the metadata context,
 for example C<LIBNBD_CONTEXT_BASE_ALLOCATION>.
 B<E<lt>libnbd.hE<gt>> includes defined constants for well-known
@@ -2893,9 +2898,12 @@   "block_status_64", {
 information about blocks beginning from the specified
 offset to be returned. The C<count> parameter is a hint: the
 server may choose to return less status, or the final block
-may extend beyond the requested range. If multiple contexts
+may extend beyond the requested range. When multiple contexts
 are supported, the number of blocks and cumulative length
-of those blocks need not be identical between contexts.
+of those blocks need not be identical between contexts; this
+command generally returns the status of all negotiated contexts,
+while some servers also support a filtered request (see
+L<nbd_can_block_status_payload(3)>, L<nbd_block_status_filter(3)>).

 Note that not all servers can support a C<count> of 4GiB or larger;
 L<nbd_get_extended_headers_negotiated(3)> indicates which servers
@@ -2945,11 +2953,38 @@   "block_status_64", {
 does not exceed C<count> bytes; however, libnbd does not
 validate that the server obeyed the flag."
 ^ strict_call_description;
-    see_also = [Link "block_status";
+    see_also = [Link "block_status"; Link "block_status_filter";
                 Link "add_meta_context"; Link "can_meta_context";
                 Link "aio_block_status_64"; Link "set_strict_mode"];
   };

+  "block_status_filter", {
+    default_call with
+    args = [ UInt64 "count"; UInt64 "offset"; StringList "contexts";
+             Closure extent64_closure ];
+    optargs = [ OFlags ("flags", cmd_flags, Some ["REQ_ONE"; "PAYLOAD_LEN"]) ];
+    ret = RErr;
+    permitted_states = [ Connected ];
+    shortdesc = "send filtered block status command, with 64-bit callback";
+    longdesc = "\
+Issue a filtered block status command to the NBD server.  If
+supported by the server (see L<nbd_can_block_status_payload(3)>),
+this causes metadata context information about blocks beginning
+from the specified offset to be returned, and with the result
+limited to just the contexts specified in C<filter>.  Note that
+all strings in C<filter> must be supported by
+L<nbd_can_meta_context(3)>.
+
+All other parameters to this function have the same semantics
+as in L<nbd_block_status_64(3)>; except that for convenience,
+the C<flags> parameter may additionally contain or omit
+C<LIBNBD_CMD_FLAG_PAYLOAD_LEN>."
+^ strict_call_description;
+    see_also = [Link "block_status_64";
+                Link "can_block_status_payload"; Link "can_meta_context";
+                Link "aio_block_status_filter"; Link "set_strict_mode"];
+  };
+
   "poll", {
     default_call with
     args = [ Int "timeout" ]; ret = RInt;
@@ -3619,6 +3654,30 @@   "aio_block_status_64", {
                 Link "set_strict_mode"];
   };

+  "aio_block_status_filter", {
+    default_call with
+    args = [ UInt64 "count"; UInt64 "offset"; StringList "contexts";
+             Closure extent64_closure ];
+    optargs = [ OClosure completion_closure;
+                OFlags ("flags", cmd_flags, Some ["REQ_ONE"; "PAYLOAD_LEN"]) ];
+    ret = RCookie;
+    permitted_states = [ Connected ];
+    shortdesc = "send filtered block status command to the NBD server";
+    longdesc = "\
+Send a filtered block status command to the NBD server.
+
+To check if the command completed, call L<nbd_aio_command_completed(3)>.
+Or supply the optional C<completion_callback> which will be invoked
+as described in L<libnbd(3)/Completion callbacks>.
+
+Other parameters behave as documented in L<nbd_block_status_filter(3)>."
+^ strict_call_description;
+    see_also = [SectionLink "Issuing asynchronous commands";
+                Link "aio_block_status_64"; Link "block_status_filter";
+                Link "can_meta_context"; Link "can_block_status_payload";
+                Link "set_strict_mode"];
+  };
+
   "aio_get_fd", {
     default_call with
     args = []; ret = RFd;
@@ -4149,6 +4208,8 @@ let first_version =
   "opt_extended_headers", (1, 16);
   "aio_opt_extended_headers", (1, 16);
   "can_block_status_payload", (1, 16);
+  "block_status_filter", (1, 16);
+  "aio_block_status_filter", (1, 16);

   (* These calls are proposed for a future version of libnbd, but
    * have not been added to any released version so far.
diff --git a/generator/states-issue-command.c b/generator/states-issue-command.c
index feea2672..da898aef 100644
--- a/generator/states-issue-command.c
+++ b/generator/states-issue-command.c
@@ -84,7 +84,9 @@  ISSUE_COMMAND.PREPARE_WRITE_PAYLOAD:
   assert (h->cmds_to_issue != NULL);
   cmd = h->cmds_to_issue;
   assert (cmd->cookie == be64toh (h->req.compact.handle));
-  if (cmd->type == NBD_CMD_WRITE) {
+  if (cmd->type == NBD_CMD_WRITE ||
+      (h->extended_headers && cmd->type == NBD_CMD_BLOCK_STATUS &&
+       cmd->flags & NBD_CMD_FLAG_PAYLOAD_LEN)) {
     h->wbuf = cmd->data;
     h->wlen = cmd->count;
     if (cmd->next && cmd->count < 64 * 1024)
diff --git a/lib/aio.c b/lib/aio.c
index 1188a328..fa142881 100644
--- a/lib/aio.c
+++ b/lib/aio.c
@@ -32,8 +32,13 @@ void
 nbd_internal_retire_and_free_command (struct command *cmd)
 {
   /* Free the callbacks. */
-  if (cmd->type == NBD_CMD_BLOCK_STATUS)
+  if (cmd->type == NBD_CMD_BLOCK_STATUS) {
+    if (cmd->ids) {
+      uint32_vector_reset (cmd->ids);
+      free (cmd->ids);
+    }
     FREE_CALLBACK (cmd->cb.fn.extent);
+  }
   if (cmd->type == NBD_CMD_READ)
     FREE_CALLBACK (cmd->cb.fn.chunk);
   FREE_CALLBACK (cmd->cb.completion);
diff --git a/lib/rw.c b/lib/rw.c
index 26533836..310c1285 100644
--- a/lib/rw.c
+++ b/lib/rw.c
@@ -242,6 +242,26 @@ nbd_unlocked_block_status_64 (struct nbd_handle *h,
   return wait_for_command (h, cookie);
 }

+/* Issue a filtered block status command and wait for the reply. */
+int
+nbd_unlocked_block_status_filter (struct nbd_handle *h,
+                                  uint64_t count, uint64_t offset,
+                                  char **filter,
+                                  nbd_extent64_callback *extent64,
+                                  uint32_t flags)
+{
+  int64_t cookie;
+  nbd_completion_callback c = NBD_NULL_COMPLETION;
+
+  cookie = nbd_unlocked_aio_block_status_filter (h, count, offset, filter,
+                                                 extent64, &c, flags);
+  if (cookie == -1)
+    return -1;
+
+  assert (CALLBACK_IS_NULL (*extent64));
+  return wait_for_command (h, cookie);
+}
+
 /* count_err represents the errno to return if bounds check fail */
 int64_t
 nbd_internal_command_common (struct nbd_handle *h,
@@ -250,6 +270,7 @@ nbd_internal_command_common (struct nbd_handle *h,
                              void *data, struct command_cb *cb)
 {
   struct command *cmd;
+  uint32_vector *ids = NULL;

   if (h->disconnect_request) {
       set_error (EINVAL, "cannot request more commands after NBD_CMD_DISC");
@@ -297,10 +318,23 @@ nbd_internal_command_common (struct nbd_handle *h,
     }
     break;

+  case NBD_CMD_BLOCK_STATUS:
+    if (data) {
+      ids = data;
+      count = ids->len * sizeof (uint32_t);
+      data = ids->ptr;
+      if (count > MAX_REQUEST_SIZE ||
+          (h->strict & LIBNBD_STRICT_PAYLOAD && count > h->payload_maximum)) {
+        set_error (ERANGE, "filter set too large");
+        goto err;
+      }
+      break;
+    }
+    /* fallthrough */
+  default:
     /* Other commands are limited by the 32 bit field in the command
      * structure on the wire, unless extended headers were negotiated.
      */
-  default:
     if (!h->extended_headers && count > UINT32_MAX) {
       set_error (ERANGE, "request too large: maximum request size is %" PRIu32,
                  UINT32_MAX);
@@ -320,6 +354,7 @@ nbd_internal_command_common (struct nbd_handle *h,
   cmd->offset = offset;
   cmd->count = count;
   cmd->data = data;
+  cmd->ids = ids;
   if (cb)
     cmd->cb = *cb;

@@ -364,8 +399,13 @@ nbd_internal_command_common (struct nbd_handle *h,
  err:
   /* Since we did not queue the command, we must free the callbacks. */
   if (cb) {
-    if (type == NBD_CMD_BLOCK_STATUS)
+    if (type == NBD_CMD_BLOCK_STATUS) {
+      if (ids) {
+        uint32_vector_reset (ids);
+        free (ids);
+      }
       FREE_CALLBACK (cb->fn.extent);
+    }
     if (type == NBD_CMD_READ)
       FREE_CALLBACK (cb->fn.chunk);
     FREE_CALLBACK (cb->completion);
@@ -609,3 +649,86 @@ nbd_unlocked_aio_block_status_64 (struct nbd_handle *h,
   return nbd_internal_command_common (h, flags, NBD_CMD_BLOCK_STATUS, offset,
                                       count, EINVAL, NULL, &cb);
 }
+
+int64_t
+nbd_unlocked_aio_block_status_filter (struct nbd_handle *h,
+                                      uint64_t count, uint64_t offset,
+                                      char **filter,
+                                      nbd_extent64_callback *extent64,
+                                      nbd_completion_callback *completion,
+                                      uint32_t flags)
+{
+  struct command_cb cb = { .fn.extent = *extent64,
+                           .completion = *completion };
+  uint32_vector *ids;
+  char *name;
+  size_t i;
+
+  /* Because this affects wire format, it is more convenient to manage
+   * PAYLOAD_LEN by what was negotiated than to require the user to
+   * have to set it correctly.
+   */
+  if (!h->extended_headers) {
+    set_error (ENOTSUP, "server does not support extended headers");
+    return -1;
+  }
+  flags |= LIBNBD_CMD_FLAG_PAYLOAD_LEN;
+
+  if (h->strict & LIBNBD_STRICT_COMMANDS) {
+    if (nbd_unlocked_can_block_status_payload (h) != 1) {
+      set_error (EINVAL,
+                 "server does not support the block status payload flag");
+      return -1;
+    }
+
+    if (!h->meta_valid || h->meta_contexts.len == 0) {
+      set_error (ENOTSUP, "did not negotiate any metadata contexts, "
+                 "either you did not call nbd_add_meta_context before "
+                 "connecting or the server does not support it");
+      return -1;
+    }
+  }
+
+  ids = calloc (1, sizeof *ids);
+  if (ids == NULL) {
+    set_error (errno, "calloc");
+    return -1;
+  }
+  if (uint32_vector_append (ids, htobe32 (count >> 32)) == -1 ||
+      uint32_vector_append (ids, htobe32 (count)) == -1) {
+    set_error (errno, "realloc");
+    goto fail;
+  }
+
+  /* O(n^2) search - hopefully filter and negotiated contexts are both small */
+  for ( ; (name = *filter) != NULL; filter++) {
+    if (!h->meta_valid) {
+      set_error (EINVAL, "context %s not negotiated", name);
+      goto fail;
+    }
+    for (i = 0; i < h->meta_contexts.len; i++) {
+      struct meta_context *meta = &h->meta_contexts.ptr[i];
+      if (strcmp (name, meta->name) == 0) {
+        if (uint32_vector_append (ids, htobe32 (meta->context_id)) == -1) {
+          set_error (errno, "realloc");
+          goto fail;
+        }
+        break;
+      }
+    }
+    if (i == h->meta_contexts.len) {
+      set_error (EINVAL, "context %s not negotiated", name);
+      goto fail;
+    }
+  }
+
+  SET_CALLBACK_TO_NULL (*extent64);
+  SET_CALLBACK_TO_NULL (*completion);
+  return nbd_internal_command_common (h, flags, NBD_CMD_BLOCK_STATUS, offset,
+                                      count, EINVAL, ids, &cb);
+
+ fail:
+  uint32_vector_reset (ids);
+  free (ids);
+  return -1;
+}
diff --git a/interop/block-status-payload.c b/interop/block-status-payload.c
index cdb0de7c..0c0348ba 100644
--- a/interop/block-status-payload.c
+++ b/interop/block-status-payload.c
@@ -54,11 +54,26 @@ cb (void *opaque, const char *metacontext, uint64_t offset,
   return 0;
 }

+static char **
+list (unsigned int use)
+{
+  static const char *array[ARRAY_SIZE (contexts) + 1];
+  size_t i, j;
+
+  assert (use < 1 << ARRAY_SIZE (contexts));
+  for (i = j = 0; i < ARRAY_SIZE (contexts); i++)
+    if (use & (1 << i))
+      array[j++] = contexts[i];
+  array[j] = NULL;
+  return (char **) array;
+}
+
 int
 main (int argc, char *argv[])
 {
   struct nbd_handle *nbd;
   int64_t exportsize;
+  uint64_t bytes_sent;
   unsigned int seen;
   size_t i;
   int r;
@@ -114,7 +129,107 @@ main (int argc, char *argv[])
   }
   assert (seen == 0xf);

-  /* FIXME: Test filtered calls once the API is added */
+  /* Filtering with all contexts listed, same effect as unfilitered call */
+  seen = 0;
+  if (nbd_block_status_filter (nbd, exportsize, 0, list (0xf),
+                               (nbd_extent64_callback) { .callback = cb,
+                                                         .user_data = &seen },
+                               0) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+  assert (seen == 0xf);
+
+  /* Filtering with just two out of four contexts; test optional flag */
+  seen = 0;
+  if (nbd_block_status_filter (nbd, exportsize, 0, list (0x5),
+                               (nbd_extent64_callback) { .callback = cb,
+                                                         .user_data = &seen },
+                               LIBNBD_CMD_FLAG_PAYLOAD_LEN) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+  assert (seen == 0x5);
+
+  /* Filtering with one context, near end of file (to make sure the
+   * payload length isn't confused with the effect length)
+   */
+  seen = 0;
+  if (nbd_block_status_filter (nbd, 1, exportsize - 1, list (0x2),
+                               (nbd_extent64_callback) { .callback = cb,
+                                                         .user_data = &seen },
+                               0) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+  assert (seen == 0x2);
+
+  /* Filtering with no contexts - pointless, so qemu rejects it */
+  bytes_sent = nbd_stats_bytes_sent (nbd);
+  seen = 0;
+  if (nbd_block_status_filter (nbd, exportsize, 0, list (0x0),
+                               (nbd_extent64_callback) { .callback = cb,
+                                                         .user_data = &seen },
+                               0) != -1) {
+    fprintf (stderr, "expecting block status failure\n");
+    exit (EXIT_FAILURE);
+  }
+  assert (seen == 0x0);
+  if (nbd_get_errno () != EINVAL) {
+    fprintf (stderr, "expecting EINVAL after block status failure\n");
+    exit (EXIT_FAILURE);
+  }
+  if (nbd_stats_bytes_sent (nbd) <= bytes_sent) {
+    fprintf (stderr, "expecting server-side rejection of bad request\n");
+    exit (EXIT_FAILURE);
+  }
+
+  /* Giving unknown string triggers EINVAL from libnbd */
+  bytes_sent = nbd_stats_bytes_sent (nbd);
+  seen = 0;
+  {
+    const char *bogus[] = { "qemu:dirty-bitmap:bitmap2", NULL };
+    if (nbd_block_status_filter (nbd, exportsize, 0, (char **) bogus,
+                                 (nbd_extent64_callback) { .callback = cb,
+                                                           .user_data = &seen },
+                                 0) != -1) {
+      fprintf (stderr, "expecting block status failure\n");
+      exit (EXIT_FAILURE);
+    }
+  }
+  if (nbd_get_errno () != EINVAL) {
+    fprintf (stderr, "expecting EINVAL after block status failure\n");
+    exit (EXIT_FAILURE);
+  }
+  assert (seen == 0x0);
+  if (nbd_stats_bytes_sent (nbd) != bytes_sent) {
+    fprintf (stderr, "expecting client-side rejection of bad request\n");
+    exit (EXIT_FAILURE);
+  }
+
+  /* Giving same string twice triggers EINVAL from qemu */
+  seen = 0;
+  {
+    const char *dupes[] = { "base:allocation", "base:allocation", NULL };
+    if (nbd_block_status_filter (nbd, exportsize, 0, (char **) dupes,
+                                 (nbd_extent64_callback) { .callback = cb,
+                                                           .user_data = &seen },
+                                 0) != -1) {
+      fprintf (stderr, "expecting block status failure\n");
+      exit (EXIT_FAILURE);
+    }
+  }
+  if (nbd_get_errno () != EINVAL) {
+    fprintf (stderr, "expecting EINVAL after block status failure\n");
+    exit (EXIT_FAILURE);
+  }
+  assert (seen == 0x0);
+  if (nbd_stats_bytes_sent (nbd) <= bytes_sent) {
+    fprintf (stderr, "expecting server-side rejection of bad request\n");
+    exit (EXIT_FAILURE);
+  }
+
+  /* Done */
   if (nbd_shutdown (nbd, 0) == -1) {
     fprintf (stderr, "%s\n", nbd_get_error ());
     exit (EXIT_FAILURE);
diff --git a/interop/block-status-payload.sh b/interop/block-status-payload.sh
index a178583b..e42e30e9 100755
--- a/interop/block-status-payload.sh
+++ b/interop/block-status-payload.sh
@@ -49,6 +49,7 @@ args = ["qemu-nbd", "-f", "qcow2", "-A", "-B", "bitmap0", "-B", "bitmap1",
 h.connect_systemd_socket_activation(args)
 assert h.aio_is_negotiating() is True
 assert h.get_extended_headers_negotiated() is False
+
 # Flag not available until info or go
 try:
   h.can_block_status_payload()
@@ -58,7 +59,18 @@ except nbd.Error:
 h.opt_info()
 assert h.can_block_status_payload() is False
 assert h.can_meta_context("base:allocation") is True
-h.opt_abort()
+
+# Filter request not allowed if not advertised
+def f():
+  assert False
+h.opt_go()
+assert h.can_block_status_payload() is False
+try:
+  h.block_status_filter(0, 512, ["base:allocation"], f)
+  assert False
+except nbd.Error:
+  pass
+h.shutdown()
 '

 # Conditional part of test: if qemu is new enough to support extended
diff --git a/info/info-can.sh b/info/info-can.sh
index e5f6a44b..111b0be2 100755
--- a/info/info-can.sh
+++ b/info/info-can.sh
@@ -38,6 +38,9 @@ requires bash -c "nbdkit sh --dump-plugin | grep has_can_cache=1"
 # and oldstyle never, but that feels like depending a bit too much on
 # the implementation.

+# --can block-status-payload is not supported by nbdkit yet. Testing
+# is done during interop with new-enough qemu.
+
 # --can structured-reply is not a per-export setting, but rather
 # something set on the server as a whole.

-- 
2.38.1



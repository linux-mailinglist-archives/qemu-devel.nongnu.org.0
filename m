Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38DC628E41
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:24:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouie0-00026t-Ul; Mon, 14 Nov 2022 18:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouido-0001df-LN
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJF-00034b-CE
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21mFIb8VsGicmXJWSaDFueEflwSnP7lyaVvp7ihlkLY=;
 b=WjahNLRDGCx3FbDiitCLdODWkEFe+xDARU4fLCCvSF63aEeZKGM11aWVkFlq5MPsJXg+Ol
 EGokp4Jp4knG13Yhhoiax1FL07zlAJ81EaKRxWK2pK8okAC1Kjm79BmzaACbZkJYPCKxqt
 lX14yc4WZtDgdFG67Sm/Knd9fJ8Vd3M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-xBx4mP6XPoO6Zj4ZmWTqIw-1; Mon, 14 Nov 2022 17:52:04 -0500
X-MC-Unique: xBx4mP6XPoO6Zj4ZmWTqIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4770F185A7AC;
 Mon, 14 Nov 2022 22:52:04 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B951640E9787;
 Mon, 14 Nov 2022 22:52:03 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 04/23] states: Prepare to send 64-bit requests
Date: Mon, 14 Nov 2022 16:51:39 -0600
Message-Id: <20221114225158.2186742-5-eblake@redhat.com>
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

Support sending 64-bit requests if extended headers were negotiated.
This includes setting NBD_CMD_FLAG_PAYLOAD_LEN any time we send an
extended NBD_CMD_WRITE; this is such a fundamental part of the
protocol that for now it is easier to silently ignore whatever value
the user passes in for that bit in the flags parameter of nbd_pwrite
regardless of the current settings in set_strict_mode, rather than
trying to force the user to pass in the correct value to match whether
extended mode is negotiated.  However, when we later add APIs to give
the user more control for interoperability testing, it may be worth
adding a new set_strict_mode control knob to explicitly enable the
client to intentionally violate the protocol (the testsuite added in
this patch would then be updated to match).

At this point, h->extended_headers is permanently false (we can't
enable it until all other aspects of the protocol have likewise been
converted).

Support for using FLAG_PAYLOAD_LEN with NBD_CMD_BLOCK_STATUS is less
fundamental, and deserves to be in its own patch.
---
 lib/internal.h                      |  10 ++-
 generator/API.ml                    |  20 +++--
 generator/states-issue-command.c    |  29 ++++---
 generator/states-reply-structured.c |   2 +-
 lib/rw.c                            |  17 +++--
 tests/Makefile.am                   |   4 +
 tests/pwrite-extended.c             | 112 ++++++++++++++++++++++++++++
 .gitignore                          |   1 +
 8 files changed, 169 insertions(+), 26 deletions(-)
 create mode 100644 tests/pwrite-extended.c

diff --git a/lib/internal.h b/lib/internal.h
index f81c41ba..e900eca3 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -109,6 +109,9 @@ struct nbd_handle {
   char *tls_username;           /* Username, NULL = use current username */
   char *tls_psk_file;           /* PSK filename, NULL = no PSK */

+  /* Extended headers. */
+  bool extended_headers;        /* If we negotiated NBD_OPT_EXTENDED_HEADERS */
+
   /* Desired metadata contexts. */
   bool request_sr;
   bool request_meta;
@@ -262,7 +265,10 @@ struct nbd_handle {
   /* Issuing a command must use a buffer separate from sbuf, for the
    * case when we interrupt a request to service a reply.
    */
-  struct nbd_request request;
+  union {
+    struct nbd_request compact;
+    struct nbd_request_ext extended;
+  } req;
   bool in_write_payload;
   bool in_write_shutdown;

@@ -363,7 +369,7 @@ struct command {
   uint16_t type;
   uint64_t cookie;
   uint64_t offset;
-  uint32_t count;
+  uint64_t count;
   void *data; /* Buffer for read/write */
   struct command_cb cb;
   bool initialized; /* For read, true if getting a hole may skip memset */
diff --git a/generator/API.ml b/generator/API.ml
index 25a612a2..beb7a2b4 100644
--- a/generator/API.ml
+++ b/generator/API.ml
@@ -198,11 +198,12 @@ let cmd_flags =
   flag_prefix = "CMD_FLAG";
   guard = Some "((h->strict & LIBNBD_STRICT_FLAGS) || flags > UINT16_MAX)";
   flags = [
-    "FUA",       1 lsl 0;
-    "NO_HOLE",   1 lsl 1;
-    "DF",        1 lsl 2;
-    "REQ_ONE",   1 lsl 3;
-    "FAST_ZERO", 1 lsl 4;
+    "FUA",         1 lsl 0;
+    "NO_HOLE",     1 lsl 1;
+    "DF",          1 lsl 2;
+    "REQ_ONE",     1 lsl 3;
+    "FAST_ZERO",   1 lsl 4;
+    "PAYLOAD_LEN", 1 lsl 5;
   ]
 }
 let handshake_flags = {
@@ -2459,7 +2460,7 @@   "pread_structured", {
   "pwrite", {
     default_call with
     args = [ BytesIn ("buf", "count"); UInt64 "offset" ];
-    optargs = [ OFlags ("flags", cmd_flags, Some ["FUA"]) ];
+    optargs = [ OFlags ("flags", cmd_flags, Some ["FUA"; "PAYLOAD_LEN"]) ];
     ret = RErr;
     permitted_states = [ Connected ];
     shortdesc = "write to the NBD server";
@@ -2482,7 +2483,10 @@   "pwrite", {
 C<LIBNBD_CMD_FLAG_FUA> meaning that the server should not
 return until the data has been committed to permanent storage
 (if that is supported - some servers cannot do this, see
-L<nbd_can_fua(3)>)."
+L<nbd_can_fua(3)>).  For convenience, libnbd ignores the presence
+or absence of the flag C<LIBNBD_CMD_FLAG_PAYLOAD_LEN> in C<flags>,
+while correctly using the flag over the wire according to whether
+extended headers were negotiated."
 ^ strict_call_description;
     see_also = [Link "can_fua"; Link "is_read_only";
                 Link "aio_pwrite"; Link "get_block_size";
@@ -3172,7 +3176,7 @@   "aio_pwrite", {
     default_call with
     args = [ BytesPersistIn ("buf", "count"); UInt64 "offset" ];
     optargs = [ OClosure completion_closure;
-                OFlags ("flags", cmd_flags, Some ["FUA"]) ];
+                OFlags ("flags", cmd_flags, Some ["FUA"; "PAYLOAD_LEN"]) ];
     ret = RCookie;
     permitted_states = [ Connected ];
     shortdesc = "write to the NBD server";
diff --git a/generator/states-issue-command.c b/generator/states-issue-command.c
index df9295b5..feea2672 100644
--- a/generator/states-issue-command.c
+++ b/generator/states-issue-command.c
@@ -41,15 +41,24 @@  ISSUE_COMMAND.START:
     return 0;
   }

-  h->request.magic = htobe32 (NBD_REQUEST_MAGIC);
-  h->request.flags = htobe16 (cmd->flags);
-  h->request.type = htobe16 (cmd->type);
-  h->request.handle = htobe64 (cmd->cookie);
-  h->request.offset = htobe64 (cmd->offset);
-  h->request.count = htobe32 ((uint32_t) cmd->count);
+  /* These fields are coincident between req.compact and req.extended */
+  h->req.compact.flags = htobe16 (cmd->flags);
+  h->req.compact.type = htobe16 (cmd->type);
+  h->req.compact.handle = htobe64 (cmd->cookie);
+  h->req.compact.offset = htobe64 (cmd->offset);
+  if (h->extended_headers) {
+    h->req.extended.magic = htobe32 (NBD_EXTENDED_REQUEST_MAGIC);
+    h->req.extended.count = htobe64 (cmd->count);
+    h->wlen = sizeof (h->req.extended);
+  }
+  else {
+    assert (cmd->count <= UINT32_MAX);
+    h->req.compact.magic = htobe32 (NBD_REQUEST_MAGIC);
+    h->req.compact.count = htobe32 (cmd->count);
+    h->wlen = sizeof (h->req.compact);
+  }
   h->chunks_sent++;
-  h->wbuf = &h->request;
-  h->wlen = sizeof (h->request);
+  h->wbuf = &h->req;
   if (cmd->type == NBD_CMD_WRITE || cmd->next)
     h->wflags = MSG_MORE;
   SET_NEXT_STATE (%SEND_REQUEST);
@@ -74,7 +83,7 @@  ISSUE_COMMAND.PREPARE_WRITE_PAYLOAD:

   assert (h->cmds_to_issue != NULL);
   cmd = h->cmds_to_issue;
-  assert (cmd->cookie == be64toh (h->request.handle));
+  assert (cmd->cookie == be64toh (h->req.compact.handle));
   if (cmd->type == NBD_CMD_WRITE) {
     h->wbuf = cmd->data;
     h->wlen = cmd->count;
@@ -120,7 +129,7 @@  ISSUE_COMMAND.FINISH:
   assert (!h->wlen);
   assert (h->cmds_to_issue != NULL);
   cmd = h->cmds_to_issue;
-  assert (cmd->cookie == be64toh (h->request.handle));
+  assert (cmd->cookie == be64toh (h->req.compact.handle));
   h->cmds_to_issue = cmd->next;
   if (h->cmds_to_issue_tail == cmd)
     h->cmds_to_issue_tail = NULL;
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index 7587d856..6f187f14 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -34,7 +34,7 @@ structured_reply_in_bounds (uint64_t offset, uint32_t length,
       offset + length > cmd->offset + cmd->count) {
     set_error (0, "range of structured reply is out of bounds, "
                "offset=%" PRIu64 ", cmd->offset=%" PRIu64 ", "
-               "length=%" PRIu32 ", cmd->count=%" PRIu32 ": "
+               "length=%" PRIu32 ", cmd->count=%" PRIu64 ": "
                "this is likely to be a bug in the NBD server",
                offset, cmd->offset, length, cmd->count);
     return false;
diff --git a/lib/rw.c b/lib/rw.c
index 104d0fb0..81dded3f 100644
--- a/lib/rw.c
+++ b/lib/rw.c
@@ -223,13 +223,11 @@ nbd_internal_command_common (struct nbd_handle *h,
     }
     break;

-    /* Other commands are currently limited by the 32 bit field in the
-     * command structure on the wire, but in future we hope to support
-     * 64 bit values here with a change to the NBD protocol which is
-     * being discussed upstream.
+    /* Other commands are limited by the 32 bit field in the command
+     * structure on the wire, unless extended headers were negotiated.
      */
   default:
-    if (count > UINT32_MAX) {
+    if (!h->extended_headers && count > UINT32_MAX) {
       set_error (ERANGE, "request too large: maximum request size is %" PRIu32,
                  UINT32_MAX);
       goto err;
@@ -358,6 +356,15 @@ nbd_unlocked_aio_pwrite (struct nbd_handle *h, const void *buf,
       return -1;
     }
   }
+  /* It is more convenient to manage PAYLOAD_LEN by what was negotiated
+   * than to require the user to have to set it correctly.
+   * TODO: Add new h->strict bit to allow intentional protocol violation
+   * for interoperability testing.
+   */
+  if (h->extended_headers)
+    flags |= LIBNBD_CMD_FLAG_PAYLOAD_LEN;
+  else
+    flags &= ~LIBNBD_CMD_FLAG_PAYLOAD_LEN;

   SET_CALLBACK_TO_NULL (*completion);
   return nbd_internal_command_common (h, flags, NBD_CMD_WRITE, offset, count,
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 0b9c454e..cb99309c 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -231,6 +231,7 @@ check_PROGRAMS += \
 	meta-base-allocation \
 	closure-lifetimes \
 	pread-initialize \
+  pwrite-extended \
 	$(NULL)

 TESTS += \
@@ -642,6 +643,9 @@ closure_lifetimes_LDADD = $(top_builddir)/lib/libnbd.la
 pread_initialize_SOURCES = pread-initialize.c
 pread_initialize_LDADD = $(top_builddir)/lib/libnbd.la

+pwrite_extended_SOURCES = pwrite-extended.c
+pwrite_extended_LDADD = $(top_builddir)/lib/libnbd.la
+
 #----------------------------------------------------------------------
 # Testing TLS support.

diff --git a/tests/pwrite-extended.c b/tests/pwrite-extended.c
new file mode 100644
index 00000000..eeedf0a1
--- /dev/null
+++ b/tests/pwrite-extended.c
@@ -0,0 +1,112 @@
+/* NBD client library in userspace
+ * Copyright (C) 2013-2022 Red Hat Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+/* Check behavior of pwrite with PAYLOAD_LEN flag for extended headers. */
+
+#include <config.h>
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <unistd.h>
+#include <sys/stat.h>
+
+#include <libnbd.h>
+
+static char *progname;
+static char buf[512];
+
+static void
+check (int experr, const char *prefix)
+{
+  const char *msg = nbd_get_error ();
+  int errnum = nbd_get_errno ();
+
+  fprintf (stderr, "error: \"%s\"\n", msg);
+  fprintf (stderr, "errno: %d (%s)\n", errnum, strerror (errnum));
+  if (strncmp (msg, prefix, strlen (prefix)) != 0) {
+    fprintf (stderr, "%s: test failed: missing context prefix: %s\n",
+             progname, msg);
+    exit (EXIT_FAILURE);
+  }
+  if (errnum != experr) {
+    fprintf (stderr, "%s: test failed: "
+             "expected errno = %d (%s), but got %d\n",
+             progname, experr, strerror (experr), errnum);
+    exit (EXIT_FAILURE);
+  }
+}
+
+int
+main (int argc, char *argv[])
+{
+  struct nbd_handle *nbd;
+  const char *cmd[] = {
+    "nbdkit", "-s", "-v", "--exit-with-parent", "memory", "1048576", NULL
+  };
+  uint32_t strict;
+
+  progname = argv[0];
+
+  nbd = nbd_create ();
+  if (nbd == NULL) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  /* Connect to the server. */
+  if (nbd_connect_command (nbd, (char **) cmd) == -1) {
+    fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  /* FIXME: future API addition to test if server negotiated extended mode.
+   * Until then, strict flags must ignore the PAYLOAD_LEN flag for pwrite,
+   * even though it is rejected for other commands.
+   */
+  strict = nbd_get_strict_mode (nbd);
+  if (!(strict & LIBNBD_STRICT_FLAGS)) {
+    fprintf (stderr, "%s: test failed: "
+             "nbd_get_strict_mode did not have expected flag set\n",
+             argv[0]);
+    exit (EXIT_FAILURE);
+  }
+  if (nbd_aio_pread (nbd, buf, 512, 0, NBD_NULL_COMPLETION,
+                     LIBNBD_CMD_FLAG_PAYLOAD_LEN) != -1) {
+    fprintf (stderr, "%s: test failed: "
+             "nbd_aio_pread did not fail with unexpected flag\n",
+             argv[0]);
+    exit (EXIT_FAILURE);
+  }
+  check (EINVAL, "nbd_aio_pread: ");
+
+  if (nbd_aio_pwrite (nbd, buf, 512, 0, NBD_NULL_COMPLETION,
+                     LIBNBD_CMD_FLAG_PAYLOAD_LEN) == -1) {
+    fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  if (nbd_aio_pwrite (nbd, buf, 512, 0, NBD_NULL_COMPLETION, 0) == -1) {
+    fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  nbd_close (nbd);
+  exit (EXIT_SUCCESS);
+}
diff --git a/.gitignore b/.gitignore
index f4273713..bd002522 100644
--- a/.gitignore
+++ b/.gitignore
@@ -242,6 +242,7 @@ Makefile.in
 /tests/pki/
 /tests/pread-initialize
 /tests/private-data
+/tests/pwrite-extended
 /tests/read-only-flag
 /tests/read-write-flag
 /tests/server-death
-- 
2.38.1



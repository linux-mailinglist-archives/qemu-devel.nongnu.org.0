Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B81B628D7A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:34:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouids-0001rN-S1; Mon, 14 Nov 2022 18:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidn-0001X6-1U
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJP-00036n-AA
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VvBB30A7zggPuWnJggKPmR+K5etynzvU9euhLFtV6Bk=;
 b=Q3pP0Sk3zNEOivq10gnPzpbcFY6s8E13I/MwWbTUm+31rSaZTfz7pZMRMu4Ucr+gNgi7r2
 NEmLl7nLPhazqI+u6CTuG8ILRYwbP34CuDqLQS+W8VxCLAdNlW5I5sN+HwBDzFQA3TeuHN
 tBo9Zwo332wcjd70DBUPA2G/E1ISFxY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-IIoAmcm2OP2PZM2bvsak8g-1; Mon, 14 Nov 2022 17:52:13 -0500
X-MC-Unique: IIoAmcm2OP2PZM2bvsak8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B27913C0E467;
 Mon, 14 Nov 2022 22:52:12 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F52840E9786;
 Mon, 14 Nov 2022 22:52:12 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 19/23] api: Add nbd_[aio_]opt_extended_headers()
Date: Mon, 14 Nov 2022 16:51:54 -0600
Message-Id: <20221114225158.2186742-20-eblake@redhat.com>
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

Very similar to the recent addition of nbd_opt_structured_reply,
giving us fine-grained control over an extended headers request.

Because nbdkit does not yet support extended headers, testsuite
coverage is limited to interop testing with qemu-nbd.  It shows that
extended headers imply structured replies, regardless of which order
the two are manually negotiated in.
---
 generator/API.ml                              |  79 +++++++--
 .../states-newstyle-opt-extended-headers.c    |  30 +++-
 generator/states-newstyle.c                   |   3 +
 lib/opt.c                                     |  44 +++++
 interop/Makefile.am                           |   6 +
 interop/opt-extended-headers.c                | 153 ++++++++++++++++++
 interop/opt-extended-headers.sh               |  29 ++++
 .gitignore                                    |   1 +
 8 files changed, 329 insertions(+), 16 deletions(-)
 create mode 100644 interop/opt-extended-headers.c
 create mode 100755 interop/opt-extended-headers.sh

diff --git a/generator/API.ml b/generator/API.ml
index 570f15f4..c4d15e3a 100644
--- a/generator/API.ml
+++ b/generator/API.ml
@@ -825,6 +825,7 @@   "set_request_extended_headers", {
 if L<nbd_set_request_structured_replies(3)> is also set to false,
 since the use of extended headers implies structured replies.";
     see_also = [Link "get_request_extended_headers";
+                Link "opt_extended_headers";
                 Link "set_handshake_flags"; Link "set_strict_mode";
                 Link "get_extended_headers_negotiated";
                 Link "zero"; Link "trim"; Link "cache";
@@ -856,7 +857,9 @@   "get_extended_headers_negotiated", {
     shortdesc = "see if extended headers are in use";
     longdesc = "\
 After connecting you may call this to find out if the connection is
-using extended headers.
+using extended headers.  Note that this setting is sticky; this
+can return true even after a second L<nbd_opt_extended_headers(3)>
+returns false because the server detected a duplicate request.

 When extended headers are not in use, commands are limited to a
 32-bit length, even when the libnbd API uses a 64-bit parameter
@@ -938,7 +941,7 @@   "get_structured_replies_negotiated", {
 attempted.";
     see_also = [Link "set_request_structured_replies";
                 Link "get_request_structured_replies";
-                Link "opt_structured_reply";
+                Link "opt_structured_reply"; Link "opt_extended_headers";
                 Link "get_protocol";
                 Link "get_extended_headers_negotiated"];
   };
@@ -1211,12 +1214,13 @@   "set_opt_mode", {
 newstyle server.  This setting has no effect when connecting to an
 oldstyle server.

-Note that libnbd defaults to attempting C<NBD_OPT_STARTTLS> and
-C<NBD_OPT_STRUCTURED_REPLY> before letting you control remaining
-negotiation steps; if you need control over these steps as well,
-first set L<nbd_set_tls(3)> to C<LIBNBD_TLS_DISABLE> and
-L<nbd_set_request_structured_replies(3)> to false before starting
-the connection attempt.
+Note that libnbd defaults to attempting C<NBD_OPT_STARTTLS>,
+C<NBD_OPT_EXTENDED_HEADERS>, and C<NBD_OPT_STRUCTURED_REPLY>
+before letting you control remaining negotiation steps; if you
+need control over these steps as well, first set L<nbd_set_tls(3)>
+to C<LIBNBD_TLS_DISABLE>, and L<nbd_set_request_extended_headers(3)>
+or L<nbd_set_request_structured_replies(3)> to false, before
+starting the connection attempt.

 When option mode is enabled, you have fine-grained control over which
 options are negotiated, compared to the default of the server
@@ -1324,6 +1328,35 @@   "opt_starttls", {
                 Link "supports_tls"]
   };

+  "opt_extended_headers", {
+    default_call with
+    args = []; ret = RBool;
+    permitted_states = [ Negotiating ];
+    shortdesc = "request the server to enable extended headers";
+    longdesc = "\
+Request that the server use extended headers, by sending
+C<NBD_OPT_EXTENDED_HEADERS>.  This can only be used if
+L<nbd_set_opt_mode(3)> enabled option mode; furthermore, libnbd
+defaults to automatically requesting this unless you use
+L<nbd_set_request_extended_headers(3)> or
+L<nbd_set_request_structured_replies(3)> prior to connecting.
+This function is mainly useful for integration testing of corner
+cases in server handling.
+
+This function returns true if the server replies with success,
+false if the server replies with an error, and fails only if
+the server does not reply (such as for a loss of connection).
+Note that some servers fail a second request as redundant;
+libnbd assumes that once one request has succeeded, then
+extended headers are supported (as visible by
+L<nbd_get_extended_headers_negotiated(3)>) regardless if
+later calls to this function return false.  If this function
+returns true, the use of structured replies is implied.";
+    see_also = [Link "set_opt_mode"; Link "aio_opt_extended_headers";
+                Link "opt_go"; Link "set_request_extended_headers";
+                Link "set_request_structured_replies"]
+  };
+
   "opt_structured_reply", {
     default_call with
     args = []; ret = RBool;
@@ -1345,7 +1378,9 @@   "opt_structured_reply", {
 libnbd assumes that once one request has succeeded, then
 structured replies are supported (as visible by
 L<nbd_get_structured_replies_negotiated(3)>) regardless if
-later calls to this function return false.";
+later calls to this function return false.  Similarly, a
+server may fail this request if extended headers are already
+negotiated, since extended headers take priority.";
     see_also = [Link "set_opt_mode"; Link "aio_opt_structured_reply";
                 Link "opt_go"; Link "set_request_structured_replies"]
   };
@@ -3098,6 +3133,30 @@   "aio_opt_starttls", {
     see_also = [Link "set_opt_mode"; Link "opt_starttls"];
   };

+  "aio_opt_extended_headers", {
+    default_call with
+    args = [];
+    optargs = [ OClosure completion_closure ];
+    ret = RErr;
+    permitted_states = [ Negotiating ];
+    shortdesc = "request the server to enable extended headers";
+    longdesc = "\
+Request that the server use extended headers, by sending
+C<NBD_OPT_EXTENDED_HEADERS>.  This behaves like the synchronous
+counterpart L<nbd_opt_extended_headers(3)>, except that it does
+not wait for the server's response.
+
+To determine when the request completes, wait for
+L<nbd_aio_is_connecting(3)> to return false.  Or supply the optional
+C<completion_callback> which will be invoked as described in
+L<libnbd(3)/Completion callbacks>, except that it is automatically
+retired regardless of return value.  Note that detecting whether the
+server returns an error (as is done by the return value of the
+synchronous counterpart) is only possible with a completion
+callback.";
+    see_also = [Link "set_opt_mode"; Link "opt_extended_headers"];
+  };
+
   "aio_opt_structured_reply", {
     default_call with
     args = [];
@@ -4070,6 +4129,8 @@ let first_version =
   "set_request_extended_headers", (1, 16);
   "get_request_extended_headers", (1, 16);
   "get_extended_headers_negotiated", (1, 16);
+  "opt_extended_headers", (1, 16);
+  "aio_opt_extended_headers", (1, 16);

   (* These calls are proposed for a future version of libnbd, but
    * have not been added to any released version so far.
diff --git a/generator/states-newstyle-opt-extended-headers.c b/generator/states-newstyle-opt-extended-headers.c
index 151787bf..d73d1b5f 100644
--- a/generator/states-newstyle-opt-extended-headers.c
+++ b/generator/states-newstyle-opt-extended-headers.c
@@ -21,11 +21,14 @@
 STATE_MACHINE {
  NEWSTYLE.OPT_EXTENDED_HEADERS.START:
   assert (h->gflags & LIBNBD_HANDSHAKE_FLAG_FIXED_NEWSTYLE);
-  assert (h->opt_current != NBD_OPT_EXTENDED_HEADERS);
-  assert (CALLBACK_IS_NULL (h->opt_cb.completion));
-  if (!h->request_eh || !h->request_sr) {
-    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
-    return 0;
+  if (h->opt_current == NBD_OPT_EXTENDED_HEADERS)
+    assert (h->opt_mode);
+  else {
+    assert (CALLBACK_IS_NULL (h->opt_cb.completion));
+    if (!h->request_eh || !h->request_sr) {
+      SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+      return 0;
+    }
   }

   h->sbuf.option.version = htobe64 (NBD_NEW_VERSION);
@@ -68,6 +71,7 @@  NEWSTYLE.OPT_EXTENDED_HEADERS.RECV_REPLY_PAYLOAD:

  NEWSTYLE.OPT_EXTENDED_HEADERS.CHECK_REPLY:
   uint32_t reply;
+  int err = ENOTSUP;

   reply = be32toh (h->sbuf.or.option_reply.reply);
   switch (reply) {
@@ -76,19 +80,31 @@  NEWSTYLE.OPT_EXTENDED_HEADERS.CHECK_REPLY:
     h->extended_headers = true;
     /* Extended headers trump structured replies, so skip ahead. */
     h->structured_replies = true;
+    err = 0;
     break;
+  case NBD_REP_ERR_INVALID:
+    err = EINVAL;
+    /* fallthrough */
   default:
     if (handle_reply_error (h) == -1) {
       SET_NEXT_STATE (%.DEAD);
       return 0;
     }

-    debug (h, "extended headers are not supported by this server");
+    if (h->extended_headers)
+      debug (h, "extended headers already negotiated");
+    else
+      debug (h, "extended headers are not supported by this server");
     break;
   }

   /* Next option. */
-  SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+  if (h->opt_current == NBD_OPT_EXTENDED_HEADERS)
+    SET_NEXT_STATE (%.NEGOTIATING);
+  else
+    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+  CALL_CALLBACK (h->opt_cb.completion, &err);
+  nbd_internal_free_option (h);
   return 0;

 } /* END STATE MACHINE */
diff --git a/generator/states-newstyle.c b/generator/states-newstyle.c
index c88430e2..66bbd86a 100644
--- a/generator/states-newstyle.c
+++ b/generator/states-newstyle.c
@@ -146,6 +146,9 @@  NEWSTYLE.START:
     case NBD_OPT_STRUCTURED_REPLY:
       SET_NEXT_STATE (%OPT_STRUCTURED_REPLY.START);
       return 0;
+    case NBD_OPT_EXTENDED_HEADERS:
+      SET_NEXT_STATE (%OPT_EXTENDED_HEADERS.START);
+      return 0;
     case NBD_OPT_STARTTLS:
       SET_NEXT_STATE (%OPT_STARTTLS.START);
       return 0;
diff --git a/lib/opt.c b/lib/opt.c
index 776a3612..bcdd5741 100644
--- a/lib/opt.c
+++ b/lib/opt.c
@@ -164,6 +164,31 @@ nbd_unlocked_opt_starttls (struct nbd_handle *h)
   return r;
 }

+/* Issue NBD_OPT_EXTENDED_HEADERS and wait for the reply. */
+int
+nbd_unlocked_opt_extended_headers (struct nbd_handle *h)
+{
+  int err;
+  nbd_completion_callback c = { .callback = go_complete, .user_data = &err };
+  int r = nbd_unlocked_aio_opt_extended_headers (h, &c);
+
+  if (r == -1)
+    return r;
+
+  r = wait_for_option (h);
+  if (r == 0) {
+    if (nbd_internal_is_state_negotiating (get_next_state (h)))
+      r = err == 0;
+    else {
+      assert (nbd_internal_is_state_dead (get_next_state (h)));
+      set_error (err,
+                 "failed to get response to opt_extended_headers request");
+      r = -1;
+    }
+  }
+  return r;
+}
+
 /* Issue NBD_OPT_STRUCTURED_REPLY and wait for the reply. */
 int
 nbd_unlocked_opt_structured_reply (struct nbd_handle *h)
@@ -386,6 +411,25 @@ nbd_unlocked_aio_opt_starttls (struct nbd_handle *h,
 #endif
 }

+/* Issue NBD_OPT_EXTENDED_HEADERS without waiting. */
+int
+nbd_unlocked_aio_opt_extended_headers (struct nbd_handle *h,
+                                       nbd_completion_callback *complete)
+{
+  if ((h->gflags & LIBNBD_HANDSHAKE_FLAG_FIXED_NEWSTYLE) == 0) {
+    set_error (ENOTSUP, "server is not using fixed newstyle protocol");
+    return -1;
+  }
+
+  h->opt_current = NBD_OPT_EXTENDED_HEADERS;
+  h->opt_cb.completion = *complete;
+  SET_CALLBACK_TO_NULL (*complete);
+
+  if (nbd_internal_run (h, cmd_issue) == -1)
+    debug (h, "option queued, ignoring state machine failure");
+  return 0;
+}
+
 /* Issue NBD_OPT_STRUCTURED_REPLY without waiting. */
 int
 nbd_unlocked_aio_opt_structured_reply (struct nbd_handle *h,
diff --git a/interop/Makefile.am b/interop/Makefile.am
index 75716eb9..5e0ea1ed 100644
--- a/interop/Makefile.am
+++ b/interop/Makefile.am
@@ -25,6 +25,7 @@ EXTRA_DIST = \
 	list-exports-test-dir/disk1 \
 	list-exports-test-dir/disk2 \
 	structured-read.sh \
+	opt-extended-headers.sh \
 	$(NULL)

 TESTS_ENVIRONMENT = \
@@ -134,6 +135,7 @@ check_PROGRAMS += \
 	socket-activation-qemu-nbd \
 	dirty-bitmap \
 	structured-read \
+	opt-extended-headers \
 	$(NULL)
 TESTS += \
 	interop-qemu-nbd \
@@ -144,6 +146,7 @@ TESTS += \
 	dirty-bitmap.sh \
 	structured-read.sh \
 	interop-qemu-block-size.sh \
+	opt-extended-headers.sh \
 	$(NULL)

 interop_qemu_nbd_SOURCES = \
@@ -235,6 +238,9 @@ dirty_bitmap_LDADD = $(top_builddir)/lib/libnbd.la
 structured_read_SOURCES = structured-read.c
 structured_read_LDADD = $(top_builddir)/lib/libnbd.la

+opt_extended_headers_SOURCES = opt-extended-headers.c
+opt_extended_headers_LDADD = $(top_builddir)/lib/libnbd.la
+
 endif HAVE_QEMU_NBD

 #----------------------------------------------------------------------
diff --git a/interop/opt-extended-headers.c b/interop/opt-extended-headers.c
new file mode 100644
index 00000000..d8ca102d
--- /dev/null
+++ b/interop/opt-extended-headers.c
@@ -0,0 +1,153 @@
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
+/* Demonstrate low-level use of nbd_opt_extended_headers(). */
+
+#include <config.h>
+
+#include <inttypes.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <unistd.h>
+#include <sys/stat.h>
+
+#include <libnbd.h>
+
+#define check(got, exp) do_check (#got, got, exp)
+
+static void
+do_check (const char *act, int64_t got, int64_t exp)
+{
+  fprintf (stderr, "trying %s\n", act);
+  if (got == -1)
+    fprintf (stderr, "%s\n", nbd_get_error ());
+  else
+    fprintf (stderr, "succeeded, result %" PRId64 "\n", got);
+  if (got != exp) {
+    fprintf (stderr, "got %" PRId64 ", but expected %" PRId64 "\n", got, exp);
+    exit (EXIT_FAILURE);
+  }
+}
+
+static int
+cb (void *data, const char *metacontext, uint64_t offset,
+         nbd_extent *entries, size_t nr_entries, int *error)
+{
+  /* If we got here, extents worked, implying at least structured replies */
+  bool *seen = data;
+
+  *seen = true;
+  return 0;
+}
+
+struct nbd_handle *
+prep (bool sr, bool eh, char **cmd)
+{
+  struct nbd_handle *nbd;
+
+  nbd = nbd_create ();
+  if (nbd == NULL) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  /* Connect to the server in opt mode, disable client-side failsafes so
+   * that we are testing server response even when client breaks protocol.
+   */
+  check (nbd_set_opt_mode (nbd, true), 0);
+  check (nbd_set_strict_mode (nbd, 0), 0);
+  check (nbd_add_meta_context (nbd, LIBNBD_CONTEXT_BASE_ALLOCATION), 0);
+  check (nbd_set_request_structured_replies (nbd, sr), 0);
+  check (nbd_set_request_extended_headers (nbd, eh), 0);
+  check (nbd_connect_systemd_socket_activation (nbd, cmd), 0);
+
+  return nbd;
+}
+
+void
+cleanup (struct nbd_handle *nbd, bool extents_exp)
+{
+  bool extents = false;
+
+  check (nbd_opt_go (nbd), 0);
+  check (nbd_can_meta_context (nbd, LIBNBD_CONTEXT_BASE_ALLOCATION),
+         extents_exp);
+  check (nbd_block_status_64 (nbd, 512, 0,
+                              (nbd_extent64_callback) { .callback = cb,
+                                                        .user_data = &extents },
+                              0), extents_exp ? 0 : -1);
+  check (extents, extents_exp);
+  nbd_close (nbd);
+}
+
+int
+main (int argc, char *argv[])
+{
+  struct nbd_handle *nbd;
+  int64_t bytes_sent;
+
+  if (argc < 2) {
+    fprintf (stderr, "%s qemu-nbd [args ...]\n", argv[0]);
+    exit (EXIT_FAILURE);
+  }
+
+  /* Default setup tries eh first, and skips sr request when eh works... */
+  nbd = prep (true, true, &argv[1]);
+  bytes_sent = nbd_stats_bytes_sent (nbd);
+  check (nbd_get_extended_headers_negotiated (nbd), true);
+  check (nbd_get_structured_replies_negotiated (nbd), true);
+  /* Duplicate eh request is no-op as redundant, but does not change state */
+  check (nbd_opt_extended_headers (nbd), false);
+  /* Trying sr after eh is no-op as redundant, but does not change state */
+  check (nbd_opt_structured_reply (nbd), false);
+  check (nbd_get_extended_headers_negotiated (nbd), true);
+  check (nbd_get_structured_replies_negotiated (nbd), true);
+  cleanup (nbd, true);
+
+  /* ...which should result in the same amount of initial negotiation
+   * traffic as explicitly requesting just structured replies, albeit
+   * with different results on what got negotiated.
+   */
+  nbd = prep (true, false, &argv[1]);
+  check (nbd_stats_bytes_sent (nbd), bytes_sent);
+  check (nbd_get_extended_headers_negotiated (nbd), false);
+  check (nbd_get_structured_replies_negotiated (nbd), true);
+  cleanup (nbd, true);
+
+  /* request_eh is ignored if request_sr is false. */
+  nbd = prep (false, true, &argv[1]);
+  check (nbd_get_extended_headers_negotiated (nbd), false);
+  check (nbd_get_structured_replies_negotiated (nbd), false);
+  cleanup (nbd, false);
+
+  /* Swap order, requesting structured replies before extended headers */
+  nbd = prep (false, false, &argv[1]);
+  check (nbd_get_extended_headers_negotiated (nbd), false);
+  check (nbd_get_structured_replies_negotiated (nbd), false);
+  check (nbd_opt_structured_reply (nbd), true);
+  check (nbd_get_extended_headers_negotiated (nbd), false);
+  check (nbd_get_structured_replies_negotiated (nbd), true);
+  check (nbd_opt_extended_headers (nbd), true);
+  check (nbd_get_extended_headers_negotiated (nbd), true);
+  check (nbd_get_structured_replies_negotiated (nbd), true);
+  cleanup (nbd, true);
+
+  exit (EXIT_SUCCESS);
+}
diff --git a/interop/opt-extended-headers.sh b/interop/opt-extended-headers.sh
new file mode 100755
index 00000000..491770d9
--- /dev/null
+++ b/interop/opt-extended-headers.sh
@@ -0,0 +1,29 @@
+#!/usr/bin/env bash
+# nbd client library in userspace
+# Copyright (C) 2019-2022 Red Hat Inc.
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+
+# Test low-level nbd_opt_extended_headers() details with qemu-nbd
+
+source ../tests/functions.sh
+set -e
+set -x
+
+requires qemu-nbd --version
+requires nbdinfo --can extended-headers -- [ qemu-nbd -r -f raw "$0" ]
+
+# Run the test.
+$VG ./opt-extended-headers qemu-nbd -r -f raw "$0"
diff --git a/.gitignore b/.gitignore
index bd002522..35e65335 100644
--- a/.gitignore
+++ b/.gitignore
@@ -113,6 +113,7 @@ Makefile.in
 /interop/list-exports-nbdkit
 /interop/list-exports-qemu-nbd
 /interop/nbd-server-tls.conf
+/interop/opt-extended-headers
 /interop/requires.c
 /interop/socket-activation-nbdkit
 /interop/socket-activation-qemu-nbd
-- 
2.38.1



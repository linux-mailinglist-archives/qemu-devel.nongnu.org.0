Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F797468076
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:33:38 +0100 (CET)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtI3d-0000xs-3k
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:33:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoi-0002fX-43
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHof-0003Mi-UR
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HMhZ/bLLXF53/qi0tkGRtPJbTfTkg2F1ZO6GXmeb9rA=;
 b=GLPyx85fu+6QK1RP3LtzYNTtSoEE+ivcWVgkHeRIeBWhrWOyX1aiKvHBpYSwD2maf9BrJh
 RS/+mdVd7jBMkpWc9b1qAtJxPX6wrXD9xGvVNh7nVNv109dpTdUgs+YePiC13C/xpHhTq0
 7uTKMq8+KZyCCZHyndsy/B+P2Y60Cgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-s8dUKXSNPMKd5LspYOaKag-1; Fri, 03 Dec 2021 18:18:06 -0500
X-MC-Unique: s8dUKXSNPMKd5LspYOaKag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 552E32F25;
 Fri,  3 Dec 2021 23:18:05 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 712835DF2B;
 Fri,  3 Dec 2021 23:18:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Subject: [libnbd PATCH 11/13] api: Add three functions for controlling
 extended headers
Date: Fri,  3 Dec 2021 17:17:39 -0600
Message-Id: <20211203231741.3901263-12-eblake@redhat.com>
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

The new NBD_OPT_EXTENDED_HEADERS feature is worth using by default,
but there may be cases where the user explicitly wants to stick with
the older 32-bit headers.  nbd_set_request_extended_headers() will let
the client override the default, nbd_get_request_extended_headers()
determines the current state of the request, and
nbd_get_extended_headers_negotiated() determines what the client and
server actually settled on.  These use
nbd_set_request_structured_headers() and friends as a template.

Note that this patch just adds the API but ignores the state variable;
the next one will then tweak the state machine to actually request
structured headers when the state variable is set.
---
 lib/internal.h                             |  1 +
 generator/API.ml                           | 89 ++++++++++++++++++++--
 lib/handle.c                               | 23 ++++++
 python/t/110-defaults.py                   |  3 +-
 python/t/120-set-non-defaults.py           |  4 +-
 ocaml/tests/test_110_defaults.ml           |  4 +-
 ocaml/tests/test_120_set_non_defaults.ml   |  5 +-
 golang/libnbd_110_defaults_test.go         |  8 ++
 golang/libnbd_120_set_non_defaults_test.go | 12 +++
 9 files changed, 137 insertions(+), 12 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 97abf4f2..a579e413 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -107,6 +107,7 @@ struct nbd_handle {
   char *tls_psk_file;           /* PSK filename, NULL = no PSK */

   /* Extended headers. */
+  bool request_eh;              /* Whether to request extended headers */
   bool extended_headers;        /* If we negotiated NBD_OPT_EXTENDED_HEADERS */

   /* Desired metadata contexts. */
diff --git a/generator/API.ml b/generator/API.ml
index 1a452a24..e45f0c86 100644
--- a/generator/API.ml
+++ b/generator/API.ml
@@ -675,6 +675,63 @@   "get_tls_psk_file", {
   };
 *)

+  "set_request_extended_headers", {
+    default_call with
+    args = [Bool "request"]; ret = RErr;
+    permitted_states = [ Created ];
+    shortdesc = "control use of extended headers";
+    longdesc = "\
+By default, libnbd tries to negotiate extended headers with the
+server, as this protocol extension permits the use of 64-bit
+zero, trim, and block status actions.  However,
+for integration testing, it can be useful to clear this flag
+rather than find a way to alter the server to fail the negotiation
+request.";
+    see_also = [Link "get_request_extended_headers";
+                Link "set_handshake_flags"; Link "set_strict_mode";
+                Link "get_extended_headers_negotiated";
+                Link "zero"; Link "trim"; Link "cache";
+                Link "block_status_64";
+                Link "set_request_structured_replies"];
+  };
+
+  "get_request_extended_headers", {
+    default_call with
+    args = []; ret = RBool;
+    may_set_error = false;
+    shortdesc = "see if extended headers are attempted";
+    longdesc = "\
+Return the state of the request extended headers flag on this
+handle.
+
+B<Note:> If you want to find out if extended headers were actually
+negotiated on a particular connection use
+L<nbd_get_extended_headers_negotiated(3)> instead.";
+    see_also = [Link "set_request_extended_headers";
+                Link "get_extended_headers_negotiated";
+                Link "get_request_extended_headers"];
+  };
+
+  "get_extended_headers_negotiated", {
+    default_call with
+    args = []; ret = RBool;
+    permitted_states = [ Negotiating; Connected; Closed ];
+    shortdesc = "see if extended headers are in use";
+    longdesc = "\
+After connecting you may call this to find out if the connection is
+using extended headers.  When extended headers are not in use, commands
+are limited to a 32-bit length, even when the libnbd API uses a 64-bit
+variable to express the length.  But even when extended headers are
+supported, the server may enforce other limits, visible through
+L<nbd_get_block_size(3)>.";
+    see_also = [Link "set_request_extended_headers";
+                Link "get_request_extended_headers";
+                Link "zero"; Link "trim"; Link "cache";
+                Link "block_status_64"; Link "get_block_size";
+                Link "get_protocol";
+                Link "get_structured_replies_negotiated"];
+  };
+
   "set_request_structured_replies", {
     default_call with
     args = [Bool "request"]; ret = RErr;
@@ -690,7 +747,8 @@   "set_request_structured_replies", {
     see_also = [Link "get_request_structured_replies";
                 Link "set_handshake_flags"; Link "set_strict_mode";
                 Link "get_structured_replies_negotiated";
-                Link "can_meta_context"; Link "can_df"];
+                Link "can_meta_context"; Link "can_df";
+                Link "set_request_extended_headers"];
   };

   "get_request_structured_replies", {
@@ -706,7 +764,8 @@   "get_request_structured_replies", {
 negotiated on a particular connection use
 L<nbd_get_structured_replies_negotiated(3)> instead.";
     see_also = [Link "set_request_structured_replies";
-                Link "get_structured_replies_negotiated"];
+                Link "get_structured_replies_negotiated";
+                Link "get_request_extended_headers"];
   };

   "get_structured_replies_negotiated", {
@@ -719,7 +778,8 @@   "get_structured_replies_negotiated", {
 using structured replies.";
     see_also = [Link "set_request_structured_replies";
                 Link "get_request_structured_replies";
-                Link "get_protocol"];
+                Link "get_protocol";
+                Link "get_extended_headers_negotiated"];
   };

   "set_handshake_flags", {
@@ -2035,7 +2095,9 @@   "trim", {
 or there is an error.  Note this will generally return an error
 if L<nbd_can_trim(3)> is false or L<nbd_is_read_only(3)> is true.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum trim size, although
 a future extension may add a constraint visible in
@@ -2066,7 +2128,9 @@   "cache", {
 this command.  Note this will generally return an error if
 L<nbd_can_cache(3)> is false.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum cache size, although
 a future extension may add a constraint visible in
@@ -2095,7 +2159,9 @@   "zero", {
 or there is an error.  Note this will generally return an error if
 L<nbd_can_zero(3)> is false or L<nbd_is_read_only(3)> is true.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum zero size, although
 a future extension may add a constraint visible in
@@ -2135,7 +2201,9 @@   "block_status", {
 are supported, the number of blocks and cumulative length
 of those blocks need not be identical between contexts.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum block status size,
 although a future extension may add a constraint visible in
@@ -2209,7 +2277,9 @@   "block_status_64", {
 are supported, the number of blocks and cumulative length
 of those blocks need not be identical between contexts.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum block status size,
 although a future extension may add a constraint visible in
@@ -3239,6 +3309,9 @@ let first_version =
   (* Added in 1.11.x development cycle, will be stable and supported in 1.12. *)
   "block_status_64", (1, 12);
   "aio_block_status_64", (1, 12);
+  "set_request_extended_headers", (1, 12);
+  "get_request_extended_headers", (1, 12);
+  "get_extended_headers_negotiated", (1, 12);

   (* These calls are proposed for a future version of libnbd, but
    * have not been added to any released version so far.
diff --git a/lib/handle.c b/lib/handle.c
index 74fe87ec..9b96c7f7 100644
--- a/lib/handle.c
+++ b/lib/handle.c
@@ -63,6 +63,7 @@ nbd_create (void)

   h->unique = 1;
   h->tls_verify_peer = true;
+  h->request_eh = true;
   h->request_sr = true;

   h->uri_allow_transports = LIBNBD_ALLOW_TRANSPORT_MASK;
@@ -356,6 +357,28 @@ nbd_unlocked_clear_meta_contexts (struct nbd_handle *h)
   return 0;
 }

+
+int
+nbd_unlocked_set_request_extended_headers (struct nbd_handle *h,
+                                           bool request)
+{
+  h->request_eh = request;
+  return 0;
+}
+
+/* NB: may_set_error = false. */
+int
+nbd_unlocked_get_request_extended_headers (struct nbd_handle *h)
+{
+  return h->request_eh;
+}
+
+int
+nbd_unlocked_get_extended_headers_negotiated (struct nbd_handle *h)
+{
+  return h->extended_headers;
+}
+
 int
 nbd_unlocked_set_request_structured_replies (struct nbd_handle *h,
                                              bool request)
diff --git a/python/t/110-defaults.py b/python/t/110-defaults.py
index fb961cfd..ecd4dfda 100644
--- a/python/t/110-defaults.py
+++ b/python/t/110-defaults.py
@@ -1,5 +1,5 @@
 # libnbd Python bindings
-# Copyright (C) 2010-2020 Red Hat Inc.
+# Copyright (C) 2010-2021 Red Hat Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -21,6 +21,7 @@ h = nbd.NBD()
 assert h.get_export_name() == ""
 assert h.get_full_info() is False
 assert h.get_tls() == nbd.TLS_DISABLE
+assert h.get_request_extended_headers() is True
 assert h.get_request_structured_replies() is True
 assert h.get_handshake_flags() == nbd.HANDSHAKE_FLAG_MASK
 assert h.get_opt_mode() is False
diff --git a/python/t/120-set-non-defaults.py b/python/t/120-set-non-defaults.py
index 3da0c23e..b34fb508 100644
--- a/python/t/120-set-non-defaults.py
+++ b/python/t/120-set-non-defaults.py
@@ -1,5 +1,5 @@
 # libnbd Python bindings
-# Copyright (C) 2010-2020 Red Hat Inc.
+# Copyright (C) 2010-2021 Red Hat Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -31,6 +31,8 @@ assert h.get_tls() == nbd.TLS_DISABLE
 if h.supports_tls():
     h.set_tls(nbd.TLS_ALLOW)
     assert h.get_tls() == nbd.TLS_ALLOW
+h.set_request_extended_headers(False)
+assert h.get_request_extended_headers() is False
 h.set_request_structured_replies(False)
 assert h.get_request_structured_replies() is False
 try:
diff --git a/ocaml/tests/test_110_defaults.ml b/ocaml/tests/test_110_defaults.ml
index f5886fca..5fe448b6 100644
--- a/ocaml/tests/test_110_defaults.ml
+++ b/ocaml/tests/test_110_defaults.ml
@@ -1,6 +1,6 @@
 (* hey emacs, this is OCaml code: -*- tuareg -*- *)
 (* libnbd OCaml test case
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -25,6 +25,8 @@ let
   assert (info = false);
   let tls = NBD.get_tls nbd in
   assert (tls = NBD.TLS.DISABLE);
+  let eh = NBD.get_request_extended_headers nbd in
+  assert (eh = true);
   let sr = NBD.get_request_structured_replies nbd in
   assert (sr = true);
   let flags = NBD.get_handshake_flags nbd in
diff --git a/ocaml/tests/test_120_set_non_defaults.ml b/ocaml/tests/test_120_set_non_defaults.ml
index b660e5d5..47914d9c 100644
--- a/ocaml/tests/test_120_set_non_defaults.ml
+++ b/ocaml/tests/test_120_set_non_defaults.ml
@@ -1,6 +1,6 @@
 (* hey emacs, this is OCaml code: -*- tuareg -*- *)
 (* libnbd OCaml test case
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -37,6 +37,9 @@ let
     let tls = NBD.get_tls nbd in
     assert (tls = NBD.TLS.ALLOW);
   );
+  NBD.set_request_extended_headers nbd false;
+  let eh = NBD.get_request_extended_headers nbd in
+  assert (eh = false);
   NBD.set_request_structured_replies nbd false;
   let sr = NBD.get_request_structured_replies nbd in
   assert (sr = false);
diff --git a/golang/libnbd_110_defaults_test.go b/golang/libnbd_110_defaults_test.go
index b3ceb45d..659ea18c 100644
--- a/golang/libnbd_110_defaults_test.go
+++ b/golang/libnbd_110_defaults_test.go
@@ -51,6 +51,14 @@ func Test110Defaults(t *testing.T) {
 		t.Fatalf("unexpected tls state")
 	}

+	eh, err := h.GetRequestExtendedHeaders()
+	if err != nil {
+		t.Fatalf("could not get extended headers state: %s", err)
+	}
+	if eh != true {
+		t.Fatalf("unexpected extended headers state")
+	}
+
 	sr, err := h.GetRequestStructuredReplies()
 	if err != nil {
 		t.Fatalf("could not get structured replies state: %s", err)
diff --git a/golang/libnbd_120_set_non_defaults_test.go b/golang/libnbd_120_set_non_defaults_test.go
index f112456c..d27ec5dc 100644
--- a/golang/libnbd_120_set_non_defaults_test.go
+++ b/golang/libnbd_120_set_non_defaults_test.go
@@ -81,6 +81,18 @@ func Test120SetNonDefaults(t *testing.T) {
 		}
 	}

+	err = h.SetRequestExtendedHeaders(false)
+	if err != nil {
+		t.Fatalf("could not set extended headers state: %s", err)
+	}
+	eh, err := h.GetRequestExtendedHeaders()
+	if err != nil {
+		t.Fatalf("could not get extended headers state: %s", err)
+	}
+	if eh != false {
+		t.Fatalf("unexpected extended headers state")
+	}
+
 	err = h.SetRequestStructuredReplies(false)
 	if err != nil {
 		t.Fatalf("could not set structured replies state: %s", err)
-- 
2.33.1



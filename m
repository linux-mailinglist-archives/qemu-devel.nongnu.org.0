Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A60628DFA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:09:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidx-0001z3-Hi; Mon, 14 Nov 2022 18:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidn-0001X6-U1
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJI-00035l-MB
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wuXOMmcxaCQ0KVeHxANmBOlmlfS1/Yq3oJL5YkSZMs=;
 b=IG3yljzpQqOgwq7fqCbztGQ0WRg+p+IkjP8N/Wx15722rUozfOypmCfNEYFYsdgD80uO17
 zZkqP+acGWM5dcMhmUjz8tEmZ4i7M0FHP+g2Yey5vxtB3KhAdA313/dx3QWjjrjHnAe5Vx
 ogm0olehnoIg+F1FNJ24ioJlNWOwDmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-PQSktL5oN4-3cO2YzQB8Sg-1; Mon, 14 Nov 2022 17:52:08 -0500
X-MC-Unique: PQSktL5oN4-3cO2YzQB8Sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A6B1101A54E;
 Mon, 14 Nov 2022 22:52:08 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA37F40E9787;
 Mon, 14 Nov 2022 22:52:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 11/23] api: Add several functions for controlling
 extended headers
Date: Mon, 14 Nov 2022 16:51:46 -0600
Message-Id: <20221114225158.2186742-12-eblake@redhat.com>
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

The new NBD_OPT_EXTENDED_HEADERS feature is worth using by default,
but there may be cases where the user explicitly wants to stick with
the older 32-bit headers.  nbd_set_request_extended_headers() will let
the client override the default, nbd_get_request_extended_headers()
determines the current state of the request, and
nbd_get_extended_headers_negotiated() determines what the client and
server actually settled on.  These use
nbd_set_request_structured_replies() and friends as a template.

Note that this patch just adds the API for controlling the defaults,
but ignores the state variable; a later one will then tweak the state
machine to actually request structured headers when the state variable
is set, as well as add nbd_opt_extended_headers() for manual control.

The intent is that because extended headers takes priority over
structured replies, the functions will interact as follows during the
automatic handshaking that takes place prior to nbd_opt_set_mode()
relinquishing control to the client in negotiation mode:

1. client default: request_eh=1, request_sr=1
 => try EXTENDED_HEADERS
    - server supports it: nothing further to do, use extended headers,
      but also report structured replies as active
    - server lacks it: behave like case 2
2. request_eh=0 (explicit client downgrade), request_sr=1 (left at default)
 => try STRUCTURED_REPLY
    - server supports it: expect structured replies
    - server lacks it: expect simple replies
3. request_sr=0 (explicit client downgrade), request_eh ignored
 => don't try either handshake
    - expect simple replies

Client code that wants to manually force simple replies only has to
disable structured replies; and only code that wants to disable
extended headers but still use structured replies has to use the new
nbd_set_request_extended_headers() API.  Until a later patch adds an
explicit API nbd_opt_extended_headers(), there is no way to request
extended headers after structured replies are already negotiated.
---
 lib/internal.h                                |   1 +
 generator/API.ml                              | 115 ++++++++++++++++--
 generator/states-newstyle-opt-starttls.c      |   1 +
 .../states-newstyle-opt-structured-reply.c    |   3 +-
 lib/handle.c                                  |  23 ++++
 python/t/110-defaults.py                      |   1 +
 python/t/120-set-non-defaults.py              |   2 +
 ocaml/tests/test_110_defaults.ml              |   2 +
 ocaml/tests/test_120_set_non_defaults.ml      |   3 +
 golang/libnbd_110_defaults_test.go            |   8 ++
 golang/libnbd_120_set_non_defaults_test.go    |  12 ++
 11 files changed, 160 insertions(+), 11 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index b91fe6f6..1abb21cb 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -110,6 +110,7 @@ struct nbd_handle {
   char *tls_psk_file;           /* PSK filename, NULL = no PSK */

   /* Extended headers. */
+  bool request_eh;              /* Whether to request extended headers */
   bool extended_headers;        /* If we negotiated NBD_OPT_EXTENDED_HEADERS */

   /* Desired metadata contexts. */
diff --git a/generator/API.ml b/generator/API.ml
index aeee41fb..3d0289f6 100644
--- a/generator/API.ml
+++ b/generator/API.ml
@@ -808,6 +808,77 @@   "get_tls_psk_file", {
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
+request.
+
+For backwards compatibility, the setting of this knob is ignored
+if L<nbd_set_request_structured_replies(3)> is also set to false,
+since the use of extended headers implies structured replies.";
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
+using extended headers.
+
+When extended headers are not in use, commands are limited to a
+32-bit length, even when the libnbd API uses a 64-bit parameter
+to express the length.  But even when extended headers are
+supported, the server may enforce other limits, visible through
+L<nbd_get_block_size(3)>.
+
+Note that when extended headers are negotiated, you should
+prefer the use of L<nbd_block_status_64(3)> instead of
+L<nbd_block_status(3)> if any of the meta contexts you requested
+via L<nbd_add_meta_context(3)> might return 64-bit status
+values; however, all of the well-known meta contexts covered
+by current C<LIBNBD_CONTEXT_*> constants only return 32-bit
+status.";
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
@@ -821,12 +892,16 @@   "set_request_structured_replies", {
 rather than find a way to alter the server to fail the negotiation
 request.  It is also useful to set this to false prior to using
 L<nbd_set_opt_mode(3)> if it is desired to control when to send
-L<nbd_opt_structured_reply(3)> during negotiation.";
+L<nbd_opt_structured_reply(3)> during negotiation.
+
+Note that setting this knob to false also disables any automatic
+request for extended headers.";
     see_also = [Link "get_request_structured_replies";
                 Link "set_handshake_flags"; Link "set_strict_mode";
                 Link "opt_structured_reply";
                 Link "get_structured_replies_negotiated";
-                Link "can_meta_context"; Link "can_df"];
+                Link "can_meta_context"; Link "can_df";
+                Link "set_request_extended_headers"];
   };

   "get_request_structured_replies", {
@@ -842,7 +917,8 @@   "get_request_structured_replies", {
 negotiated on a particular connection use
 L<nbd_get_structured_replies_negotiated(3)> instead.";
     see_also = [Link "set_request_structured_replies";
-                Link "get_structured_replies_negotiated"];
+                Link "get_structured_replies_negotiated";
+                Link "get_request_extended_headers"];
   };

   "get_structured_replies_negotiated", {
@@ -854,11 +930,17 @@   "get_structured_replies_negotiated", {
 After connecting you may call this to find out if the connection is
 using structured replies.  Note that this setting is sticky; this
 can return true even after a second L<nbd_opt_structured_reply(3)>
-returns false because the server detected a duplicate request.";
+returns false because the server detected a duplicate request.
+
+Note that if the connection negotiates extended headers, this
+function returns true (as extended headers imply structured
+replies) even if no explicit request for structured replies was
+attempted.";
     see_also = [Link "set_request_structured_replies";
                 Link "get_request_structured_replies";
                 Link "opt_structured_reply";
-                Link "get_protocol"];
+                Link "get_protocol";
+                Link "get_extended_headers_negotiated"];
   };

   "set_request_meta_context", {
@@ -2575,7 +2657,9 @@   "trim", {
 or there is an error.  Note this will generally return an error
 if L<nbd_can_trim(3)> is false or L<nbd_is_read_only(3)> is true.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum trim size, although
 a future extension may add a constraint visible in
@@ -2606,7 +2690,9 @@   "cache", {
 this command.  Note this will generally return an error if
 L<nbd_can_cache(3)> is false.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum cache size, although
 a future extension may add a constraint visible in
@@ -2635,7 +2721,9 @@   "zero", {
 or there is an error.  Note this will generally return an error if
 L<nbd_can_zero(3)> is false or L<nbd_is_read_only(3)> is true.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum zero size, although
 a future extension may add a constraint visible in
@@ -2675,7 +2763,9 @@   "block_status", {
 are supported, the number of blocks and cumulative length
 of those blocks need not be identical between contexts.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum block status size,
 although a future extension may add a constraint visible in
@@ -2753,7 +2843,9 @@   "block_status_64", {
 are supported, the number of blocks and cumulative length
 of those blocks need not be identical between contexts.

-Note that not all servers can support a C<count> of 4GiB or larger.
+Note that not all servers can support a C<count> of 4GiB or larger;
+L<nbd_get_extended_headers_negotiated(3)> indicates which servers
+will parse a request larger than 32 bits.
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum block status size,
 although a future extension may add a constraint visible in
@@ -3972,6 +4064,9 @@ let first_version =
   "aio_opt_starttls", (1, 16);
   "block_status_64", (1, 16);
   "aio_block_status_64", (1, 16);
+  "set_request_extended_headers", (1, 16);
+  "get_request_extended_headers", (1, 16);
+  "get_extended_headers_negotiated", (1, 16);

   (* These calls are proposed for a future version of libnbd, but
    * have not been added to any released version so far.
diff --git a/generator/states-newstyle-opt-starttls.c b/generator/states-newstyle-opt-starttls.c
index 75fce085..6d528672 100644
--- a/generator/states-newstyle-opt-starttls.c
+++ b/generator/states-newstyle-opt-starttls.c
@@ -86,6 +86,7 @@  NEWSTYLE.OPT_STARTTLS.CHECK_REPLY:
     }
     nbd_internal_reset_size_and_flags (h);
     h->structured_replies = false;
+    h->extended_headers = false;
     h->meta_valid = false;
     new_sock = nbd_internal_crypto_create_session (h, h->sock);
     if (new_sock == NULL) {
diff --git a/generator/states-newstyle-opt-structured-reply.c b/generator/states-newstyle-opt-structured-reply.c
index 46b4161b..4608a38a 100644
--- a/generator/states-newstyle-opt-structured-reply.c
+++ b/generator/states-newstyle-opt-structured-reply.c
@@ -25,7 +25,7 @@  NEWSTYLE.OPT_STRUCTURED_REPLY.START:
     assert (h->opt_mode);
   else {
     assert (CALLBACK_IS_NULL (h->opt_cb.completion));
-    if (!h->request_sr) {
+    if (!h->request_sr || h->structured_replies) {
       if (h->opt_mode)
         SET_NEXT_STATE (%.NEGOTIATING);
       else
@@ -84,6 +84,7 @@  NEWSTYLE.OPT_STRUCTURED_REPLY.CHECK_REPLY:
     err = 0;
     break;
   case NBD_REP_ERR_INVALID:
+  case NBD_REP_ERR_EXT_HEADER_REQD:
     err = EINVAL;
     /* fallthrough */
   default:
diff --git a/lib/handle.c b/lib/handle.c
index 41e442e7..5cf7956e 100644
--- a/lib/handle.c
+++ b/lib/handle.c
@@ -63,6 +63,7 @@ nbd_create (void)

   h->unique = 1;
   h->tls_verify_peer = true;
+  h->request_eh = true;
   h->request_sr = true;
   h->request_meta = true;
   h->request_block_size = true;
@@ -384,6 +385,28 @@ nbd_unlocked_clear_meta_contexts (struct nbd_handle *h)
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
index 6b62c8a4..bada47de 100644
--- a/python/t/110-defaults.py
+++ b/python/t/110-defaults.py
@@ -21,6 +21,7 @@
 assert h.get_export_name() == ""
 assert h.get_full_info() is False
 assert h.get_tls() == nbd.TLS_DISABLE
+assert h.get_request_extended_headers() is True
 assert h.get_request_structured_replies() is True
 assert h.get_request_meta_context() is True
 assert h.get_request_block_size() is True
diff --git a/python/t/120-set-non-defaults.py b/python/t/120-set-non-defaults.py
index 8b48b4ad..2a7bd928 100644
--- a/python/t/120-set-non-defaults.py
+++ b/python/t/120-set-non-defaults.py
@@ -31,6 +31,8 @@
 if h.supports_tls():
     h.set_tls(nbd.TLS_ALLOW)
     assert h.get_tls() == nbd.TLS_ALLOW
+h.set_request_extended_headers(False)
+assert h.get_request_extended_headers() is False
 h.set_request_structured_replies(False)
 assert h.get_request_structured_replies() is False
 h.set_request_meta_context(False)
diff --git a/ocaml/tests/test_110_defaults.ml b/ocaml/tests/test_110_defaults.ml
index 768ad636..cc0b492e 100644
--- a/ocaml/tests/test_110_defaults.ml
+++ b/ocaml/tests/test_110_defaults.ml
@@ -26,6 +26,8 @@ let
       assert (not info);
       let tls = NBD.get_tls nbd in
       assert (tls = NBD.TLS.DISABLE);
+      let eh = NBD.get_request_extended_headers nbd in
+      assert (eh = true);
       let sr = NBD.get_request_structured_replies nbd in
       assert sr;
       let meta = NBD.get_request_meta_context nbd in
diff --git a/ocaml/tests/test_120_set_non_defaults.ml b/ocaml/tests/test_120_set_non_defaults.ml
index 76ff82fb..efb6817a 100644
--- a/ocaml/tests/test_120_set_non_defaults.ml
+++ b/ocaml/tests/test_120_set_non_defaults.ml
@@ -39,6 +39,9 @@ let
         let tls = NBD.get_tls nbd in
         assert (tls = NBD.TLS.ALLOW);
       );
+      NBD.set_request_extended_headers nbd false;
+      let eh = NBD.get_request_extended_headers nbd in
+      assert (eh = false);
       NBD.set_request_structured_replies nbd false;
       let sr = NBD.get_request_structured_replies nbd in
       assert (not sr);
diff --git a/golang/libnbd_110_defaults_test.go b/golang/libnbd_110_defaults_test.go
index d7ad319c..bba94df8 100644
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
index 06bb29d5..5b63bc7b 100644
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
2.38.1



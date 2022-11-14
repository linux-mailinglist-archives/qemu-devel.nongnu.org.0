Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D960628E16
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:14:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidx-0001zr-QF; Mon, 14 Nov 2022 18:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidm-0001X6-92
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJP-00036V-DK
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGGwQbuqD48ui6XJeENuPlPZt4N0uynde43JY+1oSfw=;
 b=CUCi04B0F7JWlMQW9LnQg8JcR3aL0DnT1OSGfqz9g4euWU5YTnUjfdoMUHXEplk7G2IuyG
 kg/vX72uKSu0Btjp26ee2JzsOl4LTEbGORW6RaoRQKOX2pTpy2zUwxSi/5U4NB85DUTgWy
 bITmfdf1T8oOtXb3p7ajU5e62Ot+Xxg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-5yyGsRK_Nq2mNK1KuWqcdg-1; Mon, 14 Nov 2022 17:52:12 -0500
X-MC-Unique: 5yyGsRK_Nq2mNK1KuWqcdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A1AD1C08972;
 Mon, 14 Nov 2022 22:52:12 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BADB340E9786;
 Mon, 14 Nov 2022 22:52:11 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 18/23] generator: Actually request extended headers
Date: Mon, 14 Nov 2022 16:51:53 -0600
Message-Id: <20221114225158.2186742-19-eblake@redhat.com>
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

This is the culmination of the previous patches' preparation work for
using extended headers when possible.  The new states in the state
machine are copied extensively from our handling of
OPT_STRUCTURED_REPLY.  The next patch will then expose a new API
nbd_opt_extended_headers() for manual control.

At the same time I posted this patch, I had patches for qemu-nbd to
support extended headers as server (nbdkit is a bit tougher).  The
next patches will add some interop tests that pass when using a new
enough qemu-nbd, showing that we have cross-project interoperability
and therefore an extension worth standardizing.
---
 generator/API.ml                              | 87 ++++++++---------
 generator/Makefile.am                         |  3 +-
 generator/state_machine.ml                    | 41 ++++++++
 .../states-newstyle-opt-extended-headers.c    | 94 +++++++++++++++++++
 generator/states-newstyle-opt-starttls.c      |  6 +-
 5 files changed, 185 insertions(+), 46 deletions(-)
 create mode 100644 generator/states-newstyle-opt-extended-headers.c

diff --git a/generator/API.ml b/generator/API.ml
index 3d0289f6..570f15f4 100644
--- a/generator/API.ml
+++ b/generator/API.ml
@@ -953,23 +953,24 @@   "set_request_meta_context", {
 (all C<nbd_connect_*> calls when L<nbd_set_opt_mode(3)> is false,
 or L<nbd_opt_go(3)> and L<nbd_opt_info(3)> when option mode is
 enabled) will also try to issue NBD_OPT_SET_META_CONTEXT when
-the server supports structured replies and any contexts were
-registered by L<nbd_add_meta_context(3)>.  The default setting
-is true; however the extra step of negotiating meta contexts is
-not always desirable: performing both info and go on the same
-export works without needing to re-negotiate contexts on the
-second call; integration testing of other servers may benefit
-from manual invocation of L<nbd_opt_set_meta_context(3)> at
-other times in the negotiation sequence; and even when using just
-L<nbd_opt_info(3)>, it can be faster to collect the server's
+the server supports structured replies or extended headers and
+any contexts were registered by L<nbd_add_meta_context(3)>.  The
+default setting is true; however the extra step of negotiating
+meta contexts is not always desirable: performing both info and
+go on the same export works without needing to re-negotiate
+contexts on the second call; integration testing of other servers
+may benefit from manual invocation of L<nbd_opt_set_meta_context(3)>
+at other times in the negotiation sequence; and even when using
+just L<nbd_opt_info(3)>, it can be faster to collect the server's
 results by relying on the callback function passed to
 L<nbd_opt_list_meta_context(3)> than a series of post-process
 calls to L<nbd_can_meta_context(3)>.

 Note that this control has no effect if the server does not
-negotiate structured replies, or if the client did not request
-any contexts via L<nbd_add_meta_context(3)>.  Setting this
-control to false may cause L<nbd_block_status(3)> to fail.";
+negotiate structured replies or extended headers, or if the
+client did not request any contexts via L<nbd_add_meta_context(3)>.
+Setting this control to false may cause L<nbd_block_status(3)>
+to fail.";
     see_also = [Link "set_opt_mode"; Link "opt_go"; Link "opt_info";
                 Link "opt_list_meta_context"; Link "opt_set_meta_context";
                 Link "get_structured_replies_negotiated";
@@ -1404,11 +1405,11 @@   "opt_info", {
 If successful, functions like L<nbd_is_read_only(3)> and
 L<nbd_get_size(3)> will report details about that export.  If
 L<nbd_set_request_meta_context(3)> is set (the default) and
-structured replies were negotiated, it is also valid to use
-L<nbd_can_meta_context(3)> after this call.  However, it may be
-more efficient to clear that setting and manually utilize
-L<nbd_opt_list_meta_context(3)> with its callback approach, for
-learning which contexts an export supports.  In general, if
+structured replies or extended headers were negotiated, it is also
+valid to use L<nbd_can_meta_context(3)> after this call.  However,
+it may be more efficient to clear that setting and manually
+utilize L<nbd_opt_list_meta_context(3)> with its callback approach,
+for learning which contexts an export supports.  In general, if
 L<nbd_opt_go(3)> is called next, that call will likely succeed
 with the details remaining the same, although this is not
 guaranteed by all servers.
@@ -1538,12 +1539,12 @@   "opt_set_meta_context", {
 recent L<nbd_set_export_name(3)> or L<nbd_connect_uri(3)>.
 This can only be used if L<nbd_set_opt_mode(3)> enabled option
 mode.  Normally, this function is redundant, as L<nbd_opt_go(3)>
-automatically does the same task if structured replies have
-already been negotiated.  But manual control over meta context
-requests can be useful for fine-grained testing of how a server
-handles unusual negotiation sequences.  Often, use of this
-function is coupled with L<nbd_set_request_meta_context(3)> to
-bypass the automatic context request normally performed by
+automatically does the same task if structured replies or extended
+headers have already been negotiated.  But manual control over
+meta context requests can be useful for fine-grained testing of
+how a server handles unusual negotiation sequences.  Often, use
+of this function is coupled with L<nbd_set_request_meta_context(3)>
+to bypass the automatic context request normally performed by
 L<nbd_opt_go(3)>.

 The NBD protocol allows a client to decide how many queries to ask
@@ -1597,12 +1598,13 @@   "opt_set_meta_context_queries", {
 or L<nbd_connect_uri(3)>.  This can only be used if
 L<nbd_set_opt_mode(3)> enabled option mode.  Normally, this
 function is redundant, as L<nbd_opt_go(3)> automatically does
-the same task if structured replies have already been
-negotiated.  But manual control over meta context requests can
-be useful for fine-grained testing of how a server handles
-unusual negotiation sequences.  Often, use of this function is
-coupled with L<nbd_set_request_meta_context(3)> to bypass the
-automatic context request normally performed by L<nbd_opt_go(3)>.
+the same task if structured replies or extended headers have
+already been negotiated.  But manual control over meta context
+requests can be useful for fine-grained testing of how a server
+handles unusual negotiation sequences.  Often, use of this
+function is coupled with L<nbd_set_request_meta_context(3)> to
+bypass the automatic context request normally performed by
+L<nbd_opt_go(3)>.

 The NBD protocol allows a client to decide how many queries to ask
 the server.  This function takes an explicit list of queries; to
@@ -3233,13 +3235,13 @@   "aio_opt_set_meta_context", {
 recent L<nbd_set_export_name(3)> or L<nbd_connect_uri(3)>.
 This can only be used if L<nbd_set_opt_mode(3)> enabled option
 mode.  Normally, this function is redundant, as L<nbd_opt_go(3)>
-automatically does the same task if structured replies have
-already been negotiated.  But manual control over meta context
-requests can be useful for fine-grained testing of how a server
-handles unusual negotiation sequences.  Often, use of this
-function is coupled with L<nbd_set_request_meta_context(3)> to
-bypass the automatic context request normally performed by
-L<nbd_opt_go(3)>.
+automatically does the same task if structured replies or
+extended headers have already been negotiated.  But manual
+control over meta context requests can be useful for fine-grained
+testing of how a server handles unusual negotiation sequences.
+Often, use of this function is coupled with
+L<nbd_set_request_meta_context(3)> to bypass the automatic
+context request normally performed by L<nbd_opt_go(3)>.

 To determine when the request completes, wait for
 L<nbd_aio_is_connecting(3)> to return false.  Or supply the optional
@@ -3266,12 +3268,13 @@   "aio_opt_set_meta_context_queries", {
 or L<nbd_connect_uri(3)>.  This can only be used
 if L<nbd_set_opt_mode(3)> enabled option mode.  Normally, this
 function is redundant, as L<nbd_opt_go(3)> automatically does
-the same task if structured replies have already been
-negotiated.  But manual control over meta context requests can
-be useful for fine-grained testing of how a server handles
-unusual negotiation sequences.  Often, use of this function is
-coupled with L<nbd_set_request_meta_context(3)> to bypass the
-automatic context request normally performed by L<nbd_opt_go(3)>.
+the same task if structured replies or extended headers have
+already been negotiated.  But manual control over meta context
+requests can be useful for fine-grained testing of how a server
+handles unusual negotiation sequences.  Often, use of this
+function is coupled with L<nbd_set_request_meta_context(3)> to
+bypass the automatic context request normally performed by
+L<nbd_opt_go(3)>.

 To determine when the request completes, wait for
 L<nbd_aio_is_connecting(3)> to return false.  Or supply the optional
diff --git a/generator/Makefile.am b/generator/Makefile.am
index 3193c733..09739449 100644
--- a/generator/Makefile.am
+++ b/generator/Makefile.am
@@ -1,5 +1,5 @@
 # nbd client library in userspace
-# Copyright (C) 2013-2020 Red Hat Inc.
+# Copyright (C) 2013-2022 Red Hat Inc.
 #
 # This library is free software; you can redistribute it and/or
 # modify it under the terms of the GNU Lesser General Public
@@ -30,6 +30,7 @@ states_code = \
 	states-issue-command.c \
 	states-magic.c \
 	states-newstyle-opt-export-name.c \
+	states-newstyle-opt-extended-headers.c \
 	states-newstyle-opt-list.c \
 	states-newstyle-opt-go.c \
 	states-newstyle-opt-meta-context.c \
diff --git a/generator/state_machine.ml b/generator/state_machine.ml
index d2c326f3..c9e38a5e 100644
--- a/generator/state_machine.ml
+++ b/generator/state_machine.ml
@@ -297,6 +297,7 @@ and
    * NEGOTIATING after OPT_STRUCTURED_REPLY or any failed OPT_GO.
    *)
   Group ("OPT_STARTTLS", newstyle_opt_starttls_state_machine);
+  Group ("OPT_EXTENDED_HEADERS", newstyle_opt_extended_headers_state_machine);
   Group ("OPT_STRUCTURED_REPLY", newstyle_opt_structured_reply_state_machine);
   Group ("OPT_META_CONTEXT", newstyle_opt_meta_context_state_machine);
   Group ("OPT_GO", newstyle_opt_go_state_machine);
@@ -441,6 +442,46 @@ and
   };
 ]

+(* Fixed newstyle NBD_OPT_EXTENDED_HEADERS option.
+ * Implementation: generator/states-newstyle-opt-extended-headers.c
+ *)
+and newstyle_opt_extended_headers_state_machine = [
+  State {
+    default_state with
+    name = "START";
+    comment = "Try to negotiate newstyle NBD_OPT_EXTENDED_HEADERS";
+    external_events = [];
+  };
+
+  State {
+    default_state with
+    name = "SEND";
+    comment = "Send newstyle NBD_OPT_EXTENDED_HEADERS negotiation request";
+    external_events = [ NotifyWrite, "" ];
+  };
+
+  State {
+    default_state with
+    name = "RECV_REPLY";
+    comment = "Receive newstyle NBD_OPT_EXTENDED_HEADERS option reply";
+    external_events = [ NotifyRead, "" ];
+  };
+
+  State {
+    default_state with
+    name = "RECV_REPLY_PAYLOAD";
+    comment = "Receive any newstyle NBD_OPT_EXTENDED_HEADERS reply payload";
+    external_events = [ NotifyRead, "" ];
+  };
+
+  State {
+    default_state with
+    name = "CHECK_REPLY";
+    comment = "Check newstyle NBD_OPT_EXTENDED_HEADERS option reply";
+    external_events = [];
+  };
+]
+
 (* Fixed newstyle NBD_OPT_STRUCTURED_REPLY option.
  * Implementation: generator/states-newstyle-opt-structured-reply.c
  *)
diff --git a/generator/states-newstyle-opt-extended-headers.c b/generator/states-newstyle-opt-extended-headers.c
new file mode 100644
index 00000000..151787bf
--- /dev/null
+++ b/generator/states-newstyle-opt-extended-headers.c
@@ -0,0 +1,94 @@
+/* nbd client library in userspace: state machine
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
+/* State machine for negotiating NBD_OPT_EXTENDED_HEADERS. */
+
+STATE_MACHINE {
+ NEWSTYLE.OPT_EXTENDED_HEADERS.START:
+  assert (h->gflags & LIBNBD_HANDSHAKE_FLAG_FIXED_NEWSTYLE);
+  assert (h->opt_current != NBD_OPT_EXTENDED_HEADERS);
+  assert (CALLBACK_IS_NULL (h->opt_cb.completion));
+  if (!h->request_eh || !h->request_sr) {
+    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+    return 0;
+  }
+
+  h->sbuf.option.version = htobe64 (NBD_NEW_VERSION);
+  h->sbuf.option.option = htobe32 (NBD_OPT_EXTENDED_HEADERS);
+  h->sbuf.option.optlen = htobe32 (0);
+  h->chunks_sent++;
+  h->wbuf = &h->sbuf;
+  h->wlen = sizeof h->sbuf.option;
+  SET_NEXT_STATE (%SEND);
+  return 0;
+
+ NEWSTYLE.OPT_EXTENDED_HEADERS.SEND:
+  switch (send_from_wbuf (h)) {
+  case -1: SET_NEXT_STATE (%.DEAD); return 0;
+  case 0:
+    h->rbuf = &h->sbuf;
+    h->rlen = sizeof h->sbuf.or.option_reply;
+    SET_NEXT_STATE (%RECV_REPLY);
+  }
+  return 0;
+
+ NEWSTYLE.OPT_EXTENDED_HEADERS.RECV_REPLY:
+  switch (recv_into_rbuf (h)) {
+  case -1: SET_NEXT_STATE (%.DEAD); return 0;
+  case 0:
+    if (prepare_for_reply_payload (h, NBD_OPT_EXTENDED_HEADERS) == -1) {
+      SET_NEXT_STATE (%.DEAD);
+      return 0;
+    }
+    SET_NEXT_STATE (%RECV_REPLY_PAYLOAD);
+  }
+  return 0;
+
+ NEWSTYLE.OPT_EXTENDED_HEADERS.RECV_REPLY_PAYLOAD:
+  switch (recv_into_rbuf (h)) {
+  case -1: SET_NEXT_STATE (%.DEAD); return 0;
+  case 0:  SET_NEXT_STATE (%CHECK_REPLY);
+  }
+  return 0;
+
+ NEWSTYLE.OPT_EXTENDED_HEADERS.CHECK_REPLY:
+  uint32_t reply;
+
+  reply = be32toh (h->sbuf.or.option_reply.reply);
+  switch (reply) {
+  case NBD_REP_ACK:
+    debug (h, "negotiated extended headers on this connection");
+    h->extended_headers = true;
+    /* Extended headers trump structured replies, so skip ahead. */
+    h->structured_replies = true;
+    break;
+  default:
+    if (handle_reply_error (h) == -1) {
+      SET_NEXT_STATE (%.DEAD);
+      return 0;
+    }
+
+    debug (h, "extended headers are not supported by this server");
+    break;
+  }
+
+  /* Next option. */
+  SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+  return 0;
+
+} /* END STATE MACHINE */
diff --git a/generator/states-newstyle-opt-starttls.c b/generator/states-newstyle-opt-starttls.c
index 6d528672..3b509841 100644
--- a/generator/states-newstyle-opt-starttls.c
+++ b/generator/states-newstyle-opt-starttls.c
@@ -26,7 +26,7 @@  NEWSTYLE.OPT_STARTTLS.START:
   else {
     /* If TLS was not requested we skip this option and go to the next one. */
     if (h->tls == LIBNBD_TLS_DISABLE) {
-      SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+      SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
       return 0;
     }
     assert (CALLBACK_IS_NULL (h->opt_cb.completion));
@@ -128,7 +128,7 @@  NEWSTYLE.OPT_STARTTLS.CHECK_REPLY:
       SET_NEXT_STATE (%.NEGOTIATING);
     else {
       debug (h, "continuing with unencrypted connection");
-      SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+      SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
     }
     return 0;
   }
@@ -185,7 +185,7 @@  NEWSTYLE.OPT_STARTTLS.TLS_HANDSHAKE_DONE:
   if (h->opt_current == NBD_OPT_STARTTLS)
     SET_NEXT_STATE (%.NEGOTIATING);
   else
-    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+    SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
   return 0;

 } /* END STATE MACHINE */
-- 
2.38.1



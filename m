Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B97C4680E4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:48:44 +0100 (CET)
Received: from localhost ([::1]:49300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtIIF-0000yQ-Az
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:48:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoj-0002fw-19
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoh-0003N3-5n
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAikDzknh6GnT56mGmeoqGqtkzuR+VqfuYgmhIc0hOM=;
 b=c9YjPmhx66yN/cnpLpOHbSiElWwLqsgz0wqoSGNMDaDQP49Qjtu02FOWi5d0d1y7sthDni
 bnHoCIlfEz1JwH46r1t5nqhjpCoFuEbT+MZgrPUpGKpuf8hCx67ttPxTbWKtTHl8cN0w9H
 ukubsqYVYiFFtKmSVqMr8a7hYJdx0pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-D6TiK4ddNQS-Hu3dl-jcUA-1; Fri, 03 Dec 2021 18:18:07 -0500
X-MC-Unique: D6TiK4ddNQS-Hu3dl-jcUA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B79E104ECE7;
 Fri,  3 Dec 2021 23:18:06 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88A235DF2B;
 Fri,  3 Dec 2021 23:18:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Subject: [libnbd PATCH 12/13] generator: Actually request extended headers
Date: Fri,  3 Dec 2021 17:17:40 -0600
Message-Id: <20211203231741.3901263-13-eblake@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This is the culmination of the previous patches preparation work for
using extended headers when possible.  The new states in the state
machine are copied extensively from our handling of
OPT_STRUCTURED_REPLY.

At the same time I posted this patch, I had patches for qemu-nbd to
support extended headers as server (nbdkit is a bit tougher).  The
interop tests still pass when using a new enough qemu-nbd, showing
that we have cross-project interoperability and therefore an extension
worth standardizing.
---
 generator/Makefile.am                         |  3 +-
 generator/state_machine.ml                    | 41 +++++++++
 .../states-newstyle-opt-extended-headers.c    | 90 +++++++++++++++++++
 generator/states-newstyle-opt-starttls.c      | 10 +--
 4 files changed, 138 insertions(+), 6 deletions(-)
 create mode 100644 generator/states-newstyle-opt-extended-headers.c

diff --git a/generator/Makefile.am b/generator/Makefile.am
index 594d23cf..c889eb7f 100644
--- a/generator/Makefile.am
+++ b/generator/Makefile.am
@@ -1,5 +1,5 @@
 # nbd client library in userspace
-# Copyright (C) 2013-2020 Red Hat Inc.
+# Copyright (C) 2013-2021 Red Hat Inc.
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
index 99652948..ad8eba5e 100644
--- a/generator/state_machine.ml
+++ b/generator/state_machine.ml
@@ -295,6 +295,7 @@ and
    * NEGOTIATING after OPT_STRUCTURED_REPLY or any failed OPT_GO.
    *)
   Group ("OPT_STARTTLS", newstyle_opt_starttls_state_machine);
+  Group ("OPT_EXTENDED_HEADERS", newstyle_opt_extended_headers_state_machine);
   Group ("OPT_STRUCTURED_REPLY", newstyle_opt_structured_reply_state_machine);
   Group ("OPT_META_CONTEXT", newstyle_opt_meta_context_state_machine);
   Group ("OPT_GO", newstyle_opt_go_state_machine);
@@ -432,6 +433,46 @@ and
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
index 00000000..e2c9890e
--- /dev/null
+++ b/generator/states-newstyle-opt-extended-headers.c
@@ -0,0 +1,90 @@
+/* nbd client library in userspace: state machine
+ * Copyright (C) 2013-2021 Red Hat Inc.
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
+  if (!h->request_eh) {
+    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+    return 0;
+  }
+
+  h->sbuf.option.version = htobe64 (NBD_NEW_VERSION);
+  h->sbuf.option.option = htobe32 (NBD_OPT_EXTENDED_HEADERS);
+  h->sbuf.option.optlen = htobe32 (0);
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
+    break;
+  default:
+    if (handle_reply_error (h) == -1) {
+      SET_NEXT_STATE (%.DEAD);
+      return 0;
+    }
+
+    debug (h, "extended headers are not supported by this server");
+    h->extended_headers = false;
+    break;
+  }
+
+  /* Next option. */
+  SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+  return 0;
+
+} /* END STATE MACHINE */
diff --git a/generator/states-newstyle-opt-starttls.c b/generator/states-newstyle-opt-starttls.c
index 9eab023b..2aec3f3d 100644
--- a/generator/states-newstyle-opt-starttls.c
+++ b/generator/states-newstyle-opt-starttls.c
@@ -1,5 +1,5 @@
 /* nbd client library in userspace: state machine
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -23,7 +23,7 @@ STATE_MACHINE {
   assert (h->gflags & LIBNBD_HANDSHAKE_FLAG_FIXED_NEWSTYLE);
   /* If TLS was not requested we skip this option and go to the next one. */
   if (h->tls == LIBNBD_TLS_DISABLE) {
-    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+    SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
     return 0;
   }

@@ -102,7 +102,7 @@ STATE_MACHINE {
     debug (h,
            "server refused TLS (%s), continuing with unencrypted connection",
            reply == NBD_REP_ERR_POLICY ? "policy" : "not supported");
-    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+    SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
     return 0;
   }
   return 0;
@@ -121,7 +121,7 @@ STATE_MACHINE {
     nbd_internal_crypto_debug_tls_enabled (h);

     /* Continue with option negotiation. */
-    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+    SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
     return 0;
   }
   /* Continue handshake. */
@@ -144,7 +144,7 @@ STATE_MACHINE {
     debug (h, "connection is using TLS");

     /* Continue with option negotiation. */
-    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+    SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
     return 0;
   }
   /* Continue handshake. */
-- 
2.33.1



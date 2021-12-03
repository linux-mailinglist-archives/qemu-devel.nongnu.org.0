Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12004680C5
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:42:14 +0100 (CET)
Received: from localhost ([::1]:38288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtIBw-0001lM-J9
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:42:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoa-0002IX-HJ
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoX-0003Jc-Gu
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=68wLFDmhwgI93GM09cg1fWteej9OMa60cYVzyX0BSaI=;
 b=Ur881y4bIbBTrbxAmoVr8n+jXn/YYYabVj3kZQjY/rBMtbWmkB/UQLqxJaR+lrqsu6izEf
 qArPQZhPDG0Z7XhJoos6qftCoBEaO8gADHJzgWtBnvAgFupP3vita6yT4ndwcXCujzKTR/
 iWoi3u6gwWBPVZ/sZXjrUOs7h0Z6/8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-wf9M9K8FNV6NjBdTz1VFkw-1; Fri, 03 Dec 2021 18:17:58 -0500
X-MC-Unique: wf9M9K8FNV6NjBdTz1VFkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA0DA801B26;
 Fri,  3 Dec 2021 23:17:56 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E932EADD5;
 Fri,  3 Dec 2021 23:17:55 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Subject: [libnbd PATCH 04/13] protocol: Prepare to send 64-bit requests
Date: Fri,  3 Dec 2021 17:17:32 -0600
Message-Id: <20211203231741.3901263-5-eblake@redhat.com>
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

Support sending 64-bit requests if extended headers were negotiated.

At this point, h->extended_headers is permanently false (we can't
enable it until all other aspects of the protocol have likewise been
converted).
---
 lib/internal.h                      | 12 ++++++++---
 generator/states-issue-command.c    | 31 +++++++++++++++++++----------
 generator/states-reply-structured.c |  2 +-
 lib/rw.c                            | 10 ++++------
 4 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 7e96e8e9..07378588 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -1,5 +1,5 @@
 /* nbd client library in userspace: internal definitions
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -106,6 +106,9 @@ struct nbd_handle {
   char *tls_username;           /* Username, NULL = use current username */
   char *tls_psk_file;           /* PSK filename, NULL = no PSK */

+  /* Extended headers. */
+  bool extended_headers;        /* If we negotiated NBD_OPT_EXTENDED_HEADERS */
+
   /* Desired metadata contexts. */
   bool request_sr;
   string_vector request_meta_contexts;
@@ -242,7 +245,10 @@ struct nbd_handle {
   /* Issuing a command must use a buffer separate from sbuf, for the
    * case when we interrupt a request to service a reply.
    */
-  struct nbd_request request;
+  union {
+    struct nbd_request request;
+    struct nbd_request_ext request_ext;
+  } req;
   bool in_write_payload;
   bool in_write_shutdown;

@@ -347,7 +353,7 @@ struct command {
   uint16_t type;
   uint64_t cookie;
   uint64_t offset;
-  uint32_t count;
+  uint64_t count;
   void *data; /* Buffer for read/write */
   struct command_cb cb;
   enum state state; /* State to resume with on next POLLIN */
diff --git a/generator/states-issue-command.c b/generator/states-issue-command.c
index a8101144..7b1d6dc7 100644
--- a/generator/states-issue-command.c
+++ b/generator/states-issue-command.c
@@ -1,5 +1,5 @@
 /* nbd client library in userspace: state machine
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -41,14 +41,23 @@ STATE_MACHINE {
     return 0;
   }

-  h->request.magic = htobe32 (NBD_REQUEST_MAGIC);
-  h->request.flags = htobe16 (cmd->flags);
-  h->request.type = htobe16 (cmd->type);
-  h->request.handle = htobe64 (cmd->cookie);
-  h->request.offset = htobe64 (cmd->offset);
-  h->request.count = htobe32 ((uint32_t) cmd->count);
-  h->wbuf = &h->request;
-  h->wlen = sizeof (h->request);
+  /* These fields are coincident between req.request and req.request_ext */
+  h->req.request.flags = htobe16 (cmd->flags);
+  h->req.request.type = htobe16 (cmd->type);
+  h->req.request.handle = htobe64 (cmd->cookie);
+  h->req.request.offset = htobe64 (cmd->offset);
+  if (h->extended_headers) {
+    h->req.request_ext.magic = htobe32 (NBD_REQUEST_EXT_MAGIC);
+    h->req.request_ext.count = htobe64 (cmd->count);
+    h->wlen = sizeof (h->req.request_ext);
+  }
+  else {
+    assert (cmd->count <= UINT32_MAX);
+    h->req.request.magic = htobe32 (NBD_REQUEST_MAGIC);
+    h->req.request.count = htobe32 (cmd->count);
+    h->wlen = sizeof (h->req.request);
+  }
+  h->wbuf = &h->req;
   if (cmd->type == NBD_CMD_WRITE || cmd->next)
     h->wflags = MSG_MORE;
   SET_NEXT_STATE (%SEND_REQUEST);
@@ -73,7 +82,7 @@ STATE_MACHINE {

   assert (h->cmds_to_issue != NULL);
   cmd = h->cmds_to_issue;
-  assert (cmd->cookie == be64toh (h->request.handle));
+  assert (cmd->cookie == be64toh (h->req.request.handle));
   if (cmd->type == NBD_CMD_WRITE) {
     h->wbuf = cmd->data;
     h->wlen = cmd->count;
@@ -119,7 +128,7 @@ STATE_MACHINE {
   assert (!h->wlen);
   assert (h->cmds_to_issue != NULL);
   cmd = h->cmds_to_issue;
-  assert (cmd->cookie == be64toh (h->request.handle));
+  assert (cmd->cookie == be64toh (h->req.request.handle));
   h->cmds_to_issue = cmd->next;
   if (h->cmds_to_issue_tail == cmd)
     h->cmds_to_issue_tail = NULL;
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index e1da850d..5524e000 100644
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
index 4ade7508..16c2e848 100644
--- a/lib/rw.c
+++ b/lib/rw.c
@@ -1,5 +1,5 @@
 /* NBD client library in userspace
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -216,13 +216,11 @@ nbd_internal_command_common (struct nbd_handle *h,
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
-- 
2.33.1



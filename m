Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DFE4680A8
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:36:29 +0100 (CET)
Received: from localhost ([::1]:51792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtI6O-0000DF-S5
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:36:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoX-00024w-3t
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoV-0003Ij-6S
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6Ss8C/z+8OhC9UA+VztzBTG49YIh39ZEWpj+Occ1Io=;
 b=VUkxwx2T9vs1eT865ToQ2vwOOmLsFdwQE3bp9fTyT0S9HA3KDJhxkKPXsu9b3LZKKjI5pa
 B2NHOqseeWbwbwXdl73F6x7Np30kTtquz28wK83+hUV4JdxfZiA+tqFQS36IqXL7/zic85
 66vyqdYYVIYA8WdkdHEVHST/q1fjsZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-Uj-sTSyRPUORH2-YXorxKA-1; Fri, 03 Dec 2021 18:17:55 -0500
X-MC-Unique: Uj-sTSyRPUORH2-YXorxKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CCED8042E2;
 Fri,  3 Dec 2021 23:17:54 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 989725DF2B;
 Fri,  3 Dec 2021 23:17:53 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Subject: [libnbd PATCH 02/13] block_status: Refactor array storage
Date: Fri,  3 Dec 2021 17:17:30 -0600
Message-Id: <20211203231741.3901263-3-eblake@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For 32-bit block status, we were able to cheat and use an array with
an odd number of elements, with array[0] holding the context id, and
passing &array[1] to the user's callback.  But once we have 64-bit
extents, we can no longer abuse array element 0 like that.  Split out
a new state to receive the context id separately from the extents
array.  No behavioral change, other than the rare possibility of
landing in the new state.
---
 lib/internal.h                      |  1 +
 generator/state_machine.ml          | 11 +++++-
 generator/states-reply-structured.c | 58 ++++++++++++++++++++---------
 3 files changed, 51 insertions(+), 19 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 0e205aba..7e96e8e9 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -274,6 +274,7 @@ struct nbd_handle {
   size_t querynum;

   /* When receiving block status, this is used. */
+  uint32_t bs_contextid;
   uint32_t *bs_entries;

   /* Commands which are waiting to be issued [meaning the request
diff --git a/generator/state_machine.ml b/generator/state_machine.ml
index 3bc77f24..99652948 100644
--- a/generator/state_machine.ml
+++ b/generator/state_machine.ml
@@ -1,6 +1,6 @@
 (* hey emacs, this is OCaml code: -*- tuareg -*- *)
 (* nbd client library in userspace: state machine definition
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -862,10 +862,17 @@ and
     external_events = [];
   };

+  State {
+    default_state with
+    name = "RECV_BS_CONTEXTID";
+    comment = "Receive contextid of structured reply block-status payload";
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
index 70010474..e1da850d 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -1,5 +1,5 @@
 /* nbd client library in userspace: state machine
- * Copyright (C) 2013-2019 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -185,19 +185,10 @@ STATE_MACHINE {
       set_error (0, "not expecting NBD_REPLY_TYPE_BLOCK_STATUS here");
       return 0;
     }
-    /* We read the context ID followed by all the entries into a
-     * single array and deal with it at the end.
-     */
-    free (h->bs_entries);
-    h->bs_entries = malloc (length);
-    if (h->bs_entries == NULL) {
-      SET_NEXT_STATE (%.DEAD);
-      set_error (errno, "malloc");
-      return 0;
-    }
-    h->rbuf = h->bs_entries;
-    h->rlen = length;
-    SET_NEXT_STATE (%RECV_BS_ENTRIES);
+    /* Start by reading the context ID. */
+    h->rbuf = &h->bs_contextid;
+    h->rlen = sizeof h->bs_contextid;
+    SET_NEXT_STATE (%RECV_BS_CONTEXTID);
     return 0;
   }
   else {
@@ -452,9 +443,41 @@ STATE_MACHINE {
   }
   return 0;

+ REPLY.STRUCTURED_REPLY.RECV_BS_CONTEXTID:
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
+    length -= sizeof h->bs_contextid;
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
   struct meta_context *meta_context;
@@ -473,15 +496,16 @@ STATE_MACHINE {
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
     assert (h->bs_entries);
     assert (length >= 12);
+    count = (length - sizeof h->bs_contextid) / sizeof *h->bs_entries;

     /* Need to byte-swap the entries returned, but apart from that we
      * don't validate them.
      */
-    for (i = 0; i < length/4; ++i)
+    for (i = 0; i < count; ++i)
       h->bs_entries[i] = be32toh (h->bs_entries[i]);

     /* Look up the context ID. */
-    context_id = h->bs_entries[0];
+    context_id = be32toh (h->bs_contextid);
     for (meta_context = h->meta_contexts;
          meta_context;
          meta_context = meta_context->next)
@@ -494,7 +518,7 @@ STATE_MACHINE {

       if (CALL_CALLBACK (cmd->cb.fn.extent,
                          meta_context->name, cmd->offset,
-                         &h->bs_entries[1], (length-4) / 4,
+                         h->bs_entries, count,
                          &error) == -1)
         if (cmd->error == 0)
           cmd->error = error ? error : EPROTO;
-- 
2.33.1



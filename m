Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52661628D49
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:19:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidn-0001ji-Ts; Mon, 14 Nov 2022 18:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidl-0001eb-0S
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJR-00038O-JG
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UZ3+3XiNyWGBAYAGfP+9zc44+qr/0xwK7n95Q82oNs=;
 b=ASCOpRNSwWI6+SRzzlQ/2YymNHbFQXELcKtBOG9Cu5M2LNEeBGstUJzYukWYaiYrbA3fZi
 s4gtQgOC12Q7n6+ziS/gDUN+X8g2p+EaFjjD5LnmRxVvEg3ZAXp7bwIlHHAi0XbN+UkvQH
 XtdZcMhMaJImwpUV8BqgdqAVWoPIm0Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-4q8RnqxQMPGUta7j2eXmuw-1; Mon, 14 Nov 2022 17:52:15 -0500
X-MC-Unique: 4q8RnqxQMPGUta7j2eXmuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CED82101E14C;
 Mon, 14 Nov 2022 22:52:08 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CA3440E9786;
 Mon, 14 Nov 2022 22:52:08 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 12/23] copy: Update nbdcopy to use 64-bit block
 status
Date: Mon, 14 Nov 2022 16:51:47 -0600
Message-Id: <20221114225158.2186742-13-eblake@redhat.com>
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

Although our use of "base:allocation" doesn't require the use of the
64-bit API for flags, we might perform slightly faster for a server
that does give us 64-bit extent lengths and honors larger nbd_zero
lengths.
---
 copy/nbd-ops.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/copy/nbd-ops.c b/copy/nbd-ops.c
index 34ab4857..dad78ea9 100644
--- a/copy/nbd-ops.c
+++ b/copy/nbd-ops.c
@@ -428,7 +428,7 @@ nbd_ops_asynch_notify_write (struct rw *rw, size_t index)
  * request for extents in a single round trip.
  */
 static int add_extent (void *vp, const char *metacontext,
-                       uint64_t offset, uint32_t *entries, size_t nr_entries,
+                       uint64_t offset, nbd_extent *entries, size_t nr_entries,
                        int *error);

 static void
@@ -449,11 +449,11 @@ nbd_ops_get_extents (struct rw *rw, size_t index,
     size_t i;

     exts.len = 0;
-    if (nbd_block_status (nbd, count, offset,
-                          (nbd_extent_callback) {
-                            .user_data = &exts,
-                            .callback = add_extent
-                          }, 0) == -1) {
+    if (nbd_block_status_64 (nbd, count, offset,
+                             (nbd_extent64_callback) {
+                               .user_data = &exts,
+                               .callback = add_extent
+                             }, 0) == -1) {
       /* XXX We could call default_get_extents, but unclear if it's
        * the right thing to do if the server is returning errors.
        */
@@ -493,7 +493,7 @@ nbd_ops_get_extents (struct rw *rw, size_t index,

 static int
 add_extent (void *vp, const char *metacontext,
-            uint64_t offset, uint32_t *entries, size_t nr_entries,
+            uint64_t offset, nbd_extent *entries, size_t nr_entries,
             int *error)
 {
   extent_list *ret = vp;
@@ -502,25 +502,25 @@ add_extent (void *vp, const char *metacontext,
   if (strcmp (metacontext, "base:allocation") != 0 || *error)
     return 0;

-  for (i = 0; i < nr_entries; i += 2) {
+  for (i = 0; i < nr_entries; i++) {
     struct extent e;

     e.offset = offset;
-    e.length = entries[i];
+    e.length = entries[i].length;

     /* Note we deliberately don't care about the HOLE flag.  There is
      * no need to read extent that reads as zeroes.  We will convert
      * to it to a hole or allocated extents based on the command line
      * arguments.
      */
-    e.zero = (entries[i+1] & LIBNBD_STATE_ZERO) != 0;
+    e.zero = (entries[i].flags & LIBNBD_STATE_ZERO) != 0;

     if (extent_list_append (ret, e) == -1) {
       perror ("realloc");
       exit (EXIT_FAILURE);
     }

-    offset += entries[i];
+    offset += entries[i].length;
   }

   return 0;
-- 
2.38.1



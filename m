Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C68628D63
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:25:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidw-0001vj-74; Mon, 14 Nov 2022 18:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidn-0001df-Ug
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJH-00035d-Uz
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kFZ7Yv3HNPzLl2w5aNu6KklNLzOrQIqVYaO4PqAHyk=;
 b=aQELNAqPbdgiF9H6uTOvhcrrVxqjlsRDYl4r3/dBOOD+JepKxOm1DSISi4uUkwn/tv1jb4
 qNIl4yCXbbvM8Kj0nlOd16jz556xu4sHspFzEIHamOQrSjo2zefeB5UeuMVITtPOsGolZF
 nnyeGmX2TGnmr43mbYu8lCUNBU6lu3w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-SYJVdRt5NNWZYYQuCjmh_Q-1; Mon, 14 Nov 2022 17:52:09 -0500
X-MC-Unique: SYJVdRt5NNWZYYQuCjmh_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6164A2A5955B;
 Mon, 14 Nov 2022 22:52:09 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F29C340E9786;
 Mon, 14 Nov 2022 22:52:08 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 13/23] dump: Update nbddump to use 64-bit block
 status
Date: Mon, 14 Nov 2022 16:51:48 -0600
Message-Id: <20221114225158.2186742-14-eblake@redhat.com>
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

Although our use of "base:allocation" doesn't require the use of the
64-bit API for flags, we might perform slightly faster for a server
that does give us 64-bit extent lengths.
---
 dump/dump.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index bdbc9040..0427ab86 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -38,7 +38,7 @@
 #include "version.h"
 #include "vector.h"

-DEFINE_VECTOR_TYPE (uint32_vector, uint32_t)
+DEFINE_VECTOR_TYPE (uint64_vector, uint64_t)

 static const char *progname;
 static struct nbd_handle *nbd;
@@ -262,10 +262,10 @@ catch_signal (int sig)
 static int
 extent_callback (void *user_data, const char *metacontext,
                  uint64_t offset,
-                 uint32_t *entries, size_t nr_entries,
+                 nbd_extent *entries, size_t nr_entries,
                  int *error)
 {
-  uint32_vector *list = user_data;
+  uint64_vector *list = user_data;
   size_t i;

   if (strcmp (metacontext, LIBNBD_CONTEXT_BASE_ALLOCATION) != 0)
@@ -273,7 +273,8 @@ extent_callback (void *user_data, const char *metacontext,

   /* Just append the entries we got to the list. */
   for (i = 0; i < nr_entries; ++i) {
-    if (uint32_vector_append (list, entries[i]) == -1) {
+    if (uint64_vector_append (list, entries[i].length) == -1 ||
+        uint64_vector_append (list, entries[i].flags) == -1) {
       perror ("realloc");
       exit (EXIT_FAILURE);
     }
@@ -284,7 +285,7 @@ extent_callback (void *user_data, const char *metacontext,
 static bool
 test_all_zeroes (uint64_t offset, size_t count)
 {
-  uint32_vector entries = empty_vector;
+  uint64_vector entries = empty_vector;
   size_t i;
   uint64_t count_read;

@@ -296,22 +297,22 @@ test_all_zeroes (uint64_t offset, size_t count)
    * false, causing the main code to do a full read.  We could be
    * smarter and keep asking the server (XXX).
    */
-  if (nbd_block_status (nbd, count, offset,
-                        (nbd_extent_callback) {
-                          .callback = extent_callback,
-                          .user_data = &entries },
-                        0) == -1) {
+  if (nbd_block_status_64 (nbd, count, offset,
+                           (nbd_extent64_callback) {
+                             .callback = extent_callback,
+                             .user_data = &entries },
+                           0) == -1) {
     fprintf (stderr, "%s: %s\n", progname, nbd_get_error ());
     exit (EXIT_FAILURE);
   }

   count_read = 0;
   for (i = 0; i < entries.len; i += 2) {
-    uint32_t len = entries.ptr[i];
-    uint32_t type = entries.ptr[i+1];
+    uint64_t len = entries.ptr[i];
+    uint64_t type = entries.ptr[i+1];

     count_read += len;
-    if (!(type & 2))            /* not zero */
+    if (!(type & LIBNBD_STATE_ZERO))            /* not zero */
       return false;
   }

-- 
2.38.1



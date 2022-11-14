Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A71E628DB7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:46:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidn-0001jg-Tj; Mon, 14 Nov 2022 18:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidk-0001eb-Ms
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJS-00038u-Nr
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2cD56WaAJ/IvhRPrOPQ2JyhwwZRuIKdCJRpznOMdqs=;
 b=FZlsDZrGm9yJisr0X18TOHW4Fy261oaQqRvAnvd3wgZm0hBS97Mj47afeD4WojLff9//MK
 0maeYVIkv4R96BrQN6za2Z2DPUuPn2dARAZ4p5NnVcVahrqDsZSz5ITPHwywqUx+M1DWVa
 YOMmbqp9ZVMjUq/xRleWesGdB1GozQc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-pPoxq3Q7M4KEOuKG6EuL0w-1; Mon, 14 Nov 2022 17:52:10 -0500
X-MC-Unique: pPoxq3Q7M4KEOuKG6EuL0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E0CD101E148;
 Mon, 14 Nov 2022 22:52:10 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A2CA40E9786;
 Mon, 14 Nov 2022 22:52:10 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 15/23] info: Update nbdinfo --map to use 64-bit
 block status
Date: Mon, 14 Nov 2022 16:51:50 -0600
Message-Id: <20221114225158.2186742-16-eblake@redhat.com>
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

Although we usually map "base:allocation" which doesn't require the
use of the 64-bit API for flags, this application IS intended to map
out other metacontexts that might have 64-bit flags.  And when
extended headers are in use, we might as well ask for the server to
give us extents as large as it wants, rather than breaking things up
at 4G boundaries.
---
 info/map.c | 67 ++++++++++++++++++++++++++++--------------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/info/map.c b/info/map.c
index a5aad955..ffa53b81 100644
--- a/info/map.c
+++ b/info/map.c
@@ -1,5 +1,5 @@
 /* NBD client library in userspace
- * Copyright (C) 2020-2021 Red Hat Inc.
+ * Copyright (C) 2020-2022 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -36,13 +36,13 @@

 #include "nbdinfo.h"

-DEFINE_VECTOR_TYPE (uint32_vector, uint32_t)
+DEFINE_VECTOR_TYPE (uint64_vector, uint64_t)

-static void print_extents (uint32_vector *entries);
-static void print_totals (uint32_vector *entries, int64_t size);
+static void print_extents (uint64_vector *entries);
+static void print_totals (uint64_vector *entries, int64_t size);
 static int extent_callback (void *user_data, const char *metacontext,
                             uint64_t offset,
-                            uint32_t *entries, size_t nr_entries,
+                            nbd_extent *entries, size_t nr_entries,
                             int *error);

 void
@@ -50,7 +50,7 @@ do_map (void)
 {
   size_t i;
   int64_t size;
-  uint32_vector entries = empty_vector;
+  uint64_vector entries = empty_vector;
   uint64_t offset, align, max_len;
   size_t prev_entries_size;

@@ -69,14 +69,16 @@ do_map (void)
     fprintf (stderr, "%s: %s\n", progname, nbd_get_error ());
     exit (EXIT_FAILURE);
   }
+  if (nbd_get_extended_headers_negotiated (nbd) == 1)
+    max_len = size;

   for (offset = 0; offset < size;) {
     prev_entries_size = entries.len;
-    if (nbd_block_status (nbd, MIN (size - offset, max_len), offset,
-                          (nbd_extent_callback) {
-                            .callback = extent_callback,
-                            .user_data = &entries },
-                          0) == -1) {
+    if (nbd_block_status_64 (nbd, MIN (size - offset, max_len), offset,
+                             (nbd_extent64_callback) {
+                               .callback = extent_callback,
+                               .user_data = &entries },
+                             0) == -1) {
       fprintf (stderr, "%s: %s\n", progname, nbd_get_error ());
       exit (EXIT_FAILURE);
     }
@@ -99,18 +101,18 @@ do_map (void)
 }

 /* Callback handling --map. */
-static void print_one_extent (uint64_t offset, uint64_t len, uint32_t type);
-static void extent_description (const char *metacontext, uint32_t type,
+static void print_one_extent (uint64_t offset, uint64_t len, uint64_t type);
+static void extent_description (const char *metacontext, uint64_t type,
                                 char **descr, bool *free_descr,
                                 const char **fg, const char **bg);

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

   if (strcmp (metacontext, map) != 0)
@@ -120,7 +122,8 @@ extent_callback (void *user_data, const char *metacontext,
    * print_extents below.
    */
   for (i = 0; i < nr_entries; ++i) {
-    if (uint32_vector_append (list, entries[i]) == -1) {
+    if (uint64_vector_append (list, entries[i].length) == -1 ||
+        uint64_vector_append (list, entries[i].flags) == -1) {
       perror ("realloc");
       exit (EXIT_FAILURE);
     }
@@ -129,7 +132,7 @@ extent_callback (void *user_data, const char *metacontext,
 }

 static void
-print_extents (uint32_vector *entries)
+print_extents (uint64_vector *entries)
 {
   size_t i, j;
   uint64_t offset = 0;          /* end of last extent printed + 1 */
@@ -138,7 +141,7 @@ print_extents (uint32_vector *entries)
   if (json_output) fprintf (fp, "[\n");

   for (i = 0; i < entries->len; i += 2) {
-    uint32_t type = entries->ptr[last+1];
+    uint64_t type = entries->ptr[last+1];

     /* If we're coalescing and the current type is different from the
      * previous one then we should print everything up to this entry.
@@ -157,7 +160,7 @@ print_extents (uint32_vector *entries)

   /* Print the last extent if there is one. */
   if (last != i) {
-    uint32_t type = entries->ptr[last+1];
+    uint64_t type = entries->ptr[last+1];
     uint64_t len;

     for (j = last, len = 0; j < i; j += 2)
@@ -169,7 +172,7 @@ print_extents (uint32_vector *entries)
 }

 static void
-print_one_extent (uint64_t offset, uint64_t len, uint32_t type)
+print_one_extent (uint64_t offset, uint64_t len, uint64_t type)
 {
   static bool comma = false;
   char *descr;
@@ -185,7 +188,7 @@ print_one_extent (uint64_t offset, uint64_t len, uint32_t type)
       ansi_colour (bg, fp);
     fprintf (fp, "%10" PRIu64 "  "
              "%10" PRIu64 "  "
-             "%3" PRIu32,
+             "%3" PRIu64,
              offset, len, type);
     if (descr)
       fprintf (fp, "  %s", descr);
@@ -199,7 +202,7 @@ print_one_extent (uint64_t offset, uint64_t len, uint32_t type)

     fprintf (fp, "{ \"offset\": %" PRIu64 ", "
              "\"length\": %" PRIu64 ", "
-             "\"type\": %" PRIu32,
+             "\"type\": %" PRIu64,
              offset, len, type);
     if (descr) {
       fprintf (fp, ", \"description\": ");
@@ -215,9 +218,9 @@ print_one_extent (uint64_t offset, uint64_t len, uint32_t type)

 /* --map --totals suboption */
 static void
-print_totals (uint32_vector *entries, int64_t size)
+print_totals (uint64_vector *entries, int64_t size)
 {
-  uint32_t type;
+  uint64_t type;
   bool comma = false;

   /* This is necessary to avoid a divide by zero below, but if the
@@ -237,16 +240,16 @@ print_totals (uint32_vector *entries, int64_t size)
    */
   type = 0;
   for (;;) {
-    uint64_t next_type = (uint64_t)UINT32_MAX + 1;
+    uint64_t next_type = 0;
     uint64_t c = 0;
     size_t i;

     for (i = 0; i < entries->len; i += 2) {
-      uint32_t t = entries->ptr[i+1];
+      uint64_t t = entries->ptr[i+1];

       if (t == type)
         c += entries->ptr[i];
-      else if (type < t && t < next_type)
+      else if (type < t && (next_type == 0 || t < next_type))
         next_type = t;
     }

@@ -263,7 +266,7 @@ print_totals (uint32_vector *entries, int64_t size)
           ansi_colour (fg, fp);
         if (bg)
           ansi_colour (bg, fp);
-        fprintf (fp, "%10" PRIu64 " %5.1f%% %3" PRIu32,
+        fprintf (fp, "%10" PRIu64 " %5.1f%% %3" PRIu64,
                  c, percent, type);
         if (descr)
           fprintf (fp, " %s", descr);
@@ -278,7 +281,7 @@ print_totals (uint32_vector *entries, int64_t size)
         fprintf (fp,
                  "{ \"size\": %" PRIu64 ", "
                  "\"percent\": %g, "
-                 "\"type\": %" PRIu32,
+                 "\"type\": %" PRIu64,
                  c, percent, type);
         if (descr) {
           fprintf (fp, ", \"description\": ");
@@ -292,7 +295,7 @@ print_totals (uint32_vector *entries, int64_t size)
         free (descr);
     }

-    if (next_type == (uint64_t)UINT32_MAX + 1)
+    if (next_type == 0)
       break;
     type = next_type;
   }
@@ -301,7 +304,7 @@ print_totals (uint32_vector *entries, int64_t size)
 }

 static void
-extent_description (const char *metacontext, uint32_t type,
+extent_description (const char *metacontext, uint64_t type,
                     char **descr, bool *free_descr,
                     const char **fg, const char **bg)
 {
@@ -348,7 +351,7 @@ extent_description (const char *metacontext, uint32_t type,
       *fg = ANSI_FG_BRIGHT_WHITE; *bg = ANSI_BG_BLACK;
       return;
     default:
-      if (asprintf (descr, "backing depth %u", type) == -1) {
+      if (asprintf (descr, "backing depth %" PRIu64, type) == -1) {
         perror ("asprintf");
         exit (EXIT_FAILURE);
       }
-- 
2.38.1



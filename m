Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89510287C17
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 21:09:31 +0200 (CEST)
Received: from localhost ([::1]:33766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQbIA-0000Cq-KD
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 15:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kQb95-0007ym-Rt
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:00:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kQb91-0003gg-1E
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602183602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JbMmhwXktNx2YPBKyBc4sxOjMGJQvewyeSBO0+tU3rA=;
 b=B86YIHl+YFNiuBpLqCnRyPkvC3isAxGVvc+wwQa0U6XLRheP+4e26MhWp8/1rCxGsHhoLQ
 5yAQivd/QwRaVkqZf3YTb+L8CHqXZGEl9fgv/9j5jIgfuly+f+xoV+0tLgneu1JxvWFWC+
 TwJ+2cNuMWl/tXEpKmV1ZcqIx1jFNp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-_Up-rhb2PHqdcMOnIWDybA-1; Thu, 08 Oct 2020 15:00:00 -0400
X-MC-Unique: _Up-rhb2PHqdcMOnIWDybA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1AC91091070;
 Thu,  8 Oct 2020 18:59:58 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-14.phx2.redhat.com [10.3.113.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8453D5D9E8;
 Thu,  8 Oct 2020 18:59:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] nbd: Simplify meta-context parsing
Date: Thu,  8 Oct 2020 13:59:51 -0500
Message-Id: <20201008185951.1026052-9-eblake@redhat.com>
In-Reply-To: <20201008185951.1026052-1-eblake@redhat.com>
References: <20201008185951.1026052-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 02:56:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had a premature optimization of trying to read as little from the
wire as possible while handling NBD_OPT_SET_META_CONTEXT in phases.
But in reality, we HAVE to read the entire string from the client
before we can get to the next command, and it is easier to just read
it all at once than it is to read it in pieces.  And once we do that,
several functions end up no longer performing I/O, so they can drop
length and errp parameters, and just return a bool instead of
modifying through a pointer.

Our iotests still pass; I also checked that libnbd's testsuite (which
covers more corner cases of odd meta context requests) still passes.
There are cases where the sequence of trace messages produced differs
(for example, when no bitmap is exported, a query for "qemu:" now
produces two trace lines instead of one), but trace points are for
debug and have no effect on what the client sees.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200930121105.667049-4-eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
[eblake: enhance commit message]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 193 +++++++++++++++++++--------------------------------
 1 file changed, 70 insertions(+), 123 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 50f95abe3168..e75c825879aa 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1,5 +1,5 @@
 /*
- *  Copyright (C) 2016-2018 Red Hat, Inc.
+ *  Copyright (C) 2016-2020 Red Hat, Inc.
  *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
  *
  *  Network Block Device Server Side
@@ -797,135 +797,95 @@ static int nbd_negotiate_send_meta_context(NBDClient *client,
     return qio_channel_writev_all(client->ioc, iov, 2, errp) < 0 ? -EIO : 0;
 }

-/* Read strlen(@pattern) bytes, and set @match to true if they match @pattern.
- * @match is never set to false.
- *
- * Return -errno on I/O error, 0 if option was completely handled by
- * sending a reply about inconsistent lengths, or 1 on success.
- *
- * Note: return code = 1 doesn't mean that we've read exactly @pattern.
- * It only means that there are no errors.
+/*
+ * Return true if @query matches @pattern, or if @query is empty when
+ * the @client is performing _LIST_.
  */
-static int nbd_meta_pattern(NBDClient *client, const char *pattern, bool *match,
-                            Error **errp)
+static bool nbd_meta_empty_or_pattern(NBDClient *client, const char *pattern,
+                                      const char *query)
 {
-    int ret;
-    char *query;
-    size_t len = strlen(pattern);
-
-    assert(len);
-
-    query = g_malloc(len);
-    ret = nbd_opt_read(client, query, len, true, errp);
-    if (ret <= 0) {
-        g_free(query);
-        return ret;
+    if (!*query) {
+        trace_nbd_negotiate_meta_query_parse("empty");
+        return client->opt == NBD_OPT_LIST_META_CONTEXT;
     }
-
-    if (strncmp(query, pattern, len) == 0) {
+    if (strcmp(query, pattern) == 0) {
         trace_nbd_negotiate_meta_query_parse(pattern);
-        *match = true;
-    } else {
-        trace_nbd_negotiate_meta_query_skip("pattern not matched");
+        return true;
     }
-    g_free(query);
-
-    return 1;
+    trace_nbd_negotiate_meta_query_skip("pattern not matched");
+    return false;
 }

 /*
- * Read @len bytes, and set @match to true if they match @pattern, or if @len
- * is 0 and the client is performing _LIST_. @match is never set to false.
- *
- * Return -errno on I/O error, 0 if option was completely handled by
- * sending a reply about inconsistent lengths, or 1 on success.
- *
- * Note: return code = 1 doesn't mean that we've read exactly @pattern.
- * It only means that there are no errors.
+ * Return true and adjust @str in place if it begins with @prefix.
  */
-static int nbd_meta_empty_or_pattern(NBDClient *client, const char *pattern,
-                                     uint32_t len, bool *match, Error **errp)
+static bool nbd_strshift(const char **str, const char *prefix)
 {
-    if (len == 0) {
-        if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
-            *match = true;
-        }
-        trace_nbd_negotiate_meta_query_parse("empty");
-        return 1;
-    }
+    size_t len = strlen(prefix);

-    if (len != strlen(pattern)) {
-        trace_nbd_negotiate_meta_query_skip("different lengths");
-        return nbd_opt_skip(client, len, errp);
+    if (strncmp(*str, prefix, len) == 0) {
+        *str += len;
+        return true;
     }
-
-    return nbd_meta_pattern(client, pattern, match, errp);
+    return false;
 }

 /* nbd_meta_base_query
  *
  * Handle queries to 'base' namespace. For now, only the base:allocation
- * context is available.  'len' is the amount of text remaining to be read from
- * the current name, after the 'base:' portion has been stripped.
- *
- * Return -errno on I/O error, 0 if option was completely handled by
- * sending a reply about inconsistent lengths, or 1 on success.
+ * context is available.  Return true if @query has been handled.
  */
-static int nbd_meta_base_query(NBDClient *client, NBDExportMetaContexts *meta,
-                               uint32_t len, Error **errp)
+static bool nbd_meta_base_query(NBDClient *client, NBDExportMetaContexts *meta,
+                                const char *query)
 {
-    return nbd_meta_empty_or_pattern(client, "allocation", len,
-                                     &meta->base_allocation, errp);
+    if (!nbd_strshift(&query, "base:")) {
+        return false;
+    }
+    trace_nbd_negotiate_meta_query_parse("base:");
+
+    if (nbd_meta_empty_or_pattern(client, "allocation", query)) {
+        meta->base_allocation = true;
+    }
+    return true;
 }

-/* nbd_meta_bitmap_query
+/* nbd_meta_qemu_query
  *
- * Handle query to 'qemu:' namespace.
- * @len is the amount of text remaining to be read from the current name, after
- * the 'qemu:' portion has been stripped.
- *
- * Return -errno on I/O error, 0 if option was completely handled by
- * sending a reply about inconsistent lengths, or 1 on success. */
-static int nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
-                               uint32_t len, Error **errp)
+ * Handle queries to 'qemu' namespace. For now, only the qemu:dirty-bitmap:
+ * context is available.  Return true if @query has been handled.
+ */
+static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
+                                const char *query)
 {
-    bool dirty_bitmap = false;
-    size_t dirty_bitmap_len = strlen("dirty-bitmap:");
-    int ret;
-
-    if (!meta->exp->export_bitmap) {
-        trace_nbd_negotiate_meta_query_skip("no dirty-bitmap exported");
-        return nbd_opt_skip(client, len, errp);
+    if (!nbd_strshift(&query, "qemu:")) {
+        return false;
     }
+    trace_nbd_negotiate_meta_query_parse("qemu:");

-    if (len == 0) {
+    if (!*query) {
         if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
+            meta->bitmap = !!meta->exp->export_bitmap;
+        }
+        trace_nbd_negotiate_meta_query_parse("empty");
+        return true;
+    }
+
+    if (nbd_strshift(&query, "dirty-bitmap:")) {
+        trace_nbd_negotiate_meta_query_parse("dirty-bitmap:");
+        if (!meta->exp->export_bitmap) {
+            trace_nbd_negotiate_meta_query_skip("no dirty-bitmap exported");
+            return true;
+        }
+        if (nbd_meta_empty_or_pattern(client,
+                                      meta->exp->export_bitmap_context +
+                                      strlen("qemu:dirty-bitmap:"), query)) {
             meta->bitmap = true;
         }
-        trace_nbd_negotiate_meta_query_parse("empty");
-        return 1;
+        return true;
     }

-    if (len < dirty_bitmap_len) {
-        trace_nbd_negotiate_meta_query_skip("not dirty-bitmap:");
-        return nbd_opt_skip(client, len, errp);
-    }
-
-    len -= dirty_bitmap_len;
-    ret = nbd_meta_pattern(client, "dirty-bitmap:", &dirty_bitmap, errp);
-    if (ret <= 0) {
-        return ret;
-    }
-    if (!dirty_bitmap) {
-        trace_nbd_negotiate_meta_query_skip("not dirty-bitmap:");
-        return nbd_opt_skip(client, len, errp);
-    }
-
-    trace_nbd_negotiate_meta_query_parse("dirty-bitmap:");
-
-    return nbd_meta_empty_or_pattern(
-            client, meta->exp->export_bitmap_context +
-            strlen("qemu:dirty_bitmap:"), len, &meta->bitmap, errp);
+    trace_nbd_negotiate_meta_query_skip("not dirty-bitmap");
+    return true;
 }

 /* nbd_negotiate_meta_query
@@ -935,22 +895,13 @@ static int nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
  *
  * The only supported namespaces are 'base' and 'qemu'.
  *
- * The function aims not wasting time and memory to read long unknown namespace
- * names.
- *
  * Return -errno on I/O error, 0 if option was completely handled by
  * sending a reply about inconsistent lengths, or 1 on success. */
 static int nbd_negotiate_meta_query(NBDClient *client,
                                     NBDExportMetaContexts *meta, Error **errp)
 {
-    /*
-     * Both 'qemu' and 'base' namespaces have length = 5 including a
-     * colon. If another length namespace is later introduced, this
-     * should certainly be refactored.
-     */
     int ret;
-    size_t ns_len = 5;
-    char ns[5];
+    g_autofree char *query = NULL;
     uint32_t len;

     ret = nbd_opt_read(client, &len, sizeof(len), false, errp);
@@ -963,27 +914,23 @@ static int nbd_negotiate_meta_query(NBDClient *client,
         trace_nbd_negotiate_meta_query_skip("length too long");
         return nbd_opt_skip(client, len, errp);
     }
-    if (len < ns_len) {
-        trace_nbd_negotiate_meta_query_skip("length too short");
-        return nbd_opt_skip(client, len, errp);
-    }

-    len -= ns_len;
-    ret = nbd_opt_read(client, ns, ns_len, true, errp);
+    query = g_malloc(len + 1);
+    ret = nbd_opt_read(client, query, len, true, errp);
     if (ret <= 0) {
         return ret;
     }
+    query[len] = '\0';

-    if (!strncmp(ns, "base:", ns_len)) {
-        trace_nbd_negotiate_meta_query_parse("base:");
-        return nbd_meta_base_query(client, meta, len, errp);
-    } else if (!strncmp(ns, "qemu:", ns_len)) {
-        trace_nbd_negotiate_meta_query_parse("qemu:");
-        return nbd_meta_qemu_query(client, meta, len, errp);
+    if (nbd_meta_base_query(client, meta, query)) {
+        return 1;
+    }
+    if (nbd_meta_qemu_query(client, meta, query)) {
+        return 1;
     }

     trace_nbd_negotiate_meta_query_skip("unknown namespace");
-    return nbd_opt_skip(client, len, errp);
+    return 1;
 }

 /* nbd_negotiate_meta_queries
-- 
2.28.0



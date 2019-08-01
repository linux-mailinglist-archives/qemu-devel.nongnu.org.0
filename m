Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741F77E27B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 20:43:38 +0200 (CEST)
Received: from localhost ([::1]:58404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htG37-0001mm-NM
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 14:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33363)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1htG20-0001JQ-L3
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 14:42:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1htG1y-0003zj-P1
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 14:42:28 -0400
Received: from relay.sw.ru ([185.231.240.75]:50444)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1htG1y-0003v6-Ht
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 14:42:26 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1htG1t-0003NM-V3; Thu, 01 Aug 2019 21:42:22 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Aug 2019 21:42:10 +0300
Message-Id: <1564684930-107089-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2] make check-unit: use after free in
 test-opts-visitor
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
Cc: den@openvz.org, vsementsov@virtuozzo.com, andrey.shinkevich@virtuozzo.com,
 armbru@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In struct OptsVisitor, repeated_opts member points to a list in the
unprocessed_opts hash table after the list has been destroyed. A
subsequent call to visit_type_int() references the deleted list. It
results in use-after-free issue. Also, the Visitor object call back
functions are supposed to set the Error parameter in case of failure.
A new mode ListMode::LM_TRAVERSED is declared to mark the list
traversal completed.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---

v2:
 01: A new mode LM_TRAVERSED has been introduced to check instead of the
     repeated_opts pointer for NULL.

 qapi/opts-visitor.c | 78 +++++++++++++++++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 29 deletions(-)

diff --git a/qapi/opts-visitor.c b/qapi/opts-visitor.c
index 324b197..23ac383 100644
--- a/qapi/opts-visitor.c
+++ b/qapi/opts-visitor.c
@@ -22,33 +22,42 @@
 
 enum ListMode
 {
-    LM_NONE,             /* not traversing a list of repeated options */
-
-    LM_IN_PROGRESS,      /* opts_next_list() ready to be called.
-                          *
-                          * Generating the next list link will consume the most
-                          * recently parsed QemuOpt instance of the repeated
-                          * option.
-                          *
-                          * Parsing a value into the list link will examine the
-                          * next QemuOpt instance of the repeated option, and
-                          * possibly enter LM_SIGNED_INTERVAL or
-                          * LM_UNSIGNED_INTERVAL.
-                          */
-
-    LM_SIGNED_INTERVAL,  /* opts_next_list() has been called.
-                          *
-                          * Generating the next list link will consume the most
-                          * recently stored element from the signed interval,
-                          * parsed from the most recent QemuOpt instance of the
-                          * repeated option. This may consume QemuOpt itself
-                          * and return to LM_IN_PROGRESS.
-                          *
-                          * Parsing a value into the list link will store the
-                          * next element of the signed interval.
-                          */
-
-    LM_UNSIGNED_INTERVAL /* Same as above, only for an unsigned interval. */
+    LM_NONE,              /* not traversing a list of repeated options */
+
+    LM_IN_PROGRESS,       /*
+                           * opts_next_list() ready to be called.
+                           *
+                           * Generating the next list link will consume the most
+                           * recently parsed QemuOpt instance of the repeated
+                           * option.
+                           *
+                           * Parsing a value into the list link will examine the
+                           * next QemuOpt instance of the repeated option, and
+                           * possibly enter LM_SIGNED_INTERVAL or
+                           * LM_UNSIGNED_INTERVAL.
+                           */
+
+    LM_SIGNED_INTERVAL,   /*
+                           * opts_next_list() has been called.
+                           *
+                           * Generating the next list link will consume the most
+                           * recently stored element from the signed interval,
+                           * parsed from the most recent QemuOpt instance of the
+                           * repeated option. This may consume QemuOpt itself
+                           * and return to LM_IN_PROGRESS.
+                           *
+                           * Parsing a value into the list link will store the
+                           * next element of the signed interval.
+                           */
+
+    LM_UNSIGNED_INTERVAL, /* Same as above, only for an unsigned interval. */
+
+    LM_TRAVERSED          /*
+                           * opts_next_list() has been called.
+                           *
+                           * No more QemuOpt instance in the list.
+                           * The traversal has been completed.
+                           */
 };
 
 typedef enum ListMode ListMode;
@@ -238,6 +247,8 @@ opts_next_list(Visitor *v, GenericList *tail, size_t size)
     OptsVisitor *ov = to_ov(v);
 
     switch (ov->list_mode) {
+    case LM_TRAVERSED:
+        return NULL;
     case LM_SIGNED_INTERVAL:
     case LM_UNSIGNED_INTERVAL:
         if (ov->list_mode == LM_SIGNED_INTERVAL) {
@@ -258,6 +269,8 @@ opts_next_list(Visitor *v, GenericList *tail, size_t size)
         opt = g_queue_pop_head(ov->repeated_opts);
         if (g_queue_is_empty(ov->repeated_opts)) {
             g_hash_table_remove(ov->unprocessed_opts, opt->name);
+            ov->repeated_opts = NULL;
+            ov->list_mode = LM_TRAVERSED;
             return NULL;
         }
         break;
@@ -289,8 +302,11 @@ opts_end_list(Visitor *v, void **obj)
 
     assert(ov->list_mode == LM_IN_PROGRESS ||
            ov->list_mode == LM_SIGNED_INTERVAL ||
-           ov->list_mode == LM_UNSIGNED_INTERVAL);
-    ov->repeated_opts = NULL;
+           ov->list_mode == LM_UNSIGNED_INTERVAL ||
+           ov->list_mode == LM_TRAVERSED);
+    if (ov->list_mode != LM_TRAVERSED) {
+        ov->repeated_opts = NULL;
+    }
     ov->list_mode = LM_NONE;
 }
 
@@ -306,6 +322,10 @@ lookup_scalar(const OptsVisitor *ov, const char *name, Error **errp)
         list = lookup_distinct(ov, name, errp);
         return list ? g_queue_peek_tail(list) : NULL;
     }
+    if (ov->list_mode == LM_TRAVERSED) {
+        error_setg(errp, QERR_INVALID_PARAMETER, name);
+        return NULL;
+    }
     assert(ov->list_mode == LM_IN_PROGRESS);
     return g_queue_peek_head(ov->repeated_opts);
 }
-- 
1.8.3.1



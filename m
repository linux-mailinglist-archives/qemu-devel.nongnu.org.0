Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ECB8238A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 19:03:55 +0200 (CEST)
Received: from localhost ([::1]:56162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hugOo-0006ad-O9
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 13:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42044)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hugOJ-0006Ad-6l
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 13:03:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hugOI-0000si-3r
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 13:03:23 -0400
Received: from relay.sw.ru ([185.231.240.75]:34878)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hugOH-0000qX-TI
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 13:03:22 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hugOD-00008n-EM; Mon, 05 Aug 2019 20:03:17 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 20:03:06 +0300
Message-Id: <1565024586-387112-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v3] make check-unit: use after free in
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

In the struct OptsVisitor, the 'repeated_opts' member points to a list
in the 'unprocessed_opts' hash table after the list has been destroyed.
A subsequent call to visit_type_int() references the deleted list.
It results in use-after-free issue reproduced by running the test case
under the Valgrind: valgrind tests/test-opts-visitor.
A new mode ListMode::LM_TRAVERSED is declared to mark the list
traversal completed.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---

v3:
 01: The comment of the patch header was amended.
 02: The change in spacing of 'ListMode' comment blocks was rolled back.
 03: The 'repeated_opts' in opts_end_list() is now reset unconditionally
     as it was.
 04: The 'name' in the error_setg() was removed as the pointer to the list 
     name can be null (suggested by Markus).

 qapi/opts-visitor.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/qapi/opts-visitor.c b/qapi/opts-visitor.c
index 324b197..5fe0276 100644
--- a/qapi/opts-visitor.c
+++ b/qapi/opts-visitor.c
@@ -24,7 +24,8 @@ enum ListMode
 {
     LM_NONE,             /* not traversing a list of repeated options */
 
-    LM_IN_PROGRESS,      /* opts_next_list() ready to be called.
+    LM_IN_PROGRESS,      /*
+                          * opts_next_list() ready to be called.
                           *
                           * Generating the next list link will consume the most
                           * recently parsed QemuOpt instance of the repeated
@@ -36,7 +37,8 @@ enum ListMode
                           * LM_UNSIGNED_INTERVAL.
                           */
 
-    LM_SIGNED_INTERVAL,  /* opts_next_list() has been called.
+    LM_SIGNED_INTERVAL,  /*
+                          * opts_next_list() has been called.
                           *
                           * Generating the next list link will consume the most
                           * recently stored element from the signed interval,
@@ -48,7 +50,14 @@ enum ListMode
                           * next element of the signed interval.
                           */
 
-    LM_UNSIGNED_INTERVAL /* Same as above, only for an unsigned interval. */
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
@@ -289,7 +302,8 @@ opts_end_list(Visitor *v, void **obj)
 
     assert(ov->list_mode == LM_IN_PROGRESS ||
            ov->list_mode == LM_SIGNED_INTERVAL ||
-           ov->list_mode == LM_UNSIGNED_INTERVAL);
+           ov->list_mode == LM_UNSIGNED_INTERVAL ||
+           ov->list_mode == LM_TRAVERSED);
     ov->repeated_opts = NULL;
     ov->list_mode = LM_NONE;
 }
@@ -306,6 +320,10 @@ lookup_scalar(const OptsVisitor *ov, const char *name, Error **errp)
         list = lookup_distinct(ov, name, errp);
         return list ? g_queue_peek_tail(list) : NULL;
     }
+    if (ov->list_mode == LM_TRAVERSED) {
+        error_setg(errp, "Fewer list elements than expected");
+        return NULL;
+    }
     assert(ov->list_mode == LM_IN_PROGRESS);
     return g_queue_peek_head(ov->repeated_opts);
 }
-- 
1.8.3.1



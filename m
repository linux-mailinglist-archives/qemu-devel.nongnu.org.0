Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6BC2153FB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 10:27:59 +0200 (CEST)
Received: from localhost ([::1]:42090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsMTm-0002HE-4x
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 04:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsMCi-0002D4-0e
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:10:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51754
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsMCP-0003EA-S5
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594023000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7RGv5ZXfgxJJyOl+k/aDW7Jx1xinunsjgM2Klsul6Wc=;
 b=izgUyRYTRj4k2+08GCt0ZJrH/+CuYsUZgiItn/Vm0lgxWCO0vqFFRsyWMMCefxZxJyl+To
 p6lr1GrdMhL9RQ3wuHC/LUVRQ305hCVw8o4gwbKFCGQdOX2+yuerMmV0SX36v0vvH7QNkA
 cmi8BvMfVMCXMK+IGai5ljpe3B1cwcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-0JV-tAtBPvaNWTEKOfItPA-1; Mon, 06 Jul 2020 04:09:58 -0400
X-MC-Unique: 0JV-tAtBPvaNWTEKOfItPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAA4E8015F5;
 Mon,  6 Jul 2020 08:09:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 776905C290;
 Mon,  6 Jul 2020 08:09:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 81CE21135259; Mon,  6 Jul 2020 10:09:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 40/44] qapi: Purge error_propagate() from QAPI core
Date: Mon,  6 Jul 2020 10:09:46 +0200
Message-Id: <20200706080950.403087-41-armbru@redhat.com>
In-Reply-To: <20200706080950.403087-1-armbru@redhat.com>
References: <20200706080950.403087-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, groug@kaod.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/qapi-visit-core.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index 5a9c47aabf..7e5f40e7f0 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -39,19 +39,18 @@ void visit_free(Visitor *v)
 bool visit_start_struct(Visitor *v, const char *name, void **obj,
                         size_t size, Error **errp)
 {
-    Error *err = NULL;
+    bool ok;
 
     trace_visit_start_struct(v, name, obj, size);
     if (obj) {
         assert(size);
         assert(!(v->type & VISITOR_OUTPUT) || *obj);
     }
-    v->start_struct(v, name, obj, size, &err);
+    ok = v->start_struct(v, name, obj, size, errp);
     if (obj && (v->type & VISITOR_INPUT)) {
-        assert(!err != !*obj);
+        assert(ok != !*obj);
     }
-    error_propagate(errp, err);
-    return !err;
+    return ok;
 }
 
 bool visit_check_struct(Visitor *v, Error **errp)
@@ -69,16 +68,15 @@ void visit_end_struct(Visitor *v, void **obj)
 bool visit_start_list(Visitor *v, const char *name, GenericList **list,
                       size_t size, Error **errp)
 {
-    Error *err = NULL;
+    bool ok;
 
     assert(!list || size >= sizeof(GenericList));
     trace_visit_start_list(v, name, list, size);
-    v->start_list(v, name, list, size, &err);
+    ok = v->start_list(v, name, list, size, errp);
     if (list && (v->type & VISITOR_INPUT)) {
-        assert(!(err && *list));
+        assert(ok || !*list);
     }
-    error_propagate(errp, err);
-    return !err;
+    return ok;
 }
 
 GenericList *visit_next_list(Visitor *v, GenericList *tail, size_t size)
@@ -104,19 +102,20 @@ bool visit_start_alternate(Visitor *v, const char *name,
                            GenericAlternate **obj, size_t size,
                            Error **errp)
 {
-    Error *err = NULL;
+    bool ok;
 
     assert(obj && size >= sizeof(GenericAlternate));
     assert(!(v->type & VISITOR_OUTPUT) || *obj);
     trace_visit_start_alternate(v, name, obj, size);
-    if (v->start_alternate) {
-        v->start_alternate(v, name, obj, size, &err);
+    if (!v->start_alternate) {
+        assert(!(v->type & VISITOR_INPUT));
+        return true;
     }
+    ok = v->start_alternate(v, name, obj, size, errp);
     if (v->type & VISITOR_INPUT) {
-        assert(v->start_alternate && !err != !*obj);
+        assert(ok != !*obj);
     }
-    error_propagate(errp, err);
-    return !err;
+    return ok;
 }
 
 void visit_end_alternate(Visitor *v, void **obj)
@@ -309,7 +308,7 @@ bool visit_type_bool(Visitor *v, const char *name, bool *obj, Error **errp)
 
 bool visit_type_str(Visitor *v, const char *name, char **obj, Error **errp)
 {
-    Error *err = NULL;
+    bool ok;
 
     assert(obj);
     /* TODO: Fix callers to not pass NULL when they mean "", so that we
@@ -317,12 +316,11 @@ bool visit_type_str(Visitor *v, const char *name, char **obj, Error **errp)
     assert(!(v->type & VISITOR_OUTPUT) || *obj);
      */
     trace_visit_type_str(v, name, obj);
-    v->type_str(v, name, obj, &err);
+    ok = v->type_str(v, name, obj, errp);
     if (v->type & VISITOR_INPUT) {
-        assert(!err != !*obj);
+        assert(ok != !*obj);
     }
-    error_propagate(errp, err);
-    return !err;
+    return ok;
 }
 
 bool visit_type_number(Visitor *v, const char *name, double *obj,
-- 
2.26.2



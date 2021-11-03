Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00855444730
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:32:54 +0100 (CET)
Received: from localhost ([::1]:38734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miK84-0003cS-SZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5f-0000nw-2a
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5b-0001IO-El
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVvbInFKSgK0TmjPAgDP+1Hq7QXSUbBoQi6FBr5BeRs=;
 b=WHaWk1dM2JinHSqgMaPzu/9vewLRhPDbTLQ+IB8kyNKipJFv78d1Q86ITjLNfc8IuC+lfJ
 klZXI7M0aEFJIBfYkI54+oSIL1bLS2cbKQAKMz4yLHP8mN00ASB8sZFt/ddjCrQ46DowmR
 Z80LdriEIUL6fWVHwVEM2MxPEHb5brs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-6znBwnKHNeaEDmHct62JTw-1; Wed, 03 Nov 2021 13:30:16 -0400
X-MC-Unique: 6znBwnKHNeaEDmHct62JTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 637AF806688
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 17:30:15 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B5E1794DE;
 Wed,  3 Nov 2021 17:30:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/12] qapi: Add visit_next_struct_member()
Date: Wed,  3 Nov 2021 18:29:51 +0100
Message-Id: <20211103173002.209906-2-kwolf@redhat.com>
In-Reply-To: <20211103173002.209906-1-kwolf@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a way to generically deal with an unknown set of members in
input visitors by just getting the name of the next unvisited member.
QOM object creation code will use it to have generic code that calls
property setters which then in turn have the more specific knowledge how
to visit the respective member.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qapi/visitor-impl.h  |  3 +++
 include/qapi/visitor.h       |  2 ++
 qapi/qapi-visit-core.c       |  6 ++++++
 qapi/qobject-input-visitor.c | 16 ++++++++++++++++
 qapi/trace-events            |  1 +
 5 files changed, 28 insertions(+)

diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
index 2badec5ba4..af66a850ed 100644
--- a/include/qapi/visitor-impl.h
+++ b/include/qapi/visitor-impl.h
@@ -57,6 +57,9 @@ struct Visitor
     /* Must be set to visit structs */
     void (*end_struct)(Visitor *v, void **obj);
 
+    /* Must be set for input visitors to visit structs */
+    const char *(*next_struct_member)(Visitor *v);
+
     /* Must be set; implementations may require @list to be non-null,
      * but must document it. */
     bool (*start_list)(Visitor *v, const char *name, GenericList **list,
diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index d53a84c9ba..5a1a28f9ad 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -326,6 +326,8 @@ bool visit_check_struct(Visitor *v, Error **errp);
  */
 void visit_end_struct(Visitor *v, void **obj);
 
+/* TODO */
+const char *visit_next_struct_member(Visitor *v);
 
 /*** Visiting lists ***/
 
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index 6c13510a2b..82fb63e459 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -70,6 +70,12 @@ void visit_end_struct(Visitor *v, void **obj)
     v->end_struct(v, obj);
 }
 
+const char *visit_next_struct_member(Visitor *v)
+{
+    trace_visit_next_struct_member(v);
+    return v->next_struct_member(v);
+}
+
 bool visit_start_list(Visitor *v, const char *name, GenericList **list,
                       size_t size, Error **errp)
 {
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index f0b4c7ca9d..a409b841af 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -310,6 +310,21 @@ static void qobject_input_end_struct(Visitor *v, void **obj)
     qobject_input_pop(v, obj);
 }
 
+static const char *qobject_input_next_struct_member(Visitor *v)
+{
+    QObjectInputVisitor *qiv = to_qiv(v);
+    StackObject *tos = QSLIST_FIRST(&qiv->stack);
+    GHashTableIter iter;
+    const char *key;
+
+    assert(qobject_type(tos->obj) == QTYPE_QDICT && tos->h);
+    g_hash_table_iter_init(&iter, tos->h);
+    if (g_hash_table_iter_next(&iter, (void **)&key, NULL)) {
+        return key;
+    }
+    return false;
+}
+
 
 static bool qobject_input_start_list(Visitor *v, const char *name,
                                      GenericList **list, size_t size,
@@ -700,6 +715,7 @@ static QObjectInputVisitor *qobject_input_visitor_base_new(QObject *obj)
     v->visitor.start_struct = qobject_input_start_struct;
     v->visitor.check_struct = qobject_input_check_struct;
     v->visitor.end_struct = qobject_input_end_struct;
+    v->visitor.next_struct_member = qobject_input_next_struct_member;
     v->visitor.start_list = qobject_input_start_list;
     v->visitor.next_list = qobject_input_next_list;
     v->visitor.check_list = qobject_input_check_list;
diff --git a/qapi/trace-events b/qapi/trace-events
index ab108c4f0e..2d91bb6ae3 100644
--- a/qapi/trace-events
+++ b/qapi/trace-events
@@ -7,6 +7,7 @@ visit_complete(void *v, void *opaque) "v=%p opaque=%p"
 visit_start_struct(void *v, const char *name, void *obj, size_t size) "v=%p name=%s obj=%p size=%zu"
 visit_check_struct(void *v) "v=%p"
 visit_end_struct(void *v, void *obj) "v=%p obj=%p"
+visit_next_struct_member(void *v) "v=%p"
 
 visit_start_list(void *v, const char *name, void *obj, size_t size) "v=%p name=%s obj=%p size=%zu"
 visit_next_list(void *v, void *tail, size_t size) "v=%p tail=%p size=%zu"
-- 
2.31.1



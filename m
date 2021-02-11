Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B375631927C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:48:35 +0100 (CET)
Received: from localhost ([::1]:35592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAH10-0004ab-GL
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAGlc-0004BD-EM
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:32:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAGlM-0002aQ-7r
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613068343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dpgg5NPwXLMnKHpc4TF8VHfAq7amSJKRbmN2mY/RkNk=;
 b=FHL2axVMTEg65Uopyr59IJdBDdLwpfo9j5Liw0ewy7JMCAC4Sn7Jn7oAEWX/N7h4dx7AVW
 6AtuPBkhGPQ5SYHd1psL71paVLoAtZrt/g6r/jxKjgCSDDqaEG8IZOrQXs5g07YZiSm7gw
 6Q5Nyiv2Pkas0SG0f9RBEMfanUQIP0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-crQ_zjf9NWuuK7q-Pt3Uow-1; Thu, 11 Feb 2021 13:32:20 -0500
X-MC-Unique: crQ_zjf9NWuuK7q-Pt3Uow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2285B5224
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 18:31:31 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-82.ams2.redhat.com [10.36.113.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A7825C6DF;
 Thu, 11 Feb 2021 18:31:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] qapi: Add interfaces for alias support to Visitor
Date: Thu, 11 Feb 2021 19:31:13 +0100
Message-Id: <20210211183118.422036-2-kwolf@redhat.com>
In-Reply-To: <20210211183118.422036-1-kwolf@redhat.com>
References: <20210211183118.422036-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds functions to the Visitor interface that can be used to define
aliases and alias scopes.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qapi/visitor-impl.h | 12 ++++++++++
 include/qapi/visitor.h      | 44 +++++++++++++++++++++++++++++++++++++
 qapi/qapi-visit-core.c      | 22 +++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
index 7362c043be..d9a6874528 100644
--- a/include/qapi/visitor-impl.h
+++ b/include/qapi/visitor-impl.h
@@ -113,6 +113,18 @@ struct Visitor
        The core takes care of the return type in the public interface. */
     void (*optional)(Visitor *v, const char *name, bool *present);
 
+    /*
+     * Optional; intended for input visitors. If not given, aliases are
+     * ignored.
+     */
+    void (*define_alias)(Visitor *v, const char *name, const char **source);
+
+    /* Must be set if define_alias is set */
+    void (*start_alias_scope)(Visitor *v);
+
+    /* Must be set if define_alias is set */
+    void (*end_alias_scope)(Visitor *v);
+
     /* Must be set */
     VisitorType type;
 
diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index ebc19ede7f..2ecbc20624 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -459,6 +459,50 @@ void visit_end_alternate(Visitor *v, void **obj);
  */
 bool visit_optional(Visitor *v, const char *name, bool *present);
 
+/*
+ * Defines a new alias rule.
+ *
+ * If @name is non-NULL, the member called @name in the external
+ * representation of the currently visited object is defined as an
+ * alias for the member described by @source.  It is not allowed to
+ * call this function when the currently visited type is not an
+ * object.
+ *
+ * If @name is NULL, all members of the object described by @source
+ * are considered to have alias members with the same key in the
+ * currently visited object.
+ *
+ * @source is a NULL-terminated non-empty array of names that describe
+ * the path to a member, starting from the currently visited object.
+ * All elements in @source except the last one should describe
+ * objects.  If an intermediate element refers to a member with a
+ * non-object type, the alias won't work (this case can legitimately
+ * happen in unions where an alias only makes sense for one branch,
+ * but not for another).
+ *
+ * The alias stays valid until the current alias scope ends.
+ * visit_start/end_struct() implicitly start/end an alias scope.
+ * Additionally, visit_start/end_alias_scope() can be used to explicitly
+ * create a nested alias scope.
+ */
+void visit_define_alias(Visitor *v, const char *name, const char **source);
+
+/*
+ * Begins an explicit alias scope.
+ *
+ * Alias definitions after here will only stay valid until the
+ * corresponding visit_end_alias_scope() is called.
+ */
+void visit_start_alias_scope(Visitor *v);
+
+/*
+ * Ends an explicit alias scope.
+ *
+ * Alias definitions between the correspoding visit_start_alias_scope()
+ * call and here go out of scope and won't apply in later code any more.
+ */
+void visit_end_alias_scope(Visitor *v);
+
 /*
  * Visit an enum value.
  *
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index 7e5f40e7f0..651dd88e02 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -135,6 +135,28 @@ bool visit_optional(Visitor *v, const char *name, bool *present)
     return *present;
 }
 
+void visit_define_alias(Visitor *v, const char *name, const char **source)
+{
+    assert(source[0] != NULL);
+    if (v->define_alias) {
+        v->define_alias(v, name, source);
+    }
+}
+
+void visit_start_alias_scope(Visitor *v)
+{
+    if (v->start_alias_scope) {
+        v->start_alias_scope(v);
+    }
+}
+
+void visit_end_alias_scope(Visitor *v)
+{
+    if (v->end_alias_scope) {
+        v->end_alias_scope(v);
+    }
+}
+
 bool visit_is_input(Visitor *v)
 {
     return v->type == VISITOR_INPUT;
-- 
2.29.2



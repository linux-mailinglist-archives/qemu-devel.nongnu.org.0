Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6185D2B0B4C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 18:31:06 +0100 (CET)
Received: from localhost ([::1]:43162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGR7-0002iw-C3
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 12:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGPE-00018L-47
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:29:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGP9-0006or-N2
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:29:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605202142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CjnQtyzPDpqRQweTOp3vyY/4W/h4Urek3MFOvEw1SHs=;
 b=XwcL5c9bhO/YkFoqhoJuALg7nwnIolNJBXOGGwdSSqHXZG1fMAywDebG1gJAGIrCHE5bcK
 vxslt3WuBeyVCB2E27+PZmhagR2Pd/U0JvMLmjuhhIMIJa3yp7c41mxCdpyBWweX6S64Ds
 sVbJ5qyQ8gQFPXxkDJrKW5Hl0XCzVjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-o2KILMkAPMKF2t_nlLRT3A-1; Thu, 12 Nov 2020 12:29:00 -0500
X-MC-Unique: o2KILMkAPMKF2t_nlLRT3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 832FF100963D
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:28:59 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 860635D9E8;
 Thu, 12 Nov 2020 17:28:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] qapi: Add interfaces for alias support to Visitor
Date: Thu, 12 Nov 2020 18:28:45 +0100
Message-Id: <20201112172850.401925-2-kwolf@redhat.com>
In-Reply-To: <20201112172850.401925-1-kwolf@redhat.com>
References: <20201112172850.401925-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
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
Cc: kwolf@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds functions to the Visitor interface that can be used to define
aliases and alias scopes.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qapi/visitor-impl.h | 12 ++++++++++++
 include/qapi/visitor.h      | 37 +++++++++++++++++++++++++++++++++++++
 qapi/qapi-visit-core.c      | 21 +++++++++++++++++++++
 3 files changed, 70 insertions(+)

diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
index 7362c043be..e30da2599c 100644
--- a/include/qapi/visitor-impl.h
+++ b/include/qapi/visitor-impl.h
@@ -113,6 +113,18 @@ struct Visitor
        The core takes care of the return type in the public interface. */
     void (*optional)(Visitor *v, const char *name, bool *present);
 
+    /*
+     * Optional; intended for input visitors. If not given, aliases are
+     * ignored.
+     */
+    void (*define_alias)(Visitor *v, const char *alias, const char **source);
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
index ebc19ede7f..9bdc0ee03d 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -459,6 +459,43 @@ void visit_end_alternate(Visitor *v, void **obj);
  */
 bool visit_optional(Visitor *v, const char *name, bool *present);
 
+/*
+ * Defines a new alias rule.
+ *
+ * If @alias is non-NULL, the member named @alias in the external
+ * representation of the current struct is defined as an alias for the
+ * member described by @source.
+ *
+ * If @alias is NULL, all members of the struct described by @source are
+ * considered to have alias members with the same key in the current
+ * struct.
+ *
+ * @source is a NULL-terminated array of names that describe the path to
+ * a member, starting from the currently visited struct.
+ *
+ * The alias stays valid until the current alias scope ends.
+ * visit_start/end_struct() implicitly start/end an alias scope.
+ * Additionally, visit_start/end_alias_scope() can be used to explicitly
+ * create a nested alias scope.
+ */
+void visit_define_alias(Visitor *v, const char *alias, const char **source);
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
index 7e5f40e7f0..719a9f5da2 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -135,6 +135,27 @@ bool visit_optional(Visitor *v, const char *name, bool *present)
     return *present;
 }
 
+void visit_define_alias(Visitor *v, const char *alias, const char **source)
+{
+    if (v->define_alias) {
+        v->define_alias(v, alias, source);
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
2.28.0



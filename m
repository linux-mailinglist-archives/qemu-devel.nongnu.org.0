Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25611B606F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 18:11:57 +0200 (CEST)
Received: from localhost ([::1]:58476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jReSC-0007aO-PP
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 12:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jReHo-00066d-E8
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:01:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jReHX-0002Az-SF
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:01:12 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22280
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jReHT-00021z-6n
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587657645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NL1iSgHrvz10Q9W3PP0K81rICAw1IKYoa6kbpW3UVEY=;
 b=aez+6Id7OJ8pGM53KpWzFhlk1+X+jYsyCeHbchW6BbeM8iAD7eUyuiiqzU9G8vuES5VmLL
 1hLkRrkjhytZe/GN633l41XCfKsmB19F0t1ie2EK6LLJgRfbeg6zmgw3STNG8uqAWyvs+2
 IjGrOOmaEuuvTl1gVnDyN+qnQeF0pr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-jeT99QcjOtKu6aGgB8n3dA-1; Thu, 23 Apr 2020 12:00:41 -0400
X-MC-Unique: jeT99QcjOtKu6aGgB8n3dA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93B7E107ACF9;
 Thu, 23 Apr 2020 16:00:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D3C860621;
 Thu, 23 Apr 2020 16:00:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 60AEC11358C0; Thu, 23 Apr 2020 18:00:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/13] qapi: Document @errp usage more thoroughly in visitor.h
Date: Thu, 23 Apr 2020 18:00:27 +0200
Message-Id: <20200423160036.7048-5-armbru@redhat.com>
In-Reply-To: <20200423160036.7048-1-armbru@redhat.com>
References: <20200423160036.7048-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 02:14:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/visitor.h | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index c5d0ce9184..09df7099c6 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -284,9 +284,7 @@ void visit_free(Visitor *v);
  * into *@obj.  @obj may also be NULL for a virtual walk, in which
  * case @size is ignored.
  *
- * @errp obeys typical error usage, and reports failures such as a
- * member @name is not present, or present but not an object.  On
- * error, input visitors set *@obj to NULL.
+ * On failure, set *@obj to NULL and store an error through @errp.
  *
  * After visit_start_struct() succeeds, the caller may visit its
  * members one after the other, passing the member's name and address
@@ -303,8 +301,7 @@ void visit_start_struct(Visitor *v, const char *name, v=
oid **obj,
 /*
  * Prepare for completing an object visit.
  *
- * @errp obeys typical error usage, and reports failures such as
- * unparsed keys remaining in the input stream.
+ * On failure, store an error through @errp.
  *
  * Should be called prior to visit_end_struct() if all other
  * intermediate visit steps were successful, to allow the visitor one
@@ -340,9 +337,7 @@ void visit_end_struct(Visitor *v, void **obj);
  * allow @list to be NULL for a virtual walk, in which case @size is
  * ignored.
  *
- * @errp obeys typical error usage, and reports failures such as a
- * member @name is not present, or present but not a list.  On error,
- * input visitors set *@list to NULL.
+ * On failure, set *@list to NULL and store an error through @errp.
  *
  * After visit_start_list() succeeds, the caller may visit its members
  * one after the other.  A real visit (where @list is non-NULL) uses
@@ -376,8 +371,7 @@ GenericList *visit_next_list(Visitor *v, GenericList *t=
ail, size_t size);
 /*
  * Prepare for completing a list visit.
  *
- * @errp obeys typical error usage, and reports failures such as
- * unvisited list tail remaining in the input stream.
+ * On failure, store an error through @errp.
  *
  * Should be called prior to visit_end_list() if all other
  * intermediate visit steps were successful, to allow the visitor one
@@ -409,8 +403,10 @@ void visit_end_list(Visitor *v, void **list);
  *
  * @obj must not be NULL. Input and clone visitors use @size to
  * determine how much memory to allocate into *@obj, then determine
- * the qtype of the next thing to be visited, stored in (*@obj)->type.
- * Other visitors will leave @obj unchanged.
+ * the qtype of the next thing to be visited, and store it in
+ * (*@obj)->type.  Other visitors leave @obj unchanged.
+ *
+ * On failure, set *@obj to NULL and store an error through @errp.
  *
  * If successful, this must be paired with visit_end_alternate() with
  * the same @obj to clean up, even if visiting the contents of the
@@ -463,8 +459,9 @@ bool visit_optional(Visitor *v, const char *name, bool =
*present);
  *
  * Currently, all input visitors parse text input, and all output
  * visitors produce text output.  The mapping between enumeration
- * values and strings is done by the visitor core, using @strings; it
- * should be the ENUM_lookup array from visit-types.h.
+ * values and strings is done by the visitor core, using @lookup.
+ *
+ * On failure, store an error through @errp.
  *
  * May call visit_type_str() under the hood, and the enum visit may
  * fail even if the corresponding string visit succeeded; this implies
@@ -488,6 +485,8 @@ bool visit_is_input(Visitor *v);
  *
  * @obj must be non-NULL.  Input visitors set *@obj to the value;
  * other visitors will leave *@obj unchanged.
+ *
+ * On failure, store an error through @errp.
  */
 void visit_type_int(Visitor *v, const char *name, int64_t *obj, Error **er=
rp);
=20
@@ -564,6 +563,8 @@ void visit_type_size(Visitor *v, const char *name, uint=
64_t *obj,
  *
  * @obj must be non-NULL.  Input visitors set *@obj to the value;
  * other visitors will leave *@obj unchanged.
+ *
+ * On failure, store an error through @errp.
  */
 void visit_type_bool(Visitor *v, const char *name, bool *obj, Error **errp=
);
=20
@@ -581,6 +582,8 @@ void visit_type_bool(Visitor *v, const char *name, bool=
 *obj, Error **errp);
  * It is safe to cast away const when preparing a (const char *) value
  * into @obj for use by an output visitor.
  *
+ * On failure, set *@obj to NULL and store an error through @errp.
+ *
  * FIXME: Callers that try to output NULL *obj should not be allowed.
  */
 void visit_type_str(Visitor *v, const char *name, char **obj, Error **errp=
);
@@ -594,6 +597,8 @@ void visit_type_str(Visitor *v, const char *name, char =
**obj, Error **errp);
  * @obj must be non-NULL.  Input visitors set *@obj to the value;
  * other visitors will leave *@obj unchanged.  Visitors should
  * document if infinity or NaN are not permitted.
+ *
+ * On failure, store an error through @errp.
  */
 void visit_type_number(Visitor *v, const char *name, double *obj,
                        Error **errp);
@@ -608,6 +613,8 @@ void visit_type_number(Visitor *v, const char *name, do=
uble *obj,
  * other visitors will leave *@obj unchanged.  *@obj must be non-NULL
  * for output visitors.
  *
+ * On failure, set *@obj to NULL and store an error through @errp.
+ *
  * Note that some kinds of input can't express arbitrary QObject.
  * E.g. the visitor returned by qobject_input_visitor_new_keyval()
  * can't create numbers or booleans, only strings.
@@ -622,6 +629,8 @@ void visit_type_any(Visitor *v, const char *name, QObje=
ct **obj, Error **errp);
  *
  * @obj must be non-NULL.  Input visitors set *@obj to the value;
  * other visitors ignore *@obj.
+ *
+ * On failure, set *@obj to NULL and store an error through @errp.
  */
 void visit_type_null(Visitor *v, const char *name, QNull **obj,
                      Error **errp);
--=20
2.21.1



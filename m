Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74837F6C2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 14:24:18 +0200 (CEST)
Received: from localhost ([::1]:34340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htWbZ-0003X5-LN
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 08:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36978)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1htWan-0002cd-IJ
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 08:23:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1htWam-00087N-M0
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 08:23:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1htWam-00083t-GX
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 08:23:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 904373082E20
 for <qemu-devel@nongnu.org>; Fri,  2 Aug 2019 12:23:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
 [10.36.116.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EFE260BEC;
 Fri,  2 Aug 2019 12:23:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CE0591138619; Fri,  2 Aug 2019 14:23:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Aug 2019 14:23:25 +0200
Message-Id: <20190802122325.16520-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 02 Aug 2019 12:23:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] qapi: Make visit_next_list()'s comment less
 confusing
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

visit_next_list() returns non-null on success, null on failure.  The
comment's phrasing "until NULL return or error occurs" is needlessly
confusing.  Scratch the "or error occurs" part.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/visitor.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index 5b2ed3f202..c5b23851a1 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -364,10 +364,10 @@ void visit_start_list(Visitor *v, const char *name,=
 GenericList **list,
  * @tail must not be NULL; on the first call, @tail is the value of
  * *list after visit_start_list(), and on subsequent calls @tail must
  * be the previously returned value.  Should be called in a loop until
- * a NULL return or error occurs; for each non-NULL return, the caller
- * then calls the appropriate visit_type_*() for the element type of
- * the list, with that function's name parameter set to NULL and obj
- * set to the address of @tail->value.
+ * a NULL return; for each non-NULL return, the caller then calls the
+ * appropriate visit_type_*() for the element type of the list, with
+ * that function's name parameter set to NULL and obj set to the
+ * address of @tail->value.
  */
 GenericList *visit_next_list(Visitor *v, GenericList *tail, size_t size)=
;
=20
--=20
2.21.0



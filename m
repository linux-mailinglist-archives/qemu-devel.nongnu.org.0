Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0603E2A4B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 14:06:46 +0200 (CEST)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBycf-00044M-HQ
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 08:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBybM-0003IS-7P
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 08:05:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBybH-0000g6-Qo
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 08:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628251517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JG+pPUToM5gGtG1GZmtPAFMG7Ou0TkSkyL4ojlgrCHY=;
 b=WhK9L8JFO9L6LnkZSftzaUhANr5pvl+VePsI+kwL8qRKtNyvnokneMA3O7WcjcB9zyREBT
 sCsgQyCZrG4QFGCI/qzEYD+cGkiTyQefztSAZu9sEdPkkQcLPK9oVYhHX4OYktWKLAgNX+
 7CnDlDZizEUdgToYnz1cukwTeFX7dik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-QUJ16H95OPaaizvbCkxPEw-1; Fri, 06 Aug 2021 08:05:16 -0400
X-MC-Unique: QUJ16H95OPaaizvbCkxPEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB433107ACF5
 for <qemu-devel@nongnu.org>; Fri,  6 Aug 2021 12:05:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E798360853;
 Fri,  6 Aug 2021 12:05:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6D50011380A0; Fri,  6 Aug 2021 14:05:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi: Fix crash on redefinition with a different condition
Date: Fri,  6 Aug 2021 14:05:10 +0200
Message-Id: <20210806120510.2367124-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPISchema._make_implicit_object_type() asserts that when an implicit
object type is used multiple times, @ifcond is the same for all uses.
It will be for legitimate uses, i.e. simple union branch wrapper
types.  A comment explains this.

The assertion fails when a command or event is redefined with a
different condition.  The redefinition is an error, but it's flagged
only later.

Fixing the assertion would complicate matters further.  Not
worthwhile, drop it instead.  We really need to get rid of simple
unions.

Tweak test case redefined-event to cover redefinition with a different
condition.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/schema.py                 | 22 +++++++++++-----------
 tests/qapi-schema/redefined-event.json |  2 +-
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index d1d27ff7ee..a4ce3972a4 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -997,18 +997,18 @@ def _make_implicit_object_type(self, name, info, ifcond, role, members):
         name = 'q_obj_%s-%s' % (name, role)
         typ = self.lookup_entity(name, QAPISchemaObjectType)
         if typ:
-            # The implicit object type has multiple users.  This can
-            # happen only for simple unions' implicit wrapper types.
-            # Its ifcond should be the disjunction of its user's
-            # ifconds.  Not implemented.  Instead, we always pass the
-            # wrapped type's ifcond, which is trivially the same for all
-            # users.  It's also necessary for the wrapper to compile.
-            # But it's not tight: the disjunction need not imply it.  We
-            # may end up compiling useless wrapper types.
+            # The implicit object type has multiple users.  This is
+            # either a duplicate definition (which will be flagged
+            # later), or an implicit wrapper type used for multiple
+            # simple unions.  In the latter case, ifcond should be the
+            # disjunction of its user's ifconds.  Not implemented.
+            # Instead, we always pass the wrapped type's ifcond, which
+            # is trivially the same for all users.  It's also
+            # necessary for the wrapper to compile.  But it's not
+            # tight: the disjunction need not imply it.  We may end up
+            # compiling useless wrapper types.
             # TODO kill simple unions or implement the disjunction
-
-            # pylint: disable=protected-access
-            assert (ifcond or []) == typ._ifcond
+            pass
         else:
             self._def_entity(QAPISchemaObjectType(
                 name, info, None, ifcond, None, None, members, None))
diff --git a/tests/qapi-schema/redefined-event.json b/tests/qapi-schema/redefined-event.json
index 7717e91c18..09eff18412 100644
--- a/tests/qapi-schema/redefined-event.json
+++ b/tests/qapi-schema/redefined-event.json
@@ -1,3 +1,3 @@
 # we reject duplicate events
 { 'event': 'EVENT_A', 'data': { 'myint': 'int' } }
-{ 'event': 'EVENT_A', 'data': { 'myint': 'int' } }
+{ 'event': 'EVENT_A', 'data': { 'myint': 'int' }, 'if': 'defined(FOO)' }
-- 
2.31.1



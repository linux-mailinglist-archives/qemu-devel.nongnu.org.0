Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70B141CD0A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:58:53 +0200 (CEST)
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfjA-0005yd-Qc
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfWb-0007yc-Tc
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfWY-0006mn-8Q
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAZbcKIyhkiYdXCqmSV21zRsJ1QP7YAp5ksVs7z8ADg=;
 b=JLxsldVhLc/eRgLu0iyrDrswxXwDJO4/Uy/s2rHLThojz2qVh3psOmJvzW6c8cz72meDNJ
 dsDttKJxSe1wobA1SiCGaZRHezfL8cG0alIpREEKQvcAgxjJ+skAxLO2Yva7rjZ/1hl37K
 ZJ9RSi1582ogp0CTuF2bUtKhZNpSqIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-W9EDOWDgM_eMed49srGTQw-1; Wed, 29 Sep 2021 15:45:44 -0400
X-MC-Unique: W9EDOWDgM_eMed49srGTQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D2171006ACC;
 Wed, 29 Sep 2021 19:45:14 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BD5F19C59;
 Wed, 29 Sep 2021 19:45:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/13] qapi/parser: add import cycle workaround
Date: Wed, 29 Sep 2021 15:44:24 -0400
Message-Id: <20210929194428.1038496-10-jsnow@redhat.com>
In-Reply-To: <20210929194428.1038496-1-jsnow@redhat.com>
References: <20210929194428.1038496-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a cycle that exists in the QAPI generator: [schema -> expr ->
parser -> schema]. It exists because the QAPIDoc class needs the names
of types defined by the schema module, but the schema module needs to
import both expr.py/parser.py to do its actual parsing.

Ultimately, the layering violation is that parser.py should not have any
knowledge of specifics of the Schema. QAPIDoc performs double-duty here
both as a parser *and* as a finalized object that is part of the schema.

I see three paths here:

(1) Just use the TYPE_CHECKING trick to eliminate the cycle which is only
    present during static analysis.

(2) Don't bother to annotate connect_member() et al, give them 'object'
    or 'Any'. I don't particularly like this, because it diminishes the
    usefulness of type hints for documentation purposes. Still, it's an
    extremely quick fix.

(3) Reimplement doc <--> definition correlation directly in schema.py,
    integrating doc fields directly into QAPISchemaMember and relieving
    the QAPIDoc class of the responsibility. Users of the information
    would instead visit the members first and retrieve their
    documentation instead of the inverse operation -- visiting the
    documentation and retrieving their members.

I prefer (3), but (1) is the easiest way to have my cake (strong type
hints) and eat it too (Not have import cycles). Do (1) for now, but plan
for (3). See also:
https://mypy.readthedocs.io/en/latest/runtime_troubles.html#import-cycles

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 123fc2f099c..30b1d98df0b 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -18,6 +18,7 @@
 import os
 import re
 from typing import (
+    TYPE_CHECKING,
     Dict,
     List,
     Optional,
@@ -30,6 +31,12 @@
 from .source import QAPISourceInfo
 
 
+if TYPE_CHECKING:
+    # pylint: disable=cyclic-import
+    # TODO: Remove cycle. [schema -> expr -> parser -> schema]
+    from .schema import QAPISchemaFeature, QAPISchemaMember
+
+
 # Return value alias for get_expr().
 _ExprValue = Union[List[object], Dict[str, object], str, bool]
 
@@ -473,9 +480,9 @@ def append(self, line):
     class ArgSection(Section):
         def __init__(self, parser, name, indent=0):
             super().__init__(parser, name, indent)
-            self.member = None
+            self.member: Optional['QAPISchemaMember'] = None
 
-        def connect(self, member):
+        def connect(self, member: 'QAPISchemaMember') -> None:
             self.member = member
 
     class NullSection(Section):
@@ -750,14 +757,14 @@ def _append_freeform(self, line):
                                  % match.group(1))
         self._section.append(line)
 
-    def connect_member(self, member):
+    def connect_member(self, member: 'QAPISchemaMember') -> None:
         if member.name not in self.args:
             # Undocumented TODO outlaw
             self.args[member.name] = QAPIDoc.ArgSection(self._parser,
                                                         member.name)
         self.args[member.name].connect(member)
 
-    def connect_feature(self, feature):
+    def connect_feature(self, feature: 'QAPISchemaFeature') -> None:
         if feature.name not in self.features:
             raise QAPISemError(feature.info,
                                "feature '%s' lacks documentation"
-- 
2.31.1



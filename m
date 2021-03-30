Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3229C34EF56
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 19:24:35 +0200 (CEST)
Received: from localhost ([::1]:59940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRI6U-0005mg-3C
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 13:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lRI1C-0000Il-3E
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lRI10-0003Wt-5I
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617124732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tXrsww6zU1KZ7+CwRwV7pqErVi6LOxARsOF0HRvkXI8=;
 b=gqGWiGAKXzgcZ0Awj71XZ4d8BKZIhOjNODAWJlEzqjLUpGof0nijRDnOtHb85SSfvYYgfO
 Dl0vVQD8S8egRb5SGlsAIg4s2CXL8xB9G6Srom95qCR4kEXT8h56t7yOcUo3ggsUcftNKN
 sKrUIhtiSezQ3lzYBjjFgFR5fykWUE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-uQNBvtOVOASaYEjwYgMJOg-1; Tue, 30 Mar 2021 13:18:48 -0400
X-MC-Unique: uQNBvtOVOASaYEjwYgMJOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F7981005D4F;
 Tue, 30 Mar 2021 17:18:47 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF89E60CD7;
 Tue, 30 Mar 2021 17:18:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 1/8] qapi/error: Repurpose QAPIError as a generic exception
 base class
Date: Tue, 30 Mar 2021 13:18:37 -0400
Message-Id: <20210330171844.1197918-2-jsnow@redhat.com>
In-Reply-To: <20210330171844.1197918-1-jsnow@redhat.com>
References: <20210330171844.1197918-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename QAPIError to QAPISourceError, and then create a new QAPIError
class that serves as the basis for all of our other custom exceptions.

Add docstrings to explain the intended function of each error class.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/sphinx/qapidoc.py |  3 ++-
 scripts/qapi/error.py  | 11 +++++++++--
 scripts/qapi/schema.py |  5 +++--
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index b7b86b5dff..458b1f477e 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -34,7 +34,8 @@
 from sphinx.util.nodes import nested_parse_with_titles
 import sphinx
 from qapi.gen import QAPISchemaVisitor
-from qapi.schema import QAPIError, QAPISemError, QAPISchema
+from qapi.error import QAPIError, QAPISemError
+from qapi.schema import QAPISchema
 
 
 # Sphinx up to 1.6 uses AutodocReporter; 1.7 and later
diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index ae60d9e2fe..126dda7c9b 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -13,6 +13,11 @@
 
 
 class QAPIError(Exception):
+    """Base class for all exceptions from the QAPI package."""
+
+
+class QAPISourceError(QAPIError):
+    """Error class for all exceptions identifying a source location."""
     def __init__(self, info, col, msg):
         Exception.__init__(self)
         self.info = info
@@ -27,7 +32,8 @@ def __str__(self):
         return loc + ': ' + self.msg
 
 
-class QAPIParseError(QAPIError):
+class QAPIParseError(QAPISourceError):
+    """Error class for all QAPI schema parsing errors."""
     def __init__(self, parser, msg):
         col = 1
         for ch in parser.src[parser.line_pos:parser.pos]:
@@ -38,6 +44,7 @@ def __init__(self, parser, msg):
         super().__init__(parser.info, col, msg)
 
 
-class QAPISemError(QAPIError):
+class QAPISemError(QAPISourceError):
+    """Error class for semantic QAPI errors."""
     def __init__(self, info, msg):
         super().__init__(info, None, msg)
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 01cdd753cd..1849c3e45f 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -20,7 +20,7 @@
 from typing import Optional
 
 from .common import POINTER_SUFFIX, c_name
-from .error import QAPIError, QAPISemError
+from .error import QAPISemError, QAPISourceError
 from .expr import check_exprs
 from .parser import QAPISchemaParser
 
@@ -878,7 +878,8 @@ def _def_entity(self, ent):
         other_ent = self._entity_dict.get(ent.name)
         if other_ent:
             if other_ent.info:
-                where = QAPIError(other_ent.info, None, "previous definition")
+                where = QAPISourceError(other_ent.info, None,
+                                        "previous definition")
                 raise QAPISemError(
                     ent.info,
                     "'%s' is already defined\n%s" % (ent.name, where))
-- 
2.30.2



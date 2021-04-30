Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AC936FB89
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:33:24 +0200 (CEST)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTGl-0001h8-Ik
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdj-0003Cq-UG
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRda-0007f5-55
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mEfHypjQmGDiH9T5GGiqIdq6M5E5GSWw8PmioRJSgZY=;
 b=SQM5n1TxOyK4pITTyCstcNY3GN/BEnlNHTtlYf7rBvnv4jRkt8YDojc5ASctYgyIowFCmN
 +f4S8Z05loSnBQA2hjxDw83+JDMgaTcqBeLx8mc8jlI/c0s9H6VTQTcL+iP/Fh0fg5suaN
 UPGe7w+lmMHPXEz7XQrLYV90nUPVvMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-8WM3UfooPROohIQFbyG7ZA-1; Fri, 30 Apr 2021 07:48:44 -0400
X-MC-Unique: 8WM3UfooPROohIQFbyG7ZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67546800C7A;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3926A60937;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B1EC911268B4; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/25] qapi/error: Repurpose QAPIError as an abstract base
 exception class
Date: Fri, 30 Apr 2021 13:48:31 +0200
Message-Id: <20210430114838.2912740-19-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Rename QAPIError to QAPISourceError, and then create a new QAPIError
class that serves as the basis for all of our other custom exceptions,
without specifying any class properties.

This leaves QAPIError as a package-wide error class that's suitable for
any current or future errors.

(Right now, we don't have any errors that DON'T also want to specify a
Source location, but this MAY change. In these cases, a common abstract
ancestor would be desired.)

Add docstrings to explain the intended function of each error class.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421192233.3542904-2-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/sphinx/qapidoc.py |  3 ++-
 scripts/qapi/error.py  | 11 +++++++++--
 scripts/qapi/schema.py |  5 +++--
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index b7a2d39c10..87c67ab23f 100644
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
index 703b446fd2..c277fcacc5 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -20,7 +20,7 @@
 from typing import Optional
 
 from .common import POINTER_SUFFIX, c_name
-from .error import QAPIError, QAPISemError
+from .error import QAPISemError, QAPISourceError
 from .expr import check_exprs
 from .parser import QAPISchemaParser
 
@@ -875,7 +875,8 @@ def _def_entity(self, ent):
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
2.26.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56EA3896A7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:28:06 +0200 (CEST)
Received: from localhost ([::1]:42080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRrR-0007gy-Nf
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljR7H-00064m-T0
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:40:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljR77-00025A-Bl
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621449612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Won4SmCvj7mYBAtSANGNEVYeQbkzdlBm3wPfV06Ta4=;
 b=DAdU2Jt/x58Qu1xw985/I6rZvB42ZzVSfUzzQy4OzRr9GeqlmHXTDDidMvH3MFvjYP4+2R
 eIlk0lywq6dfM6HY2/Mv0IEEki7efRh/Mj/7tqRTDdj8RR8uqp7pN+9EZboNBBlZi6UOUF
 QGjLjwvx/258q2YH2dXr1KaknLFpUMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-qm4z5I1QOxyxnI7Cl7jRnw-1; Wed, 19 May 2021 14:40:09 -0400
X-MC-Unique: qm4z5I1QOxyxnI7Cl7jRnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 416411007477;
 Wed, 19 May 2021 18:40:08 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88EC450FA2;
 Wed, 19 May 2021 18:40:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/15] qapi/parser: Rework _check_pragma_list_of_str as a
 TypeGuard
Date: Wed, 19 May 2021 14:39:47 -0400
Message-Id: <20210519183951.3946870-12-jsnow@redhat.com>
In-Reply-To: <20210519183951.3946870-1-jsnow@redhat.com>
References: <20210519183951.3946870-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TypeGuards wont exist in Python proper until 3.10. Ah well. We can hack
up our own by declaring this function to return the type we claim it
checks for and using this to safely downcast object -> List[str].

In so doing, I bring this function under _pragma so it can use the
'info' object in its closure. Having done this, _pragma also now no
longer needs to take a 'self' parameter, so drop it.

To help with line-length, and with the context evident from its new
scope, rename the function to the shorter check_list_str().

Signed-off-by: John Snow <jsnow@redhat.com>

---

I left (name, value) as args to avoid creating a fully magic "macro",
because this looked simply too weird:

    info.pragma.foobar = check_list_str()

and it looked more reasonable as:

    info.pragma.foobar = check_list_str(name, value)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 9f980f75139..8a58e1228f0 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -17,6 +17,7 @@
 from collections import OrderedDict
 import os
 import re
+from typing import List
 
 from .common import must_match
 from .error import QAPISemError, QAPISourceError
@@ -154,28 +155,29 @@ def _include(include, info, incl_fname, previously_included):
             ) from err
 
     @staticmethod
-    def _check_pragma_list_of_str(name, value, info):
-        if (not isinstance(value, list)
-                or any([not isinstance(elt, str) for elt in value])):
-            raise QAPISemError(
-                info,
-                "pragma %s must be a list of strings" % name)
+    def _pragma(name, value, info):
+
+        def check_list_str(name, value) -> List[str]:
+            if (not isinstance(value, list) or
+                    any([not isinstance(elt, str) for elt in value])):
+                raise QAPISemError(
+                    info,
+                    "pragma %s must be a list of strings" % name)
+            return value
+
+        pragma = info.pragma
 
-    def _pragma(self, name, value, info):
         if name == 'doc-required':
             if not isinstance(value, bool):
                 raise QAPISemError(info,
                                    "pragma 'doc-required' must be boolean")
-            info.pragma.doc_required = value
+            pragma.doc_required = value
         elif name == 'command-name-exceptions':
-            self._check_pragma_list_of_str(name, value, info)
-            info.pragma.command_name_exceptions = value
+            pragma.command_name_exceptions = check_list_str(name, value)
         elif name == 'command-returns-exceptions':
-            self._check_pragma_list_of_str(name, value, info)
-            info.pragma.command_returns_exceptions = value
+            pragma.command_returns_exceptions = check_list_str(name, value)
         elif name == 'member-name-exceptions':
-            self._check_pragma_list_of_str(name, value, info)
-            info.pragma.member_name_exceptions = value
+            pragma.member_name_exceptions = check_list_str(name, value)
         else:
             raise QAPISemError(info, "unknown pragma '%s'" % name)
 
-- 
2.30.2



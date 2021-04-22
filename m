Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B8C3677DD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:21:26 +0200 (CEST)
Received: from localhost ([::1]:43554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPu9-0003nY-9M
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgx-0006Rx-NI
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgl-0006TV-CD
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KLPp9ExvWedGct+OVfi2fBU7wnsFwYmzoh81Q31Wt90=;
 b=f4X2/mLDjHyENeIIwgUKWKAf9JPNQo3Otx9O+VA5JxVf9AdIs96APzmB0pDbYTsXBPLoZf
 PBH+cjCZqq0aHGnvIgiU5F709lIbNwFvubrOpIUW/HXxiuYKz3O2h58/vEQrwF85e3AMID
 WvoVMjT5BqGZmyS68Am29i8nZYQFwEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-wK7Eong2Pn2yPKFcZOhHcg-1; Wed, 21 Apr 2021 23:07:32 -0400
X-MC-Unique: wK7Eong2Pn2yPKFcZOhHcg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2444C8030A1;
 Thu, 22 Apr 2021 03:07:31 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65F98607CB;
 Thu, 22 Apr 2021 03:07:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/22] qapi/parser: Rework _check_pragma_list_of_str as a
 TypeGuard
Date: Wed, 21 Apr 2021 23:07:09 -0400
Message-Id: <20210422030720.3685766-12-jsnow@redhat.com>
In-Reply-To: <20210422030720.3685766-1-jsnow@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TypeGuards wont exist in Python proper until 3.10. Ah well. We can hack
up our own by declaring this function to return the type we claim it
checks for and using this to safely downcast object -> List[str].

In so doing, I bring this function in-line under _pragma so it can use
the 'info' object in its closure. Having done this, _pragma also now
no longer needs to take a 'self' parameter, so drop it.

Rename it to just _check(), to help us out with the line-length -- and
now that it's contained within _pragma, it is contextually easier to see
how it's used anyway -- especially with types.

Signed-off-by: John Snow <jsnow@redhat.com>

---

I left (name, value) as args to avoid creating a fully magic "macro",
though, I thought this was too weird:

    info.pragma.foobar = _check()

and it looked more reasonable as:

    info.pragma.foobar = _check(name, value)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 16fd36f8391..d02a134aae9 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -17,6 +17,7 @@
 from collections import OrderedDict
 import os
 import re
+from typing import List
 
 from .common import match_nofail
 from .error import QAPISemError, QAPISourceError
@@ -151,28 +152,27 @@ def _include(include, info, incl_fname, previously_included):
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
+        def _check(name, value) -> List[str]:
+            if (not isinstance(value, list) or
+                    any([not isinstance(elt, str) for elt in value])):
+                raise QAPISemError(
+                    info,
+                    "pragma %s must be a list of strings" % name)
+            return value
 
-    def _pragma(self, name, value, info):
         if name == 'doc-required':
             if not isinstance(value, bool):
                 raise QAPISemError(info,
                                    "pragma 'doc-required' must be boolean")
             info.pragma.doc_required = value
         elif name == 'command-name-exceptions':
-            self._check_pragma_list_of_str(name, value, info)
-            info.pragma.command_name_exceptions = value
+            info.pragma.command_name_exceptions = _check(name, value)
         elif name == 'command-returns-exceptions':
-            self._check_pragma_list_of_str(name, value, info)
-            info.pragma.command_returns_exceptions = value
+            info.pragma.command_returns_exceptions = _check(name, value)
         elif name == 'member-name-exceptions':
-            self._check_pragma_list_of_str(name, value, info)
-            info.pragma.member_name_exceptions = value
+            info.pragma.member_name_exceptions = _check(name, value)
         else:
             raise QAPISemError(info, "unknown pragma '%s'" % name)
 
-- 
2.30.2



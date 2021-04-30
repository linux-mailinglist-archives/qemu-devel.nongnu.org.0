Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6071036FAE2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:49:30 +0200 (CEST)
Received: from localhost ([::1]:39406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSaH-0001Un-E6
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdj-0003As-5n
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRda-0007f4-8t
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q7MwkBRcS4OYnctBGXwpmy9Ekf252cnk2QdcqynuEs4=;
 b=hWYwlldkY+cFWLAbSc/4QMtwQ1YNmax8X21K0imNOnbevqJilucYt2IzF08caT/aF0BOiA
 96JHDJsl8y+YNwA5/B+mHu2Kvne37HZkse+WrEtpbJ8SgI2VBjEPnLfMlb9DuTajstx3JY
 uXHgSnl6VKlXwC8u5kxXC6CsWDu2/ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-BOZGt-R6Py6-foJilpUu_A-1; Fri, 30 Apr 2021 07:48:44 -0400
X-MC-Unique: BOZGt-R6Py6-foJilpUu_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CA4D107ACE6;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E3765F707;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C888E1125643; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/25] qapi/error.py: move QAPIParseError to parser.py
Date: Fri, 30 Apr 2021 13:48:35 +0200
Message-Id: <20210430114838.2912740-23-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Keeping it in error.py will create some cyclic import problems when we
add types to the QAPISchemaParser. Callers don't need to know the
details of QAPIParseError unless they are parsing or dealing directly
with the parser, so this won't create any harsh new requirements for
callers in the general case.

Update error.py with a little docstring that gives a nod to where the
error may now be found.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421192233.3542904-6-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/error.py  | 22 ++++++++--------------
 scripts/qapi/parser.py | 14 +++++++++++++-
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index d0bc7af6e7..6723c5a9d9 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -1,7 +1,5 @@
 # -*- coding: utf-8 -*-
 #
-# QAPI error classes
-#
 # Copyright (c) 2017-2019 Red Hat Inc.
 #
 # Authors:
@@ -11,6 +9,14 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
+"""
+QAPI error classes
+
+Common error classes used throughout the package.  Additional errors may
+be defined in other modules.  At present, `QAPIParseError` is defined in
+parser.py.
+"""
+
 
 class QAPIError(Exception):
     """Base class for all exceptions from the QAPI package."""
@@ -33,17 +39,5 @@ def __str__(self):
         return loc + ': ' + self.msg
 
 
-class QAPIParseError(QAPISourceError):
-    """Error class for all QAPI schema parsing errors."""
-    def __init__(self, parser, msg):
-        col = 1
-        for ch in parser.src[parser.line_pos:parser.pos]:
-            if ch == '\t':
-                col = (col + 7) % 8 + 1
-            else:
-                col += 1
-        super().__init__(parser.info, msg, col)
-
-
 class QAPISemError(QAPISourceError):
     """Error class for semantic QAPI errors."""
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 58267c3db9..ca5e8e18e0 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -18,10 +18,22 @@
 import os
 import re
 
-from .error import QAPIParseError, QAPISemError
+from .error import QAPISemError, QAPISourceError
 from .source import QAPISourceInfo
 
 
+class QAPIParseError(QAPISourceError):
+    """Error class for all QAPI schema parsing errors."""
+    def __init__(self, parser, msg):
+        col = 1
+        for ch in parser.src[parser.line_pos:parser.pos]:
+            if ch == '\t':
+                col = (col + 7) % 8 + 1
+            else:
+                col += 1
+        super().__init__(parser.info, msg, col)
+
+
 class QAPISchemaParser:
 
     def __init__(self, fname, previously_included=None, incl_info=None):
-- 
2.26.3



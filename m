Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACD4367370
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 21:28:18 +0200 (CEST)
Received: from localhost ([::1]:56758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZIWH-0000T4-9F
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 15:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZIQz-0003ql-SS
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZIQy-0005aZ-1h
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619032967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EW3Kri7fJM7UoCzllKDsdwY/tpGuX1B83+UwKw9TpzE=;
 b=VWjsgDsMXImVm3ilz6qfSLn/QsjKZ1TooWaPwBOhoZOM0DsnvNRmr61UYXCBiXnPkvz4W0
 8fKY9yQiaXU7FCYjrYvgrmdrKaFDSXwwKV/sBpS8IVbQM8G/1lr05XwegdzzGqPuE4VMdX
 jqixSicnZDmwhxZ3Z4NZELkxD0qqE5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-m5HAR9SqMNuEen7JqLG_ug-1; Wed, 21 Apr 2021 15:22:40 -0400
X-MC-Unique: m5HAR9SqMNuEen7JqLG_ug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A780B87A83C;
 Wed, 21 Apr 2021 19:22:39 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D88BA5C1B4;
 Wed, 21 Apr 2021 19:22:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 5/8] qapi/error.py: move QAPIParseError to parser.py
Date: Wed, 21 Apr 2021 15:22:30 -0400
Message-Id: <20210421192233.3542904-6-jsnow@redhat.com>
In-Reply-To: <20210421192233.3542904-1-jsnow@redhat.com>
References: <20210421192233.3542904-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keeping it in error.py will create some cyclic import problems when we
add types to the QAPISchemaParser. Callers don't need to know the
details of QAPIParseError unless they are parsing or dealing directly
with the parser, so this won't create any harsh new requirements for
callers in the general case.

Update error.py with a little docstring that gives a nod to where the
error may now be found.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/error.py  | 22 ++++++++--------------
 scripts/qapi/parser.py | 14 +++++++++++++-
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index d0bc7af6e76..6723c5a9d9a 100644
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
index 58267c3db9e..ca5e8e18e00 100644
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
2.30.2



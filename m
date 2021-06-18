Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DCC3AC8E5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:32:52 +0200 (CEST)
Received: from localhost ([::1]:52926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBnv-0006Lx-Fa
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBi4-00067S-6v
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:26:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBhx-0000h5-1d
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624011999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9SEJTDJSgZf9o2xa0A2PNSEmobUPnSUh8g0OI4fucUo=;
 b=jUKvzsFlGHqPdom0cJlaAPKQX1YUP9T31WuPzp3RwYYV2mvAEHFA+Hh4E/h4pY5pH9hv9g
 yaB/WA6FWsuyl6p7rq7V1towLbh0fz21uNni5EBG5ybytfv54Ge4oyTnMF+JQyiT/xTGoD
 LAQIccy5SFrOz7QJKduO5ovhPEAQMmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-hkK_dzEaOzueuA98w2V_yg-1; Fri, 18 Jun 2021 06:26:38 -0400
X-MC-Unique: hkK_dzEaOzueuA98w2V_yg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A5A8100CEC0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:26:37 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0500E694D6;
 Fri, 18 Jun 2021 10:26:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/11] qapidoc: introduce QAPISchemaIfCond.docgen()
Date: Fri, 18 Jun 2021 14:25:02 +0400
Message-Id: <20210618102507.3761128-7-marcandre.lureau@redhat.com>
In-Reply-To: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Instead of building the condition documentation from a list of string,
use the result generated from QAPISchemaIfCond.docgen().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/sphinx/qapidoc.py | 14 ++++++++------
 scripts/qapi/common.py |  6 ++++++
 scripts/qapi/schema.py | 10 +++++++++-
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index 511520f33f..d791b59492 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -112,17 +112,19 @@ def _make_section(self, title):
     def _nodes_for_ifcond(self, ifcond, with_if=True):
         """Return list of Text, literal nodes for the ifcond
 
-        Return a list which gives text like ' (If: cond1, cond2, cond3)', where
-        the conditions are in literal-text and the commas are not.
+        Return a list which gives text like ' (If: condition)'.
         If with_if is False, we don't return the "(If: " and ")".
         """
-        condlist = intersperse([nodes.literal('', c) for c in ifcond.ifcond],
-                               nodes.Text(', '))
+
+        doc = ifcond.docgen()
+        if not doc:
+            return []
+        doc = nodes.literal('', doc)
         if not with_if:
-            return condlist
+            return [doc]
 
         nodelist = [nodes.Text(' ('), nodes.strong('', 'If: ')]
-        nodelist.extend(condlist)
+        nodelist.append(doc)
         nodelist.append(nodes.Text(')'))
         return nodelist
 
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index ba9fe14e4b..5181a0f167 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -205,6 +205,12 @@ def cgen_ifcond(ifcond: Union[str, List[str]]) -> str:
     return '(' + ') && ('.join(ifcond) + ')'
 
 
+def docgen_ifcond(ifcond: Union[str, List[str]]) -> str:
+    if not ifcond:
+        return ''
+    return ' and '.join(ifcond)
+
+
 def gen_if(cond: str) -> str:
     if not cond:
         return ''
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 70120f0dcc..30d6a01ad1 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -19,7 +19,12 @@
 import re
 from typing import Optional
 
-from .common import POINTER_SUFFIX, c_name, cgen_ifcond
+from .common import (
+    POINTER_SUFFIX,
+    c_name,
+    cgen_ifcond,
+    docgen_ifcond,
+)
 from .error import QAPIError, QAPISemError, QAPISourceError
 from .expr import check_exprs
 from .parser import QAPISchemaParser
@@ -32,6 +37,9 @@ def __init__(self, ifcond=None):
     def cgen(self):
         return cgen_ifcond(self.ifcond)
 
+    def docgen(self):
+        return docgen_ifcond(self.ifcond)
+
     def is_present(self):
         return bool(self.ifcond)
 
-- 
2.29.0



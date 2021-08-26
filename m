Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1263F87BB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 14:39:27 +0200 (CEST)
Received: from localhost ([::1]:58730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJEf6-00030u-SJ
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 08:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYm-0004Aj-D7
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYh-0008Bc-UD
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629981154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1+I+ZEjd1RdE1fUCXAXh/uFGkFrTb3/VKlu+KCr0xc=;
 b=K1FWrG17vZslsZfiqs2toben1y2stKGkGlr8zUajg07tZ8PURp5nC68yxylHuj37CMVyCu
 Ib36pxtVI9WFD3Q6L9bbr9GE7qp2NM9x2bWIWOUooFjGLnAQboMAQdFhOkeg3Af7seMcNv
 1NxhCssQpiI9IvLiAgqpob7W4Y3NtbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-6hBjrGc2NzaBHi2Q-Yl58w-1; Thu, 26 Aug 2021 08:32:33 -0400
X-MC-Unique: 6hBjrGc2NzaBHi2Q-Yl58w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63DE61008065;
 Thu, 26 Aug 2021 12:32:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCDD160583;
 Thu, 26 Aug 2021 12:32:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA35A11380B9; Thu, 26 Aug 2021 14:32:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/11] qapidoc: introduce QAPISchemaIfCond.docgen()
Date: Thu, 26 Aug 2021 14:32:20 +0200
Message-Id: <20210826123225.157891-7-armbru@redhat.com>
In-Reply-To: <20210826123225.157891-1-armbru@redhat.com>
References: <20210826123225.157891-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Instead of building the condition documentation from a list of string,
use the result generated from QAPISchemaIfCond.docgen().

This changes the generated documentation from:
- COND1, COND2... (where COND1, COND2 are Literal nodes, and ',' is Text)
to:
- COND1 and COND2 (the whole string as a Literal node)

This will allow us to generate more complex conditions in the following
patches, such as "(COND1 and COND2) or COND3".

Adding back the differentiated formatting is left to the wish list.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210804083105.97531-6-marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[TODO comment added]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/sphinx/qapidoc.py | 14 ++++++++------
 scripts/qapi/common.py |  7 +++++++
 scripts/qapi/schema.py | 10 +++++++++-
 3 files changed, 24 insertions(+), 7 deletions(-)

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
index ba9fe14e4b..ddc54e4368 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -205,6 +205,13 @@ def cgen_ifcond(ifcond: Union[str, List[str]]) -> str:
     return '(' + ') && ('.join(ifcond) + ')'
 
 
+def docgen_ifcond(ifcond: Union[str, List[str]]) -> str:
+    # TODO Doc generated for conditions needs polish
+    if not ifcond:
+        return ''
+    return ' and '.join(ifcond)
+
+
 def gen_if(cond: str) -> str:
     if not cond:
         return ''
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 4ea7e88846..a9345af7b7 100644
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
2.31.1



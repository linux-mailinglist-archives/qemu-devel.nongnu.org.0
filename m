Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C65345B52
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:49:30 +0100 (CET)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdfF-0004yW-B5
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWl-0001TA-SI
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWg-00020b-VF
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yxeiVpJ4BBOHX6CUOgpOOgzvcuDE6bPGHKjhWkwc49U=;
 b=G9LM7yx9CcHb3cwfLI3Z5uq8uuCIFU2yOQZ8qD2LQ0z41woO+/Fdi7SHI30IM7VMS7fWjX
 wCAYgrwwP/dls64mvKLpcGWpyP5DAbYP4Rw4VCqTVc4zbopl+RwD3ekh/MzvFP+fZ20bXa
 D8/pEfx5wPaTD9qFkpqftoG/a4+M3Bc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-pcqwmNGUPrq6BxtdnFYJDQ-1; Tue, 23 Mar 2021 05:40:36 -0400
X-MC-Unique: pcqwmNGUPrq6BxtdnFYJDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15865190A7A5;
 Tue, 23 Mar 2021 09:40:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E33852A2EE;
 Tue, 23 Mar 2021 09:40:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E675211326A3; Tue, 23 Mar 2021 10:40:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/28] qapi: Factor out
 QAPISchemaParser._check_pragma_list_of_str()
Date: Tue, 23 Mar 2021 10:40:13 +0100
Message-Id: <20210323094025.3569441-17-armbru@redhat.com>
In-Reply-To: <20210323094025.3569441-1-armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: jsnow@redhat.com, michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 116afe549a..8eed69333f 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -119,6 +119,13 @@ def _include(self, include, info, incl_fname, previously_included):
 
         return QAPISchemaParser(incl_fname, previously_included, info)
 
+    def _check_pragma_list_of_str(self, name, value, info):
+        if (not isinstance(value, list)
+                or any([not isinstance(elt, str) for elt in value])):
+            raise QAPISemError(
+                info,
+                "pragma %s must be a list of strings" % name)
+
     def _pragma(self, name, value, info):
         if name == 'doc-required':
             if not isinstance(value, bool):
@@ -126,18 +133,10 @@ def _pragma(self, name, value, info):
                                    "pragma 'doc-required' must be boolean")
             info.pragma.doc_required = value
         elif name == 'returns-whitelist':
-            if (not isinstance(value, list)
-                    or any([not isinstance(elt, str) for elt in value])):
-                raise QAPISemError(
-                    info,
-                    "pragma returns-whitelist must be a list of strings")
+            self._check_pragma_list_of_str(name, value, info)
             info.pragma.returns_whitelist = value
         elif name == 'name-case-whitelist':
-            if (not isinstance(value, list)
-                    or any([not isinstance(elt, str) for elt in value])):
-                raise QAPISemError(
-                    info,
-                    "pragma name-case-whitelist must be a list of strings")
+            self._check_pragma_list_of_str(name, value, info)
             info.pragma.name_case_whitelist = value
         else:
             raise QAPISemError(info, "unknown pragma '%s'" % name)
-- 
2.26.3



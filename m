Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B7D38B5E4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 20:20:18 +0200 (CEST)
Received: from localhost ([::1]:34432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljnHN-0005Iy-NU
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 14:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmrU-0002q9-KG
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmr3-0006d0-Cl
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621533184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIjrC4I2gBVvk4OuX/ExltCFxOjqL0VWvWQ2KCvQJ/Y=;
 b=Hxfc8E34z4y6bdjMotIHzOAgaS1PDGt+4h/9fCzVc/UiPmrjaazsDeDKpakkLyJwoXgOLI
 aNcdUfGo2tWP53PID7iy5AI33ljp6lGiWWwksnN3xbvkUNvrO8gwhDaK9949qTPBIk+I9U
 axDHFuTwBuvfylgnF1D9wgpBURY6YFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-tOzloE1fPkuL_zArRs-2lA-1; Thu, 20 May 2021 13:52:58 -0400
X-MC-Unique: tOzloE1fPkuL_zArRs-2lA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9437801B15;
 Thu, 20 May 2021 17:52:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A4D75C261;
 Thu, 20 May 2021 17:52:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 42F3C1138461; Thu, 20 May 2021 19:52:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] qapi/parser: factor parsing routine into method
Date: Thu, 20 May 2021 19:52:45 +0200
Message-Id: <20210520175256.1119684-5-armbru@redhat.com>
In-Reply-To: <20210520175256.1119684-1-armbru@redhat.com>
References: <20210520175256.1119684-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For the sake of keeping __init__ smaller (and treating it more like a
gallery of what state variables we can expect to see), put the actual
parsing action into a parse method. It remains invoked from the init
method to reduce churn.

To accomplish this, @previously_included becomes the private data
member ._included, and the filename is stashed as ._fname.

Add any missing declarations to the init method, and group them by
function so they can be understood quickly at a glance.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210519183951.3946870-5-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 39dbcc4eac..d620706fff 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -37,23 +37,39 @@ def __init__(self, parser, msg):
 class QAPISchemaParser:
 
     def __init__(self, fname, previously_included=None, incl_info=None):
-        previously_included = previously_included or set()
-        previously_included.add(os.path.abspath(fname))
+        self._fname = fname
+        self._included = previously_included or set()
+        self._included.add(os.path.abspath(self._fname))
+        self.src = ''
 
-        # May raise OSError; allow the caller to handle it.
-        with open(fname, 'r', encoding='utf-8') as fp:
-            self.src = fp.read()
-
-        if self.src == '' or self.src[-1] != '\n':
-            self.src += '\n'
+        # Lexer state (see `accept` for details):
+        self.info = QAPISourceInfo(self._fname, incl_info)
+        self.tok = None
+        self.pos = 0
         self.cursor = 0
-        self.info = QAPISourceInfo(fname, incl_info)
+        self.val = None
         self.line_pos = 0
+
+        # Parser output:
         self.exprs = []
         self.docs = []
-        self.accept()
+
+        # Showtime!
+        self._parse()
+
+    def _parse(self):
         cur_doc = None
 
+        # May raise OSError; allow the caller to handle it.
+        with open(self._fname, 'r', encoding='utf-8') as fp:
+            self.src = fp.read()
+        if self.src == '' or self.src[-1] != '\n':
+            self.src += '\n'
+
+        # Prime the lexer:
+        self.accept()
+
+        # Parse until done:
         while self.tok is not None:
             info = self.info
             if self.tok == '#':
@@ -71,12 +87,12 @@ def __init__(self, fname, previously_included=None, incl_info=None):
                 if not isinstance(include, str):
                     raise QAPISemError(info,
                                        "value of 'include' must be a string")
-                incl_fname = os.path.join(os.path.dirname(fname),
+                incl_fname = os.path.join(os.path.dirname(self._fname),
                                           include)
                 self.exprs.append({'expr': {'include': incl_fname},
                                    'info': info})
                 exprs_include = self._include(include, info, incl_fname,
-                                              previously_included)
+                                              self._included)
                 if exprs_include:
                     self.exprs.extend(exprs_include.exprs)
                     self.docs.extend(exprs_include.docs)
-- 
2.26.3



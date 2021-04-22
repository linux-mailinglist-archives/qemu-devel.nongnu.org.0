Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3693677D0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:15:41 +0200 (CEST)
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPoa-0006sD-A2
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgv-0006Mz-Gf
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgh-0006Rv-KB
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBSpPHs0AsRbpBEzwdSQYY7vEN3RjpPhj0epOcml6Oc=;
 b=DcvxABnlc8YMWHQVqidabPGDiAHoDTFpSVEOFRGbRUA2F2JEHfo8pFtMOzkjX+Sda/29Vv
 CR83AnUbZJdm3E4Xhx2OHjJLEHOQlhIUmkqNDqGMmotJMalORc0J9hXWKIBMl6A5gLfkHh
 raCAFtgZiBCULaTi2C5vpnakmj3U5Y0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-jbIavhwqMH-3DeRISyuhDQ-1; Wed, 21 Apr 2021 23:07:25 -0400
X-MC-Unique: jbIavhwqMH-3DeRISyuhDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E580A107ACCD;
 Thu, 22 Apr 2021 03:07:24 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 347AC607CB;
 Thu, 22 Apr 2021 03:07:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/22] qapi/parser: factor parsing routine into method
Date: Wed, 21 Apr 2021 23:07:02 -0400
Message-Id: <20210422030720.3685766-5-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

For the sake of keeping __init__ smaller (and treating it more like a
gallery of what state variables we can expect to see), put the actual
parsing action into a parse method. We can still invoke it from the init
method to reduce churn.

To accomplish this, 'previously_included' because the private data
member '_included', and the filename is stashed as _fname.

Add any missing declarations to the init method, and group them by
function so they can be understood quickly at a glance.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index edd0af33ae0..f519518075e 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -37,23 +37,38 @@ def __init__(self, parser, msg):
 class QAPISchemaParser:
 
     def __init__(self, fname, previously_included=None, incl_info=None):
-        previously_included = previously_included or set()
-        previously_included.add(os.path.abspath(fname))
+        self._fname = fname
+        self._included = previously_included or set()
+        self._included.add(os.path.abspath(self._fname))
+        self.src = ''
 
-        # Allow the caller to catch this error.
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
@@ -71,12 +86,12 @@ def __init__(self, fname, previously_included=None, incl_info=None):
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
2.30.2



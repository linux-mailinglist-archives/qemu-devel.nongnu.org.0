Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E641537B159
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:08:32 +0200 (CEST)
Received: from localhost ([::1]:45046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgaYJ-0001ux-To
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW4-0007M6-QG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW2-0006O3-5f
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAUt9ep2U9+NRGrcfgncJ14WoGsv9dOEug/5liuMNFs=;
 b=NIe1lizNChlWw37Zc26FBL4zetaM/tCoX0OkKIoBK1+1iDVh0/vgvQdNovV15OhMbFqtZn
 lRCXpDk4onziZmdTvviPPq4f9dfQH77WZMNIGB0x62J5ZJReLfBj+O36qPF/qqwnKXaG8D
 i7YhxvwLNQk1IIyLFOWhpPitweQuNBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-PpaUFrZ2M62VCTA3t9dhIw-1; Tue, 11 May 2021 18:06:06 -0400
X-MC-Unique: PpaUFrZ2M62VCTA3t9dhIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC626107ACE3;
 Tue, 11 May 2021 22:06:05 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20FDB60CC9;
 Tue, 11 May 2021 22:06:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/21] qapi/parser: factor parsing routine into method
Date: Tue, 11 May 2021 18:05:44 -0400
Message-Id: <20210511220601.2110055-5-jsnow@redhat.com>
In-Reply-To: <20210511220601.2110055-1-jsnow@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the sake of keeping __init__ smaller (and treating it more like a
gallery of what state variables we can expect to see), put the actual
parsing action into a parse method. It remains invoked from the init
method to reduce churn.

To accomplish this, 'previously_included' becomes the private data
member '_included', and the filename is stashed as _fname.

Add any missing declarations to the init method, and group them by
function so they can be understood quickly at a glance.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 39dbcc4eacc..d620706fffb 100644
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
2.30.2



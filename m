Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178CB34EF75
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 19:27:57 +0200 (CEST)
Received: from localhost ([::1]:43320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRI9k-00029p-6m
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 13:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lRI1D-0000J8-G1
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lRI19-0003ZU-3v
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617124738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WnVIpPwaZAR/evFnFyQWgIANQrh0sUYrPklTXugkzrI=;
 b=VIsynqUP5KvVy+fc2lSrcI8T803iq80vuBKfCEh6MfqSLrpDlrdkDYMFjSHg2Izg284cxQ
 J3u1uZMF7JaCb7G0aeAQzh8TRXBf5xnFcGItgad6JqoLOvf6UoagRLaCkf31w1eL1jGFOh
 2y8IZXxA5c6nqc8Aw6RcJWQPhalRtlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-0KQrk5O5OMCWFzYcfjdpag-1; Tue, 30 Mar 2021 13:18:54 -0400
X-MC-Unique: 0KQrk5O5OMCWFzYcfjdpag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A4BD8026AD;
 Tue, 30 Mar 2021 17:18:53 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1629560861;
 Tue, 30 Mar 2021 17:18:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 5/8] qapi/error.py: move QAPIParseError to parser.py
Date: Tue, 30 Mar 2021 13:18:41 -0400
Message-Id: <20210330171844.1197918-6-jsnow@redhat.com>
In-Reply-To: <20210330171844.1197918-1-jsnow@redhat.com>
References: <20210330171844.1197918-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keeping it in error.py will create some cyclic import problems when we
add types to the QAPISchemaParser. Callers don't need to know the
details of QAPIParseError unless they are parsing or dealing directly
with the parser, so this won't create any harsh new requirements for
callers in the general case.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/error.py  | 12 ------------
 scripts/qapi/parser.py | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index d0bc7af6e7..2183b8c6b7 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -33,17 +33,5 @@ def __str__(self):
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
index d5bf91f2b0..140f582ad9 100644
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



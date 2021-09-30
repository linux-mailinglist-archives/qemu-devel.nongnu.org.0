Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E8041E2F9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 23:05:56 +0200 (CEST)
Received: from localhost ([::1]:55768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW3Fb-0006pA-3h
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 17:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37U-0006yA-AR
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37R-0008WD-MU
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633035448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjX8mxuTEAZ9UunXBwdfn3+qU4GJyKnM5z2g4e1x4bs=;
 b=BdTTC5VYkMYZpYBhDcIOwfG6tuJtLsOCxHYaiYN8Emya+tkJCBWJ19U7KLQ2sP36FwCq5O
 +51erM9WsZcTvOr6rlb6rmEdqHt5d1n77Qg3D5KcULsOXnzrvtbd/wugNGfqUwL/a32yZh
 Y3eXEbcLOrgNvOVCwU/U/dDwYwpyWyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-2HeouSo1MFiKJRAIWInDow-1; Thu, 30 Sep 2021 16:57:27 -0400
X-MC-Unique: 2HeouSo1MFiKJRAIWInDow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 920081007908;
 Thu, 30 Sep 2021 20:57:25 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8578B60938;
 Thu, 30 Sep 2021 20:57:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/13] qapi/parser: clarify _end_section() logic
Date: Thu, 30 Sep 2021 16:57:09 -0400
Message-Id: <20210930205716.1148693-7-jsnow@redhat.com>
In-Reply-To: <20210930205716.1148693-1-jsnow@redhat.com>
References: <20210930205716.1148693-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "if self._section" clause in end_section is mysterious: In which
circumstances might we end a section when we don't have one?

QAPIDoc always expects there to be a "current section", only except
after a call to end_comment(). This actually *shouldn't* ever be 'None',
so let's remove that logic so I don't wonder why it's like this again in
three months.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 23898ab1dcd..82f1d952b13 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -718,13 +718,21 @@ def _start_section(self, name=None, indent=0):
         self.sections.append(self._section)
 
     def _end_section(self):
-        if self._section:
-            text = self._section.text = self._section.text.strip()
-            if self._section.name and (not text or text.isspace()):
-                raise QAPIParseError(
-                    self._parser,
-                    "empty doc section '%s'" % self._section.name)
-            self._section = None
+        assert self._section is not None
+
+        text = self._section.text = self._section.text.strip()
+
+        # Only the 'body' section is allowed to have an empty body.
+        # All other sections, including anonymous ones, must have text.
+        if self._section != self.body and not text:
+            # We do not create anonymous sections unless there is
+            # something to put in them; this is a parser bug.
+            assert self._section.name
+            raise QAPIParseError(
+                self._parser,
+                "empty doc section '%s'" % self._section.name)
+
+        self._section = None
 
     def _append_freeform(self, line):
         match = re.match(r'(@\S+:)', line)
-- 
2.31.1



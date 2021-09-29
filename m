Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E941CCF1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:54:10 +0200 (CEST)
Received: from localhost ([::1]:37994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfeb-00050h-Bx
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfWK-0007hY-CZ
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfWI-0006Zd-Oe
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4kLbZrRFkZsyh/na6cTKsezjy+ayXpcMxZvdGtgNfyE=;
 b=FwQQT+FVYum0VTyHk+9kHmiV1y1CEMTwy898pYbLN/vTJduFnFNuD9bcNxpjcT0ao/BQTV
 UWSvNFHaFzuOlprFPAJimZOUcmTyyZ+GkGQ5N5Tcg0uGBn0gjxXR9bdbP5MrLDhr9LyusB
 8BjCjTvCjYBU77OPURzQiVMMXNwp5r0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-ltjnYfGFMG227h6VvtreWQ-1; Wed, 29 Sep 2021 15:45:33 -0400
X-MC-Unique: ltjnYfGFMG227h6VvtreWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B02E0824FB2;
 Wed, 29 Sep 2021 19:45:11 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD7BF1972D;
 Wed, 29 Sep 2021 19:45:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/13] qapi/parser: Simplify _end_section()
Date: Wed, 29 Sep 2021 15:44:22 -0400
Message-Id: <20210929194428.1038496-8-jsnow@redhat.com>
In-Reply-To: <20210929194428.1038496-1-jsnow@redhat.com>
References: <20210929194428.1038496-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
index 52748e8e462..1fdc5bc7056 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -721,13 +721,21 @@ def _start_section(self, name=None, indent=0):
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



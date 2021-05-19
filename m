Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810BB3896D6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:39:07 +0200 (CEST)
Received: from localhost ([::1]:41926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljS26-0001TM-74
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljRh9-0001Fx-3G
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:17:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljRh7-0005R2-AW
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621451844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uF/EpQitQKNkZn1ZK7H/xxOUXchsklFRlM+Lhot5zdA=;
 b=G0kWiJ8Iih/JEaztv0CFJQSgV5HBV1GwzZa2yp6uwFrISh9WIusZsvWTDVKENfz8+XfjIJ
 jiAq94LNlI8QB1nrfgAJ6lqho6KYa2ri/7LFInFhyA2hUa7dxUQ/SdaYStg8z0qq+jaesg
 b9l6sHyuIL1o2u2SkjdgF8ttDzKEmRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-wAs0aJ5CPt2zjjZ-F2drxg-1; Wed, 19 May 2021 15:17:22 -0400
X-MC-Unique: wAs0aJ5CPt2zjjZ-F2drxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFD1F801B21;
 Wed, 19 May 2021 19:17:21 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4114A5D9CC;
 Wed, 19 May 2021 19:17:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] qapi/parser: Allow empty QAPIDoc Sections
Date: Wed, 19 May 2021 15:17:14 -0400
Message-Id: <20210519191718.3950330-3-jsnow@redhat.com>
In-Reply-To: <20210519191718.3950330-1-jsnow@redhat.com>
References: <20210519191718.3950330-1-jsnow@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It simplifies the typing to say that _section is always a
QAPIDoc.Section().

To accommodate this change, we must allow for this object to evaluate to
False for functions like _end_section which behave differently based on
whether or not a Section has been started.

Signed-off-by: John Snow <jsnow@redhat.com>

---

Probably a better fix is to restructure the code to prevent
_end_section() from being called twice in a row, but that seemed like
more effort, but if you have suggestions for a tactical fix, I'm open to
it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index b3a468504fc..71e982bff57 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -456,6 +456,9 @@ def __init__(self, parser, name=None, indent=0):
             # the expected indent level of the text of this section
             self._indent = indent
 
+        def __bool__(self) -> bool:
+            return bool(self.name or self.text)
+
         def append(self, line):
             # Strip leading spaces corresponding to the expected indent level
             # Blank lines are always OK.
@@ -722,7 +725,7 @@ def _end_section(self):
                 raise QAPIParseError(
                     self._parser,
                     "empty doc section '%s'" % self._section.name)
-            self._section = None
+            self._section = QAPIDoc.Section(self._parser)
 
     def _append_freeform(self, line):
         match = re.match(r'(@\S+:)', line)
-- 
2.30.2



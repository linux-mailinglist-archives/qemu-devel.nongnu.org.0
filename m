Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ED438B9F1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 01:02:46 +0200 (CEST)
Received: from localhost ([::1]:33484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljrgj-00079z-DJ
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 19:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljrbe-0006lU-M6
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:57:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljrbS-0005pP-2K
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621551437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZuN9+wGrFGJBjwv9ZfJuudGHWkBH3ROY9IYtCNYRyxM=;
 b=gRE4l4VqC9JdVUIQeot3/aMsyWgeEJrGlakO1RhORwEk5tq1PWixzp5jedvQS2uarg16Ly
 is6hq+eDtnN1ujhfEbNQUFvJtFZSytYoRgMiJGMPamI7N0SZ6j3JLcsaXVhgFzWUybLAcu
 1NDBmCJYX+SRaAQ9bJ8bRVRRuHNV3+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-6FnO3rMKMfuLrq_jnBx4Nw-1; Thu, 20 May 2021 18:57:15 -0400
X-MC-Unique: 6FnO3rMKMfuLrq_jnBx4Nw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F20F81854E20;
 Thu, 20 May 2021 22:57:14 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E794100164A;
 Thu, 20 May 2021 22:57:14 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] qapi/parser: Allow empty QAPIDoc Sections
Date: Thu, 20 May 2021 18:57:06 -0400
Message-Id: <20210520225710.168356-3-jsnow@redhat.com>
In-Reply-To: <20210520225710.168356-1-jsnow@redhat.com>
References: <20210520225710.168356-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
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

Probably a better fix is to restructure the code to prevent empty
sections from being "ended", but that seems like a bigger whale than
what I'm after at the immediate moment.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index b6a5e661215..3ddde318376 100644
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



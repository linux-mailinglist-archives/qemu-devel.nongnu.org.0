Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3B332EE83
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:22:07 +0100 (CET)
Received: from localhost ([::1]:44356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICHG-0004VL-Rx
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIC7R-0000Lg-4O
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:11:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIC7J-0000Xn-Qk
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614957108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjqVoLn2Kp31wT8P+UKELG1yEY+VGQv+opU+hLJzeXM=;
 b=i5aw5jfuJ1A7+3XlztFlierE3fu9Gv8Z/dYAyHcgC3aIZS2z1NcU3UA71Bs8q5VZ1/z14G
 N8Q0YBrh8DBGDLyFplmXueKXeHRzIqjCRAmBN+IIIPMxZZpQzZp9hRo5FQlByaGS67acQt
 iNClIJtsQmVHj7qTXPpdC3Vf37/O2/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-n-yz70HyPdigceF5D5kkyA-1; Fri, 05 Mar 2021 10:11:46 -0500
X-MC-Unique: n-yz70HyPdigceF5D5kkyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B68110866A3;
 Fri,  5 Mar 2021 15:11:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CD455D71D;
 Fri,  5 Mar 2021 15:11:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 90B7A1141CBD; Fri,  5 Mar 2021 16:11:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] qapi: Fix parse errors for removal of null from schema
 language
Date: Fri,  5 Mar 2021 16:11:43 +0100
Message-Id: <20210305151143.741181-5-armbru@redhat.com>
In-Reply-To: <20210305151143.741181-1-armbru@redhat.com>
References: <20210305151143.741181-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: John Snow <jsnow@redhat.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 9d55380b5a "qapi: Remove null from schema language" (v4.2.0)
neglected to update two error messages.  Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210224101442.1837475-1-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py                    | 8 ++++----
 tests/qapi-schema/leading-comma-list.err  | 2 +-
 tests/qapi-schema/trailing-comma-list.err | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index e7b9d670ad..116afe549a 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -236,9 +236,9 @@ def get_values(self):
         if self.tok == ']':
             self.accept()
             return expr
-        if self.tok not in "{['tfn":
+        if self.tok not in "{['tf":
             raise QAPIParseError(
-                self, "expected '{', '[', ']', string, boolean or 'null'")
+                self, "expected '{', '[', ']', string, or boolean")
         while True:
             expr.append(self.get_expr(True))
             if self.tok == ']':
@@ -257,12 +257,12 @@ def get_expr(self, nested):
         elif self.tok == '[':
             self.accept()
             expr = self.get_values()
-        elif self.tok in "'tfn":
+        elif self.tok in "'tf":
             expr = self.val
             self.accept()
         else:
             raise QAPIParseError(
-                self, "expected '{', '[', string, boolean or 'null'")
+                self, "expected '{', '[', string, or boolean")
         return expr
 
     def get_doc(self, info):
diff --git a/tests/qapi-schema/leading-comma-list.err b/tests/qapi-schema/leading-comma-list.err
index 76eed2b5b3..0725d6529f 100644
--- a/tests/qapi-schema/leading-comma-list.err
+++ b/tests/qapi-schema/leading-comma-list.err
@@ -1 +1 @@
-leading-comma-list.json:2:13: expected '{', '[', ']', string, boolean or 'null'
+leading-comma-list.json:2:13: expected '{', '[', ']', string, or boolean
diff --git a/tests/qapi-schema/trailing-comma-list.err b/tests/qapi-schema/trailing-comma-list.err
index ad2f2d7c97..bb5f8c3c90 100644
--- a/tests/qapi-schema/trailing-comma-list.err
+++ b/tests/qapi-schema/trailing-comma-list.err
@@ -1 +1 @@
-trailing-comma-list.json:2:36: expected '{', '[', string, boolean or 'null'
+trailing-comma-list.json:2:36: expected '{', '[', string, or boolean
-- 
2.26.2



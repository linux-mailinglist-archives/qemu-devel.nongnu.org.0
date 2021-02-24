Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF241323A4B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:16:32 +0100 (CET)
Received: from localhost ([::1]:50338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErDb-0003gn-QC
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:16:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lErBx-0003Be-BW
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:14:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lErBv-0001ID-UT
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614161687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4EBnZv4L3vq+WNCnjXD6sb+RlgjEo0Wn3cB7kpqsLJo=;
 b=bCwjEencPR9vg4nVXlO6EpytnnI7pIZWkiwA8Zh64vv8Y6w/+qUw7KBV4zYdsuZp5Fvo6i
 bv+QKWM9ulmEb2JVh8cvMBeHdtI07wr5cDnxVDJ4cDwkZMyqwHls5dDVpd/NlPa6HMYKsa
 cY5Alb9I6tBlaJodkav1xmFg5J79HL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-8FHkfvdZMc6iXHZXV2yhzg-1; Wed, 24 Feb 2021 05:14:45 -0500
X-MC-Unique: 8FHkfvdZMc6iXHZXV2yhzg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C8AB801984;
 Wed, 24 Feb 2021 10:14:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C51C3828;
 Wed, 24 Feb 2021 10:14:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C016B113860F; Wed, 24 Feb 2021 11:14:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi: Fix parse errors for removal of null from schema
 language
Date: Wed, 24 Feb 2021 11:14:42 +0100
Message-Id: <20210224101442.1837475-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: michael.roth@amd.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 9d55380b5a "qapi: Remove null from schema language" (v4.2.0)
neglected to update two error messages.  Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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



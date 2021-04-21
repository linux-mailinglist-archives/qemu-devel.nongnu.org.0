Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B868936736E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 21:28:17 +0200 (CEST)
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZIWG-0000Qq-GX
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 15:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZIQw-0003hu-2Q
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZIQr-0005Wg-Tn
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619032961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNjYbJmAWqqsSY03QnHmyUPUGm5MRQ02Y2/NtVK6rIg=;
 b=KV/wr8otm0Xs3m4+pPdz27ElCR8YGh8sKvo2n5ZjnRO5B0YHmVvNMMEq7jWKzbpsjIX9zI
 qrndx2bpEAy8AkZ40zS3/VNE3Qhk4+i8lTVpmblpwHTgv+qJaa4EMrL2BlXNrGYS3QguaL
 tNNT7ZhtCAoaOxTBpsoviqwp4lPDwtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-zMb1oKDsPAWXXj-mx50pYw-1; Wed, 21 Apr 2021 15:22:38 -0400
X-MC-Unique: zMb1oKDsPAWXXj-mx50pYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8094107ACCA;
 Wed, 21 Apr 2021 19:22:37 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8D395C1B4;
 Wed, 21 Apr 2021 19:22:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 3/8] qapi/error: Make QAPISourceError 'col' parameter
 optional
Date: Wed, 21 Apr 2021 15:22:28 -0400
Message-Id: <20210421192233.3542904-4-jsnow@redhat.com>
In-Reply-To: <20210421192233.3542904-1-jsnow@redhat.com>
References: <20210421192233.3542904-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's already treated as optional, with one direct caller and some
subclass callers passing 'None'. Make it officially optional, which
requires moving the position of the argument to come after all required
parameters.

QAPISemError becomes functionally identical to QAPISourceError. Keep the
name to preserve its semantic meaning and avoid code churn, but remove
the now-useless __init__ wrapper.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/error.py  | 8 +++-----
 scripts/qapi/schema.py | 3 +--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index 38bd7c4dd6a..d179a3bd0c7 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -18,11 +18,11 @@ class QAPIError(Exception):
 
 class QAPISourceError(QAPIError):
     """Error class for all exceptions identifying a source location."""
-    def __init__(self, info, col, msg):
+    def __init__(self, info, msg, col=None):
         super().__init__()
         self.info = info
-        self.col = col
         self.msg = msg
+        self.col = col
 
     def __str__(self):
         loc = str(self.info)
@@ -41,10 +41,8 @@ def __init__(self, parser, msg):
                 col = (col + 7) % 8 + 1
             else:
                 col += 1
-        super().__init__(parser.info, col, msg)
+        super().__init__(parser.info, msg, col)
 
 
 class QAPISemError(QAPISourceError):
     """Error class for semantic QAPI errors."""
-    def __init__(self, info, msg):
-        super().__init__(info, None, msg)
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index c277fcacc53..3a4172fb749 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -875,8 +875,7 @@ def _def_entity(self, ent):
         other_ent = self._entity_dict.get(ent.name)
         if other_ent:
             if other_ent.info:
-                where = QAPISourceError(other_ent.info, None,
-                                        "previous definition")
+                where = QAPISourceError(other_ent.info, "previous definition")
                 raise QAPISemError(
                     ent.info,
                     "'%s' is already defined\n%s" % (ent.name, where))
-- 
2.30.2



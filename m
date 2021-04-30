Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024F736FB69
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:26:24 +0200 (CEST)
Received: from localhost ([::1]:57406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcT9s-00037p-AO
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdj-0003AX-15
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRda-0007ev-2v
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6OcT1pIRTkzyuMLuYlD84/27Eczd3vK+NG6JfBu9dY=;
 b=ggZIYXGOivr0eTM+CTXM+/KJB88dYitfcsrc5Uhct46rpoBhW5+aoa9rkAwLvKSnHSLkZ9
 EEAdwmIrHeW4ZHgvpE28LQGhn5pTe9jDlo2EJ+P2H3R3wqVwqwp54uRGNQixcD2+g3IQOR
 y4lJXagyNF4QDB2+QnC8m0QgCA+eG7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-5PCZxb6XMi-nPNrbN_8etA-1; Fri, 30 Apr 2021 07:48:44 -0400
X-MC-Unique: 5PCZxb6XMi-nPNrbN_8etA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B50CA0CB0;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C0461690D;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BCEAA1126833; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/25] qapi/error: Make QAPISourceError 'col' parameter optional
Date: Fri, 30 Apr 2021 13:48:33 +0200
Message-Id: <20210430114838.2912740-21-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

It's already treated as optional, with one direct caller and some
subclass callers passing 'None'. Make it officially optional, which
requires moving the position of the argument to come after all required
parameters.

QAPISemError becomes functionally identical to QAPISourceError. Keep the
name to preserve its semantic meaning and avoid code churn, but remove
the now-useless __init__ wrapper.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421192233.3542904-4-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/error.py  | 8 +++-----
 scripts/qapi/schema.py | 3 +--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index 38bd7c4dd6..d179a3bd0c 100644
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
index c277fcacc5..3a4172fb74 100644
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
2.26.3



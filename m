Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6DD36FB25
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:06:53 +0200 (CEST)
Received: from localhost ([::1]:33422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSr5-0005z8-H6
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdZ-0002oI-V9
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdU-0007an-7P
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDiIZiEjofbfvGZV/7yGhfq/xQtHIP/s27KtMtTDdbI=;
 b=KvK8W7MT1ijgdG2SGI7dZ2RM12tUKz3gRJ5mg623dj1Er/ZALSYtzyW8Tgvgq6aBYqfsZI
 /WKzvoFM1gM8BBKNmniIGqUP+8lHDPSs+dlDL3rlMPrrPz2KMRQjv+kShYLYIV+Aj9IqV3
 sVwXPzpzg9Eyyw96mG1SAsyHkOI9deY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-aBsI9z9-PM6P_f5AbCN2CQ-1; Fri, 30 Apr 2021 07:48:40 -0400
X-MC-Unique: aBsI9z9-PM6P_f5AbCN2CQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29B7F9F92F;
 Fri, 30 Apr 2021 11:48:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB9D017177;
 Fri, 30 Apr 2021 11:48:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7B8FF1132B25; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/25] qapi/expr.py: constrain incoming expression types
Date: Fri, 30 Apr 2021 13:48:17 +0200
Message-Id: <20210430114838.2912740-5-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

mypy does not know the types of values stored in Dicts that masquerade
as objects. Help the type checker out by constraining the type.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421182032.3521476-5-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index b4bbcd54c0..06a0081001 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -15,9 +15,20 @@
 # See the COPYING file in the top-level directory.
 
 import re
+from typing import Dict, Optional
 
 from .common import c_name
 from .error import QAPISemError
+from .parser import QAPIDoc
+from .source import QAPISourceInfo
+
+
+# Deserialized JSON objects as returned by the parser.
+# The values of this mapping are not necessary to exhaustively type
+# here (and also not practical as long as mypy lacks recursive
+# types), because the purpose of this module is to interrogate that
+# type.
+_JSONObject = Dict[str, object]
 
 
 # Names consist of letters, digits, -, and _, starting with a letter.
@@ -315,9 +326,20 @@ def check_event(expr, info):
 
 def check_exprs(exprs):
     for expr_elem in exprs:
-        expr = expr_elem['expr']
-        info = expr_elem['info']
-        doc = expr_elem.get('doc')
+        # Expression
+        assert isinstance(expr_elem['expr'], dict)
+        for key in expr_elem['expr'].keys():
+            assert isinstance(key, str)
+        expr: _JSONObject = expr_elem['expr']
+
+        # QAPISourceInfo
+        assert isinstance(expr_elem['info'], QAPISourceInfo)
+        info: QAPISourceInfo = expr_elem['info']
+
+        # Optional[QAPIDoc]
+        tmp = expr_elem.get('doc')
+        assert tmp is None or isinstance(tmp, QAPIDoc)
+        doc: Optional[QAPIDoc] = tmp
 
         if 'include' in expr:
             continue
-- 
2.26.3



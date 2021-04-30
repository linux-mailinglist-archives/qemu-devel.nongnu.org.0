Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4774136FADA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:46:33 +0200 (CEST)
Received: from localhost ([::1]:59322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSXQ-0006Sh-A5
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdb-0002rr-CZ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdX-0007cH-N6
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwT3F/58naBOGw7YmtkMLSX6g53NOQqEYyZVboPvrsw=;
 b=EfpyTMZOd2+Zh9yYeDEcVK+hGfKTJWT9jo39Y5XmVR8htUt69V9s3VjlPGlpf01ZYHwD2d
 772bMQlikv1BKcKdukZy1aiFw5YPCeYMxNF8EQjMVsAfsJN5A0u7RGUb1MG2I6dGttfw6z
 vwm7pWpSXDLPgZuJoVjzig1/fZwWYKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-eIGRzYaLMKa8rH-sZ-nWCg-1; Fri, 30 Apr 2021 07:48:42 -0400
X-MC-Unique: eIGRzYaLMKa8rH-sZ-nWCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6F32A0BC8;
 Fri, 30 Apr 2021 11:48:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B78CA1690D;
 Fri, 30 Apr 2021 11:48:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 971101142030; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/25] qapi/expr.py: Consolidate check_if_str calls in check_if
Date: Fri, 30 Apr 2021 13:48:24 +0200
Message-Id: <20210430114838.2912740-12-armbru@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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

This is a small rewrite to address some minor style nits.

Don't compare against the empty list to check for the empty condition, and
move the normalization forward to unify the check on the now-normalized
structure.

With the check unified, the local nested function isn't needed anymore
and can be brought down into the normal flow of the function. With the
nesting level changed, shuffle the error strings around a bit to get
them to fit in 79 columns.

Note: although ifcond is typed as Sequence[str] elsewhere, we *know* that
the parser will produce real, bona-fide lists. It's okay to check
isinstance(ifcond, list) here.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421182032.3521476-12-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 4ebed4c488..de7fc16fac 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -146,30 +146,29 @@ def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
 
-    def check_if_str(ifcond: object) -> None:
-        if not isinstance(ifcond, str):
+    ifcond = expr.get('if')
+    if ifcond is None:
+        return
+
+    if isinstance(ifcond, list):
+        if not ifcond:
+            raise QAPISemError(
+                info, "'if' condition [] of %s is useless" % source)
+    else:
+        # Normalize to a list
+        ifcond = expr['if'] = [ifcond]
+
+    for elt in ifcond:
+        if not isinstance(elt, str):
             raise QAPISemError(
                 info,
                 "'if' condition of %s must be a string or a list of strings"
                 % source)
-        if ifcond.strip() == '':
+        if not elt.strip():
             raise QAPISemError(
                 info,
                 "'if' condition '%s' of %s makes no sense"
-                % (ifcond, source))
-
-    ifcond = expr.get('if')
-    if ifcond is None:
-        return
-    if isinstance(ifcond, list):
-        if ifcond == []:
-            raise QAPISemError(
-                info, "'if' condition [] of %s is useless" % source)
-        for elt in ifcond:
-            check_if_str(elt)
-    else:
-        check_if_str(ifcond)
-        expr['if'] = [ifcond]
+                % (elt, source))
 
 
 def normalize_members(members: object) -> None:
-- 
2.26.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC75400609
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:44:45 +0200 (CEST)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMF7E-0001Cv-CZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvK-0005u2-Si
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvI-0003ff-JQ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630697543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+XCnAhE51JOQqbBNiPrhfm3nyHfH5fEyk1pZrOkclBQ=;
 b=hUvd+HYvdJTkuVYbXHmOBERC25qSF0aFRHrxMZgj0f/f29G4lu85IwSTAMKOr4Cur8qDD/
 bIjbIf/uff62r18goyPkKcSxFW8ZYy/f7eAme9Y8IegiK5agN//04dsmoMywH2LVcHW+xb
 Cu4l+CXfzQhxgIKvaxUn7hab/ufic7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-kmQxiUAqME638xpdcdL1RQ-1; Fri, 03 Sep 2021 15:32:22 -0400
X-MC-Unique: kmQxiUAqME638xpdcdL1RQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52D5E501E3;
 Fri,  3 Sep 2021 19:32:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BC3C77718;
 Fri,  3 Sep 2021 19:32:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0377C11380CD; Fri,  3 Sep 2021 21:32:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] qapi: Tweak error messages for missing / conflicting
 meta-type
Date: Fri,  3 Sep 2021 21:32:08 +0200
Message-Id: <20210903193209.1426791-13-armbru@redhat.com>
In-Reply-To: <20210903193209.1426791-1-armbru@redhat.com>
References: <20210903193209.1426791-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210831123809.1107782-12-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/expr.py               | 23 +++++++++--------------
 tests/qapi-schema/double-type.err  |  4 +---
 tests/qapi-schema/missing-type.err |  2 +-
 3 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 9e2aa1d43a..ae4437ba08 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -630,20 +630,15 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
         if 'include' in expr:
             continue
 
-        if 'enum' in expr:
-            meta = 'enum'
-        elif 'union' in expr:
-            meta = 'union'
-        elif 'alternate' in expr:
-            meta = 'alternate'
-        elif 'struct' in expr:
-            meta = 'struct'
-        elif 'command' in expr:
-            meta = 'command'
-        elif 'event' in expr:
-            meta = 'event'
-        else:
-            raise QAPISemError(info, "expression is missing metatype")
+        metas = expr.keys() & {'enum', 'struct', 'union', 'alternate',
+                               'command', 'event'}
+        if len(metas) != 1:
+            raise QAPISemError(
+                info,
+                "expression must have exactly one key"
+                " 'enum', 'struct', 'union', 'alternate',"
+                " 'command', 'event'")
+        meta = metas.pop()
 
         check_name_is_str(expr[meta], info, "'%s'" % meta)
         name = cast(str, expr[meta])
diff --git a/tests/qapi-schema/double-type.err b/tests/qapi-schema/double-type.err
index 576e716197..6a1e8a5990 100644
--- a/tests/qapi-schema/double-type.err
+++ b/tests/qapi-schema/double-type.err
@@ -1,3 +1 @@
-double-type.json: In struct 'Bar':
-double-type.json:2: struct has unknown key 'command'
-Valid keys are 'base', 'data', 'features', 'if', 'struct'.
+double-type.json:2: expression must have exactly one key 'enum', 'struct', 'union', 'alternate', 'command', 'event'
diff --git a/tests/qapi-schema/missing-type.err b/tests/qapi-schema/missing-type.err
index 5755386a18..cb39569e49 100644
--- a/tests/qapi-schema/missing-type.err
+++ b/tests/qapi-schema/missing-type.err
@@ -1 +1 @@
-missing-type.json:2: expression is missing metatype
+missing-type.json:2: expression must have exactly one key 'enum', 'struct', 'union', 'alternate', 'command', 'event'
-- 
2.31.1



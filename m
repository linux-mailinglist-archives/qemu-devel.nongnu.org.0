Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC32C40889A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 11:56:56 +0200 (CEST)
Received: from localhost ([::1]:48838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPihq-0008Ky-Nd
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 05:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPic0-00007h-5v
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:50:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPibv-000741-4x
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631526646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IszLxmNLRVkvuJ11uy2cGGtATxpF8YT7u4EJBLAz7lI=;
 b=NVDTnGroZsmpJw1imGRyfA8CV30890gpZn3lttQtQdhDd9Nwv9yqUi95DuLduYnpli5LQv
 1ml/oQcmqfv8XJ5TBsHO5FeEIFUbo9Zjw2PTZsHTffwuncGdNBiJ7D77x213xenXQ1Tdxr
 oy+C5FS5m7js6qSwf3XJlaUSlYl5Gm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-syt8uaFNMK-DCOvGeeXlhQ-1; Mon, 13 Sep 2021 05:50:45 -0400
X-MC-Unique: syt8uaFNMK-DCOvGeeXlhQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D30DEC1A7;
 Mon, 13 Sep 2021 09:50:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53D1960853;
 Mon, 13 Sep 2021 09:50:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7B0E51138529; Mon, 13 Sep 2021 11:50:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] qapi: Fix bogus error for 'if': { 'not': '' }
Date: Mon, 13 Sep 2021 11:50:38 +0200
Message-Id: <20210913095038.3040776-6-armbru@redhat.com>
In-Reply-To: <20210913095038.3040776-1-armbru@redhat.com>
References: <20210913095038.3040776-1-armbru@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Message-Id: <20210908045428.2689093-6-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
[check_infix()'s type hint fixed]
---
 scripts/qapi/expr.py             | 21 +++++++++++++--------
 tests/qapi-schema/bad-if-not.err |  2 +-
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index b62f0a3640..90bde501b0 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -293,17 +293,22 @@ def _check_if(cond: Union[str, object]) -> None:
                 info,
                 "'if' condition of %s has conflicting keys" % source)
 
-        oper, operands = next(iter(cond.items()))
+        if 'not' in cond:
+            _check_if(cond['not'])
+        elif 'all' in cond:
+            _check_infix('all', cond['all'])
+        else:
+            _check_infix('any', cond['any'])
+
+    def _check_infix(operator: str, operands: object) -> None:
+        if not isinstance(operands, list):
+            raise QAPISemError(
+                info,
+                "'%s' condition of %s must be an array"
+                % (operator, source))
         if not operands:
             raise QAPISemError(
                 info, "'if' condition [] of %s is useless" % source)
-
-        if oper == "not":
-            _check_if(operands)
-            return
-        if oper in ("all", "any") and not isinstance(operands, list):
-            raise QAPISemError(
-                info, "'%s' condition of %s must be an array" % (oper, source))
         for operand in operands:
             _check_if(operand)
 
diff --git a/tests/qapi-schema/bad-if-not.err b/tests/qapi-schema/bad-if-not.err
index b3acdd679a..b33f5e16b8 100644
--- a/tests/qapi-schema/bad-if-not.err
+++ b/tests/qapi-schema/bad-if-not.err
@@ -1,2 +1,2 @@
 bad-if-not.json: In struct 'TestIfStruct':
-bad-if-not.json:2: 'if' condition [] of struct is useless
+bad-if-not.json:2: 'if' condition '' of struct is not a valid identifier
-- 
2.31.1



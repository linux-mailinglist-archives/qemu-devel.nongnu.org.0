Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7E0403388
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 06:57:26 +0200 (CEST)
Received: from localhost ([::1]:45098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNpeG-0001SR-Ti
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 00:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNpbc-0007DA-P9
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNpba-0003ob-OW
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631076877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLsnqIHIZh+GeDG9cQY/GuK0Dyf7v/+iBa3poJWKt2U=;
 b=X2TciJH8pTIDCGiv6XlQWMPDnMlRjF+Pc4sAw/jvr1wUUa+abtcxaNLO1qqa0XJPHP52qs
 OY7OZCtCoyf/BjzLfaGfzxZHsG6ET7ykX2snPgct1+IwlknRXnTY33wzpXFlUbh2FtTotD
 wIaNYeDtwtAdkeyYiUQQnp+13qnyvu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-GYDmXL7YOEmZ3TzD4kMuyg-1; Wed, 08 Sep 2021 00:54:35 -0400
X-MC-Unique: GYDmXL7YOEmZ3TzD4kMuyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B1D210059CF;
 Wed,  8 Sep 2021 04:54:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D060B5D9DC;
 Wed,  8 Sep 2021 04:54:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DECF41138222; Wed,  8 Sep 2021 06:54:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] qapi: Fix bogus error for 'if': { 'not': '' }
Date: Wed,  8 Sep 2021 06:54:28 +0200
Message-Id: <20210908045428.2689093-6-armbru@redhat.com>
In-Reply-To: <20210908045428.2689093-1-armbru@redhat.com>
References: <20210908045428.2689093-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py             | 21 +++++++++++++--------
 tests/qapi-schema/bad-if-not.err |  2 +-
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index b62f0a3640..ad3732c7f0 100644
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
+    def _check_infix(operator: str, operands: object):
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156A76A0889
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:24:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAdM-0002xR-3i; Thu, 23 Feb 2023 07:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdK-0002wV-3D
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdI-0003xv-9v
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677155011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUvYrs36Fw2EcK13M+SuNGSsi5rpmvOpq0anLP27ceg=;
 b=Cgr5+Fh9fdMSQ2DtEpWwaRQZ7GQ2S+kvFvcnzcI1ncZBtfNKBbS9E82muxMk/8nYG5YGct
 lfWPboXY+eq/LuxnwWuU8fKc8cE0uu4x//oZbOX3YngUEVoUPmOX3K7ZxQ9UkUKCnvCrNP
 bEUEQjXr758oGSzh43ZxpFar0vXojXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-Tlq0aod9N8C0LCdta9P63Q-1; Thu, 23 Feb 2023 07:23:30 -0500
X-MC-Unique: Tlq0aod9N8C0LCdta9P63Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EF3518A6464;
 Thu, 23 Feb 2023 12:23:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2F78400D79D;
 Thu, 23 Feb 2023 12:23:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 953C021E6A26; Thu, 23 Feb 2023 13:23:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	John Snow <jsnow@redhat.com>
Subject: [PULL 7/8] qapi: remove _JSONObject
Date: Thu, 23 Feb 2023 13:23:26 +0100
Message-Id: <20230223122327.1920247-8-armbru@redhat.com>
In-Reply-To: <20230223122327.1920247-1-armbru@redhat.com>
References: <20230223122327.1920247-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: John Snow <jsnow@redhat.com>

We can remove this alias as it only has two usages now, and no longer
pays for the confusion of "yet another type".

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20230215000011.1725012-6-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py   | 13 +++----------
 scripts/qapi/parser.py |  5 ++---
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index b8f905543e..ca01ea6f4a 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -47,14 +47,6 @@
 from .source import QAPISourceInfo
 
 
-# Deserialized JSON objects as returned by the parser.
-# The values of this mapping are not necessary to exhaustively type
-# here (and also not practical as long as mypy lacks recursive
-# types), because the purpose of this module is to interrogate that
-# type.
-_JSONObject = Dict[str, object]
-
-
 # See check_name_str(), below.
 valid_name = re.compile(r'(__[a-z0-9.-]+_)?'
                         r'(x-)?'
@@ -191,7 +183,7 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
                 info, "%s name should not end in 'List'" % meta)
 
 
-def check_keys(value: _JSONObject,
+def check_keys(value: Dict[str, object],
                info: QAPISourceInfo,
                source: str,
                required: List[str],
@@ -255,7 +247,8 @@ def check_flags(expr: QAPIExpression) -> None:
             expr.info, "flags 'allow-oob' and 'coroutine' are incompatible")
 
 
-def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
+def check_if(expr: Dict[str, object],
+             info: QAPISourceInfo, source: str) -> None:
     """
     Validate the ``if`` member of an object.
 
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 50906e27d4..d570086e1a 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -42,9 +42,8 @@
 _ExprValue = Union[List[object], Dict[str, object], str, bool]
 
 
-# FIXME: Consolidate and centralize definitions for _ExprValue,
-# JSONValue, and _JSONObject; currently scattered across several
-# modules.
+# FIXME: Consolidate and centralize definitions for _ExprValue and
+# JSONValue; currently scattered across several modules.
 
 
 class QAPIExpression(Dict[str, object]):
-- 
2.39.0



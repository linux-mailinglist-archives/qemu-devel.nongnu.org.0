Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED64383A92
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:56:11 +0200 (CEST)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligXK-00030U-69
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lig9N-0005cI-Fo
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lig9H-0006H6-8f
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621269076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFfP6zCU1I8YqEK19EpaVPsK4S0kevtho6e+2pBFIN4=;
 b=jNc60udODEfhVWSPgZbbWrxqQBFQfSDrXFT9+2//NV1SAzAH+iNsrNQSPDrZ4ZYnZsKsmj
 unEw0k7fQqBsNRohVmfbRLnvwHktOVn1Dfu3akxoAlxPvdFpp3bqqa5ErvsiaFZlmScL6T
 meSipPjfz0jQTS0dWz6jbJu852TQhcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-6xtKzB-POb-P5cp6r_fD9g-1; Mon, 17 May 2021 12:31:14 -0400
X-MC-Unique: 6xtKzB-POb-P5cp6r_fD9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82EAA9F93B
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 16:31:13 +0000 (UTC)
Received: from localhost (unknown [10.36.110.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 829E05C1A1;
 Mon, 17 May 2021 16:31:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/9] qapi: add IfNot
Date: Mon, 17 May 2021 20:30:36 +0400
Message-Id: <20210517163040.2308926-6-marcandre.lureau@redhat.com>
In-Reply-To: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Introduce IfNot predicate class, for 'not' condition expressions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/common.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 4e5c3ebaae..8a23c1d4ef 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -239,6 +239,28 @@ def __eq__(self, other: object) -> bool:
         return self.option == other.option
 
 
+class IfNot(IfPredicate):
+    def __init__(self, pred: IfPredicate):
+        self.pred = pred
+
+    def cgen(self) -> str:
+        return "!" + self.pred.cgen()
+
+    def docgen(self) -> str:
+        return "not " + self.pred.docgen()
+
+    def __bool__(self) -> bool:
+        return bool(self.pred)
+
+    def __repr__(self) -> str:
+        return f"IfNot({self.pred!r})"
+
+    def __eq__(self, other: object) -> bool:
+        if not isinstance(other, type(self)):
+            return False
+        return self.pred == other.pred
+
+
 class IfPredicateList(IfPredicate):
     C_SEP = ""
     DOC_SEP = ""
-- 
2.29.0



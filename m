Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA3136EB96
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:49:19 +0200 (CEST)
Received: from localhost ([::1]:37948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc72c-0004lp-5u
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lc6v3-0005QM-LJ
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:41:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lc6v1-0002eo-U3
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619703687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=We1zZDJqXr65g8j+1L71psk2lqix3XVZIyeTb7L2dhQ=;
 b=ehBqCIx+V9aLAQaggJVq0evq4hTMFZzZPWDbUl/VuJdzdIVyIQjMagfqv1ATk9uK83osQr
 aaSNcc0UmDmAPQXaI9Ix+nLJ7zh4cRQSFBURRbaUwC84z5sjRuiQGgirc2as7ipR33DKee
 JqaZUL1ftlY/4gSiA/DjQ1OgEd9U4p8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-isX_bXiVPMaAlmz_MMwvvA-1; Thu, 29 Apr 2021 09:41:25 -0400
X-MC-Unique: isX_bXiVPMaAlmz_MMwvvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92533CC64C
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 13:41:24 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 717AC19C44;
 Thu, 29 Apr 2021 13:41:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/9] qapi: add IfNot
Date: Thu, 29 Apr 2021 17:40:28 +0400
Message-Id: <20210429134032.1125111-6-marcandre.lureau@redhat.com>
In-Reply-To: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Introduce IfNot predicate class, for 'not' condition expressions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/common.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 102d347348..6236bfc457 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -224,6 +224,28 @@ def __eq__(self, other: object) -> bool:
         return self.option == other.option
 
 
+class IfNot(IfPredicate):
+    def __init__(self, pred: IfPredicate):
+        self.pred = pred
+
+    def docgen(self) -> str:
+        return "not " + self.pred.docgen()
+
+    def cgen(self) -> str:
+        return "!" + self.pred.cgen()
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A25139F61C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:12:10 +0200 (CEST)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaaX-0007iT-67
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lqaWr-0007Nv-6t
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lqaWp-0001Zq-F6
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lLjQcoatoJtqcdHrfqd6C+qc/pjhRo8VRkVG0JUTRVE=;
 b=Dt7yrHTlBOsnQJyHTqMNKSIO1e54WVbMvZxscu2dPs3P11yXwBryFZ7rOexuyt1jgux7MZ
 DYrlilWeYVEL0wPokObBRVjYpezinDDRmiqlWgXonbTg9U2htKb9mWQD9AWz7zvQHiFPQu
 b7ErQM4/4iJ5VjFfPnbGvjMVzUfmspM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-Gx-Nxau4NHSoKOxs1F0NzA-1; Tue, 08 Jun 2021 08:08:16 -0400
X-MC-Unique: Gx-Nxau4NHSoKOxs1F0NzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC519800D62
 for <qemu-devel@nongnu.org>; Tue,  8 Jun 2021 12:08:15 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A9B0179E6;
 Tue,  8 Jun 2021 12:08:11 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/9] qapi: add IfNot
Date: Tue,  8 Jun 2021 16:07:20 +0400
Message-Id: <20210608120723.2268181-7-marcandre.lureau@redhat.com>
In-Reply-To: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Eric Blake <eblake@redhat.com>, jsnow@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
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
index a4a41c23bc..1d929cbeec 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -245,6 +245,28 @@ def __eq__(self, other: object) -> bool:
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



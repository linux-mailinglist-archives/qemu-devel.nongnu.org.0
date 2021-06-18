Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E663AC8DE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:32:13 +0200 (CEST)
Received: from localhost ([::1]:49760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBnI-0004EX-Pq
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBhf-0005oH-Kr
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBha-0000SA-6j
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624011977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=js8lKVeudbuZ7vGAGmNBqBrXW1SxAFvN/nBG3xvgg5I=;
 b=VFxQePAesJ6n5snB43MAZHzW71W1lh10KxobAr/ncVq5nkChak45gKhjoyleqa6govYoXU
 TFWU9GoHohd263xQnjbt3SwzLqZIQgBVw5383R59kddfb+6MBxN5Cb/ateen4rjszwBOgS
 5X0mZ/Mb8RZLInkW2tuOFV0KusCWoYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-IQZlYYrePISzzsiaVolxeA-1; Fri, 18 Jun 2021 06:26:14 -0400
X-MC-Unique: IQZlYYrePISzzsiaVolxeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 333F0107ACF6
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:26:13 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF1E560C58;
 Fri, 18 Jun 2021 10:26:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/11] qapi: _make_enum_members() to work with pre-built
 QAPISchemaIfCond
Date: Fri, 18 Jun 2021 14:25:00 +0400
Message-Id: <20210618102507.3761128-5-marcandre.lureau@redhat.com>
In-Reply-To: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Instead of lowering the expression back to its original form, and having
to convert it again, special-case the 'if' condition to be pre-built.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/schema.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index e3bd8f8720..c35fa3bf51 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -982,8 +982,13 @@ def _make_features(self, features, info):
                 for f in features]
 
     def _make_enum_members(self, values, info):
-        return [QAPISchemaEnumMember(v['name'], info,
-                                     QAPISchemaIfCond(v.get('if')))
+        def _get_if(v):
+            ifcond = v.get('if')
+            if isinstance(ifcond, QAPISchemaIfCond):
+                return ifcond
+            else:
+                return QAPISchemaIfCond(ifcond)
+        return [QAPISchemaEnumMember(v['name'], info, _get_if(v))
                 for v in values]
 
     def _make_implicit_enum_type(self, name, info, ifcond, values):
@@ -1103,7 +1108,7 @@ def _def_union_type(self, expr, info, doc):
                                           QAPISchemaIfCond(value.get('if')),
                                           info)
                 for (key, value) in data.items()]
-            enum = [{'name': v.name, 'if': v.ifcond.ifcond} for v in variants]
+            enum = [{'name': v.name, 'if': v.ifcond} for v in variants]
             typ = self._make_implicit_enum_type(name, info, ifcond, enum)
             tag_member = QAPISchemaObjectTypeMember('type', info, typ, False)
             members = [tag_member]
-- 
2.29.0



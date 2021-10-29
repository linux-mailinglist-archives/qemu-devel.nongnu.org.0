Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059D84403DD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:10:44 +0200 (CEST)
Received: from localhost ([::1]:46072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYD4-0007Hk-Ir
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgXaT-0000sY-Jt
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgXaP-00010d-HW
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635535844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QXCUahEzd+sAcY2WxC8NPy1GCI2U2H5Y60vIZ5y7LQI=;
 b=gKcduFiD5KJgLNgiHVCIvQ4BwVyvOLLlYrTakhAUNwrRigb5WiVuxQRCI5nsRa077ypl9Z
 vgfR/fi5rIE8a4PQvCujjiu4maV16ddI9X9ItZdpfNZ5t9htwCrX7Q+81VcBl/MQ+DQP9/
 z10R3cB42kyHKsdZ4jtBeMEXuo29+Fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-mGEmCr9XPxecDM8NJ7lAmQ-1; Fri, 29 Oct 2021 15:30:41 -0400
X-MC-Unique: mGEmCr9XPxecDM8NJ7lAmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D0328066F8;
 Fri, 29 Oct 2021 19:30:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 586755F4EE;
 Fri, 29 Oct 2021 19:30:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EB26411380C3; Fri, 29 Oct 2021 21:30:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] qapi: Tools for sets of special feature flags in generated
 code
Date: Fri, 29 Oct 2021 21:30:10 +0200
Message-Id: <20211029193015.1312198-5-armbru@redhat.com>
In-Reply-To: <20211029193015.1312198-1-armbru@redhat.com>
References: <20211029193015.1312198-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New enum QapiSpecialFeature enumerates the special feature flags.

New helper gen_special_features() returns code to represent a
collection of special feature flags as a bitset.

The next few commits will put them to use.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20211028102520.747396-5-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qapi/util.h    | 4 ++++
 scripts/qapi/gen.py    | 8 ++++++++
 scripts/qapi/schema.py | 3 +++
 3 files changed, 15 insertions(+)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 257c600f99..7a8d5c7d72 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -11,6 +11,10 @@
 #ifndef QAPI_UTIL_H
 #define QAPI_UTIL_H
 
+typedef enum {
+    QAPI_DEPRECATED,
+} QapiSpecialFeature;
+
 /* QEnumLookup flags */
 #define QAPI_ENUM_DEPRECATED 1
 
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 2ec1e7b3b6..995a97d2b8 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -18,6 +18,7 @@
     Dict,
     Iterator,
     Optional,
+    Sequence,
     Tuple,
 )
 
@@ -29,6 +30,7 @@
     mcgen,
 )
 from .schema import (
+    QAPISchemaFeature,
     QAPISchemaIfCond,
     QAPISchemaModule,
     QAPISchemaObjectType,
@@ -37,6 +39,12 @@
 from .source import QAPISourceInfo
 
 
+def gen_special_features(features: Sequence[QAPISchemaFeature]) -> str:
+    special_features = [f"1u << QAPI_{feat.name.upper()}"
+                        for feat in features if feat.is_special()]
+    return ' | '.join(special_features) or '0'
+
+
 class QAPIGen:
     def __init__(self, fname: str):
         self.fname = fname
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 6d5f46509a..55f82d7389 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -725,6 +725,9 @@ def connect_doc(self, doc):
 class QAPISchemaFeature(QAPISchemaMember):
     role = 'feature'
 
+    def is_special(self):
+        return self.name in ('deprecated')
+
 
 class QAPISchemaObjectTypeMember(QAPISchemaMember):
     def __init__(self, name, info, typ, optional, ifcond=None, features=None):
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42A2D61C8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:30:18 +0100 (CET)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOpb-0006Aa-Ok
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOb8-0004wm-7L
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOaq-00015e-Ny
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607616898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kqsoRBYL03kTltdjYlnZAjW6aQj/S3a950/hJMoyWU=;
 b=FfveVM/kIa7EarjbEs8JilqsOP8Zh1LNgOg2LEX1/9hEbE68mpBnRoUXcH7Re0RFmU96Ni
 TNUv3G+ANxv0f4AlYGJkfa1SXphZu3fNxLSGPztdqdOJOCD0JSvQSyipAjY9Za6NSSsvNz
 xkO+4/1lKbT4/13ejOILfcZbos2PQ1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-gk-KfR20OLyMMkbq0-udIQ-1; Thu, 10 Dec 2020 11:14:56 -0500
X-MC-Unique: gk-KfR20OLyMMkbq0-udIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C35A7100C660;
 Thu, 10 Dec 2020 16:14:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 936DD5D9DD;
 Thu, 10 Dec 2020 16:14:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 91B5210FA0AC; Thu, 10 Dec 2020 17:14:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] test-visitor-serialization: Clean up test_primitives()
Date: Thu, 10 Dec 2020 17:14:52 +0100
Message-Id: <20201210161452.2813491-11-armbru@redhat.com>
In-Reply-To: <20201210161452.2813491-1-armbru@redhat.com>
References: <20201210161452.2813491-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

test_primitives() uses union member intmax_t max to compare the
integer members.  Unspecified behavior.  Has worked fine for many
years, though.  Clean it up.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/test-visitor-serialization.c | 44 +++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/tests/test-visitor-serialization.c b/tests/test-visitor-serialization.c
index 19b72571bb..7eab18b7c6 100644
--- a/tests/test-visitor-serialization.c
+++ b/tests/test-visitor-serialization.c
@@ -55,7 +55,6 @@ typedef struct PrimitiveType {
         int16_t s16;
         int32_t s32;
         int64_t s64;
-        intmax_t max;
     } value;
     enum PrimitiveTypeKind type;
     const char *description;
@@ -307,15 +306,46 @@ static void test_primitives(gconstpointer opaque)
                      &error_abort);
 
     g_assert(pt_copy != NULL);
-    if (pt->type == PTYPE_STRING) {
+    switch (pt->type) {
+    case PTYPE_STRING:
         g_assert_cmpstr(pt->value.string, ==, pt_copy->value.string);
         g_free((char *)pt_copy->value.string);
-    } else if (pt->type == PTYPE_NUMBER) {
+        break;
+    case PTYPE_BOOLEAN:
+        g_assert_cmpint(pt->value.boolean, ==, pt->value.boolean);
+        break;
+    case PTYPE_NUMBER:
         g_assert_cmpfloat(pt->value.number, ==, pt_copy->value.number);
-    } else if (pt->type == PTYPE_BOOLEAN) {
-        g_assert_cmpint(!!pt->value.max, ==, !!pt->value.max);
-    } else {
-        g_assert_cmpint(pt->value.max, ==, pt_copy->value.max);
+        break;
+    case PTYPE_INTEGER:
+        g_assert_cmpint(pt->value.integer, ==, pt_copy->value.integer);
+        break;
+    case PTYPE_U8:
+        g_assert_cmpuint(pt->value.u8, ==, pt_copy->value.u8);
+        break;
+    case PTYPE_U16:
+        g_assert_cmpuint(pt->value.u16, ==, pt_copy->value.u16);
+        break;
+    case PTYPE_U32:
+        g_assert_cmpuint(pt->value.u32, ==, pt_copy->value.u32);
+        break;
+    case PTYPE_U64:
+        g_assert_cmpuint(pt->value.u64, ==, pt_copy->value.u64);
+        break;
+    case PTYPE_S8:
+        g_assert_cmpint(pt->value.s8, ==, pt_copy->value.s8);
+        break;
+    case PTYPE_S16:
+        g_assert_cmpint(pt->value.s16, ==, pt_copy->value.s16);
+        break;
+    case PTYPE_S32:
+        g_assert_cmpint(pt->value.s32, ==, pt_copy->value.s32);
+        break;
+    case PTYPE_S64:
+        g_assert_cmpint(pt->value.s64, ==, pt_copy->value.s64);
+        break;
+    case PTYPE_EOL:
+        g_assert_not_reached();
     }
 
     ops->cleanup(serialize_data);
-- 
2.26.2



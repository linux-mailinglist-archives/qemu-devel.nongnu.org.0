Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D32DEE65
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:05:56 +0100 (CET)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqa3f-0000Vd-VY
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtq-0004mg-UV
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtl-0007Gb-7h
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ii4WQb618fIsVWU9QALhameaXEQIo8ubUzK6x31oRII=;
 b=Z8D9KJtSfsBP/mMkONqE6cYKhQqTgioQ4MihfMrtrkEn8dehFFgniK1E6gS+RYYmQsFxhv
 P2eHM8sQlAnFWybBXusci3UmyAqPHtisG0GFa3H+YtsZTco6n3rCooyzn5IzRzQhBEQfri
 DGD0xKsfP78SpVqBLHPU3LBg1C1FDls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-Fdd0AZuzOyKAFvCP23Vgsw-1; Sat, 19 Dec 2020 05:55:37 -0500
X-MC-Unique: Fdd0AZuzOyKAFvCP23Vgsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB68851B6;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADDFE10013C0;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 818BD11275FF; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/33] test-visitor-serialization: Clean up test_primitives()
Date: Sat, 19 Dec 2020 11:55:12 +0100
Message-Id: <20201219105532.1734134-14-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

test_primitives() uses union member intmax_t max to compare the
integer members.  Unspecified behavior.  Has worked fine for many
years, though.  Clean it up.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201210161452.2813491-11-armbru@redhat.com>
---
 tests/test-visitor-serialization.c | 44 +++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/tests/test-visitor-serialization.c b/tests/test-visitor-serialization.c
index cf19924068..dfe120a50d 100644
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



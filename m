Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6430D2D61BE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:27:21 +0100 (CET)
Received: from localhost ([::1]:53198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOmk-0003Pz-Nb
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOb7-0004wi-Qh
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOao-00015O-Tl
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607616898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=twabEsAWEQ/S8p60KkjtoEoQ7N9nzISOyrzIWt+zFbQ=;
 b=M8AAMO6vInzRdcf/8olNozEjZiwAPQJ7+yp/1RyN0dAFp+KxeDm8HomgMhhRtVzZqEHjxH
 cjI6B/AIcQsdZ6eyLyUXrUVM6UnBIpQ10NQODTSGI1bRxCG2KIFg7Tg84f48nux1znU2xo
 5/9mFEg09tvGd8OwTc1HSwjXH20YWOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-HLnCHeOwNjukjbL9fe0zZA-1; Thu, 10 Dec 2020 11:14:55 -0500
X-MC-Unique: HLnCHeOwNjukjbL9fe0zZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D786C73A5;
 Thu, 10 Dec 2020 16:14:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C3BA5C260;
 Thu, 10 Dec 2020 16:14:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7864611329A6; Thu, 10 Dec 2020 17:14:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/10] tests/check-qjson: Examine QNum more thoroughly
Date: Thu, 10 Dec 2020 17:14:44 +0100
Message-Id: <20201210161452.2813491-3-armbru@redhat.com>
In-Reply-To: <20201210161452.2813491-1-armbru@redhat.com>
References: <20201210161452.2813491-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

simple_number() checks only qnum_get_try_int().  Also check
qnum_get_try_uint() and qnum_get_double().

float_number() checks only qnum_get_double().  Also check
qnum_get_try_int() and qnum_get_try_uint().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/check-qjson.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/check-qjson.c b/tests/check-qjson.c
index 2a5852904a..6ab6b111b0 100644
--- a/tests/check-qjson.c
+++ b/tests/check-qjson.c
@@ -807,7 +807,8 @@ static void simple_number(void)
     };
     int i;
     QNum *qnum;
-    int64_t val;
+    int64_t ival;
+    uint64_t uval;
     QString *str;
 
     for (i = 0; test_cases[i].encoded; i++) {
@@ -815,8 +816,16 @@ static void simple_number(void)
                           qobject_from_json(test_cases[i].encoded,
                                             &error_abort));
         g_assert(qnum);
-        g_assert(qnum_get_try_int(qnum, &val));
-        g_assert_cmpint(val, ==, test_cases[i].decoded);
+        g_assert(qnum_get_try_int(qnum, &ival));
+        g_assert_cmpint(ival, ==, test_cases[i].decoded);
+        if (test_cases[i].decoded >= 0) {
+            g_assert(qnum_get_try_uint(qnum, &uval));
+            g_assert_cmpuint(uval, ==, (uint64_t)test_cases[i].decoded);
+        } else {
+            g_assert(!qnum_get_try_uint(qnum, &uval));
+        }
+        g_assert_cmpfloat(qnum_get_double(qnum), ==,
+                          (double)test_cases[i].decoded);
 
         str = qobject_to_json(QOBJECT(qnum));
         g_assert_cmpstr(qstring_get_str(str), ==,
@@ -885,6 +894,8 @@ static void float_number(void)
     };
     int i;
     QNum *qnum;
+    int64_t ival;
+    uint64_t uval;
     QString *str;
 
     for (i = 0; test_cases[i].encoded; i++) {
@@ -893,6 +904,8 @@ static void float_number(void)
                                             &error_abort));
         g_assert(qnum);
         g_assert_cmpfloat(qnum_get_double(qnum), ==, test_cases[i].decoded);
+        g_assert(!qnum_get_try_int(qnum, &ival));
+        g_assert(!qnum_get_try_uint(qnum, &uval));
 
         str = qobject_to_json(QOBJECT(qnum));
         g_assert_cmpstr(qstring_get_str(str), ==,
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDA42D6189
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:20:11 +0100 (CET)
Received: from localhost ([::1]:42194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOfq-00072u-TM
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOar-0004vU-A4
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOao-00014q-70
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607616897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLEms2GqBROgiIpDcBpSjRe9sUa+1hzo+enplD4dsZk=;
 b=aSqWG9Oa2fzgtCKapLsIcHL3r0sIF9+6vqrsXNlDiLI1pHoF+/O1J9OWI2RFwIynkZv0Io
 TyNc/IgD2gF0nCeaUxi9rtomGMGmwu9yMuH+JQR63itml8xP3W4ORIaa2cVakIr/jQwNMU
 idbqWQM8ivHVQnAIxCjD4RVDY3sSuXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-EtZH9vC7OP6r1wIGklBTPw-1; Thu, 10 Dec 2020 11:14:55 -0500
X-MC-Unique: EtZH9vC7OP6r1wIGklBTPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FCA7180A0A9;
 Thu, 10 Dec 2020 16:14:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F8305D6D3;
 Thu, 10 Dec 2020 16:14:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7B9E511328AA; Thu, 10 Dec 2020 17:14:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] tests/check-qjson: Cover number 2^63
Date: Thu, 10 Dec 2020 17:14:45 +0100
Message-Id: <20201210161452.2813491-4-armbru@redhat.com>
In-Reply-To: <20201210161452.2813491-1-armbru@redhat.com>
References: <20201210161452.2813491-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/check-qjson.c | 41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/tests/check-qjson.c b/tests/check-qjson.c
index 6ab6b111b0..8cb8a40524 100644
--- a/tests/check-qjson.c
+++ b/tests/check-qjson.c
@@ -791,7 +791,7 @@ static void utf8_string(void)
     }
 }
 
-static void simple_number(void)
+static void int_number(void)
 {
     struct {
         const char *encoded;
@@ -836,6 +836,42 @@ static void simple_number(void)
     }
 }
 
+static void uint_number(void)
+{
+    struct {
+        const char *encoded;
+        uint64_t decoded;
+        const char *reencoded;
+    } test_cases[] = {
+        { "9223372036854775808", (uint64_t)1 << 63 },
+        {},
+    };
+    int i;
+    QNum *qnum;
+    int64_t ival;
+    uint64_t uval;
+    QString *str;
+
+    for (i = 0; test_cases[i].encoded; i++) {
+        qnum = qobject_to(QNum,
+                          qobject_from_json(test_cases[i].encoded,
+                                            &error_abort));
+        g_assert(qnum);
+        g_assert(qnum_get_try_uint(qnum, &uval));
+        g_assert_cmpuint(uval, ==, test_cases[i].decoded);
+        g_assert(!qnum_get_try_int(qnum, &ival));
+        g_assert_cmpfloat(qnum_get_double(qnum), ==,
+                          (double)test_cases[i].decoded);
+
+        str = qobject_to_json(QOBJECT(qnum));
+        g_assert_cmpstr(qstring_get_str(str), ==,
+                        test_cases[i].reencoded ?: test_cases[i].encoded);
+        qobject_unref(str);
+
+        qobject_unref(qnum);
+    }
+}
+
 static void large_number(void)
 {
     const char *maxu64 = "18446744073709551615"; /* 2^64-1 */
@@ -1487,7 +1523,8 @@ int main(int argc, char **argv)
     g_test_add_func("/literals/string/quotes", string_with_quotes);
     g_test_add_func("/literals/string/utf8", utf8_string);
 
-    g_test_add_func("/literals/number/simple", simple_number);
+    g_test_add_func("/literals/number/int", int_number);
+    g_test_add_func("/literals/number/uint", uint_number);
     g_test_add_func("/literals/number/large", large_number);
     g_test_add_func("/literals/number/float", float_number);
 
-- 
2.26.2



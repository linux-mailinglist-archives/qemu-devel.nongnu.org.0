Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFAC2D6197
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:21:41 +0100 (CET)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOh5-0008Bc-Nf
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOb7-0004wR-CP
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOap-000155-0C
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:15:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607616897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NewHVqVbzKce8NMNH9W6D0kApzTdbfYQrQ/XUCuJf0Q=;
 b=QjsEe85M17RNaI5hkL2RFeklQXFgzrxc10pldxxoVSkhpzjAlGChbDSnpO95Mo3T4y0b8G
 6QJAP5YXtLRL/Cf2B5shFzzuGtbhQqD2nQ0+NmNp0dwRAqO6R2IbgsG7Y8CjmS68av/fjM
 jhQ57RbyTxWTQZelrY6La+4yXRFbDlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-V_b9D-s-PdeW1nU5raQ_cg-1; Thu, 10 Dec 2020 11:14:55 -0500
X-MC-Unique: V_b9D-s-PdeW1nU5raQ_cg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42B24802B40;
 Thu, 10 Dec 2020 16:14:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 120BC6F97E;
 Thu, 10 Dec 2020 16:14:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7E9AF1129953; Thu, 10 Dec 2020 17:14:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/10] tests/check-qjson: Replace redundant large_number()
Date: Thu, 10 Dec 2020 17:14:46 +0100
Message-Id: <20201210161452.2813491-5-armbru@redhat.com>
In-Reply-To: <20201210161452.2813491-1-armbru@redhat.com>
References: <20201210161452.2813491-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move one of large_number()'s three checks to uint_number(), and the
other two to float_number().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/check-qjson.c | 47 +++------------------------------------------
 1 file changed, 3 insertions(+), 44 deletions(-)

diff --git a/tests/check-qjson.c b/tests/check-qjson.c
index 8cb8a40524..98515b1fd6 100644
--- a/tests/check-qjson.c
+++ b/tests/check-qjson.c
@@ -844,6 +844,7 @@ static void uint_number(void)
         const char *reencoded;
     } test_cases[] = {
         { "9223372036854775808", (uint64_t)1 << 63 },
+        { "18446744073709551615", UINT64_MAX },
         {},
     };
     int i;
@@ -872,49 +873,6 @@ static void uint_number(void)
     }
 }
 
-static void large_number(void)
-{
-    const char *maxu64 = "18446744073709551615"; /* 2^64-1 */
-    const char *gtu64 = "18446744073709551616"; /* 2^64 */
-    const char *lti64 = "-9223372036854775809"; /* -2^63 - 1 */
-    QNum *qnum;
-    QString *str;
-    uint64_t val;
-    int64_t ival;
-
-    qnum = qobject_to(QNum, qobject_from_json(maxu64, &error_abort));
-    g_assert(qnum);
-    g_assert_cmpuint(qnum_get_uint(qnum), ==, 18446744073709551615U);
-    g_assert(!qnum_get_try_int(qnum, &ival));
-
-    str = qobject_to_json(QOBJECT(qnum));
-    g_assert_cmpstr(qstring_get_str(str), ==, maxu64);
-    qobject_unref(str);
-    qobject_unref(qnum);
-
-    qnum = qobject_to(QNum, qobject_from_json(gtu64, &error_abort));
-    g_assert(qnum);
-    g_assert_cmpfloat(qnum_get_double(qnum), ==, 18446744073709552e3);
-    g_assert(!qnum_get_try_uint(qnum, &val));
-    g_assert(!qnum_get_try_int(qnum, &ival));
-
-    str = qobject_to_json(QOBJECT(qnum));
-    g_assert_cmpstr(qstring_get_str(str), ==, gtu64);
-    qobject_unref(str);
-    qobject_unref(qnum);
-
-    qnum = qobject_to(QNum, qobject_from_json(lti64, &error_abort));
-    g_assert(qnum);
-    g_assert_cmpfloat(qnum_get_double(qnum), ==, -92233720368547758e2);
-    g_assert(!qnum_get_try_uint(qnum, &val));
-    g_assert(!qnum_get_try_int(qnum, &ival));
-
-    str = qobject_to_json(QOBJECT(qnum));
-    g_assert_cmpstr(qstring_get_str(str), ==, "-9223372036854775808");
-    qobject_unref(str);
-    qobject_unref(qnum);
-}
-
 static void float_number(void)
 {
     struct {
@@ -926,6 +884,8 @@ static void float_number(void)
         { "0.222", 0.222 },
         { "-32.12313", -32.12313 },
         { "-32.20e-10", -32.20e-10, "-0" /* BUG */ },
+        { "18446744073709551616", 0x1p64 },
+        { "-9223372036854775809", -0x1p63, "-9223372036854775808" },
         {},
     };
     int i;
@@ -1525,7 +1485,6 @@ int main(int argc, char **argv)
 
     g_test_add_func("/literals/number/int", int_number);
     g_test_add_func("/literals/number/uint", uint_number);
-    g_test_add_func("/literals/number/large", large_number);
     g_test_add_func("/literals/number/float", float_number);
 
     g_test_add_func("/literals/keyword", keyword_literal);
-- 
2.26.2



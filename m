Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C222C14C4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:52:53 +0100 (CET)
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHtM-0008CQ-4Z
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpQ-0006Df-L1
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpO-0007lo-99
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QiavwNcTmeJQ44Wd/gWTFeDiwR1iT7Nz1/QxW8N4RgU=;
 b=DQ+4byRrZyO/cFdsHBrFLHCLffYRj4nvK3pQ8TkjPkwq0W65sYCYuHQRrM/sPBEag0v/kj
 LuPF9Yuno1XOBe1hR/pc6QzzjEm53a/paVYfgK22Ynf9d4cBBFXy6ZYaKF58UXbVluI7bM
 2sRVWYhQSCskwk0xbf1imZt1Z3zBJSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-yfqGjBjkNvKBjOHINVIMLg-1; Mon, 23 Nov 2020 14:48:40 -0500
X-MC-Unique: yfqGjBjkNvKBjOHINVIMLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD6A29CC39
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:48:30 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6355A1002382;
 Mon, 23 Nov 2020 19:48:30 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/19] qlit: Use qnum_value_is_equal() when comparing QNums
Date: Mon, 23 Nov 2020 14:48:04 -0500
Message-Id: <20201123194818.2773508-6-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, qlit_equal_qobject() crashes if getting a QNum that
can't be represented as int64.  Fix this by using
qnum_value_is_equal().

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of the series.
---
 qobject/qlit.c     |  3 ++-
 tests/check-qlit.c | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/qobject/qlit.c b/qobject/qlit.c
index be8332136c..67126b25d5 100644
--- a/qobject/qlit.c
+++ b/qobject/qlit.c
@@ -71,7 +71,8 @@ bool qlit_equal_qobject(const QLitObject *lhs, const QObject *rhs)
     case QTYPE_QBOOL:
         return lhs->value.qbool == qbool_get_bool(qobject_to(QBool, rhs));
     case QTYPE_QNUM:
-        return lhs->value.qnum ==  qnum_get_int(qobject_to(QNum, rhs));
+        return qnum_value_is_equal(&(QNumValue)QNUM_VAL_INT(lhs->value.qnum),
+                                   &qobject_to(QNum, rhs)->value);
     case QTYPE_QSTRING:
         return (strcmp(lhs->value.qstr,
                        qstring_get_str(qobject_to(QString, rhs))) == 0);
diff --git a/tests/check-qlit.c b/tests/check-qlit.c
index bd6798d912..58ceaae5a3 100644
--- a/tests/check-qlit.c
+++ b/tests/check-qlit.c
@@ -65,6 +65,24 @@ static void qlit_equal_qobject_test(void)
     qobject_unref(qobj);
 }
 
+static void qlit_equal_large_qnum_test(void)
+{
+    /* 2^32-1 */
+    QNum *large = qnum_from_uint(9223372036854775807LL);
+    /* 2^32 */
+    QNum *too_large = qnum_from_uint(9223372036854775808ULL);
+    QNum *dbl = qnum_from_double(9223372036854775808.0);
+    QLitObject qlit_large = QLIT_QNUM(9223372036854775807LL);
+
+    g_assert(qlit_equal_qobject(&qlit_large, QOBJECT(large)));
+    g_assert(!qlit_equal_qobject(&qlit_large, QOBJECT(too_large)));
+    g_assert(!qlit_equal_qobject(&qlit_large, QOBJECT(dbl)));
+
+    qobject_unref(dbl);
+    qobject_unref(large);
+    qobject_unref(too_large);
+}
+
 static void qobject_from_qlit_test(void)
 {
     QObject *obj, *qobj = qobject_from_qlit(&qlit);
@@ -95,6 +113,7 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
 
     g_test_add_func("/qlit/equal_qobject", qlit_equal_qobject_test);
+    g_test_add_func("/qlit/equal_large_qnum", qlit_equal_large_qnum_test);
     g_test_add_func("/qlit/qobject_from_qlit", qobject_from_qlit_test);
 
     return g_test_run();
-- 
2.28.0



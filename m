Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B625E2C14D4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:56:38 +0100 (CET)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHwz-0004a6-OB
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpS-0006HO-SY
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpR-0007nZ-95
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErUgExoPq2dmCvPPd0GcluJIvPhKwWywjEBrhD1BCLI=;
 b=AjeI6h4t9wjJKO0w8EyRs5pnQNKWwDIoVKUa6wAsNIjytjl6EwxtFhqDT9McWokOeE6IGU
 jcf0vS+PPlbHtPw84qsXyDOnWX+gC50+EKPwLn+Zs3zZ4Zuop7AmmPXBUl5ZuvFM5b860D
 XSKPvwNY3C0QoMCa2Jt0YsuJi2ccyeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-n4OpxoeLPO2NtC7v3q6wWA-1; Mon, 23 Nov 2020 14:48:46 -0500
X-MC-Unique: n4OpxoeLPO2NtC7v3q6wWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 318AA8064B3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:48:44 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED9CB5D9D2;
 Mon, 23 Nov 2020 19:48:40 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/19] qlit: Move qlit_equal_qobject() reference values to
 array
Date: Mon, 23 Nov 2020 14:48:07 -0500
Message-Id: <20201123194818.2773508-9-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Add an array of values to qlit_equal_qobject_test(), so we can
extend the test case to compare multiple literals, not just the
ones at the existing `qlit` and `qlit_foo` variables.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of this series.
---
 tests/check-qlit.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tests/check-qlit.c b/tests/check-qlit.c
index 24ac21395c..b1cfbddb17 100644
--- a/tests/check-qlit.c
+++ b/tests/check-qlit.c
@@ -29,11 +29,6 @@ static QLitObject qlit = QLIT_QDICT(((QLitDictEntry[]) {
     { },
 }));
 
-static QLitObject qlit_foo = QLIT_QDICT(((QLitDictEntry[]) {
-    { "foo", QLIT_QNUM_INT(42) },
-    { },
-}));
-
 static QObject *make_qobject(void)
 {
     QDict *qdict = qdict_new();
@@ -53,16 +48,33 @@ static QObject *make_qobject(void)
 
 static void qlit_equal_qobject_test(void)
 {
+    /* Each entry in the values[] array should be different from the others */
+    QLitObject values[] = {
+        qlit,
+        QLIT_QDICT(((QLitDictEntry[]) {
+            { "foo", QLIT_QNUM_INT(42) },
+            { },
+        })),
+    };
+    int i;
     QObject *qobj = make_qobject();
 
     g_assert(qlit_equal_qobject(&qlit, qobj));
 
-    g_assert(!qlit_equal_qobject(&qlit_foo, qobj));
-
     qdict_put(qobject_to(QDict, qobj), "bee", qlist_new());
     g_assert(!qlit_equal_qobject(&qlit, qobj));
 
     qobject_unref(qobj);
+
+    for (i = 0; i < ARRAY_SIZE(values); i++) {
+        int j;
+        QObject *o = qobject_from_qlit(&values[i]);
+        for (j = 0; j < ARRAY_SIZE(values); j++) {
+            g_assert(qlit_equal_qobject(&values[j], o) == (i == j));
+        }
+        qobject_unref(o);
+    }
+
 }
 
 static void qlit_equal_large_qnum_test(void)
-- 
2.28.0



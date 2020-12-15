Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E372DB36B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:14:38 +0100 (CET)
Received: from localhost ([::1]:49504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEqL-0004Qx-5m
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXS-0003EY-JC
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXJ-0001Um-FU
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EN4h4pspMaL5tHdLo1wEXFtqGIaodMlUXMniWZSfAQQ=;
 b=JJFlfFYyMtPGhaFk3fjrVDxoZzWjyDqqZ8mfPXQmN7lfmyB9iUdV3JoxwnGvo0lD/d1+vc
 8o7PYKIEfoJCyswC071Byphn4iWYiw77dcX7rpOKp7qvbk/lXHM2wprC/LqyVk3COunGng
 17DWc2qMhYC4WpHJG4nu3cOHETS1naQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-HJOenxIvN-aUleXuUQSBDw-1; Tue, 15 Dec 2020 12:54:54 -0500
X-MC-Unique: HJOenxIvN-aUleXuUQSBDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5279A107ACE4;
 Tue, 15 Dec 2020 17:54:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03E4310023B7;
 Tue, 15 Dec 2020 17:54:52 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/45] qtest/pvpanic: Test panic option that allows VM to
 continue
Date: Tue, 15 Dec 2020 12:54:17 -0500
Message-Id: <20201215175445.1272776-18-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>

Test the scenario where the -action panic=none parameter is used to
signal that the VM must continue executing after a guest panic
occurs.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Message-Id: <1607705564-26264-5-git-send-email-alejandro.j.jimenez@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/pvpanic-test.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/pvpanic-test.c b/tests/qtest/pvpanic-test.c
index 016b32ebee..6dcad2db49 100644
--- a/tests/qtest/pvpanic-test.c
+++ b/tests/qtest/pvpanic-test.c
@@ -11,13 +11,36 @@
 #include "libqos/libqtest.h"
 #include "qapi/qmp/qdict.h"
 
+static void test_panic_nopause(void)
+{
+    uint8_t val;
+    QDict *response, *data;
+    QTestState *qts;
+
+    qts = qtest_init("-device pvpanic -action panic=none");
+
+    val = qtest_inb(qts, 0x505);
+    g_assert_cmpuint(val, ==, 3);
+
+    qtest_outb(qts, 0x505, 0x1);
+
+    response = qtest_qmp_eventwait_ref(qts, "GUEST_PANICKED");
+    g_assert(qdict_haskey(response, "data"));
+    data = qdict_get_qdict(response, "data");
+    g_assert(qdict_haskey(data, "action"));
+    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "run");
+    qobject_unref(response);
+
+    qtest_quit(qts);
+}
+
 static void test_panic(void)
 {
     uint8_t val;
     QDict *response, *data;
     QTestState *qts;
 
-    qts = qtest_init("-device pvpanic");
+    qts = qtest_init("-device pvpanic -action panic=pause");
 
     val = qtest_inb(qts, 0x505);
     g_assert_cmpuint(val, ==, 3);
@@ -40,6 +63,7 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
     qtest_add_func("/pvpanic/panic", test_panic);
+    qtest_add_func("/pvpanic/panic-nopause", test_panic_nopause);
 
     ret = g_test_run();
 
-- 
2.26.2




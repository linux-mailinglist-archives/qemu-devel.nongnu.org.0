Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2E75AB7E9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:01:11 +0200 (CEST)
Received: from localhost ([::1]:54662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUAyc-0003OP-Fy
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZU-00067z-4I
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZS-0007Pm-PD
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662140109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQdll7nGgspri6jdxOdATRvEXY0Mon2mwz4f1NoThw0=;
 b=dBFpALu5iTXOm+RpGYlFbPQAwzgb4Nl7WSKIzfAmt9tyZHmcecUjMBQX8wbhEp9v2yhyQt
 Ev0wARfhcWtK7BFoDbGp2RoPUPGLRSVwBq4KMArpbUtkLzi346h0Rh+rwr/c2+bv6i8KFz
 4DGqsMHRZSd3do2mG6mCt3LpDb+dK98=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-rE7FxfhGOWmLVOPiyerjIg-1; Fri, 02 Sep 2022 13:35:07 -0400
X-MC-Unique: rE7FxfhGOWmLVOPiyerjIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F08538149B0;
 Fri,  2 Sep 2022 17:35:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A7CFC15BB3;
 Fri,  2 Sep 2022 17:35:04 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 4/8] tests: Only run intel-hda-tests if machine type is
 compiled in
Date: Fri,  2 Sep 2022 19:34:48 +0200
Message-Id: <20220902173452.1904-5-quintela@redhat.com>
In-Reply-To: <20220902173452.1904-1-quintela@redhat.com>
References: <20220902173452.1904-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/intel-hda-test.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/intel-hda-test.c b/tests/qtest/intel-hda-test.c
index a58c98e4d1..d4a8db6fd6 100644
--- a/tests/qtest/intel-hda-test.c
+++ b/tests/qtest/intel-hda-test.c
@@ -18,7 +18,7 @@
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void ich6_test(void)
 {
-    qtest_start("-device intel-hda,id=" HDA_ID CODEC_DEVICES);
+    qtest_start("-machine pc -device intel-hda,id=" HDA_ID CODEC_DEVICES);
     qtest_end();
 }
 
@@ -65,9 +65,12 @@ static void test_issue542_ich6(void)
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
-    qtest_add_func("/intel-hda/ich6", ich6_test);
-    qtest_add_func("/intel-hda/ich9", ich9_test);
-    qtest_add_func("/intel-hda/fuzz/issue542", test_issue542_ich6);
-
+    if (qtest_has_machine("pc")) {
+        qtest_add_func("/intel-hda/ich6", ich6_test);
+    }
+    if (qtest_has_machine("q35")) {
+        qtest_add_func("/intel-hda/ich9", ich9_test);
+        qtest_add_func("/intel-hda/fuzz/issue542", test_issue542_ich6);
+    }
     return g_test_run();
 }
-- 
2.37.2



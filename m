Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA675AB7B2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 19:43:38 +0200 (CEST)
Received: from localhost ([::1]:47472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUAhY-0003yi-4p
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 13:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZa-00069N-7a
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZY-0007Q6-PJ
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662140112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApSn2KYxR7ytCk4xjPMLRcMMosHBmfw2kOsaFELK4bw=;
 b=eu5bW723pnLNsqMHlp9j9KSmV/1SWoowniDE2znj2jAQiEAKlRCL69+k/mx2aj2x1Ry/7d
 bQ3MiNjCSIsgYjcUR9J9OKDfVLCpudXmLUpD+JuVav1KwO0oiVIBrY9bMSNnDQLqrLFe6M
 GtcTQvwQsJACOD65DWjrh9+gnaJFoq4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-5-z6yvA2NAGOqqYZXOBFEQ-1; Fri, 02 Sep 2022 13:35:09 -0400
X-MC-Unique: 5-z6yvA2NAGOqqYZXOBFEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29FE2801231;
 Fri,  2 Sep 2022 17:35:09 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E18A2C15BB3;
 Fri,  2 Sep 2022 17:35:06 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 5/8] tests: sb16 has both pc and q35 tests
Date: Fri,  2 Sep 2022 19:34:49 +0200
Message-Id: <20220902173452.1904-6-quintela@redhat.com>
In-Reply-To: <20220902173452.1904-1-quintela@redhat.com>
References: <20220902173452.1904-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Check that the machines are compiled in before calling it

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/fuzz-sb16-test.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
index dd1b4b307f..fc445b1871 100644
--- a/tests/qtest/fuzz-sb16-test.c
+++ b/tests/qtest/fuzz-sb16-test.c
@@ -57,9 +57,13 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
-    qtest_add_func("fuzz/test_fuzz_sb16/1c", test_fuzz_sb16_0x1c);
-    qtest_add_func("fuzz/test_fuzz_sb16/91", test_fuzz_sb16_0x91);
-    qtest_add_func("fuzz/test_fuzz_sb16/d4", test_fuzz_sb16_0xd4);
+    if (qtest_has_machine("q35")) {
+        qtest_add_func("fuzz/test_fuzz_sb16/1c", test_fuzz_sb16_0x1c);
+    }
+    if (qtest_has_machine("pc")) {
+        qtest_add_func("fuzz/test_fuzz_sb16/91", test_fuzz_sb16_0x91);
+        qtest_add_func("fuzz/test_fuzz_sb16/d4", test_fuzz_sb16_0xd4);
+    }
 
     return g_test_run();
 }
-- 
2.37.2



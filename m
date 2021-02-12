Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D46319D64
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 12:33:28 +0100 (CET)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAWhT-0002fN-C0
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 06:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lAWg3-0002Eh-Tn
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:31:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lAWfz-00034v-Tp
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613129513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E+61kI5XOl7UekclkdGXrMy2v0XueJG+1Du9poh81F0=;
 b=G+FVzwOm3RVt0nkf4qoRe/7EsPPxGijmFbuJAiHSz6PBD+AFNgWFooUk7FoJtt0yLptw5v
 KjgnalZeT/tCF/BgTJmNzsqHVQO+MwgjmIbBJki7K2AyfBq1yWh8l5Aris96xUtLSpkwh+
 GpI7+vH9HWZIS0S97VmQfmHpr4Y3ous=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-gX7tHHQkNBOJgaVspwV-gg-1; Fri, 12 Feb 2021 06:31:52 -0500
X-MC-Unique: gX7tHHQkNBOJgaVspwV-gg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25523107ACC7;
 Fri, 12 Feb 2021 11:31:51 +0000 (UTC)
Received: from thuth.com (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE19C10016F9;
 Fri, 12 Feb 2021 11:31:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] tests/qtest/boot-sector: Check that the guest did not panic
Date: Fri, 12 Feb 2021 12:31:41 +0100
Message-Id: <20210212113141.854871-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The s390-ccw bios code panics if it can not boot successfully. In
this case, it does not make sense that we wait the full 600 seconds
for the boot sector test to finish and can signal the failure
immediately, thus let's check the status of the guest with the
"query-status" QMP command here, too.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/boot-sector.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c
index 24df5c4734..ea8f264661 100644
--- a/tests/qtest/boot-sector.c
+++ b/tests/qtest/boot-sector.c
@@ -138,6 +138,7 @@ void boot_sector_test(QTestState *qts)
     uint8_t signature_low;
     uint8_t signature_high;
     uint16_t signature;
+    QDict *qrsp, *qret;
     int i;
 
     /* Wait at most 600 seconds (test is slow with TCI and --enable-debug) */
@@ -155,6 +156,14 @@ void boot_sector_test(QTestState *qts)
         if (signature == SIGNATURE) {
             break;
         }
+
+        /* check that guest is still in "running" state and did not panic */
+        qrsp = qtest_qmp(qts, "{ 'execute': 'query-status' }");
+        qret = qdict_get_qdict(qrsp, "return");
+        g_assert_nonnull(qret);
+        g_assert_cmpstr(qdict_get_try_str(qret, "status"), ==, "running");
+        qobject_unref(qrsp);
+
         g_usleep(TEST_DELAY);
     }
 
-- 
2.27.0



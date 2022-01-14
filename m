Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E8548EBB1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:31:46 +0100 (CET)
Received: from localhost ([::1]:33032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NcF-0004pO-TO
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:31:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n8NXl-0001Mi-PN
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:27:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n8NXi-00063o-6I
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642170421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gz/PlscR5ViT7vQuPMAg6A6391eeD9oieYHYP7x78u8=;
 b=PAFFILQ1c/piFBeXdfjY/zCgkkbCkQ8UDiJm/iLfkqHoOpmWXVJ0Qpw+YFFFnsuTCoAQx6
 nUqiB6+z+zN8HxhU5KX4L6nBk5WSVDF3MNxmAZVJWuHykicXVGWiPAY4DIIjavo755ruDa
 Jv61oxXPITN3TlLRugpZJsnJ/VOezgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-II2_i3r6MXeksaibe9e4Xw-1; Fri, 14 Jan 2022 09:26:58 -0500
X-MC-Unique: II2_i3r6MXeksaibe9e4Xw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1472781EE60;
 Fri, 14 Jan 2022 14:26:57 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64332798D8;
 Fri, 14 Jan 2022 14:26:45 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/4] tests: acpi: test short OEM_ID/OEM_TABLE_ID values in
 test_oem_fields()
Date: Fri, 14 Jan 2022 09:26:41 -0500
Message-Id: <20220114142641.1727679-1-imammedo@redhat.com>
In-Reply-To: <20220112130332.1648664-1-imammedo@redhat.com>
References: <20220112130332.1648664-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ani@anisinha.ca, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previous patch [1] added explicit whitespace padding to OEM_ID/OEM_TABLE_ID
values used in test_oem_fields() testcase to avoid false positive and
bisection issues when QEMU is switched to \0' padding. As result
testcase ceased to test values that were shorter than max possible
length values.

Update testcase to make sure that it's testing shorter IDs like it
used to before [2].

1) "tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for  test_oem_fields() test"
2) 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 90c9f6a0a2..ad536fd7b1 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -71,10 +71,10 @@
 
 #define ACPI_REBUILD_EXPECTED_AML "TEST_ACPI_REBUILD_AML"
 
-#define OEM_ID             "TEST  "
-#define OEM_TABLE_ID       "OEM     "
-#define OEM_TEST_ARGS      "-machine x-oem-id='" OEM_ID "',x-oem-table-id='" \
-                           OEM_TABLE_ID "'"
+#define OEM_ID             "TEST"
+#define OEM_TABLE_ID       "OEM"
+#define OEM_TEST_ARGS      "-machine x-oem-id=" OEM_ID ",x-oem-table-id=" \
+                           OEM_TABLE_ID
 
 typedef struct {
     bool tcg_only;
@@ -1530,8 +1530,8 @@ static void test_oem_fields(test_data *data)
             continue;
         }
 
-        g_assert(memcmp(sdt->aml + 10, OEM_ID, 6) == 0);
-        g_assert(memcmp(sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
+        g_assert(strncmp((char *)sdt->aml + 10, OEM_ID, 6) == 0);
+        g_assert(strncmp((char *)sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
     }
 }
 
-- 
2.31.1



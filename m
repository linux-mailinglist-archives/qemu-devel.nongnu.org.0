Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067CB48C5A5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:12:22 +0100 (CET)
Received: from localhost ([::1]:37382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eMN-0002JX-AA
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:12:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n7dI2-0008Db-9h
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n7dHz-0001No-CW
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641992618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPj+CfTomrWRtq+kErE6MWYXsbDhzz7wOC8yTUWkY+I=;
 b=J9UF63PBjIbuqQAm3QKdeZQoOCqP7EZzd8FF7OY+HBW+5+ru7Dr7l1FBvzVnAz+B7Efom+
 Lz28J/4d5F1j3tp28ShWvSqmhm8V6LaOTODtl1CQODHXKxjbf86CHXObzSpWbilT8tYx/N
 imlS8kVooYfacp2cyG+JKTihde56E08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-vP1qcj0SPlG7UCEQBxIlpg-1; Wed, 12 Jan 2022 08:03:37 -0500
X-MC-Unique: vP1qcj0SPlG7UCEQBxIlpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10DD985B6C2;
 Wed, 12 Jan 2022 13:03:36 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 134E67B6F8;
 Wed, 12 Jan 2022 13:03:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for
 test_oem_fields() test
Date: Wed, 12 Jan 2022 08:03:29 -0500
Message-Id: <20220112130332.1648664-2-imammedo@redhat.com>
In-Reply-To: <20220112130332.1648664-1-imammedo@redhat.com>
References: <20220112130332.1648664-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
Cc: Ani Sinha <ani@anisinha.ca>, Marian Postevca <posteuca@mutex.one>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next commit will revert OEM fields padding with whitespace to
padding with '\0' as it was before [1]. As result test_oem_fields() will
fail due to unexpectedly smaller ID sizes read from QEMU ACPI tables.

Pad OEM_ID/OEM_TABLE_ID manually with spaces so that values the test
puts on QEMU CLI and expected values match.

1) 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e6b72d9026..90c9f6a0a2 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -71,9 +71,10 @@
 
 #define ACPI_REBUILD_EXPECTED_AML "TEST_ACPI_REBUILD_AML"
 
-#define OEM_ID             "TEST"
-#define OEM_TABLE_ID       "OEM"
-#define OEM_TEST_ARGS      "-machine x-oem-id="OEM_ID",x-oem-table-id="OEM_TABLE_ID
+#define OEM_ID             "TEST  "
+#define OEM_TABLE_ID       "OEM     "
+#define OEM_TEST_ARGS      "-machine x-oem-id='" OEM_ID "',x-oem-table-id='" \
+                           OEM_TABLE_ID "'"
 
 typedef struct {
     bool tcg_only;
@@ -1519,11 +1520,7 @@ static void test_acpi_q35_slic(void)
 static void test_oem_fields(test_data *data)
 {
     int i;
-    char oem_id[6];
-    char oem_table_id[8];
 
-    strpadcpy(oem_id, sizeof oem_id, OEM_ID, ' ');
-    strpadcpy(oem_table_id, sizeof oem_table_id, OEM_TABLE_ID, ' ');
     for (i = 0; i < data->tables->len; ++i) {
         AcpiSdtTable *sdt;
 
@@ -1533,8 +1530,8 @@ static void test_oem_fields(test_data *data)
             continue;
         }
 
-        g_assert(memcmp(sdt->aml + 10, oem_id, 6) == 0);
-        g_assert(memcmp(sdt->aml + 16, oem_table_id, 8) == 0);
+        g_assert(memcmp(sdt->aml + 10, OEM_ID, 6) == 0);
+        g_assert(memcmp(sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
     }
 }
 
-- 
2.31.1



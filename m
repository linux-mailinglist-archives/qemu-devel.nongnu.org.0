Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09955F496
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 10:30:03 +0200 (CEST)
Received: from localhost ([::1]:43510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hix7z-0003qy-0n
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 04:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54106)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hix6B-0002vq-Iy
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 04:28:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hix69-0001mj-Dk
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 04:28:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52722)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hix64-0001ec-WA
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 04:28:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 91DB6308216C
 for <qemu-devel@nongnu.org>; Thu,  4 Jul 2019 08:27:53 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E47215944E;
 Thu,  4 Jul 2019 08:27:52 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Jul 2019 04:27:36 -0400
Message-Id: <20190704082736.25258-3-imammedo@redhat.com>
In-Reply-To: <20190704082736.25258-1-imammedo@redhat.com>
References: <20190704082736.25258-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 04 Jul 2019 08:27:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/2] tests: acpi: do not skip tests when IASL
 is not installed
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tests do binary comparition so we can check tables without
IASL. Move IASL condition right before decompilation step
and skip it if IASL is not installed.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/bios-tables-test.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 13bd166b81..a356ac3489 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -389,6 +389,14 @@ static void test_acpi_asl(test_data *data)
         all_tables_match = all_tables_match &&
             test_acpi_find_diff_allowed(exp_sdt);
 
+        /*
+         * don't try to decompile if IASL isn't present, in this case user
+         * will just 'get binary file mismatch' warnings and test failure
+         */
+        if (!iasl) {
+            continue;
+        }
+
         err = load_asl(data->tables, sdt);
         asl = normalize_asl(sdt->asl);
 
@@ -431,6 +439,11 @@ static void test_acpi_asl(test_data *data)
         g_string_free(asl, true);
         g_string_free(exp_asl, true);
     }
+    if (!iasl && !all_tables_match) {
+        fprintf(stderr, "to see ASL diff between mismatched files install IASL,"
+                " rebuild QEMU from scratch and re-run tests with V=1"
+                " environment variable set");
+    }
     g_assert(all_tables_match);
 
     free_test_data(&exp_data);
@@ -599,7 +612,7 @@ static void test_acpi_one(const char *params, test_data *data)
 
     if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
         dump_aml_files(data, true);
-    } else if (iasl) {
+    } else {
         test_acpi_asl(data);
     }
 
-- 
2.18.1



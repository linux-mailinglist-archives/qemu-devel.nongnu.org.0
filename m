Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345015F49D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 10:32:30 +0200 (CEST)
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hixAL-0005e3-Cv
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 04:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54105)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hix6B-0002vp-Iu
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 04:28:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hix69-0001mb-CM
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 04:28:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7394)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hix61-0001eU-Cb
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 04:28:04 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A100A37F43
 for <qemu-devel@nongnu.org>; Thu,  4 Jul 2019 08:27:52 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0874259441;
 Thu,  4 Jul 2019 08:27:47 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Jul 2019 04:27:35 -0400
Message-Id: <20190704082736.25258-2-imammedo@redhat.com>
In-Reply-To: <20190704082736.25258-1-imammedo@redhat.com>
References: <20190704082736.25258-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 04 Jul 2019 08:27:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/2] tests: acpi: do not require IASL for
 dumping AML blobs
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

IASL isn't needed when dumping ACPI tables from guest for
rebuild purposes. So move this part out from IASL branch.

Makes rebuild-expected-aml.sh work without IASL installed
on host.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/bios-tables-test.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index d863233fe9..13bd166b81 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -597,12 +597,10 @@ static void test_acpi_one(const char *params, test_data *data)
     test_acpi_rxsdt_table(data);
     test_acpi_fadt_table(data);
 
-    if (iasl) {
-        if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
-            dump_aml_files(data, true);
-        } else {
-            test_acpi_asl(data);
-        }
+    if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
+        dump_aml_files(data, true);
+    } else if (iasl) {
+        test_acpi_asl(data);
     }
 
     /*
-- 
2.18.1



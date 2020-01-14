Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCEF13B00C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 17:53:23 +0100 (CET)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irPRR-0001CK-Md
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 11:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1irPQS-0000dk-Se
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 11:52:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1irPQR-0001F9-NO
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 11:52:20 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2679 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1irPQR-00016g-Bv
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 11:52:19 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D3308940A5AE77FA1754;
 Wed, 15 Jan 2020 00:52:09 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Wed, 15 Jan 2020 00:52:01 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <imammedo@redhat.com>, <mst@redhat.com>,
 <thuth@redhat.com>
Subject: [PATCH] tests: acpi: update path in rebuild-expected-aml
Date: Tue, 14 Jan 2020 16:51:38 +0000
Message-ID: <20200114165138.15716-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 1e8a1fae7464("test: Move qtests to a separate
directory") qtests are now placed in a separate folder and
this breaks the script used to rebuild the expected ACPI
tables for bios-tables-test. Update the script with correct
path.

Fixes: 1e8a1fae7464("test: Move qtests to a separate directory")
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 tests/data/acpi/rebuild-expected-aml.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/data/acpi/rebuild-expected-aml.sh b/tests/data/acpi/rebuild-expected-aml.sh
index f89d4624bc..d44e511533 100755
--- a/tests/data/acpi/rebuild-expected-aml.sh
+++ b/tests/data/acpi/rebuild-expected-aml.sh
@@ -14,7 +14,7 @@
 
 qemu_bins="x86_64-softmmu/qemu-system-x86_64 aarch64-softmmu/qemu-system-aarch64"
 
-if [ ! -e "tests/bios-tables-test" ]; then
+if [ ! -e "tests/qtest/bios-tables-test" ]; then
     echo "Test: bios-tables-test is required! Run make check before this script."
     echo "Run this script from the build directory."
     exit 1;
@@ -26,11 +26,11 @@ for qemu in $qemu_bins; do
         echo "Also, run this script from the build directory."
         exit 1;
     fi
-    TEST_ACPI_REBUILD_AML=y QTEST_QEMU_BINARY=$qemu tests/bios-tables-test
+    TEST_ACPI_REBUILD_AML=y QTEST_QEMU_BINARY=$qemu tests/qtest/bios-tables-test
 done
 
 eval `grep SRC_PATH= config-host.mak`
 
-echo '/* List of comma-separated changed AML files to ignore */' > ${SRC_PATH}/tests/bios-tables-test-allowed-diff.h
+echo '/* List of comma-separated changed AML files to ignore */' > ${SRC_PATH}/tests/qtest/bios-tables-test-allowed-diff.h
 
 echo "The files were rebuilt and can be added to git."
-- 
2.17.1




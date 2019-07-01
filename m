Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3B111C38
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 17:09:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMDL1-0002E5-8n
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 11:09:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hMD4e-0005VS-Sb
	for qemu-devel@nongnu.org; Thu, 02 May 2019 10:52:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hMD4d-00030j-TH
	for qemu-devel@nongnu.org; Thu, 02 May 2019 10:52:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56328)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hMD4b-0002yx-Sa
	for qemu-devel@nongnu.org; Thu, 02 May 2019 10:52:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 947258831D;
	Thu,  2 May 2019 14:52:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B4A671C80;
	Thu,  2 May 2019 14:52:28 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 16:51:58 +0200
Message-Id: <1556808723-226478-11-git-send-email-imammedo@redhat.com>
In-Reply-To: <1556808723-226478-1-git-send-email-imammedo@redhat.com>
References: <1556808723-226478-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 02 May 2019 14:52:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 10/15] tests: acpi: ignore SMBIOS tests when
 UEFI firmware is used
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, linuxarm@huawei.com,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, Gonglei <arei.gonglei@huawei.com>,
	Wei Yang <richardw.yang@linux.intel.com>, xuwei5@huawei.com,
	xuwei5@hisilicon.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

once FW provides a pointer to SMBIOS entry point like it does for
RSDP it should be possible to enable this one the same way.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
v3:
  - add ref to a uefi-test-tools feature req into comment (Laszlo)
---
 tests/bios-tables-test.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 84e1ce2..8302ffc 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -569,8 +569,15 @@ static void test_acpi_one(const char *params, test_data *data)
         }
     }
 
-    test_smbios_entry_point(data);
-    test_smbios_structs(data);
+    /*
+     * TODO: make SMBIOS tests work with UEFI firmware,
+     * Bug on uefi-test-tools to provide entry point:
+     * https://bugs.launchpad.net/qemu/+bug/1821884
+     */
+    if (!use_uefi) {
+        test_smbios_entry_point(data);
+        test_smbios_structs(data);
+    }
 
     assert(!global_qtest);
     qtest_quit(data->qts);
-- 
2.7.4



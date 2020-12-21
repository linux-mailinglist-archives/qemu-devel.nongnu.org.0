Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843DE2DFC31
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:07:47 +0100 (CET)
Received: from localhost ([::1]:36800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krKug-0004Nn-J4
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1krKqK-0001CJ-IC
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:03:16 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1krKqG-0005pw-R2
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:03:15 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D004K19XCz7JDm;
 Mon, 21 Dec 2020 21:02:25 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Mon, 21 Dec 2020
 21:02:59 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 5/6] acpi: Enable pxb unit-test for ARM virt machine
Date: Mon, 21 Dec 2020 21:02:15 +0800
Message-ID: <20201221130216.6086-6-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201221130216.6086-1-cenjiahui@huawei.com>
References: <20201221130216.6086-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=cenjiahui@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, Jiahui Cen <cenjiahui@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No matter whether the pxb is enabled or not, the CONFIG_PXB macro in test
would keep undefined. And since pxb is now enabled for ARM Virt machine
by default, let's enable pxb unit-test by removing the CONFIG_PXB.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 tests/qtest/bios-tables-test.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4e026f90d0..669202fc95 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1196,7 +1196,6 @@ static void test_acpi_virt_tcg_numamem(void)
 
 }
 
-#ifdef CONFIG_PXB
 static void test_acpi_virt_tcg_pxb(void)
 {
     test_data data = {
@@ -1228,7 +1227,6 @@ static void test_acpi_virt_tcg_pxb(void)
 
     free_test_data(&data);
 }
-#endif
 
 static void test_acpi_tcg_acpi_hmat(const char *machine)
 {
@@ -1342,9 +1340,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-#ifdef CONFIG_PXB
         qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-#endif
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.28.0



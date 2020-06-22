Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D820360E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 13:45:48 +0200 (CEST)
Received: from localhost ([::1]:39304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnKtV-0000C5-Rb
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 07:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu@huawei.com>)
 id 1jnKeq-0004rF-06; Mon, 22 Jun 2020 07:30:36 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3713 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu@huawei.com>)
 id 1jnKen-0000F4-2X; Mon, 22 Jun 2020 07:30:35 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3CEAEEF0DB6EF6E7C302;
 Mon, 22 Jun 2020 19:30:23 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 22 Jun 2020
 19:30:14 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <mst@redhat.com>, <imammedo@redhat.com>
Subject: [PATCH] ACPI: Assert that we don't run out of the preallocated memory
Date: Mon, 22 Jun 2020 19:31:46 +0800
Message-ID: <20200622113146.33421-1-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=gengdongjiu@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 07:30:24
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: zhengxiang9@huawei.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 linuxarm@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

data_length is a constant value, so we use assert instead of
condition check.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
1. Address Peter and Michael's comments to use assert instead of if().
https://lore.kernel.org/qemu-devel/ca79ea28-9ea9-18a5-99ad-25c3eb744721@huawei.com/
---
 hw/acpi/ghes.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index b363bc331d..f0ee9f51ca 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -204,16 +204,12 @@ static int acpi_ghes_record_mem_error(uint64_t error_block_address,
 
     /* This is the length if adding a new generic error data entry*/
     data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
-
     /*
-     * Check whether it will run out of the preallocated memory if adding a new
-     * generic error data entry
+     * It should not run out of the preallocated memory if adding a new generic
+     * error data entry
      */
-    if ((data_length + ACPI_GHES_GESB_SIZE) > ACPI_GHES_MAX_RAW_DATA_LENGTH) {
-        error_report("Not enough memory to record new CPER!!!");
-        g_array_free(block, true);
-        return -1;
-    }
+    assert((data_length + ACPI_GHES_GESB_SIZE) <=
+            ACPI_GHES_MAX_RAW_DATA_LENGTH);
 
     /* Build the new generic error status block header */
     acpi_ghes_generic_error_status(block, ACPI_GEBS_UNCORRECTABLE,
-- 
2.17.1



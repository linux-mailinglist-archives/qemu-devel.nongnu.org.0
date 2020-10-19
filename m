Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD72924B0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 11:35:43 +0200 (CEST)
Received: from localhost ([::1]:54610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kURZu-00080T-EW
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 05:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kURYg-0007XO-6O
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 05:34:26 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5252 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kURYe-0000ZI-94
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 05:34:25 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BD57F6D7A71DFF2AE66E;
 Mon, 19 Oct 2020 17:34:11 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Mon, 19 Oct 2020 17:34:01 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] ACPI: Avoid infinite recursion when dump-vmstate
Date: Mon, 19 Oct 2020 17:31:56 +0800
Message-ID: <20201019093156.2993284-1-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 05:17:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: liangpeng10@huawei.com, imammedo@redhat.com, zhang.zhanghailiang@huawei.com,
 xiexiangyou@huawei.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a field with vmstate_ghes_state as vmsd in vmstate_ghes_state,
which will lead to infinite recursion in dump_vmstate_vmsd.

Fixes: a08a64627b ("ACPI: Record the Generic Error Status Block address")
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 hw/acpi/generic_event_device.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 6df400e1ee16..4b6867300a55 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -334,8 +334,7 @@ static const VMStateDescription vmstate_ghes_state = {
     .minimum_version_id = 1,
     .needed = ghes_needed,
     .fields      = (VMStateField[]) {
-        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
-                       vmstate_ghes_state, AcpiGhesState),
+        VMSTATE_UINT64(ghes_state.ghes_addr_le, AcpiGedState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9022AFD71
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 03:11:57 +0100 (CET)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd25c-0008KP-HU
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 21:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kd24X-0007un-7A
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 21:10:49 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kd24U-0004Fg-Gz
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 21:10:48 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CWlS80Jwzz15NwY;
 Thu, 12 Nov 2020 10:10:32 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Nov 2020 10:10:34 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2] ACPI: Avoid infinite recursion when dump-vmstate
Date: Thu, 12 Nov 2020 10:06:38 +0800
Message-ID: <20201112020638.874515-1-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 21:10:42
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: zhang.zhanghailiang@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 xiexiangyou@huawei.com, liangpeng10@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a field with vmstate_ghes_state as vmsd in vmstate_ghes_state,
which will lead to infinite recursion in dump_vmstate_vmsd.

Fixes: a08a64627b ("ACPI: Record the Generic Error Status Block address")
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 6df400e1ee16..5454be67d5f0 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -322,6 +322,16 @@ static const VMStateDescription vmstate_ged_state = {
     }
 };
 
+static const VMStateDescription vmstate_ghes = {
+    .name = "acpi-ghes",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields     = (VMStateField[]) {
+        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static bool ghes_needed(void *opaque)
 {
     AcpiGedState *s = opaque;
@@ -335,7 +345,7 @@ static const VMStateDescription vmstate_ghes_state = {
     .needed = ghes_needed,
     .fields      = (VMStateField[]) {
         VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
-                       vmstate_ghes_state, AcpiGhesState),
+                       vmstate_ghes, AcpiGhesState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.26.2



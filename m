Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF9E1981AD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 18:52:16 +0200 (CEST)
Received: from localhost ([::1]:52980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIxe3-00036R-KY
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 12:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53565)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcH-0001Em-9l
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 12:50:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcG-0004tt-AP
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 12:50:25 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33398 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcD-0004p6-Dc; Mon, 30 Mar 2020 12:50:21 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 09E7E890079DE5EF0139;
 Tue, 31 Mar 2020 00:50:18 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.27.100) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 31 Mar 2020 00:50:08 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH for-5.0 1/3] acpi: Use macro for table-loader file name
Date: Mon, 30 Mar 2020 17:49:07 +0100
Message-ID: <20200330164909.28324-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200330164909.28324-1-shameerali.kolothum.thodi@huawei.com>
References: <20200330164909.28324-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.27.100]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use macro for "etc/table-loader" and move it to the header
file similar to ACPI_BUILD_TABLE_FILE/ACPI_BUILD_RSDP_FILE etc.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c    | 2 +-
 hw/i386/acpi-build.c        | 2 +-
 include/hw/acpi/aml-build.h | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fb4b166f82..c13710b727 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -929,7 +929,7 @@ void virt_acpi_setup(VirtMachineState *vms)
 
     build_state->linker_mr =
         acpi_add_rom_blob(virt_acpi_build_update, build_state,
-                          tables.linker->cmd_blob, "etc/table-loader", 0);
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
 
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
                     acpi_data_len(tables.tcpalog));
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9a19c14e66..80f05d728d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -3043,7 +3043,7 @@ void acpi_setup(void)
 
     build_state->linker_mr =
         acpi_add_rom_blob(acpi_build_update, build_state,
-                          tables.linker->cmd_blob, "etc/table-loader", 0);
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
 
     fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index de4a406568..0f4ed53d7f 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -13,6 +13,7 @@
 #define ACPI_BUILD_TABLE_FILE "etc/acpi/tables"
 #define ACPI_BUILD_RSDP_FILE "etc/acpi/rsdp"
 #define ACPI_BUILD_TPMLOG_FILE "etc/tpm/log"
+#define ACPI_BUILD_LOADER_FILE "etc/table-loader"
 
 #define AML_NOTIFY_METHOD "NTFY"
 
-- 
2.17.1




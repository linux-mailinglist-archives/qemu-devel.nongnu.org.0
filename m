Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525B8424C31
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 05:17:42 +0200 (CEST)
Received: from localhost ([::1]:51772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYJuf-0001At-Bd
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 23:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYJlU-0004te-RE; Wed, 06 Oct 2021 23:08:12 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYJlR-00018o-7V; Wed, 06 Oct 2021 23:08:12 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HPx3W5CnTzbcwl;
 Thu,  7 Oct 2021 11:03:35 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:07:55 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:07:54 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v7 5/8] hw/acpi/aml-build: Add PPTT table
Date: Thu, 7 Oct 2021 11:07:43 +0800
Message-ID: <20211007030746.10420-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211007030746.10420-1-wangyanan55@huawei.com>
References: <20211007030746.10420-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

Add the Processor Properties Topology Table (PPTT) used to
describe CPU topology information to ACPI guests.

Note, a DT-boot Linux guest with a non-flat CPU topology will
see socket and core IDs being sequential integers starting
from zero, which is different from ACPI-boot Linux guest,
e.g. with -smp 4,sockets=2,cores=2,threads=1

a DT boot produces:

 cpu:  0 package_id:  0 core_id:  0
 cpu:  1 package_id:  0 core_id:  1
 cpu:  2 package_id:  1 core_id:  0
 cpu:  3 package_id:  1 core_id:  1

an ACPI boot produces:

 cpu:  0 package_id: 36 core_id:  0
 cpu:  1 package_id: 36 core_id:  1
 cpu:  2 package_id: 96 core_id:  2
 cpu:  3 package_id: 96 core_id:  3

This is due to several reasons:

 1) DT cpu nodes do not have an equivalent field to what the PPTT
    ACPI Processor ID must be, i.e. something equal to the MADT CPU
    UID or equal to the UID of an ACPI processor container. In both
    ACPI cases those are platform dependant IDs assigned by the
    vendor.

 2) While QEMU is the vendor for a guest, if the topology specifies
    SMT (> 1 thread), then, with ACPI, it is impossible to assign a
    core-id the same value as a package-id, thus it is not possible
    to have package-id=0 and core-id=0. This is because package and
    core containers must be in the same ACPI namespace and therefore
    must have unique UIDs.

 3) ACPI processor containers are not mandatorily required for PPTT
    tables to be used and, due to the limitations of which IDs are
    selected described above in (2), they are not helpful for QEMU,
    so we don't build them with this patch. In the absence of them,
    Linux assigns its own unique IDs. The maintainers have chosen not
    to use counters from zero, but rather ACPI table offsets, which
    explains why the numbers are so much larger than with DT.

 4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
    match the logical CPU IDs, because these IDs must be equal to the
    MADT CPU UID (as no processor containers are present), and QEMU
    uses the logical CPU ID for these MADT IDs.

So in summary, with QEMU as the vendor for the guests, we simply
use sequential integers starting from zero for the non-leaf nodes
but with ID-valid flag unset, so that guest will ignore them and
use table offsets as unique container IDs. And we use logical CPU
IDs for the leaf nodes with the ID-valid flag set, which will be
consistent with MADT.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/aml-build.c         | 60 +++++++++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h |  3 ++
 2 files changed, 63 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index b7b9db6888..0d50e88e9d 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1990,6 +1990,66 @@ void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
     }
 }
 
+/* ACPI 6.2: 5.2.29 Processor Properties Topology Table (PPTT) */
+void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
+                const char *oem_id, const char *oem_table_id)
+{
+    int pptt_start = table_data->len;
+    int uid = 0;
+    int socket;
+    AcpiTable table = { .sig = "PPTT", .rev = 2,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+
+    for (socket = 0; socket < ms->smp.sockets; socket++) {
+        uint32_t socket_offset = table_data->len - pptt_start;
+        int core;
+
+        build_processor_hierarchy_node(
+            table_data,
+            /*
+             * ACPI 6.2 - Physical package
+             * represents the boundary of a physical package
+             */
+            (1 << 0),
+            0, socket, NULL, 0);
+
+        for (core = 0; core < ms->smp.cores; core++) {
+            uint32_t core_offset = table_data->len - pptt_start;
+            int thread;
+
+            if (ms->smp.threads > 1) {
+                build_processor_hierarchy_node(
+                    table_data,
+                    /*
+                     * ACPI 6.2 - Physical package
+                     * doesn't represent the boundary of a physical package
+                     */
+                    (0 << 0),
+                    socket_offset, core, NULL, 0);
+
+                for (thread = 0; thread < ms->smp.threads; thread++) {
+                    build_processor_hierarchy_node(
+                        table_data,
+                        (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
+                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
+                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
+                        core_offset, uid++, NULL, 0);
+                }
+            } else {
+                build_processor_hierarchy_node(
+                    table_data,
+                    (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
+                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
+                    socket_offset, uid++, NULL, 0);
+            }
+        }
+    }
+
+    acpi_table_end(linker, &table);
+}
+
 /* build rev1/rev3/rev5.1 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 2c457c8f17..b92706388c 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -493,6 +493,9 @@ void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
                                     uint32_t parent, uint32_t id,
                                     uint32_t *priv_rsrc, uint32_t priv_num);
 
+void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
+                const char *oem_id, const char *oem_table_id);
+
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id);
 
-- 
2.19.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E2F4366C8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:52:18 +0200 (CEST)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaMb-0005xA-KF
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx8-0000S8-P6
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:58 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:39926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx5-0002k5-TJ
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:58 -0400
Received: by mail-pg1-x531.google.com with SMTP id g184so632054pgc.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HMr9QBRkVrXrtQnoAy2rVMOzIhch4tI7pkgXe6e828Q=;
 b=DqDqkqdUlB5rl/K24R2vc/kFSa6Gwwa8DKMQyv82Bdjb7Le7zInKfMTLjkd19Zazts
 w23tqhcZ/OYyE5Bs55QYyTjOnRHaE7Pc7iHnsOKH4HIru2LAm7GaEqZdvLocTwbT6Vjg
 m4sdaVYZkhSYSr0/YeC5pMV5Syo1TX3bOOPXvJ55PZ/C2JkNRCK9q8FrQZutqt9i/3Yi
 KPgcoENhxkLLKQ4NOt6LdoeaPpaRvg1nj5+iV1lKjHAZzpkRZ7PCMK3zHIBHP8TvC7Ib
 orFiQLsXk6Zd2i3gv15TAwv+y69V+5W4dgU7EnBdNpuqxKdc1PtJBzWPttwvtmr/nvQl
 YOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HMr9QBRkVrXrtQnoAy2rVMOzIhch4tI7pkgXe6e828Q=;
 b=Kl40dEAk3HVnannVg7kGlLTc+//vzB5osnf615l4LLu3eBY5F+DdDSSEsSg08kW54t
 tTJnkWYTQyhAh58gGbJ2+z6nOmSAqa+T/3xpOiwoplhkKejbjOMFoSuzPMj7F8jnDRdA
 eZGhs4vRsZIDTf+SCpPx4++dtFoxZlJGlurfVgsSg9oxenOWfQwGucLuwBAgerpNwyXj
 R4aWwg8SKiiQhsHRbKVFM3s1bOfj9lmVab1+1CieuRAvT4+oF09RiSM7HYha5Yo6O1Gu
 kp5jM6E8HBXQ1qYZx6jVEsnUn2oIZYglPZ21KNVGubjFqYbSP/0q38NDFG2x+Q1kVPrB
 WZ3Q==
X-Gm-Message-State: AOAM531H/uyGG6XkTe7URjQuQkGsyc3wnv8V9XQMyjKpei2uBlAWi/4i
 Am+TvFK0k3VIxi8SAhxFqdfscXdOP+XTgQ==
X-Google-Smtp-Source: ABdhPJzTvAIOxTSD0fwR3BKB8exXA/mAOSgZgRVUdoE7qsBfsqTFPBU1IAO5ie4DaZfYnpu1WnQfCQ==
X-Received: by 2002:a05:6a00:1acc:b0:44d:98de:6ed6 with SMTP id
 f12-20020a056a001acc00b0044d98de6ed6mr6135842pfv.50.1634829954460; 
 Thu, 21 Oct 2021 08:25:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/19] hw/acpi/aml-build: Add PPTT table
Date: Thu, 21 Oct 2021 08:25:38 -0700
Message-Id: <20211021152541.781175-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
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

Currently the implementation of PPTT generation complies with ACPI
specification 5.2.29 (Revision 6.3). The 6.3 spec can be found at:
https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20211020142125.7516-6-wangyanan55@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/acpi/aml-build.h |  3 ++
 hw/acpi/aml-build.c         | 59 +++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 3cf6f2c1b9..8346003a22 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -489,6 +489,9 @@ void build_srat_memory(GArray *table_data, uint64_t base,
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id);
 
+void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
+                const char *oem_id, const char *oem_table_id);
+
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id);
 
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 5195324585..b3b3310df3 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1994,6 +1994,65 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
     }
 }
 
+/*
+ * ACPI spec, Revision 6.3
+ * 5.2.29 Processor Properties Topology Table (PPTT)
+ */
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
+             * Physical package - represents the boundary
+             * of a physical package
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
+                    (0 << 0), /* not a physical package */
+                    socket_offset, core, NULL, 0);
+
+                for (thread = 0; thread < ms->smp.threads; thread++) {
+                    build_processor_hierarchy_node(
+                        table_data,
+                        (1 << 1) | /* ACPI Processor ID valid */
+                        (1 << 2) | /* Processor is a Thread */
+                        (1 << 3),  /* Node is a Leaf */
+                        core_offset, uid++, NULL, 0);
+                }
+            } else {
+                build_processor_hierarchy_node(
+                    table_data,
+                    (1 << 1) | /* ACPI Processor ID valid */
+                    (1 << 3),  /* Node is a Leaf */
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
-- 
2.25.1



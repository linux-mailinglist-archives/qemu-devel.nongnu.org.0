Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB26336BB3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 06:38:49 +0100 (CET)
Received: from localhost ([::1]:50344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKE24-0007js-3B
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 00:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lKDzv-0006UO-Ti
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 00:36:35 -0500
Received: from mail-co1nam11on2133.outbound.protection.outlook.com
 ([40.107.220.133]:22657 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lKDzu-0003ph-4G
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 00:36:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Svh/SXHgrKR2as6ncgFH9yfBv4HZBdp5f11xB8W3JO3l0IC2AwvNwXFbsPpmpb9mlXZSHcDU859CVYoBufONVoRfrNFEuK34m0GLwVvkH8kUD2Nrd0VWXXREhj5dl0bHci3e5M3EbsGrmILX1/7qLV3W9OLv87HPK3p9d9opxGAHx7AOsZ/Q1WYgGiwidbLfkaS8DAYmcrKnGX8u9bBCsbihYKMpEgVE2288Os/MZmUFIFngzcRBVGVqvMj0bWGoZgzBqGvu8j/kHYY770ziljCsI0qRyAnkVUZ3GsM3f2tu4+VSw7wFaHeLu6C15p8XV7hcmhieWmMH6Q6wmDs/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JotCrOnhYtDKKSOoHfN2z7kfKOcCABYWGoxcB3x8Lo=;
 b=BMP8yYHQMvxc0dHiY/EwMr+wnYlzqDxWkDDmaIsh9o+borcCa/d0MVYWUI7rHlDKFf89E6zphf4V5T4VUZXs/dvQdRU8+mihgqpphUAOJKnL8X5dPkhB7bmcRq/SMKwp5JixcqmtHo8DkwsXg7LGOmd/THwNcIvF+wPn5pxGt3yDj1IWhXRp2H7NywBn/tk/XiZj/ZtPHuamGkzXRfi3fDIYdjteALL9ljUq49/v7Inrk23VOTEULH/OVHJdBWrAwPbLLehL2Gu/VivwqM7rSzacBMKpVlusDsLkLMgspJ364aw686lGGBvAKI1Bdg+1E13gpiaE88bsXJpsuno15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JotCrOnhYtDKKSOoHfN2z7kfKOcCABYWGoxcB3x8Lo=;
 b=Y7KUDmPY8GEEvW2vIoZyIAl2qndCbKo4LXEyXRbSVbL8jE9UIjNZrU2yz06geVSQ++UozL2mXnfkG1WUofVegXIHNdn84+aoHXK5zpqT798oNwX5X786ehW3s9dZDNHwY10Zo+h7eTM1n3H9Bdntu04/9SGVcZoMH8BXkB5W49s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3869.namprd03.prod.outlook.com (2603:10b6:805:68::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Thu, 11 Mar
 2021 05:36:28 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 05:36:28 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] memory: add a sparse memory device
Date: Thu, 11 Mar 2021 00:36:12 -0500
Message-Id: <20210311053614.940352-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210311053614.940352-1-alxndr@bu.edu>
References: <20210311053614.940352-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR14CA0021.namprd14.prod.outlook.com
 (2603:10b6:208:23e::26) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR14CA0021.namprd14.prod.outlook.com (2603:10b6:208:23e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 11 Mar 2021 05:36:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44603e37-e33f-405c-b297-08d8e44f9e48
X-MS-TrafficTypeDiagnostic: SN6PR03MB3869:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3869C2AEC573B34E9D162A70BA909@SN6PR03MB3869.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oVtrkAW4HZzzDqjrVL0eTVmeGBS8s8DG5FBqaHramtENTLHHunzAm5LyDcL9ttqBTn7hdqMv4IBdL6o4+9XwF7arU0WF2f4FYV3jj9FY6h5WN43S6oIld7lgTA2HrmAIKM/QsPPQ/aK9DS7klFUln2PMgbHHYFYQgMn1lRRto18btwYIyhYD32hdXs3yAQhBXcUEaR/C27yz7M8LFg4sTwWGYmzSiz9YkppdcVQNPajWbeFgemUbYxUHsMgLyiMY3HkzAKNFBIFIOM8sUpWvIR27Rs3yiC/ry+VU1Qgn3r3valmQd2786FJEdFfGQu+CN+gpJLUn78tTFSirx0iOnH/RFeVE/zi2cRtwhOhoNKDJxq9At2aEuTFUxq1K86H7potfmXZ207Q2i7jwxjaGdtCl1H6hxXkL+U0h9YooI6WJ89bajzH2841zYK3wct95PGk6Pnhi9+Pxh5EV0A7CA7+u1tDfFKHNq7pZLK3P6UJkVNCLgsNJwkIJBPTMh/pxIqocyA/9StPg/e/r4n0+jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(2906002)(786003)(6916009)(7416002)(6512007)(54906003)(83380400001)(36756003)(26005)(86362001)(6486002)(186003)(16526019)(1076003)(66946007)(66556008)(4326008)(66476007)(52116002)(6666004)(5660300002)(8936002)(75432002)(6506007)(8676002)(478600001)(316002)(956004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cIVrolFcPd97k8A/2VF5u9YnC93m/Qae7eDqeDOOGt32DfByHNMyb8nJF615?=
 =?us-ascii?Q?1a+6hJBPnLiNXDGZ+D03bSjYSjfMcb68pqwMYPc2fH7OQbWkGGse19RWmfng?=
 =?us-ascii?Q?l0qRqaw9rWFYP1JdTeR6Kius1p0jH2m1pWmVE/nCUqJkxUqjH6m8VciQj1y+?=
 =?us-ascii?Q?XrNamJoUGlSipJ9Vw/g6z+VayO47Nr0/fGCxUAdFCW9XvuqrfkuPb4L9wGFj?=
 =?us-ascii?Q?ETxFYAlCX0kI5DBUVpToahBBitkbnjgIEXTnnTAKhTFFUny1tQvPwqbnyVfQ?=
 =?us-ascii?Q?McYDG6bbGkE5vwP/1PWxKZLzNwKPxc3GDfAQkDuoALQv3Fhn5RP1XlbxG9OD?=
 =?us-ascii?Q?UAvN0PKdoD6mTYpRDHNOOylMH3utYF3DEnBy7XM+LoW4EqD+KrwD8gajyxbt?=
 =?us-ascii?Q?S3jyJWxGjvofO/SSPB4R43mGe5lsh97F2vbUCuo0IUUsrZcBJ/z8c8AGh69G?=
 =?us-ascii?Q?rI8zpnf+PYB0IKzly3AVaRm7EjXiRK8fPfdUUZ5/3O7xvP0kHi0CxN4hOlUR?=
 =?us-ascii?Q?D4kjSu3vcacyYWLXpkToEQufM13S8gpCu9NCX5CmL4b32dUmCwV5fDAHstDZ?=
 =?us-ascii?Q?A81pk3IFYjcjbHEyXTKLxgufyV4Edjwwrn+bN6dVoovtPwGFT4qKUZKkbJn4?=
 =?us-ascii?Q?pMODjVaT89fNeH7e+ooT25g6GUxna91UTtP5OG/nGX6lVGg1JI5j/+nozojb?=
 =?us-ascii?Q?UHNmoR4o28bC3+w7zytERaYFZOhms4WyAbP0LGqFCJPSbx7lC55TfDsA8DkR?=
 =?us-ascii?Q?iX4aen47noqBE5zYNAD5xzYgQcZPeyor9wC28wFYS1/M2L5n+TCs4DrEyuwU?=
 =?us-ascii?Q?TLULHjSDEKct2fCvGl5PUp5vFHEBcjGB/GSAqXmo7Tx3FPX71eLT0gJ++9Oo?=
 =?us-ascii?Q?2zNijXe/nHIdrZUEVw7UsrrC8Bqi5h6vry7iyGoanzRHddbh1fc1HL5OML5b?=
 =?us-ascii?Q?5RfSb53lYQ+ZUIjJhlJxPCIu7fPqkdp4oonaFXGTkzxRJwC87zMJhPAsKuu4?=
 =?us-ascii?Q?vqCf28eqXsFV3x/S/ydZYLgV424ev57h0j8nIlcwiBSwQeqTvaqso/37hDtH?=
 =?us-ascii?Q?2dJoFWXm6MOPovc4XwXuzu9U+NHeYyzXLRpYV1pQCpsj1WOxvu9Ixitw5BJ8?=
 =?us-ascii?Q?Vr/ur3xB89cqWsg0lAvM3eHMU18BQfY9I8x+WqSKGzwqgGJKwkyUyDUN3iZk?=
 =?us-ascii?Q?1f1jgxsXket8LcdhNq3gFBd4QaQWkpoJTXEEtA1F3A1l2HLmVynJA/YskeSj?=
 =?us-ascii?Q?+LEUPHV0gT5Z/C5/KqSJTF0Cq0R66Xr4fOl1B1QT5X4WDXIjJEH72AhHDMox?=
 =?us-ascii?Q?nr/4jzDp1yQSo1m++3z6eK1r?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 44603e37-e33f-405c-b297-08d8e44f9e48
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 05:36:28.4763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxHDc/m4IW6pC2ma5MzodJs3rMvjxFXzpUePd9rWGS+RiK2wONkfQlFnZejwDu4G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3869
Received-SPF: pass client-ip=40.107.220.133; envelope-from=alxndr@bu.edu;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, f4bug@amsat.org, lidong.chen@oracle.com,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For testing, it can be useful to simulate an enormous amount of memory
(e.g. 2^64 RAM). This adds an MMIO device that acts as sparse memory.
When something writes a nonzero value to a sparse-mem address, we
allocate a block of memory. This block is kept around, until all of the
bytes within the block are zero-ed. The device has a very low priority
(so it can be mapped beneath actual RAM, and virtual device MMIO
regions).

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 MAINTAINERS         |   1 +
 hw/mem/meson.build  |   1 +
 hw/mem/sparse-mem.c | 154 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 hw/mem/sparse-mem.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f22d83c178..9e3d8b1401 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2618,6 +2618,7 @@ R: Thomas Huth <thuth@redhat.com>
 S: Maintained
 F: tests/qtest/fuzz/
 F: scripts/oss-fuzz/
+F: hw/mem/sparse-mem.c
 F: docs/devel/fuzzing.rst
 
 Register API
diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index 0d22f2b572..732f459e0a 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -1,5 +1,6 @@
 mem_ss = ss.source_set()
 mem_ss.add(files('memory-device.c'))
+mem_ss.add(files('sparse-mem.c'))
 mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
 mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
 mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
new file mode 100644
index 0000000000..ffda6f76b4
--- /dev/null
+++ b/hw/mem/sparse-mem.c
@@ -0,0 +1,154 @@
+/*
+ * A sparse memory device
+ *
+ * Copyright Red Hat Inc., 2021
+ *
+ * Authors:
+ *  Alexander Bulekov   <alxndr@bu.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "exec/address-spaces.h"
+#include "hw/qdev-properties.h"
+
+#define TYPE_SPARSE_MEM "sparse-mem"
+#define SPARSE_MEM(obj) OBJECT_CHECK(SparseMemState, (obj), TYPE_SPARSE_MEM)
+
+#define SPARSE_BLOCK_SIZE 0x1000
+
+typedef struct SparseMemState {
+    DeviceState parent_obj;
+    MemoryRegion mmio;
+    uint64_t baseaddr;
+    uint64_t length;
+    uint64_t usage;
+    uint64_t maxsize;
+    GHashTable *mapped;
+} SparseMemState;
+
+typedef struct sparse_mem_block {
+    uint16_t nonzeros;
+    uint8_t data[SPARSE_BLOCK_SIZE];
+} sparse_mem_block;
+
+static uint64_t sparse_mem_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    SparseMemState *s = opaque;
+    uint64_t ret = 0;
+    size_t pfn = addr / SPARSE_BLOCK_SIZE;
+    size_t offset = addr % SPARSE_BLOCK_SIZE;
+    sparse_mem_block *block;
+
+    block = g_hash_table_lookup(s->mapped, (void *)pfn);
+    if (block) {
+        assert(offset + size <= sizeof(block->data));
+        memcpy(&ret, block->data + offset, size);
+    }
+    return ret;
+}
+
+static void sparse_mem_write(void *opaque, hwaddr addr, uint64_t v,
+                             unsigned int size)
+{
+    SparseMemState *s = opaque;
+    size_t pfn = addr / SPARSE_BLOCK_SIZE;
+    size_t offset = addr % SPARSE_BLOCK_SIZE;
+    int nonzeros = 0;
+    sparse_mem_block *block;
+
+    if (!g_hash_table_lookup(s->mapped, (void *)pfn) &&
+        s->usage + SPARSE_BLOCK_SIZE < s->maxsize && v) {
+        g_hash_table_insert(s->mapped, (void *)pfn,
+                            g_new0(sparse_mem_block, 1));
+        s->usage += sizeof(block->data);
+    }
+    block = g_hash_table_lookup(s->mapped, (void *)pfn);
+    if (!block) {
+        return;
+    }
+
+    assert(offset + size <= sizeof(block->data));
+
+    /*
+     * Track the number of nonzeros, so we can adjust the block's nonzero count
+     * after writing the value v
+     */
+    for (int i = 0; i < size; i++) {
+        nonzeros -= (block->data[offset + i] != 0);
+    }
+
+    memcpy(block->data + offset, &v, size);
+
+    for (int i = 0; i < size; i++) {
+        nonzeros += (block->data[offset + i] != 0);
+    }
+
+    /* Update the number of nonzeros in the block, free it, if it's empty */
+    assert(block->nonzeros + nonzeros < sizeof(block->data));
+    assert((int)block->nonzeros + nonzeros >= 0);
+    block->nonzeros += nonzeros;
+
+    if (block->nonzeros == 0) {
+        g_free(block);
+        g_hash_table_remove(s->mapped, (void *)pfn);
+        s->usage -= sizeof(block->data);
+    }
+}
+
+static const MemoryRegionOps sparse_mem_ops = {
+    .read = sparse_mem_read,
+    .write = sparse_mem_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+            .min_access_size = 1,
+            .max_access_size = 8,
+            .unaligned = false,
+        },
+};
+
+static Property sparse_mem_properties[] = {
+    /* The base address of the memory */
+    DEFINE_PROP_UINT64("baseaddr", SparseMemState, baseaddr, 0x0),
+    /* The length of the sparse memory region */
+    DEFINE_PROP_UINT64("length", SparseMemState, length, UINT64_MAX),
+    /* Max amount of actual memory that can be used to back the sparse memory */
+    DEFINE_PROP_UINT64("maxsize", SparseMemState, maxsize, 0x100000),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sparse_mem_realize(DeviceState *dev, Error **errp)
+{
+    SparseMemState *s = SPARSE_MEM(dev);
+
+    assert(s->baseaddr + s->length > s->baseaddr);
+
+    s->mapped = g_hash_table_new(NULL, NULL);
+    memory_region_init_io(&(s->mmio), OBJECT(s), &sparse_mem_ops, s,
+                          "sparse-mem", s->length);
+    memory_region_add_subregion_overlap(get_system_memory(), s->baseaddr,
+                                        &(s->mmio), -100);
+}
+
+static void sparse_mem_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, sparse_mem_properties);
+
+    dc->desc = "Sparse Memory Device";
+    dc->realize = sparse_mem_realize;
+}
+
+static const TypeInfo sparse_mem_types[] = {
+    {
+        .name = TYPE_SPARSE_MEM,
+        .parent = TYPE_DEVICE,
+        .instance_size = sizeof(SparseMemState),
+        .class_init = sparse_mem_class_init,
+    },
+};
+DEFINE_TYPES(sparse_mem_types);
-- 
2.28.0



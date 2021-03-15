Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A484E33C638
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:57:24 +0100 (CET)
Received: from localhost ([::1]:35662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsP5-0004PW-Ce
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs74-0004CC-6d
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:46 -0400
Received: from mail-eopbgr750120.outbound.protection.outlook.com
 ([40.107.75.120]:38565 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs72-0006Ga-8z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPr+14dLYqUOpKr+sXs/LV/tiRKS0DNbwTF7mSiAkkzJzaNGXIVI3W60pbkb7b4CPdUdmfEE94lHDhSQDmracvCCT6VIydAcnVt69KA1awTclLzHIB+Ug9+4NK46kODJayC6/X86KjE2kF/CP7CZXNtPBezbphs3W8o8cz/AKD29nZkqm2j1y+P9qi2CFg8yKdo914RYhTRgThIKNHljJQHZgv2McqsrFOxhKzlvheXFnB/HfEENHzIP9VCNO/6gf8Jnld6W04kUVMb8hVwmlMgIZPB05EkzS+uRSUFkM94BGQts/eZdRk4nPkGWAvqN7U2Sbt1b6Fp6X65CPbH15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXzywjENhElbgUKwZQmVnMBOjxFOeVIjwLgh6A8Aet0=;
 b=Zv2hjs+QcV6f/8f/ylOq1vrsKmTuALrmQmUJBFbE2b8hgUn/Kb7vM/tQFuoBSrPnsZ6XV6STYxFgA9IABsIwdX65f68o/LrXRumZZM5Y3L19Qw41EE8I9EBvqNY2FRhUMVrVIxbAHKn7g8qkVTLj6zEXAiK5cqIoNSg13n1TLuN7sSf5ceBkPWk6LKhydlYEoHV+eA9SM28WBGileG7OYxC/LnKCC8AKkXIrfacf/pI5qO/wqFbiLzD+wyOB9qAPTI+vibsS912i7xKFj1bdRhQCPFNDBC0a9/G4cU/Og520z2Ds2fbeawJSAni8MNyHnVUc9ueV8chOIkBH8caDVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXzywjENhElbgUKwZQmVnMBOjxFOeVIjwLgh6A8Aet0=;
 b=zVKzhbwhNFF0fR81tacqM9Y6VsUOSySjgkJCIaeBDRHAVVFrq+3WLcFFaxhbvidv6Kd//PLD8GOtjM+DIav3VVQAWWg8MN9q+sISD8H7mSBpdPjGYn+T/IVbkGRVJzxNUKL0qDDgkTGi5fua6kyDWSqE99x3+CD33UWepQ814kg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 18:38:31 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 18:38:31 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] memory: add a sparse memory device for fuzzing
Date: Mon, 15 Mar 2021 14:38:10 -0400
Message-Id: <20210315183812.27760-10-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315183812.27760-1-alxndr@bu.edu>
References: <20210315183812.27760-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0323.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::28) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0323.namprd13.prod.outlook.com (2603:10b6:208:2c1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 18:38:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 761d6c8d-b7a9-4586-8b4d-08d8e7e187e8
X-MS-TrafficTypeDiagnostic: SA2PR03MB5724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB572451082DD85377B5E43C9DBA6C9@SA2PR03MB5724.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Luh36l+qANVv85rOC8ifx8tsIIpEPozTvUk92N1GUDhdhLemYOi0CTSfuNrWOG0Hu1TIGosjP0uzaQZ5cCkPCcWYJAsFdCH+3tHHT1FrokRfWkxmUhnQwVy1hEZS87WPpyIiW/15bFas1YO4acQvtC0MAZXN35/2AknBZIrMA5jnjrBH9eAnc+2XxUAWj1f1mcTTB12gYb6NFYUqmDFnjC2IE5h6tm162lS8IzQcxTxiFHZPUulQJd2s8iEeuLKmbnK733Eih/A6pvVI4DCPN2rE9DBevrEJCSOueBl0AyA/0i6Y4HSckPB01sdYNwXoJvUVr3kB/YTZnZDpASLVTRVi3B8nZyLKxrVH18wIMi/85TdyyWGigHghupe8UyFlk5bxZVC36AsQC+o8YrGufjNP3mmScoUXp9CK9zrIjBvt0GhkGiCkOJfayLSdOgYifsKe08irk2vsZl7s1U3XM+sIUjoST9IPKOEOkQLVDVbwZEruyOJXV4DWmTifX0Qdi8yb/RIbiFV/6KwhyDM9jDQ0ZC43uFqRSM7Pnn1GS0cDAHqbef++Addi7hq9ptvO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(4326008)(7696005)(36756003)(52116002)(83380400001)(6916009)(6666004)(6486002)(86362001)(8936002)(66556008)(956004)(2616005)(54906003)(786003)(2906002)(16526019)(186003)(5660300002)(8676002)(75432002)(26005)(66476007)(478600001)(316002)(1076003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?T8nMQxHH45UBNqFBT/WR7C+6eqRHulR6JzjFxTpULvS2t2Ry0hBMfeBXhhVc?=
 =?us-ascii?Q?alLA82x3ZkoBODwwtlCtKsUB7yM/w/3nfej6CJdMc/F0uhi+IcWqY5s2QdfO?=
 =?us-ascii?Q?vdV3mH02Lt+PkI0XXw+AyJaI7STdQADlfZc0800SORxOgrqFd0kESDi4o07u?=
 =?us-ascii?Q?dENZQdJCEqyZ5GGvtKO1MFmJ33S5wwfkbZN2t76oWC/pokF4pBLVypbDiSBg?=
 =?us-ascii?Q?czBErhq5C00CXdu/LOLbddsV2s5mxPj2aBMNX92MfmP/sRVN60g9lHp/mmwU?=
 =?us-ascii?Q?QTdVUx5tiyEuFMXtW24J6N0GvAWIatqQOgkbkdcbTbpLXzU92H7ixTk0RUqw?=
 =?us-ascii?Q?zOWLCsiE/WWEAOwoPaJviAEHwROw1wjw+OOhT9CRULO1ChH+XGTYKOoyzuuL?=
 =?us-ascii?Q?FE4TkJ2W6wfu2bpt+3TOiG0A6D5uLjvIHhMneg0Axtyugp0PSeR4ulgR5Nqc?=
 =?us-ascii?Q?rg999wRF64d8U2nZuxslA8xVJqZzEt053pQPGpK0Wv+qJAFKSKoYiTNhKxb1?=
 =?us-ascii?Q?gO+gOh0C7fX4DyK+2fLD6yTl+X/Lem54yRSl1kdMG7VRfbvDpQa8HzTVtTsW?=
 =?us-ascii?Q?o9V95zpTiLhb8wnfqv8H0MI/1uJfL+T4s/0fB17KTYxBFJbKTEIa8PEiNkIq?=
 =?us-ascii?Q?jjYCbutWix439o4Wm5Mtxjkw1DTPu64DA8bxEfyT0H+RYt74BhR8Vvaw61RL?=
 =?us-ascii?Q?OaXNFPxhr7MIv/sqbSCW/4wcxOeNsft7gLSUD13X2Sizv+Uh7fkN+HycLDNG?=
 =?us-ascii?Q?MmEodvWqkhWGnqJex2FZYp97qN8zKYoeRpmXdxqdrIciTUKA9Qkb9GOyPMSf?=
 =?us-ascii?Q?X8lt3pWMM5PGB0ulf1fDbV52puotAjjZ6/ZAcQR1SEcXksigFqlT/h9vWoJt?=
 =?us-ascii?Q?5f7Ok87pw6CG98C9k0qSh9mL7HMYCOk/oLPR1hP5Oz9Zfx9I98mDHr9DIm15?=
 =?us-ascii?Q?jgAfkgg6NcPqib4OYZxR2+aDXOnXAt2IbQC2HMvB9P1ZUVgEzO/+99twJlV5?=
 =?us-ascii?Q?VFl9KRd3CSOkTO1ixARK7mEOEkU9jVKy46PJlwESWuuy6LEbHdxRQzJl/iy8?=
 =?us-ascii?Q?L/9f0+jO/Xk9S4zdXPDNnp4RA0YR8x2eQFRWVmRMJsWJMWuMaUGXyRZ18FJ2?=
 =?us-ascii?Q?3TuQJKvmjHpYaNhG3yptd4H5xMN0uU24WBMS0JE0NRrTNaQdbdq8t9I7720a?=
 =?us-ascii?Q?HhUeVk+fqvDE40M5fuRW9tXHvQAV3y42UaRk+pMjN9/3eJjNSXsqN1SzbuX5?=
 =?us-ascii?Q?6E4Wzz+9UMpJ4RIp8gXg9OGhj830hRichC1h7BXEoqoDwfBVz2ZYxsIxZDrN?=
 =?us-ascii?Q?9u1QXxy6mMoYqFUesNK3oGI9?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 761d6c8d-b7a9-4586-8b4d-08d8e7e187e8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 18:38:30.8816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIFsDEg57qHKb4IU0JV2tVNjjKy/hTOQ0xa3OHwTB3UAsjPLq0z2P8otK7XbJL6Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5724
Received-SPF: pass client-ip=40.107.75.120; envelope-from=alxndr@bu.edu;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For testing, it can be useful to simulate an enormous amount of memory
(e.g. 2^64 RAM). This adds an MMIO device that acts as sparse memory.
When something writes a nonzero value to a sparse-mem address, we
allocate a block of memory. For now, since the only user of this device
is the fuzzer, we do not track and free zeroed blocks. The device has a
very low priority (so it can be mapped beneath actual RAM, and virtual
device MMIO regions).

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 MAINTAINERS                 |   1 +
 hw/mem/meson.build          |   1 +
 hw/mem/sparse-mem.c         | 151 ++++++++++++++++++++++++++++++++++++
 include/hw/mem/sparse-mem.h |  19 +++++
 4 files changed, 172 insertions(+)
 create mode 100644 hw/mem/sparse-mem.c
 create mode 100644 include/hw/mem/sparse-mem.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0bd720a3d6..2a925e76ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2636,6 +2636,7 @@ S: Maintained
 F: tests/qtest/fuzz/
 F: tests/qtest/fuzz-*test.c
 F: scripts/oss-fuzz/
+F: hw/mem/sparse-mem.c
 F: docs/devel/fuzzing.rst
 
 Register API
diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index 0d22f2b572..ef79e04678 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -1,5 +1,6 @@
 mem_ss = ss.source_set()
 mem_ss.add(files('memory-device.c'))
+mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
 mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
 mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
 mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
new file mode 100644
index 0000000000..a13ac74dd9
--- /dev/null
+++ b/hw/mem/sparse-mem.c
@@ -0,0 +1,151 @@
+/*
+ * A sparse memory device. Useful for fuzzing
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
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+#include "qemu/units.h"
+#include "sysemu/qtest.h"
+#include "hw/mem/sparse-mem.h"
+
+#define SPARSE_MEM(obj) OBJECT_CHECK(SparseMemState, (obj), TYPE_SPARSE_MEM)
+#define SPARSE_BLOCK_SIZE 0x1000
+
+typedef struct SparseMemState {
+    SysBusDevice parent_obj;
+    MemoryRegion mmio;
+    uint64_t baseaddr;
+    uint64_t length;
+    uint64_t size_used;
+    uint64_t maxsize;
+    GHashTable *mapped;
+} SparseMemState;
+
+typedef struct sparse_mem_block {
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
+    sparse_mem_block *block;
+
+    if (!g_hash_table_lookup(s->mapped, (void *)pfn) &&
+        s->size_used + SPARSE_BLOCK_SIZE < s->maxsize && v) {
+        g_hash_table_insert(s->mapped, (void *)pfn,
+                            g_new0(sparse_mem_block, 1));
+        s->size_used += sizeof(block->data);
+    }
+    block = g_hash_table_lookup(s->mapped, (void *)pfn);
+    if (!block) {
+        return;
+    }
+
+    assert(offset + size <= sizeof(block->data));
+
+    memcpy(block->data + offset, &v, size);
+
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
+    DEFINE_PROP_UINT64("maxsize", SparseMemState, maxsize, 10 * MiB),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+MemoryRegion *sparse_mem_init(uint64_t addr, uint64_t length)
+{
+    DeviceState *dev;
+
+    dev = qdev_new(TYPE_SPARSE_MEM);
+    qdev_prop_set_uint64(dev, "baseaddr", addr);
+    qdev_prop_set_uint64(dev, "length", length);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(dev), 0, addr, -10000);
+    return &SPARSE_MEM(dev)->mmio;
+}
+
+static void sparse_mem_realize(DeviceState *dev, Error **errp)
+{
+    SparseMemState *s = SPARSE_MEM(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    if (!qtest_enabled()) {
+        error_setg(errp, "sparse_mem device should only be used "
+                         "for testing with QTest");
+        return;
+    }
+
+    assert(s->baseaddr + s->length > s->baseaddr);
+
+    s->mapped = g_hash_table_new(NULL, NULL);
+    memory_region_init_io(&s->mmio, OBJECT(s), &sparse_mem_ops, s,
+                          "sparse-mem", s->length);
+    sysbus_init_mmio(sbd, &s->mmio);
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
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(SparseMemState),
+        .class_init = sparse_mem_class_init,
+    },
+};
+DEFINE_TYPES(sparse_mem_types);
diff --git a/include/hw/mem/sparse-mem.h b/include/hw/mem/sparse-mem.h
new file mode 100644
index 0000000000..f9863b154b
--- /dev/null
+++ b/include/hw/mem/sparse-mem.h
@@ -0,0 +1,19 @@
+/*
+ * A sparse memory device. Useful for fuzzing
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
+#ifndef SPARSE_MEM_H
+#define SPARSE_MEM_H
+#define TYPE_SPARSE_MEM "sparse-mem"
+
+MemoryRegion *sparse_mem_init(uint64_t addr, uint64_t length);
+
+#endif
-- 
2.27.0



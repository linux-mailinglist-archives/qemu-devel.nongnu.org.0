Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B4233A1E8
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 00:22:48 +0100 (CET)
Received: from localhost ([::1]:42052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLDao-0007Uj-P4
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 18:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLDY3-00066s-J3
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 18:19:55 -0500
Received: from mail-mw2nam10on2091.outbound.protection.outlook.com
 ([40.107.94.91]:5920 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLDY1-0002Tn-47
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 18:19:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvMUGMefBl/+z5phGlwU8tQGX0b8ZmK7m8BciM9FxgOSuSrpzcJbyE5H07A4IUhQTAh7BopseCYitS5Pk4RcvwqYDVEtZNAyR3S6Q8w7LUm/aghMDFQ5CMPycM7cPWqJq0wMvFNhp+pqKLfGXJPXdSBqmLvxx1Mo4z+4kmlOAHnQVMVVmRXBVYr5wdAV73MhTA8irDOWHl0H79toj1xjRFHARUsR2WmVa1KT6VyQECyTm+7NZfH8guE3dA35XGIhj5wFk/mEs7IPeA6OYP3rSvgnXdG1froAPw6r4EFL4JdDvNqPR+u1/UK0xAzexfp/MCWHHDIO1K7vw7LQOYaasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD3m0M64JMLogNeZhqK7ekR4YtDnSmVhwD6UCuCJxwE=;
 b=UOSDbKWGPsFw6PA66ZDt3I9KOtZZMNxP5oka27nrSoJLsavLQjjY8dsOAiIUk7cWuNcAEQNhNsAxyEOoYcThGH2JkZiXXitPohqbcM/8V7TjZWZp47zRoYhLvK6A+N0XH2eDoF5LE+n7miXiutYlV/fXEZa6vyHtzFvnbicTGXUanSHdBvrDND7CH0k0mRM6+dxk/RLBNpvEF/fy1I6MHTnbLoW3ocbFchruwHEeZpGyW9tMKeOi5rFkdFqKVo3BEx2N+/dYYK8qFDCyB0jiiw3+MurWIeSzJ1RRD3d09+M2whZM5tYvsoTKzC8pVuCf/7kh6ugUWlb/jgOCkobyKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD3m0M64JMLogNeZhqK7ekR4YtDnSmVhwD6UCuCJxwE=;
 b=7gwAQkGMjKa3+fp9JORaJidIduY863BiX1uyp7USHwyr5ZEHw1PcR6Dp0pG6WOU+eZDWPESUXkWrtDbnk/msVjxBFNfN1jzMyg/1LmexK1QeTiY9OaMPCnRIdbRF8pk91fKWFask2Y9vlTN8c4XMAHieggJj56QnwUSOYOZlfZA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4446.namprd03.prod.outlook.com (2603:10b6:805:f6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 23:19:12 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3912.031; Sat, 13 Mar 2021
 23:19:12 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] memory: add a sparse memory device for fuzzing
Date: Sat, 13 Mar 2021 18:18:57 -0500
Message-Id: <20210313231859.941263-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210313231859.941263-1-alxndr@bu.edu>
References: <20210313231859.941263-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:208:120::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR10CA0020.namprd10.prod.outlook.com (2603:10b6:208:120::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Sat, 13 Mar 2021 23:19:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd6a77e0-561b-4b31-1886-08d8e6766991
X-MS-TrafficTypeDiagnostic: SN6PR03MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB44465B593E505D04E6289C99BA6E9@SN6PR03MB4446.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:182;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rGF4cmUV3/q8DPtMjBNiw8dmg1LQpqcgaVwvRFn6V6PA1m0tL0VwNRJ9gnp1/5C4v1Mwk91RZfz+pdKOSx36MWJm0LcUIY97QhUSQb+sbC5XlMlozNe/RXYvJUzdpv36p+cfW9O4OM2MXFevGbBgtcg6C4bqaIcUePcYVPwIcG1b2rX2iJWNaW/bDWb7Jrbya9Qr2JfOWeDVbzB7uAvLaH3ZHyGHk0WDvkU0f9GIU41/O2bXNnqv8SSf847DHtIdt4Zv1sn1qPSKzGaQWKMRP1yHOdUpFa1B34Z7ftskjc0Jx/UUyR54n09G7uKMmEkOsBs1QHr44szXL9K8pWgbRsPvYVCcRCAEoz55xVvSHG71wrg1cfm4rXPvwaxtsBykDeLF4MsdKfHf0Piw00eepw7Li+DWmpsuxuZlCbpr3vAl09Qqip7WX4rbWfQwZql6JDTbP4IwbXcc92p8pbx4DnkkB2549InDhml5mO2yHNxNYeOAmWHPFI1DtzMqQ2WUNW9ftz6lS1nruNmuf0uSkAHsORd8aV9QYODAQ90r1XIM0BWVGHfkVQlVzAozhvsE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(478600001)(2616005)(86362001)(8676002)(6916009)(6506007)(956004)(36756003)(786003)(54906003)(6486002)(316002)(2906002)(6666004)(4326008)(186003)(52116002)(6512007)(26005)(16526019)(8936002)(66556008)(66946007)(5660300002)(66476007)(83380400001)(1076003)(75432002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?in/91A0uhiibVm3g2xQ7V9nG3fOF3xx4ywfZYEOEVxFvMSKGQWWsolS9G/Zx?=
 =?us-ascii?Q?uFkAfCMjBdJ9MwGcyryUROjPe2sLPccBGV5d0ehEQw+xszA0MBYSvVyc/itK?=
 =?us-ascii?Q?ndt07ZKzJmL3VVKV4ZrrmA6zBc6Z/qted8D+/TXUB92RSidpPDrc9LHpxaxU?=
 =?us-ascii?Q?eIszZT7jhkEf6X1PGcSOyI3zezYpmB2FG/1sbr3a5CD0OE5+ji7uatvPZ/51?=
 =?us-ascii?Q?7eBsUyfNcnIsdmzO7dXZa1E1Gzry9dGVQslKOrH7pODJH8ow9jK1IH8jjZR0?=
 =?us-ascii?Q?919cUH1TJWX4EQr3pWVrB2cWBuuIQn91+m/bNbrHNDS0TXD2zeiv4D9xPZmi?=
 =?us-ascii?Q?GDGiCqb0JOqMRuqvCVuHHjdq4e3GyV80zxgfB9IPBhJHfnJI26I+6bb8hvQX?=
 =?us-ascii?Q?Y8UalxUMrC1vJ0oQmSpQt0A5t3GhbZNV5wdhnmV9vFnWMRXv/UIpBFRWjutf?=
 =?us-ascii?Q?lOV88LymoXiQRJopew3IfIHRIHsAJSxQiJ0anJu9CLCRb/grWoYBCuC+LDg1?=
 =?us-ascii?Q?YW4wdT/Fyngw1rgW9HR8Fg8YvZNmD2wpsoeYX3LysIJn6dHcfQZwPwZTNA+Q?=
 =?us-ascii?Q?ze3pyI+u42ee9KYN+43GcA6Fj1pIKkUChH7+wxV9D983lLZHk/diJle9E32l?=
 =?us-ascii?Q?YCBDvGlwaDbiP75v5CEFhX2Oj2YeqLfG4w+pB1F7PdAtLDLdUafwd3rmYYP4?=
 =?us-ascii?Q?oknufDXVEpwEoSotPR98++NRkPojLstURXBtZC3CRafZk6w2zuSNpMnuOdME?=
 =?us-ascii?Q?6bPpjYerrKMv7y1IzT3bn3Cy3yo7EGNQa9UvcY0tiQw4YmJHLTI/SIdxfjKd?=
 =?us-ascii?Q?O5/83X0i7nbOvlDDJQrdqY07oF7KKJSxbEgQX4owjVtvxK0VxtsOjj8VI2e2?=
 =?us-ascii?Q?UmB4Rs0UdUvpZ9zkHevkyV60IsBcKTsTDN2YxwujQASve781FMiLTXDkhVZN?=
 =?us-ascii?Q?jVS11/GOtZGCpTs1U9QKxjnNvjSouchbfEA6qfwhO41Qooj+PnqlRO+nXCZ9?=
 =?us-ascii?Q?MtLVNPAq/UTsxNSlQuczQF+EBP9I3mDdXr7FeRLmtvjhY4tk6rHn/KPNPVRc?=
 =?us-ascii?Q?MGzF/AYIG80stKhk6/WG2dGrFnT5kKoIWPJ9dCXgrc4m7JDejGSA/COaHcl2?=
 =?us-ascii?Q?1/JWcfBoQ3AJpkBMBmWXr2Sx+1DRZsQdT0DSDa3mgE167j1XUQFD207Va+O2?=
 =?us-ascii?Q?mc1xU+jJuQRCSOjq8M8mt11RxTqyO8f81Kxtla5RkRhAjU8W0fTMJCTSMQnJ?=
 =?us-ascii?Q?6y/tqkZ/bO2DKu5HzEHwCdA0WHdIxIpyxyLy8acink2wDsvxhmS0RzgUbhKL?=
 =?us-ascii?Q?XN5rQxqsdFKCtw6dqkc6M5Gu?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6a77e0-561b-4b31-1886-08d8e6766991
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 23:19:12.7066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9e1WgMe+A+kdNymYKVhMQjo7XihE/HQDaUVKcyBVEbF0xh5KS6Y2zPTxr+qr0l6Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4446
Received-SPF: pass client-ip=40.107.94.91; envelope-from=alxndr@bu.edu;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
Cc: Thomas Huth <thuth@redhat.com>, darren.kenny@oracle.com,
 "Michael S. Tsirkin" <mst@redhat.com>, f4bug@amsat.org,
 Alexander Bulekov <alxndr@bu.edu>, bsd@redhat.com, stefanha@redhat.com,
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
 MAINTAINERS                 |   1 +
 hw/mem/meson.build          |   1 +
 hw/mem/sparse-mem.c         | 152 ++++++++++++++++++++++++++++++++++++
 include/hw/mem/sparse-mem.h |  19 +++++
 4 files changed, 173 insertions(+)
 create mode 100644 hw/mem/sparse-mem.c
 create mode 100644 include/hw/mem/sparse-mem.h

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
index 0000000000..575a287f59
--- /dev/null
+++ b/hw/mem/sparse-mem.c
@@ -0,0 +1,152 @@
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
+    printf("SPARSEREAD %lx\n", addr);
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
2.28.0



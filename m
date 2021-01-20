Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761562FD776
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:49:30 +0100 (CET)
Received: from localhost ([::1]:46474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Hbl-0003ib-DP
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HXj-0001Tp-U4
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:20 -0500
Received: from mail-bn8nam12on2129.outbound.protection.outlook.com
 ([40.107.237.129]:51169 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HXg-0003o3-Gz
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7SIu0kvkSBI76hU9e+amdc8UKHhSYL2xHlcp6k4MH2/CduWGi0ZjFn4X9SLupd2tiJoOi3zh2KSB5In4b/+Ef+ux7IVMCzNp0GV4Vhx8J5qFRESoljOJjKHDg6Wv5KYfa248xyxxtzpnrixTpsGu0bI06jpfbpMRQeOnnf26lVUb7+y3ir3XnyxBT3HLvXUZoo8az7XgoedqaSJd0EkPINdwTqa+zW4NtCpZgX7zzIH3s6tE+IuISK6AOq7DiO9KINFjaBiRYCHX01oX46Juxcf9TzO6cyetEbgRUgZEEMtFSQ0wSuoBZSpYf7/ATdaIrf+HrNREHhjzBW8YfQoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q2Mm3yC+fCchx5Db25wvy1+0mLPnAfR1ONbeeT3KHY=;
 b=SX4+bH+021wtNqYHFotGrgTrnRdtyZi22XLP4QPs0QC4nty66KFFvRqOwRAPaz3Spk7p12/9JNkzxR8bqvlr79kzDUG/otkFQHAvpST+ng2dGfFGJ84BSLUReEguJuWulREp1gHqr4GKbEIc1gtZRBhy5yCJVEFCb04wWWvZPdAwilA2RFlyNpeDLL34E2UJygOKUg1wPW1WeGkapLVW3lB3Q61PMOdZZqtRjQBwSm0Ms8vPaHLlgXXPD13ikXGGwOJqaaK9VVtm60gZ8y+wuLGqdxh9IXmE5IKZW1uUMUTy8Ldrpz+yA9PnEUKEJWLK0rXN6c+M45pVTTJjnWO8uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q2Mm3yC+fCchx5Db25wvy1+0mLPnAfR1ONbeeT3KHY=;
 b=E956W+M/jJBNDlFD7GmUrZCN2oddbKjiG5Z2yZpwFrIWF3OdHP7b25BedqqIl3vOXre3lU1nB0IegwEa/CPO0bvZL//OLbKFaH6aht/PI1vAf6b1av822WWmNd9dxDKfGsPmdNTvmy5B4a6xRJZ8sFNF2fWLJ6rmGMTyH+F+38M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5835.namprd03.prod.outlook.com (2603:10b6:806:113::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 17:45:09 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:45:09 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] fuzz: ignore address_space_map is_write flag
Date: Wed, 20 Jan 2021 12:44:50 -0500
Message-Id: <20210120174456.275312-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120174456.275312-1-alxndr@bu.edu>
References: <20210120174456.275312-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:91::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.5 via Frontend Transport; Wed, 20 Jan 2021 17:45:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f30b5760-685d-4ea3-87e8-08d8bd6b213c
X-MS-TrafficTypeDiagnostic: SA2PR03MB5835:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB58358FEDAEECEF3E67336B1DBAA29@SA2PR03MB5835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M8HoiccHmz4UWT6A0v8kH1ZUie0zE7Rv44v7csLgKQjJH7PxMF51T8orHeJK/f0AJv5rJ4Lq9hguHLUGVRCp89E9ShKjpdZpn9Cu0SKxnrhFY8XFA94HWngynOUnj4eB6RRiBq5w78PUO3PvhHAD0H3uHjvL4UuAVYDE+s4qNmbuTxh9+9ac+zI5N3KyiJf8ygeGKgf9pY/Dn0xo3WM0BxqoQ7oAL5tGiC9XyR995uJdulE91xNY3RPdf5KwxGpOh/EF+wt0vqErpABWuXfvlD+4d8FJzfQVQCr5dq9J8K7mbyoWq5ZKv9X6u5FHyG0pLscBTkm3GQLzK9PqZtpyraFf0oWOdY+iGv+lRimNZXEnABx0bsOXAS3/XZ6d8o/+nvVSJ9NzEHty9Ow4Gd3A0DU64R6LmF6O/bcQKRosSIhhXY33Cmo+NgDBL9DLb1ZDiI4oR3cgjz6OYfau+TP2go8Zjf/phHnc7No7LKAb9cHfMH1bZyJXFCGw3OxwhCMS+29DgAFBOyPMHiZH6d8+O5Gh1CqKwTnI2ZL/sYIlSZWjq4yVRl4GCq09cn0+OD5HFgBpuF11ag+U0L74vr0obMi2zYkWsMnHhuaVzvXBK24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(8676002)(52116002)(4326008)(2616005)(966005)(6512007)(6666004)(956004)(54906003)(75432002)(83380400001)(6486002)(5660300002)(16526019)(186003)(1076003)(6506007)(26005)(8936002)(478600001)(6916009)(316002)(786003)(66946007)(66556008)(66476007)(36756003)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?692IPo+72VMd1Mn3j5VpepQ4p7nnMpa1hHk8Y5dlHS0xyc74mlY1GtS6a79q?=
 =?us-ascii?Q?kPtZufBHp9tatnzxrglPfHtEyyUoDvIQC7F1Fd4XcsCOk1ZXu8kH0ckg2XxN?=
 =?us-ascii?Q?pjKhRe6zhH7CtoQ0FQpyYMo3ytsklOF5Y5CkOM7AXmp1KmvCmcV1BHwfxz6e?=
 =?us-ascii?Q?0xIYGbDVfjpvJBiMCGwxEcSF5KQWb7ff1bU/kufUSEcqYeG76lz0fTAYFJBu?=
 =?us-ascii?Q?WD8BVwVctUUsv25tDp0/iZWx+vImI9cp/szLE+ffejZq+HTeoSjexLfd6nZZ?=
 =?us-ascii?Q?q0ULngaH7la91T2mF5c7Q+iVu1/lGvnuN277lpcnyu5N9f/W7t7ZLUZEb7AZ?=
 =?us-ascii?Q?K0QHkxo1l15u60NOg+Aedrcymro9egrx4OMTGY+4aU0WAJc1IE5oJ9zFrN4U?=
 =?us-ascii?Q?el6DvgCcSg4Uxg2NFmK54Or+cKM634Jq4nFjeEGFtD3niD3IsXr6EESupW1l?=
 =?us-ascii?Q?bhzRx/ipJWD47IuoiXCnBva5xgxFsXr+FCAllA5wtTwJhvo4qltMl720ZlXa?=
 =?us-ascii?Q?WcYrbujn1wuKNOSkIbcK1XUmVjFVsAAGAxmTecE5iTNACY0NCI0EwM5EKwCP?=
 =?us-ascii?Q?TaCxphGpynVBQIQ4JZojoIrmSPhkV1Jqrl0MXh9fjat5rHN55JPDLNGwtWby?=
 =?us-ascii?Q?MYh9fjupFwXmhepexfEPE2jyHVfiiXnoxj7d5aoTJqN5FN2cZCo1zUzGPxsX?=
 =?us-ascii?Q?cOTLqyCy/50vmKvG/b/iDFFw/scjQwHXTgPdNGdO2cR5WDMqs9sWHfrRPhyw?=
 =?us-ascii?Q?eGf3vGe+mX63GRvCzKPIU2xxSh7DVY9MGQ8EVucHV2AQrlHBpk5TfW5woDNg?=
 =?us-ascii?Q?WF2YLhxiIOn57FWuBzX54GQ6R9eGrGXoHPyxsP1SzSlJIB8adGoAFVACbzgf?=
 =?us-ascii?Q?kpD69NW3uLXwvttM7GKwwZhoNTm6NLpNM3/OHZ4WLzeLm5KJNbqRi61x1c8s?=
 =?us-ascii?Q?/SZgl0fNZ/3qYxBE/iTmSdc3tbX7lR9Bbm6EPK4h/R+0twakQloy0M+tciOx?=
 =?us-ascii?Q?bj88?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: f30b5760-685d-4ea3-87e8-08d8bd6b213c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:45:09.1369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvLOrHH3fCDNV2LnIVC8mPU/RHisVgyatoUpLY01qCW/fh+N1ROPy1CWuxrZ0yhB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5835
Received-SPF: pass client-ip=40.107.237.129; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We passed an is_write flag to the fuzz_dma_read_cb function to
differentiate between the mapped DMA regions that need to be populated
with fuzzed data, and those that don't. We simply passed through the
address_space_map is_write parameter. The goal was to cut down on
unnecessarily populating mapped DMA regions, when they are not read
from.

Unfortunately, nothing precludes code from reading from regions mapped
with is_write=true. For example, see:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04729.html

This patch removes the is_write parameter to fuzz_dma_read_cb. As a
result, we will fill all mapped DMA regions with fuzzed data, ignoring
the specified transfer direction.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/exec/memory.h                 | 8 +++-----
 include/exec/memory_ldst_cached.h.inc | 6 +++---
 memory_ldst.c.inc                     | 8 ++++----
 softmmu/memory.c                      | 5 ++---
 softmmu/physmem.c                     | 4 ++--
 tests/qtest/fuzz/generic_fuzz.c       | 9 +++------
 6 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 521d9901d7..0f89787de2 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -45,13 +45,11 @@ DECLARE_OBJ_CHECKERS(IOMMUMemoryRegion, IOMMUMemoryRegionClass,
 #ifdef CONFIG_FUZZ
 void fuzz_dma_read_cb(size_t addr,
                       size_t len,
-                      MemoryRegion *mr,
-                      bool is_write);
+                      MemoryRegion *mr);
 #else
 static inline void fuzz_dma_read_cb(size_t addr,
                                     size_t len,
-                                    MemoryRegion *mr,
-                                    bool is_write)
+                                    MemoryRegion *mr)
 {
     /* Do Nothing */
 }
@@ -2504,7 +2502,7 @@ address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
                           void *buf, hwaddr len)
 {
     assert(addr < cache->len && len <= cache->len - addr);
-    fuzz_dma_read_cb(cache->xlat + addr, len, cache->mrs.mr, false);
+    fuzz_dma_read_cb(cache->xlat + addr, len, cache->mrs.mr);
     if (likely(cache->ptr)) {
         memcpy(buf, cache->ptr + addr, len);
         return MEMTX_OK;
diff --git a/include/exec/memory_ldst_cached.h.inc b/include/exec/memory_ldst_cached.h.inc
index 01efad62de..7bc8790d34 100644
--- a/include/exec/memory_ldst_cached.h.inc
+++ b/include/exec/memory_ldst_cached.h.inc
@@ -28,7 +28,7 @@ static inline uint32_t ADDRESS_SPACE_LD_CACHED(l)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len && 4 <= cache->len - addr);
-    fuzz_dma_read_cb(cache->xlat + addr, 4, cache->mrs.mr, false);
+    fuzz_dma_read_cb(cache->xlat + addr, 4, cache->mrs.mr);
     if (likely(cache->ptr)) {
         return LD_P(l)(cache->ptr + addr);
     } else {
@@ -40,7 +40,7 @@ static inline uint64_t ADDRESS_SPACE_LD_CACHED(q)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len && 8 <= cache->len - addr);
-    fuzz_dma_read_cb(cache->xlat + addr, 8, cache->mrs.mr, false);
+    fuzz_dma_read_cb(cache->xlat + addr, 8, cache->mrs.mr);
     if (likely(cache->ptr)) {
         return LD_P(q)(cache->ptr + addr);
     } else {
@@ -52,7 +52,7 @@ static inline uint32_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len && 2 <= cache->len - addr);
-    fuzz_dma_read_cb(cache->xlat + addr, 2, cache->mrs.mr, false);
+    fuzz_dma_read_cb(cache->xlat + addr, 2, cache->mrs.mr);
     if (likely(cache->ptr)) {
         return LD_P(uw)(cache->ptr + addr);
     } else {
diff --git a/memory_ldst.c.inc b/memory_ldst.c.inc
index 2fed2de18e..b56e961967 100644
--- a/memory_ldst.c.inc
+++ b/memory_ldst.c.inc
@@ -42,7 +42,7 @@ static inline uint32_t glue(address_space_ldl_internal, SUFFIX)(ARG1_DECL,
                                         MO_32 | devend_memop(endian), attrs);
     } else {
         /* RAM case */
-        fuzz_dma_read_cb(addr, 4, mr, false);
+        fuzz_dma_read_cb(addr, 4, mr);
         ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
         switch (endian) {
         case DEVICE_LITTLE_ENDIAN:
@@ -111,7 +111,7 @@ static inline uint64_t glue(address_space_ldq_internal, SUFFIX)(ARG1_DECL,
                                         MO_64 | devend_memop(endian), attrs);
     } else {
         /* RAM case */
-        fuzz_dma_read_cb(addr, 8, mr, false);
+        fuzz_dma_read_cb(addr, 8, mr);
         ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
         switch (endian) {
         case DEVICE_LITTLE_ENDIAN:
@@ -177,7 +177,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
         r = memory_region_dispatch_read(mr, addr1, &val, MO_8, attrs);
     } else {
         /* RAM case */
-        fuzz_dma_read_cb(addr, 1, mr, false);
+        fuzz_dma_read_cb(addr, 1, mr);
         ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
         val = ldub_p(ptr);
         r = MEMTX_OK;
@@ -215,7 +215,7 @@ static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
                                         MO_16 | devend_memop(endian), attrs);
     } else {
         /* RAM case */
-        fuzz_dma_read_cb(addr, 2, mr, false);
+        fuzz_dma_read_cb(addr, 2, mr);
         ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
         switch (endian) {
         case DEVICE_LITTLE_ENDIAN:
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 333e1ed7b0..4fc0071dcd 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1440,7 +1440,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
     unsigned size = memop_size(op);
     MemTxResult r;
 
-    fuzz_dma_read_cb(addr, size, mr, false);
+    fuzz_dma_read_cb(addr, size, mr);
     if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
         *pval = unassigned_mem_read(mr, addr, size);
         return MEMTX_DECODE_ERROR;
@@ -3282,8 +3282,7 @@ void memory_region_init_rom_device(MemoryRegion *mr,
 #ifdef CONFIG_FUZZ
 void __attribute__((weak)) fuzz_dma_read_cb(size_t addr,
                       size_t len,
-                      MemoryRegion *mr,
-                      bool is_write)
+                      MemoryRegion *mr)
 {
 }
 #endif
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 6301f4f0a5..5aaec2f2c1 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2824,7 +2824,7 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
             stn_he_p(buf, l, val);
         } else {
             /* RAM case */
-            fuzz_dma_read_cb(addr, len, mr, false);
+            fuzz_dma_read_cb(addr, len, mr);
             ram_ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
             memcpy(buf, ram_ptr, l);
         }
@@ -3185,7 +3185,7 @@ void *address_space_map(AddressSpace *as,
     memory_region_ref(mr);
     *plen = flatview_extend_translation(fv, addr, len, mr, xlat,
                                         l, is_write, attrs);
-    fuzz_dma_read_cb(addr, *plen, mr, is_write);
+    fuzz_dma_read_cb(addr, *plen, mr);
     ptr = qemu_ram_ptr_length(mr->ram_block, xlat, plen, true);
 
     return ptr;
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index be76d47d2d..deb74f15be 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -175,7 +175,7 @@ static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
  * generic_fuzz(), avoiding potential race-conditions, which we don't have
  * a good way for reproducing right now.
  */
-void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr, bool is_write)
+void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
 {
     /* Are we in the generic-fuzzer or are we using another fuzz-target? */
     if (!qts_global) {
@@ -187,14 +187,11 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr, bool is_write)
      * - We have no DMA patterns defined
      * - The length of the DMA read request is zero
      * - The DMA read is hitting an MR other than the machine's main RAM
-     * - The DMA request is not a read (what happens for a address_space_map
-     *   with is_write=True? Can the device use the same pointer to do reads?)
      * - The DMA request hits past the bounds of our RAM
      */
     if (dma_patterns->len == 0
         || len == 0
         || mr != current_machine->ram
-        || is_write
         || addr > current_machine->ram_size) {
         return;
     }
@@ -213,12 +210,12 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr, bool is_write)
             double_fetch = true;
             if (addr < region.addr
                 && avoid_double_fetches) {
-                fuzz_dma_read_cb(addr, region.addr - addr, mr, is_write);
+                fuzz_dma_read_cb(addr, region.addr - addr, mr);
             }
             if (addr + len > region.addr + region.size
                 && avoid_double_fetches) {
                 fuzz_dma_read_cb(region.addr + region.size,
-                        addr + len - (region.addr + region.size), mr, is_write);
+                        addr + len - (region.addr + region.size), mr);
             }
             return;
         }
-- 
2.28.0



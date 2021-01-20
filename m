Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472622FD768
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:47:44 +0100 (CET)
Received: from localhost ([::1]:41978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Ha3-0001eG-AK
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPe-0000SR-9i
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:02 -0500
Received: from mail-bn7nam10on2095.outbound.protection.outlook.com
 ([40.107.92.95]:32454 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPa-0002pL-UU
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/TYXb3682ZrXymZQLHb2lqkeayPwlgUSNenn0KMGsqqKOsVzL7Ev8IAVbfDheq8Xxr9ntSeu/7dF0anwLFU22z1w2rSaBcF2LlGaJnw6S5ax3dQ478+4NvcRWn0eBoTztkS8BNJDpDhgZkuhPqEnYb5iwkQUMjEaoxlzU4Y9YfsdOO6LuhI+7un6eF2n6eiqxREXZAegKW1Vvi3zMdAeEIcK9QKFiDIEjPNPtlA2R4LFqMQP6vLfwtzZW1JuH+y2nn8BPEVGr1E0OfnypooEmHUKpE5NDpvngR9tOYJ3Uu/rQgmw7SeItifHiPQlQr+iVsq+pUIof8xYpaJpdUnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q2Mm3yC+fCchx5Db25wvy1+0mLPnAfR1ONbeeT3KHY=;
 b=oZ+tyLYrhZX8ZJAAhF2gSr63t9i6a7QgeiB7/xL+dIVrtq9atniMv1tORj9SBFIkurjAz1SflotAI1LKLxhZnS9QH0Q1y3FlZG/7U9Qx5ysTg+XTpuGDOayDwaO+e2bebNZ+DXO4EREURvUZQHKXujt1cnQnmtfZFUz2e1mdJupRTMadjsx04v8AkjpzEPEltJDunAGM4qos+cGsUcAKgRNme9ob65BhdLYmboyNXexSWFFVktD5IMZUGOrvNs7flX8K0CIY6REQluYgGvr/PN8iDQJUT/tlXbVccxsT3pth1TSGU9Xi3k79B4D9iY+BTnx/8sgp+lml2csPorjQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q2Mm3yC+fCchx5Db25wvy1+0mLPnAfR1ONbeeT3KHY=;
 b=4gGhqgZGVbDT7dq1K9yg8BdrHjo4XHStC64Fq9qeZiFPaT8M8XJQ30beK86aFlsG8livAf4UvrxCSyqQ8PlJut/jHTJvunPdm2VschzkspmFF9qz7V9gu76LwBXwKqJZGfGKw1Ke2OOzOpeKQy4Et9ZIx82/moEHqV6hTM88n/I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5482.namprd03.prod.outlook.com (2603:10b6:806:b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 17:36:33 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:33 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] fuzz: ignore address_space_map is_write flag
Date: Wed, 20 Jan 2021 12:35:24 -0500
Message-Id: <20210120173536.265601-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120173536.265601-1-alxndr@bu.edu>
References: <20210120173536.265601-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::27) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.8 via Frontend
 Transport; Wed, 20 Jan 2021 17:36:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4684d85-78fc-4c60-a659-08d8bd69ed87
X-MS-TrafficTypeDiagnostic: SA0PR03MB5482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB54820CDC24C283A6BC1A910BBAA20@SA0PR03MB5482.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a13YYisSL4ubZzutg2wajmEm9nw0rJ6fvKtNqgAeiaFLx/ndCXuWalnAtwK0ETOEorP+XxVvrYYhusqI+igsGmM81Zus0NmeLwO/mt1s4CQ3QLkQ8U44J4c9v2gD2erVpRwLJXWOREepuvylj8nBVEH8n6Fm+bu4zCTq9ZY1nDHY1e4qWimc2Zeojz8bXYp7IKFxS5al5wazMAFrdGLqGAZh0KDg1uP6MAELcPiUf4sCFWao6TppDb5r/97MdhrevuCZskERQOatVCxt2gXDu8kTpFFiCaTchP/zs9+l27h+XJVj59cKAcf8cnYIau+Ox+1AG+uuzCVawvGZIwKSZn8Lo+m4gsP8lsUrYnV++uZvIrQHRgKegRqXhnvR/PMBsmkvULKJvwDNIirfqJFSFJwsmVTl6HkZr6pXrA6BwtPkJ6PxteU8skUi4IaBL1dOQBJaLK/EZve7GOMDzp5Qag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(6506007)(26005)(66556008)(186003)(6512007)(66946007)(5660300002)(86362001)(83380400001)(6916009)(66476007)(956004)(16526019)(2616005)(54906003)(6666004)(1076003)(4326008)(2906002)(8676002)(52116002)(316002)(36756003)(8936002)(786003)(966005)(75432002)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?z5TYF/lUgqdYEtFboIOcxq0XYCnxh16ssrQPl5xWzscLPg7SF14qGrW+tO67?=
 =?us-ascii?Q?F4I/OZh2SEyCONtJZPgEt8or4sxXtBlLjfkzGoVoCuEyt5/ajkj11HqrouI2?=
 =?us-ascii?Q?D2dcdh0uPi2ieOyK/sy5ibmPNfOduEkL/b/Tx61LwDMRmKk35KR8yXP8Ro75?=
 =?us-ascii?Q?cnf8a3rB6HIa9ubDEAZXj5VZIJyBtm5MKnS3P63sNy044hrwu8frcyQfDftr?=
 =?us-ascii?Q?Wxlgav6ylhq1Vnb8XhgguF7TZ7rrAsM08/zcmC/byi2BGBG5nrttNSXowlMf?=
 =?us-ascii?Q?rcSeiCXhyTD9K8n7XKFQSfhlkOfswY8a6e/5iNi3dqZ5WRiF62Vg1Z/SpnZs?=
 =?us-ascii?Q?BWWQ739f0qa1CBna1x0KgN8zOsRSI8jeKCbPAFCJkMGCnjVKziX+h8I3IrNk?=
 =?us-ascii?Q?bHH8lwVwqmNbmqXbbrBQdb+7HV4zCC2FjzDWpYgwJigX0xKor/OW+F1/cmD8?=
 =?us-ascii?Q?5Px6r8IdrXy29EL8S8tVGTWG4wMgnmzKx2z0Gm75g5W8gzCsYOPZU9zr66FO?=
 =?us-ascii?Q?peo92y7SxXPacWdxiFTJoKQcfFgIeSgGgzXca4EYiovTHTMvKrqPBrxhebFn?=
 =?us-ascii?Q?L99IVvnr45R1GBSX1nWXMQYeNcdKl3w+H7ia7w6sgTsqzeYOlr4JVpdUzUZb?=
 =?us-ascii?Q?BelnrUO+W73eGwpLlb81GVveEmsL2qchGKtJFh0sBqjtXQ3gERYPsPRk9bBs?=
 =?us-ascii?Q?VpQAWJHVi0Cjyqgel9SLQHCfBL0ihjUMVx0l3o6e/9lSzRcP5T93zVMQLjt2?=
 =?us-ascii?Q?uqiQBqIHX/IjYWW9QyDBf8w0ELtF5VXlw8AvymHy4zfL9um2XUicFAm1rBcB?=
 =?us-ascii?Q?WUlv9UMz+tXaRq3mSG1B+jNKk582Scl/sybF+q/287RZXWgEQFsg5ysP+0z3?=
 =?us-ascii?Q?h4k5yZqb6DARB7fOxmWUn68P/JqwhGCDmkwsbzTc/ky+qMLLN+kcCxI7pQG8?=
 =?us-ascii?Q?mk0XQOYakQ+NjBaymngnpzTSm1lYqoADkFTXJBafrtZTcYOU7jj+kcugu2Gl?=
 =?us-ascii?Q?VXij?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: c4684d85-78fc-4c60-a659-08d8bd69ed87
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:33.1568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYsHj03FzlNinvAfWrNPuqeuRZkQ1NDoDPQA6Yp2mGZD1bKDB5Ri7/GMCCaUxUuk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5482
Received-SPF: pass client-ip=40.107.92.95; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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



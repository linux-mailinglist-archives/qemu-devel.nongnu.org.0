Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E367B302AC0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:52:55 +0100 (CET)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46ys-000873-Sh
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46uU-0004EO-Td
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:23 -0500
Received: from mail-bn8nam12on2112.outbound.protection.outlook.com
 ([40.107.237.112]:16865 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46uQ-0004xv-Pb
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IShODqEENuH9+JbiCYwA9Rj/0daN86TqPV85g85DDNRsDXF3QSuZlxZdWzQYhUylt0bwHfdJNIEZqI8/5Em5BTsJVxsib7JQ7wDot0Xmer67k0HFM0FQdRz+Z1R6Z6dewffY1xJ34rquOVQkTOQ+wyRSwkYkgDBYBmQGWrpLJ+N3TKSOn8piW1u0O8qyXpm8TLGMZy/we2rG7SmxnIPyex/SJ3p9vxUTG3OoV94zSiuupt9ezXafQn2GUTvYISYbXzCZPwRehunD+KXd2Mz20g2WWYAGOlt0DupAvf1mfjHdFtDVd+FeFkejtxq4XQbSHCW/BmwUaahJIoBvjFGDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=petbwEObRAR1urMSeuoTNxR2PSGFo5D944iv8A6AaHM=;
 b=jK+TgvuVe2ctf60FmGGVdKKaTxTzRbWpdA4q4+jv7vojunhuVoDSWRmH4JTy3OCBcZrmA2FOGku62xIvmvuNRX8PQDAc8Ksb/OSbcOIUujOJXsQgITUzg+A+xhqjIhhupQzjxTMJ7m8f4eH0i6ImZxuq3WP9p9lV2ZaBM9wD5XW49OwkCX7Eov4Mg98KHsM+WRHQhGKb3dTKAs9M3xCzllngevHEG5rx1VpnCA637QKfliALxfMpqkMjWFVx/EHH5CkPpGaSyUlmHvYRUDR3iitTj8rE7NrSlf1yH4hVG2WXbl0Y7+1Nek8CPLrITukCZDddCWuLov7tVcDeZFtrzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=petbwEObRAR1urMSeuoTNxR2PSGFo5D944iv8A6AaHM=;
 b=vAp22tNQHNmOPRtWu7GBalxnBZcb1HcPqL2rVDJY/SfIN9Vl8l2IA77yhywjkOKD0S440WGW6XvaRlJgR47WeHV1JuHmOiwSrc9WJl5hVr3Vp9skCgZi/beBwEKdNJJ95VW4a0hbDikM3NzvbnG4SOlreAdlcuybnzX1aGH3Iko=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5563.namprd03.prod.outlook.com (2603:10b6:806:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 18:48:09 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.015; Mon, 25 Jan 2021
 18:48:09 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Subject: [RESEND PULL 1/7] fuzz: ignore address_space_map is_write flag
Date: Mon, 25 Jan 2021 13:47:50 -0500
Message-Id: <20210125184756.319453-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210125184756.319453-1-alxndr@bu.edu>
References: <20210125184756.319453-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:23a::11) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR03CA0006.namprd03.prod.outlook.com (2603:10b6:208:23a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 18:48:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a34eb5d-de6c-4de6-e16e-08d8c161c259
X-MS-TrafficTypeDiagnostic: SA0PR03MB5563:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB556306379069A2ABD9A9805BBABD9@SA0PR03MB5563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wmSG9wHd4ut7CFopHK8F9TCnhWsUEqMwGXSIaAWQ9fcLuY0NRED+gzgcjHfRyTH2eP6FDtGJpEx7OdWbAscCO8Sz/zT7dnbNaJsFqrxEoGXtHSLfOcReggDnTR/QeNDfXo3jXDX2o3ODmXVGmHnQVLqDlYaD7/xvrj1fgQIPcI4hFPiDCt9Bcpq4XGptTlchC4iMdPS9a1hLqF/zdywauy1kCGpj8Nz2CJ0hswNllDZkiODRVW2D925LG8eChE5hIUUhddOfqerY5Aia/XIfy7CdOqWbfbPMiyYm802j95E8+8njNmnvMQ/nzzAsNhFL7NmJ3qb+0qulBF+m6Wz3wM8S3wehIZ88UoyE6UgtGE2jx0iFrw9r12lD6hTjGjZpft9ydWfdlPxPkDMz3kxUCNp5p3UDWm6qZueOfhDLP3bMrDKjOWMBwBKa5dWstt3EuSIE67cIBfhzztAH9ZQAcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(1076003)(75432002)(478600001)(6666004)(956004)(786003)(86362001)(52116002)(2616005)(54906003)(2906002)(316002)(83380400001)(966005)(8936002)(36756003)(66946007)(6512007)(6486002)(16526019)(186003)(66556008)(8676002)(26005)(4326008)(66476007)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7Nae/zyhJQlavjjzAhUxHmCpvV4nyGNJucRVDBblekSSL7lcKnYQInbH57o1?=
 =?us-ascii?Q?7Oy8f39YVkabWDsCS6B5u5PXLvYBOexzSH+Ru3xTveg1XDn0fMlzW+ILaKk3?=
 =?us-ascii?Q?HtKsaVqJowVskqK8Kogf/ELT0UQ3z8MDiUz5AiMu8kDxsEsOTTlwITVloa1e?=
 =?us-ascii?Q?L9gWYsgZRI50KCtDYrU2CAk4tRzTyEsvZofyN9zTjlgCK9EPxdKsSFny9Nda?=
 =?us-ascii?Q?h9CVV18UXjv91mYzU8RKQsBsHRwPR+3aeefrviD0Fqj0W4q1AqMe6TC4gMRb?=
 =?us-ascii?Q?nTjO+iHqNOVOoG/wLEjHNbCs1uaL0Lry1WgvqhQemd7+cZCbneyO2R+X9niQ?=
 =?us-ascii?Q?JhAKkl+s8gNnwD/pj/4ldbmnKXSbmS71xXCYgRmNr4+XD1qddYtLxKBUCLdC?=
 =?us-ascii?Q?nPqdJbQ0gd2Kiqstye/G44IYLPIrqlrwB5Jgo+0dkUxxp2wAIiUYRtyxP9xb?=
 =?us-ascii?Q?QPkErb4HQD7Q6hSciD5DJS84jkfAO7E53Vh9yGtDhlCDUEV3mw37A6mowA0f?=
 =?us-ascii?Q?5/BaziYccM3CAQeqIkUWSK+EPG2rg1BUfCnsJtH7lFdCy239L+1GMRC6dI0z?=
 =?us-ascii?Q?e9KmQK1Pz69ZeoZ7xTVCf5TWauApTvieQnQPJAZkWqEnAXoQTDEvZg2pMEhP?=
 =?us-ascii?Q?KHoWT6sNsNeh12Ci3pzc9xgbPRHDFYRou4RxtenpfAX/Kqw96zPC96jdMLgy?=
 =?us-ascii?Q?LtqAmn3SF4gWMzmKp6Rja+BKmsltogAvMOampt6g/XW1LfVqQDLU70JwcI9j?=
 =?us-ascii?Q?fiwBy5QAWg4kh6Jbgo8IylZu97bFy+7k6arYwOjuLdv8tI8lURbo0RKmMMpX?=
 =?us-ascii?Q?f7jaddv0PUdv/zyiHFr2hTVzdOfn3mdt791u1BCTTg/IAlVC8e/cOrF9pgCD?=
 =?us-ascii?Q?QK8RpROqcx9usGSn45X6uLGJyjvREe8oX4FzJUrccz8I8G6UYFLkPaAcMDxy?=
 =?us-ascii?Q?wsWQ5sazfawXGGcqax9zG8M14otGfJTDC/2O0Tpe4OmYyjiDMQxFN8PRmKOP?=
 =?us-ascii?Q?419kvxFBuDZ/MsfxO8eLc/QrDSpbk5IO9cXGE9Ar+FdxwZYASP4SQAQf0qAd?=
 =?us-ascii?Q?5jIOPkUu?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a34eb5d-de6c-4de6-e16e-08d8c161c259
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:48:09.3671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XM+l7ovcYRDTeVK0n50pUdCssVs6wXYh0kOcjLp3AlXf94Ov4/J5QX1o1HzmOTss
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5563
Received-SPF: pass client-ip=40.107.237.112; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 philmd@redhat.com, Darren Kenny <darren.kenny@oracle.com>,
 peter.maydell@linaro.org
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
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20210120060255.558535-1-alxndr@bu.edu>
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
index cdcd197656..f31e545b8b 100644
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



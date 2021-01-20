Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3348D2FD778
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:50:15 +0100 (CET)
Received: from localhost ([::1]:49028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HcU-0004oc-6R
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPk-0000TD-Az
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:05 -0500
Received: from mail-co1nam11on2129.outbound.protection.outlook.com
 ([40.107.220.129]:63396 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPh-0002uY-R2
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fByLCGqlc7FzfhWTDYls5oHOHqpCUNlNo0rBLUTWArtD6hp/94dEMlhtzKDb3Ul7DrBq6ATrkrUnqTzywcYGSfOFnUQVDKvJpq2WePdo2nYycZx467y/s9p1jSO5yw6I9wNW1GIKltRR+peOTPrU/vsmxo0a4V+4JCwv+VSaI8SIftt6YDd6cyb0ZuNZRRqoEKQ8ClFuAPzrbbN0WvNckNvllwehMTfvbfbMv4ac9XlsVZs7BCzQWIJTltmpxSZ/gRnPs8hFAzMXHPVnRaItLjVFZRJvuPpnRwBJ2ijXAp2tPOX3W4Kgdx2/RUf9k3viw6a/zR+8YiH4TmPJz3l0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8sJumVbc3wCRn+fwKCG51zJBCewo2D16ePtBtR3T2MI=;
 b=Pnjz/P75FnkuaiiWYcBvus4m7WqMvOwG+wZHlcDkE58nZy4ELr5PNoFf3Jjjc+Adf/PePt2cX7i8mIVUfjsuDqstPxx40GxVVY0jcffN0GXjOK6d/zOVqAPQL+C5WPoQ/O1Jci4+hje0FKigGC4SqiILwZSSADKy+8/rA7F/GhEa1qrDsqluTQKpcLfu1ky3KAl9xqDm/88jB7B/TIaTV8/Ar6cTWg0A52eN+/bvQWQBntCoZq1zr6Ek8DHUcYUq28snWWuziz88dmKx4Koh55UbbrZkmefFL2gp6yJQZJp+Ru+y3gTNKl1m5kkLKOhqpiHlVz+jfylIMvGdinS0gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8sJumVbc3wCRn+fwKCG51zJBCewo2D16ePtBtR3T2MI=;
 b=xwV2E+41bS8HSRDm+w2syTE2SaCCJCjR6ssNFoIspRZQXY53KkhNfV9/0yF6FIR7U411hMWo8k61wzmvYnT7Fe7qWc6sn1oxaqQ35WGlEQo4MqwZF/lLBdRPf6Rb8fwavfEnz4DKg3Y+6f/Yluct4TgLDc3HIFVOhFFGDYaUjq0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4576.namprd03.prod.outlook.com (2603:10b6:805:102::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 20 Jan
 2021 17:36:56 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:56 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] fuzz: ignore address_space_map is_write flag
Date: Wed, 20 Jan 2021 12:35:34 -0500
Message-Id: <20210120173536.265601-13-alxndr@bu.edu>
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
 Transport; Wed, 20 Jan 2021 17:36:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f7f26ec-8043-4743-f406-08d8bd69fb0e
X-MS-TrafficTypeDiagnostic: SN6PR03MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4576C38E6E774BDB6952B37EBAA29@SN6PR03MB4576.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K39u/dRwPiWHnjGR3ga6jztcJWFmudpaZiIdG3TUjJUX1YxMlk8sf9ttt4ngAk6m7mtI61hvz4TJphupM8EQADOd8Dbi3GfBw35xSS0ce4F63xdsom6eBQgx8528ORJ9LM+OltsQrmRm1Bwj941PhvOWd9mj3R3vbdSamP0WBSG1ggT7DO1Fivy2Yz4oT81zXycd7DsR8LdQKdByC6AdbYoN9DMImDHYYbOgEuFYLzevJlRj+5e3t/VR/2tdnCYgNo59CU2Ba+HVDuzSuVW6881IGhkNPI6PFKZdUmLiGk8NCoSumWHWiabqTtL5jFRUdISYcyhaTmwY/6+09+2hC8zmTO4Uuume8NOBojGaHrMHN2WfXda8JwHf3y/VzeQNiqFEvVccGMe12dBasisMYGCMVP/e/3bMRLU2cMuc7V59EACrmx/Xtjw5jfWsw7Cym8l3GiKsjgatop34hVUAfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(83380400001)(6486002)(26005)(2616005)(8676002)(966005)(52116002)(4326008)(6506007)(6512007)(86362001)(54906003)(5660300002)(2906002)(66556008)(66946007)(66476007)(75432002)(956004)(36756003)(6916009)(316002)(786003)(186003)(8936002)(478600001)(1076003)(6666004)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NFBugDsZDZ2EOWoEYTKZeJ9UV9VRgwhanyaNYyfiUiSNTEEtohsETh1JIPBl?=
 =?us-ascii?Q?sLETtwW04xy7eC1RyA+FKm5Iz0NjGqtg8tV7sV2y6Mgjo8SJhJVrByJ8lW1x?=
 =?us-ascii?Q?tfST7YRs7CdqmA28VO/PhMmKH1sep2jfBivAndQ7MojLn/QzggLjeAM/qxtW?=
 =?us-ascii?Q?1yYkodAb45SRgJ8Aq/BOy8P3XcNBf1rhDTtYkaZyPrG/w5vubjzEhSVWNblb?=
 =?us-ascii?Q?Xke2HbwRat7UTnPADSnMMJCf21nKk8WsyUX93TrJch7vDPf2GvvIGTyUGQh7?=
 =?us-ascii?Q?TTgHZsmp6uQ7NFA3jFO/5rPs2+Fei05D2N7O/D2IV5MzLckNu67VPD1XEmDv?=
 =?us-ascii?Q?aUrhZ0sigTg1wabjB941WvcZThGJScNajKILVPM1MBOCAYpjL3h2gu9ZqGLG?=
 =?us-ascii?Q?NDB6HJurL4cSd5V4SWoJRGuWZYcI978bjcAp7jOqBFHLL0Fl0b0ZxQsH9vKl?=
 =?us-ascii?Q?9/sYLgGJVbjEmGs5bQuHC0VKApyOyBwoBj33vxaUOU7JZfn1meR0UEqiz1Kq?=
 =?us-ascii?Q?r4zpUjKzgcEN3mfq+dyNlXL1+Q9US2fXToCTu978jtnZXlXXaCNSo7Fy6I5q?=
 =?us-ascii?Q?pUY19zOhxuj3tZdOSvQWpu54HUpvjBdWf+pvZgTkB97nwCnysRhT0gBligNA?=
 =?us-ascii?Q?gGJfy9aRgbGz7c18lpzbip3B6LytpJ7UDaV7Ocha19LwEuYD/dizEk99vYlZ?=
 =?us-ascii?Q?9ec3s3Wm0uJYP58d9AAW57jKKMeiDqJB336TG/PiQdRttHVANLnFrOksDH5W?=
 =?us-ascii?Q?HZTQ2cW+mXEICjpl3y5M73StU5e8+z30WaIessfAmWKVZ4MrnMaMOBItLrkQ?=
 =?us-ascii?Q?hcWTpPQyw7T05WGq23lEFydyhJ1zi1BUQFZls/XFxmaXIPLMxQ+MmtBPdr4d?=
 =?us-ascii?Q?aMhQKn1w8mX5e3H1XWtaC7zm5Z2GsdVq5xcAqtTdR8lGTg7zkO9GE/aQQr4M?=
 =?us-ascii?Q?7XrazztUBCHksjS/1yzfLmmk/g2fDt0Re5BsndZcWnKxFQwtiY9fe4gW9Mie?=
 =?us-ascii?Q?a14Q?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7f26ec-8043-4743-f406-08d8bd69fb0e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:55.7290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epI6J3Q2rIJLkSXChoVSNVVty5jD2O4mfGNSHDOEhTPngS2gE15JdD8CheT9xoPh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4576
Received-SPF: pass client-ip=40.107.220.129; envelope-from=alxndr@bu.edu;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
index 6adf62a5be..ee8c17a04c 100644
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



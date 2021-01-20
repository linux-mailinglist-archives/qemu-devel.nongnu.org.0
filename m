Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A032FCAE2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 07:04:37 +0100 (CET)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l26bb-0005DQ-RI
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 01:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l26aI-0004lb-Me
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 01:03:15 -0500
Received: from mail-bn7nam10on2090.outbound.protection.outlook.com
 ([40.107.92.90]:42913 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l26aF-0000Pk-QM
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 01:03:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hkg/gL1YhlklJiNWQb8N5Uer9W1bP0fvXH/cOKW1LpFbSbh5/s07gyJA4tY+J7gZQkRwrFLvSZbNg5mE3vTc16U5JoxEEMQO7sj69rm8jRzx4s4fxS+vvrYHMrc+4BE02pbgUD6wn0Ytvq4rFK+gvskiZAg+0KPEWGfprX2lAvWpuVXQYx32mK0R4i1Xov2VrYGGsfsADaImUfD9Me27xgDqEFvWpAmivJHfkO4zT8zdFgzi+z+VUxDdG7QbJFeDTaAs1rmp8SPl2TgOOes73TuuG63Kdms/WJz75GSTpluh873jsP4g8UFRP+MSpvBzhgV0+r5a0/M+mUGhWYM4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q2Mm3yC+fCchx5Db25wvy1+0mLPnAfR1ONbeeT3KHY=;
 b=bhKOHaUE8jRPjTMDXPk5akN4gEvXkXOa5emiXJ1XmFMuRAvOva48iSkXleD+2uUoSZXRCR6xrDzwROplIIM08pOmgBeGn6a8xhfW6RViAKFPrTN3n0sI1NQx7gSVwSiYbz2Z0DUXW8dSpeqIItmfCRXSxvYnYt+dNIbJrgVt4Z0gVmC865RnNtsli3wiXsyGeG1uSSiqh5EE/RcUkbHDpLg9ebJIijR9roa0iCzL06toUoNOniCub49IKYynWcSIyht9I4+rH35f9VLxrruh8d7tyveeymRYtgUq7BLbl04/MmMELg9SytpvByzqNtxfKlNJLbt7pNB3J+lmh41O8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q2Mm3yC+fCchx5Db25wvy1+0mLPnAfR1ONbeeT3KHY=;
 b=SMdPdxBTat3S0dOhrYmnv5KpKkycEGAcWtSZBXV5FX/m/Jyl/viRD5Qdd0iVqtLYnn8FBQZQPAlW3l6nUKG6JBLgcbdS+Hz1oTEHEqE2F4Ng1XGCRtyQJMH7HIMEI7jp4/P2JcH65JAaO1xw2mBjOiUBGCs/6fk2ynsOtTq0C7M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5884.namprd03.prod.outlook.com (2603:10b6:806:f8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 20 Jan
 2021 06:03:08 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 06:03:08 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: ignore address_space_map is_write flag
Date: Wed, 20 Jan 2021 01:02:55 -0500
Message-Id: <20210120060255.558535-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR18CA0005.namprd18.prod.outlook.com
 (2603:10b6:208:23c::10) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR18CA0005.namprd18.prod.outlook.com (2603:10b6:208:23c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Wed, 20 Jan 2021 06:03:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a1e0bfb-fd8d-4495-dd87-08d8bd090eca
X-MS-TrafficTypeDiagnostic: SA2PR03MB5884:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB58841EF33615303B404A9F96BAA20@SA2PR03MB5884.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g8Q7iFTnpc8c3icia5IEDwfHrfDmodQxSij5LbHvWV4VZFmjMaIhdsFOn8cJVVrQYfWc2WJzDjoQuW1mqAH6RY1I7CpEHpGL5kNGbQjVcUsgTBDkbrWoxrAPIjpgyfsgI8j1zU7xi5YMp4rlRDRAVuJURFnB6lLYvRTrxKI6lwVFUXDGOi7yjKmkQj/AjdnNw6goe/+hoErf9yGSHDyZ82L5sP/mSLfxc7exCbfS68A2vjhmpVqkBIc00fKwT+zLWYErV3MALW/p6y/hR2drND2/LiX9AtJv3VCJqu2uWI8iejnr7++H5HEwH22fqbC12J7CqKPKUz8hVNv2+mF657sAbZ+mCiqSO7jOBPphNe+vgtCt6BNGisnBmWQYx6WdvNH0Nu2hUNZA4vbPONJx9SlYK5BidZtMnFOjtG7YsOH1Q2dhuuGiLOlIYrIps0IMSG0l2EBLYLfkOTfciTPUsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(83380400001)(6512007)(66556008)(5660300002)(8936002)(6506007)(956004)(6486002)(2616005)(966005)(75432002)(54906003)(4326008)(186003)(36756003)(52116002)(16526019)(66476007)(86362001)(316002)(6916009)(8676002)(26005)(2906002)(1076003)(6666004)(478600001)(786003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?a9i1U4gYQlSbQAZKzQWMhs12s2AW7xRHLlP/KJFKvM+/EV5kGWqqAJFtk+J6?=
 =?us-ascii?Q?tnnSLiSXp9NjkTpF0BqsAhqA+HtyJt+BGWqvTKC0/Gc80R/s0/h95DoNiS9+?=
 =?us-ascii?Q?KrwLv1dtgPv5xUHDB0jsIW6o/f7D/GZB1kJ4884Rw8ztCF9bUfXxjuCzF9bw?=
 =?us-ascii?Q?DN46UsqZXWMG60Z1Ol++cHaSoZKPmsj7c6UhR9kYUpl7l+jJVV6xlhYSmatd?=
 =?us-ascii?Q?2/aLSO98nR80Rhd0w6gLDdUX6s2Q4uDo9zrV84aicvqe4pWH79Obv/2ujNl7?=
 =?us-ascii?Q?Bu+ZoULig6KNgrjeDcVo4Iq/fpQf/aQ9WnfkYfgAa+0zh/Bg0DoRNL1tLETc?=
 =?us-ascii?Q?Db7KuaJY1nzxRT1OiqnvxSKM6KA5IcTpuCt0ulGLxEUKYynX5kHjjSjkP8M8?=
 =?us-ascii?Q?2LMWz/xlskEVd3AKhowe2YvWbJqNUCh4FZafdqj0EaBysjpKhlnQxKg0goHY?=
 =?us-ascii?Q?5uhm24EuAQmKtU3Yl4yQK/Sjat5rHiKo37aaSLZmJnH7lpoJng9OZtmoFsqZ?=
 =?us-ascii?Q?LyMN0VI6IJo0Y/XMNgPesfjsicJqtuByTKXYi5bby+AFd2sxc1UKYXFDpu7n?=
 =?us-ascii?Q?m9YfxAJEIaSxV6tY9yt8zDZeEMoTnq0dzaMPakBtGZGEB++IkC21AMuwKfKx?=
 =?us-ascii?Q?r5QE3mft/+es/EbTr4FK4mtPEzHjHvpoGb2w4pi8JTJbEoTUM+UHN8I7OIPQ?=
 =?us-ascii?Q?FcHcE6LjqGG4kd4FnHit9rffT+SwWe3pd24A3dG61dDEdBtW0uAY3C8twcOw?=
 =?us-ascii?Q?kBiFwg/bikmvsw+3Pis2ruSiJ92zWCyNeFafi8JAS/xFAWwmhOw/nP9UWCEp?=
 =?us-ascii?Q?76f6utIwKhlx4qq3WNo0+WsfXAgsrQKoc15BqvVUFyvVofuyNFZtfET7nZyD?=
 =?us-ascii?Q?ibRTuc6XkYZBwbH84WJH6oTb5I7Lvov6DJa8GSDDqBrnYZ8Crs2goiPCU7aN?=
 =?us-ascii?Q?B5If/SRcNSQ86Ez/6Egeb0gdj9UqWKSVGGBymaSf/CHH/o1XK7LjmfiM9CwX?=
 =?us-ascii?Q?oygq?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1e0bfb-fd8d-4495-dd87-08d8bd090eca
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 06:03:08.0142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZjlA2Z10N5cZ8A1V8OFzXkbnZCkBv3illlIj9Bfp88HU0bFKiX3ZmMfCnaohHoU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5884
Received-SPF: pass client-ip=40.107.92.90; envelope-from=alxndr@bu.edu;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
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



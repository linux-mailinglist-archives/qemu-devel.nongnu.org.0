Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1225B2494E3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 08:16:05 +0200 (CEST)
Received: from localhost ([::1]:51844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8HOG-0003Oh-3W
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 02:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1k8HKE-00046B-Co
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 02:11:54 -0400
Received: from mail-bn8nam11on2094.outbound.protection.outlook.com
 ([40.107.236.94]:24608 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1k8HKC-0001Y3-Ex
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 02:11:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGUD7Wlsra9TNtAWhAqxxgOXuX0aRdTVE03Zc8Y9hV0OGpSjOJ3WeM0Lf0lcAPI8vNd6tFHAjTB8OrtFixYVybNy+r0Jo4NgERlQkOb/IBb+0RcXLuq5LcjzFDgCX7ncqEj9uoFrrSSkXs7HGDoaZYWaH5EVtVOPw7kQ/XufffOLbjjg2PSDrKlS/PfMdxgER7C8JjED+ZFrmufSoN6d7aaZTlzlsMfErRJNPD5FcNxsbashAPiDk0ihXlhyQMW3GSzvVlku74B6uS8lo4qZCuJY35D7Cp4G6N0A2/N4PyaKxk5IIDwxyh2vz66/DpVjgCmMcnmjCrAqxP4e4zbY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXTbiJoPSKS3VxKPN9vb51pNXpSxynA+NscG/Jzs/8w=;
 b=ldOEGhYv0TgH/oeJxhcmp33EB+Dw+EAMbrjKisCs5tLu9WGokRKkhJ6tdFNNlp+rBlnLQqnOFIBrkGAQtsHe4VHcEu3+KZrXoGQ4YTcSuhhoBM2F5hT68v/a0zck1cUq6Brib4DLxie7MYL6US7+c5dQclNcPjRkLFRE13D0YrI4lZSKrQhjQRPTrX3R1+1Y92VKDSyAWrHxTwVZqygAH55f/WJIh1NQkhkay9/RzKbbsf+vDjnMv6jHTCjAjpBlFV+zYWaDqpJ4hNxdp1A84KzHFvMLs2c+YepItTq+MRfxGpkh5mUJBOzg2t2s9c7CMm2XBiQbqs9vIARv7FXrag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXTbiJoPSKS3VxKPN9vb51pNXpSxynA+NscG/Jzs/8w=;
 b=IuV90DFMJyUp6NEIU0Zjz6I1/VOWBGuNFl9hx+HWeUehcgAZtyk6VH40fYN3k2OBd7IY/fwb0mKF8UB4zbZ9tnG5dSM3FF92vxIPT4tPEin7h0GGQs9g4hhGCRf3YDjihXjhWlNBOJWoIDBfqvRrKK84ogqLpwcducNsMMooDIg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3934.namprd03.prod.outlook.com (2603:10b6:805:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 06:11:40 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::61ae:93a8:b26c:77b8]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::61ae:93a8:b26c:77b8%4]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 06:11:40 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/15] fuzz: Add fuzzer callbacks to DMA-read functions
Date: Wed, 19 Aug 2020 02:11:01 -0400
Message-Id: <20200819061110.1320568-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819061110.1320568-1-alxndr@bu.edu>
References: <20200819061110.1320568-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0012.namprd15.prod.outlook.com
 (2603:10b6:207:17::25) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.93.72.163) by
 BL0PR1501CA0012.namprd15.prod.outlook.com (2603:10b6:207:17::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Wed, 19 Aug 2020 06:11:38 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [72.93.72.163]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcb07eb8-d985-4372-f91f-08d84406bc72
X-MS-TrafficTypeDiagnostic: SN6PR03MB3934:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3934719D3FFCD90104DF4B52BA5D0@SN6PR03MB3934.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:308;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: muPoSCTdVrrgcw2O8TzXWnTWOKvsnpNAAjbdYSmCWhxO9yL3tay0If01+5FnYYB8ug+NQm3Qe6aakhOjxaqz0PUJUwf22pNHGOMEPXGKB1yiIE9UYKCsorSjA0E9PdANyt7hXKERacPy+xavUSPihWE8rKo44V1BWitHgf2g2YAvV+FTANxncSqgo2aNvbE8+4E3Av7KtiNYbtafIkOw5GgXxTSwkRiWtk9cLV9CoBmp/Bq+n6bTfnoyVhktB4+b4K1sXef9H9vXX4Mn6ATHfcYCMZ5QcH3oZ9C8DAJnIcQ0OLX6fGmJ+erl1qTFH4Og
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(1076003)(8676002)(6666004)(2906002)(6512007)(8936002)(6916009)(83380400001)(6486002)(54906003)(956004)(6506007)(2616005)(36756003)(26005)(52116002)(86362001)(478600001)(786003)(66556008)(316002)(4326008)(75432002)(66946007)(5660300002)(66476007)(186003)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: i6Ngx9jtMJmyRFlaMohxcgKSNaOb0CWuMhUz+9WNqAN9Hi2OC9UyFPeiln/2NNp1UaTvOhyIh1jCGWwFnv7FwxE9hVxfeYB98NjScCzMm1ELU2xFlmKRapBUZ2vzDaIwkf3TWNSzGlKOv7rVgbRPeMMy4hhkqNgkGSoFLYb42vPP8Anzj+fnzqk6KUK1/3SbHjXXwIVvxFEEh4SsFErDFMm0JPOZvewIpbOBAZzPqcsih1yi6zSRwZl5PQICgoN7q6PqB4pFUAKhyLrlD7VK3xo7u05xWlO5tkfgEF7o2pLVzG1uH41loqkBytijnH7fldUUt3pHxCgYQYXQXHDeLjTZ+l3CFFfXh8417Hf4TqThE4jnMwolFiMkeA2NJ7NWiCKH+rz1JizmDMA512SMHvfa8XR6UAJpYsCzdEg/yMkeAmBQKj5Gfj5/yIg/zozFl9Z3gHyzmoBJRPnmFQRmuAjR46nKyfV9+z8exPzm6L1AFmGwvXOhPWSKqCu5Jug5oaMaRY/eyo5weXkTGdjjIbzvTSKCn/fQacNPfFEjwqcwsLkFaJAj7zGBQliHMVNGXYORoX2wT/cryE4A0Qjc0wFTgY3sToVsf7KWl4CfJWN7YcCACzawF6iPBKmsIijOehJLrISSR1PgRQ8cu+Rwfw==
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb07eb8-d985-4372-f91f-08d84406bc72
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 06:11:39.9506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wY/6cw4WAPCSt8/vXvAMaM0qFt3Kmj+k5G7yejGnEhS89d1KQm1C6vgJl33OA8zC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3934
Received-SPF: pass client-ip=40.107.236.94; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 02:11:39
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, f4bug@amsat.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should be careful to not call any functions besides fuzz_dma_read_cb.
Without --enable-fuzzing, fuzz_dma_read_cb is an empty inlined function.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 exec.c                                | 2 ++
 include/exec/memory.h                 | 1 +
 include/exec/memory_ldst_cached.inc.h | 3 +++
 memory_ldst.inc.c                     | 4 ++++
 softmmu/memory.c                      | 1 +
 5 files changed, 11 insertions(+)

diff --git a/exec.c b/exec.c
index 6f381f98e2..c81f41514d 100644
--- a/exec.c
+++ b/exec.c
@@ -3241,6 +3241,7 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
             stn_he_p(buf, l, val);
         } else {
             /* RAM case */
+            fuzz_dma_read_cb(addr, len, mr, false);
             ram_ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
             memcpy(buf, ram_ptr, l);
         }
@@ -3601,6 +3602,7 @@ void *address_space_map(AddressSpace *as,
     memory_region_ref(mr);
     *plen = flatview_extend_translation(fv, addr, len, mr, xlat,
                                         l, is_write, attrs);
+    fuzz_dma_read_cb(addr, *plen, mr, is_write);
     ptr = qemu_ram_ptr_length(mr->ram_block, xlat, plen, true);
 
     return ptr;
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2ec3b597f1..f8b943521a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2444,6 +2444,7 @@ address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
                           void *buf, hwaddr len)
 {
     assert(addr < cache->len && len <= cache->len - addr);
+    fuzz_dma_read_cb(cache->xlat + addr, len, cache->mrs.mr, false);
     if (likely(cache->ptr)) {
         memcpy(buf, cache->ptr + addr, len);
         return MEMTX_OK;
diff --git a/include/exec/memory_ldst_cached.inc.h b/include/exec/memory_ldst_cached.inc.h
index fd4bbb40e7..aff574039f 100644
--- a/include/exec/memory_ldst_cached.inc.h
+++ b/include/exec/memory_ldst_cached.inc.h
@@ -28,6 +28,7 @@ static inline uint32_t ADDRESS_SPACE_LD_CACHED(l)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len && 4 <= cache->len - addr);
+    fuzz_dma_read_cb(cache->xlat + addr, 4, cache->mrs.mr, false);
     if (likely(cache->ptr)) {
         return LD_P(l)(cache->ptr + addr);
     } else {
@@ -39,6 +40,7 @@ static inline uint64_t ADDRESS_SPACE_LD_CACHED(q)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len && 8 <= cache->len - addr);
+    fuzz_dma_read_cb(cache->xlat + addr, 8, cache->mrs.mr, false);
     if (likely(cache->ptr)) {
         return LD_P(q)(cache->ptr + addr);
     } else {
@@ -50,6 +52,7 @@ static inline uint32_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len && 2 <= cache->len - addr);
+    fuzz_dma_read_cb(cache->xlat + addr, 2, cache->mrs.mr, false);
     if (likely(cache->ptr)) {
         return LD_P(uw)(cache->ptr + addr);
     } else {
diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
index c54aee4a95..8d45d2eeff 100644
--- a/memory_ldst.inc.c
+++ b/memory_ldst.inc.c
@@ -42,6 +42,7 @@ static inline uint32_t glue(address_space_ldl_internal, SUFFIX)(ARG1_DECL,
                                         MO_32 | devend_memop(endian), attrs);
     } else {
         /* RAM case */
+        fuzz_dma_read_cb(addr, 4, mr, false);
         ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
         switch (endian) {
         case DEVICE_LITTLE_ENDIAN:
@@ -110,6 +111,7 @@ static inline uint64_t glue(address_space_ldq_internal, SUFFIX)(ARG1_DECL,
                                         MO_64 | devend_memop(endian), attrs);
     } else {
         /* RAM case */
+        fuzz_dma_read_cb(addr, 8, mr, false);
         ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
         switch (endian) {
         case DEVICE_LITTLE_ENDIAN:
@@ -175,6 +177,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
         r = memory_region_dispatch_read(mr, addr1, &val, MO_8, attrs);
     } else {
         /* RAM case */
+        fuzz_dma_read_cb(addr, 1, mr, false);
         ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
         val = ldub_p(ptr);
         r = MEMTX_OK;
@@ -212,6 +215,7 @@ static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
                                         MO_16 | devend_memop(endian), attrs);
     } else {
         /* RAM case */
+        fuzz_dma_read_cb(addr, 2, mr, false);
         ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
         switch (endian) {
         case DEVICE_LITTLE_ENDIAN:
diff --git a/softmmu/memory.c b/softmmu/memory.c
index b0c2cf2535..be87044641 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1405,6 +1405,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
     unsigned size = memop_size(op);
     MemTxResult r;
 
+    fuzz_dma_read_cb(addr, size, mr, false);
     if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
         *pval = unassigned_mem_read(mr, addr, size);
         return MEMTX_DECODE_ERROR;
-- 
2.27.0



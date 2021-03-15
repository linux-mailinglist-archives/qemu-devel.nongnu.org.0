Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03B33BAE5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:11:45 +0100 (CET)
Received: from localhost ([::1]:41576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnwe-0003AZ-K6
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLnqm-0005ap-JT
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:05:40 -0400
Received: from mail-bn7nam10on2096.outbound.protection.outlook.com
 ([40.107.92.96]:14270 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLnql-0001cT-45
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:05:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNYP+GCGCZkm1VYjVX702DJFtSJVPzaBTfyU8EWHJlKAyAVTEVsizZ3ASbLmN4wwPjCPPybPhkQV04FFedzQbmiGA365S2Vf2BDiwDilHJmNxPFlpjo37TwH/bEVbCgMDJXqnfOOdlI/NH7paxNg3/XCq4eKJ3XYCvyFWL4ECLRXFtA62CurNIH25Q1FOqIOtYsX4FL5X/Nk5gawLcrgHNJaTgNNMNJ8veMqc++hfCSGXWsxqnS0tUat5xtbdURM96u6o+f5MBZk3I8ubzFNkygPT5QVgIJxknz9Rqgqhd6gP8prXhBEthmYaGq2VqYb8HyXebc3aWOa+fjyZLwvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYHZtxpSNFquuXOzvRuEz4wowKc/Ih3cfnC06+iIw6w=;
 b=CmqF9gEaj4/w4W3XTdu+cz5ISmL34Yy5GxcptMl0TyhQd0oC1ugvN9civsWvXldDu7ppdf15xGWBncIKzSAX4OE8Xy26fWDbQCOpCq2O+yNPMT9GzelmsoH5I/97s4eK2oZxN4EvA/OlB404FalSTJ9XunltNRjXahwL4skxrxZxdrAbR91uwrcjtbeHRniUB1T3HVPKT242rR2RGn1ptMCDnYXi95ezVMHSntAL5jtRZkCEYtfTPCEdfjani4aszur5zVn6uQARfZB16ay7RqRU9l16O9EIY6krAX0Ereayukv7aipP7fB0roMowukSDsO5pyYC4BRYlURdIhuAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYHZtxpSNFquuXOzvRuEz4wowKc/Ih3cfnC06+iIw6w=;
 b=kTWDiZoZYxgZ/rvRpeE34G16rGoM82v8pmTNSIRH0Sfw7QQYMqdZNmOsFbdO1Bi0A7oa6zsLVX1YKyTb/7HFJzECA2aOrbjufhI4p/WN5Afy5BPv6GQCG35Gl2Oc9w2IjAK8n07a3FjYaWW9xl+Qit/QAHmEQqU82lcC9IPH9lA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3933.namprd03.prod.outlook.com (2603:10b6:805:6c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 14:05:26 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 14:05:26 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] fuzz: move some DMA hooks
Date: Mon, 15 Mar 2021 10:05:12 -0400
Message-Id: <20210315140512.8357-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315140512.8357-1-alxndr@bu.edu>
References: <20210315140512.8357-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0336.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::11) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0336.namprd13.prod.outlook.com (2603:10b6:208:2c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 14:05:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a36429c2-a7f8-4073-9c10-08d8e7bb61bd
X-MS-TrafficTypeDiagnostic: SN6PR03MB3933:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB393334060420C25D26464F13BA6C9@SN6PR03MB3933.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sDEpvDfhYC1Vf3Ru5eBF1EbULMRp1mkLiae0SyTDi3tcU+KzPiY505cecrmDLk19OZUKuyZw9hVLr91/mDbR1bXo9/61lOM6LvCZb4FKPAVcWO6swYSWeJY0J/jv1oY1M03AuwscK/78OaBKwdw6qFkOg4m8YJhxLmkyDARwsQAQzLkJVQzscWZaIxL8yb0FpZhaQLQFAchm8t1eNYq+yOc0sAHTj3j3aKAHji03eLOSvzpBc5htyGHeGMd3C3MQa9dYvAfDnEFWZsllfi0NdMYbHc3JLtecEHppaNI+QUBqqgE7wO6/sFLyww+Z+0DfKZTsD+LqhxBM10JGZ68GqJbnK0jPtKP0VtefPnd03bKR3jz0whlRXoOJnYQVC0N7YLfsMJfzEbGlWILl+uti3qGw0pHMqbr+vsjDS2MRgcp1oJMiJu42JdgpgESnDVdG4o8i7Zd70DG2nrpLegb0+1t7IbcJ8YXAQP8Dc/mwTO2aPpPKcwl/IQ2P4K7dl28ng4qRwZG6fp22okLqrZGVXS1i8SVZlMVGlSFspGxcwW5utjlZty4shqCEERFugySi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(66476007)(8676002)(36756003)(66556008)(66946007)(83380400001)(75432002)(8936002)(316002)(86362001)(6666004)(4326008)(7696005)(52116002)(6486002)(54906003)(2906002)(186003)(956004)(786003)(6916009)(26005)(478600001)(1076003)(5660300002)(2616005)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dw4zqSgzNjy1ZQR2yRyKaImPMW2whhMyHdU3oQPAm658rLhi4et7y6uOPRvF?=
 =?us-ascii?Q?vnie5952laPIcsxGp73/6mVnNbxNRT2uOP87Hjkqdo6zSJetJjpL5XQK5Ler?=
 =?us-ascii?Q?7qXNuQLtgTWBlkAFsuVQ+N1nUc9yTj+lokQ4dztbD4+yNISgo7DbjFOa6wzn?=
 =?us-ascii?Q?gJm9rrHzvxhiJ1UWF/mC29g9sSmjdFeg/Yf6OQNSZfkq8ac4gRamJ0IdvvTh?=
 =?us-ascii?Q?q5sMfesf3M4/CMpNSzA7tSx8Swdc6sPZh1+r0yXvc9Ec2O3AvW8jLjbcwwgq?=
 =?us-ascii?Q?8M1SdrWqtfzL7e1SLb+CwEyHtd95Oj3ksJB5zgZEmTRHLalAbi+F3sxiV4/n?=
 =?us-ascii?Q?y1hu8mXJywi1KO34wuFAxPD6kRJseQwIxvHWqojbGV/YndwJRRn8sSnKw2T8?=
 =?us-ascii?Q?MlLFBY7v3wb9pYPj5jLrKLFwspIdXfbT5yiRbdvNHMTDX/vHIJWbzv87oSX2?=
 =?us-ascii?Q?bU20TScInZPrMFfsHD9OxbajIOy77Aw5JNRkzM+vfxZJ+k4n6P/B3+l2hpqD?=
 =?us-ascii?Q?e8OG3voDNbraHfeL3/yzSoViN5b/sFanHRtlvBUoiO+iwDv2zEWteExRD5B1?=
 =?us-ascii?Q?vDAXu2eR6YdYxQv9eCXY6h+nL+hpltAR3p/LsenjrJZiPhyLvAGu6Px3kYPL?=
 =?us-ascii?Q?KgThxeuIap0YXrfYLxbQdyQC4diWBsZqWdwi+1e8JgQUSOaEaF4tUb77LLVM?=
 =?us-ascii?Q?cqYnpJ7P/nyTq+k8BzWZ13K1E1BmKjWzwV0k15YUY+GlZE53BYfXU0cFfjlx?=
 =?us-ascii?Q?vmt1aejXMFa45R2n/hBr97kqaCvWIvtX68V2IquD+lEdEO5NWNnjzkT7aAsB?=
 =?us-ascii?Q?S0w31kUx5vjhcJYOhiGR0kgzpA2un1nKwlwSeUYxJCXOKGMq6DxdcKdzCNdw?=
 =?us-ascii?Q?2aXuOpyAHOsgh/hLv7k5ClAeUkKEHJzF1Sn5L/UNYKtQQMm1WkvYYwufMN8n?=
 =?us-ascii?Q?kuQ194r2KIRX3F6q0RZ4eJ94PpspfqBiZpT3uvg9/JUAeL+/l+TITSyIXrKZ?=
 =?us-ascii?Q?z6LgaKkgYYHX0HmjcGS860szegDDBnb3pwP5b8J3ok4m+2hGMLmaZwuenXH1?=
 =?us-ascii?Q?ih6hEWIkHUeiWVcBvlo72QPD0z+yNgf3rNjK5o1aVVD/azjuEzK754xuZm/y?=
 =?us-ascii?Q?xDHtGks74yL0+tDS+E6FtByg3clwlqqLewrROoSGOeEqqBORuPBDV9rgoVOQ?=
 =?us-ascii?Q?GnyoX0PTvxiAiUCIX78HyR/8pVLCA5yfeQQQCYc0EGY8NiFTnaUmMYRAWs5R?=
 =?us-ascii?Q?BauUAtv48jrkMN6WYkgwNjPGumVVnE0Cj7CASY3CqeKsAAAPZC2XkKSRmY7I?=
 =?us-ascii?Q?/n4SmfujCtEKv4sIuO+XLXlM?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: a36429c2-a7f8-4073-9c10-08d8e7bb61bd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 14:05:26.0480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41WWUumeUnv1f6VRbdizxY5Y7Cn7EWk2BUToknlX392MXPvObXmIbovju+2YculD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3933
Received-SPF: pass client-ip=40.107.92.96; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
Cc: darren.kenny@oracle.com, Paolo Bonzini <pbonzini@redhat.com>,
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the sparse-mem device, we want the fuzzer to populate entire DMA
reads from sparse-mem, rather than hooking into the individual MMIO
memory_region_dispatch_read operations. Otherwise, the fuzzer will treat
each sequential read separately (and populate it with a separate
pattern). Work around this by rearranging some DMA hooks. Since the
fuzzer has it's own logic to skip accidentally writing to MMIO regions,
we can call the DMA cb, outside the flatview_translate loop.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 softmmu/memory.c  | 1 -
 softmmu/physmem.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9db47b7db6..c4730ec47a 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1440,7 +1440,6 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
     unsigned size = memop_size(op);
     MemTxResult r;
 
-    fuzz_dma_read_cb(addr, size, mr);
     if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
         *pval = unassigned_mem_read(mr, addr, size);
         return MEMTX_DECODE_ERROR;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 7e8b0fab89..6a58c86750 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2831,6 +2831,7 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
     bool release_lock = false;
     uint8_t *buf = ptr;
 
+    fuzz_dma_read_cb(addr, len, mr);
     for (;;) {
         if (!memory_access_is_direct(mr, false)) {
             /* I/O case */
@@ -2841,7 +2842,6 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
             stn_he_p(buf, l, val);
         } else {
             /* RAM case */
-            fuzz_dma_read_cb(addr, len, mr);
             ram_ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
             memcpy(buf, ram_ptr, l);
         }
-- 
2.27.0



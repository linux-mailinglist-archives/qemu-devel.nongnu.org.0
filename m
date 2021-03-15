Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D399C33C630
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:54:19 +0100 (CET)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsM6-0000EC-SD
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs77-0004I9-6r
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:49 -0400
Received: from mail-eopbgr750120.outbound.protection.outlook.com
 ([40.107.75.120]:38565 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs74-0006Ga-Ff
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1M8K01711RCzfCDTuu90bcJYI+D5QGYSecYdH/LXCn5Y9y9eT2roLCT9i5VbnjsW2qQvhyda6SUfziyM/H3dQLQs4SJdBwAwOHnF/1JvafKnACfwNpNlsPMix9QWz+53MU8DrBqmbaNZdlU7EhwAujXwr/LfZZ3/gt0QWN4HHyCDjfOy6e72c/Yv8RQ2YSLoVUyk2dhPSSc4kRNy3RQGiGjxv59pd9LpDpXSyGXN889cP3mj1a/3ZPRnk/NBi6bxjFKKgzvJikzT9NBchqJa1biRH2c1wiG1gFkmoRDJdJ8swlFvq5pCKXpxB+p+mATW+09vRLGG8K7JXLk+clwkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYHZtxpSNFquuXOzvRuEz4wowKc/Ih3cfnC06+iIw6w=;
 b=SLaUy2X85MiB7Cc3EFHrDy2pD1CQ+XV0bUIsAWE2rJZo4CDojA9zLJYDyVTahHP5siL6rqm1chSDDvRQEyDb8zKebZ+F/fEVGvJ0Z0q1ItiucAKVNX17bhL3RYU3hCNc+gO4xDfTvJZ9NToEnouS6NkeFQMkNJ79EkElgLzEG6I+GCjJFwqz5+ub7RhzwrS00LxjVQGwXFwMG5QgVSTFvK0MRdsRf1Nwb10/7QEBrgd506K2L3csjT6f7qPHMv2yWNdilATuohe6L4rl7m8IOOC4nnw550XgYV6T0zGJg4aD3DTYAmnBniVnNYuiDLy0jkdbreKdBkfV6mlsZae56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYHZtxpSNFquuXOzvRuEz4wowKc/Ih3cfnC06+iIw6w=;
 b=RbW3MwLmFVw/XIjxQkMqfuw88dBG7Gy9bHj9FTsCVVz8PSb+Cq9RYSd6P8O9hCNxcIMvYfGutKdhht+Jf7fWCd/ycRw1gJhus9x/Wmlsie91zqV8ydG79VQ3qXaGDK9kzA8sC9GyLRpjMlXR+ZauzsGK8taW5SLYCL28aKgaWgE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 18:38:32 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 18:38:32 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/11] fuzz: move some DMA hooks
Date: Mon, 15 Mar 2021 14:38:12 -0400
Message-Id: <20210315183812.27760-12-alxndr@bu.edu>
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
 Transport; Mon, 15 Mar 2021 18:38:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 393a48f2-8733-453e-cf39-08d8e7e188fb
X-MS-TrafficTypeDiagnostic: SA2PR03MB5724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB57247F51FE5EB9F4A377A416BA6C9@SA2PR03MB5724.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bcs85pLYmfCYyze56s/HKRZXuScfyI7wBLMU7uoOGdFMsu1vrayT+U+rtkPit3wI/Y1ZKukgPwbJa6AC013yv9rHBfVP1jYaEp8rMErcVZwt5yEuhYtkNsWQFWirc0pZz6GrM79YtvoB0Nkzf28sYCV4XMq413CsV3RzY3VIlbH9hZicCa9VdJ4vYFcbm2Jn5QIhK8+1jEJCK5LgDjscIQcaTe2MFsyDShcPUITs+lavzg6XFoB9y7fB6LUsJCDLbN+JZI9YJ/X2hF8FcjqBunm2spU7AKbH4T9KhNxCBAcorT3LIYqq8uLkQzQ+7DMTI9xsvFSbaHuC0aRRW1M3dIlFSoXlX3BPpJUAmB0PlzTDwt0Z+3ho994TSr1WW/TYu4LGBmAK96/gpj1EX5jRiAAO7FwIJngPOrFAtsiMZGXfN0ec5x806hE+t4fHGfk9X/u+4KRNejjYQkbzdvFbFqapIh2xXfXIpH05J7VYbsZNqra28YXo+JovNUnWEX6wLFIuG0+XyezQNOcZL3SLiIozCbWezIKd2jp/EJAbcAx0Lrsm+M55kz8DX/LwRLbw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(4326008)(7696005)(36756003)(52116002)(83380400001)(6916009)(6666004)(6486002)(86362001)(8936002)(66556008)(956004)(2616005)(54906003)(786003)(2906002)(16526019)(186003)(5660300002)(8676002)(75432002)(26005)(66476007)(478600001)(316002)(1076003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?O97H7Q123IKFTatEG+HGc9+A42Asn1YatjijypfgUu8UgH/PoBohFjQr8mt0?=
 =?us-ascii?Q?RmxmUKdG5Yv2LinQinzSRcgjG1rUizsu4P3E4UDqodNNOaGGzUn2hKCMA7Ao?=
 =?us-ascii?Q?bFq+3bomuL4nNwdjxJFct2gaKE4x2XhA0od6acNZFWklGCCauenRPy/U83ga?=
 =?us-ascii?Q?VRBqW/OV0uOKY8swjn5KdYRXnQnmtUEydWFzC5RW4gVhBqdycm64Pz3Sl91A?=
 =?us-ascii?Q?cr+EQAg7787r8GJNN4SbE11g7SjGi5Lr6OWSFo32UNhZ6fSNbMOSyTk3Twqt?=
 =?us-ascii?Q?Dj0x70+z2085TTEASsVmBtVnWOCBPVT230NsroPtB5Zl8WN+FcCFgAshzP8v?=
 =?us-ascii?Q?tvEFsuaad9kR3V7KD7cMlLF4Ac4GbsBhMXs6OfvPdnPMfzrxt5YVBuX1C0lI?=
 =?us-ascii?Q?SIZ9lodIVdgiafXI1WrFQVrpDT9oY33m6NDpf8pWIKWxpe0IbRFS+n8/+v8J?=
 =?us-ascii?Q?TH9UfEmjAjljSGzQq4kDqVUgQ3RJC+mKVPwFNzd6+9tUj/h6m6UDLssJbTL1?=
 =?us-ascii?Q?TsPG8wPHxlnRGVISf8laP3zvtj7yLwfX3TZlTTx9+tm3idDGySvIG2ubh8ft?=
 =?us-ascii?Q?e4sEk3rOeGxf5A2s43WGyMA54OmZkBXNuVUWOnNPPSkoOhKG+YKSifzR5WJ+?=
 =?us-ascii?Q?wqeDSxfffBjaQka84WMlSynA+Z5VVgs8v9wpyEltVpO+5n1Ew03nJSddoGEB?=
 =?us-ascii?Q?RHku/Q1ThfBiJ1dgZzej/WHo0dfCzj6VJv7EsxmRNIQj/Cj9lEQrDamO8w3w?=
 =?us-ascii?Q?rD/JEwmPtVBL2K/uwpPAolhBA83znKeJbdjNxCVwrX5ax8k9C2DFhB6OXbzF?=
 =?us-ascii?Q?QGZXyFuEMw3FMiO336GqavCy14qFL7JCpC2G96+Kk4PEy4b3agtkoBzYfq3G?=
 =?us-ascii?Q?gl+8Dw+HrLXcysTsT7SWKDlabkRgsJDPDKW1ykfo3Shohf80Ckz2EsfBoM8v?=
 =?us-ascii?Q?voVfk7CHnqLdy7xPKBp2+6IeFl0YvOBux2bo6t+6DvhzeAt0LmNbFzCijxrQ?=
 =?us-ascii?Q?9oM9CXkVhS5v7576GFtrR34AYvvmJPJrKITp7I+2nCgTxelEouUb5G8+sW+l?=
 =?us-ascii?Q?AuSKGH2t0pKZNixDWtnhnLtu782/celOKa0C0qEFTjHwHSSggyiEINQlIX2r?=
 =?us-ascii?Q?oizuQQwhm+HiWVlaiHbupoBtVcSMb2K9rcdmyEM+uVAySaU4sY/uCzmFExAU?=
 =?us-ascii?Q?hUeMQlJ1cFKSpbXAAigiMv2swJtdiCri8b9dHArglhEZrphxA3+pCLzvRmaG?=
 =?us-ascii?Q?rteKlhapB1eSywirZQKzguxPXX9fwcXLNxl/Nj3jJS+O7Jl8jqlCUvUGvDh3?=
 =?us-ascii?Q?OZ9l4305ioCoAXR9C4Rd+9ac?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 393a48f2-8733-453e-cf39-08d8e7e188fb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 18:38:32.5996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1b2vcmCcRhUvEID4N0TQq93enxBNSYVYwOnOyZ96jVaUwOuh9/wm275oAdal/0B
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



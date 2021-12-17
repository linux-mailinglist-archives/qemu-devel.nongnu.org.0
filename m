Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330D7478E36
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:46:11 +0100 (CET)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEUk-0005HE-Rd
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:46:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1myENF-00057i-0E
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:38:17 -0500
Received: from mail-bn8nam12on2102.outbound.protection.outlook.com
 ([40.107.237.102]:4416 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1myEND-00070Q-IS
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:38:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBA3cYJgSUaPMjmo1dExpr/iWQ+kh3yvkHTqOBw950/CBByegh1/9uaqZ79herdPVtCIeTNTmSt2aegWX9uH9KKFNeTDt+jDcT9a/l48DtTw4yH08FdoSdMpnyl2aUDxDVkqIemNr3N8AHT5Qu/H5du3+iI919E53zfwxq+QOorXvFWt0Tgwh7VxJEaQxG4ShbypULAKOhsyyNIPmGzL4sntN8fiTNWxK4J66xpMjPfxIIG13Z3ZulGFXH43KPu3KWX8nSbgNdKuYX4hXUmv0Klks/dgfVF8y1/l8FPJQHWc2iP6q/v6naYdIL+q8Fm7RMAIiLmQA+5xdmv4ijfKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gGQtTwKRs0Pk/eQkuN6jZAyWmVTI28ZodPNXuRkuRs=;
 b=LKTU3E0RFcqqc4x3xk4TNrKhuwN7nWXBDsZ5LpHGWjA4KVmK+JHs5SYwNk+59XVxZbUR02Oxc4J/HnwE/NKykf31oYog+on+bp77QafX2Rz7xDt6DDXX7KjIkJR4bZ0h+wZxYiqOtHZA3wuKzwtkF8S6R/1hdX4VKmI0e+IidtQxCGFxQ0a0inVQGRoCQWbSiVCXr9RTCsODPuOHLt0oor9kG0By8FsAvi9o+lSiJsFo4iBUhL/U60CCdnANGdTWw6QZFoRJjIgxftu1aQGP2G92I1dYpt/tTZ9cs9sjdmbPvBiecPb1aNoHvaonrHrP1+eboG3py0jKlCvw8wCc+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gGQtTwKRs0Pk/eQkuN6jZAyWmVTI28ZodPNXuRkuRs=;
 b=bdrIghfpvAXadk9XYtud0YvfsbQpH3o3UHA4otR54fMxRaAWvz+0kGf0NeuUApYFTl/86fwN8V3K6HXjgSRNZ+rVvgyVK5T5qSBjfdtiR+nZngQSm5OJc3sDW8ORzA3Y7GKtb+iNveEl6YfXD3990WRdV8s7+VtPF4wZSw5HzQ9lEv+gUx6PXaw9pexDluufh7MpsP6Oz4KqwiZbdTCUce8FtSJWCfJHjuCQ7bshsUUaz46Nf7jbn/nRRAdUsl3Y7k/29pNO18jnc4ZPp16F0Va2eJUJd1GnT5qAj1/Zt7H/9Jzr0Zjx03c0x495hyigCLuPt2X+Jr+HQReO4qSdgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Fri, 17 Dec
 2021 14:38:06 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::6cf1:fa6a:fb65:131]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::6cf1:fa6a:fb65:131%3]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 14:38:06 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/2] memory: set engaged_in_io when a device calls DMA
 APIs
Date: Fri, 17 Dec 2021 09:37:50 -0500
Message-Id: <20211217143750.50641-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211217143750.50641-1-alxndr@bu.edu>
References: <20211217143750.50641-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0305.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::10) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 393a62ed-84cf-4f67-2790-08d9c16ad652
X-MS-TrafficTypeDiagnostic: SA2PR03MB5724:EE_
X-Microsoft-Antispam-PRVS: <SA2PR03MB57241FF08ACC166B42892C83BA789@SA2PR03MB5724.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g2RWmLHh+XBzWjeivZlk4Eh4XUKkPNAG5IzlaryOekn4LMjYROB2Kv+IPX1hBbC1w/CmaJoVMZNoYjoFICS5cR6lI24XHbF+AwwZr1OMeFfZf+HgYnH+9vt1Wgq6n8tEa7z26kEi3iYJs1fNdFbfibUGQnQYXjkcmp04hMyNO8uk4nWIm3qtUgVZs1q2Y+170UlE1YzTDz+1rkdMTpldH1QVCJHklYXFxzLV9nk0B9XOQV7kPjN4is1Syq2IVexkqt9GnFPZ5AMCGHHQ4aQ9ae6rolVTb1FwV5B3j3RiJktpkNsegWkLNdmxdkXNRrrBbwhw8KRxPXmoOMdnPgFJEmPmyw6QfFqd9A0fLdc1mm8Xlafqj+9kkjnRjtxgV03eQvRYXvK9tQV8snmvBD/hvxLf5Qe/kP0a3HQvbBqxbn1eyoVCpCmFyf/+cGkCv8pvSNJ+AeqWy4CENhcbESRhMrtTdsSSRacC0S8GuwGpfuSXqUZtwFXGeP7SOeFnyxtyo33TGYELVkYBhsiZAenYo7qj5abt4DBd7rSPw5zve/X9zr8+Bq5kWZqhYIluYrL+Fi9WodCByOYTflurf/pkgm7UPZnzWwU5XCDq61QS0ismpx0fsP13hT8lXZxfPZMtij8lJPNXdVqaT5IGCPl+LCsmG5/WDGyTJvgTHVFwt2/4k+rTetaSE9klFogqgjyx7AzLPleDD9MqFF7/fs9WNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(66476007)(1076003)(4326008)(316002)(6512007)(36756003)(786003)(54906003)(66556008)(26005)(5660300002)(66946007)(75432002)(83380400001)(8936002)(508600001)(38350700002)(38100700002)(86362001)(52116002)(186003)(6916009)(6486002)(2616005)(6506007)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yfh42bGEz3zeRG95v+FroagNDLxAOQ2A15y5+TBq38k/x5e4LCtEt760Jmwm?=
 =?us-ascii?Q?Mkt8gfWlZ/VzrYuTAGRE49RKKa3aCGWpq3VvTZb2n6RZHXrgUY+tKdU7hCLZ?=
 =?us-ascii?Q?geWD9+eTa1lq9Y1cU1im4vi7FOgpwUb7pPvTfwXXLbV7dmA5C0inqe7BZJ+b?=
 =?us-ascii?Q?+vNCt726bFl/DyM3AXjeXnpZpCzJGVoVeii4CZKbPLFE4RpqXospoH998fuv?=
 =?us-ascii?Q?u06FuHa3UaDDWG3XGDaj2ACAiqIBRhkEpJ1Lljp9+3jrw7QbpfQAmsWhgbos?=
 =?us-ascii?Q?bCE8o0fNcRuaVeZSXafbqN+ZpcxghsjmPhGIq8musfxvERuYRarUGqY40AwA?=
 =?us-ascii?Q?luFgT1+fQ4e6DucKBmIX0BSZqsqQhj678QkEajQS7UMnGNv1ZkVhuIbB1YYN?=
 =?us-ascii?Q?AS2JwHwmpUWGs6PMZLBTH0Ev/cqGJWA+des1zKcg4815El7YivWcst6FCyCA?=
 =?us-ascii?Q?V5rdm2+TxW9Pvsj7Iqckt7YdBcP4YYyxyqmHJQBygHb3htzRdry4llyNlEEB?=
 =?us-ascii?Q?0nlDqFY/io/bX5BL5fr1hIU5MFLpJN6Ug21YuK3+P/+eOxFvWgOEn46J2/zC?=
 =?us-ascii?Q?B7YxCxNZmOl8vZ0CCC0fbXOmpriMcK7/jpK4fJkt4ZvLMBwPFk1kDH7tHQ81?=
 =?us-ascii?Q?UWDcxVRuFPSg3AqH1vBk07FBRMOkkGlbk3m+WTXq+8CRatzQl9dYMal/ELsb?=
 =?us-ascii?Q?jYzo7RfnMchCzuwjmouPWh4CPvtbRcJfOaCLGoGnUjznI3qVmeNa6iob/fpE?=
 =?us-ascii?Q?T9nnID56CkdTYTXZS8WuLPcTT7R6zDFaCiOixOuZjzABMFWHmPiXQzEYWTuo?=
 =?us-ascii?Q?9yr9aoNKPSs02ZC6KX5IBn4LgWAU5swjMKtWDLuwS5qnioY8JYKc2iI+KQpk?=
 =?us-ascii?Q?tYNXhgi779UxfPb9Q7PxvMOj5Fa57Lgn6qNfOwNyuTiq4frlByeChdZY6qqJ?=
 =?us-ascii?Q?GiOIKU+Fb/b/SWZJhoK8h692vz9IZ/RouC2z858xpnn5kpLzl9HaFScbuivI?=
 =?us-ascii?Q?I+Wv1JirgKjyb2vtEwkj1qJgXrMHDRTa+gMPLINaA45dQ5k0edxTFMyYhqQY?=
 =?us-ascii?Q?aQkKs7kDWOs6obZ3KZ3yJghU8mpdKS9bRmQVUnXFcKEIw/cjpKxvY2BO/pse?=
 =?us-ascii?Q?ti6297y7DrKKVp2W60ddbpbRLyf4WuXZ9o0TdfYJlywxZN+w+nFdmuo/KhkJ?=
 =?us-ascii?Q?tNVOI3KqQmn9zY87h2jPf6201hYQfFyyouJXeg9z5SscR+5kP6p/SUol8zPa?=
 =?us-ascii?Q?PUsJWDI6rmYy80LlYvxDOEWtgmEXUD4VHKzW5RkGNXuAleIQDaUlggnLENKt?=
 =?us-ascii?Q?skovdmq24k1U0S2HaID62VaDRlFkyBIdU06O78MY8Kn2D4sNleqOXIF4UmIH?=
 =?us-ascii?Q?CPxPWfuQIwvO4XfJM97C8967xVro7Kl611mNq5i2rbJuLqsf8kVNKo3xUqmp?=
 =?us-ascii?Q?enHUdmiGhgfH4djwmeDiEcR1c6OBkbEcbVcrYamNC6qvwGV/ZzNRKODBpo1d?=
 =?us-ascii?Q?vB1ltuZyUS8o8N/F3ME+T4ImEVaiwm7gKEeTf/5e2UYQVGiUX8Vi21NZOm43?=
 =?us-ascii?Q?smYYW7kpkPaWAJjQwA0=3D?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 393a62ed-84cf-4f67-2790-08d9c16ad652
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 14:38:05.9166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyWz/op4zUgL9Zcp+iOB/kiC+8zL2qcEm2sNtVp+07K/DfyQfKMdD2mhWBb7mx9x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5724
Received-SPF: pass client-ip=40.107.237.102; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DMA reentrancy problems can occur in BHs:
dev_mmio->schedule_bh
dev_bh->dma_write->dev_mmio

This patch attempts to address this scenario by marking the device as
engaged_in_io, when it calls into PCI and SGList DMA APIs.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/hw/pci/pci.h  | 6 +++++-
 softmmu/dma-helpers.c | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index e7cdf2d5ec..8420984b23 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -808,7 +808,11 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                                      void *buf, dma_addr_t len,
                                      DMADirection dir)
 {
-    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
+    MemTxResult result;
+    dev->qdev.engaged_in_io = true;
+    result = dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
+    dev->qdev.engaged_in_io = false;
+    return result;
 }
 
 /**
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7d766a5e89..dd27ba4def 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -303,6 +303,7 @@ static uint64_t dma_buf_rw(uint8_t *ptr, int32_t len, QEMUSGList *sg,
     resid = sg->size;
     sg_cur_index = 0;
     len = MIN(len, resid);
+    sg->dev->engaged_in_io = true;
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
@@ -311,6 +312,7 @@ static uint64_t dma_buf_rw(uint8_t *ptr, int32_t len, QEMUSGList *sg,
         len -= xfer;
         resid -= xfer;
     }
+    sg->dev->engaged_in_io = true;
 
     return resid;
 }
-- 
2.33.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6833C637
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:57:22 +0100 (CET)
Received: from localhost ([::1]:35518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsP3-0004Lv-QN
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs75-0004G0-Ku
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:47 -0400
Received: from mail-eopbgr680136.outbound.protection.outlook.com
 ([40.107.68.136]:62341 helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs72-0006K9-9i
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nuwnm0Vizja6yqwRn1XVPUGrbDecGteewC4BLg8XtM0syaUOeKKuIbYUZsyzztoZJNGiWV74rfEvpMLt3Re07YzqOWgYtMFoEPl2eTu5XGpG8Z8M9z1B7K4gfbbNdsZT2ss1IC5eaK45SB8kC7dnecyTYdcHwSglBcocTuJdJCmKaNQx/jJng+4AdB0GmM5nZ9JLzYYFBSyw5gAVVGrLmn5hdGrqGerNe//kKgEZo3e4snlqGP/3pfoZwNpeaGhflg2as0UFA9AI3r+Vn0f/VuVjB2EOA9Nto4Hr2AxfIgoT/cHYMuoEWzuAGHlPCRQFbIbAoT80uRW3Myb8xqcu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orZafLuq7RSkMnEkMqSulf6waa37eIK9fwxVKQoTwrk=;
 b=CSuBVnyybSQQ+AwnQh8Nxcz9Y6cpQfELtu+qEWq8+JK0AA1sJo7QtuAAfJwUpOJbxt8Wu85Ri/w1xub4pkt53I9DD+MCji5rXlgAjGPZfEQ7MuKS6y43U/SpenP+VRkpUahj2jdGUoCuLszQcqC3Q/dNAYTAzaIN2yGO5GrSZiVoZkLQ+ftZxb7KU4xp+ZqpgZy/OXrVsv+rLOLKsD9QttmdqzKKvbIOwYpT7jNjKWZmNlQhlekieAHpa8e5IFK6Uw/yoTyzGdvxN3EtYza2urEqP+JBJ6R8TX6I2WqI60RQI72sg+Zj5uzKEL39bA0zJS9aHaySaNorvzaPpYXgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orZafLuq7RSkMnEkMqSulf6waa37eIK9fwxVKQoTwrk=;
 b=u6E6MiXiTXDEuy9oyy7EXfepKl1lxtiFAkN4Sy1+120eoSjBFZQ9iAMkgDTBe3A/6GtJ4jR2GvE22L7r1JWM9c8YSivigPMj1zbkOlvnqV9mcOZga0B4QmQ1nmV/A0pj7R3joiAjbQqCawSZdxOK527KBPUJD6NYWTV/KgOrbWs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 18:38:31 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 18:38:31 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] fuzz: configure a sparse-mem device, by default
Date: Mon, 15 Mar 2021 14:38:11 -0400
Message-Id: <20210315183812.27760-11-alxndr@bu.edu>
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
 Transport; Mon, 15 Mar 2021 18:38:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69c1f44f-ac24-4010-e681-08d8e7e18865
X-MS-TrafficTypeDiagnostic: SA2PR03MB5724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5724CE42433CA40141D9C086BA6C9@SA2PR03MB5724.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y+EUrKy07QEmwEsu4J65tvzaopmnZ66LPtMYTUmOkrf3nMmzA/IZUbYoppSvGXeykKI86VcMxZPf5xI4CTYoZ1ZteLgBdsR5pOh4E4ZKfYbG+TizU263krSfDSHkJJ2EeLoZ0D5g8TgMWzZ48kUWVKtkToNwK8PpOsvsUHwbpFhW1laTiWmIz/l+U25gk7tWiIgwYBQFBETTWeO7vgylMWxRr73MWWc7fCAiTJLCNeR/uP9nxaYnVX0AmtZnqJB0Dya52mAfRc1GgizFu6JGKPSdxESx/HCuUpfAHYymNoMATYRjV6Sldr9eAgreZEok9WQjeB5ivDT8wHQTRfCRvTja7/rjRGXY7zFz8w5OPXRp9fQhOKjBtnTld61lEvhgDuiUNcLYOZ7Kz9FD3q/EUMfEUQ/5h8sSyjzca6OwEzEm72pnF+b/GkhKs4l0EMbxNj75w532QzMoPkLpP/Z7qq5pqULqBqgU3bJ9OMJnzEuf/CRwiIWkac/DApjCF6mAiHQf9xq/qEc7sU8osxsnlGwEol8J1WtlnTe+KJBbVTtrdhR1M3SFStXI+UMiRu+Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(4326008)(7696005)(36756003)(52116002)(83380400001)(6916009)(6666004)(6486002)(86362001)(8936002)(66556008)(956004)(2616005)(54906003)(786003)(2906002)(16526019)(186003)(5660300002)(8676002)(75432002)(26005)(66476007)(478600001)(316002)(1076003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KD47dncCs7M43SEnVZnjhm4PANTqZUtGnQU8qSSzpoxnYlRZEjZ/9cJFqncs?=
 =?us-ascii?Q?5sxotsU2oJ1Gy87nfGkXgKdoD1Ji/s1Ybd+JHhaplMxC8WT69I82JQMbwE9B?=
 =?us-ascii?Q?TTnGC/I6vWPCW6tTj1isBzHBypNggdeBaudbBs6bOP35kbFTcYhdm3KsGkoP?=
 =?us-ascii?Q?JcWqsotSSYNsuapYvLV6xLEYRwfYcemWc+KtoIRCFLl8vIp9RlWCKDcNAGSl?=
 =?us-ascii?Q?NSDkXaRsfqxOdTzCF5aervgLhM/Sh1X0273oZQbc/GgmAEWRw3n2uRAun9+T?=
 =?us-ascii?Q?kLVuk95E7hYZJ+/mNB7zcgD5OJZKCkHQVMHwFqjLm6iFEA2WGMPiiUYAh2jY?=
 =?us-ascii?Q?Lz0iDWPpErX0XhTniGOZUJYEsA4ea5UGPRYjbYoEa9c2EAzml59B4JJpwkkp?=
 =?us-ascii?Q?gBIDxP0lvplQwtplCOsujbhlPGQ/HFEpAFZXUHrbk2FlrATKFr4QyqFiLDfG?=
 =?us-ascii?Q?0kbdGw2e3fTh7YUAH8BvQljiRqiVW+AsTDKUNNb/eQUO+fPaieBa42JZsj/Z?=
 =?us-ascii?Q?fxsiEb2ksgoylb8GrNQJYUtOXiZiNqAdVcdU/522+TUXjRtfLQRG60OmglL3?=
 =?us-ascii?Q?WL+fNOLSYPPCxsAWHZUbDlFiJ0ws4h9sUM5vZOb1meVQ35Zqu6WmsT9B8hWY?=
 =?us-ascii?Q?rB4wM+tenotAb2P0MuiOIQWNxSb06aRPgwzuVSnUEkxuWpzjpF7Hz1DhrFqR?=
 =?us-ascii?Q?EH6eCodQsivx/PHJxh2eaaKZB2r2PkqHo1FEftACfxRMQFrDFGTzrschLBGc?=
 =?us-ascii?Q?O2AQ8t2xMOhMA65yLEzdfpBXYRw+Hwdtr4pw/+sQOW24uLpqWdqMdbpLZZy4?=
 =?us-ascii?Q?8D9KBCBUGTrJonIXKmo6t7ssUhcgEbjPY3XAocFa20vPjJZBsESZzc8LFH7H?=
 =?us-ascii?Q?CzsEhl8eKrnA6K3gRPX4LlXnWonDllJABJ4HLuSYToc877ScWUjqi2gsbxoM?=
 =?us-ascii?Q?a6pmwCMx1Akmhl0HpQW2QPJLtFCXzSZxvaHbTlU8wFYo1F/a1USHW2OXTDdX?=
 =?us-ascii?Q?Yt7RSkinhXwh4yEwRylw8u2DhQMKg3wZSpsseGfPtNjiczUFD5w9ZTzFGA0A?=
 =?us-ascii?Q?XhGtAcrnBS4ydI/m+IJE+/arYC2SdUZGn/1ToazZGdQuyHnOMYP8lxnfGlpU?=
 =?us-ascii?Q?bYBnVdzDetw76Mk7Y22cV6X6J9Y6xVf5552bVs+EQMF8glNNLlRwaDL3BtPX?=
 =?us-ascii?Q?lQz879YfEqQ2RX5uazftuymVbd5pAm2xF0m6R4/ldEHeSsY6SfrfnLedMJHO?=
 =?us-ascii?Q?2KuYcmmXK/Flem1ZN0Qb5sPlFpNcvDGWi74pj0qby8rzsJ1EwYLeNZrwgEPP?=
 =?us-ascii?Q?FzA7rPWWCy56Xic66hn7Ez7O?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c1f44f-ac24-4010-e681-08d8e7e18865
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 18:38:31.7341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9nhCiB0slsnxrr1AjillmwTNOb2IF0sF0n8offqt7CccNP9HCpp/VORODzeDtjI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5724
Received-SPF: pass client-ip=40.107.68.136; envelope-from=alxndr@bu.edu;
 helo=NAM04-BN3-obe.outbound.protection.outlook.com
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

The generic-fuzzer often provides randomized DMA addresses to
virtual-devices. For a 64-bit address-space, the chance of these
randomized addresses coinciding with RAM regions, is fairly small. Even
though the fuzzer's instrumentation eventually finds valid addresses,
this can take some-time, and slows-down fuzzing progress (especially,
when multiple DMA buffers are involved). To work around this, create
"fake" sparse-memory that spans all of the 64-bit address-space. Adjust
the DMA call-back to populate this sparse memory, correspondingly

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 387ae2020a..b5fe27aae1 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -28,6 +28,7 @@
 #include "hw/pci/pci.h"
 #include "hw/boards.h"
 #include "generic_fuzz_configs.h"
+#include "hw/mem/sparse-mem.h"
 
 /*
  * SEPARATOR is used to separate "operations" in the fuzz input
@@ -64,6 +65,8 @@ static useconds_t timeout = DEFAULT_TIMEOUT_US;
 
 static bool qtest_log_enabled;
 
+MemoryRegion *sparse_mem_mr;
+
 /*
  * A pattern used to populate a DMA region or perform a memwrite. This is
  * useful for e.g. populating tables of unique addresses.
@@ -191,8 +194,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
      */
     if (dma_patterns->len == 0
         || len == 0
-        || mr != current_machine->ram
-        || addr > current_machine->ram_size) {
+        || (mr != current_machine->ram && mr != sparse_mem_mr)) {
         return;
     }
 
@@ -238,7 +240,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
                                       MEMTXATTRS_UNSPECIFIED);
 
         if (!(memory_region_is_ram(mr1) ||
-              memory_region_is_romd(mr1))) {
+              memory_region_is_romd(mr1)) && mr1 != sparse_mem_mr) {
             l = memory_access_size(mr1, l, addr1);
         } else {
             /* ROM/RAM case */
@@ -814,6 +816,12 @@ static void generic_pre_fuzz(QTestState *s)
     }
     qts_global = s;
 
+    /*
+     * Create a special device that we can use to back DMA buffers at very
+     * high memory addresses
+     */
+    sparse_mem_mr = sparse_mem_init(0, UINT64_MAX);
+
     dma_regions = g_array_new(false, false, sizeof(address_range));
     dma_patterns = g_array_new(false, false, sizeof(pattern));
 
-- 
2.27.0



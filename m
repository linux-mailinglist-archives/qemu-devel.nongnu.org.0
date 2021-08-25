Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42113F7633
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:44:00 +0200 (CEST)
Received: from localhost ([::1]:34356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItCB-0007bh-VH
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItB6-0005cq-97
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:52 -0400
Received: from mail-bn8nam11on2096.outbound.protection.outlook.com
 ([40.107.236.96]:64735 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItB4-0000MJ-LB
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coq4Lso8cmjN4hNFsvkKU9OewjhLSQnRQfBLcRMnLDjWunBVckEn2+uLB9gZL3v7aSjvhTpD36G0DlcO1s6RQ3IP2/pCyYinj1TNuGfGgHKypYRKgXAxlFac4kOabJrQA17JFIcakzKBg0MsDc5SL4mD98qn5zCACX/2KnAY+owH6xNyu/p3oZSOVC+hk8/IS3yNZMJnsLhJxFoQJabFX3bx3xT250BhXV15Cjens5Qs5g/tvFdAIhHbCs8p3uW4SUYthK0l+RkkNAmwmXFRcUkPzwtBOACBuxmvGyceZrQPIO7rJdhuT9fB1fXEapXROKIRlwVNCwtTsUHKuylFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS6NVYFeWYkAUe+yX/SnynNsxZaFbZU5FDRzrN2qyKA=;
 b=cgbpD7dciRRAN6aUbXRvGk+0jWTjYI+U/kTIA+QbLeDSBBD5Iplc3k7owmlkV+HA5VM1yRmolNPvNuvNu+g/V55wRQxpB/I7U0Ub0AJjrlWBS2Dyw219q554L7m5iiLUdDQ/rUNLLE4oK1WGKkNkox6WJFDYdTw3y3aXQ/ba4uputcoyXicmFj7iFhc1fQHC3P1NR8UU9eGTtGCZuUWvxMzFwsmJn0Y+GKjJLoBsfa9P2vmOhjPUm5Y54RlUtE5LBgqkxRimrkIlCUSaTlQDKxuqBHJ+RyQZOpnvSsJMIHzKhWUeFtrA/K8hJATbF3spw1G7SVUuAIJuc3rbm1AxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS6NVYFeWYkAUe+yX/SnynNsxZaFbZU5FDRzrN2qyKA=;
 b=HqH5/xWOf/mSo+9BzAESLgmTPMotw1cgrejNbR+Z5xLwSttgHzWqoP/cL4U5rPcttqaWISUxPRb67GwZhy+k23vZQLVDiY2EDUFKehcIZ985ibbOEW1bao43QJYKhiAS90HwUO3vbPZVYxZqDrNe0csalHNrE6wTVJnP9tKNMJA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4446.namprd03.prod.outlook.com (2603:10b6:805:f6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 25 Aug
 2021 13:42:48 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:42:48 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL v2 1/8] fuzz: fix sparse memory access in the DMA callback
Date: Wed, 25 Aug 2021 09:42:25 -0400
Message-Id: <20210825134232.45074-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825134232.45074-1-alxndr@bu.edu>
References: <20210825134232.45074-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 13:42:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3775174-5745-4faf-7099-08d967ce39a4
X-MS-TrafficTypeDiagnostic: SN6PR03MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB44460E12929752AD124FAA0CBAC69@SN6PR03MB4446.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Fr5JfuFU7yYKHeDXBlGLraiPPihCuwurASRPOMnY3KNsbD7/n0uubxO+hD4ah2Nq0GD0r/ZhZvtGkfutIOWaot2kbmXRNOiaFbmERqIHYYLcYx6qMSVQ70gy0c0zTQR02GMk5+p7I7moyf+G9ZrC70IWZv6zbFmdGC+qrh1VJeD2aQzmtJJXRyaq96xo5eYbnHuLiimH02qeroImygrfxZQ8FpHUS8sHCvri0o7KmsQh4La42YOY/bON5my77hwCxLmy3d6ixzbmN5aJXB81qxDRLefNEMcFKvl8LH3xxdveMMq2wqX1AXFSXmHkg3+qQpJqZNzlhZUuxssydAFTfWlrMKaZN0VaNfkasmD4rGEGp9EHLIWzLIY6x9Z/7cWpTOLetCzdANTzQR5MlWF4nzsx01qdawEh5lOxcr3JSuZ7+fSPBKv/3sg276ZOmaM+/8808PfQB6bHZoIVrXWyU5o59K3DyiNV+pqO7vmuZLbYHSbMjefo3ZW9y2DUpyXMv50izUHcpCZ0B0I/x79LGFmyz17qQj28eM0Ty7r09pXeppapiHZCPlopp3aw72OEDG/DsVgiCmN+DuhScCnmVtQrjX+v/l3nqNTjBz5bCNpBVamz6WgDR66q9wNZJGEjo+GWpggT45FK97/XCIvTqj+C3FTYliP/GrXW4u6wgAwLKNHjjhb7csRLXuVOiFAuAhAK6QYoki6kgd1v5ShIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(4326008)(6506007)(86362001)(52116002)(6512007)(6666004)(75432002)(1076003)(2906002)(36756003)(956004)(2616005)(8936002)(38100700002)(316002)(786003)(38350700002)(54906003)(83380400001)(26005)(6486002)(5660300002)(186003)(66946007)(66476007)(66556008)(478600001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWNRT01pL2U5RmdGN1VaMDlCUmpSMXBNcFA1Mnh5c2RtV05XU09LTVFqYldi?=
 =?utf-8?B?TERFWlVrK2kyVEl1THNsWjUxN2VjeG1rbkt2d0tKR05YTGJhL0RCc0sxV0No?=
 =?utf-8?B?UW9xQXFmQ0ZIdmVZNWRsaFRob2trTHF6RFV0eDlCY1ZoZUR0Q2paNDVYdmg4?=
 =?utf-8?B?alRZSkp6YVErbXllanZFTnRVTk03VlRScTB1d0hTdE1hZTU1bkpIUE9OYVpo?=
 =?utf-8?B?UDBTc3I2RlpWWElSOUtSRG9KQ0RKNlFXdDVlTnlGSEx3cFhacW9NZW5QSG1V?=
 =?utf-8?B?bkszdEpkTTFXMktpWGo5alZMcVh4dk1yNWcxSnBiMGp4V3gwalpZbGMwVC8w?=
 =?utf-8?B?Umx6dERod3lqdnVoY3dKamdUdzJMQitNd0lENjJXTGp4cE56a09HUStrTFFq?=
 =?utf-8?B?Vm9XZUNCeVdOeVZIeENTdnQxNzMzZ1kxNlkwNHdIN0hxK3RsOTQyV1ViTGdi?=
 =?utf-8?B?b2VnTTIzSXkrYTltY3Z2RkNMaXpJYklYY2ZnSnVqTG5yV09PeUwzZ3JIQmZp?=
 =?utf-8?B?dytOaVVVaXVybklCZkVIVnNqMHdzUi9VNXVndEpuVlI3a213bEI4ZmNFMzZB?=
 =?utf-8?B?QVVOTlUzTEltQnZxaWtMemFZcXpVbUxRZG5FcmFXVER0OWl0WjlBeDF0RkFk?=
 =?utf-8?B?SldQanhpM01NVmFvbmpiWWMyL3lQVnZuNE9kNDJicGhsMkFRcWtOT09Kendm?=
 =?utf-8?B?MVB0UHRZWnU5QjZOdGU1aGxTY3hLdzMyTlZFR2tCOHl5MDhub0RyUkRFa1ps?=
 =?utf-8?B?OUV2R0lzOVQvcHZWMCt4MkJHUDFrSDdJT1c4bmxpdHZoeHl4Qmhtd2RqT2Rw?=
 =?utf-8?B?RjRLU01nc250RlE2UDQ0dXR1YVZ6ODdqUWg1MFVZVjFpREpVTHZVUncra2lY?=
 =?utf-8?B?ODBaSDloc0JBalcrSDRXalJ5WUo3TDlDb1FMakh4WCtpZGlESE5xNGxIbTAr?=
 =?utf-8?B?Z25POWo4eUpyMFhFcm5iOU9jbjB5bVF1SnFkWWhMVmt4T0VocWxhZWIyYm5x?=
 =?utf-8?B?clRtaVBJd3Vzc2VuR2hzRXFSOU4zQWVlT1lHazZjWGRlV2dES0JQWlVFajZ1?=
 =?utf-8?B?ajZKRFloTUtsVlk3S1Fvb3FpM1dCNTAxcHVHSmkweHpOaHN2ekVsZUFJRThT?=
 =?utf-8?B?VXVjQWt6STNxMllOaHlJdlJYYS8rcE1kM3pTMmdldmt5dC9EVEtLUkV6U2RZ?=
 =?utf-8?B?Y1llM2QyeGNiNzJYcFV1dS9scTQzZGlhWlNadDFPRUgzUzVUK1NDWWFQQ1Fo?=
 =?utf-8?B?QTNGamJrMjBaWDJhd1pwK1pKbG0zSFFTM2JUOWdBZHJVWTBXbHBhcUNIclVt?=
 =?utf-8?B?bWo5LzQ2Z1pncEMrTmV1UW81VDhwV3JLOFp1MVVJeEJEenhienJLand4Qmcr?=
 =?utf-8?B?LytnRlpzUTdjWmM4bXNnTjd1M0VUeUpXelFaSWt3Q1NKZXIzU1I5NVVMVzRi?=
 =?utf-8?B?aGY4UitKYkYyZE4rQUZGTFdwRldLemcvTGVMWWJ5eWhGdVkveVlQeHRpR0Nx?=
 =?utf-8?B?UDdKdE5Odno1eFEzVi9WWVBKWXVJSGsremg2UzZXWlhyWTVnMHdzWGhzWmo3?=
 =?utf-8?B?T1RlY1pCZ1VpQ1VCdklOZGpzeWlYdndSdkd2U1h5WmJmTkVVNEs3bVdpZHRa?=
 =?utf-8?B?MGFQVzBUa0Y4Y1Q0QUhLeHNkWm1YSmlIaWkyUm5IZmhBRTUxL3dWR29mVjY5?=
 =?utf-8?B?d3E1R2d5amVkUGJrYWZpMnVDT0lVeTFJWTFueHo2eS80Nk83a0g1ci9kTVZo?=
 =?utf-8?Q?oy1pGDvWhOxNBpBikOEV0W0K6jFRSUdR4uD0ASa?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: f3775174-5745-4faf-7099-08d967ce39a4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:42:47.8907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5nQKfz8uk56iFlWhUY2PQ+t8j0NPzcQl3vQxqw9DPVDHJFWbx2YoDoey/YNUJWd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4446
Received-SPF: pass client-ip=40.107.236.96; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.89, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code mistakenly relied on address_space_translate to store the
length remaining until the next memory-region. We care about this
because when there is RAM or sparse-memory neighboring on an MMIO
region, we should only write up to the border, to prevent inadvertently
invoking MMIO handlers within the DMA callback.

However address_space_translate_internal only stores the length until
the end of the MemoryRegion if memory_region_is_ram(mr). Otherwise
the *len is left unmodified. This caused some false-positive issues,
where the fuzzer found a way to perform a nested MMIO write through a
DMA callback on an [address, length] that started within sparse memory
and spanned some device MMIO regions.

To fix this, write to sparse memory in small chunks of
memory_access_size (similar to the underlying address_space_write code),
which will prevent accidentally hitting MMIO handlers through large
writes.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 6c67522717..0ea47298b7 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -240,10 +240,17 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
                                       addr, &addr1, &l, true,
                                       MEMTXATTRS_UNSPECIFIED);
 
-        if (!(memory_region_is_ram(mr1) ||
-              memory_region_is_romd(mr1)) && mr1 != sparse_mem_mr) {
+        /*
+         *  If mr1 isn't RAM, address_space_translate doesn't update l. Use
+         *  memory_access_size to identify the number of bytes that it is safe
+         *  to write without accidentally writing to another MemoryRegion.
+         */
+        if (!memory_region_is_ram(mr1)) {
             l = memory_access_size(mr1, l, addr1);
-        } else {
+        }
+        if (memory_region_is_ram(mr1) ||
+            memory_region_is_romd(mr1) ||
+            mr1 == sparse_mem_mr) {
             /* ROM/RAM case */
             if (qtest_log_enabled) {
                 /*
-- 
2.30.2



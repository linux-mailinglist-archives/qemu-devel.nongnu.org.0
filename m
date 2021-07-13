Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C813C72C1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:03:38 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Jwf-00006p-Bt
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3Ju3-0005Xp-Af
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:56 -0400
Received: from mail-dm6nam11on2096.outbound.protection.outlook.com
 ([40.107.223.96]:35521 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3Ju1-0002ks-DY
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyGdF2N0wkUttieAZk2RKvffKEWfCgOzYJBBJ4cAASyTXxt55uMUHVEAafl3w20VpD0j1RDmi5FUgna0b9/6am30sLT2KchQVcHL2rRi2XkNTqhg0fMH4wqJC2vuaaVuSHPkxgvxCTGkb5iyamWQjqQouCOhsbcympZkx7NA0n7hv7eem/xkWVclnyJ7urR3OFFthaE+t8Sgg92MHzbZ/CKZppunsTiS+Hb3YPJ0Pl0RQbjXYTD8jhIbotsuYzKxKATdkD/N9TfxXfXhUMru5jZ5RkB+q9VTamHQvbHeZDxc2DdqBxJG1hDTabOWf6dzeLDwF0qjv/acKD47LJFwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KF9aTRQnvRLf1kNFgJ7H+mEonbE0DzCv3qCtz16lMqc=;
 b=CTPtv0XiKwH94W5kSsI2tiy2A4UZDZtuop9gWBpCH0Okjeg69kZYeKnOwhEtuxWu2n0iTLWH+Hc2D4EoCzl3eiNB5LwN0CxobaX8k7kwKh25ZVxePPsEzs8qIkiQrFHXUuwANjOmQS7icGzVmIDam57W2LwDTazkDdCvzy1FN8DpUmpNJ7OD/RTQmmlN7m6PXNluiged/VJ1l3/PT+LAb3dJ+MzB0AqvrpEVXrhWTBM+uFV3VfxWgw6X2aeOK9K+n9CQJ0yfPO7n4OMeR07EnpIE9k4eV9dD5RU1mIP3CcsPds/DgnV/+0nNh8cthZajJB+2WQl+CCVEeCXSWJuJEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KF9aTRQnvRLf1kNFgJ7H+mEonbE0DzCv3qCtz16lMqc=;
 b=XEBRBZdw2Kyqu+6HWBoqAluu69L57GTnwKg4t5KvzE+IDYEkihiF0JMiKVz4UeH9CAYq8xKpLSEknNKSbUfilUcca+tboPRZhWe4LZusog2g6ksB354xk9Hngx9ynZ02+htBWKf84eSgrDd5sUJAwWkTpmPUS26AlkHan+bkAAo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5722.namprd03.prod.outlook.com (2603:10b6:806:110::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 15:00:48 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 15:00:48 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 1/4] fuzz: fix sparse memory access in the DMA callback
Date: Tue, 13 Jul 2021 11:00:34 -0400
Message-Id: <20210713150037.9297-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713150037.9297-1-alxndr@bu.edu>
References: <20210713150037.9297-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR11CA0002.namprd11.prod.outlook.com
 (2603:10b6:208:23b::7) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR11CA0002.namprd11.prod.outlook.com (2603:10b6:208:23b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 15:00:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb4e1d56-fc06-4766-ce95-08d9460effb2
X-MS-TrafficTypeDiagnostic: SA2PR03MB5722:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB57222750BD7BF247C4FE3B3DBA149@SA2PR03MB5722.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmCfRySCwXuZzdS/umWMbWJHVywNkmccKh772xA/2U9/qfY8eYE7LQgDvpACJI+TjjPQGHMdY37g42IVzOGRKQ1m4NpMKir6M/ivRIvs3i9mx22RFVq2XBVq80M2jO9p7eTygfyq6+3VSrP0RkOZ+KrpdKDIMigy19SJ5xXkxtrGZ32TEFjFJ7SCLU678nG4Hdq2oSF6zMBlfYbgPXU+x1JVIZ+ZWDMA8eqTXSCyWAntAW91YU1cBdY3wiPcFw7mZbpdwuSYpMl1GARvSBN+ZvWiB2nxSVbiXwWISCJrA08dhfUx6twH6my1//RBE85ItsOxs3zRKwSLiAM28nnjqC7dtoddHJd+rul6lixEHI/gaszhb8PXkZR69FslUUeuPyGPTvMbKNzgMXe7Fg+cJneTLmCeHX+Q46eOxV9mPnVxe5O+1aIW95oh7EnJnPgMrQEJ61+EFZrRfXn4VWSW/gtfG1Yo5FrbOZ38k/l+yncWM5+SaIJzAuO275/e2Qh97PTCEDTnibOTClFlv1+aRNpwGDvZPhjrev39I4bGe+LQnGv31z9WOxYYwkV1csJ12JiewE9lZXQ0/RKABgRvcUJybt/8P0EbY88pHbsxlqovzj1pBj88yJgiVGVIIF/BIX6aAuUJmL6ays+WeEOi/Coext2zAzbDVwv1nbM5bHKu/ydVoMPb+gJv07eNbNyPW8mTvicJRTDCYsphaJiXeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(6916009)(2906002)(1076003)(66946007)(186003)(83380400001)(6666004)(52116002)(86362001)(66476007)(75432002)(26005)(8936002)(36756003)(8676002)(478600001)(66556008)(2616005)(5660300002)(4326008)(6486002)(54906003)(6506007)(38100700002)(316002)(38350700002)(956004)(786003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXg5WmkwUE5BQmZTWEQ5aEVnY3o0RWlscldPNHhhTzNEUkJOd0JYU0V3NmhP?=
 =?utf-8?B?a1B0VU5la2ZndFRsUXpoQzhKYkUvUXgxU3NtSytsaWwrTjUwY004c0hRMThQ?=
 =?utf-8?B?TEV2STJ4NmRhdGg3cHdBUi9tMU1mVDF5dVlldjU4YVlpclVCb1FlWXNnUDNO?=
 =?utf-8?B?ejBrcDRFMlNqQzhhV1BkaXZPQTYxaXJyZGZSQjlhb0R1cDFORWVEMjNURFBX?=
 =?utf-8?B?M3dHS1B3c0g5bHg3WUJna3I2RHNwdGI0Y2s4NklTb0M3RnMxS0ozZGYxNVEz?=
 =?utf-8?B?azZSanRmQVQ2MEpqUmdCVXc1bGhETDM1emJPSFkvSTFUK1ppQ1BraHdydzlK?=
 =?utf-8?B?ekNyYkIyMmVpaTYwTk5nd3dUTVFBQnlVdVRZMkxMdy9QTmRQem1HR2krV0hH?=
 =?utf-8?B?eWtlcEdCZFBsVTBvK3hvYWxIN0Q5SXNEak5xUnpHcklVZDZmMzhwSDNjNC84?=
 =?utf-8?B?ai9jM1JXWjMxTlJnSndvbU1EVm9uYytKYnJTTW8wWm5kUHNSQlF2SFJDZjZv?=
 =?utf-8?B?cnJqVnVTZ1g4QmxUL0RpZVRmNWxPV1RlWTYzeURsdVBzbW9sNkRFL2p1cDY5?=
 =?utf-8?B?bXZJclgxdlVCaGxEeGRvRDJMU21mb3d3cmFSZEFHaVVQRUF5TFN5Q21BSzZY?=
 =?utf-8?B?dkROVU8xdnZUNXRZNW9FMXBiMDlQbS9vcnFidjJTUG01VnI1cFlZUSsvZTdC?=
 =?utf-8?B?TXhiZmJ1dkxXWkg2TEs5Wmp3d20zODd0M1JBeERJcHZ2K2RzRTZ0cmFRQ2ND?=
 =?utf-8?B?dHg1eC81YUFQV3d6WUh6a3FXOG9BdTczdUVVSSttZnhHaE5HNTRuZHZ6MjVs?=
 =?utf-8?B?VzdpUjFYZU1heklka1VLOWpOQUk3TVpveFh0RVpKa1RJTlFhVUdpWFZsbFYw?=
 =?utf-8?B?RHRpeVVXd3lvMjZSOVN3a0FVcG9qek5hOEJkcXpjdy9ybGV1b1dFSWkxMXhL?=
 =?utf-8?B?MkJjaDZISHp1Yk1neTUzejFjRzlNcjZRSEtZSkNKLzdTMGpTWkJHa1Rad0tn?=
 =?utf-8?B?ZlZRcHFWRXlqc2c2Rlh1MmMzZFh1WDdXMm5PWXNKMXIzY1RQN051WXExUXZG?=
 =?utf-8?B?VStLbG03Y1JmSWlGWW1aUnVNZTQ2SFBZQmpIMWlZUFVvclI3WkpEbk1Fa2Fj?=
 =?utf-8?B?bm0rTFhpcjB6UExkcklSbURORUgzZkJQSWdiQ2s1SHdlQlpXR0FYYXRqb2tM?=
 =?utf-8?B?K1J4ZDVvZzNzTzluOTY4UlRFNFFqaU9Kam11a0ZmQ1hUdU1kcEQyNCsrenVW?=
 =?utf-8?B?OFozTU5ISUdZVlBoMWxNeFFVRkYvUEVQRDJ1OUxyMnkzaDNBblc4Mk1BMkdm?=
 =?utf-8?B?VGhCSUcvRlVlOEFSMjVmRVlqTmVkNm52LzR0QUh1cHk5RE1uRTV1K09Qb2No?=
 =?utf-8?B?TzVYQ2JOTVY0T3NtdnhHcmU4b2k1NVh5RE5LMDJmdjYwWWJ6TEZLNG4wOWx6?=
 =?utf-8?B?eDFIQmhyeDRvU2xmNjZlTDY0NFRsRGhNazdDWlVNcEZsczc4NFV1a1lFR3VZ?=
 =?utf-8?B?KytYZm8xajE2UW9Tbjh0dE1Gbmt4amlwRVc2WC9WN2FWQ0R0UDZIYUlvVzkx?=
 =?utf-8?B?VDZ6N05iWDRJM2dISElyUWNob3dseG5JMDZSbG1jSzN4NDhYZjdWNkxrZHpD?=
 =?utf-8?B?Vm1VR0p0U3NlR2UvVkVmcng5MzJOYWt6T0FLWmRTNXVFZW0ydU9YdzdqNUZo?=
 =?utf-8?B?OHdDU1dMMTNuLzQxVVFUK2N3SWtYeE8xVExMVmNHaGZ0dHdwb25GbDZOb255?=
 =?utf-8?Q?ns0Jmcvi9tTityJElD2pwgKP28LeLAvr1l0xYO3?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4e1d56-fc06-4766-ce95-08d9460effb2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 15:00:48.6238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyjyO68qivZgcYmhjOPzZiLr5Lujz4qHBolPvMqSkKvcgIMatiaX+Mq0KnyO5Wtb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5722
Received-SPF: pass client-ip=40.107.223.96; envelope-from=alxndr@bu.edu;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
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
2.28.0



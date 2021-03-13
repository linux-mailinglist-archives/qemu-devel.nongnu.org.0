Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45833A1EA
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 00:23:05 +0100 (CET)
Received: from localhost ([::1]:42156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLDb6-0007XM-8G
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 18:23:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLDY5-000674-8Y
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 18:19:57 -0500
Received: from mail-mw2nam10on2091.outbound.protection.outlook.com
 ([40.107.94.91]:5920 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLDY3-0002Tn-UW
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 18:19:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeucYoUUMchb/u6CBGAPsnmttULcsDh19+zCMEcpMYrVdNbWiN6JoHBPyl8hNyJD5FwISu5Af2eURoPoWEnnu2VbXXydLefwrVAx4yiBIPPx9FUciBPfE7FhBJiV5F7qOHYgL1Tr2nev96eDhW067Pa6M/QPMkTjP62Sx8JZoQlmbACBesafXyum7HgedbtyshwpPuXIT+zvKNxd4NQyqwAAtg5V3ZTbqIMu8I4psqBI1QXzxf3l2KmZavq2xAMo/CxkXqKLwCpVo86CrZrx1Ml1fAuauhaZzkxHHVWZnRo8+NGZbDcU723W8fXCmbmQDcp1YbCm0LqqI+3QC6aqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3L0cjYgNt1bZpFJLlf05V2s9m4BLkZYW3OmbWinEg0=;
 b=IsOT4MeFZJE3Drchg9lmdwY8Fw7CY5yiCjRfRi8NaVAF14dvVnbEzE21aU9flSuZvepaNe5XsxTmGbOmrJch1hGDyXaHSdRD1EKByiIpEE12JNZHyWlQ1YTHPmuN+hPsL8GjmIhPIdpD4tRq55bTZ8EBtncI2wif6+8nO7LxAVVJEYB3UVmloIPz2+eOPdWApnB/hShzoxckl36zmQF9A9Ro87Xj8jKA+NLF6rVO3qy09rgGyLkw1bp+1ks1KkFpRzPdlZeoeFm48RhAvuiUPBEEl0hMWNYXUAEROgoP3AtmYe7GpHqYGqPteQ8tM6U50LjuVmhhtVIwL2koeVkcPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3L0cjYgNt1bZpFJLlf05V2s9m4BLkZYW3OmbWinEg0=;
 b=bm4AHdq+9u08JBLdvttQBSxO/MngkTeSMg0ECDrHtXOGrbAkZIhS6ZRQ9DsBIKFFJ2XrbDDd+8hRx/TUyS8GCxKxvs9ApMb+1fJ33GAcR7yU/Icu8ieM/ZWsqqbN9vDoVRvyXkqTXM7VqSFXXpzrQy9041ucpkfsUMi0rnKWrxQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4446.namprd03.prod.outlook.com (2603:10b6:805:f6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 23:19:13 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3912.031; Sat, 13 Mar 2021
 23:19:13 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] fuzz: configure a sparse-mem device, by default
Date: Sat, 13 Mar 2021 18:18:58 -0500
Message-Id: <20210313231859.941263-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210313231859.941263-1-alxndr@bu.edu>
References: <20210313231859.941263-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:208:120::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR10CA0020.namprd10.prod.outlook.com (2603:10b6:208:120::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Sat, 13 Mar 2021 23:19:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cd530bf-c1f7-40ca-a010-08d8e6766a39
X-MS-TrafficTypeDiagnostic: SN6PR03MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB44463F32FE2FDF21046F3328BA6E9@SN6PR03MB4446.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a8ajRHpDkPCyQ8ofanNCQ874YyEqdGKnFT3EjgxC0vR7GAev7wzG0PZJLy7CEZqUiLKZD+v+IWJoA8CmshHaMihl98sK3k3uCeSYl9EsYJ8zURwWdG/Vzswo3dfnxOCxDM1J7USmqJUv0kQkQ6e8IMiCx9VG+ruvYEwRNWnmsksYMrUlHKiOUcp5EGLTT0WEwaGQ6hcCLtSluD25dyHp5MGailzhMcjFE6YV2gWuUT7wHdPxD1RcTdpr7OFNxNv7xjm7+h0kWzFUy73im/N8mDgaJ5QB2+Katn+9CnwH4tSrzmtVyvhwR8SP5QpTeAV4GxA4E7jMdUp+WQDzlxOcig2E3G//TYrmy+gZl+uHfz75YZR20ZbOmlfhzD2wnHXeC6LTo/SNBhoVFcz7LbCUVTfhkwVy9dTpxw7ZhMEwh6cXn3kcZN0YHI3LlGAm7hA7DBKSuk0Dltln7wUUlY8JsC38dkTFkwDCzIb/CNjI8OCsNcTTxAboG8KOE2zTk6ud2Zn176YwmtqS6DnJHFiEqXHOwnrEZTGVP3uggjdFsL6WPJfnc7LvU9EVto8HU5Cj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(478600001)(2616005)(86362001)(8676002)(6916009)(6506007)(956004)(36756003)(786003)(54906003)(6486002)(316002)(2906002)(6666004)(4326008)(186003)(52116002)(6512007)(26005)(16526019)(8936002)(66556008)(66946007)(5660300002)(66476007)(83380400001)(1076003)(75432002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?f1vNWNzzVHQP1U4n10ccSOL4XRj9D7rEgKhv72UTLJ4MHiS//UvdoWuY3SiS?=
 =?us-ascii?Q?cLRKTrpi5x7lBXRpShn06Nv6JDEM/+u69ixXNFrAWFJtNAxBVHFPzPZ0hWRL?=
 =?us-ascii?Q?gUFFi8jqmY/v0Sst3A+fCSQ4+soMtdN+rhHxf1A/i4LNcIX2ZGBodclG7TAm?=
 =?us-ascii?Q?USYN2vHaZREhVVe6J1EfoO+XdxVJAiCYYNiGoedebyr30G/pdLOzBlgb1XtK?=
 =?us-ascii?Q?RZVeUjgi8MKyF6CGDgNs4n+hZTL4Fn4LIpnjbc3ZQx3Qcq0aI0IydAMLZlpx?=
 =?us-ascii?Q?fjtERmGsB8YBd60igRy77aYA7vt5aLl0NJ9UTjVLbAsaHpWHDO6e/vy7fas8?=
 =?us-ascii?Q?2sfh8SKmY4sROZOws315RsGIW9cJPP+zFTYXmkasDw425gyC5lOaoBLgQJfX?=
 =?us-ascii?Q?2sz+vn/IDozSn+UOinwJgLmX7w8h0L7KskFfXqimpvYcSNCEuzAM3aHAwMje?=
 =?us-ascii?Q?lX5lHT4GdcduY8BCKaofCZq/FQ87C/X9aHrZITI9o+N0lqYTZfNTVlZKrk7I?=
 =?us-ascii?Q?GVLVtd3nBUNWyZsfg6Qa7nzfHyR9QAEsUvDALkdIz4nAFQPvyTM+/cUmvZbG?=
 =?us-ascii?Q?fnCY4fVyq89lpKf/jUvNEwf1yq0CfdiWa6342RBZUp+gIxvYgXof90oqSh4Z?=
 =?us-ascii?Q?AP7VD62WsahdW9Of3MYPGUxqx3pICVg6ndNNGam9xdkTlBgTd2E6q7fCmqyS?=
 =?us-ascii?Q?FnHAq9jcSxdiDRpkNAR4dL+Aehm2OwxzoPWKMYModpJoKPELtx5M6x6lbqUL?=
 =?us-ascii?Q?wHZZ8+HhZ6JtNyHBOmt2Qc8pYBi7QDGadOFpsgvU0lPa9RuZPeLmAFSRl8SA?=
 =?us-ascii?Q?597puXabCt4N2X/4uZrMEzkD+ZB7Mh3HkY5nuWpELphJD/IpIlfocW7M7t7Q?=
 =?us-ascii?Q?64aWkjNqUtAmYtmjeyWTda8YcUkp/BaQpmD3J9hrH4cH/9EjzhHCpXc3/nZN?=
 =?us-ascii?Q?YNpNRgUVKXyWGQkw1CPfE+WHwAxYy9AYcHnPd1vGOkmz/TrBonoyeGdgdx58?=
 =?us-ascii?Q?kVBSONrSqiN+E0kt1bK2d5Mpgfs0PP2naxc5cn83Qpm0GL2dQAagrdctjBdM?=
 =?us-ascii?Q?Sui4/9+CoHE+ywVVWgxW67B593/H46zlNrit2Mc/gXLjdY1JhKP4PeEI2a3P?=
 =?us-ascii?Q?iU3DTJNrdQ1F/DnGcR7MO0vApz3MdVL9ICwITozqcavrWa2mrwKBytvTl8+6?=
 =?us-ascii?Q?ldrFhvcc4AeYV9l1gUGnQ+iR4LTwAwgNnaoYV/kt6ygcG0dO+5GJ1rvQm+ii?=
 =?us-ascii?Q?1TKsEEZTk7lpzLiYMnGrq4W066LdPFJtFSDrnCg65x/UqhCsyMAwHM7ApyYT?=
 =?us-ascii?Q?sX5GRWKUcY7pl1HEc6DyC7PB?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd530bf-c1f7-40ca-a010-08d8e6766a39
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 23:19:13.7103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLVEuq4ahAaqacEAipE1TGM+o+rRqPSRRhvcFV6mlVzMU8g9fHPhwEiN0eTHnv6r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4446
Received-SPF: pass client-ip=40.107.94.91; envelope-from=alxndr@bu.edu;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 darren.kenny@oracle.com, f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
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
2.28.0



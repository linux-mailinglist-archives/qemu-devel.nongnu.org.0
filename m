Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20883F7608
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:40:19 +0200 (CEST)
Received: from localhost ([::1]:53572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIt8c-0001V9-RT
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt7H-00005j-7N
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:38:55 -0400
Received: from mail-mw2nam12on20717.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::717]:46273
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt7E-0007Ji-AG
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:38:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPpjDfwC+sFiMMwb7v1uOZOQaoBts0ZaX40vc6LuQfwrHgkwX+dwMef2AKuQuf4a0She0DBP1xgJNKQDKTjg2VA/aw1uI089neH0B8KW1xoAGz9qB5VCt1P45/vXDwiDOTBPXKRiPzIm0cAVA9n2LBlONHrpTeiqg1UARHZNkGMTinQIUq6UaXc+EGixocdkPsQLAgE5ylzaWAwi8IkzTqDfRvxLxBkfzOtts9pM538whJ24K0dVt0eZpduOWWXeHnV1BJ5+M51ZyG/BeHe9nD91C/gqqCcDQEPrUH3+SbmjuavWu5kkaD3cX6lrqsFwmsdVIxMC5P67P/zLWwNCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS6NVYFeWYkAUe+yX/SnynNsxZaFbZU5FDRzrN2qyKA=;
 b=Z8WUqXVRjDbreyolN4J5ZEQJU+i+8UQ+h9OkQVDBg/+Rtb1QguhdjPZKS/EKAZ6jDHdr9h21vMcbQlDF/Bzslusk6/Rg7vJiIWyux52ItFZyc3ocUqhgSIieuNIJCHTkgd28Xr9Xn77CT2dknHEUKPyco9DK/IRBzmLhEnWIEk9zCzb6fbDveEreR/TwRNbFc7V/jhTBBlssgWnENIsrJgMHd+zqs+HSZx7heTGlch39C4oc95mifhfZ73FaqJHMlTBrLUnTbIT+YxPs3+Ur3LiGYwGZkgghdyV2HkBt38lpDuAirjvVlgPIo2agt3LgVvHqVkRpbDSLCCj7wN7hFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS6NVYFeWYkAUe+yX/SnynNsxZaFbZU5FDRzrN2qyKA=;
 b=GCQJishRYR5Ebl0/0LsdinQPAv7yp+ipzfEogT+ocBYHT6wVCL65QnrJtJUDGnMBqPD5csIfOzSn9KWxfbGsl+aEvYTin5c+5JMBVh59BmKRwPMsExOjSOrPL4wnLjWiI3LKp9ExUGn9TzfJJCIeZCMGPO+1MAUbtfEBl5p5cnk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4447.namprd03.prod.outlook.com (2603:10b6:805:ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:33:47 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:33:47 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 1/8] fuzz: fix sparse memory access in the DMA callback
Date: Wed, 25 Aug 2021 09:33:25 -0400
Message-Id: <20210825133332.44378-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825133332.44378-1-alxndr@bu.edu>
References: <20210825133332.44378-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BLAPR03CA0085.namprd03.prod.outlook.com (2603:10b6:208:329::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 13:33:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7619bb40-ea94-43c0-73be-08d967ccf745
X-MS-TrafficTypeDiagnostic: SN6PR03MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB444789A9FB9E4E50D57D679EBAC69@SN6PR03MB4447.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f/5kmXUF8Eph1TAc1bJqYyRSEJ/yko8RIZjatP5a7uwJ8D/uEP2xwJ16YJV3rCoPQNrePdIE20I6iN1II7Bxv2wLw6I/VQXtue2m9t53KoIhv0HSdAymmt5qHlbk3MLN5EXaDuDxgQfsyx+69KlmF5HCCQJOdRFfYPaHkCIVPqGHsdderWoNxtPJr3o/EOeoXW6UQVSxT7/zjRCST3zGJUdUgkU2qjTEDhjcFJMbgeuiqlXi7PwWSpmI5jWpCL9HMi3OLSvfSYwylM/2TTKsX449NPEBN387U5ep1bXkxdo0gFHDqPBkIjHbGySeuSznOxHTKLGoscYDGVIHFQJwvdxfN9hwa1VF7tQD3Voj8aKlbJFIWFfPcCcr7rscRhTluYrWjxvrj/ZwNpbeTLLNJA64IwIfVIcPRexYrJ5t5ALE1kr9OgCljToEDUVkOI5/Km6ADoB0MdWPiVN7lQHlzPrquDk6Pemg0HMKBGRcZ8lcEjroCeLts6BEn+2ni4yosrv8aJwoP/vlryPbyTnXPrOvrBXAEZXuYz7BauFogjeniaCfffiZ5tJD39sARUsGhuTywkH1MhXQIQAXT226Xm64Dxdu06FOzBrAM5qnEMmbNTmuXU5vCEgZ3BMDthq/xb54I3ZwCnfVH2rR+E+ufaM1wqZEeIoU+P3pbV+38LfvjbCnL+xnY0P4/Rh0Xpa/zveIOhIXqta55R4QVwIz2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(83380400001)(75432002)(186003)(1076003)(86362001)(478600001)(8936002)(36756003)(6916009)(52116002)(4326008)(6512007)(6666004)(26005)(6486002)(38100700002)(54906003)(66556008)(38350700002)(5660300002)(2906002)(66476007)(316002)(786003)(2616005)(956004)(8676002)(6506007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWNOR2JYN0Q2d0oxMEp0S3g5dGtlZ3FwNnNtTFN6M0tQaEJQcDZ5ZUZ3dFli?=
 =?utf-8?B?L1lodXdHQUk4bWVEQlByS290YmRCSHFRVTRkc3dRZ09yUUNoaUVSZU5qMFZx?=
 =?utf-8?B?ZmkzNFVGUUlyYmJsZzV2Tmd2Z3dDaUFsVVdzdVpwZmdvaDBZOWR2TDFjekNy?=
 =?utf-8?B?K1V1OVJ2ZTJLcTFOSFBqVEc3UlZ5YW15ODk0MThNMlJGclAyUCs5Y1lQNlVo?=
 =?utf-8?B?OWxsZlFZTTZZdHpWL2ZOQ1YybDNraCtNbk41ZU1NQTA2bkwxNXJOeHhsR2Jm?=
 =?utf-8?B?ZUdiL0Zla29PQitsM1hhZFBmQlJJRU9PWVhCYi9IT0dLdEJ5QmF4WXljSStT?=
 =?utf-8?B?L3FkWUtCOUVMRHIzekFWalZmczhZYUs3cUYydHd3U1FTNE9lTkZxLzJieUlk?=
 =?utf-8?B?MXliRjBHMGplYWNqNEQxNHhVOUhQeXNKNWdHWGpRQ2tSakpnZE1menhTVFVM?=
 =?utf-8?B?ckpjQ1k4d3ZvMktrSmMvalJDc25wWVViWGJxdFczZDNhcFZQWkZVUWVlSVla?=
 =?utf-8?B?NDE0SkYyb0xzZWQyK29CMVpRL0dvL2cxUGZEUUx0MjRBb1NtUjArUFVTbSty?=
 =?utf-8?B?UUQzQk1DSENqRnZ2NUdJbW9jdndXTHdtWEhqb1BHRW13ZGxrWWlsQWk0N3JN?=
 =?utf-8?B?cjQrbHdqVFpLOXVzeFViWEZObjFDZ0d1aHFQWWNMYURSaHdKRXdRK0FuSFJR?=
 =?utf-8?B?TzlTQkdnNC9QMnpBV2VVU08rQTJSSWticGw3T1BYRjhaYnFvem1zdGthUG9v?=
 =?utf-8?B?UFRVbzk3aDRBQW9DNmFsbFoxUzc1MWxVclFZYWxjY0Q4ZVdKd1F2SUdkU1Rw?=
 =?utf-8?B?aEtMK2dyUC9KQnl0L3dQdGdkNkxTTk00R3BmWmpmV2xOOXVXU2ppSm9xcUQ3?=
 =?utf-8?B?YUtta2pBbWZvaGYvSTBOYWxxUTB5ekdETWdtVmxRUnZvYTBPN2dib2E3U3A1?=
 =?utf-8?B?ZWwzaitZeFZacUVVM0E5dVFyMnQ5aTRSRm9YMTh5MnFFd1BGUlJrZ04rNStI?=
 =?utf-8?B?MEdIeFZJdm5WVnNMb2RBRTV0M3FvTGt1c3RRMFpEZUNVc09TendGSjdXc2Yv?=
 =?utf-8?B?TXl3djBHZXdOeEZsV0lzajB6ZC8vVW5PVHk5Wk92QzYyRlpHakkxUnBqR1Mv?=
 =?utf-8?B?ZGJTckl1Y1kzTUlxREVVS3V0MUwySFFiM3VIQm04RDlkcjZvZld5VVQ5TVVy?=
 =?utf-8?B?RnNGMGFiUlBiWnlqUnBUUy9qaHd0R2d3VjdQb3l5bHNybG9HREZCenVkWFM4?=
 =?utf-8?B?ZXZVUU8vQisxZ3dXbnBXMHNpZG9va0o2K0ZwYVdnRWVDUkx5YytSeWVpVzBB?=
 =?utf-8?B?L3dUbUxLaFFLa2xkeDdWMnJ3RVJTMkdjOWVLZzc3VXJCelNwNnJNbXpPekxH?=
 =?utf-8?B?ZmIwZTdUMFVtbWNYdUFpNDI1RStqN3dneWgxQWVSK3Y1RGsrWWJhdkliYTBm?=
 =?utf-8?B?b25yWWdMKzY5ZXJyRWNQbnpGbCtUSzNmYXl6aC9aOXl4TlZqSi9nYllncGRs?=
 =?utf-8?B?UXhjMEVWY0QzSXk4UXpUbmNZRHYvQXdHWU1YWmVLNTJxenlxbk01ejYvZzdz?=
 =?utf-8?B?dnE4Y3Z5NE1UeCtYOHJ2Z2daVmpGRThXZTNpN0JPcE80UWhWSERCWm5EZnoy?=
 =?utf-8?B?S1F1YWFaUVFubnhHbWhRQlFFc0h3cG5PYUM1b0pia2k2VHZWNG5BR204OVBa?=
 =?utf-8?B?L3ZNdEZqcXRuY0RyRG9pOGdPMm1Vby83aTkxalVGZWdXOTl5RXY1dGhkdXJC?=
 =?utf-8?Q?J4lQ97aI5AMRSeAXifXhAUOVY9QFn9JyZE7kpK0?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7619bb40-ea94-43c0-73be-08d967ccf745
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:33:47.0608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBBSgT2tv5og5owSN81/KjJhhLc/VvLHgz47z6WOJJQqhoohMqFq/UX86iqc/h15
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4447
Received-SPF: pass client-ip=2a01:111:f400:fe5a::717;
 envelope-from=alxndr@bu.edu;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.89, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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



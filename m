Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6213BDB4D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:23:58 +0200 (CEST)
Received: from localhost ([::1]:38074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0nrZ-0003ou-7H
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m0nqd-0002ST-7B
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:22:59 -0400
Received: from mail-dm6nam10on20714.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::714]:12864
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m0nqa-0005OG-SC
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:22:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igdllAWK7vmHkrnvj2B/FcPE/gIU9UIq8NuxEfTbJN1DbEAYd5do6Nfh19yuhFiwKPuYMNcPRxh0uvpJpvIOSPjjo+man0z1jjtGPKgriPEnunmecsmA06jol4MWW8YQo+jQ+S6lWQ3fo05NllmXost+D3Cx4o4HTfmTEVeMUjMhrBRGtaEMtCldEE2rOAYE7sbTGncSWCRnYm6hp2s4NnmRgNesj3s+FpMnc6tTVKKuaoOJnLImnY/F6qHUurN3sUlWBVDKhkZ4tE8rLqJ40s8+AjU+EJvOF2ek44zj5yfHNkPJWxpyULipb0hLiqXGYtHV52wuVcGyGLdTXT2Ttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L78RjAnePCId+wVsum0/upwiqPF+LSP30twIFH/pa+Y=;
 b=FIpygA+wdzPUbDza2ux6Epv/PhYrD5nHmz7jYKftWu0LQ+0k92b1JdfRJVbuS85ThtUdL856NEcRzFevy6kpRckhwfh/XcxuEQBWojP0eCsyXw6qYn3D7umFQWm+vutOeVW/ibmCkMLeO7BFkMYtk71+LbxddniNg+9fiEO+aRdVe2G2JuI54eEdnINx/pxlga744F0zaIozVTgXEWm55ryBwZjnVFF89D4lBd3uVihs7Irn4kiuhqOzJa3bhpP38PHbZyER8qiKXHLF0j2eEvzv/xorxShOcma8qYvPCFBi8RxeZQmAtBmYZM5qrepTCgpIUN3fzsWyHkRzJ71VXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L78RjAnePCId+wVsum0/upwiqPF+LSP30twIFH/pa+Y=;
 b=sL2N+8Xt8A6FdaV2uaY2xZ3rQ9PNZyZ5edpVDcFXF5IcpuPVOKMPBvbmK3+zp8Mt4AgXeByIN3gutjYcBts7dLCJyBV+qhNVMn7pTPMNBJuWYc+O0LdK6OdlUZgfXXwcHn37VEElJTqK8ZaJhfyphBw2+2ZxelcpqHg/fjEv2uQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5723.namprd03.prod.outlook.com (2603:10b6:806:118::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Tue, 6 Jul
 2021 16:17:51 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:17:50 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: fix sparse memory access in the DMA callback
Date: Tue,  6 Jul 2021 12:17:35 -0400
Message-Id: <20210706161735.57967-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0258.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::23) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0258.namprd13.prod.outlook.com (2603:10b6:208:2ba::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend
 Transport; Tue, 6 Jul 2021 16:17:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e5390ae-89ed-404c-501e-08d9409999bb
X-MS-TrafficTypeDiagnostic: SA2PR03MB5723:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5723BC4F0D05D6494C9E8045BA1B9@SA2PR03MB5723.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N64XsQgT1+OPICPjKTxNDYk4PZyHxHagsK3jcoyaScNkS+UAW6CIR04rBe67NI4MLT67HjdFh5FzYvAxUjGZrltwfkF5PPVLoiRyc2S+ZzMTU0rT+NQP/kx83fIkAvHn4y+mon7VKY/pfhqyajRWU8q5DSrm9dyEp+KhFLv9OA0WSY6vJYcZyhavgm5De9YSZbrEek2ep411uXuvAy+hg1DpJ4JwOYu26+MGpVj98HhstDR1MA8vcr9rq3hOZjO6lHqP521RqRNe2Z0TS1oYJLftO9ioC0djRP8klylXyiGBkwgGewMA2oyKkGolaVpRA2cmyQhceccJccEkml8ihWB+Hgn8M41SOaqMVHg1PSGN4x1HPkFjtqrkSJt+41MVkqd5ayqDgd2tmGrPNhFwtPQyXm+2JPiPaCR958FNF/PQdg9juNTx4g7yM6SN/+UGAJMOS0t0T6ZHb7CzGIlIjUdP4+5f4SEfUa3aGFn7O4i5rjJL7Vz/8f4C152UjopFTH55TBq1/NBwQzqxFnIafzvF6I95cj7jYrVp3uih1FOI44Py2jINthw++q/0HPUcj1w5n3qw9pLUeSC+JxkFQ5Qx1NvFQ3PMBAcr61CszNPBPZmbjeqM2YIiO4xuJTtyMb83WJbKCCghDOV2KqKE8rBQeT74AErtM8OdvLIiKCkNRWg0JDmMCCk68+agO/pzK+nZfGhDnJcc9j8+zrZ82w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(478600001)(6512007)(6486002)(6506007)(956004)(8936002)(316002)(6666004)(2616005)(5660300002)(786003)(66476007)(1076003)(75432002)(8676002)(186003)(26005)(66556008)(66946007)(6916009)(54906003)(52116002)(4326008)(86362001)(38100700002)(2906002)(38350700002)(83380400001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v6p39oNNLCe5JhXGLmG2a4InWvIVI4IvmAFBq8gx9oolv2pIAYG7Q3lVw7Dx?=
 =?us-ascii?Q?5QdzKZ4gsn9swCJgNuSvSB46Wn9dkthsNQ7NzQuc6eqCYlUPqE1jn9bcrXLr?=
 =?us-ascii?Q?3Efs4HLcQkCehG8FebjdJtW4E8IvNaYjGj8CyXejPo6VIn299ErPHiCCe9Ws?=
 =?us-ascii?Q?8MzT0HqcvNkyp75nFWK3WImVbqWnhdGE0CK6G12D2T8NbY1PAxTSUMhY6ANL?=
 =?us-ascii?Q?8Vf+uCQbBdDc6wRSSwwNUCvt+1S9UNVITv93VR72vH4iCubjqInCq4MIwGrz?=
 =?us-ascii?Q?zFaYxYhmvIP1rTGfGDAmTRJkMmP7M21raax1P1kY6m8Ijrgpbuyg2FrkpY52?=
 =?us-ascii?Q?F4N/1foe3Ma+X2Ujmjgkg1gSNcy4hptGSW1Panam6Sr5Wwj2mMW5XK8B95eF?=
 =?us-ascii?Q?VgAHySxGc0oyVb/0G88tAmvNOB4y5k2savg9V9BenNgklqQGDCI8dCK0j5Eh?=
 =?us-ascii?Q?nhlwRYUsSt1R6Q9Ak9At+grd15ef9Eh0hV+4oZnms3uHcJJe2mDMCdS+wMTm?=
 =?us-ascii?Q?yrzGc1Lg3k30m9vYjGkP7IXdqhBWkOEJe8kUkHxw1zthkaOVRfSat6079eHi?=
 =?us-ascii?Q?mlMv0DxgGHCSeMOGwMtdUuIhjGEyjKkBp17tqMdFseM5z92aVZfFz5ZxGTP4?=
 =?us-ascii?Q?llIdZdOpfX3qly/9hjXeT7HWdqLIwTZjXhAwUCk6s91uYvi59U6Bbe2SLM/A?=
 =?us-ascii?Q?a61EJffxswBNSAt3QSHzxSuuLTLGb742ABMa5ISZAbPUf732CK1CfkivT5av?=
 =?us-ascii?Q?jmo+XvQf72Nwpz3PsAQ/Sa1mxi4sklDV/mKbEssps1qOVdeLsJvTxg1XLXjq?=
 =?us-ascii?Q?j0SRAVCGDQLcUwwRErLAqR8CvKMqxVC1jagLS6cBgOLvdayqnhTeFo3B6t5A?=
 =?us-ascii?Q?uOqIthh72nDgAG00plUc6rAcXdJi4Rv8at9QtSq0fJv0X9u6kK1ToAsBf0S5?=
 =?us-ascii?Q?1RHOqsTA6eYN1JhiV/lCRxOBDo4IoHYVJwp/mfvC/aiRFZB0ijJzdUFjN6RA?=
 =?us-ascii?Q?cW8QEUhLGfo+Ia948lif+Y0NPIFWPfuES77EWpVh3zPk23mRF4YGpzoieDwA?=
 =?us-ascii?Q?cYICBoqXqC0yaPYco9Ub0fuszGDE3mquAMAtQP5JBas0Nw65Unswc9mIDOuJ?=
 =?us-ascii?Q?BvUd5uNnfQ0Zn2lynt9b4KSqG2zwxWPcRRE95HwRRfd6FHJbBdqKX5A0MnUg?=
 =?us-ascii?Q?5mh05B8CyaJMoFfugeWp9rPtYyt0VB3eAiZ9aW49HI74ytyj+kNvxDKExSX+?=
 =?us-ascii?Q?GzyZ5WEG69R+ztbbHkp9cFUXavluEoA41QxIxuLjX8b7DXrZbKaV3768dhuH?=
 =?us-ascii?Q?sTZg5R5R/Oh3ER9MaYAEpCUg?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5390ae-89ed-404c-501e-08d9409999bb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:17:50.6387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLDG8HstuXMiCDpksY65KBubnTHP0vx6X9S15yb1CSVmJP/uUlwt7pw0aep5BwiR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5723
Received-SPF: pass client-ip=2a01:111:f400:7e88::714;
 envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
---
 tests/qtest/fuzz/generic_fuzz.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 59be7219de..3e8ce29227 100644
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



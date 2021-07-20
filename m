Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AA43D0289
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:07:55 +0200 (CEST)
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5w1y-0003Do-Pj
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1m5vxO-0004jO-Mi
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:03:11 -0400
Received: from mail-dm6nam12on2071d.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::71d]:34784
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1m5vxM-00058Z-PZ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:03:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/0cDIunq4pevI1WNm+e6AAtR05TMyb5rEA5u5gnQJqfDz1mHEEc4zVHR6d8TSM6/kpRDSG5pLBxEhR2HCeeFQCqBVz5pX83cMj0fkBLQPeLDbjzyi5TU7ZQGyyACOI9CAIEeJOWAPszQVkqQ+43J0oC0CTICCrugS2UYUcABPJNDQC2lQq4iU1kHUQt2nkjdupWioBzB1qLyACnKyKmIilKA6XTbiwfnS+jeQRO9wMW8V7lXT6QXEAvuZBDkEAo5aDOAKfv6ZMDMavpQcUdhtByLY3t8v7fa728zNxZfhQVIw+EB/uqqTLdri5jdhYJ0A+YxRmiJESPVIyjMJYrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/mTDF2XDx9fdoL9EbOqHuQT9qHT+ACHVLTU8msdNAI=;
 b=Uge6IzRto0b42pcoc8L2K9FCK/z3O131VMQwUdKyYS87q5FSRJS6QNf++eEZLcKoIIju/ZwmYExca5Eit4yrxis5Mi1A3a88fv0O1p4YmwE9xT9cThNOUs4X+QRx4IxM8rrMWHaGokFmbdCy5/j3AKaR5Ckp739NTxe7ifPIt6wY8/axC4S89PtZZnUYCkQT5itWLAgx2zkkLowqJBm7YAw+Rj86AqgT5rBjL4MmSNh1sHc10cv3a7t8HSF5e2elHEu4++Rm7t07tElbVPzoi1tEPBv/4bAXg34B3kunmwHcdTd05xsZum1EvL24OvVpr6D1STsdoEZN2HxugXdykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/mTDF2XDx9fdoL9EbOqHuQT9qHT+ACHVLTU8msdNAI=;
 b=NEtB25OAP/q0ro70kgvBafOBwxIGZD3HW5blfGRPOkdqZ9FwzgzZqmJarb9LTXpd8/Y2jPrGvFXtVzn+gOOmnyglV7pFF2Pd89O0K7D/Gm1sl5gs08xKuHUQ3RbPY4RVN6ybUJdMUyrM1JjgGsDY/Da1ykSRvn8GTxsRQLnVqwI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB3934.prod.exchangelabs.com (2603:10b6:805:19::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.23; Tue, 20 Jul 2021 19:58:04 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::ddd:63a4:21a3:c9f8]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::ddd:63a4:21a3:c9f8%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 19:58:04 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: cota@braap.org, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH] plugins: Fix physical address calculation for IO regions
Date: Tue, 20 Jul 2021 15:57:35 -0400
Message-Id: <20210720195735.3934473-1-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY4PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:903:165::11) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.amperecomputing.com (68.73.113.219) by
 CY4PR07CA0001.namprd07.prod.outlook.com (2603:10b6:903:165::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Tue, 20 Jul 2021 19:58:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3a7c512-4fd8-479b-e885-08d94bb8af17
X-MS-TrafficTypeDiagnostic: SN6PR01MB3934:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR01MB393431148CC3DB63A6C9CF338AE29@SN6PR01MB3934.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8p0qBY8BvYQuPJ89N842kyNUgP2ydeDd41BQzripB7mKAe+raxaBQYkn9vP++AKpduGnuKRIjOT0BUXzDDHLq/yWz/aQJjHDVZArSfjMlktSscVGXoBrqwPx1Sd1ZixNw5FS5FDHEraL+Fdi8eTZdCsdmIUhVl0hk0aFik69CkIJNXYngo0VZOYf2SoHzWSeiHp27G2+kak3we+hqoTRsyKo03af43GYlhi29DUPRPIEngJjuCzNkAdEIZci0gO6k3u/V3OOvulypwlWmZ7CexFu7OrGC1qP/3gIjrrfWpoZxu8PC/gavwL0x+UU0HMexqxogTG3lPHKU3NYk+KuvCXZfBxa3sGlRGF3h4u5DSnQSrflTLu4z4nAfCqiwByKEI67yQviyHHdwLuIud28hIoND95m4PEtDqsFZFmFdfA4DmiMqKqFasiuKHi+3k8fPtA+AP2ukziA0nlB83mAYc3VxSIOUDDLQbmyWS+NLvNGrOs1kh61Knj5fSio4aU8l/Mn3hte1FhvdOMLkCPsrBj8+YsO0WtVWd7ETzu1kXRTtLRTlcp94vTB7/z3aVGkDJs3WyBshxsd1qva8QBGIpXQiZge/FTsq5p/Ao5k6TDyfSJN0S57kQEVTLy5AWcTj4oInJteN/pPepnDQ8cype/0Sui4tlrjLUALtZ+YrNjNC2NtG7JyBoUmm39+43/x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(186003)(8676002)(2906002)(66946007)(4744005)(107886003)(52116002)(508600001)(5660300002)(8936002)(6666004)(6486002)(4326008)(26005)(66476007)(956004)(86362001)(38100700002)(38350700002)(2616005)(83380400001)(66556008)(110136005)(6506007)(54906003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l79vdFimHVJ3J3U9pAryjUUPfO6u0eytaepiJGesBZnWFA++q+QaVoARccjE?=
 =?us-ascii?Q?anW39RBjFeTTVuX53C/TnJ1mP4dk2PSnQYYsoNaXIELLtxgJaZvGsZl1oxNZ?=
 =?us-ascii?Q?eRJHV/QF/HeovxyWbHREt6v1bIDf7e6KLPMCyotN6MtMZCmV93UU2aJ/5L6P?=
 =?us-ascii?Q?YAWp3Gd0WY7TCHyWvsiGO7Sr9O6XLgEy3F8w59cPOdAshNlGgKkz0eFtF/nc?=
 =?us-ascii?Q?cFx6wtiOlHJTovA7+pPy4M3jVTbFOouKzJC6bRm1wWihlnZDjU9uwpq5gk0o?=
 =?us-ascii?Q?5KclN335MzpZBrMy17jLP0XJkfVp96/JNFJQ/bhsB9M4zrEmPTSjQYdTX6EH?=
 =?us-ascii?Q?vcxsOI6Xo7mePPJ2uX1zL7QNZcYMcjHCkbeigweYuKEWStVMm0m/zzUAPH3R?=
 =?us-ascii?Q?rjOjoTHWIwA9B+rjhiCd1uZ3l2+N8VomS1pQEUhCjEdeB9uPyBkgBbUl9Dog?=
 =?us-ascii?Q?3tbaA6prKwJyTwxO/xQvMJS8XO57wfZIzWwFOuYKaZWHULJPNGTjQew3oh69?=
 =?us-ascii?Q?5+/onI82RhrluFQhK8aUDB3rEspeEuzYp7zb8Jn6RHwdmbvNc0FB6l5h5c8v?=
 =?us-ascii?Q?KdOzHUMSfFNXe/gHltKMWt/3M32vDV+QyOhtnNXzsLFEw6khPYh7RM4TCcv/?=
 =?us-ascii?Q?QxQ5LX0WOuPSCm4WQLFTHFbJ76cvn6zvMprl90N97HNNtKQJRHvms2RSJiKl?=
 =?us-ascii?Q?4JNjwuxWvo0uZ3dlcqNbZlpw5gNIGFECs9/xztPW4OmcG3t+LreaYd9zT4To?=
 =?us-ascii?Q?aRgP+rn5ce3NpQqwwuwND/s5w6X8VY1hCtkPGKg5l5R4M1kzss0NwZVJW36f?=
 =?us-ascii?Q?s6fXglfm345dJO0C4nZe+f08i+lNwopH1Ed6dfE/jrNYVXZlX9zhWYMA0y2W?=
 =?us-ascii?Q?0LBFOnVggZQckqiZ/NSffq1Ls478AG3ETaoTOYIVETZXNr7TFmT+R7Jc61z/?=
 =?us-ascii?Q?1N8cTtNyR7g7x386yBz87luniRGe9kS1kxChydvggTgOe+YP2+qLPAJyJx2C?=
 =?us-ascii?Q?8/95pziOTbnW1dkmpOjTR6KcEO+yYzalYRKY5z7EZJzZIhxLDwToIJxk93m7?=
 =?us-ascii?Q?Iy/Gztd7t4uhZVk6uMdkHDuSCYZqGPY6SJ18xlVoUUc7Yo7R2spTQwzfVxFN?=
 =?us-ascii?Q?wEN+M4dLQ82t2Qy14g6KlHGXqZauZ1syZFUEejxzUphJCF13inMODE8YPCxU?=
 =?us-ascii?Q?p7NjAUhqX+J9T8WKnjuA42+/NyG2hwSYLNDu0+uSWeKAP3E81VzPLOg8f9Qn?=
 =?us-ascii?Q?gYdEqkrxy3lfWmGQxobXbZhhl7Ql3sGqYDXxBydeO43zvC5AiTBMhqcHdcfP?=
 =?us-ascii?Q?vA7gZ7R3va0+xQtDUUxVczrJ?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a7c512-4fd8-479b-e885-08d94bb8af17
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 19:58:03.9507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67jbXIJVteJmBEXShoy/VM0gUxssHD7HoBHGUuXWAUVLM2bvv7w9Vf/HeK6WZemHsCRmhhXPmL5mGfv7AhBXF1erOa8Tw37mhxAD9QhQBa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB3934
Received-SPF: pass client-ip=2a01:111:f400:fe59::71d;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The address calculation for IO regions introduced by

commit 787148bf928a54b5cc86f5b434f9399e9737679c
Author: Aaron Lindsay <aaron@os.amperecomputing.com>
    plugins: Expose physical addresses instead of device offsets

is not always accurate. Use the more correct
MemoryRegionSection.offset_within_address_space.
---
 plugins/api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/api.c b/plugins/api.c
index 5c1a413928..ba14e6f2b2 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -319,7 +319,7 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
             return block->offset + offset + block->mr->addr;
         } else {
             MemoryRegionSection *mrs = haddr->v.io.section;
-            return haddr->v.io.offset + mrs->mr->addr;
+            return mrs->offset_within_address_space + haddr->v.io.offset;
         }
     }
 #endif
-- 
2.17.1



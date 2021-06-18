Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442A53ACF76
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:51:40 +0200 (CEST)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGmQ-00046q-UJ
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1luGkF-0001G2-Dl
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:49:23 -0400
Received: from mail-bn8nam11on2115.outbound.protection.outlook.com
 ([40.107.236.115]:23557 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1luGkE-0004iY-3I
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:49:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7jKhqwQ+SXpgCexDSJQr8NgqplkiZco8StVyRi1+EL6Wek6M8+/FmjTf/3Ag9CFT3Jt75aOalpJTVmv3tpr2kg3Rz0/CEa6CHIXxgIqa/BHT8/newztMYMqG0zRs0FblyWFMQIIhTLZHy1o4dRNmsvO2NzoIteL1/ULE3upxxigKSKyGY2o1DdrwqPKoIqwAEhWG8ntU3/U16oJE5Hrb0Ki2WkABGf/zgTUtmJ6mof2OHIrt2MxPHKZuLVHroo+k0VQXEyapkD8rYqeP4M8QeNpiU5y6kidvuuTlY5ouqBDoqpT2LHej8GlFkw9OGhRfrXtu8VkNdrFZynfF7nRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQycF3y1+e2rga8fnL9V0JqhlEEUHFXnevG6nygxWyc=;
 b=WN7STiZQ7lY+Rt/TItKQHV6960uhsefDIoGyvPVTFS10CeAUGZM1ApiNhu7VT+dL1o6ZR3UywMKklzq7Q/paXx9jNrhphuQXhT58yrAHZVxUoEpgPMsASJ12IHmIxGj9OsMU3h0+1zQH4cMy3svc+FSrZqHJ8MO/k9vt783ldX54EB57M+MmSylq10E4RrthfYI/GJqZl68B4gvNco0wrr1fgrRgYessu1kfRhUKzP3My7OFkhWM4NBtvvjRJjLaKfebJcHLY7tvtY21v5PHexH/NKabE1qPSG8O/HtCzS3WewP5MN5Pnh/TlXGOlxgzJNef+4krPVVprGrA6/tIfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQycF3y1+e2rga8fnL9V0JqhlEEUHFXnevG6nygxWyc=;
 b=Ur5drad5btei7Z/gSiEwoxuZcn045aU8lF16kCRiyoupx398KL02m2YgJqgcFAKPzouoTWJNseUOaSYmTfkfhedCGlC6pVgC4NU74zXFaYEXE9DSnvcvsoU0hWPqHU5RGLDPuuRKX7keRT2KhQRF4uQhzBCBNoMUGhEMIgv3J0o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5769.namprd03.prod.outlook.com (2603:10b6:806:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 15:49:07 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 15:49:07 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] fuzz: fix the ES1370 generic-fuzzer config.
Date: Fri, 18 Jun 2021 11:48:52 -0400
Message-Id: <20210618154852.5673-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210618154852.5673-1-alxndr@bu.edu>
References: <20210618154852.5673-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:208:e8::19) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR20CA0006.namprd20.prod.outlook.com (2603:10b6:208:e8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Fri, 18 Jun 2021 15:49:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4911574-8d49-444a-2d42-08d932709b7f
X-MS-TrafficTypeDiagnostic: SA2PR03MB5769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB576932349C1D6CD6709CAD5FBA0D9@SA2PR03MB5769.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aKbepjWrTY89p54iXN3w/z/y1SowyWFaAs6vRgNreQz09D0xRpxbZrbJ40y8QueJsCUThGeOpU+508AS6CGK26geE4BdG3mVl2i7HrdBxbCGLd1/KPFJzy/IBnhTBXqWpwt2Dwop90E+AgYnwlwGWRuFs4C4LxCp0VabOPAVX+9HR1GCeZjJLg09AUmA+ENwwlLhh5GqwEo8nmzSl7km0JIs/NoJSsmq4+XFCuUnk54lkJO4q7PSC/3KhwbDR8NT/2l8q5v2zTaAbcA7PLbt5KC7wwJAEv1foRQa3hnsADNIb4IuoY4tB7bREMKbltm+AzCIHtLJc7BYqaNodgYADADOfAn0k1eBuAWNLc6yw4Oo5yHZ3VbOxbatWY/M6tw+E6davbuokEyOUQg8Ejl49GpNF3kQry7lGflca5HYmbmYEle+yqBAupmxxL4AYM6aGr0gH0wcVxntBP7Jdoqa+warWyvHg+jPKwlzerEENrzfHoDyPibiv1CTQFNGt+M3gU0L6tg+8NeNuIngQF5P0NgM3f3SWxiOzAJtRPD3tmEZ3V6pOn1gZ9AM6R5v3QIi4Ho5TSyrEvagbyTUaZBz7OCcEQAZbHloEq8a3MqNOjw5rmUU0FUZx+YkUNibwO2yGckuLjKZnQW+2mx//Os7K1np35pxkURKKTqmTsWs1uw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(478600001)(66946007)(54906003)(66476007)(8676002)(2906002)(786003)(5660300002)(26005)(6666004)(1076003)(8936002)(6512007)(316002)(4326008)(75432002)(186003)(956004)(38350700002)(38100700002)(16526019)(2616005)(66556008)(4744005)(36756003)(83380400001)(6486002)(86362001)(6506007)(52116002)(6916009)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MEoVDBvHuM8fFtn31yb6iU7Re1snHrpYy+zgomG7xD8M+lh3s/ST6/UxiPqG?=
 =?us-ascii?Q?hTFBobUwiPFyT9aUe+cPGac+2dEELtd0JN6xqsUF+bZcQJDECVTa/KVeEUrI?=
 =?us-ascii?Q?EQ2ep5Tj7NQ0RGKkOrwgfWRc0Y97ulQx+wc6bxlQBviHM698x4WQln+keQgi?=
 =?us-ascii?Q?9xShgQQ2kawZOc0XeNHx29LLiVNf5d1/scwdRFSzP3quJVgO20oXiPy53cc0?=
 =?us-ascii?Q?OrjsTp+Egot/jYVQHqc4QxURH7jKuSeDjBg26t+ImJmL0Y9Z4/D8CMOc9TaF?=
 =?us-ascii?Q?3O4aufqI8DpZ02eH9eDEa9fEesvfzwHd9O8cfFztsENDa8JdPylvD9WUOsF5?=
 =?us-ascii?Q?J05twHWZlutz75QoB4of8ot91/skDutSa1XiMaudhfZ5z8JOfJe3gpaKisO6?=
 =?us-ascii?Q?g81R8ZJQFwzKNgU7aBXWZaGNmMAjxBGELBEj3VHfo+lzKV49eek4hLrbqzir?=
 =?us-ascii?Q?0HpzlDN3OumCnhaAlHGZgzlT9oW3jBVUb6V1YFexbi7K/gbWzPwu/Z/HDImn?=
 =?us-ascii?Q?NWrAqBSPpCsd3i0JfoQF/BMi6tWicm5vuBbq87GqFrT4YNjl7K2wi7KbY8Up?=
 =?us-ascii?Q?jgW48DVhzEGBFzc5sjuueqT75/sSDGPeGc/qanaqvi1YDktD55GWc71SGuNj?=
 =?us-ascii?Q?sd6bk0xlJ0Sdr8hNxigF0VaXvyvCa/44M4ONbj+WxhPAW3tQmt8iXs685jPj?=
 =?us-ascii?Q?JwenTaoem9L5XW5n0bW8GI6mSTF2qfBpRnnqnmhCtPtnGnzByGyhJFUthSjb?=
 =?us-ascii?Q?JptDVRBT+XtzmjmLtU+XPbMftnrm+v4NkcuQV+utiJ8WoAWZB7vgyvjimntz?=
 =?us-ascii?Q?EIFTqdYXCLMFCx+NwOjLlqIiR9HHd91vKfH032fEecCkzMdGyk5YRwUD06Dk?=
 =?us-ascii?Q?lVkKoWCMETDbokGxwDkMRGqzRD40R1yoYXxcVXrzV4QvbN2mslAWb3OmV7Ri?=
 =?us-ascii?Q?clxV1ivuL2FS9t1pfn3p52jBysXXugFYbYnSC3GWAmf8HTVmPd3C4D8jC1aH?=
 =?us-ascii?Q?yn6Ap3/WHiO49XzUwE8CFgSU/SB5veG1Bv9GqpywIopjv7G+vButxbtFdjAQ?=
 =?us-ascii?Q?sdVz3/e6KuBBaJBTkuFQUI5wSvvB5QsknnSeFeefYpWwqwQp5zSXNsokbUMH?=
 =?us-ascii?Q?KWpff6mErkNmZDUqF6WTP6jczbRgg9bBAHA5GhVlpsqNc9Mma80am99rorwE?=
 =?us-ascii?Q?6DPolEhZ4vRIG2yM29/0km5hoZODE17RvSzPi21J1rHigu+u2bOXnC9i6sO6?=
 =?us-ascii?Q?//I/09IC+jvE3WjgHzfEBj48lMip0XkFJZ6uYKtF5LWTCcMEkAqccBljQV11?=
 =?us-ascii?Q?t6VydRGAgyPHxTFzBeXqkfJq?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: e4911574-8d49-444a-2d42-08d932709b7f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:49:07.7953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0dJKF8soEj3JdBlTACiRQPTywywE8g30y1oaeKC4fN7xQ0+LcKNn5bJP0UoP5e3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5769
Received-SPF: pass client-ip=40.107.236.115; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_ES1370 is "ES1370", capitalized. Fix the config to account for
that.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 049697b974..5070bc175a 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -228,7 +228,7 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "es1370",
         .args = "-machine q35 -nodefaults "
         "-device es1370,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
-        .objects = "es1370*",
+        .objects = "es1370* ES1370",
     },{
         .name = "sb16",
         .args = "-machine q35 -nodefaults "
-- 
2.28.0



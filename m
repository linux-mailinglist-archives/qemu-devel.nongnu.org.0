Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C46B2FD78C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:55:38 +0100 (CET)
Received: from localhost ([::1]:35528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Hhh-0002dz-B8
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HXs-0001Uf-Nm
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:32 -0500
Received: from mail-bn8nam12on2129.outbound.protection.outlook.com
 ([40.107.237.129]:51169 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HXn-0003o3-Pk
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3r+OXH9SQ14gCGqTN8mdRP53hNqkwjwKSGCVKUvAG5T+roi4EuaoAlSusE/nlLozsOntL3lnNoCwrn0jtfMad5sq+xM+TUD6x3bA1jezHmDEvukBboh7LhJF3cd9usiBHK0pk2QcGMYtbvfSbjADnvVC6+cxc/P6R+QpQ7eWcgj3iwELdi/H0VBTq5WnnlT+sR8KHFKkuU8o+6zJJHRVPsJPHnvQop8GkDAwSYhlF6t3fKzhwWjVdGLO1Kvi94heNIWx/SxfF0O8oSRr3sWRF1LUws+2+cKNKu3gO+k3GA7m/MKLjdpi/xBVazkg9vUEwNfTGShtyjpb0yzaaRNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBH3OZ9a+YW7rSSruXrFY+pZ8ln+GDLj7yrY7CXHmFM=;
 b=J6AcWm/WNx/kYqSnhsVGlK7Gk/1KNq56CdTPb03TVLrG0exUAiEE4oQkPOmySpk3RMpiMw8ASUw84Z0HzIuSbBcx4euJDLBQhQegW0GQlCIUd89lgWZwpftiJoShakdExDjRoBvKtqi4TJO6T2Xkq1C7zKpkscgGcs+n3DtPtwRADr9BYWiAMv3PUA3yUSnWE+tG+2CpXtEBh7fYeZyXpeQvHHQ2a2Zb5kdMvXJiVNf2+oI6U3Ju0s/ipLvNA9qd86mnPWPXLoGYnVSzYILjIMHnybtp68C6v0uH/kGglC7siE1Y2CI9MKOXSvZ/9lJuvmH4aRMVCTEGOcfH0GxYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBH3OZ9a+YW7rSSruXrFY+pZ8ln+GDLj7yrY7CXHmFM=;
 b=ZTjWkL010JhVSmJJdUJcIMgTduBwoS5VbpWQp3EmQe2WbbA0r21ocnYi4qnMcmDEC+eCZbeSKGOlRgoO/OWHOMo7y4w11XkhpvyM6Ogtvtq/r53wL6OoKUC7TnR8wYhQmeIY82kpnD6vmEiUs2tGDG4Cgq8Hz2PMcEWV7I0uMY8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5835.namprd03.prod.outlook.com (2603:10b6:806:113::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 17:45:12 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:45:11 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] docs/fuzz: fix pre-meson path
Date: Wed, 20 Jan 2021 12:44:52 -0500
Message-Id: <20210120174456.275312-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120174456.275312-1-alxndr@bu.edu>
References: <20210120174456.275312-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:91::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.5 via Frontend Transport; Wed, 20 Jan 2021 17:45:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb5a8dd5-75c6-4454-950b-08d8bd6b229b
X-MS-TrafficTypeDiagnostic: SA2PR03MB5835:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5835F3B0662F669B16201168BAA29@SA2PR03MB5835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WDzNCPKgRTWtMeu/OUdkEpHgopgvl2Ftb/WyFiI/UBeC+GHYGDlcgZZPDuDxikIFFNDoIoPNDnrT9+anuIY6FnpZnvnj3rFDTB5Ax5cDx289nls6pENOodiyzJXGlocDlXaZLmViZ5s9I2Kv2TznKauSZ7Vw35A9aYa/QLK5jfKbPBoNnfTxXDfRBkkrI5cxyaM1Wo0q7LdydG9uHZ1h0kBEtm7tCkh9L5TmWDKLUCdtkLd3spmZ94dve/p+KgxsYlhXPF9j/l9xGxjGV9GIC4RT/rbrhy+QriDZrPr9gvJPo/BnLhCgO8ipFDHs88M9O2Pytb4IszHE5NjhO64YEE1npMS2f9GWe5p+HIdWg/dYUbIwSeVevUW96MVnbOqy8+p0edUtGaR9lULzQYbxKyOZ2vCUgIzw1WVFgzuWi6ADuuFoKuyztXopg5bM94STJSy3WdlkUGQv7GzQHoJqq2rVNVTllPDg+In29q4IkCBjPyoTEyZwmdlBHTeGQ22lQ6Mn7ojc2fmsr5rDjybEfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(8676002)(52116002)(4326008)(2616005)(6512007)(6666004)(956004)(54906003)(75432002)(83380400001)(6486002)(5660300002)(16526019)(186003)(1076003)(6506007)(26005)(8936002)(478600001)(6916009)(316002)(786003)(66946007)(66556008)(66476007)(36756003)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Lp+ASy72lEUENiil1Vf6EtYkebZheSsHQLMEhEjfAV2et8VGYcXYtR+tEUJn?=
 =?us-ascii?Q?S00jXYgKLi8QaS3nCgXvo/vEnRI6pFNjTO8W9M7pOSHaCpEam4OiF2fSkO3w?=
 =?us-ascii?Q?Dj+RtWknlKWdtnPLz6pwpy00MCEsG7O/hxKFhOa1sDizUoDEzxa+y4p82jIE?=
 =?us-ascii?Q?TjqwNIGE+bkBWznFy/uXcGvumo7klj1tdXNEkJi8yzo08Lij9j9QK+WpFqVn?=
 =?us-ascii?Q?GjTBK5Kp+PKxaE7i2BupRv2hDLmbyuOw9nuWDS2ElCMfYQqiAZumNjXRbYy0?=
 =?us-ascii?Q?uXRp8YbxBV6maxPUA1gJMdIGJ6c13XJy5RpA5AipBwoUuk4Oi3l2pzgjg9MT?=
 =?us-ascii?Q?fDK/gZKD/e1ZFa6TmRseMO5U/hlR1F8SI0cDg0D23/50bwSoiFnxs6YUu73i?=
 =?us-ascii?Q?Jp//iZdSpXPYJks6K37ZZaseq2d2lwr/B+sX29B22CNNV8CjdrQqcakDkB1Z?=
 =?us-ascii?Q?Uk1cmnDX6Z3NPVmFDnMSu5g4hCd8Y9/QEdDv4iEnjHRoFRlJSTbgt2RQdm2U?=
 =?us-ascii?Q?0rMykpUiBugFcT056/Mi8W8sDgKIT9Iv5YjS1cevZrgDT4qbc74XfZp1km41?=
 =?us-ascii?Q?jL25IYvovS5HVuAuNjgEVgIKozsIO2mCEPZXkRiNNs2n4s+ruwS3RhdSybUA?=
 =?us-ascii?Q?ROSqbsxTV3htUEiHhJ8lDe2dcuDwe5grlPl9uL9SLA+u96v6PwF9fNvSUYUi?=
 =?us-ascii?Q?w5PuLLfGYoA4Jqyk3XUUeApp2ckHuwoWD90Rcu6ikn/D1UyONWfVf6PuecoJ?=
 =?us-ascii?Q?L/+SWCo00Ip9YsiBup7uh981aRBEciUDwGIM2HQZnMWzmKMbjRBN+YU2FK3x?=
 =?us-ascii?Q?xTZ9d+xM1WMsseo0BIDmxZsdUgVMSQB7i2LYZ/s/MdIyCTkeV5rOdVpcLFaL?=
 =?us-ascii?Q?4Lnlwf1/zuklg/mqyBLBcsXHklv1ygcCiWG1xNGVfPsMumqK687NveXxc++9?=
 =?us-ascii?Q?SNpE1gmbyrDLQn0vc0AUqP57Vts/ueZtHIG3+LW0qsoKRLUF9LlyIDBlAYvC?=
 =?us-ascii?Q?HWVj?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5a8dd5-75c6-4454-950b-08d8bd6b229b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:45:11.4845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sDVzhyw5J2ATTCb/4Iq2JPIg/CR0Aw5bNMtGb8LzovrcZjHoifiWwBFmHz/2xUI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5835
Received-SPF: pass client-ip=40.107.237.129; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/fuzzing.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 6096242d99..5f5200c843 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -119,7 +119,7 @@ Adding a new fuzzer
 
 Coverage over virtual devices can be improved by adding additional fuzzers.
 Fuzzers are kept in ``tests/qtest/fuzz/`` and should be added to
-``tests/qtest/fuzz/Makefile.include``
+``tests/qtest/fuzz/meson.build``
 
 Fuzzers can rely on both qtest and libqos to communicate with virtual devices.
 
@@ -128,8 +128,7 @@ Fuzzers can rely on both qtest and libqos to communicate with virtual devices.
 2. Write the fuzzing code using the libqtest/libqos API. See existing fuzzers
    for reference.
 
-3. Register the fuzzer in ``tests/fuzz/Makefile.include`` by appending the
-   corresponding object to fuzz-obj-y
+3. Add the fuzzer to ``tests/qtest/fuzz/meson.build``.
 
 Fuzzers can be more-or-less thought of as special qtest programs which can
 modify the qtest commands and/or qtest command arguments based on inputs
-- 
2.28.0



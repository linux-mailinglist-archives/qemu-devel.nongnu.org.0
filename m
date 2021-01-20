Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37EE2FD72F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:41:01 +0100 (CET)
Received: from localhost ([::1]:52964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HTY-0002jq-Nn
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPU-0000Nb-MP
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:50 -0500
Received: from mail-dm6nam12on2125.outbound.protection.outlook.com
 ([40.107.243.125]:3041 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPT-0002pJ-8v
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmaYzmlxiiW22zGQGw360C+bnXnTPneAii4HBwkOZlt9MPlMo6s+F2MgdZaE3ctge8BLhWY5aMzJ6cXdHG3WP6o5vTIbGnQeJb/AMp9zgaSqjAGVuRMbuNq7LU5c2MvarE88KD+VI3Y8WAXT32WRLmcYb3EGlk98Zty2ZL/FA6joh5RXTe5cES4kOAfGW9zb/kY3/ZBJHzPqMFHKtnkO3RlEyKW130RArldsXv01irVEGUh1SWxpVOObtASpjBnJ0S69GxbVf/wi/3f1m9yGvuvK62KrTrwSPYwvLvq2Dno2Je3TyhWwQx+BH0vB5bTUUdHkeK8h5YwyjN/KV8HPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBH3OZ9a+YW7rSSruXrFY+pZ8ln+GDLj7yrY7CXHmFM=;
 b=PxrG+f5+N9b3giz6wJJ9SWnV2RNXstQv/cHixtiFG1sExhufPRYkyxrD1dZgenwBQrfejzxBWQzT9dWQHuTneqvRYUVnFccgXsEUQ8B/oGgLeBJtbO0Kr5wV462vcGfLXVGolr+q+pKwBg67OyTnY10UUZBQgTcFygfMyjwkgqhMVOLu6re59sev2DRUIhPQ2sq7TFgn26cS0e80izRFbdazsyOKOTLX0ZNQdGiry/Sr693HiPWLM9+fgp1LLEh04Biyi7f9KD9zAWlyMeMnXEFH77uc4xGOxlWRvLF8QAzWsy4Y9sl0/616QBuVmt9R5VaXuoCPHA1SWl8uFSC4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBH3OZ9a+YW7rSSruXrFY+pZ8ln+GDLj7yrY7CXHmFM=;
 b=Ms49hZ34BMgCn4y73XiLg5OAHPnhgyS6KOWWoN5Bn6zDeQSHE/rD2oYSchycbrRp7TKWlYVdw6u2rBUxqwN1gdJ39yljHM7s9Do2l/UmH0giMFtSS+1+ScNhB/a5JKPYnHkyAu+MXh3aq75eBBK0BVVZyABxln5FjqqMakpaTIw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5530.namprd03.prod.outlook.com (2603:10b6:806:b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Wed, 20 Jan
 2021 17:36:39 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:39 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] docs/fuzz: fix pre-meson path
Date: Wed, 20 Jan 2021 12:35:27 -0500
Message-Id: <20210120173536.265601-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120173536.265601-1-alxndr@bu.edu>
References: <20210120173536.265601-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::27) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.8 via Frontend
 Transport; Wed, 20 Jan 2021 17:36:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84f197b0-f878-417e-9a55-08d8bd69f166
X-MS-TrafficTypeDiagnostic: SA0PR03MB5530:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5530E6774B2618F87758D3E4BAA20@SA0PR03MB5530.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uDM51vsmkwjk6tKIWkL99FQl9JA9ousVXl8bI2JndCi7iHINcQXrvHy8whxFoN2Z3wkRL3IVpK88E2Jd3BQ1Sxi4fCSvhfomZkAwLhDfLKXA1PX9vQouMdSn8uWBXtcZtPn0RKZw+4UqQgBIiLYIK9FDXCo+FhRiTOag14NfQBYu1uXLEhRtEPJ0xrahlqe2Z/h5Rq/ffMP7Tz0hzg2pUdG9FHq6AtfuTwfwYJUy7x11wb2yxj70MaLQtF2Ka2VFamnWvHyzpazZx4WUqY62J5G1XVWFn+t2oCzOkdlHiJ3lKs/QP2jjCFuSY44jFYd2T7v+TRVpFkIv9ASwq0vsQzJFOcC/ZY6u4IhiKSLUeLvoioNt2Ntw8lK9Idl6tY6MmezhiZLzt08HyjTBIUoM2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(8936002)(6512007)(66476007)(6486002)(8676002)(956004)(5660300002)(4326008)(2616005)(1076003)(75432002)(2906002)(66556008)(86362001)(83380400001)(6916009)(52116002)(186003)(6506007)(16526019)(498600001)(36756003)(54906003)(66946007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?e0akEccsWDv/MY7Jma3bn8e2uzLETG54kooot6ccuF7JsxkmrbRasbTFvcye?=
 =?us-ascii?Q?IV4OnXOsJp34eOa4jwgDXOHLqCL1YaSOmM2O581EG/BhTB7FUySrQAr22prP?=
 =?us-ascii?Q?gqlh5CY+ybADhn82WpZqhgIO8KAibXcB4aA/5hqL3m0AAUsYuoUG2HdhuwqK?=
 =?us-ascii?Q?FDjfjHe2N/PrB7QEhtyy5w+w7LhdeEw1F3PuLg38NhhWDzc4r7Nxz5xYDenJ?=
 =?us-ascii?Q?oE1HHt9V/D4WRsTHKsWp3a0ybjWO/aQKzv5JCjCM65wjlU6xkgo3zyr/KkQN?=
 =?us-ascii?Q?CtOZwbcmDsmYLNvtMpUrnBVdpFe/OBKOgmL7YZzmzmzSUp72M6Q0GMdVTg7d?=
 =?us-ascii?Q?Xra7XsnuQuEo0ZAdV052H/DfKgdUO/ruJl3n/thU8x3xBiTPsxvdWCfUO6ty?=
 =?us-ascii?Q?yiu88scKOzIJGHDHIlGEjBoaaXOPUtwrAQhLqXg9pQDiaPlYTdMFZfGPw4GC?=
 =?us-ascii?Q?itCuPYUWrIsgMsqNH+UDacw7c1Fll6Uv67c/9xwwaySRFS42liqgCLp2FE1Z?=
 =?us-ascii?Q?VLsI4ogp45TCvN0Xrf/pdgf5qq2zeKgVx7WoYGmauo6ernov0rZf6EWYiIyn?=
 =?us-ascii?Q?TegubnX+KEsYQiox3dx11+jrQRPe58AMSaGUBCv5edwf4/VH/gA1excjYU9P?=
 =?us-ascii?Q?v1PkyzNN9pwvVOew8hL3KRxd5vQ5JuVtQr5MDurhXmEvw95QX2J5k/+99xQB?=
 =?us-ascii?Q?AZbBsTgf7Q6G7YbLMV8Ox1KYvyaeGJtvgh5+XhG4ZfXxHRT1JMwwDXGu+3ny?=
 =?us-ascii?Q?r0HbtXEDVxbJ72x5VaMymJlWjTnyz/TfSrvH6n7rfUrXfBg36vjj8Gf8x/ne?=
 =?us-ascii?Q?erhx2PlVt9Gvk9tPdPqepLZpEc1OQHaZRoHAdncCJrXVXtllOU76yA0ObMxQ?=
 =?us-ascii?Q?EGHmbhgL4CdT/74p/H3Ybw7qCnKl8Q+5MEBFNt21XINO4CL8KZYecicJbVJI?=
 =?us-ascii?Q?uivhzQ9VLlrYDw0oaqfDCvNq+A5mkdvPaovT9BshD0gxo6pVuS+iKP42LlFF?=
 =?us-ascii?Q?PHW+?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f197b0-f878-417e-9a55-08d8bd69f166
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:39.6611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBEWD48l8zq0npr9GJyzn1ulcbislgf6qr4EUQ+sCUFEgzGAymxSaSCZs9bfAIt9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5530
Received-SPF: pass client-ip=40.107.243.125; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD20302AD6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:55:02 +0100 (CET)
Received: from localhost ([::1]:54420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l470v-0001Py-Jm
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46uY-0004Gv-Qi
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:26 -0500
Received: from mail-bn8nam12on2112.outbound.protection.outlook.com
 ([40.107.237.112]:16865 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l46uX-0004xv-Br
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:48:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQlb3D1/IWxJzR71oPRVHBCTVcJ7QCB5v/DOpRI/mscRIP4KKRX4MTufq8+Ddbtx7fr+cXK4e7B4C9dBHmUZwcKuozc9qa8D4nrTGHEa2+biRoZptkVfwpmU54pnaDR06fidSnO+rKIpL4LZdb9eu3lOEYT+83aQ6gBIXvN4xygAXvRxNCQDHwivlRyuOf8FD3wryD7wddO4zBg8v03v2R2X9yUsSkjRjX0/5kXNenpaALd9INcp7wfPqfTMuNPKaGhtk/dGTbZDOQ6UebOIXi/8LmVfrhCDQsOEf7S5umMjUjC7kIBQa9KEY9R5k5fkT9YHLRVuQaasm/6ZOdJALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKhZzirZlY5afJ3k8Rr3cJRwlVVQsq5KvAELkjj9Mwg=;
 b=WeKTi0mtpd0GDRC/QBQK2k//yKAIW3w06tU6jVELIvaobieeC3GLRowaQ+nYGH5F6ZU8m0JWa+V0r24CKdI0Mw7xK5SjPHC2r3ZWjHPhw65C1XkYI09bbzHMFIU3yO3iN0dVHA3worJcdZVaTgBO2RvLJjhFqSWJlugopfa02f7w13St5GjZ1o3rNPF035vvC+ykd22EDcS8O31YNr4RYN5NqKhwpewuY0Qha9IBCQeDlpgS4fdiBAA4P0iiWxxh1cR2R0/HJhlyBFJ3+MtSVANg6rKLb5joa4tWwoK6D5hy/UU5ygSE2R+da+RLXq37AW2eoAxgB68c2VHkWSOxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKhZzirZlY5afJ3k8Rr3cJRwlVVQsq5KvAELkjj9Mwg=;
 b=Mh2/3X1cjYdJthgzWYsGnq8m7LK7JTInAPEyUGXOnvWoAKO9G0U8xN58JeZPJ89jBCW+DbwPjTlphSWkV1nqc1inSnJCCl/LYvlWEKndWTi8P0o/pvW8mIaPI5WOL+Emb9dRYUW/1mE7XOamp6BcXaQktStIKPoB9SvWDEhY04E=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5563.namprd03.prod.outlook.com (2603:10b6:806:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 18:48:11 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.015; Mon, 25 Jan 2021
 18:48:11 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Subject: [RESEND PULL 3/7] docs/fuzz: fix pre-meson path
Date: Mon, 25 Jan 2021 13:47:52 -0500
Message-Id: <20210125184756.319453-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210125184756.319453-1-alxndr@bu.edu>
References: <20210125184756.319453-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:23a::11) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR03CA0006.namprd03.prod.outlook.com (2603:10b6:208:23a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 18:48:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a9436d8-edf0-431a-59cd-08d8c161c3a4
X-MS-TrafficTypeDiagnostic: SA0PR03MB5563:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5563CEC40120B20187957C1FBABD9@SA0PR03MB5563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cUZn8yurJDxGwR6xC79pmNR7fDO3CXqOZQm/TY80HrDXDhvcfus5EwGEpqCBw9m/sN7HSAyzbye3sUAFCcOrQrRRxZHU/yEz3sqGC9FZZIffgeHmMw/LwDfgL5AA1ZMc9MXo4D6zEFGdNRLf0LE7cQEIWI/4YrPMYztoSJbBaIuU1VL9fkYCYChKO+/HGubvm0aqZG2o/Ucv4TGcgUvjk7akEkEUAhQGeJ1xC5YXfrdaaf/cdJ3ultD8/IeF79XNmv+OoWE6kr4J+mvEjHX0Ql6JZQrB5DGyS0VXMi78h1Z13EVubxDHcFTOC2VD/gHRsLc7ZTSas7MBYKbx74V7FyCgYSYGB4XcSsP/bEBq/1+xT3zkWxaaloXodvFrTCqHS2jTPdS6cGvKX6Ed2oKp0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(1076003)(75432002)(478600001)(6666004)(956004)(786003)(86362001)(52116002)(2616005)(54906003)(2906002)(316002)(83380400001)(8936002)(36756003)(66946007)(6512007)(6486002)(16526019)(186003)(66556008)(8676002)(26005)(4326008)(66476007)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BrY+hKIbSuP1983ugkGkfMkr0xX+YCwUETuQ9Mwcc1bUCwv6qzjXHpOBDY8B?=
 =?us-ascii?Q?rQwesdqNE70wIffuoD0QCNpOe2y4bJLVPo2ubFU1KPfJ2ybUpBiqKTmEfESc?=
 =?us-ascii?Q?WvsScAEjEHIWehnonp9zHQbdUxpseSnyRnqy+yp40YtZpE5P1JVm2v2QFSdQ?=
 =?us-ascii?Q?lQMfR00got8QJt2uxBvB9h1SqFeRzVQsZzj5C6fCUMGpdeEO2kvh4ysl1hXa?=
 =?us-ascii?Q?CDEpWXI1Xs5YPf+KQzx0/fRsF0TVixGEj0j4w6RiW1XNPqU82iCC/7+uEe5J?=
 =?us-ascii?Q?izAMUJqLfofWUF3JBtj0eCWwoQqRT4IZl3nvsrwMS2mT+3SIoo3QSBHxGqK8?=
 =?us-ascii?Q?tOZaP3KtSAQWHKrEy5AWQAslpLXLVJhMBqlUyzKe4599o/BtDFU7wB/ch8sF?=
 =?us-ascii?Q?pcc37IWBy5xuTSDgEKx5uKErZLCntRcEHCHPj1f4QRMC+16fW0UlHv+0OEcJ?=
 =?us-ascii?Q?Re9s1rXzFDpTieudsxzd6PLmLTe11yRTE58z46rl3Hn48j+I2FObUNEcNKzF?=
 =?us-ascii?Q?E5pFrhMj4azFp7L5SUtyyKpVCyN/YEoteMeUc3xkP1dZc5jytmz40zxLE1gU?=
 =?us-ascii?Q?O+ziRH1LQ/p1UT7LTWntgNI5NjbTPuuLLM6ldSuA+EstJBS+KMB+tX7Qwudz?=
 =?us-ascii?Q?NcZ4a5mgaZ0pqcZlGRIyLhBQiCK+94a78LLeHdjXu3LsvOJLS1vUDS8dX9xG?=
 =?us-ascii?Q?mX8+sBAXIQvUDd/A9eqr9qVSTG7Go1SsFryA3AAeX8R0zZgltAoMemAa0TEW?=
 =?us-ascii?Q?lv8vYi4YUQEJAHmHxWkZ6DWhrrpAC1PFsNCh16TRpDGbEOryjqdgc90VKKSa?=
 =?us-ascii?Q?snowQi0DY5CLEa+sYIkUBcbwClU8IsCatRWk+7V1qw77Z9UKojynlrInlaWL?=
 =?us-ascii?Q?LjomQU/v+ZHRxvVlfpZo3CU1DD+taVnkrwM9TOdQ3G317n2oyauKSetFyoxG?=
 =?us-ascii?Q?e8TOlltbjgOSSMF9Q9MwFAZWlOymwQZ9Hx2yj4yP6N4YThWuKwz6wPJAnn3H?=
 =?us-ascii?Q?8jFxfJgAJ6lH6aNwwpicUUyptCVVvIvuPha0MUJHg052Dl2SUaCtHbr8CSp/?=
 =?us-ascii?Q?wYJcreWv?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9436d8-edf0-431a-59cd-08d8c161c3a4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:48:11.7967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQJuhCPWHNe4u79KSeIYRpd32lsIzfpUJ2mte3cIFcwmIxRP654FGTcm5bxKv8Y6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5563
Received-SPF: pass client-ip=40.107.237.112; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 philmd@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210117201014.271610-2-alxndr@bu.edu>
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



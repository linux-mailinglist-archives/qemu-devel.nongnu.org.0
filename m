Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD63B25B0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 05:47:08 +0200 (CEST)
Received: from localhost ([::1]:54330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwGKZ-0004np-55
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 23:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lwGIr-0002ox-18
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 23:45:21 -0400
Received: from mail-co1nam11on2137.outbound.protection.outlook.com
 ([40.107.220.137]:20321 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lwGIp-0004RN-7E
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 23:45:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dn59UAL0u90ooLtUYaN2IZ89eDJ7F6Mu7ue+ef1U+oOVMbr04jPZxTCoEwgDsGX7BXtd8Tp4PIq7os4xnqabh34JmCAxSYR54KwottL7lkYhlGATnqX51wLPy9j39IyqSgye1kJ2udIjy0q+eATcbp07Mu1QoWSfQkkawFoa0Wjr407lUB5v3b/tvfSM0H+UKhxGRxBODRDEwsgWnGQa6clWZj/nO3puvTtUCWEyat+kam+f4ZglSF5gXxikzyZ22+gVbQt9U3HRBLIZSIZRZlNIwGeeVMbFfEiiXVB5A0HSMtyOK4Z0T+AcbjmAfLcMaBy48aexlo8M9a8mo1CCPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fev/o/Jsh8IZMs20nZYX8TmwnT1iXCsQgdT2cdzqxfI=;
 b=hGPfh/a+g79yhTz7e6xTR2444yAk3bg1B02UboxiqJMgmQDnOfooKkMZXNeltAhaJNrRWIfE4TA3XOzegpchIFPJI4A7MkIgeinuNbi3lmCVGfSwk0t2dsJBIpHKDskJcWpQXCtdAg0vtk93IXKH8eMh+XaB85pcg1EH+unGsyw66apu9BVtC3EeMv6ZzL7pZncEbU4Ov/k/9vNv4FDRMu6OEsloYa/TVPo8m3dslGVhuLdI/9JhMXIlNyVk4MW2m5yP4gUZpGgJz3OIynnsCUy15nCnKGY4d9qybyuvmhAGL75serTY3kgqggfEWjqRAlt2sEZyS7Avre3XvUH/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fev/o/Jsh8IZMs20nZYX8TmwnT1iXCsQgdT2cdzqxfI=;
 b=biry2KGmSu5SENWl7zM+u+GvmvkffoLnmwcLjaqrrUZiiOlXY/ttkkCEcO4XTdTUopt9YJOtmRBjtbsBYuf98a+pfcuGZdQYGsSFeUI2Crl/itrJ+CrczgZ4gLtxZ3f/pjPbwaqtUm1SOJim4Hqz+pLan6GJq++qnZIwrBg+/40=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3680.namprd03.prod.outlook.com (2603:10b6:805:49::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 03:45:14 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.023; Thu, 24 Jun 2021
 03:45:14 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] Miscellaneous fuzzer changes
Date: Wed, 23 Jun 2021 23:44:59 -0400
Message-Id: <20210624034503.86256-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 03:45:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18305eb4-4560-44bd-4eab-08d936c27956
X-MS-TrafficTypeDiagnostic: SN6PR03MB3680:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3680E88939B935AF8A408C48BA079@SN6PR03MB3680.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 93SBMELv6SFjC7BfDRZGltYeP+rKxdvv8z/fImCVnwR6zis1O9OyEKJtxXOzXcH5CTZat+Y7IVLCZXRVbH1xjmdyACQyTxdlaEmUdm/KatX/xq+cpKP7Y7hm+1T8/MIel663GmSEL5YbpDfB/lwK6CrRAQRc3fz3G48MVuL1lBGVc4x3LQHulnVYnYiSHoRESQwhGMDqAIJYCBV+j/0OAWZb/VLNUpT8aULnc7gNtUX7dGadixMuGB4R4x7j0shtVgPb5btCF9VJbDBbbWE2QcP3LXNcJrq1vpruZGqmy6DFXyqQyZsAWCZ+MY8Mo2YWruM/SrWDwsxwt0EpRiRKX3thchauQEnvN7m6WNxxleFdhARQc1EVx/bHb8Q0JOJCF/cNvEEeoafkHqKLCBcnysIBz8DqO2nIB51fM0n12sCdfIw/VkvPZOoox637WZBFuAkXVbo+u3FS6N00ESRq9bZ2yHHZheQxyTNqw4rOygpSPH6DhEk8uzB15jhDEWKJQ9VC2xebCllmcLQJOy7ps1z7Eldp3CYW00uBeBC1MRHZKfyuLrVMHbn3I/MYv41qb2cIcAHAOQpDX2dN6dm6BOcvU9nvI94NhKR6DIK4fnwLoA9D33iVXE+coGKb4XUjGo97BbhuoJYLnliaPRw+Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(6666004)(6506007)(52116002)(786003)(316002)(54906003)(38350700002)(38100700002)(2906002)(2616005)(6512007)(6916009)(956004)(6486002)(8676002)(75432002)(4744005)(1076003)(66556008)(66476007)(86362001)(66946007)(16526019)(26005)(186003)(4326008)(8936002)(83380400001)(5660300002)(36756003)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aHu+QzJ0hQyY5tlb6mJQHQtDI1HzkfmqmVTqLlb+BFfQGVWVYiKRqkKos6ch?=
 =?us-ascii?Q?nJgFTZ79KY6ehaGDdHl74dPecb4WRmeZfv2mfyHftTVxfYMgen4ixvbjxKuq?=
 =?us-ascii?Q?VKF7Cv/HLNcLbcOSDA5+ynd9xkQMhE3ovT5NOsMOpjgRC4KdGXzPE7qu4pJ/?=
 =?us-ascii?Q?EsUPWseZQxH4ZcS3snGzSKQImzuRAEu1xk3RNp5zQd4lB/u5YkdKl+QaOQJD?=
 =?us-ascii?Q?NUEZGQtFvTKX/LyXc02qxN9MxjI4bqcVKwyPKMZYLFZq75pR50iROS6MQKYP?=
 =?us-ascii?Q?XR1HCc2vEwfrZVfw4ifzqHCotLf7i7Z3GsYvGmLu/VSLJaNCF4tgxy3n+SwV?=
 =?us-ascii?Q?ITBxNDwCd0Y9UaShGRQcBIkluVxnox0y6DdhP6nJgRM2IYeaMODX/sEM5BvK?=
 =?us-ascii?Q?0YbeaMbbWw0cg7TKVjeU6acntI1ZgXakkEPlVBF4Sq1M5usSGXPexpCz6nlD?=
 =?us-ascii?Q?XivH0FvYqxQccKSL9BurL+WWR6q359vkAROl76cY9cXrmy05VsNWT6n61P45?=
 =?us-ascii?Q?93OTZdUK4yj9xukWYbjIAirvqhnvZJ1hlL3AYNiJmN7jxeXdCi8s4yJzgUVQ?=
 =?us-ascii?Q?P4RhImySHQKPTWGHZcODVW+FRSeSiR+yQMP1RR3dUmwbwXMoZZgLQzHH3mVD?=
 =?us-ascii?Q?5+yk4V4caHJKEhwIzgLEPjeKkHfkKImPW7SzPRV69UZu0LUYY+5huLVoIGS8?=
 =?us-ascii?Q?zKKY3DTRwffXir7d5bJwHfdZm9RddQRFg5jxaJQ/QNmsXRtjJzYZoisiNTV7?=
 =?us-ascii?Q?Jd+gRe5jD4xhWdTG5IHfTYybk8D6LbhPuwmwhlN2omZ70FElhhxpCEzY+x0z?=
 =?us-ascii?Q?fFfOzCK00EbNa+PDplKEFxY3Vd6le2ZT831G8DfO7eGBZXxf78+gg/kRi2d1?=
 =?us-ascii?Q?gkkOZ6KxZ+ZUdu0m82kYyfUf9m5je1CP+Fzi+uEh0f0tSP8ocMgOneuiHEct?=
 =?us-ascii?Q?h50QzDoaGrxXpbwk3Y8b2zqFeB4WhJIMO6FRAnuAQql5XTxjFlu8Y87X7Edc?=
 =?us-ascii?Q?sWKofSMoNUj85+6zP2SxmfMerVKDHcqcGqDRyjd6Twz+0ZARbvsf+25Y72me?=
 =?us-ascii?Q?vkQK8oWDI0OKbmyCY/X3CwvQOMyujF5yG/NVqlDUVCfzfFW8CBPoBAjdkpYK?=
 =?us-ascii?Q?OqhyAqGBjwOZVnBEe2ShKLxkk2odjTHEsSgonjEo9/9b7wKPeTK8C3suaIl7?=
 =?us-ascii?Q?angsjG/nbcgeGN5rBLSOSse6+Vo7si4nNnaSNDX+G5i7tYvgdXoO2u/FMZt+?=
 =?us-ascii?Q?1M/ZW9eQX3sM1O1Jnns4aJBAnBWUyQ8NvGWmNYh57atjGR5CpTpJJHfY1Fua?=
 =?us-ascii?Q?3/hc1BGFwqurS5XifBvIdtt5?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 18305eb4-4560-44bd-4eab-08d936c27956
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 03:45:13.9638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7h6O2cAajoMqzngttOpLapD3TaZBCEylZ81jxpFz8uHcyuCbkGk67qrSCtJzoYQ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3680
Received-SPF: pass client-ip=40.107.220.137; envelope-from=alxndr@bu.edu;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
Cc: darren.kenny@oracle.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3:
    - Check in ./configure whether clang supports -fsanitize-coverage-allowlist
v2:
    - Add the instrumentation filter to the instrumentation filter patch

These patches
1.) Change generic-fuzzer timeouts so they are reconfigured prior to
each individual IO command, to allow for longer-running inputs
2.) Add an instrumentation filter to prevent libfuzzer from tracking
noisy/irrelevant parts of the code.
3.) Fix the AC97 and ES1370 fuzzer configs

Alexander Bulekov (4):
  fuzz: adjust timeout to allow for longer inputs
  fuzz: add an instrumentation filter
  fuzz: fix the AC97 generic-fuzzer config.
  fuzz: fix the ES1370 generic-fuzzer config.

 configure                               | 11 +++++++++++
 scripts/oss-fuzz/instrumentation-filter | 14 ++++++++++++++
 tests/qtest/fuzz/generic_fuzz.c         | 13 +++++++++----
 tests/qtest/fuzz/generic_fuzz_configs.h |  4 ++--
 4 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter

-- 
2.28.0



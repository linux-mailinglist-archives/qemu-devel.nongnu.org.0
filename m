Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5E62FD75F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:44:22 +0100 (CET)
Received: from localhost ([::1]:33318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HWn-0006P8-3E
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPX-0000Q9-HC
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:51 -0500
Received: from mail-bn7nam10on2095.outbound.protection.outlook.com
 ([40.107.92.95]:32454 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPO-0002pL-18
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qe36lEcfVLsnplQ8CWdE9vcy9SY8EO1p6w2ZfRU1ydbJX/JYgIx+swu2Qh7Hl2S9vLw2vP0qY4vmPdBPvMut2CbAhHSygM1zede8bkbZMnzL661aUx5iOK7jdK9ebMPISIcuXY26uGT1lMqMd8wgjQdcgt0zrAb/L58wM5xRpe5ds1BOCFryIkYDnggmUtAkuWXYAhw/3brHZHmXDRwwNKeQTvQVyk03eKl3nqpzaU+lFqiRAkPHobIr6D2BES3MG8tk5asrvgYa1mNW8gptYQ6L+5WMW45ySmx91dbOK0fUiqa8ZLxE4fmwPmcdOXMCayWJ7/FrxzH+BYOgPI/T5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QTsd+pQMELg0Hc5szEeFLuvthii0X/22zfsUX1BwyU=;
 b=n+3nkaWZNRkAfRU75mLoy0n0VA/9yDOb5EHTkg2xfK0yHmhLD7Ncsvbsacy6JpyZlXHgrb5cRNc+gJExEJJzBAg8csszZCU4I4TP03Nbsww55C9ptE9A+2hZIhPctZr+XNdcjApkkQhAdyjgukLwar4xjv1hmxLcpsLQC2h/BzoG9TDYOH3yo1WZVZwf0HsXg87/CwZZHR5CDASK+fBaZBQo20KTOm2jbtZ9Jj47BRkboiWfxkn6Duh709uAMfpdRDrVf936catzZlrwaNKGs/8IAr2itMGISVQt5BAhJK9UU6Bk6kPfm98JTleaMhBJNA7GDQxV/XNBLS4O1BrhtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QTsd+pQMELg0Hc5szEeFLuvthii0X/22zfsUX1BwyU=;
 b=M1qx4UAVVNrX0iMSvun2iipUDmMTc7idwDx07k1gMiA+UgnyNhtwg3qodkpS0t9eOICCnOoA0HOqEHK7NHBBdMskACaV4L7hHPTzMXoVUge0wQ0+0Af+5OOAAorpwAvLLBjhl2S497cynnY32uLLhzyVOSMdxc4GKD++Yt6t8sc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5482.namprd03.prod.outlook.com (2603:10b6:806:b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 17:36:30 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:30 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] 2021-01-20 fuzzing patches
Date: Wed, 20 Jan 2021 12:35:22 -0500
Message-Id: <20210120173536.265601-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
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
 Transport; Wed, 20 Jan 2021 17:36:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a7af209-d261-4670-7ab3-08d8bd69ec12
X-MS-TrafficTypeDiagnostic: SA0PR03MB5482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5482D783137471BF5DAB7B32BAA20@SA0PR03MB5482.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c0H+DmD8cYocawqaQgzz5ydJjxIS7E4yGtPw6zPZjAWRnvEYHNAzQx18PBuAFn7nXlnyHJlSEZVfLO7QhIBmEgZ/eaaDHlZt4i+QDBzLAOk276yQzct4zzbf4TkWXk7RSTMwrGNqo7f32vcsyJde7b7LVkuuhMiyatVXNHkG6Qm0B12Zt7X+ybkhXi3FeMBluPMJcmIrAYu9eKldVhnwjipScAHYbLEkV201K515b6B9ss889k9mv/S2wO2frv7YNatfqKLy3715WhmQaOr+UB8wJ7oBQmsfuiEVbf0JRn86yyZIMA26TVlK6MFjB2BuCle63lHKnxyQtVZnsa6rHpwn8zI3on4mJFZrCkHE09DzWJUZzPPuqTAyYtf3xJkuGIbtR7HlkSjZq1Sj7jR2acPPdJfGtcAMjEFkh6Ea8WDA8kfwAszNovZ+3782lK0ANFfaIbrbE5kvlz7pI1yHYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(6506007)(26005)(66556008)(186003)(6512007)(66946007)(5660300002)(86362001)(83380400001)(6916009)(66476007)(956004)(16526019)(2616005)(54906003)(6666004)(1076003)(4326008)(2906002)(8676002)(52116002)(316002)(36756003)(8936002)(786003)(966005)(75432002)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QlHYwkfrHUyDu8JrDPintW/qet38TPbvcFigkGMGHe1jrJeKYbkyUN5x5tVN?=
 =?us-ascii?Q?17jpK22EQrXPTefOj1CH+1bE8L4qyV5QUvTg9XlX9S+AMZ+bMtyQ+9ZFF6OX?=
 =?us-ascii?Q?pDtLAqQv1lmALLSgPbPFeR4fLbaLHyucFZchjxIGPOl9u9sVnaRpq/DF7VvX?=
 =?us-ascii?Q?3mMtf05lrlyEQFTOCfp+cN8+JMEdECCrfAanKhHcFK5ZS2k9OFnahEXhUvfv?=
 =?us-ascii?Q?gUssJmaoi0d9r5VKcTpQ6cdj/biSnJWq1f83m0YPhvykVnAX+BEQOx4X3hhl?=
 =?us-ascii?Q?e8NnlxjjM7rUB3B7JG9y1upYVTJw7S59bMw3B3e7Rh3/B2WfgpCDeJr/TK02?=
 =?us-ascii?Q?j6+yMoCcRs2N+BMwM8DO08vCONAJaeW4nONnblYRaI2nBD6KkH2bKFtn8+Xb?=
 =?us-ascii?Q?DmO0GsbCSVXGtZO1USR5pX3Cc50N0cr7ht74TU0Wzx6eF693QVTon4lGoabL?=
 =?us-ascii?Q?mb+NtWpq3G8hdNn7bhGLA9zNwNIn90U8kKHAlXBD5BDH5VNSPpSg94V7dKiv?=
 =?us-ascii?Q?6O2ef28YKVHjDwQZ7hcWzhANfO/C+2RMjUpi6uUB/JGy7ps0jldy87ul1X8P?=
 =?us-ascii?Q?Wjg/ixkhMYdeT+kMLI5CZ7N7+DgBnRcZh0KRcIJvWwKqmkf304AlqCBTUliv?=
 =?us-ascii?Q?avCpPKu/4ZQbr5nhbKz/q6gF029a8o8qSYIVDh7sbEGDaF2kSL5rjeOacJYk?=
 =?us-ascii?Q?kH2ToM1i9Ce9WvwTSyRv0+xzmxV7/v2qVgmoSAr3JvqdjqcrL7chQq7dtXUs?=
 =?us-ascii?Q?q4RWhTwLnvSgC1Jyl2WCVs0Lluhs55IOhpIANP/p2PbAxe7T6BiXIZv/qiLT?=
 =?us-ascii?Q?T2iEXa+v1fPeHlghDBGi6qWdH5sxFM1wd/KliC3YP8Xgmz7ZI6U2brT8+ucA?=
 =?us-ascii?Q?Y8Yl1/7W59dkrMvnUd7CoztSW5lSlbwqA6brONC9T28LnxPEyTCgzZnO45II?=
 =?us-ascii?Q?V3pgLfu85/f7dFiEgJrN8kzxb6zU9Gk8wyGYgtNzEV1vbSC323jSQiega3Vc?=
 =?us-ascii?Q?HZBY?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7af209-d261-4670-7ab3-08d8bd69ec12
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:30.4923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCxdlAIvr7P71YgJc3T+ZCrcM1beEYepPGXNZ14EOXu95HOfxlJQ8ggMejhHHTNm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5482
Received-SPF: pass client-ip=40.107.92.95; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

The following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210119-1' into staging (2021-01-19 15:47:23 +0000)

are available in the Git repository at:

  https://gitlab.com/a1xndr/qemu.git tags/pull-request-2021-01-20

for you to fetch changes up to fae446ae7b6f746377186b3e19fd3f732a8b4325:

  fuzz: add virtio-9p configurations for fuzzing (2021-01-20 12:30:26 -0500)

----------------------------------------------------------------
* Add fuzzer configs for virtio-9p
* Add fuzzer configs for PATA/SATA ide-hd and atapi devices
* Remove a DMA callback check that was limitting the fuzzer
* Improve debug info and documentation

----------------------------------------------------------------
Alexander Bulekov (7):
      fuzz: ignore address_space_map is_write flag
      fuzz: refine the ide/ahci fuzzer configs
      docs/fuzz: fix pre-meson path
      fuzz: log the arguments used to initialize QEMU
      fuzz: enable dynamic args for generic-fuzz configs
      docs/fuzz: add some information about OSS-Fuzz
      fuzz: add virtio-9p configurations for fuzzing

 docs/devel/fuzzing.rst                  | 31 ++++++++++++++++++++++++++++---
 include/exec/memory.h                   |  8 +++-----
 include/exec/memory_ldst_cached.h.inc   |  6 +++---
 memory_ldst.c.inc                       |  8 ++++----
 softmmu/memory.c                        |  5 ++---
 softmmu/physmem.c                       |  4 ++--
 tests/qtest/fuzz/fuzz.c                 | 11 ++++++++++-
 tests/qtest/fuzz/generic_fuzz.c         | 19 ++++++++++++-------
 tests/qtest/fuzz/generic_fuzz_configs.h | 41 ++++++++++++++++++++++++++++++++++++++++-
 9 files changed, 104 insertions(+), 29 deletions(-)

Alexander Bulekov (7):
  fuzz: ignore address_space_map is_write flag
  fuzz: refine the ide/ahci fuzzer configs
  docs/fuzz: fix pre-meson path
  fuzz: log the arguments used to initialize QEMU
  fuzz: enable dynamic args for generic-fuzz configs
  docs/fuzz: add some information about OSS-Fuzz
  fuzz: add virtio-9p configurations for fuzzing

 docs/devel/fuzzing.rst                  | 31 +++++++++++++++++--
 include/exec/memory.h                   |  8 ++---
 include/exec/memory_ldst_cached.h.inc   |  6 ++--
 memory_ldst.c.inc                       |  8 ++---
 softmmu/memory.c                        |  5 ++-
 softmmu/physmem.c                       |  4 +--
 tests/qtest/fuzz/fuzz.c                 | 11 ++++++-
 tests/qtest/fuzz/generic_fuzz.c         | 19 +++++++-----
 tests/qtest/fuzz/generic_fuzz_configs.h | 41 ++++++++++++++++++++++++-
 9 files changed, 104 insertions(+), 29 deletions(-)

-- 
2.28.0



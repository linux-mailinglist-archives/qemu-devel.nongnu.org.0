Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858413B7C45
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 05:47:57 +0200 (CEST)
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyRCe-0000EM-KX
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 23:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lyRBV-0007fs-Rz
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 23:46:45 -0400
Received: from mail-mw2nam12on20714.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::714]:40352
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lyRBR-0002Zn-3G
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 23:46:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmXegVbcCt4BkfNaG5oiZd5aQ+U4ilzMkWp2o9rgvbmP7H1we4sWvxVWeUCof+O/4m62/e5q3IFWo8jqt5UzDmXKclA+dDE/gSMW3BsMAiPqiyg8Dj8UluNpu9pdohiLjImh/0/5LrXv1eLuR9RHlRMzymXKky9bvkeKrlGFUzFFpCCt5oyv7UeWpMvFg7TG5zx2fZWOwDln2sPozowkNbsrsG59jvl4vqFI+Xbgr51F8y67n5OOztYohn8mF41QjCqT3Z8TNNNmcyHhLBoykFc7jtCWr6jH9wnhzrfEHn/Po168qyHUKhL92SOoWZFact2c2/Lm+GqFmNtu3EsopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzG5iHA5b88VsXXflDGyXn/F8RlHtyiLApJLlzZe9mg=;
 b=XAJmvDDW0o2etdbDBKcskz+KdM20bGgLMBR2mfP9O9tnnYnPqN46BFR+DiOnzmR230Ywu1x0/G4zAFcauMGpgz+46jz9MsF+Hf+UooE0oZV8b9faywCl3B+U+Rbq1KWoNxoul4s5vyk1yM6QBHw7Bg+GnPN0p4PPSqKJ8zOsL/cEt5oecEP9QaEFBV2Sh0TI5+STZSS+/0SAh8Opa2Y8mZaDVrU0TXiXVykCWI7ARrmcnXLoZ+fuSYZCcpGTzU2XgFJexASrA3UM+jTLz1WAzx8dtq0jJG7JQRmzt4eNGTSp+SABEh1KOH0NvnHWAfiSW1do4jLIHyotqOp3T6B5AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzG5iHA5b88VsXXflDGyXn/F8RlHtyiLApJLlzZe9mg=;
 b=VUqmQf3K1tkuIkyjB3BZPgsXUWHCuk6DxPMzk0erMq5Sk9HbpJawuiDDDMUhCWoeLrkT/UiyZJMah2Nrp949cnGLhg3nQantRcU9rtzi0M4szvfBTDMnobtKA0Q8zOButK3PxRISqfJZ+L+Y9HOGyVMnR2x+OJkM4W+QK3Lz/NM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5817.namprd03.prod.outlook.com (2603:10b6:806:11d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Wed, 30 Jun
 2021 03:41:35 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4264.027; Wed, 30 Jun 2021
 03:41:35 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/3] Fuzzer pattern-matching, timeouts,
 and instrumentation-filtering
Date: Tue, 29 Jun 2021 23:41:21 -0400
Message-Id: <20210630034124.222689-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR16CA0063.namprd16.prod.outlook.com
 (2603:10b6:208:234::32) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR16CA0063.namprd16.prod.outlook.com (2603:10b6:208:234::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Wed, 30 Jun 2021 03:41:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0edd34e2-7ea1-4104-1c9a-08d93b78f59e
X-MS-TrafficTypeDiagnostic: SA2PR03MB5817:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5817433FEE712A0367D87178BA019@SA2PR03MB5817.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJIqPUivMGmNaGLhFkvTtqAuiCUUimkvLbX0rrhWcPW3pjSOCcmDakXQ2RAWddDIoxzuqQNDmeSOsgCWcDYuNR0l9T1gf3aUu4cyXGgfZbZMR9Zz/PL0A2Slsv3n0ONKM0r8Yu7rRfqenha8jfOZ3HodxcEKo2oSa3yjgmJWfM6a+kBSAk7eni5HWdqDwU4OKyLMVOFu4C3XvbJ5t6ap7RaHPuB5XPq4nzEJYl5iSTicS7AU6jJ8ju2SZzjtPxGc1fb74KndgKZ70mNSf4i684d0pz1x0gQIyqhXHOrULVAKHYc/A+1DlnhJpSAvrFqGaH8sjGrWhVh3YvTIvW4FCAxqwL15830Cgascn833Hfo443kXmgPv7BX2SNewbSjOLY0vpMhuuiq/tdr8tQABb5pA1YjduotJY5QiQunL8yK3596ZYgMhL7QDfc3VUyXvGWyXhGbn+ZjhXJfHPPBZw2WxZa0mku0/A12d3J/KieJeGmcIx0V8HeB2ElfBBZ7suN+hwdvXaMaNI9BWOUSbPRupZYcepGxRdQw4km+oB7UbeMQ1rqG0n6D6zvTe9z1Eagjuq6kpitpzOZZpWRZy3FWpmoDN1azbbrMVRNvI0jTnMpXNwj0sRX0mWoSqv8WGupQEWulhiWj72BYctKXB89bu8ChS020MMrpo3XDWDWM0fxyLOwcwKrzBHAWwkTGuO/s6o4tOXy4OFV4RLsKG4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(956004)(2616005)(66946007)(66476007)(1076003)(66556008)(26005)(478600001)(16526019)(38100700002)(6916009)(38350700002)(6486002)(8936002)(8676002)(6666004)(186003)(6506007)(36756003)(52116002)(83380400001)(4326008)(6512007)(786003)(316002)(54906003)(2906002)(86362001)(5660300002)(75432002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QUG2Xx4tjegwc849IPCbH9fD9PzeZYlShqWv9HZLxQDae7rj6Mr8kgKaFERH?=
 =?us-ascii?Q?B71z9H272YPrvkjmua0cbdK7eOVYUWdwTo40WT4Qw1oOKANw11TzNCRiNirx?=
 =?us-ascii?Q?uaObtKgjtJu/sGz4EUu00anp53WO8d/6oIpjVIAfFvxvPEVW95yrXszUwvzU?=
 =?us-ascii?Q?9v/di7DIakXxc3XexsE5Nbgoh5d8YhsEyts3bWhpMbg8sAg1lZwIEVYXQDfg?=
 =?us-ascii?Q?uPrKANES0k0/Dp9bFaF+R3j3eTY2A7+WZ6scWo847Z9qofXBbSfYr2qMHFGF?=
 =?us-ascii?Q?30AlB6y20sZ8vI/MqgNdxrZNDDKs85GfeoG5LRuKMz+G8iWiK1nNUT2A4jDw?=
 =?us-ascii?Q?2Vmmm2UyWCPnQdi+X/hPeB6p/DkgZ3+2eTSBmDU60JL4Wp5sXdzt4Cu8+fA5?=
 =?us-ascii?Q?TkagtJQfYfGotUhHhNCfN3PzuEI4U5CRvt+62sESspYI/JU2cabvkoJ55xK3?=
 =?us-ascii?Q?nc3zV7mJ2TRBBXYfMxohM7saC1WoA7wlFM9PkooNrwHF3GscVxX61NloCfw8?=
 =?us-ascii?Q?pahNuAkWl0Mn1SLPEj5P69l2r1y6vnSLz61nUPxi/JZtk1/8nIfer+jcEa41?=
 =?us-ascii?Q?xf0wxEImgiAxXMPWeoQFC1FbylhSTSmy0EzvFyi7pQgxfCq1frIYk99vtDoR?=
 =?us-ascii?Q?puXTwJM2nxAzsbencH+tGM/POjU5RAZG1f/YJov1WBpy4bzQrABvBv3XddJi?=
 =?us-ascii?Q?FG5h38ExR/obGkLdGKkGJVuF95ZA1ISwH6qk3riwCuyTIvfrzUCSUlfGbMP3?=
 =?us-ascii?Q?8lJbbKDhrJCNdVo5aOLBYKrFU7UtvMHFdL60F+uvGDWvICS+r4zDIOHcMblm?=
 =?us-ascii?Q?b7shleUyQTvl/4lQNJYKIrSDTT/6cWLne/5XVr0PeKHXZkVJTV5+QkA6m94v?=
 =?us-ascii?Q?AjjjrgU22SYsOtw9ypzvQGyXb7AEtVLC+GjBazgjaCiVugl6zZYaTC3+55rG?=
 =?us-ascii?Q?0IqZ7//bXRaKJfxkgafvxedEDmX5xiJYVUX3p8dKH76ujLY+9dQVNzDL2JrZ?=
 =?us-ascii?Q?7PL2Zil+BHxvRAT+a+nrzoHA6pPMzvFtCjtNAoQP6IF64ox2qtXTK/OwgZvg?=
 =?us-ascii?Q?OI238ywuwnmrFvjq5YzxO1HBIxvWb4NFxBU/pTd2YUGAtKCNgWnUMPfCptre?=
 =?us-ascii?Q?Duzo+Q9UGA8mKO/fyMnefJUwpLXBZuwC490/TEFZ3p9Fe0JPtoEHa4p3diPL?=
 =?us-ascii?Q?fdITJJLQYxV98uuWtquyP8c7rdCQlXp9plN709P1TTKlJw4px74E6rQrkVtZ?=
 =?us-ascii?Q?v6PCX5QVmBSI1PHRAih8dUgOygs/llimTd0Vvd8uCVKXeJzdeO10Gc/1F4gN?=
 =?us-ascii?Q?1nGO2OyG9jkT6tY2nhlRmh+G?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edd34e2-7ea1-4104-1c9a-08d93b78f59e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 03:41:35.5478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdHghmNzFvCyQqZZJeGHi6jfNBUqYJ5P59txU15KA4IHr/HDFrJB77HKToR+20C9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5817
Received-SPF: pass client-ip=2a01:111:f400:fe5a::714;
 envelope-from=alxndr@bu.edu;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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

v5:
    - Fix a name collision in 3/3, between "GString *pattern" and the
      struct pattern type, which lead to some bad heap problems during
      fuzzing
v4:
    - Instead of changing the patterns in the AC97 and ES1370 configs,
      make the type/name pattern matching case-insensitive.
    - Copy the instrumentation filter into the build-dir, so it can be
      adapted on-the-fly.
v3:
    - Check in ./configure whether clang supports -fsanitize-coverage-allowlist
v2:
    - Add the instrumentation filter to the instrumentation filter patch

These patches
1.) Change generic-fuzzer timeouts so they are reconfigured prior to
each individual IO command, to allow for longer-running inputs
2.) Add an instrumentation filter to prevent libfuzzer from tracking
noisy/irrelevant parts of the code.
3.) Make pattern-matching against types/names case-insensitive.

Alexander Bulekov (3):
  fuzz: adjust timeout to allow for longer inputs
  fuzz: add an instrumentation filter
  fuzz: make object-name matching case-insensitive

 configure                                     | 13 +++++++
 .../oss-fuzz/instrumentation-filter-template  | 14 +++++++
 tests/qtest/fuzz/generic_fuzz.c               | 37 +++++++++++++++----
 3 files changed, 56 insertions(+), 8 deletions(-)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter-template

-- 
2.28.0



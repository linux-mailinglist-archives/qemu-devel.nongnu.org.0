Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F7302B83
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:25:10 +0100 (CET)
Received: from localhost ([::1]:40668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l47U5-00049D-9h
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l478w-0001pm-Q4
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:03:21 -0500
Received: from mail-bn7nam10on2104.outbound.protection.outlook.com
 ([40.107.92.104]:40950 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l478s-0006wN-5M
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:03:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYHff2ebW5+W/Fl/4OIPxG+43cqg3ySsHm4OwGv68rnEszwQZpTrKpJNabkjZlXOCRAuVjAr95+abUCTCK5NcX1Ykscg+YYFJsx3Qf8a/eap2dZ6TW87NIxtfdHZfPi3ZPCUiGjRFebPTttQ+XlJbH55fzq+a8Q/sidLvD/6k8tle6Wq+Xyt+rEcwG7X3rNItv+Q0mZVy4yyTV8Zo0yLuPZYwyWIGrmZmomhjkZKkYHa0hBaOm9gqWQ42ieYR4MRfP1gIbgcpLilgU8wkq2qoxrHpB0T/vBk7Mxuab1EgK6u7lpouplkCD6MaZu+8Ys0lx1y8hrOSgEXB+kNHdPBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKr8URjDMqTgXp2VWy3xbGmMTbPCmvKQK3wrXyxfMRc=;
 b=HQUvBhz/r1uuRRFSpYzBo/SIg360BU2ZYF0/iB2SrR3QOSjjYJikHYaicR8tr34U4og8TAdHCbIQBwUsIrHjSz21FCU/UO9lfEna2Fg31HWrxyn468qDuRHBSiDuDO19haTb30M3xvyQn+OJ/CAwNehIP/4bRJh5ByJyuPraoOGpWoGn2txH2oHrndbhO2cv/uJXmbuydv/cG+ZRrBde4+VOpLeNNng+gvg+fijGiYsaNjEnLbXsPI5PqUnschgQ+l1y0Pdi9iGA6PNPsum8pIvOKYd4rtKRwrC/vDsnMNa5cCCi3NmUZK5+d3o32p4YHlucoEaqy7Z8EyYLBewEog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKr8URjDMqTgXp2VWy3xbGmMTbPCmvKQK3wrXyxfMRc=;
 b=ZLxS1BfkybFJomTVZbn5wwRuPk5wL9WfqpdFToHpflO73jv/FK0drO/WQzCVQSg5Ws+rRDF1RkgHuDVfHWflFIqCUb/+1jGqb0QgA5uzUMKk1aOz0riZ0HAkToj+ZIjsJX1rrx6aSRfbg4YXeYePXT6NAPZBvk4ifpEk+8CUoFE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5563.namprd03.prod.outlook.com (2603:10b6:806:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 18:48:08 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.015; Mon, 25 Jan 2021
 18:48:08 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Subject: [RESEND PULL 0/7] 2021-01-25 Fuzzing Patches
Date: Mon, 25 Jan 2021 13:47:49 -0500
Message-Id: <20210125184756.319453-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
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
 Transport; Mon, 25 Jan 2021 18:48:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8f9d942-8a7a-4a89-278b-08d8c161c1d2
X-MS-TrafficTypeDiagnostic: SA0PR03MB5563:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5563268E70EBC54F7F17C948BABD9@SA0PR03MB5563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6T0h+TqTl9Zm3x2Tp6EdVvekeMI2JvE75gTdhE4Y+o8OkAsJLD+2p79ERPVxB/OiTtrt65pZ/gttBvE/ycan30tQ0PIbbbK+vxzbhFTdwJJGLeFsfosAPNCXH0rjgxfZGQ6GTyBomIAoweOjHP7xLkR0R/5qBSVngCDUzxMAfTM28sysHFhv8hebP1cqU+XlbzWh5zg3MkXI7HArE3I4SQimcfkBwUZL5oe4UXQQssel7JU+2GTkmwuMpDswJ5I+6YV/YtN1DEfekJslh1UeOSr5w527deFe4v0wTb5Yg7wPYResSYsASk2SndDhgXTopmRrOUbD0Z8kiEIzV8DZr1WOhILz/SLm8zrRljV1U8ssGYq1BXfz23zWf7H+EHFrB+nip5arZN3Ki3jgNg3mkVgo+6Ky6u1q3sccc4Bkkb0sEa90+iz4rPllrJ17oA4ijn3q3hYVsm2aLr8sLZJMBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(1076003)(75432002)(478600001)(6666004)(956004)(786003)(86362001)(52116002)(2616005)(54906003)(2906002)(316002)(83380400001)(966005)(8936002)(36756003)(66946007)(6512007)(6486002)(16526019)(186003)(66556008)(8676002)(26005)(4326008)(66476007)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kHICzpZLVog+HJGHORpH0cItsfAupi4gJpc7kXQ4Mt89uvjTjLK45qNQ/zrr?=
 =?us-ascii?Q?pFhciy6g4YUuTBM1whqwdEbSa3R123rLVLeTQ4ntRj5LJiBR+8a40enBvmdr?=
 =?us-ascii?Q?jdKZ4xLnvUC4f6cLePEgIbe1TuzXYpi/FphA/c12Mdp0jFCDj0jSodH8ojVf?=
 =?us-ascii?Q?MZ4lgyoYnwgRH5N8hDbz+sYRh5hCStFWXL12OkpH6PN18DzPELaMgbYbLAT3?=
 =?us-ascii?Q?IhLKAN3P4AIl3sGG45RrCepAtmXSOzNIpC6CQQaPBfsd69IhRz94kIpxmeKQ?=
 =?us-ascii?Q?1klw/PU/2kUeXFcoMZom7Ayg01MNxnX6TKL3f0+tX7CSzL/8tRk3Ax2+VqPR?=
 =?us-ascii?Q?1/Cvo+dtS5+eI3zQNDpPGjguy4bg73nNnAnEoqxPTR+PrDPvonRht4IKJXbG?=
 =?us-ascii?Q?xcTRP/RA5joFqVGheXbvYSeriaV1Ok8/fcImt531ekGa1F7+wCpa0JRQpBhD?=
 =?us-ascii?Q?gG2u6iUKGo7aRymfRnImUQry+3zdoq8k5yF8ghydNKvJjFiKMhLaCOuMgwKy?=
 =?us-ascii?Q?HFHjwxDCx09lfEuBhZ82LRVHyfNV3ItpfhgczvpN6fMoy28AKRXU4DcbVJvQ?=
 =?us-ascii?Q?U5PWdLvymV90hf7MPnWyfVGO4qpHMn8wYgmOACtDTG82yQ2Uxb3JVTpW9gtE?=
 =?us-ascii?Q?RnK/H0jMbQYwgytYJP2zJ8jhiansKxR3HMT29MXK/7wt7Y/13m5ZrL0YXvst?=
 =?us-ascii?Q?itSQkWitpqcpZjyQKZ3Zk64FTT6GMH2oOaMT7CST3ztw8GjnSSPz4B2A6tqs?=
 =?us-ascii?Q?On22Ngh8SxTTvim9Y/0LY7A+WcIfeFJ7GPXB7XsYbnogIFOTRrCtJp8jNsUZ?=
 =?us-ascii?Q?zSBXWn8fmz6rLNzPmpH3A+wzz7u8mlwWKbttUP9iTuRMox7qbGpiE2OEHSEG?=
 =?us-ascii?Q?r7EZhRydsSjKRrzBbJny70FzQz1n/WxGEWfItEhMr5b15dPGQFf0QXmZE01x?=
 =?us-ascii?Q?LiDhpj5oK55l31uQGsgHkx4cpwHyqIbAuhj5tiexoLj4NzLh7FahNgS9j54g?=
 =?us-ascii?Q?cYH8ITdHqOx5RZThzlUpHPUbH7770yUn1u6dv7Jk1hxbRI3g+ZGav2+FJa5s?=
 =?us-ascii?Q?A6ojvTRd?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f9d942-8a7a-4a89-278b-08d8c161c1d2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:48:08.2727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8LtYpw9B7l6fKiCzP7ccLtvJdV90i3U7DgYxR75mIXc8+Gns9YjxfZP7ma3E0Cw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5563
Received-SPF: pass client-ip=40.107.92.104; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

Hi Paolo,

The following changes since commit 3dcfd4e3f285cd69d7cf581d3a688e421d28e07e:

  Merge remote-tracking branch 'remotes/gkurz-gitlab/tags/9p-next-pull-request' into staging (2021-01-25 13:48:38 +0000)

are available in the Git repository at:

  https://gitlab.com/a1xndr/qemu.git tags/2021-01-25-pull-request

for you to fetch changes up to 2d8bc3f9c0af70526e04665eed02417aa892075d:

  fuzz: add virtio-9p configurations for fuzzing (2021-01-25 12:36:11 -0500)

Thank you

----------------------------------------------------------------
Pull request

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



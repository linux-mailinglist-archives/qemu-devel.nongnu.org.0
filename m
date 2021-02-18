Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656231F1BD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 22:33:22 +0100 (CET)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCqvJ-0006v1-Cc
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 16:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCqps-0003S6-Oe
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:27:45 -0500
Received: from mail-mw2nam12on2122.outbound.protection.outlook.com
 ([40.107.244.122]:1252 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCqpq-0002AZ-SJ
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:27:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3uFUlG6c0K2B6NB0S+cwfoFihukLkcbD/cplMJZkEmHxmH/IQF0FRekwOLHbXmoYF4ABPRehM2ofiRojlsvv2vWjCUabJF6jWJFJuuQJ/H2kc+T2zTevdons/15cT9OYRLjOZHadtZpUWy0etxmife/gSJIfkWO1ny/EzN/GlnjObs4tt86ERRAGbWd9lQXtQS9y/+k3ZdjhyPttUbjFLYv6jQfS5rt8AU6gWpY6vVkWJwnofygNGmsM4VMYU9/IQjzcxHRnkmSFhP+22xy8mAmJuzoxRUu/KVL9J/nr8/Yqgkc0KfZ/bRpypkh7O/irz7BHVC72saT1C103iGX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37mHAl6Tv0HTg6LOIp7g0nunEouyiq41Iqzff+X2QaY=;
 b=ns5FRDO4fiOu5dmfS/4v0ueRnkhd95vqRmqIng09jJ6rhsrRtwpOq0vDiNdfTJGig8cXMBILgoDf5lUYy5L64pyVl3SgAYqj6zYLiKTFWbYCgq7npt+h9/+fsBvaEeavrr8OVOe9zBDt7p48/mVrsqxk3e/7AqhDc/l3nSKrplgo1p3A/+0OowOKAWOCqKIAn3N7IJ9iKCme7uRQnEoGu3iCNgCDjIqUMGnbfPkOW8k8pRVxuZNaA61Gcr04+oaoe/7NF1QXTfqJ7gIputk6o+KoyH8s0blSCfxkth+6b7RpoIWArT6pc6C6NF6resmDk0yugr3wYNxjZ5tbloyrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37mHAl6Tv0HTg6LOIp7g0nunEouyiq41Iqzff+X2QaY=;
 b=ZktMVhI8Lo87GWVU4wxn/4jzHfUwsVSasZSb27WzdRpvP+2HWMery6CsKll0nFqxWIuAnzGgZSBSY6PtiPFWw+sPI5+K0gbsfYm/qxuwvjDT4hZ4pLzIvkoJmOfUMgSCv2a/MZFiO8ZSdGqW5Q1Y7E16Hr1UsSQ5dubIWw9BfBk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3936.namprd03.prod.outlook.com (2603:10b6:805:72::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 21:12:36 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3846.041; Thu, 18 Feb 2021
 21:12:36 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/5] fuzz: add a script to help build reproducers
Date: Thu, 18 Feb 2021 16:12:18 -0500
Message-Id: <20210218211224.2513413-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:207:3d::43) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR02CA0066.namprd02.prod.outlook.com (2603:10b6:207:3d::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.28 via Frontend Transport; Thu, 18 Feb 2021 21:12:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf02bd9b-57ef-47e2-4546-08d8d451ea55
X-MS-TrafficTypeDiagnostic: SN6PR03MB3936:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB39364268EF699A5CCADC9411BA859@SN6PR03MB3936.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTcupU38vI2kS1jIQXhO55pYrcRWJ7x9CTmguScm4PkvwCEjDjZCIpOgJf+Tt3RxFrN2oXDB3rjdQg7/teYn7/OU+NJlLP64hXcYrBGUo3XE5Vz/aGhx0YLJj/TEVelJz//sAdut/24YjmhWaL9KeD9R/KJtr5sOSS14NarRZyQLWOvbyIMynbPZsteR6IMSO8NaLCrc/DoATbV6labaDNrgbVzLiSPzWlTUmfYQ5ijwsb4+Hry2QxKHJRPVcstOiB7d8TJhOxCKaClogxB+DAbI+ExtXeKUA5DJGq3lT74u2QlMHKXExtSTI5VfX9whC1Mt6/vV2N4As8BlO7eS87wt9Y7PLb8kxf5QBY2CdFBjIGUegBmVGjdmclBRYwYzcRbkuoFToAk+Fwv8N6D76jw83Bk8HKd2tPjURsasFFJta+Z7kFSluDqopKxytDWdOlYpKhkndG0c2bSvTlrVik4zr5qmXda/j0cKub5Dfw1HJLvzImF/s5R/Cv09SNin3AQ4JCcCBcMCN7SUhQbtEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(52116002)(6916009)(86362001)(6506007)(2906002)(478600001)(8676002)(75432002)(8936002)(26005)(4744005)(4326008)(6486002)(2616005)(956004)(1076003)(66946007)(54906003)(66476007)(6666004)(16526019)(36756003)(316002)(186003)(66556008)(786003)(6512007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gt4D2FClPeUli3EavHS4vB6az9iwjfNhAiJmhPycKb7N1w/XzT2GQGTCk5g/?=
 =?us-ascii?Q?qnehsiJZ9oz9Ryre4rDXtGIlnr+ZHX69siER2FVDR9eduwlYw7K+AWIW0l4O?=
 =?us-ascii?Q?dk1RLO8aZPa2UFXmctnfqBg5xSnJmWvS+MsJTE58JDs+qSLCKdcm4f7Q1Z2p?=
 =?us-ascii?Q?CkgSpsW3qFzQRSSNeA0cUuOD/ZIu62Vl2Av5NsI993EvyrOjlXNnA8nSV97B?=
 =?us-ascii?Q?/3Ifp/J8R+xeGiS2f+Dlr09ksqffUmcK7x0LwPLBYA6qSnOJtpyLnKLKmSb4?=
 =?us-ascii?Q?faGOvTjAOi0ueL45Qtrpqqja94eRueSYpemZC6VNbOWlE3Gvr7dm3pyYCW8c?=
 =?us-ascii?Q?9fjbWq9SteVRpta+jZyxLvmhN11SLY5QXxZEesJClxP7Dk+8GyP4imUu8aCA?=
 =?us-ascii?Q?b4GMtNj7rjwNfQ5rywkhLWa3YuR/UDtO46N6wZ808WC5W7jSt9YxLQO8hN6G?=
 =?us-ascii?Q?soGkV4b4x3exDsxJoICppyiSB+ON+VZm2oFYQz/uT/o7KNC2Tp0hDg8mx0vS?=
 =?us-ascii?Q?t98UEX0yUsJhi2XKyAPGdyAWo9MHKLmVTdgNRJzS530YGgMouTMcfeQKY26u?=
 =?us-ascii?Q?wDSGMNp5uod1gaygroBxzO9jyxE+9XidknXvCrpPA2ZA4MlomF2rT5EtqiIw?=
 =?us-ascii?Q?ShDh8j5b5JQsDELf2z1x8EVI++eAQ+RScBnMESskuWQ3Hql71c61AIa6hqnX?=
 =?us-ascii?Q?wrIv+BLwSJIv6E38K/0ANEJwyXbz8vlHVGlFaRct+xTQA1FhsdS7z6j8Ddeg?=
 =?us-ascii?Q?9KOOjFg3Pw18OGpGDl/8Th1kLudmfvTcBfYWUl0XaiDsP81M5zxCis8zlGGM?=
 =?us-ascii?Q?OX1e/mIkXxaRO65hfM2G4AACQUn+SxD5Js41CZ2KgzjlELPEd9sgGLS38pBA?=
 =?us-ascii?Q?gLpfMPnaRFmuON89RRj1Qu5Rq1wy+3/NaHdBBrWF93C8VrD7hSMX4R7FnJLz?=
 =?us-ascii?Q?2XPdDg/RZZtZYCAPo4amXgQqaXuzqwk9/Yk7TOCwi0CsAZW+IlJiL30t539s?=
 =?us-ascii?Q?MQMg/c5P/tQ4R0bERzlJpcy8RocO8kcZxKpuxXW5ap96rXl56jmWofp+Gz3t?=
 =?us-ascii?Q?icpMAb6n5cKerb/BzuGwtUhi/EpBPaCF2RfTsJuvHLG471xaucmKudzQoHJ0?=
 =?us-ascii?Q?fdlfTxW/infqcjTicZtEu+SIfAE6hXZyAItWCpQAJLmWpfuEJgweSnQPdmKj?=
 =?us-ascii?Q?+4fRp3ks1qtzvXgglKpaIW4fRIIjE4fYqY1hMaAVZ+VARvv7/73oHWv2RVve?=
 =?us-ascii?Q?A9DvC4T+Z96ruPaIPUWVsS957yz2IdsI+lr23S36yxeMYNym5V8DS6fkUnKs?=
 =?us-ascii?Q?w7DxHtHEeHT1Kqy0bmTJ/jw8?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: cf02bd9b-57ef-47e2-4546-08d8d451ea55
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 21:12:36.5119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+Ge005IAKkfPCV/H+EV0ZRNPLqLmsGjLm1Mlg7QKJNeW5XpO6QnJMcKgu19wH32
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3936
Received-SPF: pass client-ip=40.107.244.122; envelope-from=alxndr@bu.edu;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,
This series adds a script that can be handy for reporting fuzzer bugs
and creating regression-tests, based on crash reproducers

Patch 1 adds a script that can help create bash and C reproducers for
crashes.
Patch 2 documents the process of building reproducers.
Patches 3-5 are examples of C reproducers built with the script from
Patch 1.

Alexander Bulekov (5):
  fuzz: add a script to build reproducers
  fuzz: add instructions for building reproducers
  tests: add a sdhci reproducer
  tests: add another sdhci reproducer
  tests: add a xhci reproducer

 docs/devel/fuzzing.rst                |    45 +
 scripts/oss-fuzz/output_reproducer.py |   161 +
 tests/qtest/fuzz-sdhci.c              |   422 +
 tests/qtest/fuzz-xhci.c               | 24767 ++++++++++++++++++++++++
 tests/qtest/meson.build               |     3 +
 5 files changed, 25398 insertions(+)
 create mode 100755 scripts/oss-fuzz/output_reproducer.py
 create mode 100644 tests/qtest/fuzz-sdhci.c
 create mode 100644 tests/qtest/fuzz-xhci.c

-- 
2.28.0



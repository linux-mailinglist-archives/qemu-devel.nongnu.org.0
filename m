Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CD83CF8FB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:42:45 +0200 (CEST)
Received: from localhost ([::1]:45050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5o96-0006SP-KH
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5T-0003B7-Uc; Tue, 20 Jul 2021 07:38:59 -0400
Received: from mail-db8eur05on2136.outbound.protection.outlook.com
 ([40.107.20.136]:65205 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5P-00077C-KS; Tue, 20 Jul 2021 07:38:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/w7WQIOjAJ/gY763NsVIrlmi+2vSNtL5y/pCopwb6oaEIfUlN6rSr/04wsf8E3TENO2L6XamP2t3EKiueOdni+yzZLOHwUtX1GVUPq8Qrdu6R5V4Cg+MvmpBnk86k51WOt71SlF8oN78yZTSQMQdHY0HWbd8olyAx3ZAP16qmMAyjqSn1yOVkHXlj+1Ed0Z/0JICl+c+cP6NF13hN8sALxMUVc+vNIgeEAAWjY6akgQXnFEwFZCIdRM7m8iSa5Et2feO6Cq15ZwbE7HcTg5YvYvxfec8M1rJCuYJG+OAE1y6cjTZ5YCBrtPz4kgz515zRRFlcZBQYuCxwfYSdigzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vbm++xqDLLXLtgkegXuoesecH3ilz14oG/w/4wg1Bo4=;
 b=XnDohZ3cwVIDfuBLVkmOt0M/ytB4l1OlBMAuay0NHRa3w+fAJ5fPO1b1LU466ZlpIdSSFTCwKNNKaDollrsFgKGS/53pLJoUQbJKQIjFuoUBTfD6KqnFFo2asMuDlFojYYFEXeNqJCbTb2KGyooKrrnVRTG30b3FMGTxunyQ00DkIC4s50AjaHCwka8b9/fuT22LTrzixz8w5aTcPHFv8z7xPeNdvFt4/VpZxWY3fO9yU1klPbbg0U5hP2hNcs99GRlkBIwtsTkfZeuOArIswYucz/GkrSWBZOM173w1cZj8I3mQQ8IiENzTH1ykSj3LgLk+bwFxz7OvP5dKIYdnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vbm++xqDLLXLtgkegXuoesecH3ilz14oG/w/4wg1Bo4=;
 b=GjACa8uqEbzz5aa4h0ievJ3wVGvG6oYU4ftQNkGHmq3WCWTzLE95GVHUF7VhMZ44mc7se0565qS0mIaSNo9ZO8znExbyablHVjrEZVdQYlw2sI511fTco3bRUDvzO6XtBX7CplLsczn4F6p/mMjJ3WgHDwAFBxPoeMHqxkGxXL8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:38:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:38:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 00/17] iotests: support zstd
Date: Tue, 20 Jul 2021 14:38:15 +0300
Message-Id: <20210720113832.586428-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (31.173.85.199) by
 HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:38:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97d53ab1-8ce9-49bf-a89e-08d94b72f163
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119CF5B506859F29216D0AFC1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:32;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m8DHyajOb306sULP6xFrrmc2HwjVjv71NaKxlwFu3WQWpUJjBoA1Y+FTo6LXg0Wv/W+jS4dA8+dnYEa1l0kM4CTR5ZHXj0fuqLiBDMAwhr76ubEwrp8NKLNj4zUXGoHmYDnLMXnbHjDDQxxCUezbE2uRhNYOY+dpV1PaCKrEn6Wk/vmDan4ZPeay/X1g5xpNNbZdcPRCIwcFQwWNPg8s7S7pZ+9IZ1KV/ZIp5J/kWLw3zuh4trBgLfEMTslMYza6ikz53n5zqVwDrKr3W621XTgUSjI1QsD+pAUTp4K9NhEbun5PKgUCLN3+YEj3SW98SLCxSKz8CCnRC0NeXP49edZcX7sAtlSeBSySJ60ZptVgZfB7c566r1xQdomIl05eiGt4LsP8xzuv5ubH2w75iEm6rMG47wyVJ05vowCEIN8IVPJrbRC4dQE3CGQEyr+ZsYWbzdeGrgseL9svOEpSLdbPG8UgiYpQGi0iFYF8w8mfAFLVvxgAgwStule3Fwz36ejpXTH3Dg6VWP6DzhLbD/v4KGmoh5Os0lxCLFnYSLfTpCTRwuRE9yzmSYHsT5Pb6kecuAntly4EFzaH/9EZY/o+1f0eM35TgyVoIAZYLyfhN6xclbkwVgi+ye45uUoYCXDaCR8xG7TTLcEq0TL62NckDYl+BBEqpPwHvk/H3CUChQ3Mmszjs4EaVIrYUDfGNG312P4X9JwHFLKCjosx/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lYMjZnudiTst4ZM4/FjNE2mhtjxikz7xTbvtA42it6grmndct8oxH07jdaDN?=
 =?us-ascii?Q?rAwJ1Y/+dnq8cEDFcmqlSrD8GG6kWpd8oOiX1PynQgTla74HSv2lRacM7ReX?=
 =?us-ascii?Q?Wbn0mCj8LFbtBThit5tv7qRLw+4Y9WA9kMmDBUQ7rgkbtT+8SI8gPR9i1wn4?=
 =?us-ascii?Q?urYBJe0uG4dRWmlAcexfW7elBwo9D3Lps+jvy0CY2QmCum5gADNie5SVzN/Y?=
 =?us-ascii?Q?W2Ja3DT3qQw49RFamz5tyYQ9fXCg3mrT5sWAiBqTNKD23/sXFhnJHk8wd1f9?=
 =?us-ascii?Q?o1/nrANfmeh23XhJ8+p08Efuk9VwZ5oGlCOFrxLxxm0XQwCk26MMjebSaR4K?=
 =?us-ascii?Q?EXffZz8ylfCNrn5ngcfyQatYa/7lZuhAWaV34NBl1984s7cY5rn6nIsN2+nq?=
 =?us-ascii?Q?GVBwjjCZI+QQIHdQd60ZH61MM4nAhsMHIfERFJO2ybq/chDzIWP2DTKXZOMk?=
 =?us-ascii?Q?HSAzdygJaaQQ/m8NvIvzDUGsdk/8JGrMfp/lIefH5J6nh5DbKFlW5FmXmY0q?=
 =?us-ascii?Q?KOLenQ01owBppwpATf2qRC1ZK/nfMs1d9R2ZdT9qCm084JQVxQMAmj7cc38v?=
 =?us-ascii?Q?70kiCVufTR5QMPkoEkoZwkzNQ9whZE3n3lkZC2zS/9wpxXVkcKbzicnlYGXV?=
 =?us-ascii?Q?Cjjl7utymPdBiNB5GrhW8qSDU27tRIXUqNKeFONxetHXqEDR5mwCu5fZ9rtS?=
 =?us-ascii?Q?8isq8MFXisu7mAKiv80bUlMd7GyNQlkJW3u0RPszSzGVk31zIqaX8f8TwiiR?=
 =?us-ascii?Q?FZqepYo+qBu5hYwDdusqju8CstbN0WZg5nLpFggcxBGPSG7uDACcEkNZ+xdy?=
 =?us-ascii?Q?1lyP+uyxcdbqwQ16/OvhTLrlrtm7mw1Iod0SGhHyv+3fhJgHzlV1v9GSckp1?=
 =?us-ascii?Q?IcgIctIauixaG2/jhMmpW+BL6N5AI2sMbQi8XRLYzm/QQfoALiZ7KwwWMm8P?=
 =?us-ascii?Q?7P/1GTi1gnPES6pBoKHkEQ1Tu5JuEFglnOd7obfBYTUODtTp9B21kzDgXw2y?=
 =?us-ascii?Q?dGpkYgB4zm//STrk5+lk7KmlMDoFkZctT6Qh+I7SD5q4RWv1AcEPl+Dz2kf1?=
 =?us-ascii?Q?NleRdJ34DYMVHcdRT/b6fGZ5f2GcfwR2kiTkENDCd/+UTMJG7sVLNJhk3Ofv?=
 =?us-ascii?Q?Sif4bAnrhTMxD6FLl4dBfbB+3jZwkq5WXoR7mv84KEB8Ww7daMMVbY+Cc19i?=
 =?us-ascii?Q?VLie/6SJa7shv4eYScyJU+i6cikUoEa4gYSu2Wxztd6W4lm2G1+FyGwFjsCH?=
 =?us-ascii?Q?c8rW1Q2t0btb8kyoeB0PKcKf4x0RoP2AzJZXUdbzEjsMrtObQE3Gg0ZAUwKc?=
 =?us-ascii?Q?hvvQiyBQZvyLXbcx9BfhV64l?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d53ab1-8ce9-49bf-a89e-08d94b72f163
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:38:50.0310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1R30lUEYG1nSR3rRR7Eq7S0uoQ1Mcr8Y3QOgSCpvyYit0pBHa4HznL65tzS1BuX3b+S+MjbxLBtC09cTom1Iu4UgVq3Fgn56QFDd5Kgfqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These series makes tests pass with

   IMGOPTS='compression_type=zstd'

Also, python iotests start to support IMGOPTS (they didn't before).

v2:
01: add Max's r-b
02: simplify a lot: just add separate -o for IMGOPTS.
    also, don't bother with catching compat=0.10
03,04: new
05: add Max's r-b
06: one more explict compression_type=zlib
07: new
08: reduced to only update filter_img_info
09: adjust commit message, add comment, add Max's r-b
10: s/ = 0/ &= ~QCOW2_INCOMPAT_COMPRESSION/
    add Max's r-b
11-13: add Max's r-b
14: one more regex for "2, 3, 4" case
15-16: add Max's r-b
17: new

Vladimir Sementsov-Ogievskiy (17):
  iotests.py: img_info_log(): rename imgopts argument
  iotests.py: qemu_img*("create"): support
    IMGOPTS='compression_type=zstd'
  iotests: drop qemu_img_verbose() helper
  iotests.py: rewrite default luks support in qemu_img
  iotest 303: explicit compression type
  iotest 065: explicit compression type
  iotests.py: filter out successful output of qemu-img crate
  iotests.py: filter compression type out
  iotest 302: use img_info_log() helper
  qcow2: simple case support for downgrading of qcow2 images with zstd
  iotests/common.rc: introduce _qcow2_dump_header helper
  iotests: massive use _qcow2_dump_header
  iotest 39: use _qcow2_dump_header
  iotests: bash tests: filter compression type
  iotests 60: more accurate set dirty bit in qcow2 header
  iotest 214: explicit compression type
  iotests: declare lack of support for compresion_type in IMGOPTS

 block/qcow2.c                    | 58 +++++++++++++++++++++-
 tests/qemu-iotests/031           | 11 +++--
 tests/qemu-iotests/036           |  6 +--
 tests/qemu-iotests/039           | 22 ++++-----
 tests/qemu-iotests/044           |  5 +-
 tests/qemu-iotests/044.out       |  1 +
 tests/qemu-iotests/051           |  5 +-
 tests/qemu-iotests/060           | 22 ++++-----
 tests/qemu-iotests/060.out       |  2 +-
 tests/qemu-iotests/061           | 42 ++++++++--------
 tests/qemu-iotests/061.out       | 12 ++---
 tests/qemu-iotests/065           | 16 +++---
 tests/qemu-iotests/082.out       | 14 +++---
 tests/qemu-iotests/112           |  3 +-
 tests/qemu-iotests/137           |  2 +-
 tests/qemu-iotests/198.out       |  4 +-
 tests/qemu-iotests/206.out       | 10 ++--
 tests/qemu-iotests/209           |  7 +--
 tests/qemu-iotests/209.out       |  2 +
 tests/qemu-iotests/210           |  8 +--
 tests/qemu-iotests/214           |  2 +-
 tests/qemu-iotests/242.out       | 10 ++--
 tests/qemu-iotests/255.out       |  4 --
 tests/qemu-iotests/274.out       | 39 ++-------------
 tests/qemu-iotests/280.out       |  1 -
 tests/qemu-iotests/287           |  8 +--
 tests/qemu-iotests/290           |  2 +-
 tests/qemu-iotests/302           |  4 +-
 tests/qemu-iotests/302.out       |  7 ++-
 tests/qemu-iotests/303           | 25 ++++++----
 tests/qemu-iotests/303.out       | 30 +++++++++++-
 tests/qemu-iotests/common.filter |  8 +++
 tests/qemu-iotests/common.rc     | 22 +++++++++
 tests/qemu-iotests/iotests.py    | 84 ++++++++++++++++++++------------
 34 files changed, 310 insertions(+), 188 deletions(-)

-- 
2.29.2



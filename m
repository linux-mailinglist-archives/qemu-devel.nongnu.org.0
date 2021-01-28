Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC04307898
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:51:06 +0100 (CET)
Received: from localhost ([::1]:41310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58dV-00037e-3K
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l58Vf-0001kc-9F; Thu, 28 Jan 2021 09:42:59 -0500
Received: from mail-eopbgr10116.outbound.protection.outlook.com
 ([40.107.1.116]:27352 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l58Va-0007e9-3q; Thu, 28 Jan 2021 09:42:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dX0jPAlSt4wgRHhNHQLvqrQtLakboDhYK10ZLOrxjTbVP65OlsWFFvhe4Ze5krkFo9Da+NzQlQJCkfd5ZP7FgxzgshuZ4/dmBSUeGwrNHkZUKUqrNUOqSIOE18//fij8FqGNWEF8B+c2D5hzOZ0c236ro/oMc1SOHujcNbsx+Pu+ul3fOIKB08JsEJDGj53T0I84kj9wBjt+ZxvHB67XmMgyqhbiGs8fZ84PKcEi3+zZW9ElR+r7RsZoy3Myyf2zR3WpbcXF/CsML6MxkYFnYhpeTjMsYSu0COp41tFMkDQAE17eRfBCz46XW51Na16+LpCnop3SE2SoHSsqUcg89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22vSrhWJmls55tCpRhgLf4ymfxKaflq70Gz2G0JjWIE=;
 b=ObC8BmPCJAQZb70pSRclbNGRcfJ7v5jYlxVWjFrR/xxD/04DyQt+eAhF3egkfPUO8BJlvtQQYHo4lFLwG/hOGRM1zRp/9DJt+iDVNNAuA1pUoVLWgj4ICNEjSYWjv5oyJHytE6Zsw3ej+uavIR3/NYSbzDMY8gLe6wr/AF6azmAEwS0pI6YqZjGzXiWWPk5FCeQgF+DdWq3jcVdKsn7mQ24YK6PdLDKk7zS2o1O16zy/wqqL1nVb84M/+JsodpDVepSwYziD4BsDygLe2WATyADXzMl5Nz4/vdtCTB6Pmi4lVtDQPdpDG41XaDr2cliDjAtRIlF+buzRtqVfJX0HSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22vSrhWJmls55tCpRhgLf4ymfxKaflq70Gz2G0JjWIE=;
 b=mqKZj7X7U/YDnvO64oIEEOyzkvXZczMQRqywCclkMgGjuN5h7O8LQ/oHHTjPxPszQ83oidQb1BQPV4rNh3HPAf3AL0mhfEK1eVicEqghOtOXXiGh/I+D22Q1bKRRAAC8PMD1Qdt2DFhTheVsDP1SnjYGvjUv8BzjzgRPfrfByXM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4069.eurprd08.prod.outlook.com (2603:10a6:20b:af::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 28 Jan
 2021 14:42:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 14:42:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] MAINTAINERS: suggest myself as co-maintainer for Block Jobs
Date: Thu, 28 Jan 2021 17:41:44 +0300
Message-Id: <20210128144144.27617-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.105]
X-ClientProxiedBy: AM0PR03CA0031.eurprd03.prod.outlook.com
 (2603:10a6:208:14::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.105) by
 AM0PR03CA0031.eurprd03.prod.outlook.com (2603:10a6:208:14::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 14:42:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99afbb83-3faf-42b9-f58c-08d8c39afc66
X-MS-TrafficTypeDiagnostic: AM6PR08MB4069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4069B6786752AA64655D410CC1BA9@AM6PR08MB4069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k2+bUc0icMRGTnDlPe9vYoM87C24zY3l3E8jpCWtBePVYBrbW7dAyqHomojEAxVZUfahwB7zbC8YtSueTd3g60uCuT/h+ofoVvfVlCsIUXxpxnHES9v+HGrFGRx1R7TT459Pus7mpv6KAguRsNN1W1PFe2uA81RZYz9WP5VOEPjY33pI6MAOif/KHzXfCopRGtX+ZU4r+pQgxKrAOai8hQ599f3vJEJpv+0mu/Ud8N/6tnMp17N/g8xk3350a/Rw2px/wOIvSbyDVgdNUTYP0wGZOcQ9vZT57N9kPorWYy/QwvfWx23ZtXhkolSi187gZYPwFZ8ftzXG3t8gfnUtmdlKd7EOg3fqkVnVFjE/Z0euGaD/0hNkOz1zdfrWlvImRxp+OtvCicWX/nPYrRY2GyBqVcRmvxs/rnyolNsjOIXlZWHxCCI2JYL6haIrfwNxWIClvQUW+Ji+xqu0A0+O9jJEXn4sjdHwL5XFUCER1qvfufZa0jdjd77qaJjX0erB7AwENm28udKxwPKkN6+frLX6Bl+MYEClMCm8XXuShDhLoZayHOotT75PURABLkZTBXZh+3W0mjCKPmMdSLyos0tS7gTQcl4+06X9y/XI92U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39840400004)(396003)(376002)(1076003)(6486002)(316002)(966005)(6916009)(478600001)(6666004)(4326008)(107886003)(36756003)(956004)(8676002)(86362001)(2906002)(5660300002)(8936002)(16526019)(66946007)(2616005)(26005)(6506007)(186003)(66476007)(66556008)(83380400001)(52116002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?V51rYYFX5otcp7SrMYGNUB25mNCc+uLpyDDrUW8oKSqdWNloWrCuMelzlDuy?=
 =?us-ascii?Q?THA46BrJ6Y50nsFa/87fSjPizlg2RODtw5PQYFrOPF2wID9Xz45u57CAf1N4?=
 =?us-ascii?Q?FoNHP0dUC6pr6nfxjexHWni6tN092nmjdWw71s4LxpkJrUrSsogl9ejYPTLs?=
 =?us-ascii?Q?iKjjMKhkm25G7ok8xVIKmyBVPy+Gkid/7pmI2iFYXb52h6O8U3QDOnhMpHPO?=
 =?us-ascii?Q?JIViMYSGVkVCUzzlFB/uveHI6SBEn3yn3Jzn1GlZfP/kKpiSecYsLmTOYau2?=
 =?us-ascii?Q?+51t82D41w15UxXB3tZ/VcZxKfmopKsGRDEmoIZROJyx23RpxOinvs9rzNVP?=
 =?us-ascii?Q?AB5JC8uUCDq1FaqcoU5M4zWPxtne392K6ErMH3eAQVRFLGBn6Y1OhRb3sF0R?=
 =?us-ascii?Q?GohXoptXteu9ey41KEce+xb2Hq+A3AoQetUs/wM+S3zAiTW4rd6fJo7yJZd0?=
 =?us-ascii?Q?sFWdkVhtfAxxng0u5160OIIDwpswUFG0r21+XqJsMhc8fa3ga69z3YmX83wB?=
 =?us-ascii?Q?vaobtHhW0ADj/ESMTaJOFJTg8AP3Lz5JHBZJHH1T6YIbEIFmbL6Y/SgM5Q9u?=
 =?us-ascii?Q?Uu2BMQwmIhhfQfUU6yuE2b0lIibbXbNWRqb28HZSz9Iq2ONCBD1C2rd9vICs?=
 =?us-ascii?Q?yL/gVOCiYU9XXEifSjKibV25wdchw2FLCbwWs5rh7yQbx43NgeBtW7alWpd+?=
 =?us-ascii?Q?xFJgrd5O46O3EG2KEjriYPPeCsmIrY5o1AxYhlz0+WY182fuO09YO2yQ7PcR?=
 =?us-ascii?Q?zdqh5earunh8v4jdQd67cg5VZK9rLxf+CKxCHgnpRhIe1sjpyf24aRcWH9uE?=
 =?us-ascii?Q?py9g1BzeATUzIp1T3MfFyKOe9SXxFu5aetxtCWGbW+EUToJtEHFZKWrS0Sc6?=
 =?us-ascii?Q?jbnzGQmmXgcR12dDSg8uMMpD3I1H0qkkroV2m67CYaDwGrWgWdQ36PrZ2W8U?=
 =?us-ascii?Q?ipCihPOTdkz1OWJXpEeQTlBK9RlHimSScBiL3QYJc7wYwmw3557QkXQFNeiZ?=
 =?us-ascii?Q?1LvgnFnO/jexQh4stH0bhd9KnMLFWxO7uXY2ajWh1pgFnwUfqHDcwgGpwEmG?=
 =?us-ascii?Q?Dp9AcdWJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99afbb83-3faf-42b9-f58c-08d8c39afc66
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 14:42:50.4670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZrMOFrZcvoSNxvb1rkE7B5yuJl+0NsxlfSojXaGQNKdwKGTpql7+QrF1840JdGvqIHnZS8kiBYCMno2tZmfEudLz2jFKS+RVMWBEmVEgTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4069
Received-SPF: pass client-ip=40.107.1.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 jsnow@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm developing Qemu backup for several years, and finally new backup
architecture, including block-copy generic engine and backup-top filter
landed upstream, great thanks to reviewers and especially to
Max Reitz!

I also have plans of moving other block-jobs onto block-copy, so that
we finally have one generic block copying path, fast and well-formed.

So, now I suggest to bring all parts of backup architecture into
"Block Jobs" subsystem (actually, aio_task is shared with qcow2 and
qemu-co-shared-resource can be reused somewhere else, but I'd keep an
eye on them in context of block-jobs) and add myself as co-maintainer.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34359a99b8..9957f39eba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2207,6 +2207,7 @@ F: scsi/*
 
 Block Jobs
 M: John Snow <jsnow@redhat.com>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: blockjob.c
@@ -2219,6 +2220,14 @@ F: block/commit.c
 F: block/stream.c
 F: block/mirror.c
 F: qapi/job.json
+F: block/block-copy.c
+F: include/block/block-copy.c
+F: block/backup-top.h
+F: block/backup-top.c
+F: include/block/aio_task.h
+F: block/aio_task.c
+F: util/qemu-co-shared-resource.c
+F: include/qemu/co-shared-resource.h
 T: git https://gitlab.com/jsnow/qemu.git jobs
 
 Block QAPI, monitor, command line
-- 
2.29.2



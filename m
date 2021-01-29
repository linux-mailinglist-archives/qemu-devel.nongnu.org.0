Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90551308AD8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:06:56 +0100 (CET)
Received: from localhost ([::1]:36718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XEV-00056L-I1
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X06-0001UZ-S5; Fri, 29 Jan 2021 11:52:05 -0500
Received: from mail-eopbgr60100.outbound.protection.outlook.com
 ([40.107.6.100]:29349 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Wzr-0007OV-GV; Fri, 29 Jan 2021 11:51:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cd6eVUvfWmRXLI2eUMTj5/0Sj8OrzAhaixQD5aNzuEm8KmcEyUGRW7GSnFFfY4dnj973Qtg8N7FFwXcv2FcLD4yBjgek+uFWVAyH8hpwtL5P+S+ME9fna8/tKWSJiA7z96OzJB+CgZMb9/FO7/ChtAOVL+9iCBixffGPX4nNnN0txGzEjA3jbaQGmuHRwocSyp2U804hJcRYAoVFxfCWy2VlWOSJ0fYN+zBWFHrYBw0beqYHeK1FejHpc+AakPbu3XDjE6IoeHDkqsU1npzuiFtzKGHKuP26Zl+PQdrEoj50ZUPhiP+8RGHUJzXL8MuBbTRZ1S88z20fRlShifdnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uO06OzUEZrJhVt/sLwyAlJVy/NU9snPAznbi6xw5H4k=;
 b=QfXRvaFkeGLa3vB5ltybS+NeHuOyKln7iXMt9PspPoxhypDkjQYJ/A8Ub4hlw8o8eZpMns1Bef7Bs/4nHZadeUJk5yMW0lqvQYLvw70wpH8eZEHS/mkk1BxuMsyKdL0LHvpEPiTfU0NprHooO6/Kczqf2HxkwdIX546tixHbMdZKV3h9zXNtdQObtNkhZiKVg57s8uM/YRBxVjC6lIKQ2OvbpHomqUpHbtmNaNqxWP/e+iVFUlb2g9qjlJouUC+0CTiUExg6QXJGvQ9kQybm4tpwHGfptay/fs7/lGujN2NnqE4e8lNIXywzAfHz6KmLF1DZIHe+KIKiujNMdIZj+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uO06OzUEZrJhVt/sLwyAlJVy/NU9snPAznbi6xw5H4k=;
 b=LYn9Xg8NP3B3tmXhyX+dS84me2TyHxo0Zr90ocjIZTSLVep5N+SUyqjoclU1LSxR+De42aNFbwSghsZp96cQYDaObVG/0gISVD0MH8fmr7j0HHhcwo4QUAS1I0Iu8CV8LwUi1SKUfZzCJn7QMcUKl6w/B9Xz6VZuqElRg/iUQGc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3621.eurprd08.prod.outlook.com (2603:10a6:20b:4b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Fri, 29 Jan
 2021 16:51:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 16:51:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/7] qcow2: compressed write cache
Date: Fri, 29 Jan 2021 19:50:23 +0300
Message-Id: <20210129165030.640169-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.152]
X-ClientProxiedBy: AM0PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.152) by
 AM0PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:208:3e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 16:51:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cb273c9-4400-4886-7a34-08d8c4762679
X-MS-TrafficTypeDiagnostic: AM6PR08MB3621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3621C9F7D29C3A80EC175B8BC1B99@AM6PR08MB3621.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bzhXRxQbT8sq9JTIrp3FUfu0ZxpK49armzhDT24DNHUU6QFEYtCyGbvhlcP/aTOJ4ZO+Blw6F/YUM1CDdIU8fzVbW6Nif4UQlMBDsc/Njl+vCpy8i1iVJlABgo+eNya/KOr66xIfbkYzBKL0MfXcwlZp97YZZvP5kpRAESHl/t9M7uZn6DTKW/MgP/x8wSmp0uckQIhgfHJLGCPD+ld9ZtDAva6hkLPCJyLEl74S8mFLf+8fOp9kNl5tLR6/A8lBsPe2l2qOuTcV/EUCpzDyjwrwrRZvGNYBsQOU4oQ7HPTpuJafU/4PPLNOOIHm80b4dBNSCw3riNkJzzeGnYkkfdxyhER103Ww9Y2cUQmUE53xtERE62PihmaRywTXyeFcMiICwew9PWW9Iw7mLrq/ncRCCSQObFAGiKqm8flPFhBli8owA1wPB1JqIOhncfYdYlTbGPiGtQCelJw1BcVr2EefRK/RMqtmmew2c58VJ/R3kS0LA4ZXdyxkDgdt1WkLViTZHRbt4LzqkwzSyLLdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39840400004)(376002)(66476007)(83380400001)(1076003)(86362001)(8936002)(6486002)(316002)(52116002)(6512007)(66946007)(8676002)(2616005)(2906002)(66556008)(36756003)(4326008)(16526019)(6506007)(26005)(186003)(107886003)(956004)(6916009)(6666004)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9GOoTLuUIEQHPHg1TmNZJ7EWFf8dTcdy9Y5b8OvLhoANtfTOMGwb8hoN84JK?=
 =?us-ascii?Q?ZTFur1Z9Z+hg4imHDLh4kOuTMtEYYfnQ/rkqKJcptC0ZhQOlHxrjfG3Ki2vE?=
 =?us-ascii?Q?yVmXIYDiJEKc/rUUCJp83nqHycvyk48Gk1qDbMg3LO3ehx+uWX1Ys22Duw64?=
 =?us-ascii?Q?qe83WpX37W/ZyrVQ9VAXBwd3F9IPtmWa3tSgK73rmsUaMqMt2o1PAHYYp4mi?=
 =?us-ascii?Q?7qwjDeMpQ+NrxV7OkRIaVJwBMCshbA23UTCeOx24cme7nDi0B9SluRRARUgj?=
 =?us-ascii?Q?iqa8WjCtnmHvJC2uwWKeySUpv/OeUQHes8zAxVb6HGMn7/75X6z0poUirqGs?=
 =?us-ascii?Q?hA2NZ0BD+Hc1K0I4gUpfjn+p/alMmzsI4MVFbJ7M/LVh4fKYhrfb8gKe9dyF?=
 =?us-ascii?Q?lPgPwSL6QchcPRTd938PrZMmLVlo7H/Iyu5e7Bo7HUWdE0Mkjiilks24nhSZ?=
 =?us-ascii?Q?/xJMwf9SpLRlJC0+Ht1U4GGOzYNB0Gcr4tDAaUH5X/OTEf3anAUdCe8xj8eE?=
 =?us-ascii?Q?SsSeiu/yh6aXJ+smxgAI7+4K9R6aiL392gz0zm7uxqI5ABgI0SKbtEU3PPat?=
 =?us-ascii?Q?eKOssPvOPT8E1cIq8pklnzZQOHfEnq7zGezyZ9teyl4BIFbEaKMWql/4pnVu?=
 =?us-ascii?Q?FP56B365V2v8daTg9z+hLssmVoOX+g8il6fPnWOCj6MmmY0Nm12a7yQlTlqQ?=
 =?us-ascii?Q?5CB7yJD7jDwCmZCwbGqksOrZINWGw1OmOuBFgaHGiwbUCPsory2Y12rMwl/Y?=
 =?us-ascii?Q?7giNz/JTaz0nEzpslrbvdGB1WuYhUMRc5oe3A7B986PfMx1TAqlajTniJO4S?=
 =?us-ascii?Q?05Id2d5NkEkzKXx8/F7JOQbMZxMQP8lcpyfuzo7TcWEp7Z+n2KjjYTMlcwIN?=
 =?us-ascii?Q?5ttPf7KxkasuaeQWZC0dkzQrDbULfQX0ayB8uEU1ZpC9F1qJYqNcJBPvSwx4?=
 =?us-ascii?Q?ga4/VWRq6iGt7MPEImNAg3F3cjPGZDGzHG6JSXSjyF7uWKFsRE6yWXIgGUsG?=
 =?us-ascii?Q?SkxI3gfPFp5CvEoAH9L4JM8nvULw9I4l3Cj/9xFf0PkZtXP5lJtHUp0Bi6H0?=
 =?us-ascii?Q?7Ylu1Qs0hoV+WNXq7MlPD6aTsMt1BA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb273c9-4400-4886-7a34-08d8c4762679
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:51:40.6024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVQaW5RbdYMmMoZ7mkvDE1cczvu9Dy7R8QQGdRNJqd/yF6zv1xj4oF2pSgwFeSf3KEsTHGhd2CTEeVkutJWsMvgUeM7blOQe6UIXruXvmB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3621
Received-SPF: pass client-ip=40.107.6.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

I know, I have several series waiting for a resend, but I had to switch
to another task spawned from our customer's bug.

Original problem: we use O_DIRECT for all vm images in our product, it's
the policy. The only exclusion is backup target qcow2 image for
compressed backup, because compressed backup is extremely slow with
O_DIRECT (due to unaligned writes). Customer complains that backup
produces a lot of pagecache.

So we can either implement some internal cache or use fadvise somehow.
Backup has several async workes, which writes simultaneously, so in both
ways we have to track host cluster filling (before dropping the cache
corresponding to the cluster).  So, if we have to track anyway, let's
try to implement the cache.

Idea is simple: cache small unaligned write and flush the cluster when
filled.

Performance result is very good (results in a table is time of
compressed backup of 1000M disk filled with ones in seconds):

---------------  -----------  -----------
                 backup(old)  backup(new)
ssd:hdd(direct)  3e+02        4.4
                                -99%
ssd:hdd(cached)  5.7          5.4
                                -5%
---------------  -----------  -----------

So, we have benefit even for cached mode! And the fastest thing is
O_DIRECT with new implemented cache. So, I suggest to enable the new
cache by default (which is done by the series).

Command to generate performance comparison table:

 ./scripts/simplebench/bench-backup.py --compressed --target-cache both --dir ssd:/ssd --dir hdd:/work --test ssd:hdd --env old:/work/src/qemu/master/build/qemu-system-x86_64 new:/work/src/qemu/up/qcow2-compressed-write-cache/build/qemu-system-x86_6

Vladimir Sementsov-Ogievskiy (7):
  qemu/queue: add some useful QLIST_ and QTAILQ_ macros
  block/qcow2: introduce cache for compressed writes
  block/qcow2: use compressed write cache
  simplebench: bench_one(): add slow_limit argument
  simplebench: bench_one(): support count=1
  simplebench/bench-backup: add --compressed option
  simplebench/bench-backup: add target-cache argument

 qapi/block-core.json                   |   8 +-
 block/qcow2.h                          |  33 ++
 include/qemu/queue.h                   |  14 +
 block/qcow2-compressed-write-cache.c   | 770 +++++++++++++++++++++++++
 block/qcow2-refcount.c                 |  13 +
 block/qcow2.c                          |  87 ++-
 block/meson.build                      |   1 +
 scripts/simplebench/bench-backup.py    |  74 ++-
 scripts/simplebench/bench_block_job.py |  33 +-
 scripts/simplebench/simplebench.py     |  34 +-
 10 files changed, 1039 insertions(+), 28 deletions(-)
 create mode 100644 block/qcow2-compressed-write-cache.c

-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E192F8F8A
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:57:13 +0100 (CET)
Received: from localhost ([::1]:57114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tZI-0000kW-Jb
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:57:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQX-0005Sy-3l; Sat, 16 Jan 2021 16:48:09 -0500
Received: from mail-eopbgr130098.outbound.protection.outlook.com
 ([40.107.13.98]:5600 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQV-00076Z-9b; Sat, 16 Jan 2021 16:48:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nf9Hgd2tq8LrUDFHftnxV+Ft5D07KM6hV2TWv74cBWrb6U9OavAF9r0X4pqup84XhYPSHqdn/Vs/GKRpCYDCG6mDwLHNlNSyMfHXiE2Fdy21FddsKyTLkbV4sg1+dQS0IAbCva/ZTj5MUlvySa+96URGVMOM0Ag75NzoD1C7cVit/G5iaAFh/ahbAGoOYysxlEgu4yzfMX9MoIoTjNlwq7CiXd7A3EXGl0pWfhzrdgctrxqEaurXaj/DFbDS9TcyGiyUPScOuMuYf4OVKitw2xQzw5jmhHRPpccO03ZEoWFT3aUXlzoAIjE4UBkKwuRemD2Z4TcgILa6DbVEkTYGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lBM2AnKxW7ZuTb3jdO7mUtvJBjayBxH4rq0LZZVIN0=;
 b=Mi0B7xShGe8iJJX9rmCdc5/Z05eUl8xnMxtJk8ahaxqCh4GIveyzxBHRUyRLc09QKmXfJT17hTDziOCgjQgiTIe3Fp2rC07MGGvUnjoahRok/Yhl93gWXGwpvG3WzZ3wAs7k+7Kea1Z0YW9vsKyfZ1gy2hjXj8qqbIdlFlG1qUYBoujCboij+TRB0jJTDZNdl4TT/Yj4hVDavxP6exq2f4mfDLIjocXTZM0jHiaXJv0rjEZLZBno0Lm2STknt6yQBEI+4V/yzadtp7Lt5+EqibFEHeF/WpseEITM3d+s2aN2PduMCLa8H7HVCkdyW3RsBTY6QKdUhUxz3m1WSQ3y5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lBM2AnKxW7ZuTb3jdO7mUtvJBjayBxH4rq0LZZVIN0=;
 b=r9KP7zECrBzXvIcTW9KiXtpbC1NHOTq89fxWeKn95ucRZJ3j1s373xBE7hzZ4wWii9lVeHSJglFH01iTk0AXEUuJe+WkNFB9SxgZwwfBHzK0D/nJyK1GfJh35NP37FSXvC5DOLzyDbNJzpxx6Gr+URoSwybOCu8wu1edcOlgMMM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:48:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:48:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 22/23] simplebench: bench_block_job: add cmd_options
 argument
Date: Sun, 17 Jan 2021 00:47:04 +0300
Message-Id: <20210116214705.822267-23-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:48:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 830c8ae4-ce73-4af0-4c6f-08d8ba6865e4
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20336CB0363557C7C0FF0E62C1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GDbesPIfO+UQ97mSoV3eTuAxappEzkZxe6oYYVh40tOzRnYMfvjF7S8/KBC0WV/GvDhsB+rsZjuJoI8CTDysBRNiszWewcEQFvXkv3Lmed+6lm7VICKFhG4YRLD29qf6FCD/hdpI1OUb4+M+J4hvTlGVmelcakK+zYGFjyT3nq/KOWdbPvEJ++7NTuZnFaOoPTW627IR0O6jKrq89H+UCN4+1zrKrf0xZipPdBx2oBv33Zb9isSoR0zs80oVV14JJnx3DCdsjZhxkKuxf0SPuWNbRcSM6vwuJW3yWMX2hMZnI9QJv58DcH8rDFKWIRJDHOyk6GDduC1VwgAykioaF0NKZIMeg/h1Gg+Y0xVRN8jIjcVWhH7PaDQjWgKfgYiYhp7XgPgGDxp484Mqho645g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FlH4PhxQ56yndy2fGAHiNhOesOo2J4ltlOiJUHbMDpdBUZbmLbcxwNW+zooJ?=
 =?us-ascii?Q?hcYaTs0PlIA1VTF6+UN+QmtVkORiDI8sE5Lgx4G3nj10jz5R5aj+X6DP6tPa?=
 =?us-ascii?Q?V2jbs2ZWpAsYryKGzo6YDW5dimi0CCTLR02SqHJM7j7esvsH1AsjZ/uzRjfH?=
 =?us-ascii?Q?OQtbwEUhEEmXX5X0pohy0kF73C4H0NLyMro0EnNYiCMecPoocB6yq/e6FXeK?=
 =?us-ascii?Q?96Q2e+6RI97fzJJXibymgnlwjrIwrxFH995Q2sd1GRJR+oE79X7h7Jn+Ot8o?=
 =?us-ascii?Q?TO0fak4fXMt9OiP2O6HF7orKYVG+fPJE39NKLSWdZSl2B0ZfuCPXa/k8GXT/?=
 =?us-ascii?Q?dA+f2z1+FVfIqCl30lIOzWk2K760/jRQalltrHXJ6DuJ3sYlnFt1bFKZ5nR8?=
 =?us-ascii?Q?s7uS3V6alc8joq66rbijtiZWpsvXoA7xm5wB/i4kK1oyKcCuQ6v8DrspagvD?=
 =?us-ascii?Q?vGwppPXVfs0BE4Notv6ElHR+QowvoFQlqRQuO0a7Hx1+LorR1vKl9f2HKxfk?=
 =?us-ascii?Q?mxfVMSzeZC0y0VUzDKvhXvYLbkH+wX6VFMldNAo4R/44RfAqvmy8PdH9y5SV?=
 =?us-ascii?Q?IA+2hO3DOXzDSXAgcIUKiSvPGX8Jx87YXrtFc5autsskecKQMiZbctzcM8mG?=
 =?us-ascii?Q?/P5kTeFO2vnFC1rniw3AWI+dI0uY+6u/Zmox2TuITBrsVJfF+lDrEW4v4SoV?=
 =?us-ascii?Q?7bQgIB98oDv6wArHm5YLU/Ao5ZzJfzVHZZRyb/8nYg9xqPmFAsWUrZNB045e?=
 =?us-ascii?Q?aqZ7E8rE7lc8VIc6pHFUqonIIUb0U+8PXZtvHb214vPG96NKci5beXymtc3Q?=
 =?us-ascii?Q?M/7MFuGvhfTN56FWAHKDKtDFKlyfSHPMvJbAY0eMsT9nVSn1jA8+JKXY1nUU?=
 =?us-ascii?Q?iuztMDVjL6lHeekHknwglC2m2RrYvyYLetlx/K3WVuhrkWiXWIUrVm8oedbi?=
 =?us-ascii?Q?/qNV4dpfGvo7W80SkQkbuOAaWE5jF8BztHeVKFImp1XxP7X5HbjU4l8+5hhm?=
 =?us-ascii?Q?4ajh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830c8ae4-ce73-4af0-4c6f-08d8ba6865e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:48:02.3791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLJZrJR91c/h0gMuUKHFbxeiIbLbFfXlbki+wQclIWkq6UblJl5aeBClB441NBR5jHAAFrcQA3UBCgYhH0ZIqJJqi/SijsZchUBV8vnvCoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.13.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add argument to allow additional block-job options.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 scripts/simplebench/bench-example.py   |  2 +-
 scripts/simplebench/bench_block_job.py | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/simplebench/bench-example.py b/scripts/simplebench/bench-example.py
index d9c7f7bc17..4864435f39 100644
--- a/scripts/simplebench/bench-example.py
+++ b/scripts/simplebench/bench-example.py
@@ -25,7 +25,7 @@ from bench_block_job import bench_block_copy, drv_file, drv_nbd
 
 def bench_func(env, case):
     """ Handle one "cell" of benchmarking table. """
-    return bench_block_copy(env['qemu_binary'], env['cmd'],
+    return bench_block_copy(env['qemu_binary'], env['cmd'], {}
                             case['source'], case['target'])
 
 
diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index a0dda1dc4e..7332845c1c 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -78,16 +78,19 @@ def bench_block_job(cmd, cmd_args, qemu_args):
 
 
 # Bench backup or mirror
-def bench_block_copy(qemu_binary, cmd, source, target):
+def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
     """Helper to run bench_block_job() for mirror or backup"""
     assert cmd in ('blockdev-backup', 'blockdev-mirror')
 
     source['node-name'] = 'source'
     target['node-name'] = 'target'
 
-    return bench_block_job(cmd,
-                           {'job-id': 'job0', 'device': 'source',
-                            'target': 'target', 'sync': 'full'},
+    cmd_options['job-id'] = 'job0'
+    cmd_options['device'] = 'source'
+    cmd_options['target'] = 'target'
+    cmd_options['sync'] = 'full'
+
+    return bench_block_job(cmd, cmd_options,
                            [qemu_binary,
                             '-blockdev', json.dumps(source),
                             '-blockdev', json.dumps(target)])
-- 
2.29.2



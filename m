Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8A6308AFE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:13:47 +0100 (CET)
Received: from localhost ([::1]:54604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XL8-0004RM-30
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X0c-0001hv-54; Fri, 29 Jan 2021 11:52:34 -0500
Received: from mail-eopbgr60091.outbound.protection.outlook.com
 ([40.107.6.91]:6275 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X0a-0007Pt-Cg; Fri, 29 Jan 2021 11:52:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahfv55aVf+GU1+rIZk3qgvv3gsqOWzOzFxIzzlKYgMjTFvjCQFvs3Rci2GfCN3EB6MsFEVPGJYl0hbC+CJ5wqzFayYQzq3hi9uQPf7ByvMPewvZaA4tsZ9r9lv2km1NW5unlbf4PsNTSeBOxsW8vI68ZoJ+RHxRIRWWEY6Q3Mi6T5InPScESxPrJNUoC8pZvsoE2LAKkbUUH456OsSrmD1+gWwymSv12cwg0c5umbmcHTZJV43U2qjTv/+h7TGpQGEy21PlyLvlw2mg0uLKd4IhXjHfsP48QHoQPG80wc9vG7IKKqe1UYENVaa2eunjyRGFnbOdA3UmRYEfGW4qpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9W6LalOsIt3Et6jNrlcoNgD3GT5xRaIrROxEsXqnkE=;
 b=RjXPm2uHX2R3ckUX/tYvO42SOgmthuMhhk+CBYSPNHpk2aaM6Ck0q2r6fmDeoeWu7KrR9GmdvQo163bgPdY0lkIFgGGy3CUKzVaw9bdi4ofqUN6Og3gTCo9bRY2j9BxuXzk7hmJagoeDeQmZhVs/4gVKXFvCbnQ/affBbBgK6knVoVTdYMryngs1Z5ainmUUikJNVml79bQJgOEoXnauTXLRgQClasjoMiva5wvtC/RgM2JMrM4kyLGki0Lc9OtyW1fsxQrkHUq4LL/xItsNInnp0bfk8Hbxf5XsUxgNgiv2t3fEDDzmsEwrCoaMjtRttUvUfgvDWPeMqWQqEe6rbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9W6LalOsIt3Et6jNrlcoNgD3GT5xRaIrROxEsXqnkE=;
 b=rU6snV9Lq/lYQ8m6FdAkQvBX++1eGN2PbIjWJZ+1k0kvD+sm20bTvuGATFM0rZ+bSqbZPnOR5l5bR+Q9J45Rdl0e89Yk/ZbXpk6gR1B7Y4VqodXpR3K9xvQd6cLdxORfGqcMH8JrK+dszmdJUbUttLNDR2C1N3nIQBgqNBq63cs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3621.eurprd08.prod.outlook.com (2603:10a6:20b:4b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Fri, 29 Jan
 2021 16:51:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 16:51:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 7/7] simplebench/bench-backup: add target-cache argument
Date: Fri, 29 Jan 2021 19:50:30 +0300
Message-Id: <20210129165030.640169-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129165030.640169-1-vsementsov@virtuozzo.com>
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
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
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 16:51:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c1246a6-11c5-447d-1190-08d8c4762a0a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3621C49C2E34CD0CD0D450C3C1B99@AM6PR08MB3621.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: StpupKaWAbCX9UTjlRwGTNEiVH3C5PLhqw89riZXq3QNmFr4Y8Hz6q1JTwOln5UaGxtOncmR77XDbJSkAER2lkf4dOA3bIFkmuHAOnvPSLZZJ/sYnurNw5YBA2k302bSSU/YrGQ+h3S0yPTZv5uzRTdCyEf5iWmKqlYDIjyx6nfWM0IW8CskbzVIXfzFUsKugDFjIFPqyZU3VjHG1a4pDHAgp7Cp+6eDyCs1Y9tf5wGVBbvvrchKpmU0SxEiz/g1k+OZ/orWMsx31Y0+bKGQ4GTlg09NMbHO0Fi6b6UoQADvHxcsk6RedxkUZrErDNc6St9t5N8RCUSzCR4diiYthwqyVCNp6q95WsrpIU88SblqqyvgwpQJ7HfKQOWZFMDKnHGtRl7URu2zo+WaEMJ3NsSUtAv1b8kDEffOjh3xFmOF0rP3QjkvjEdFs3lOp6Aun84UQNNbveqDtD5ZEbS0zDb+j3pAY5eZdJM0B4hBPAHoFoe8/Haq8oNE4bf5NGiIRM/xWo9F9A/TqInoyxdYJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39840400004)(376002)(66476007)(83380400001)(1076003)(86362001)(8936002)(6486002)(316002)(52116002)(6512007)(66946007)(8676002)(2616005)(2906002)(66556008)(36756003)(4326008)(16526019)(6506007)(26005)(186003)(107886003)(956004)(6916009)(6666004)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pLsKWsFmfx85y4YoQBOVSgRXvf5GDApX//fGPYD0bNU44N4wJ7lI7GxrtmjC?=
 =?us-ascii?Q?F1EGtl4bBLXXT9Am653kUnzuTT89CU2yzVn336/rVIQAhwOB0IZK/1MgMVYT?=
 =?us-ascii?Q?+g5jj8agEV6gn7CoFPFPa8UaT6ubnOHpLPyuVYofSnGKKKDLrRf6BT6tPy82?=
 =?us-ascii?Q?EbxArTDwM0hwpcfrJeDxxAmCOEWipKZ73eRPKcA8FJ2B6g3JQRdeUYzf6D7C?=
 =?us-ascii?Q?7EDS96E7j5RnfscsL96YTRrlH9+tsiPNI0KDHYRwK9p2uQ3Aaf3bJSeHdBUf?=
 =?us-ascii?Q?09ruwVX8eDpQc6cW2OgFgqTCpj6K92mmdd6QCzltJSUndeLubiYaxl2PVzG0?=
 =?us-ascii?Q?PgtbBanVwjZbFmH8mRjnkZJR0B2/2aAGJzE4cF+Mcml+9NXymNVfq7leeiae?=
 =?us-ascii?Q?Gorv0D5O638sWXQYAkvMNFGVxUDRMvGqrn7EUVv7r/wzekWyjGL0P39ONz35?=
 =?us-ascii?Q?pg4DUp0TZm2emvnOpasYn47kGrbK9WTil28wLC7GBBq8hDZebjSd14tehxcw?=
 =?us-ascii?Q?VrsMx6oVHbYHSl1nGS1QqjEYz0ONTbSW4kv4it28oq+PEHei7Yfnh53Vuek3?=
 =?us-ascii?Q?SYk+UxJp2t80jUTSr1BGoR9t2B1H/wTzLVCAzgXouwbWOBj5gQcSzTMTVmlE?=
 =?us-ascii?Q?RxFeMAhc7gjFVC4ImVFJo1ieAliRsxBW9PzUP2e3lz+uMvF3XqyWIUjpwlMf?=
 =?us-ascii?Q?4GeYFHhj6aEEY2j/3B0YWvqrv5Jch6Gbkbl1f/SaAQd27UcRghsiPmXppt4R?=
 =?us-ascii?Q?txbZGzHowEZxrWx3iabs4OvL4Yug0ekwzpRIZVutWBoUrlt2IAPbx+vwtLmM?=
 =?us-ascii?Q?5nKwYx1RhuVZ0pQYLcT5F9d/9Lao62wd8T5dPoU6bKQjFsNJhq7+JtztaqPR?=
 =?us-ascii?Q?jruu+Nb3r58n5Pq2HTXbiBT7RcuY7eZcaLRa6/C6FxXjLZBzCN9cpaKocvX9?=
 =?us-ascii?Q?KTDbiX0ODNgeP9eNb3PKnAltITmrc29S+QyV0ymes3dypIYe3YeENDVmEoJo?=
 =?us-ascii?Q?h0IVJxlHk3eIAI/HiSB09Qd8g9zv1lcuJyX3kYJawzot8J8fHffQFB5xtFe+?=
 =?us-ascii?Q?0Of2rfXk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1246a6-11c5-447d-1190-08d8c4762a0a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:51:46.4996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T51Z7Uu6pHfXhxKovHkoVTg6w2M1YfQBzxljKSKg4L99WZI3uzy0Qu0COdaZB/yDyeJnPMl6INsVDb0ZqLhXMIzPuyUQmlwvB8sIP3Ce+x4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3621
Received-SPF: pass client-ip=40.107.6.91;
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

Allow benchmark with different kinds of target cache.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/bench-backup.py    | 33 ++++++++++++++++++++------
 scripts/simplebench/bench_block_job.py | 10 +++++---
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
index 72eae85bb1..fbc85f266f 100755
--- a/scripts/simplebench/bench-backup.py
+++ b/scripts/simplebench/bench-backup.py
@@ -65,13 +65,26 @@ def bench(args):
             test_cases.append({'id': t, 'source': source, 'target': nbd_drv})
             continue
 
-        fname = dirs[dst] + '/test-target'
-        if args.compressed:
-            fname += '.qcow2'
-        target = drv_file(fname)
-        if args.compressed:
-            target = drv_qcow2(target)
-        test_cases.append({'id': t, 'source': source, 'target': target})
+        if args.target_cache == 'both':
+            target_caches = ['direct', 'cached']
+        else:
+            target_caches = [args.target_cache]
+
+        for c in target_caches:
+            o_direct = c == 'direct'
+            fname = dirs[dst] + '/test-target'
+            if args.compressed:
+                fname += '.qcow2'
+            target = drv_file(fname, o_direct=o_direct)
+            if args.compressed:
+                target = drv_qcow2(target)
+
+            test_id = t
+            if args.target_cache == 'both':
+                test_id += f'({c})'
+
+            test_cases.append({'id': test_id, 'source': source,
+                               'target': target})
 
     binaries = []  # list of (<label>, <path>, [<options>])
     for i, q in enumerate(args.env):
@@ -186,5 +199,11 @@ Tests, in form source-dir-label:target-dir-label''',
 Use compressed backup. It automatically means
 automatically creating qcow2 target with
 lazy_refcounts for each test run''', action='store_true')
+    p.add_argument('--target-cache', help='''\
+Setup cache for target nodes. Options:
+   direct: default, use O_DIRECT and aio=native
+   cached: use system cache (Qemu default) and aio=threads (Qemu default)
+   both: generate two test cases for each src:dst pair''',
+                   default='direct', choices=('direct', 'cached', 'both'))
 
     bench(p.parse_args())
diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 08f86ed9c1..8f8385ccce 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -115,9 +115,13 @@ def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
                             '-blockdev', json.dumps(target)])
 
 
-def drv_file(filename):
-    return {'driver': 'file', 'filename': filename,
-            'cache': {'direct': True}, 'aio': 'native'}
+def drv_file(filename, o_direct=True):
+    node = {'driver': 'file', 'filename': filename}
+    if o_direct:
+        node['cache'] = {'direct': True}
+        node['aio'] = 'native'
+
+    return node
 
 
 def drv_nbd(host, port):
-- 
2.29.2



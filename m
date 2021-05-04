Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1E43727D8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:09:50 +0200 (CEST)
Received: from localhost ([::1]:35432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldr3t-0007OO-N4
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqw2-0000wO-9k; Tue, 04 May 2021 05:01:45 -0400
Received: from mail-eopbgr70111.outbound.protection.outlook.com
 ([40.107.7.111]:44193 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqvw-0001yk-5B; Tue, 04 May 2021 05:01:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+lidd0M/cU4DXu3Oqc0p2AYw/NaDhfnHiLprZ3UlkESfc6dTJfzaU/RqL+51MyW8crNcYByYiMWOODKZ6+gRP1TNdWq+67Soj06Y52C35rrkemn+qaMRnhgmeNw4h6wI5nPhLFvg6YMuUEu3cIw9cUcpVZ0AhX7SI+2FDuKagoAt6NU2KSL+jJ9nucTcBs/M52xgLSU0zPndlDkwNEJx+xGfrZqM9Rt2GXyROlOftHHtqNIW++0UyMtQGBj5Lo5rzi12zi+jVMdKBGGrv7OnCOmPeqHUblXMBI1rqITVhzzJ6YKXNH3ya1WnOa1iauAgq7hW7ooX8nuZHUKExn5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8zBsmMxJRJ7JdwQ2/eVs5MHRhIVTdBAw5wcBts+qaY=;
 b=mTcZKkr1I2d6CbKRIUZ6SfaWMXkzFG/sJe+XPF59szgTqAxkjMFRvwwy/cTIZ3i+Nqq4kj3345A334YY/70oVXYW/vNfuG2FB/YTk/lHVVgRIhyS2Z9gDuDmy31rHf3DYF0yVeWld7mggXf89uKa6ZZitEGxT8TBKzFTEtshxqLaGgZcWelWHDj0H4KtTFPEpOTxJdrWWSp80wbBhAP9OCV0nLIUfNyCA08Nk0s6+P0txI9sdLZKLPTsgYNa8LO1MzZjwy0xEtHZJ05wzqIRTZR/0CLWfLEPUgrKXBORF1Fdx5rPEwGpwvBmP5xnXMtDuWOqVOBfRFgWsOkw3Vcoyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8zBsmMxJRJ7JdwQ2/eVs5MHRhIVTdBAw5wcBts+qaY=;
 b=YXgdDuL+zSdEsDAFUtGYtAW9drma5Eguu90ZlyLQhFHdHBq3GZTGuj3E/yD1NZ7dqPJhGJxVBlWbktLohG1wXcL7TFhcm5Gy4Sj/H++ld4sqlj1Fs5QU7ISDtHZXlEXhPa2ivdC9CqItWbtozXmoWqD8AMJgCV6OnnlBo2zV+0M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4280.eurprd08.prod.outlook.com (2603:10a6:20b:b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Tue, 4 May
 2021 09:01:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:01:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, peter.maydell@linaro.org,
 John Snow <jsnow@redhat.com>
Subject: [PULL 4/9] simplebench/bench-backup: add target-cache argument
Date: Tue,  4 May 2021 12:01:08 +0300
Message-Id: <20210504090113.21311-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504090113.21311-1-vsementsov@virtuozzo.com>
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 09:01:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea0f3c53-63ee-438b-db79-08d90edb3685
X-MS-TrafficTypeDiagnostic: AM6PR08MB4280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4280885BA7E2287411A7C179C15A9@AM6PR08MB4280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lLWMkkJauJ57LXPbyJmeCHWbL9JmfgItuf6w96A3CMLmKNpB9Df7mP4WoNAOMx6+gktz2O0X2jvNmdKDEw9cu/uMV9DzZUX7kJJ82HtYntz7x9LDLy1Lb83zHscrjZJoUKECff3FslgLX/yuYZIpAOhApCmlA65/3yJN8gV6ghejqcZcmfSSHVkiJt/tbSRiwEoX+ZhmUvWYF1LBI+lp3d62wxv/dJfjgUPsFTnGmlBGSdFJkQluuOcE8NlHhf3z15zitQVdeGp1P+97KIJfPJwOHXBiDHjH322RbigzUzYGSPlwkcjxD+VX+kAIUzNMI/wAeTGMHY2dCGPbR6Yh0cSNUvJudzC9h05qLOZcEb7rRCSVNJFNq0SLTmPZ/p7zr8kZwGa6hfFKg/YgSkfNB5RkBlmLf5jrvMk43U6zXQypynOpwmevwi35ataIaQy9RBbVQ0GAeajmKIHZaTCrqsqA5AJTrvx7qHDiJJMUt4Ffu8B1R945ZKIN/IQ8Lpoq/QzBIE/1JihFAfoHfMqyEpvfuvQzGEyipg65Rt9SsCPY9JEKtsyFKfUWWxQ4zsjj6kobLkYE7FAIc4q6dy/aJDd3govpPWJ58YmVN+xC6/r9baaUOlfUQSGqfgphxozaDzZwb7UJGz9M3kIbs3tWE6VxvAHx+LtgrW458yuHJc5A4gyeueA06LLewbjZhz0l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(396003)(346002)(376002)(366004)(1076003)(66556008)(52116002)(6486002)(6666004)(38350700002)(38100700002)(4326008)(66946007)(66476007)(316002)(26005)(5660300002)(36756003)(6916009)(478600001)(8936002)(2906002)(86362001)(16526019)(8676002)(2616005)(6506007)(6512007)(956004)(186003)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PSadyp4clU6wvk2W31WEHx3pmQBvNkfUnT7LkFNGPCWosVMsAGNwc9gfSLrP?=
 =?us-ascii?Q?2lUIzMdpZOo9Ks70Kc+GPLYuieN0gjoWu7grGVnM7VCeuT41+G7sc2+OHQIx?=
 =?us-ascii?Q?uvZGv9yxdz5Jf4C4xqLEVi0uJ+M0osc013f8QXKI++qwPJVBebctw6lPTIdL?=
 =?us-ascii?Q?9HQ7PCm/W3E3ehnb7A6ICDKF0QqK6PkZRR1dppAUFhohi9SyvfzVZ8/26+TT?=
 =?us-ascii?Q?mToBeaCc/jQou9QuTZPzgnXYnMnafOfNR5aZNjrNSQLtS4RzDH3er2qD96zy?=
 =?us-ascii?Q?CQqmQaCJGJyQC3kMejSymIjaWmd5Z542Q83P+NS4CSJPf0b5kk/fn+C7AAxi?=
 =?us-ascii?Q?TcLHpDA57oagPSA7c4me780EiEF35wfzTN3VqUEhj1HH9agcnO1waFpRUP96?=
 =?us-ascii?Q?emRuGjfCwPvDsf1wWxlsb1P3tyQEQ+BnDOaO1+gwAwLKTutbgEvD97vijjeS?=
 =?us-ascii?Q?f180l18jJ0HmWWWI3YfQDAQVVBNIXLgz+UnpakOYC99bpfnNA9GeT8CSQGCz?=
 =?us-ascii?Q?Aw/Fh1lxhzCKNRd1uoQy8laV7N2JstE/BPdPct5vBmK0k/BC/SrhCblVZ1Wf?=
 =?us-ascii?Q?w8F+zmzJKy7DIwasoOPFNuzxcM11F7Ss+4FhDypvGuvScr18AfxLBqC252BL?=
 =?us-ascii?Q?Ehp81LCoA0+6Yzb98vLCOm/2jaCS1IO2lDoQR74z4rL1mT7sI7tL6zh7nafh?=
 =?us-ascii?Q?vYildr/DJDyecey2NgDckiJhBl7PjeWRJWzZnnCWF82uAAfuROwKqyXy3fI1?=
 =?us-ascii?Q?pGwD9xGfyDh9dOLBJuqBhD/XHDNJS7KCoJJfZOPT8Y5Srjah9/Q8P8nYmy33?=
 =?us-ascii?Q?XP2eCb6E7ElIrSI2gk92ANeNxdun2Sw+J3JnnPrfaTUiN6JQ50EZdJ5fTqbk?=
 =?us-ascii?Q?7Rjc0AAL9Sn3i/BenRCIsVplwgT6tRKWm+hhfcWsjpnWKD+7a7ZMRtdoUGZT?=
 =?us-ascii?Q?++RRfTcSYe01+bTzLyyafyBz0lEYbmoVoQr1T5vAe8peV5OGtVErVBkI83M0?=
 =?us-ascii?Q?3CHI4pXTCh15MJa9SLQhG4qoyyL8b/DClTFVag1zU/FmBhVbm/h+DFMiZ+5K?=
 =?us-ascii?Q?WCOOqMjl0o4EQZycy96SfhH6m84s9QNSK/kGimYXasqx53u9Q1hBTiG+nce3?=
 =?us-ascii?Q?onjnS40PL2W0hzRzxe2MQLTlWJkHvHemaF4l8BzOB8yLlzC1DKAJd7Nasfhk?=
 =?us-ascii?Q?LkMOQ260y+uDtCUopmZzmIFAnOQVGr8twBvnRO84dkZf4vjmk4tT47UTzzeL?=
 =?us-ascii?Q?F8UMBztu6T4071VYbR2F/saTVpGwuRK7uaykmNFnFbyXiVlamlL9sfK+ECFP?=
 =?us-ascii?Q?n+tZVIJcE/7qcFctN3I5cCY6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0f3c53-63ee-438b-db79-08d90edb3685
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:01:32.6249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3dfgPPj0l8uEaXlb6KurxZkby97Z3/CN2REVFKjibxZprvDFDNufZtBeS27djn3x6Hjr2Kz0rscTggiIo28DSjIzI+4jB01Yngn9LuTfss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4280
Received-SPF: pass client-ip=40.107.7.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Allow benchmark with different kinds of target cache.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
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
@@ -186,5 +199,11 @@ def __call__(self, parser, namespace, values, option_string=None):
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



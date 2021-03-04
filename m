Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F165F32D098
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:22:55 +0100 (CET)
Received: from localhost ([::1]:42790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHl8B-0002Lu-0U
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3e-0005H6-Ov; Thu, 04 Mar 2021 05:18:14 -0500
Received: from mail-eopbgr20120.outbound.protection.outlook.com
 ([40.107.2.120]:19927 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3c-0002G5-OV; Thu, 04 Mar 2021 05:18:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRJS0dHFnZsTN/vK3FDEKtSwwVLrcJuMr5zF1mjwsDUQHiDWgNt5v2xp93oTZrB/IoPacl6AK3hFlQNuqVBpv+Qa41FRXoLkXYU3lboWiPz3hNky9ME4BzI3/3x39NYkGnZCxfhn5QpnwRBG4KXxW8n5P3N331xSzsEfg7Nzg1ZD/O1tS5dZcx57rRtoThriJe8g8MOk1Tr7lslDaDq5LFBwS/cGlfFUVZMhfKqFLgibI0ABhMTkvK9rSBvdL0d2Pe/d5rW6VYRHT8c3uixSUAcTnFAudgDNNgLpo2e4B4WXRSNK6/CHCYKjyDBKtQq8YieCYQHFDVwmw/yGChlopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZdv4tGxhshQTNcM1V0R5y3VqZmOGaWAX30skJLFTNQ=;
 b=Kz2k9PkNfcFruyz5H/6W/3mfF+sAx3fEoUYax4h7+gE9hDy21JzkdivXntzPkAzSobH080LMmpADQpJ78CLVlcIjNZ3KbluQqSc+BgFsOMRLevyA1b9mIjqnKnmjqF0cWqFkCiJILRqhyaeU5wDdq3uTDHdwKeZx61U7e20/Q2RZj5UlbOldrYM/4mhAuZ5SUfoBg1YxRptJSCgX7LMSnHZNNuM3o57s5y3D/RFIIpawYb9Wz2q/5SoCLb2S7SErJop3Pp5qUKNHRuBYTIu/4sDCH26uOUTNrTrOOL5nL37KYX9KwmYhVDiUzueRMEm1tEst5qT39qhUF0kXTE2VFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZdv4tGxhshQTNcM1V0R5y3VqZmOGaWAX30skJLFTNQ=;
 b=QPfAWcGSigfAXOClz4CuYEfQ7RkwAKeU8mh8MNk+kSYANX89sZCTK/UCItmbsa9WGDSasWRXM1YlzRby6gBx+bmQyX521ZYUIEeyyf0aDJRwCJK+b1E2FHuCxrpD6VI5D2a8pXx31X32ck1qf7VvXzVAftflwnAlKchV15LP77A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4913.eurprd08.prod.outlook.com (2603:10a6:20b:ce::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 10:18:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 10:18:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v2 4/8] simplebench/bench-backup: add target-cache argument
Date: Thu,  4 Mar 2021 13:17:34 +0300
Message-Id: <20210304101738.20248-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304101738.20248-1-vsementsov@virtuozzo.com>
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.246]
X-ClientProxiedBy: HE1P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::45)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.246) by
 HE1P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:17:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38f4a2b6-f4e4-4f5c-b49e-08d8def6c9ac
X-MS-TrafficTypeDiagnostic: AM6PR08MB4913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB491371D4C204C9C3A5960266C1979@AM6PR08MB4913.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 23edKMRiboufer/BOGFSeo+VmSjhITVAw+kBo/ldJtxaI6/4rofkmfBXaUr1GaP7lDUilO8WjjgCFLAbJrfDHahW0nif1a1DlyTDjZBvmdecYnm85MxUDldYjHh76JHSngxVKoOoA6Bdtuo1kzBTOLr7LzICNG+6jtIM9SbRvRWmtlCNNE49qOYRtojB7rYVC/sADBnEukNvZNitb6bLATWgjhW24Bt5pI1xgKJBh/iJhe80+H8C1fWCPQlXrSiyx8wOYNWc2XsubehIZ2LfPjzpfkq3S7E6yzw01+JA8FbxCjpJj82TKS5T6JMQTuOl+Y7YzEzv2l9yCBP/cWAN8xGcGjCE/jhDluOBINFpfMYH6FhdBu9ri43uiyDrS6utZhaB37mVkjOcWyat0Ac4WNz6e1ROaImfT/MoEaq97MEJvI7rtEyDKAbGdLhSJwNkarT6IXsSr6NPP+YbiH5EJdSvvss2e29aTV9z2Icyjf+Hzb4z3PBZfTNiz0VXVnmi9qGAGqXOP0URVeWTppzKA06cgpmN30sajJIiYIhlwnNot00pZGQZsAX9atKOad/kIylcxWjbX5GJqyIRKv8t1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(376002)(396003)(366004)(346002)(186003)(26005)(5660300002)(4326008)(316002)(66476007)(8936002)(69590400012)(1076003)(8676002)(66946007)(66556008)(6916009)(52116002)(6506007)(6666004)(16526019)(956004)(36756003)(2616005)(6486002)(83380400001)(2906002)(86362001)(478600001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bqJ8uEmx4d6dwVXMo63F+0Pfs+c+VFsxkyUFlE35jQEcHUdziLMYPEUp9DAH?=
 =?us-ascii?Q?TdvVK9hUQbS378lGaKZyew/jlt5wSAawq2GL6MvAHMCEEW5CBp8F0BZWQXnE?=
 =?us-ascii?Q?n8u7fln2yFc1CPpBc6FWZoUh5nTCqesXefND/29AaQjoLkJJ84OCCc4AQOlk?=
 =?us-ascii?Q?PpYKnUoYjmx/jDYhqADeUpTvmmjv3g4m2sSrm7ZXugCvpgjK2lTA12UexCR1?=
 =?us-ascii?Q?fNuWtzt9GreRU1blx0XPrjjeW6MOKucevee1AR6Z84wu5gkJ4TnSK9p8vO+H?=
 =?us-ascii?Q?5s8pEF4KwuuancpzDqYEBQ/KdfYbV2IzqM0a/YYpYANdP4qLqCVbyFqA64yG?=
 =?us-ascii?Q?B767++y61BtYW1rm+gOD1Uf7F5SE33U3PPejr1ptuiT772AW3yppjJc2diyl?=
 =?us-ascii?Q?nTfwOwGnIHTBZfc1Cycr4fn0HtJmyW/cpHZyQgS9qmjA69BGmnJYGySLaCh7?=
 =?us-ascii?Q?iaPi52wFbYmmsaNqz5NQp5pOe5MZjgVFOySg/e2siramg3ehAucDM/ExRhl1?=
 =?us-ascii?Q?7kEenEafYhjBdlXVslTBDfeUBsVadg2dHE0cHQT4n184kiVS+gsD6lMkR/+Z?=
 =?us-ascii?Q?bRPHbZqezAUlU1SoJXJAJtQumlh+tldArnMbZtGG5371tyhP9B3Nvzg9x3sM?=
 =?us-ascii?Q?hhKs+9QWdpFCT2KyxdQJe8Gva0R33JsQiOsHz3ilbnADVnchvif4NdinP5ZN?=
 =?us-ascii?Q?MXfdil0i/OnqiXmNQkDbjCeJ/P2cKjcUGYYdr5+gTArI02dKQM1u/b0wA+s2?=
 =?us-ascii?Q?7m0HdVB1bEyiImPrIawbHZQ0a+W7HcHqxt21F1z5X8FNK8hhHAuSHi77nsv9?=
 =?us-ascii?Q?COBCOjdxHWAPl7pWwIcBor15QBKPuFdmtHWExfNR5FPc0cgv9zBLcgzf6a79?=
 =?us-ascii?Q?FTtCXX+EhSwOf4AH5cNhWfExOKCmA9tgcMI30c6xx8Y059k/KkMQ2KOaqrRx?=
 =?us-ascii?Q?uloZw58MvuxwzvGmWPs2ReSeJEIKdmDSozgvzJxggUpFU/IHt9uWV8uRVUz0?=
 =?us-ascii?Q?5OK7e2TnOIp7hTnNVBj+RqWnvZOceR91OE2r048XZVXAxun0gnejj5mUppiY?=
 =?us-ascii?Q?uGI4LJ9j3rhBw705XP4Z1iCMcjihO68RSJ4VeHzBuTw/RBtnAiP0iAjvsYdo?=
 =?us-ascii?Q?58/rsXOWo3gdIG7lt340xgl5eFc96HIRfE9RCQtziyp5utifG4AY60i2bl7S?=
 =?us-ascii?Q?Qt/ToU+aQu9Vvu8aTjb7SJ5bac1sK8WyOBpcGVI1aSvVhj/yMUBE42vmzDYC?=
 =?us-ascii?Q?ukyN3GmEhta7v6B5njFN2FeeGqZ5fj509etj3iLlpYRY7+1HYdfyYojXSsoc?=
 =?us-ascii?Q?qjWqZ1I85qzlWsgs/4K+sA4D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f4a2b6-f4e4-4f5c-b49e-08d8def6c9ac
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:18:00.1368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4V6iJ5AdYBDKtZ56C0vAcqLfDug0hpecZM5sQYyQWwgDVpx7W3X365ke0Y2Mk/MQgz0dGbDSuHH/Kumu6m6NjR/VsshqHt1f3+PYOi5Reuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4913
Received-SPF: pass client-ip=40.107.2.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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



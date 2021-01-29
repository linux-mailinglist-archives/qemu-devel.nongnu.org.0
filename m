Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38066308B5F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:28:15 +0100 (CET)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XZ6-0002Fb-Gw
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X0a-0001dY-9V; Fri, 29 Jan 2021 11:52:32 -0500
Received: from mail-eopbgr60100.outbound.protection.outlook.com
 ([40.107.6.100]:29349 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X0Q-0007OV-Rh; Fri, 29 Jan 2021 11:52:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVHebQ0rkJxtayeFHZbjIcU628yBGi/Mq/oXMmiUGzDs6PvHXeHaxNy7oK6PdBT8L1yNCriW14UCGzKjZGmKiAbKU9VZ+WUAxUCPhZunFT1cYZSq02bLnwHEqKIJV+0FTPVtHgqkUflcy17q+JqN24KVUWD/ectGhvuQtYDOSQFZ9s5ohtFTh5w/ehtqY+OTQis9tvsbsTs1wNeUUmCZmWoJRiW6MOx1CGdTlJIKu9z09QRakYGbDL2IlHHP/R4awFxaan2f9nddx6ApEJPMZ/x7Q6R4Ljlr1ExGh54o/yheyCgXZzmqfxQVbGPKT42aaMfapAtoOWvD0634FGV3ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2ex50jNXYIs75xlJ8miTYosT5mQnjvdw+cBwQtNH7Q=;
 b=DMALUtfn8m7OwnR2PKJ3DQvKGhEXlJMroe6xkZS8LzDLh6stfvXz+EJ/54CPFHv6W1TyAs3dudHQfRpUUGAF8vQUV2/QIAqrm6SKhHQBgCMqEkwBIjYPxbF3CAPbyDIRpK2ohIJuanZwR53hg2p/lp9jEpiiSnU7VFHlB0JvVUx4RvHaLglANsZqz473axIFQwBx1e5FTVB7hXhveamdTdiyQz2l4/ZRF75rsKCbWvakKxIeA5kiuR7JKw885GreSBCq52Sy2tq7TaUK2/CRmoVYIZ3G2dZdwndKz1vfNPVaP7twQt4t7gjWEz5OQu6xpR3kTdfbIH/9NFPdXYvW8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2ex50jNXYIs75xlJ8miTYosT5mQnjvdw+cBwQtNH7Q=;
 b=CMxk4/D2/1Bl7uRam/32xpoM/DOIE7fEPuK9Bjz0I3tQpelR8hfu0jSNjkIbhBL1+Tu1ltD24/Nhc0MJk+PScTjVvWt4OwxUZbGVi8d9QKpMMkt3IACb1cCxlMkyrAz5BTxHU9vtaThmfSKE7rzbeCTBQTT1e9h2fQwM23ePnqA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3621.eurprd08.prod.outlook.com (2603:10a6:20b:4b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Fri, 29 Jan
 2021 16:51:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 16:51:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 6/7] simplebench/bench-backup: add --compressed option
Date: Fri, 29 Jan 2021 19:50:29 +0300
Message-Id: <20210129165030.640169-7-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4f75c1b8-2a6c-4af7-5ace-08d8c4762992
X-MS-TrafficTypeDiagnostic: AM6PR08MB3621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB362128CC05653CC084A88643C1B99@AM6PR08MB3621.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EOcSaJafw3rs9n9CR5ayCXY/i4jIEyawWMbgNASMZrdPrr9WhXzc3iagDBR6mphtEvghXJy0Ua9Dw3PaVBdgVD3fiSb+9rmbkX8UHD/+oxXboU1QSJiBZDNSpCfS4xtkvOWXIH6CWZjU0CwVyq5LogOrUOJQ5D1kOKnmXra3oTn95H9dRS7WBKc72oZHZIBog/F0XDggoNfLBrYvKg8We5I/7TxuyDdJTQ9ZaTNk1bxcyRGYjWo6akse+U9DzkaNGNYF3qweT0nzzIWfzcnJ5DHlZKfdjvp80MuOWK+WDRSyt3neoENu/Rm4QgYIbYQHUzWWHMbPjt4d4p4Az+/G0i2VH1EDopKfC8jUUHQwDEztK7MduZEUR1kiGoAcSif7HFoslIQQugxWRx9fL6PANOU68/2SwWq7oEGsHLRsjRc8RGPEPEhIlUZga7XGMjg/mG9RCZX8iTHiFt4pLf+zLCJALLNHw5TYUACIyMlFI9cC797pNnXktEOTwEvYUCpOHMqiRNmzvyu9AK3dSSOYlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39840400004)(376002)(66476007)(83380400001)(1076003)(86362001)(8936002)(6486002)(316002)(52116002)(6512007)(66946007)(8676002)(2616005)(2906002)(66556008)(36756003)(4326008)(16526019)(6506007)(26005)(186003)(107886003)(956004)(6916009)(6666004)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8xhW07+Oo6RNS2ayXebcB+Qsfc0SaOhkl5lsDuSdbPnXn1JXREm5GJGJlhd4?=
 =?us-ascii?Q?nalzfAJrP4+i3qCH6mFA9Na+7KgKRf6jn5wVG5ZfqLP7Nj6plG3tSwCMIFZp?=
 =?us-ascii?Q?fBvzj7a/UVtoCf1evB3HafDrBQvatU0w2o6jRp35mO/u2Z/1u8pMY35MbRIl?=
 =?us-ascii?Q?TlRytPZLOqNb1kFN+D3uPMcCNsgJb01DzWy5KBZ9H+ug9VU9cN228pj3mYJ2?=
 =?us-ascii?Q?5ld6WE2VpBoOjDvKlcTIxemBy1tzhIS+i6H7YFxb/RafQp7KW2j66zK0rRov?=
 =?us-ascii?Q?+pxHDro0J/CujrrbTtKiZpI4Y78Rltj+tr5kFHtOpyhKN4Kv7CPT/XGFChMC?=
 =?us-ascii?Q?GuQuAk6PGMJaAAhQHuV9UCqPB67Fml/hBjT3I9VYwA0Nw18DjBJt2VCLcZ71?=
 =?us-ascii?Q?sZZAL6V2gf5V7o504gKrEJ2v65uYXpYP3GCJMGxIWD92k1+FFY2KnGMieR4s?=
 =?us-ascii?Q?yjvoJqo7LVgIU8g9SwKh0r07SKCTAeuLHo/3ukznDQrVXwmGpq5uIXd3aHWo?=
 =?us-ascii?Q?XyOvK/WckmUj9GshRcA3lKIPMGrqn9NXq/qL90I/LHDmCpcbwdKH1f8AO03M?=
 =?us-ascii?Q?w3rh5tpwPKwOS5OF/rPR5MZPnuBqgRc4I17pUtLZM3iLpadeDfmAwO6akocL?=
 =?us-ascii?Q?Qd+beXt/pfyXCdAdm2hDtw6pBT268iMz+1BTfVrWJ1hZ8mc3PujDGvItEGsI?=
 =?us-ascii?Q?3OibPwBw7sfKbiyZO6+yAC0GRVlKaN2ZzkSrO5JC2EwYAU6K4V4FsdIShnm1?=
 =?us-ascii?Q?rULV5VjI2LxESpbTB6iQuCUzzRozmsRfeBDNzJVuUnkAGpq9nqSyaZqNbnDS?=
 =?us-ascii?Q?xjoMcNLrHB7rFdWidGQD8LcRxtY/iNRhV2IfAGTFdmsH/aVa7BxKKyzw2+sD?=
 =?us-ascii?Q?qKEIfdXVo1c63LUqPYMWk1a/qGmEdw+2q5r3XmEn8INrGlDRHnbBXiy5/A88?=
 =?us-ascii?Q?tB1aQIeSTT4CQ0OQLDx6wBfy/24rDg3ZVghKpjp5ComVokpEou6YbbmW+FzY?=
 =?us-ascii?Q?WB1QVvV3yeGRbzNalaZV+/Gy0sFV5fKLnNQTNp64VU7ZKcGipGeW3/ZOQ9Wf?=
 =?us-ascii?Q?yTjBGEeq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f75c1b8-2a6c-4af7-5ace-08d8c4762992
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:51:45.7031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2Y8kC4hp7AZ65T6T4OHmqTqBZZ8qsHEGTyRdwe4hW6jrkcnYwjbCztXrZ3dIvwHvuEIcWbm5u1c8Ldu+CQSElhg0g9Y5ilfEb+VUXrsTB0=
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

Allow bench compressed backup.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/bench-backup.py    | 55 ++++++++++++++++++--------
 scripts/simplebench/bench_block_job.py | 23 +++++++++++
 2 files changed, 62 insertions(+), 16 deletions(-)

diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
index 33a1ecfefa..72eae85bb1 100755
--- a/scripts/simplebench/bench-backup.py
+++ b/scripts/simplebench/bench-backup.py
@@ -23,7 +23,7 @@ import json
 
 import simplebench
 from results_to_text import results_to_text
-from bench_block_job import bench_block_copy, drv_file, drv_nbd
+from bench_block_job import bench_block_copy, drv_file, drv_nbd, drv_qcow2
 
 
 def bench_func(env, case):
@@ -37,29 +37,41 @@ def bench_func(env, case):
 def bench(args):
     test_cases = []
 
-    sources = {}
-    targets = {}
-    for d in args.dir:
-        label, path = d.split(':')  # paths with colon not supported
-        sources[label] = drv_file(path + '/test-source')
-        targets[label] = drv_file(path + '/test-target')
+    # paths with colon not supported, so we just split by ':'
+    dirs = dict(d.split(':') for d in args.dir)
 
+    nbd_drv = None
     if args.nbd:
         nbd = args.nbd.split(':')
         host = nbd[0]
         port = '10809' if len(nbd) == 1 else nbd[1]
-        drv = drv_nbd(host, port)
-        sources['nbd'] = drv
-        targets['nbd'] = drv
+        nbd_drv = drv_nbd(host, port)
 
     for t in args.test:
         src, dst = t.split(':')
 
-        test_cases.append({
-            'id': t,
-            'source': sources[src],
-            'target': targets[dst]
-        })
+        if src == 'nbd' and dst == 'nbd':
+            raise ValueError("Can't use 'nbd' label for both src and dst")
+
+        if (src == 'nbd' or dst == 'nbd') and not nbd_drv:
+            raise ValueError("'nbd' label used but --nbd is not given")
+
+        if src == 'nbd':
+            source = nbd_drv
+        else:
+            source = drv_file(dirs[src] + '/test-source')
+
+        if dst == 'nbd':
+            test_cases.append({'id': t, 'source': source, 'target': nbd_drv})
+            continue
+
+        fname = dirs[dst] + '/test-target'
+        if args.compressed:
+            fname += '.qcow2'
+        target = drv_file(fname)
+        if args.compressed:
+            target = drv_qcow2(target)
+        test_cases.append({'id': t, 'source': source, 'target': target})
 
     binaries = []  # list of (<label>, <path>, [<options>])
     for i, q in enumerate(args.env):
@@ -106,6 +118,13 @@ def bench(args):
             elif opt.startswith('max-workers='):
                 x_perf['max-workers'] = int(opt.split('=')[1])
 
+        backup_options = {}
+        if x_perf:
+            backup_options['x-perf'] = x_perf
+
+        if args.compressed:
+            backup_options['compress'] = True
+
         if is_mirror:
             assert not x_perf
             test_envs.append({
@@ -117,7 +136,7 @@ def bench(args):
             test_envs.append({
                 'id': f'backup({label})\n' + '\n'.join(opts),
                 'cmd': 'blockdev-backup',
-                'cmd-options': {'x-perf': x_perf} if x_perf else {},
+                'cmd-options': backup_options,
                 'qemu-binary': path
             })
 
@@ -163,5 +182,9 @@ default port 10809). Use it in tests, label is "nbd"
     p.add_argument('--test', nargs='+', help='''\
 Tests, in form source-dir-label:target-dir-label''',
                    action=ExtendAction)
+    p.add_argument('--compressed', help='''\
+Use compressed backup. It automatically means
+automatically creating qcow2 target with
+lazy_refcounts for each test run''', action='store_true')
 
     bench(p.parse_args())
diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 7332845c1c..08f86ed9c1 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -21,6 +21,7 @@
 
 import sys
 import os
+import subprocess
 import socket
 import json
 
@@ -77,11 +78,29 @@ def bench_block_job(cmd, cmd_args, qemu_args):
     return {'seconds': (end_ms - start_ms) / 1000000.0}
 
 
+def get_image_size(path):
+    out = subprocess.run(['qemu-img', 'info', '--out=json', path],
+                         stdout=subprocess.PIPE, check=True).stdout
+    return json.loads(out)['virtual-size']
+
+
 # Bench backup or mirror
 def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
     """Helper to run bench_block_job() for mirror or backup"""
     assert cmd in ('blockdev-backup', 'blockdev-mirror')
 
+    if target['driver'] == 'qcow2':
+        try:
+            os.remove(target['file']['filename'])
+        except OSError:
+            pass
+
+        subprocess.run(['qemu-img', 'create', '-f', 'qcow2',
+                        target['file']['filename'],
+                        str(get_image_size(source['filename']))],
+                       stdout=subprocess.DEVNULL,
+                       stderr=subprocess.DEVNULL, check=True)
+
     source['node-name'] = 'source'
     target['node-name'] = 'target'
 
@@ -106,6 +125,10 @@ def drv_nbd(host, port):
             'server': {'type': 'inet', 'host': host, 'port': port}}
 
 
+def drv_qcow2(file):
+    return {'driver': 'qcow2', 'file': file}
+
+
 if __name__ == '__main__':
     import sys
 
-- 
2.29.2



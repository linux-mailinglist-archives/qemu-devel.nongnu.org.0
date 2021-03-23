Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E1346060
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:55:44 +0100 (CET)
Received: from localhost ([::1]:49396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhVX-0002KA-28
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOb-0007MC-2k; Tue, 23 Mar 2021 09:48:33 -0400
Received: from mail-eopbgr130102.outbound.protection.outlook.com
 ([40.107.13.102]:31392 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOX-0001rq-Pj; Tue, 23 Mar 2021 09:48:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2FnhZOywx6ELNzhPlS1rYYZAabkU1CQT2AM+SCjyKHSChWQ5q3lrm7IAbHHm31k0w9/7GEVw56kaqBMzuP2giD7k2H6f/g3flMRuHPyNLb5YUI9Y8FEsEOxWiGBI5B7OyeiJkvofyzLIXuqeQiRoSkvXvBALZN9Y7FWhoIHEY5XCx1S1xebC8Z6iZEihKp9fy5rjSkitRVC9b1LbUM8JgFEgAtBkib1Y7246pHmxEmSV7vQisMC86pRIo69p3PdiDW4V+tMVWRRb5rRbuULndY71bOglMIm3FKqZEg8TtCm/3+wJtMyQNIKf4z72Z68szjGS0PmW482x0Aiw/pCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Jk7bpcHmP57dmdGTMhum4TU5RdI78Qv+TLwSse18q8=;
 b=bSc9Ij1ZIAYV1W8YvH0HUJul2jZAqlHWiIKADWNtxZ11t7Hu1vsHXda2S9sEs4yjvSX0PH89jcFOSbXSKYgYl0gt4XY0BqvJzKDpvUQSFANl4FkHUDv0vva/b+f7J5wFXrhyaS/4WrJ7k8b2xkQJabRfjMOV2O7zOAuSClb4qiZE4e55eQ76AhCfk7VkhXUOviTz1S5Rr/KtISXufHpiK0kJTY8V2q+M6h+8XdJLBrqKfGQf1MOYv3936bilPE6pYsqD01wuWl+WRdlmIwd2jNTYTZzs5dy0di74HVmPhiMuryr1gvTJoWPJbEUbB0fVBFg+VNP5OrPfeTcpZzQEHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Jk7bpcHmP57dmdGTMhum4TU5RdI78Qv+TLwSse18q8=;
 b=Mz4GGvgt8S6JdfU4INLeOgHUAwQMeg0pHldfUwePAIrrNLSKLiPOOkbFeh4zfq5+jchC/UfxKHuEkOFQy+IPxUkrYCtEFhJXEiutjpNGfJcMqdZBOMYLmVXe+fVQFRYSxM7t6T9EynV/wKW/58Y50oBXk2gZX/Eq8cdtSm81z/o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4070.eurprd08.prod.outlook.com (2603:10a6:20b:a3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.27; Tue, 23 Mar
 2021 13:48:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:48:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v3 3/9] simplebench/bench-backup: add --compressed option
Date: Tue, 23 Mar 2021 16:47:28 +0300
Message-Id: <20210323134734.72930-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323134734.72930-1-vsementsov@virtuozzo.com>
References: <20210323134734.72930-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0184.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0184.eurprd05.prod.outlook.com (2603:10a6:3:f8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 13:48:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e4b02be-cc73-4f6d-e859-08d8ee0246f5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4070:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4070085D0DB07C2C51ABD1FEC1649@AM6PR08MB4070.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JheQdQoDkOrGtFVN8ISLrt8czTRFIYarMuXEvWjTiOitBUHNbD2TApjiXX97iqDsZKv671FgtSVFQIvqybkIOzl3FbWjHj3+Nvz+k+freVPR9Q4n8G5ovSoVkFCYCCadXOVqJG4iV7Daf++0Gzr/uRHkIVjqXbxxS3Nnq99vvBTh6Ks6i9sN9W2XtWdy3TsOn0OwPYBeIJq2W2QfMWZC8OqhYs4mwqfnocEHA4Zo3D/v2gyzv7LRk1VPURwQV3rn/WWFPfl/g4wgWr0548USFUPpuJn/IbQVFhK98Q7n49fe3Vrq6iq1QZdBbYvCc2HYFgwepZYUqiz3g6PKJzFokv1nyr/No7/GCT4520SMxH1wbrYpPsak28pyT7WEeT4pHgfO7mSFrh57iUVariFF24z6lOaAD2KyXpc3exdXufvUVi57FxeHnncKnfOwuwNQm/YMkll/KuzA3yYFEDqgK7a6afwJ1vX/ZF74EWgEZVnE/dLRh/Ii2rfnJjgQXDdCSqJxBER4G47EI6jeH6qZL4aMs6xpmlh6p/yjLhyqtyO61lIMFarHS8HKnUHMRrXZ/3PisS9hwwyWID3z14ZRXGnqG/2DEtwbQQBTOb2stZv9Ua/6E5qyDbcL1bgWlwqScNNLS+tSU9b4UqlX7r3PVD7WxYaqH/SB4Jok6cT8GsKMzugtAnaYj2Q/dtp3mraK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(39830400003)(346002)(69590400012)(52116002)(8936002)(6916009)(8676002)(1076003)(66476007)(6506007)(956004)(83380400001)(66946007)(4326008)(6512007)(5660300002)(2616005)(36756003)(38100700001)(478600001)(66556008)(316002)(26005)(16526019)(186003)(86362001)(6666004)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?z4EI8WFCtaSMxoue2YjeI2B8gMlrYS0xCZSxyJjSfDBWNBoyXm14xZWXKtV+?=
 =?us-ascii?Q?AKDo+fqq2UlAkWS6b7RxJNZbwixSgX7ma+g00TVwiNsz93hZ+1FwLblrV8kX?=
 =?us-ascii?Q?hIYX6tm0OCUxHdBn8eOFVgF9c9zAiFLDjHWa4d0Slrc9rpEbF1hzqz6MmcGP?=
 =?us-ascii?Q?ScfSEgJM/sVrwrmzHzL+ohaxS81cyORkZIfDWmWMnDupRX1pp3/vrnLjbDvz?=
 =?us-ascii?Q?LdMovRPZapmUo/7yMUb1FObMf5i29tJbpbR7AXJcXX6oII095DEU5Zz4LFlm?=
 =?us-ascii?Q?X9Dke+2L4k65WJTW0IuxYFt7OCw1VQIeS0eV7jf+DmBS961J0vbZQBUTbExl?=
 =?us-ascii?Q?ysNx0A+2ITsm+GmFWhtm3V++2+Pf0KKz2f46UkYQaFDOLb10ADae5oxALqWn?=
 =?us-ascii?Q?X1GdMKwVvWgd4S/2XKpL5HluLsXQ0Fh42eQHZYOXULPTGxA4cpVKJtnGos1k?=
 =?us-ascii?Q?BT/G6+JueaDogTPXxf857rLyiQvhsFQY9SEC606bR/D12pAMld4WQghl8A6r?=
 =?us-ascii?Q?Sh5KiLNAuPcjBvc9eGW3m7REbLIC7ZyslWPJgHrau481JLKKGBUH851MFAUi?=
 =?us-ascii?Q?5Y7454pEiAkuo4+kugzEAqvgLMfzWHjMUn+sCNGqaxQPaJM9SiLrBP2SDSwp?=
 =?us-ascii?Q?z14F+n+MWafpyr5YyTYcAegn7McLCODIRDP0+MresDAl/KzaCmEamfCzurM+?=
 =?us-ascii?Q?RsMc4l//iBjF0ufEssdl25K+xtFnXfwpdg7LuxswhyPaBRt6voKGT3Vlvgr7?=
 =?us-ascii?Q?sbq888V2ToZDo02Kj8tZ38ij1elU63e8V5WGedvTzyjTV3DlZ4xzWQKcQbzI?=
 =?us-ascii?Q?KaMD+QLuAPF0tM4VK7YdhvxOGihpZja8rMYI4M0RCFmeFjMvXkQ02qpzWir1?=
 =?us-ascii?Q?/ggeSV4lq8rUZAlaNC3mEbVWfewAMNDaTRujRHY7znHC8k56CckutsLx01g5?=
 =?us-ascii?Q?X0zlb8MV2YqOH5CBdOhktBeY5ILJqkv0ifzRP1EX4tJBs+9g3qNSZkUJf+X5?=
 =?us-ascii?Q?BAVp0WOdrQYrT3XaXM+ys7kBLq/GAiBQ8zwMZKsdj7e+bTANKHQTfUweWv8N?=
 =?us-ascii?Q?Jzyaiq6F+hWfp4EueBO4IZF5wT0eJLiKD/mB8Z5768mgLOg5x7B//CCj+IzY?=
 =?us-ascii?Q?2u9K0g80R4wOX29Xm7tU5ICtR6lOz1+j/zwnyWpJG0kNyOLYn22yZfPiFr9x?=
 =?us-ascii?Q?Frv/oAl9MOS/sCHG9ePcU57ttAgzA0vpldwa4ZBM217/YyAHhs8HptvHlWYU?=
 =?us-ascii?Q?OtII2FAzyRaHALOntMg3of0jMB+ryO6q1WV6rF7yZ7M9TcoMvL2M7NtzPSr3?=
 =?us-ascii?Q?8JYxWe5tTPjNUuNL+KPVMjf4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4b02be-cc73-4f6d-e859-08d8ee0246f5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:48:02.3141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQzPCDrIIhJGZo+To5RQ57A7foLxo+SSoCFrzMX6z6ix2Bhs26b0LwPUYfxr1k7c6jT5x6gjMCofVFi4m05qUvfE3SDhmyN2ziKSeebjzak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4070
Received-SPF: pass client-ip=40.107.13.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
@@ -23,7 +23,7 @@
 
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
 
@@ -163,5 +182,9 @@ def __call__(self, parser, namespace, values, option_string=None):
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



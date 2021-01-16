Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CCD2F8F9C
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:09:28 +0100 (CET)
Received: from localhost ([::1]:41596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tl9-0000rZ-Qd
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQZ-0005Zf-GG; Sat, 16 Jan 2021 16:48:11 -0500
Received: from mail-am6eur05on2132.outbound.protection.outlook.com
 ([40.107.22.132]:15968 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQX-00078U-6y; Sat, 16 Jan 2021 16:48:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nn+UyZQ9ZLOe89G9NLTvKhLT78DOAfiIR6GpC+luTKLXcxkuXZlqs4vXw6ZGcI8T1m1daWwVQUa4t5pBgmGa0kGm+9cBzyQcXL31SfGMPF1RjteTI3The9MAiV9qwG2J8nJ1xVRHZ/wU+rGw9FAz6DpaVqYdiAjJIlE3jjyr6ZpyfL9U8D9ScU6faSpGwnL3IVLvfXqbLBYdBWg39sHIUqIxXV5Hp/3dOezXQz5/AjGMe2t/AdGVrMdLIfbwSV8U171oaN/FgxcxWXd5W3mFMXPR/TkWQm+bL1ONrKIHCRDHe+76ZjWI+DLJD82IldMrpy9FI3bTt9D1sT1UVWi6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1yrOan4pfN15DMCckZo9Yzs4v4jxuVIcNK4PXQ1oVU=;
 b=NRbu9JU7mpuOxH9FNnnKfzpIfOxA/JJkzfPL2X4LMUwrOTeXjj/Zu8x8oL9JukAUNghtpNVhQwNsLntzkER0OD3l+V5GGHG5g59MwMaFqS13aBF0IelltpRfJdEhPv/Tan5JZMJ1PI4xB0SmYf6QV1SzoixZKnb98W7fJnBLYKuudMkN5FgWQNf4AuOoXODZQKpgJ34VTHTIQ7nVDr0IQ341tVOjNGMdfQHXRSK/mnRZ/L1MwYhVWotRdnT26Wxy/bREzQPrScfiIJkoHuB2roUh44uCbLqV8pP3LJONiY+qJxzwNGmBz5k+CLEeBnLfjfeoOW92VJFSfVB3K7KaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1yrOan4pfN15DMCckZo9Yzs4v4jxuVIcNK4PXQ1oVU=;
 b=uk7gPf9fLEZwEUroRKUPo6z2MQ5GXOergBLgmKCd6p2wzpI7K6tAV5eYWh/0siu6XaG5AOzVxJImRyuWX2sMeVUxpt4IRDACWsjfCnsgIfzDb/a+n9S7kliuaehqdGmjAcQQ0eGv2s0BL+Muzw4lHDAvPhWGX89vZb+iFlJL2TI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:48:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:48:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 23/23] simplebench: add bench-backup.py
Date: Sun, 17 Jan 2021 00:47:05 +0300
Message-Id: <20210116214705.822267-24-vsementsov@virtuozzo.com>
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
 Transport; Sat, 16 Jan 2021 21:48:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 156412c7-5f01-4938-5f4f-08d8ba686682
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20335AA340494C32990F204FC1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jM5k245RHWXXEFnuPP8Iy3XMl4r7d+rdfAUnHOdLw8ihGGGJjNFTNA4co8cV27uvxPUEyuME9xS2x/rZroufqIZ0yRHxm0s3e5GWMZ5f5E8PhbjkPyjWdnFdEFSy6XLlCEYcssDMeHvFWMCRsBGOwlNz4PJ56OwCkerEY/yCVjToIuQt9LGhRPFOsC0x6ZE77agipf04dbX9U+anOXrWQz4hMYw4rdum+fUJVSqKsCrDyv0aAqQdYftD66VmlOkSpmTUDOXreR2n6sfqqPCZf9x4GVK+WaIotLZ6+cQ3wysOZircKqVyKwmxQXW9V3zcZk8HN9VJJn02VDJf5ZG5SrR8YDwvbZwMBNDsdleBWwK5fIHo2XTvTrzTyL2NOniKUjDytkMtH49HOWVnD08xJPkQWMXnT8yDUpgJKHjqH+eh6hNQsclR9MT/8JLpOJEdVLW2X6jb2aobFAPYAXOfiiQPzKk5++4d0EGUdgc1wF8wfDNJ0AkulaYvChOFL3lnYr7m+WfaU6EL0deNyK47Iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aUWeYfGq8kM/idqk0+FdhbtZY1uCH9wdH5yK+wKonPQZPXFPlI24fvmlNLYU?=
 =?us-ascii?Q?/+SwTvjoymzPmoEbcII27HXgXMXJb8upgAoTUa649JIvMqAfjJcwYgne+9qo?=
 =?us-ascii?Q?PDM9lQiwHc1rZYXmWpu+PReGd6kHoWwRF2hkGV53ZIe7tYOnhBJhBytv1GCj?=
 =?us-ascii?Q?hGzn8MzePN1YaBBEseLTHup/bMjFQs8drbQbCvSq40ZecDsOTZROjQrpfQH+?=
 =?us-ascii?Q?71d6l6ecxlmPJ1JFZvXM7mWVJ0ohu6x2+OrRcLaynjNKCSJ3kWWM6DV/ZsF+?=
 =?us-ascii?Q?d4q623U4ReMu4RFAtcahoJ5AEuGrcR4lKK0zDZ/o3heNCgFSbZafeB81cbbz?=
 =?us-ascii?Q?mM05gQZ7kWpEazsRCUWbkMyiLf/vSD1O66Q4/udOS8h6Tqf7qxLwCmfnUZ0N?=
 =?us-ascii?Q?a9Mo0IAYHkR8j3OhR1W9VeoMREfay7i1vqxJlP3ATYNcLJi61dQC/g+mwLHI?=
 =?us-ascii?Q?nWKKVjTsXh/aLvDU9AL+v03YBf4s4D74G8WY2vfeWYxzIRya6CA+DNNlkzBN?=
 =?us-ascii?Q?NjRWZ6qH6MWSIew60Ncw48DGv2mW6OwCXXGYU9PWp6tkccotU0HZFN0RxRqu?=
 =?us-ascii?Q?C/+nL74HUWukibtouT51gyGW/p5lGJNt9SdT8hEGwfDI1adtkyIrHZwmlMq1?=
 =?us-ascii?Q?fjfH3Zc9luPu7GChoCfqMCGH6H5KFegfOBygDmhxSy2rjbx38/H17DdQSVUd?=
 =?us-ascii?Q?nhVzWhBPBL7iGZ4GKJGHkrehIj1dpu065T0zv+DCU8IenR0J96pMT8EpmPi9?=
 =?us-ascii?Q?emj0oWUL6uo1FJ7M1rCDGkohjAabAsgw0aD+npvgHo+iYQLF3uLNSWiMmXr+?=
 =?us-ascii?Q?P1m0LRPaApvkYDFGmlH7ayj96e6TPdnbXrj1g7njh308GPyFOeDwUaZWKJmY?=
 =?us-ascii?Q?4QkLeQH95JynRa3sviT5RIFFQ4cFNQTkWN2UTxEiu8RgLkdcM2/cTiImfeLK?=
 =?us-ascii?Q?FNTjcNtp7nYfPibsJyWHYb/RRrhhRoLaaFqa3FmvuZjSTE+j73fB+pEmm+fU?=
 =?us-ascii?Q?DLgy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156412c7-5f01-4938-5f4f-08d8ba686682
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:48:03.4460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BrsxPzRnIYMsvObsByTYTZ0Bx3JlJxy4bHFDwmrr+xLHgP2lZ3vsrH2H2uLwi9pu4VMDoUSS80B8PltglaDWoJcyyWMNpxfhOqv/4iUWFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.22.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add script to benchmark new backup architecture.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/bench-backup.py | 167 ++++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100755 scripts/simplebench/bench-backup.py

diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
new file mode 100755
index 0000000000..2cf7a852e0
--- /dev/null
+++ b/scripts/simplebench/bench-backup.py
@@ -0,0 +1,167 @@
+#!/usr/bin/env python3
+#
+# Bench backup block-job
+#
+# Copyright (c) 2020 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import argparse
+import json
+
+import simplebench
+from results_to_text import results_to_text
+from bench_block_job import bench_block_copy, drv_file, drv_nbd
+
+
+def bench_func(env, case):
+    """ Handle one "cell" of benchmarking table. """
+    cmd_options = env['cmd-options'] if 'cmd-options' in env else {}
+    return bench_block_copy(env['qemu-binary'], env['cmd'],
+                            cmd_options,
+                            case['source'], case['target'])
+
+
+def bench(args):
+    test_cases = []
+
+    sources = {}
+    targets = {}
+    for d in args.dir:
+        label, path = d.split(':')  # paths with colon not unsupported
+        sources[label] = drv_file(path + '/test-source')
+        targets[label] = drv_file(path + '/test-target')
+
+    if args.nbd:
+        nbd = args.nbd.split(':')
+        host = nbd[0]
+        port = '10809' if len(nbd) == 1 else nbd[1]
+        drv = drv_nbd(host, port)
+        sources['nbd'] = drv
+        targets['nbd'] = drv
+
+    for t in args.test:
+        src, dst = t.split(':')
+
+        test_cases.append({
+            'id': t,
+            'source': sources[src],
+            'target': targets[dst]
+        })
+
+    binaries = []  # list of (<label>, <path>, [<options>])
+    for i, q in enumerate(args.env):
+        name_path = q.split(':')
+        if len(name_path) == 1:
+            label = f'q{i}'
+            path_opts = name_path[0].split(',')
+        else:
+            assert len(name_path) == 2  # paths with colon not supported
+            label = name_path[0]
+            path_opts = name_path[1].split(',')
+
+        binaries.append((label, path_opts[0], path_opts[1:]))
+
+    test_envs = []
+
+    bin_paths = {}
+    for i, q in enumerate(args.env):
+        opts = q.split(',')
+        label_path = opts[0]
+        opts = opts[1:]
+
+        if ':' in label_path:
+            # path with colon inside is not supported
+            label, path = label_path.split(':')
+            bin_paths[label] = path
+        elif label_path in bin_paths:
+            label = label_path
+            path = bin_paths[label]
+        else:
+            path = label_path
+            label = f'q{i}'
+            bin_paths[label] = path
+
+        x_perf = {}
+        is_mirror = False
+        for opt in opts:
+            if opt == 'mirror':
+                is_mirror = True
+            elif opt == 'copy-range=on':
+                x_perf['use-copy-range'] = True
+            elif opt == 'copy-range=off':
+                x_perf['use-copy-range'] = False
+            elif opt.startswith('max-workers='):
+                x_perf['max-workers'] = int(opt.split('=')[1])
+
+        if is_mirror:
+            assert not x_perf
+            test_envs.append({
+                    'id': f'mirror({label})',
+                    'cmd': 'blockdev-mirror',
+                    'qemu-binary': path
+                })
+        else:
+            test_envs.append({
+                'id': f'backup({label})\n' + '\n'.join(opts),
+                'cmd': 'blockdev-backup',
+                'cmd-options': {'x-perf': x_perf} if x_perf else {},
+                'qemu-binary': path
+            })
+
+    result = simplebench.bench(bench_func, test_envs, test_cases, count=3)
+    with open('results.json', 'w') as f:
+        json.dump(result, f, indent=4)
+    print(results_to_text(result))
+
+
+class ExtendAction(argparse.Action):
+    def __call__(self, parser, namespace, values, option_string=None):
+        items = getattr(namespace, self.dest) or []
+        items.extend(values)
+        setattr(namespace, self.dest, items)
+
+
+if __name__ == '__main__':
+    p = argparse.ArgumentParser('Backup benchmark', epilog='''
+ENV format
+
+    (LABEL:PATH|LABEL|PATH)[,max-workers=N][,use-copy-range=(on|off)][,mirror]
+
+    LABEL                short name for the binary
+    PATH                 path to the binary
+    max-workers          set x-perf.max-workers of backup job
+    use-copy-range       set x-perf.use-copy-range of backup job
+    mirror               use mirror job instead of backup''',
+                                formatter_class=argparse.RawTextHelpFormatter)
+    p.add_argument('--env', nargs='+', help='''\
+Qemu binaries with labels and options, see below
+"ENV format" section''',
+                   action=ExtendAction)
+    p.add_argument('--dir', nargs='+', help='''\
+Directories, each containing "test-source" and/or
+"test-target" files, raw images to used in
+benchmarking. File path with label, like
+label:/path/to/directory''',
+                   action=ExtendAction)
+    p.add_argument('--nbd', help='''\
+host:port for remote NBD image, (or just host, for
+default port 10809). Use it in tests, label is "nbd"
+(but you cannot create test nbd:nbd).''')
+    p.add_argument('--test', nargs='+', help='''\
+Tests, in form source-dir-label:target-dir-label''',
+                   action=ExtendAction)
+
+    bench(p.parse_args())
-- 
2.29.2



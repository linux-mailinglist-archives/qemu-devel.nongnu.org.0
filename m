Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C9032D092
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:22:02 +0100 (CET)
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHl7J-0000rr-Bf
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3b-00059R-V8; Thu, 04 Mar 2021 05:18:11 -0500
Received: from mail-eopbgr20120.outbound.protection.outlook.com
 ([40.107.2.120]:19927 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3a-0002G5-1p; Thu, 04 Mar 2021 05:18:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmZi/aKGs/0/w8sU0XpEqr203Wst3YwHz0lJydzAJ/vEn5VXyrUxeNKonhnhz3ljLiHd67gHCrik6/j36odt71Z2/WHUrSbbkOWdgiX3NzOyG0u3J054YaSBezWju6ha0BxspFb8K7yqDC4U62d+wwatDZ++kFDiKvdD6dCjhCDMZAjrgn0RlztUh7xWPc+fOHVA/v1OFudmNXKrlgh+qZ/vONMnGDJP1ddbnRZl2/x7u0SW36E7S0K4PR56MZFjQnKa/7U/wkkEMsuTH1b+HEaTnefLepb3EKv21bcexhTwVF/sRGoaVTm75ywk/5uu8n/2CuQPgoLfcahephxICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Jk7bpcHmP57dmdGTMhum4TU5RdI78Qv+TLwSse18q8=;
 b=XwwAJ5RxSzyjiK7Dvd61xAvwnTCRRnFqoAa9XdzjsB+i2eAYPEUFpSy35mwpD/nlrkCThspCgsOQDJUlJEZTvyntD9dDpRY3aTSwA8+km42QbQd0bCsH6BmmnrGKB7Ai6GXYpDwSDaFqt6jcXz7AKR5SlbgdLk5jZouA31cwBzaMa+iiEU7qRaccIvHRuGKqHxaC2hKApNGRVHgIsmHn3CuEQRwOXGp+DAs3P/VecjzjecNLFmplPtb4e33qhPSy2Hd22SGTRCIXbTxz2ptFKC7mZLn6TSehh66b69TJVBCkcTRlQ17/vUK2LgPRL6sHZDR0dW2WujKAzDgc7I8xZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Jk7bpcHmP57dmdGTMhum4TU5RdI78Qv+TLwSse18q8=;
 b=ptsolPhs9/euxrkYUvugRzgXzA44b/rJFBKnD5jw0PPQldZPnbsUy5rNCVWluOl9bSDTPkOy1F088OX2dLDNIqKX/bE6f9simNeeWi80rycYBndruNIbNNKqujKLxmcv1ZYOw6kwyd8bu9CDWf5Ss8u/mdk/5A/LyjRZ/3uymUA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4913.eurprd08.prod.outlook.com (2603:10a6:20b:ce::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 10:17:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 10:17:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v2 3/8] simplebench/bench-backup: add --compressed option
Date: Thu,  4 Mar 2021 13:17:33 +0300
Message-Id: <20210304101738.20248-4-vsementsov@virtuozzo.com>
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
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:17:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c27e1102-982c-43bf-103d-08d8def6c911
X-MS-TrafficTypeDiagnostic: AM6PR08MB4913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4913C349CE8DB20FD800C7B6C1979@AM6PR08MB4913.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fUu7yd64GQyKruHFh40OxW1aaCgl4KqQVmtCnkVNjNZ7IHTPpBJ/2kP/J6nsa8qhgj94DHPbRnQ7MR8pXcMKV4zoecs7LIOLL6rLDsFT+joIM7E/r2WhukYBvIadAfCYz6XIkBevb1denKp6sV/Vw4/PhQIc5/CvnBdxxMK2milXJ0Yt97BJaqBI0tk01A9fYuiklWbCdIRZuW4bQahd1JwjS6YFGvDRi2TAjYkUrpicJ7U7usG95/Izesx0zENAJTu7wZmw6AjDHr/R5zuv49qj1p+bOwQ8UvQ0J1Y2VzhZDcJjq56bniWSqoyObSbmDLeQMYXfguRtHzyGF9qKMgEEPKAv/BHONi5QkivfNP0lG8kXmgijaaKeeVgMlK3ZcuoUBc7i6MgvmoPmxaaafUr41LCkYqozN3JlTSzpPcIel38n0XzSvdX8jDg1yCZlF7MGWH3dEcP+eROyTpPLgmKnuOZ/PWlL/p3sjGUGBlnBkvf3yls/zqTnkB9jYv8nzgF4xoy2Uf6F1qsanhIDtG7Wm2vJwteDM1IRddv0NpH/FTwJd6d4QtzjOGh9uGhTanUYJ5xulqSVBlikEh2ahg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(376002)(396003)(366004)(346002)(186003)(26005)(5660300002)(4326008)(316002)(66476007)(8936002)(69590400012)(1076003)(8676002)(66946007)(66556008)(6916009)(52116002)(6506007)(6666004)(16526019)(956004)(36756003)(2616005)(6486002)(83380400001)(2906002)(86362001)(478600001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0ZmVf1BjrYcwch2q8TV2IHLvyRM2SnQn9/Ov51QIYs/3DchWlypHuWnV2G9Q?=
 =?us-ascii?Q?bj+VX/tJ/dObkDISSwOP035UYFQWTofkMYag7R0QJpTnrCltvfettpCz8uYK?=
 =?us-ascii?Q?rYL+60hvc0MGjFjuwXmBtYl8xT2tM8JYVvJ5xxA0vUEw/3HqdHq95ER+xih/?=
 =?us-ascii?Q?m8B2qQJ8mx5S0QRkYObgHid1IYeMoCUzXWPHy7OfmvYaRQwD3AQ7g95ARm+J?=
 =?us-ascii?Q?Q+ftdB/uc8rbP41JuTXgQ807MY6u1+mGI6xTdvv5LKjUlUliEjE9pK3a4/GJ?=
 =?us-ascii?Q?9h9Ki+H7ZfudyI6jiF3az/Iy7kUBXlLv1ILzn6VLj56+sUKiEGSp+BV+epq1?=
 =?us-ascii?Q?TEGqmNJE1PusqIXuclILsgx2pw+H1CzQfMTVmX4B4n7J+c4FHih7jIkxLy8q?=
 =?us-ascii?Q?+Ryz2G0T/vYOOXPpYL/4OwN7C8XTrP8DWVn/xVugrSMpTccqGSwLrVd+VviM?=
 =?us-ascii?Q?i9R9lRpkp3iDH09VF74q/0Lot5PDhxKPPHRw7TO3MUNeLxJmZ4pybwDdNaXv?=
 =?us-ascii?Q?ianL2hHNrI79BPJDKjL5fZOGcb84r/zJ1mdfAkG60UAtw4x67JmIGBKj5iHd?=
 =?us-ascii?Q?j0b/nw6BecZObW+GACXtFsGus6hNgkyKI0D0q3iWzxngEcWunCNWsI+j5u+9?=
 =?us-ascii?Q?GiwF0+n0yDWUkoR3GoyYi1lR2Vrq9V/AlIKU3W3zwGMiknKXDeerENEcf95O?=
 =?us-ascii?Q?8zryVqBozKuw1YX+qe53IG3tn17+2F32kL6ZEdnSP/CDoQB32pb7z0yRZEuK?=
 =?us-ascii?Q?Jbww9iHGnC6/ys8BqaF6pURL9QqeAd5uBconny/oymmouJLtoY3YZBKtL2in?=
 =?us-ascii?Q?ZwCLNYjUlp4iJdKPV3jnabOtyq0AYdqGvQit9wE9xjOTTWT71Cldv5D4LVgk?=
 =?us-ascii?Q?ZmnjY5+dIjAiFXCSC6tuZwUMt2473VfqDUXXq1Q15Hqsa9OOZtzkMWZL6Jw5?=
 =?us-ascii?Q?YMFq7CzOAoV6dPisqWTaLcsCcgNUjg6iil1oPGOhqOnc3Jib4mng5epsucSO?=
 =?us-ascii?Q?GcHPNAUR6UUJYzNApTcXb6dMO1FMeCtTKFzSj3KH7++vGkdDWcKVIwVfToJu?=
 =?us-ascii?Q?sxTff74XGGt8KH3Hqs/pPnyZX47g7iKs9R5YHVmLRB0pXqmoxly5biX4hSlf?=
 =?us-ascii?Q?K4gbzDEu9E/QRFtD8HWMjrtJq5geiVQOa3v5VPr9jOTkWzl0UpBTSj41AJ7a?=
 =?us-ascii?Q?Lh6rK2MaGJIlZDRdN7T1fF6NnvSoTbfUhJqgypJbn/2PnYxiSIxuK3JTORka?=
 =?us-ascii?Q?7tty3dSrk6gFqQg5bnyWAPrgx6uw3xPanjoIMEckyPWsvGLvK5b8t4LDz9DD?=
 =?us-ascii?Q?/R+fjUbsP/eI6J0kfceWGiW+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27e1102-982c-43bf-103d-08d8def6c911
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:17:59.1153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9QiXEWd0rtYnp3+HG01TkupgoJwD21W1JBCk8YayhFGuU4xpeu8NJpgiq4eEISmmn2ozuMryP3faFOoNLjys2Ce2q9abT0TTCCNkUug8Eg=
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



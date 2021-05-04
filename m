Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DB73727EA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:15:01 +0200 (CEST)
Received: from localhost ([::1]:48012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldr8u-0004ae-7O
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqwM-00011J-3Q; Tue, 04 May 2021 05:02:04 -0400
Received: from mail-eopbgr130128.outbound.protection.outlook.com
 ([40.107.13.128]:35166 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqwB-0001xj-G0; Tue, 04 May 2021 05:02:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRxg/3Me0sJIkAwbw63qFT9GmP4IILNiKYEwjwGHrgzVL8m1WZEWQpovVxiPgYYlb1VhovaaHq8RMWWn919xoMwyKspNzmClRkWwx2SLWoglcs+tW0tcLd7yi9fQTg6rkM9xVUKIWFdwe7AVJX09OT7rOeTgmbNsWZRaDbGpx175vfHAsl9s6+ZuTzTC2/PQsu2cmndxrlUmtbObggW7cDDd+uufyCdmMTggDTXs8LdKQcd/Y/pK7z2UnJzS0917OUsj7qQmTnRsrU5b/cQgrMkZQRJDWWjWBkqvHa+do1hv+rsnHc1aG5pJI+K/6TjyDBKeKbylKgTRq9d40VZYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Jk7bpcHmP57dmdGTMhum4TU5RdI78Qv+TLwSse18q8=;
 b=V+OL0O0zk+DQUTjS78AIbXGqXmNl7qbinNJtBlW4kSTqhw+U1vi5SpcOGzrbg4I6aGcBRFRzm/Y56irk1iKVxGf96JcB8y065+QSMlrlAV5IFazRed1ew8U543i1QQXQ6TDlqkGxQQfMSHdAQGo5aL4c+CL1g1wJ9maNuR90xuwrwTIbXeMLXoWthYbdDgFGWC4ePcycWtf3BtxtHFaiP0d0o8njgCKy7AmfYPhCBoYxbd2gTBRrU8RZyaksDqdnMKnbEdNGwlnRZ/5mzqpvOvzro0AJdC75LchugeU9/j9Fk1kEpfSVwB16TAW2HV3Nol9KZmxUh4Botf3/K/4fJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Jk7bpcHmP57dmdGTMhum4TU5RdI78Qv+TLwSse18q8=;
 b=Cf+T9Y8DA2uadiddQVPfCga8uRHTl/IlW2c0WUgTWV/RpvFDyf8hl8bwFLBL56oi2p8ZlznBmTwwFEOeASugM82I6snmKyk90AJpxm9W8Ow4O2fljY2zPACSHIDDe0iTA8LToZMWbByklIrSHji0sdw80ylg/QU2KVA8cjktrJg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Tue, 4 May
 2021 09:01:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:01:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, peter.maydell@linaro.org
Subject: [PULL 3/9] simplebench/bench-backup: add --compressed option
Date: Tue,  4 May 2021 12:01:07 +0300
Message-Id: <20210504090113.21311-4-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 540a08f4-a420-4c2b-140b-08d90edb3601
X-MS-TrafficTypeDiagnostic: AM6PR08MB5077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5077BB3D4912592AA37C6E59C15A9@AM6PR08MB5077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pLiQXR1ewbBjPE2wiE0nynoZ535hdmfn6D9b5PnzGzXNe7oV981/FL36tyxMT3lNy8TG2X1ZjXQeo7B2MLSxxgfTXa4nfsj4rK8PpjxNtpGtnjANBtGfKO37gA76pAKyu6qXPBZdyBa2VHM6k+TplhTZg9P3DasgoBgJqghSxQeZ8NF3EVenIE/C/f5gqQVtKmZ/KQv9zLGUB/nqhu4bfvY87iVA1bIxfIwfm/yuP/7ckh2VvNfcVeoRsUUeO/ynY1NT24lXxL0y1OOQIZktfkCySUaECfZxilJsQNAZw2iafIRZ1UJOOjAmEFBVPeLrc3W0TAvUNrMH/JZRdfWWOyDFBRTNuwyolaueHegVQgOzHmWxEdyEMz5TYDFG2Ef1t/kpYptZykgmzvKU4WwuwrRCu923bVlJc/KCAg8r6h3Ip+QKpVrsjZ9QTza8nEMwusS4HbZJfdV5jQIcDb+qE4B2359VNfi5ynHIhzcbVQhQSAHqwX8vqA5SwrgLRXtR4tQsUJ+s61J/+8ttfcBwSX65Pmva+SqVs7JECF3GiyEbn1SRgm6F3KbkUn0BPmHZJQt/2GzgDGeaf4CvpLqNf/8h70kBoO2Rc3gG7M7DEdT7wAXIzTzdSj924FPYQ0KvRd0cwEtm8myDOz0Bdv9na7nzCXSXww2ZSeVSsF0i0W2j/PSUTM8ybc0w2XUee+4j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(39840400004)(136003)(956004)(52116002)(1076003)(38350700002)(16526019)(186003)(8676002)(38100700002)(86362001)(6916009)(6666004)(4326008)(2616005)(2906002)(6512007)(478600001)(6506007)(316002)(66476007)(66946007)(66556008)(83380400001)(36756003)(8936002)(6486002)(26005)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ImcHy+VMEZf75YXqZJfpeZBFS6SQj9hzpxw0Nbsd+y4fAykRWFYOf87dKSVm?=
 =?us-ascii?Q?Nor4GmtdlR2njgzeCOkVoxCkVwdCV91cetHKFEqfPRDXo1JvfV2rWC1Y0yyI?=
 =?us-ascii?Q?ePbKfeoR7J+ga3hUH87gPGQhncNiZFwyC9b46sn8U7AqSi40TtlbMTxZs4Te?=
 =?us-ascii?Q?nzosgGZNQQHZ+tYmXV5rDM+2Hg6tlTezzrALvDb7HGy9B1BgHZCimNX5+Ldo?=
 =?us-ascii?Q?OaccYqrzJkZrOB9d0jOulg99rOL96/WBmGmmRB/EKc2H+6hALUu/YNiydWof?=
 =?us-ascii?Q?k+IkTjKJSCk0dSjEmK1C5mymuVMuMzSVEned/iFfnEp07ZWBJ0BCsOYSS34B?=
 =?us-ascii?Q?EX8v4KyB9kPGf3m5w2rGvwQCSBnT6E2r7uBRrchLISQ0GnsD2uxpF25gSdfJ?=
 =?us-ascii?Q?PmRHNNIwjh4G9P5HpFXKMcV4o39e97jCF4sOw5s0/4QNmqbP5Pd19MGk+MzY?=
 =?us-ascii?Q?D0B8PqHIjudZZM3W5dqvqhw3FrkoXkOcFawPEyCT9OHk+ypwAU8Lkdbo/xGq?=
 =?us-ascii?Q?SWEnyP3YIlo1sSay3eFpeaVGzpli5s93E9zROG1p/qNaNe5wLryf8wEYy4rC?=
 =?us-ascii?Q?6B4lrDtStW6Yyh/e6+eM4+QpWF5/9Z6iq5PBKp2V/PH1M0r0U9WoREmOI/Rc?=
 =?us-ascii?Q?1Eg5oRsAGlSR0hLmoSqMuut3m+Dq6FE8Mg6tdSUIb/wpV4FhaiZfo4VkXb17?=
 =?us-ascii?Q?A49nka/7dEfrQR5b6kaNiAcQjpcydLPKItH+dJMJBuyF7EmsiT4sUGlyrycA?=
 =?us-ascii?Q?eO+rJDxlcqpVGN2U1ynz0aMbn8yDIF6ZX5syyxwiLniWD5vGIF7F3ZlIZLaa?=
 =?us-ascii?Q?8ruGyZXBHVnINXWPcBv8/+QhT/3V9dLQygjCmaPfeW7HUls0qifyS26kgCIg?=
 =?us-ascii?Q?hF3NFTXpqDd+y21EMx4c5ojWsLo7AceKMDKaEcHdv/ox7m9d2dqPCwI24s9o?=
 =?us-ascii?Q?IAbBCcK0AzMkTI0pom5CnBRg/cR0h/r8Y9rAIuntK4NjzQ+fJDShNYI8X2Ud?=
 =?us-ascii?Q?Pj7KQMwCFy75uYF3oFdwi2cMgX5LYF2sx31WsKjNEMHTBrmCux2mf/IW8qln?=
 =?us-ascii?Q?cIXu6GCQ3X7QBzaNtosFMwT7JIN4vHdCB8jsFjA1Q8Npm0abaq+USMWA6O0+?=
 =?us-ascii?Q?0bbJcVlPk584PnqB+tztYTiLQyzg3pcc+hKfya7OdbpWbqQibcGGWYU3Mkbx?=
 =?us-ascii?Q?AmhnexkeJORnztinUc2HqCstTNfIi51MqsPO65+tqBZuNIXLs5COMWoBqFPa?=
 =?us-ascii?Q?1GmcV9fmDnZZwrH4fh4TC9B4NXvtvKyDtnHe+25EEAaSQbfejwOpcUT+PFKa?=
 =?us-ascii?Q?ZH8v32hnlYVddbZinJl7JWJ5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540a08f4-a420-4c2b-140b-08d90edb3601
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:01:31.7537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FQSClKbXCUNnLEfYGF94i4eIf+apG64TGseD7G/atpgK9YZ6r+RXYBc7jpLQ8BC0sSZe4OZ0IdqSTgO+qA0MDr1+8WnyU6ogQTrt0AoVDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077
Received-SPF: pass client-ip=40.107.13.128;
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



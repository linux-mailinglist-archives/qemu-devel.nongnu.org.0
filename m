Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793EC4C6BDF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:11:25 +0100 (CET)
Received: from localhost ([::1]:59512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOes8-0008Jo-7f
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:11:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNw-0002if-LL; Mon, 28 Feb 2022 06:40:12 -0500
Received: from [2a01:111:f400:fe02::721] (port=57446
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNu-0002MY-Ln; Mon, 28 Feb 2022 06:40:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdCPATSAgC3p2dG265rlY20yLFWODpXrs87sIh5jXelqm0Klc0Bi5ewjmncoIzA+8G4vNWVY4sGR5w+fpoRFIzqOJvCCZuHXQEk66eTA5UTrUlniGPyj8y0fHsOWlCsmkyxBUZLSrXy9vohMGz+HlTwAUoxVghufpGS8nF+GoGm6MOffaZBzlHxxTWU7+8koURsvkxbSLuvHWuqt3C8cS8Uc0ZsmrQh6bovyNELu3UUa1hgUFAJrpt8peoaF3o9KNyVdE3q7g6kXpfCFi+E9y8ciC5cKDqrVwkAXFUK3EYBPaq78kfFrifpX/iieQKl6lpfTj8ExSUECn9hdgq1c5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZl+Umi061k76sgBQrDNahljTxYMMdNE0wxhbC4RHRs=;
 b=klp0zOYUKzuxxd2KQbdvZ9tVGVh5pgtgtTFsGas63SLcu+GOB0Aitiw3xBa8hRLdphe9yYj8cGMxpeS2mJAA15dZ33l9tJMX0cYLpeNtO++h8l0Jj4kelETvnUE0ogxzJ+GTzlHDB2d9gi/RkKbKZrHHcUm8bZYvqVsUF3Zp63r3Hg9nZ1CWp97HMftTQfNO0B/Our3WlFtuK/CQwFC3rfMuL/bU8D/cMbDXly1MvPq1TWT5+R9tGY/es6PHRloVJqZCI8g8nId87LgRT55D6QMBdcycqw097JYj9ckfyl73O2QtcYFk5PCMVpWUZCf0FuEC5gknuGjZid5B9t/k0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZl+Umi061k76sgBQrDNahljTxYMMdNE0wxhbC4RHRs=;
 b=dmtVRgQVM02Zf3Z+nmCFTcCQP4PLCMG81+u6C+64IicaGWVrHLP+D+4tBOLCpiKrnXF3qdXNpYIkZbqzvu94U1U8Eip3dc2jRrqajHrpQ/cBeWU0kQsinZNY6FTw+eqTdqkR4/sIamcujmNkHuIXvThW4oX9sjaJkDMiNR8WidY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:58 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:58 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 15/16] iotests/image-fleecing: add test case with bitmap
Date: Mon, 28 Feb 2022 12:39:26 +0100
Message-Id: <20220228113927.1852146-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e978ace6-6707-44fd-4a4f-08d9faaf0c71
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB227248A0ECFEB078AE9EB768C1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yc0DCGoamwl6tW7dbXduRCmSCgc6FcoD35UnoM4yNv8FsnkxtGZYAy/62ZfQAMXXkaanrsBV3Wy5J0tWXNAMP2xOnRV6N9VR4KdamGVL7L5bcowbh+aNy/m1jgj/JYbDdwO1v+7VFqCHGv/XNAU2txIvws34HGEyo0+s3mxmApfU1ZQ08lp1Xm3XyhmaZaYg2ENeX7LCtQnt1Ij/SCLTs6SbRAQK3bNMdhuWCyVQo3rV0W9geQft1WSz6WZx6hZdIL94uqtEnOauXUNzxXGUlVBmChPQ7d2vC+EPTgoUBbc5bX2eBGSx1q0gt0jDtlDaeKpxm7mAOVj1ENqZL5V8u4b3lyFEPG4OYxU6xJ00e5fgNz4zw/0ngydpNxGPQFyfzjNYk3DwFum6XWJ6TQjzYSYvgpB6JGvyDC1N73omcJUIWQqd16dhpHpz0ZWwgsZniDknQ6BWT0KjlOtsX3IbRlllgiVh3YbUnoc1arVMFfELnaiPxMzCe5hNDAuD2aX0Afh+c5uWVjTsGtm5J8wuqwtFYrM+66VuD/OqqGa+8CbLoJDJQo+uurKCvgsrmTd3EMpmAl5s8D1WFj7jClJxCefjqDtBd2GOrIq6F7hrMZrfbA7xC96jKUo4OtkaVS4GLe97zjakJ2LjTg/sqMB+1dcwAinlRhhzTXOKai9h2acQbrBiRj/dfayaBkw8Hnx7ahtk4qFLUBjtjSUI5OcFSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(83380400001)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IaRuM4GhK1xs77R8sVI2VgSXeUUYbILrZbBgNY9eqrFJyz3FUsMuPFRDq2/n?=
 =?us-ascii?Q?iCU84djXJyBx977LwQU1QhtTDi/xersOUo+xw4LoUX0Wk5L3/hlRWwiLWOkH?=
 =?us-ascii?Q?7jZI7TvsR092hHe9qDlHCkl2erdJ+JT/6FnYmpPMc4z9GzNx9JSPU9P6wC8K?=
 =?us-ascii?Q?onPOvZDrxZztoddBSSf4LCU8K1+2tpBdeGHiM3K+yGbfXt+PIZKa+hIKTh2P?=
 =?us-ascii?Q?pA+V0cmqnRiD3LTOUXgP3G/FH9IckxrCQLjPRmuIFGjDbwUcm+ZSauaiIS8/?=
 =?us-ascii?Q?kM0wSrRvvf3cEenX4Bsh0metLsElFyAnBMaTdWG+7w0IasIYQbdwZIJL7JeM?=
 =?us-ascii?Q?m4LnWzfK9OuEGHOiOk2hA++Vd+BVMT0b2M4t8YXswAI2rSriHFFKbySanjxk?=
 =?us-ascii?Q?qwIEh4Yg4ttWm6aQ4rOjYrvcqkEQbAYKrJpcfGq5F3Dl9xK083FW5+TwD/U0?=
 =?us-ascii?Q?RSxbVhV924hjslwdtrbQM2s41HTICQqaMB1tpF5rTHCZAY1AjBlLIjRjy81B?=
 =?us-ascii?Q?AM4f03VQECSgSDI4Emuspru1Q0RwtZQJcIm2mLrnw8V15y3ARVtht6KvVzdd?=
 =?us-ascii?Q?PRN57eO92+wXRFnTFahe95PgV2y+gJzwvQBSHe+f2hgfuU5wdpD1GEBa1UIZ?=
 =?us-ascii?Q?Kmp37CwyP+1vF6jKjxEK+RXAWoAZCgZNx7ROaa1eyuH64XusY9XG5Wc2usxL?=
 =?us-ascii?Q?IctZAQ6Gkplkjl53+uou7XR3pjTmrVzp+gyd9yUpREg/do/Lr+QhlzwMNTW2?=
 =?us-ascii?Q?DTqGuq2zEz8daXh44ghQMRui0PLjpdwEb23aVEQF9dp9pgh/clJGgIpQV0jE?=
 =?us-ascii?Q?+B7/iDEa1q9Ms9XXb1wAZSHC4sg67u1X8w0YuduG16RCp8CP8EGIoSllJQwU?=
 =?us-ascii?Q?r6Qw48BZ6e31vwkZEGXPZMOV8n/Azj1wTlJcslfGXHKuXjo6bzTvhOyJfQdn?=
 =?us-ascii?Q?lPjD19r5vE2Z+LbQ5MUIjbRcLgrKU+7aCXFMr4egzSjDVKn4wLXM9jdiEYfi?=
 =?us-ascii?Q?WsWqfw4n7tE2tqZPTqhuxEO6VV3BcQ1g0G4jV8r9aDYIxVMmaQYZ7aIQY6wL?=
 =?us-ascii?Q?89DWwtg1cjxHCPoOc19gfbHPaCc//tgKCCEPmfCp0UHFCGmUyvGHZWIgM9bM?=
 =?us-ascii?Q?fLik+uzv+nD12LUBNqJwSKwlFp2dNkCmXbY/f+fqdq8dZVdwmdDMAqWvh5Ov?=
 =?us-ascii?Q?TuQJPfzaJZnKUqyux7nQ74uSlN35pMpGYPEKwvEM2vAPe8rdeL9wC53szYUx?=
 =?us-ascii?Q?fhaqTGWfac8hSOLGrbGVY1M3KcPB2dWiKn1/XUxGjv0FeYozR2/rrmNkg+Dt?=
 =?us-ascii?Q?U3xbC76SYmdaWkqAe8aTqZX3hGl6ARPuR6HO81Tm9UcOpjgP1l0zXymNPEgW?=
 =?us-ascii?Q?/eeZd3+aVkALj/UyWIafpSJGGDEEv1OYSALnFLHEoxsNwledRZMrXXJAFTmv?=
 =?us-ascii?Q?PkEkBwFaJdj7KFlzC/aT1Pn+bPhzwONU8OHcyoOFefKwaMQ5CI28XAqfwA61?=
 =?us-ascii?Q?30Ko9XD3hQrJn/R29mKtBqruHJ3y0pIkaQQUrT++RolUaZdF2VOaybQCIokT?=
 =?us-ascii?Q?655MSSClrauaGNrx58lmnqqPNh4gzotPDZfF+YMGwSObjIfgsRY/SUVjwuWa?=
 =?us-ascii?Q?l3djQyeRj7EMtHehEdGVneluTjlineAIQ1Z3vwlXY1aJEVgq6ZoDW2S0lflk?=
 =?us-ascii?Q?DcX/kw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e978ace6-6707-44fd-4a4f-08d9faaf0c71
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:58.6027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1r/nbfyLOR2/uvTCqNWGIiOPL+Wx2GpzhuHCKHhrS4hDXJVorFQyLsAIX4YwYAblE+STkipWtNoo8m3UfznjDCSlU6lpzIpPjPDvYfHjyRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::721
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::721;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

Note that reads zero areas (not dirty in the bitmap) fails, that's
correct.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 32 ++++++--
 tests/qemu-iotests/tests/image-fleecing.out | 84 +++++++++++++++++++++
 2 files changed, 108 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 909fc0a7ad..33995612be 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -23,7 +23,7 @@
 # Creator/Owner: John Snow <jsnow@redhat.com>
 
 import iotests
-from iotests import log, qemu_img, qemu_io, qemu_io_silent
+from iotests import log, qemu_img, qemu_io, qemu_io_silent, qemu_io_pipe_and_status
 
 iotests.script_initialize(
     supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk', 'vhdx', 'raw'],
@@ -50,11 +50,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
 def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
-            fleece_img_path, nbd_sock_path, vm):
+            fleece_img_path, nbd_sock_path, vm,
+            bitmap=False):
     log('--- Setting up images ---')
     log('')
 
     assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
+    if bitmap:
+        assert qemu_img('bitmap', '--add', base_img_path, 'bitmap0') == 0
+
     if use_snapshot_access_filter:
         assert use_cbw
         assert qemu_img('create', '-f', 'raw', fleece_img_path, '64M') == 0
@@ -106,12 +110,17 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
 
     # Establish CBW from source to fleecing node
     if use_cbw:
-        log(vm.qmp('blockdev-add', {
+        fl_cbw = {
             'driver': 'copy-before-write',
             'node-name': 'fl-cbw',
             'file': src_node,
             'target': tmp_node
-        }))
+        }
+
+        if bitmap:
+            fl_cbw['bitmap'] = {'node': src_node, 'name': 'bitmap0'}
+
+        log(vm.qmp('blockdev-add', fl_cbw))
 
         log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
 
@@ -148,7 +157,9 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
+        if ret != 0:
+            print(out)
 
     log('')
     log('--- Testing COW ---')
@@ -166,7 +177,9 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
+        if ret != 0:
+            print(out)
 
     log('')
     log('--- Cleanup ---')
@@ -201,14 +214,14 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     log('Done')
 
 
-def test(use_cbw, use_snapshot_access_filter):
+def test(use_cbw, use_snapshot_access_filter, bitmap=False):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
          iotests.FilePath('nbd.sock',
                           base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
         do_test(use_cbw, use_snapshot_access_filter, base_img_path,
-                fleece_img_path, nbd_sock_path, vm)
+                fleece_img_path, nbd_sock_path, vm, bitmap=bitmap)
 
 
 log('=== Test backup(sync=none) based fleecing ===\n')
@@ -219,3 +232,6 @@ test(True, False)
 
 log('=== Test fleecing-format based fleecing ===\n')
 test(True, True)
+
+log('=== Test fleecing-format based fleecing with bitmap ===\n')
+test(True, True, bitmap=True)
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index da0af93388..62e1c1fe42 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -190,6 +190,90 @@ read -P0 0x00f8000 32k
 read -P0 0x2010000 32k
 read -P0 0x3fe0000 64k
 
+--- Cleanup ---
+
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+
+--- Confirming writes ---
+
+read -P0xab 0 64k
+read -P0xad 0x00f8000 64k
+read -P0x1d 0x2008000 64k
+read -P0xea 0x3fe0000 64k
+read -P0xd5 0x108000 32k
+read -P0xdc 32M 32k
+read -P0xcd 0x3ff0000 64k
+
+Done
+=== Test fleecing-format based fleecing with bitmap ===
+
+--- Setting up images ---
+
+Done
+
+--- Launching VM ---
+
+Done
+
+--- Setting up Fleecing Graph ---
+
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+
+--- Setting up NBD Export ---
+
+{"return": {}}
+{"return": {}}
+
+--- Sanity Check ---
+
+read -P0x5d 0 64k
+read -P0xd5 1M 64k
+read -P0xdc 32M 64k
+read -P0xcd 0x3ff0000 64k
+read -P0 0x00f8000 32k
+read failed: Invalid argument
+
+read -P0 0x2010000 32k
+read failed: Invalid argument
+
+read -P0 0x3fe0000 64k
+read failed: Invalid argument
+
+
+--- Testing COW ---
+
+write -P0xab 0 64k
+{"return": ""}
+write -P0xad 0x00f8000 64k
+{"return": ""}
+write -P0x1d 0x2008000 64k
+{"return": ""}
+write -P0xea 0x3fe0000 64k
+{"return": ""}
+
+--- Verifying Data ---
+
+read -P0x5d 0 64k
+read -P0xd5 1M 64k
+read -P0xdc 32M 64k
+read -P0xcd 0x3ff0000 64k
+read -P0 0x00f8000 32k
+read failed: Invalid argument
+
+read -P0 0x2010000 32k
+read failed: Invalid argument
+
+read -P0 0x3fe0000 64k
+read failed: Invalid argument
+
+
 --- Cleanup ---
 
 {"return": {}}
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D93F9ED1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:29:59 +0200 (CEST)
Received: from localhost ([::1]:44572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgbs-0001Q6-W7
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRM-0001FW-Ms; Fri, 27 Aug 2021 14:18:56 -0400
Received: from mail-eopbgr20117.outbound.protection.outlook.com
 ([40.107.2.117]:18413 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRJ-0006di-Kw; Fri, 27 Aug 2021 14:18:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIMkLJWa+jqjjlqlzYjZqvVtL5klKz1NpMTbvOYN0UGxq0CySUtxefi2kokP7vC7ByPNWf5Dpa8DDNItBv87dnqbXprwPB+agmJGp0ooGVIu7BdhiMWDx1WWqEIF//vtzq43BAUO+sYngCFbOlMqwuWY4tyfe5Ba9eL0jQmD4C/skiTsvpvLpKM9+FqBPL2pMjx4ZWa+OyJXweaycMSAFAvsi0bmvGzKWwxqagGcP3QFKpRKA2Gd+MoamdWj84BdCc67xd3ggpRoJxVkXLBJUuHdwxVkwAzFC+L9cvAZuydBxS8mDtHF1mvs161iCiaE/u8aTCriZnHwFtCz04hFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feKgbUrUHyK4s4qRnScjO7ZxNAZELzOMmSsvrYpOSRU=;
 b=fm90t317arzX+SVtwJqNpM8fs36dgP0xFc8XV76qywIRfZ54S8snGVhZgpjr85DSZaxHvrf6IVWdkC1s/ZdaTTJEcu1HhowUXGYkp3kdDotfcMZDbitTP0MOljvBh/wHldlEaRUt85AcLWGUmIlNGd9m+sGZ7ugUCoQFBLCIlhjAJ/dOqSr5TbYUBNu3gyHTfI0kTmTTWKrYtOUdQzFj8Q36Ueucq/PGJCj7Q2zf3xi6bjxM7qfQolJBYFNz7YWJo8OrC87G2MvMY21nRXlhI3jqQtlOOf982BcMRN6zq4aFzaPkEHvq9blkPlY4yBUTgPfgi60FNulNVPA0U/2xaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feKgbUrUHyK4s4qRnScjO7ZxNAZELzOMmSsvrYpOSRU=;
 b=SIwuhh1rWVUPhniKYKYIkMWP1PXcIYg1K3Xd7bYgoQDFjfeQtmAD5ydnqriA6es3TFbcw3luhAOcvqt0oakXURlXBOaX/ibh2WzKGR/KR3/YCDEMngbENGgJIlKBraVT5085Hi2yGHnDyR4LaK1JcyjDlwYcX1Ej/FeqXr7arWA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 16/19] iotests/image-fleecing: add test case with bitmap
Date: Fri, 27 Aug 2021 21:18:05 +0300
Message-Id: <20210827181808.311670-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d10c8fde-10c9-4ef9-1cce-08d969871a9f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3765439F5DF8D24FB640D450C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:73;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ax804zK5ToGzXs+Rawel765dnUvmw0LgI6WZvn+kR1opvAbk8/xl3j+l8oMVWAjpphNaO5ytvxk2YoSriWOcjFLpA1SYLuYnusLIGqsfZLA2M/aJ3CVOPBc/jUbnbPIA8RPeBY6pOZNpB3Iy/o3Krz9YkeiE7B3Dnt8vkGtriRJcvPhu2BNLogq7WJ6JPHzOfv5dnFMm/cqU08FV6XMWxZZvk/mDSOAWXNpG/QA7mToOMEO/dQ0cYt3Id7bUMGuKKDAeb9yHOqSPd2IaynQScSQINUDWv/xAdfHmBYq8O/JcLLi6v5K9QQY5Fmg0/YsN9/Oc4kS5W0DdXCAcAtSjxeonLZ7L7A8jHBmfNLRiLt8X7F9BH+iCAseSMx5Z8ZkSZYxjlMrfNZgE8z82ieLvK7NdLrnpmS04gFSA4kLEAXEXGRw2sZwt8q6OKwaqhDXnLAq2ic65k1LWenn0TnV4yzHCdtZ8vmtcoTWekuSmBDwR3pJKrTTrnVYcVM03HvfRWDWtVZkvQg+I11qTuCLml4ykaa2Xp4zv1+2c1JhkewhVmwUytMJr8/jiWUN7nmBQfZV3XZ+l9mW0Hlp+wa4vWnT20lpXtd73/HiK/2ASNsB6BFR3z2gzxZsstXS+Jl4FW4VGeT2n8/ohSMMkqA0LHmVax9VEBeFdGkypLa2+Q/fK2k5LAepeCrmXSbna7NLwjmYvv/7PMTWHf4fa7DZJuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zcdLHFyj8BZEkhGpYCdzZzFon/37uxeY6Rw7Ny1+pmgRhU23OzwGqspMl9c+?=
 =?us-ascii?Q?h3Pf5h9qdhDrPOBt7bG22fQhtgBGh1hehaSM+JccvW3TQWhL7Bc4eTcXaPtK?=
 =?us-ascii?Q?CA/l8TtGqE9LvexxgU+GUQO+6MbztNvkbA07/vFdqojCGz+pE4T/Bz6EGQ0J?=
 =?us-ascii?Q?U9sEpO7R2tVZEuSNir1KOp7nd2+w42VpIOtgsA8SMBwjF/BOov021ULn6orb?=
 =?us-ascii?Q?Gyd5XfewPXMIR3YhOFZamKjWM4P97cKrSj8OXOsnUKWD7ic60N5DLIrN0fd6?=
 =?us-ascii?Q?nsK/UrIFW6EONk9AKrUyjJGjnSh5bhXQ5Ld3ceIzlKaUxCU6KKlA1eIG2wTr?=
 =?us-ascii?Q?xCmrupa1JqsPMNZHXqRKy7zi3drIUTaV1Bb4Sg49j4xiY74YvmMsLccAi+lX?=
 =?us-ascii?Q?VafEWKKroelrxM6H6cGgsBriGC8vYKI9QH82dokcJ7IVkxUkDWSw+sa3MRcO?=
 =?us-ascii?Q?GBdtgL5k863Pw6JFw2Lx9YZyWeUmMGAZX9D4rB7XUps7hUhS2r3CtMJRqVga?=
 =?us-ascii?Q?m2AJyQEQ1/2KIqlplKuTMKURIFbSINm/kr27HMkIROeuS6OHrKs8oH9rysdx?=
 =?us-ascii?Q?MlKiSFBUxRUL+cIDIt7ou0PbfAXrqVJTa000tYua/JZb7MnRLElE+9+Jy8qF?=
 =?us-ascii?Q?AqXzNX83rRNf6+D7NdFBi+d5t9ZL9VFpm/cVJjzlwwQqtFfmvfump3otLaC6?=
 =?us-ascii?Q?0u6ritq2GfZABUZt/ITBUZFIKiSQu798dl0mD+qvpEcTrcLTM9ZJHt3ElZsX?=
 =?us-ascii?Q?V8M6yRkAIp1NZJTc4dtl8LSb4m9ht2umTvE0lak4fxV/gp89CYltles8oxPT?=
 =?us-ascii?Q?kFrJ6ZzsD7zzkMbg9kRugLx3gZDlO/9hlBl6AkabgvJNZhjlE90T00k/7g5m?=
 =?us-ascii?Q?eMKRzsRu5j1LeLFLSXwixxRtSrPpLCIMKYk1O8a++7uZ0rdby2WsUc2057sL?=
 =?us-ascii?Q?I+ZColi/fDumPQxRRwiADN7JshMq36Un8qzDyBQBQlNC2HGu5vYbumad94O6?=
 =?us-ascii?Q?jGVcP7z+1tlhaMFUW+0pcA3Kg1rtaMQV/R2tRKCx5YG5LQhQM4Z4fesAdVDV?=
 =?us-ascii?Q?6l4bTaOFsWRgGHKPrrcgsjqU7p/xoyT+4yTSIVPSWEWfYsK3XnE1A3cv1Yh8?=
 =?us-ascii?Q?ql9b7bQq3GP1zM/JBwrT/R4IJR4zvuoOSoZ+AXPA8tUZ5YiVrvHJvUJcnLsk?=
 =?us-ascii?Q?dGZPdEmGKp1CUmEsdynNXhzqITxDkcnJg0bJmkU5r4XxWPvPn05WtY0ydfRU?=
 =?us-ascii?Q?P5emBgVcX1thk5kG6n1mhCp1Jz5O/m1VZ+Hv9Z0OPtTxQ59Nqve8mBGBa+uO?=
 =?us-ascii?Q?ogTpNp2bMYFV6ugJ7yzVI2mr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10c8fde-10c9-4ef9-1cce-08d969871a9f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:43.9156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjmTuvJGcjzT5XYHR+sh0rAWg3kLZ9L8v0KlCJnQCPcLKh87qESOGmlr0khTRN9vUfZBcjPJ9IGKhKtrqqVyOwDa7GCbN5Ezs47JHe9n9u8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.2.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

Note that reads zero areas (not dirty in the bitmap) fails, that's
correct.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 32 ++++++--
 tests/qemu-iotests/tests/image-fleecing.out | 84 +++++++++++++++++++++
 2 files changed, 108 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index f18881fa71..ab95e4960e 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -23,7 +23,7 @@
 # Creator/Owner: John Snow <jsnow@redhat.com>
 
 import iotests
-from iotests import log, qemu_img, qemu_io, qemu_io_silent
+from iotests import log, qemu_img, qemu_io, qemu_io_silent, qemu_io_pipe_and_status
 
 iotests.script_initialize(
     supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk', 'vhdx', 'raw'],
@@ -49,11 +49,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
 def do_test(use_cbw, use_fleecing_filter, base_img_path,
-            fleece_img_path, nbd_sock_path, vm):
+            fleece_img_path, nbd_sock_path, vm,
+            bitmap=False):
     log('--- Setting up images ---')
     log('')
 
     assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
+    if bitmap:
+        assert qemu_img('bitmap', '--add', base_img_path, 'bitmap0') == 0
+
     if use_fleecing_filter:
         assert use_cbw
         assert qemu_img('create', '-f', 'raw', fleece_img_path, '64M') == 0
@@ -113,12 +117,17 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
                 'source': src_node,
             }))
 
-        log(vm.qmp('blockdev-add', {
+        fl_cbw = {
             'driver': 'copy-before-write',
             'node-name': 'fl-cbw',
             'file': src_node,
             'target': 'fl-fleecing' if use_fleecing_filter else tmp_node
-        }))
+        }
+
+        if bitmap:
+            fl_cbw['bitmap'] = {'node': src_node, 'name': 'bitmap0'}
+
+        log(vm.qmp('blockdev-add', fl_cbw))
 
         log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
     else:
@@ -148,7 +157,9 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
+        if ret != 0:
+            print(out)
 
     log('')
     log('--- Testing COW ---')
@@ -166,7 +177,9 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
+        if ret != 0:
+            print(out)
 
     log('')
     log('--- Cleanup ---')
@@ -201,14 +214,14 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
     log('Done')
 
 
-def test(use_cbw, use_fleecing_filter):
+def test(use_cbw, use_fleecing_filter, bitmap=False):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
          iotests.FilePath('nbd.sock',
                           base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
         do_test(use_cbw, use_fleecing_filter, base_img_path,
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
2.29.2



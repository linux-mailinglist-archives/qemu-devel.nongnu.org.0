Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4338A47D641
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:07:53 +0100 (CET)
Received: from localhost ([::1]:33164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n061n-0003Jq-OX
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:07:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bt-0001Zn-8q; Wed, 22 Dec 2021 12:41:05 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:46561 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bo-0002Xs-Iu; Wed, 22 Dec 2021 12:41:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSDpOHzfcNnXPh86omy6tE7BryOcco69h/fEeNNw4RBbc8smYOuwY9ZgI2jvesG4tmZB3MS7bYzP327da+wPa6iSEAwDiG/6Xdt+nuxtEuHJdzb1mkI0aCCZ87cgJWKQ8FYkKdvQBH0E+q8WgJg0pDvMDVYlnXruL1GolOS7+aZyGi+kCiMfi2O7Oryzy2+3s0W8SoZNdAyfLnDGR+8nlUBtaGjWZtqm29kHMQ8G0FJbwhihZwvFqZcIYcuj+ED2mJKvRWk8U07Jje2hl1pdrW/pypfYkAcG92taBh2q2moX1M0S2DZgyZ4r477wdRVh3Rq+rE0JQrHZtWEhznlLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnYuXNDZQvKTRTRCGk8qXER7c/B0pHdB/vCQAl3rh+A=;
 b=ZmlLo739NMQveArhuh4L+gUxUmqlaa8b0BQIxQ2TJMLHoYAg1FLz9jaYYIt3bPqgEtbgCWx8sZbyu//W6yHkhr5EcwMVcjA+5jKa4RXentTg/9ecQ4sGw3PDVIlQrMk6L0gLpKU6CWsD35y3nFbrc2QsBxeyZec0Ck6oBheOBsPPsPstJx/KXMF9VdlwKrDdNp86H9MlRGjfx3YoeFpUU1+Kh4DpF8WXVsySWtqq59yJUNO0PZLPHxTiL7qPemw0ubvdomZxmylENhtDSOFC4m3NKHD8kYrZ4YT5iiPDi6G8Kzlv2bc6hrXZN8Ct0nntjE4VeSvfrY8W7pCMFi2c7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnYuXNDZQvKTRTRCGk8qXER7c/B0pHdB/vCQAl3rh+A=;
 b=S/1Kj+uJnesx+QJ9uetbpXFB57c2puEjZRUawsUGmx+V8KFKTR2n7JWtsBrK3aWyhBfcVWXW6/d8xbg7pSDEWCFL3/MJN6clTUpSOdXFWwzjp++/XihIX1MxTcXLhNWpCCZN++0gtWm0cqdS0AXGY2kSqUNrf0Z9xx6sJvBQnDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:45 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 16/19] iotests/image-fleecing: add test case with bitmap
Date: Wed, 22 Dec 2021 18:40:15 +0100
Message-Id: <20211222174018.257550-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fd1686e-5280-4916-fe20-08d9c5722ebe
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB3964ED37BF3633B081647291C17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:73;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eQC3tC32j+e6/pwcWMo6hW/tsNYdwUakjF21PWgr3avsEleqwbTrKHjc4pyhT1s5lvf0ufiFn2Z2S6S+9uGiyO40niqmU1hesWT6rnHkuy3phR0TVb8INf/FtUqMenxVK1zUFiPQfTUf7xb+OSs5tqzKOgQmORGbz3e53/ANTntr0MHy7AtZWMBx7U/AlHrDvsDFauQW+B7uXbce2QxkTpELe0aA2sNmqIR6noCaNZc5mRy7qR6H8FXBNPcpgnFJAVHaI5yKwO7jvoaL5fvwJpM8xFb1IiGyKofIK54JmkBoY0snNQQcn7dPxPAqTmtvK88B3a4vPJX2ztGStlVvmxD3jLyq7QwAfegFbNIK82Ev/20xTq+G1Vetc60PhX5QHOzXfUg7DY055/QZ9aTG03A9L1lobyKzxaArNJrIHZoleyPN/j6Qo5GvWRS7336ld7ad+kh9DlTK1dEa6Wt9QpukID4DZiyuZhe85ZyNfmMnbybpY2drMHEsD990wlFFy0g6Ob296zmjxMM6sOmGYfzq9WLZHYJI0o5vevFUwnFXKtFwokhWmSgmSwK71csLgvdN/uQAAIk50IT+R2TPhEQ5DykRdp3w/J1+lZn3hTdc97oKjPMc626zmDfWEa3JAnn8PRt0/QnOpsNbb0Zn2GSmA9bGWHhxacCFzDITbm6wFN7h8yFIORDE8CA5+CdvBeIQSTpuxinxLEH2qfNzJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(52116002)(2906002)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hElKcPXP/RrtWIZeDGkoW84AWBVLDkQ3DK80H1Du04JFi6/9p60T0tFmAGeE?=
 =?us-ascii?Q?xvD32qvEuDgXPowUQDKwVdfgoNLFqTvGAojUsbD8juAciZWSW2n4ZzTjXyyq?=
 =?us-ascii?Q?7lZZH8PVn2V/Wf14Z7OVbOFJmAKOY+sTBTS1HBeMDdx7C4qwDNdBERSkszFB?=
 =?us-ascii?Q?K16RWF7A/j4Ur6UhP7Jw0urh2SXmtjB6IE9XENYnBMX4Duj6NtfeZIJCtM6X?=
 =?us-ascii?Q?ZUggWpwH0QI9qgaZlp27vwP52Z+2pqQAD04+mVEPXCntQKXwEhMh9UyqGo3L?=
 =?us-ascii?Q?TPB2HJ2kHryTolZZU4cbecRJaaMCWAA/USoycU/+dx4UMCK+PmlT5N625JbN?=
 =?us-ascii?Q?ZuptWmAPOOGTY6oNlWffugGwZn/jFZ2C3HKny6v1UpgL8hS1695ilS9VEJHD?=
 =?us-ascii?Q?EclH+UDRUGuYG9YahPZH9KrmWk9sBX+Vw9Kt7IMnebxVv/noh9HcJLsezRHn?=
 =?us-ascii?Q?qy//yrN8UJoIGbwYzwxLYy5a86cYzhfGGjmti944yRwNx9uyHyiJlvKV/7i4?=
 =?us-ascii?Q?dtywRlt8Jh3MPBAbNLl/uq9/nu0jlbArY9DtWkm6pdzBP6haJJp+Pr7CLKnf?=
 =?us-ascii?Q?X6rLV7h6OIKf+Bt3EmdUw3/MO1aOklXd350ep/SxBNEqL1HdQK6r+o7vNuoG?=
 =?us-ascii?Q?hduK90vIk+P+Op7WOUUluZPjvDn+HjqTrPxhUxA4qSvy+3JIHgPkw3PHDqXn?=
 =?us-ascii?Q?9SPnT1XnGSJEji4nK/hpWKakTBlaJ28enc8/sk0nrP/OFRz/XxWt/DjM2jId?=
 =?us-ascii?Q?xlvYkS1RMYHWrSB3qzIGRIhpf94mo9PPI+vInAJDeTLb3mkoqg+2l9CJej/W?=
 =?us-ascii?Q?tRaz0O1LWKSIwjs8+ZitrBxI/az6C4TywDS3wce0NmCoN4nmNvDxbOQxxbQ5?=
 =?us-ascii?Q?KBO0JQFBWYmmFymWyv2xadNpbAa5Uh1Ue9N7EGNo0h3hsuLYS5TgOPwg0z0z?=
 =?us-ascii?Q?rStCKVQsGJmUySJwzTFVPjdrDief1JXrkrhnvs+Cn3H+Dze7xFcT1wUVVZ4l?=
 =?us-ascii?Q?LTbsFtS/HNk/WX/acAO5LeUo70+6VlGubM4bopApYuRQsJRRJ9xh+7m9ZKhW?=
 =?us-ascii?Q?l2Zhh73Z7VqSEzYMxZulEM0Nrv55+n31nElVhkCAQFM8W9gl+QlcYDucflUA?=
 =?us-ascii?Q?HmO5uozZJu1+3as4ViTW44wvOkFVjHDSDectI6/pVAXaPXdEuaimRdetyxTL?=
 =?us-ascii?Q?U/CKZOJAlbQ+l2PKaCsnMIxKrlW8rR2S1SaNTysKRBgU0uFWSGfN76fiVMm4?=
 =?us-ascii?Q?bxUP46q7CWY1RAE2KVxGPLJT0vvW44NhGPX5gBFyDfzG5gaItNETNAdj+QYf?=
 =?us-ascii?Q?3VgU1tFYEv0w/0nK4Y4vibA+gbbzFCJ8BmI32ufMEtx7K9DYlU8J1Dh1EZOE?=
 =?us-ascii?Q?jdub0IpKO9jnzmDppPgL41GHwCS+riEJ5wtcC2rJkubL7zCV16JiCcz8uJz8?=
 =?us-ascii?Q?/HR+3X+At4REqrR5jAnTezgS7j1jEAhrd8ZqVK5H04fViSGmrv+fxUTuvJrq?=
 =?us-ascii?Q?egDhWVMYoWN6kE9+WTUckt0B5pirElvr0dhgQ6i7+/H4L18xK0t90Cym/U5i?=
 =?us-ascii?Q?HfF09jh1i+UNt/cKZsYObY4msbOTwL9wmiYsX7Yb7WKGyDw9UbP27V70u4bG?=
 =?us-ascii?Q?dmsYGVp6unJTmLwup+WMG5c/rF/RzGGdCimYGwi8hl4lRwigZGsTFDsen/fY?=
 =?us-ascii?Q?2diMXg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd1686e-5280-4916-fe20-08d9c5722ebe
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:45.3347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5fAgzOnnV8EaGtbYVtFlwf16HgDZGOhHQ6bbhij2+pZ8ZupZsFgbqiK2hI2+rwhYJGIY3jvZXFzDZC7IeYy+eDo70ChczgjJjxCttuQZoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Note that reads zero areas (not dirty in the bitmap) fails, that's
correct.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 32 ++++++--
 tests/qemu-iotests/tests/image-fleecing.out | 84 +++++++++++++++++++++
 2 files changed, 108 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 2544782c28..279047b19c 100755
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
@@ -114,12 +118,17 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
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
@@ -149,7 +158,9 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
+        if ret != 0:
+            print(out)
 
     log('')
     log('--- Testing COW ---')
@@ -167,7 +178,9 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
+        if ret != 0:
+            print(out)
 
     log('')
     log('--- Cleanup ---')
@@ -202,14 +215,14 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
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
@@ -220,3 +233,6 @@ test(True, False)
 
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



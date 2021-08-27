Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975453F9ECC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:29:19 +0200 (CEST)
Received: from localhost ([::1]:43528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgbI-0000j0-SV
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRF-0001BM-MJ; Fri, 27 Aug 2021 14:18:51 -0400
Received: from mail-eopbgr50135.outbound.protection.outlook.com
 ([40.107.5.135]:51459 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRD-0006cN-2R; Fri, 27 Aug 2021 14:18:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+H6wXu3MFk+qG/Z1M+g2qrElr+eFb22naDu+4x+GkhPw1G1MqGtsIWMwpYIsnzobrJURqnO2Q9rkXH1aYTK9nCE0p7UMbkReoYIUR+ksh7zSAQqJa0nwaW1JVtut3Jzib86NFBhmGSUAeqITBXdIiiY62CGgJo4UOYRjjTcGEhFJY+fli3t2impvQ0/yZj7Kg4dclh2oqEjjfx+4zGeGrgFQWgoUxv30DySdi3ddxm3HZjcSM1Qzh+X3RxMwkVZSAt3rrN61xJCZuD7hbqO7MMSyw2Bp6+txfKtXceFY9AGEyU64p9MKUG0hGjBzPa/lsoBi1vtOn7KIB5SNtSdZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1/rfww9y6pHiRO4VH7beSnKqbM6c2myvkv/iotlFyM=;
 b=LcYZ7bNvn8lcJfsdZZvRFrox8vmWs8vhhpDaN2AmNPwP+pDSAd59P+ZmvsEt0Ngk+pN+dr/kEWMEpxivtB0B9z2QUmhbTeWa7ZCdYWSATjPBmN/UXtKTh+FgRCzMDNYN4V3XBjZ+moz6n4kfK3JMyUEXplV8GWtA6+6JlcDRvzPPFWeIKvemYAsKP+HbrczEEpMR38nIyMtF/4nWGplVQHOwsfuuspGRVxRwpnQgAeH+L79UetNP9vGMVwPj1FGfNF18mO5vQqzPU7iXD0eQTLz7AY4TEWDk9e2uzWdDFxEbaqDCR4l+QAB3+VHAA61UkzIXpKJgX4HeNGWz1hW7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1/rfww9y6pHiRO4VH7beSnKqbM6c2myvkv/iotlFyM=;
 b=FNdlrP56KJnwckuHX4b5UWD4KFXnYkhkgV9+pqPNnAg9Ys0k+t2ZI+6NALB//LHIU8o5CRFoyDAalfZZmSWQ50Byu9NySeNNJ2YnDckjMEpSkTjzE3nSL6WKKz8iNctk6IWZQXywHrxIwbag0/7//MGPdJDs3NsSVQclEvGk0SQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6774.eurprd08.prod.outlook.com (2603:10a6:20b:399::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 27 Aug
 2021 18:18:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 14/19] iotests/image-fleecing: add test-case for fleecing
 format node
Date: Fri, 27 Aug 2021 21:18:03 +0300
Message-Id: <20210827181808.311670-15-vsementsov@virtuozzo.com>
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
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e7b1f3b-3944-46a9-89f1-08d969871929
X-MS-TrafficTypeDiagnostic: AS8PR08MB6774:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6774A3215AFD4F082F8E5206C1C89@AS8PR08MB6774.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:459;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbEbQL3LvcYYWGQkm/dDJf+uR13YxVgZRkLbSaEDXTLh548EXdIhN2to/D2bqlvmE3JSpxLZItU8VA8cYRKsSUUhKVLw7UifkMyue/Wyr8Noov3Uh7Z+EeQpvnE97CWMp4fYRTXyYXOvRDLWbVMzLclduSuth+eq5JUL9PDiZSPmgRE6D/Mh7KYb9WFzspLiSKWiVfYVkeqLH+qfkSm798j3GdAz2uRxvKuRUXkJ0tGc780UgJRmQOZhqIRny6c8bi6CE3vGlqiKleayPXiAvbOkYI/AatjlZ0+Lbc+Q2yXa/xtCWKRtHQGRPMJ6TfTG25wLEH67zd6sSVHSE2TDwdJlZi0z+rlIBwZKR1Thu9jlIOGUv5yN1pzbY31vwSmDHN2NJb0ieV/juL4zQ5UQ7ZS+6g3/9POv4NHEZeJPmRg8lc9Xn7MgJ7f7rVJTzClUGQOn36x4QaTkFl/ph59QXIpuTsq8GiZAl7zr5mQk6Hhhf/FG/MNBK0kmIq+1N5uE43wPAQdf6OPrRb/qdAGsqK9pZsuiRL9OF2SI/daT/ZV0GdFi1DK7oDEdAJaE+Nqeo59B/tmS6ulCy2v7idHJmuQEviEmsyiuj6/A6/DrlIrBqy5UI4KU5381oJ6nY5KQnoG/1SHChsDcbzDHYZSZ2ahk30ewyqTj8QJfH73fwuPWIe0nsv0glrmE/lN6IFlsMn2J39A08Gc7c32zfGxhaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39840400004)(136003)(396003)(346002)(6506007)(52116002)(38100700002)(8936002)(26005)(66556008)(316002)(6486002)(86362001)(38350700002)(6512007)(4326008)(5660300002)(2906002)(83380400001)(66946007)(186003)(478600001)(6666004)(956004)(66476007)(6916009)(36756003)(8676002)(2616005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/CpdjBPILpZ4cY8ndiDe7DplgRucYUDHJoDUcDbj9AF31kV4K0qiKvOzUNwo?=
 =?us-ascii?Q?TPyFahZEp9cyjSD3OQk8J2dpn/qgn7kCE+bplutRmYGz/HTe4va/z3cp7nwI?=
 =?us-ascii?Q?onfbqobWV6yFvn/FqFf5GJQ7EjDGH2StL+4Ywb1jdVbfIW7Vw3kvrmcbD/lF?=
 =?us-ascii?Q?aX1FOaZxBRL0XvMbVQk6uYHJLuQRiY5okh68HZSWVRS5fwuzG7Cn86Lna2ir?=
 =?us-ascii?Q?su21YN0xbM/RWTZDy7tJzzuiRmJz15NDZ6NGkQqSafYTazvIHnRUytWXrBAt?=
 =?us-ascii?Q?MTb34COvIJbD4nFqw6TiSH9OAjz0aycJ7vmnGN5zDlLlQhbng8YufdaxjcQ8?=
 =?us-ascii?Q?Mzesj1CgPbibqkHqWlHzeslorSxj3/qynPYW34eTkxIdWLk/9lZn5nZ4B567?=
 =?us-ascii?Q?JH2/wuVTBxmWKnSTsKkTNS/r7cprOjIUj8VGV6DRoKAzLdZLsqdiQ73bZcGx?=
 =?us-ascii?Q?ErHL8AbpmWNlZYcTlphtZpuXCIwJFK+NZ/ZiHIoWNvZ/nlaJqLCLPo3rbqxB?=
 =?us-ascii?Q?q2xCoEgfNl3e+Bs3+KfYrSO870WkEeikhMP9mHKhDVU5RWw0j7Q+IVMYEvOo?=
 =?us-ascii?Q?cEIxw/R/6GG0P2LfLdj80kEqxxv8RTfq3DoHeE7aJboUcspdaFNdoLxu+DqF?=
 =?us-ascii?Q?sHR+9iB0BvfnYqIKOXo46cCLr+ndwLNF/kIOOaZFSAkfiPB6IUdyEP0CSlGt?=
 =?us-ascii?Q?SHPOiqLI9cOFdKJ1Mc50YwY7LYz+cyE+dUbD+F+7aHs6DDldN28svM1TBOMs?=
 =?us-ascii?Q?v8INlpSJzbj+BRdRgkuNzuGayG+90DjaXuUC0L7k45PRDZFukNn3ISVOyYPe?=
 =?us-ascii?Q?2JJU8FSyn8aa8ZAw33rl97FNTdX39cqcYgo0B7oQdX9i8hgjFMU128toJfId?=
 =?us-ascii?Q?2K1TBrw0jax/B6Fo5dqzpezX4QXcUrGhyppZBZIKaVxt8pGMPUb8UyR9ww2Z?=
 =?us-ascii?Q?kZILSg/5ifXGG8x8s/PJLPZ1tmmDlpX2ZSXxNCnzdJZk2/WshYDoBNOlEJRW?=
 =?us-ascii?Q?fYxFQxAmA+1d2DnBlbMr7HWNzyZ0LjZKgWEzecTjktulVBKA3mOrixiX9tjD?=
 =?us-ascii?Q?FGm8ZAUYjkRDgfllY+pfpze5s4ClbvjjTDDGSWIrNCqadL+FiYBH1gs8/5Gx?=
 =?us-ascii?Q?8h6Xj/echEXwcbp3LyL9IQPfrnDhORXfJ+u3XvbpY+GhQD811/ozV+FG0Dol?=
 =?us-ascii?Q?KqpBo1/viQx8O4TtfwUQbTRusd402XeMUNcWYYkaon6OSSOtULRVfOCoPhmf?=
 =?us-ascii?Q?VNA4hMdqYP8Sq0+EUkqCPHaNxhKMNFnydHyVyjfaV5fQeGwuRj4aMBTvC0XY?=
 =?us-ascii?Q?Yla45qTPOTbgnENApNWIT5Ay?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7b1f3b-3944-46a9-89f1-08d969871929
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:41.4733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0GxrmAS+jKKvoz2237qjGxiwr5+R76xh9bafMbs08vA5+OlDWpwIWYJihsOsWRSXIbSeo5RzbUB08Hnc+F2ZWgt+bYfKb7Km7Ht8OIF2OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6774
Received-SPF: pass client-ip=40.107.5.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 67 +++++++++++++------
 tests/qemu-iotests/tests/image-fleecing.out | 74 ++++++++++++++++++++-
 2 files changed, 121 insertions(+), 20 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index f6318492c6..f18881fa71 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -48,12 +48,17 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
+def do_test(use_cbw, use_fleecing_filter, base_img_path,
+            fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
     log('')
 
     assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
-    assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
+    if use_fleecing_filter:
+        assert use_cbw
+        assert qemu_img('create', '-f', 'raw', fleece_img_path, '64M') == 0
+    else:
+        assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
 
     for p in patterns:
         qemu_io('-f', iotests.imgfmt,
@@ -80,24 +85,39 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('')
 
 
-    # create tmp_node backed by src_node
-    log(vm.qmp('blockdev-add', {
-        'driver': 'qcow2',
-        'node-name': tmp_node,
-        'file': {
+    if use_fleecing_filter:
+        log(vm.qmp('blockdev-add', {
+            'node-name': tmp_node,
             'driver': 'file',
             'filename': fleece_img_path,
-        },
-        'backing': src_node,
-    }))
+        }))
+    else:
+        # create tmp_node backed by src_node
+        log(vm.qmp('blockdev-add', {
+            'driver': 'qcow2',
+            'node-name': tmp_node,
+            'file': {
+                'driver': 'file',
+                'filename': fleece_img_path,
+            },
+            'backing': src_node,
+        }))
 
     # Establish CBW from source to fleecing node
     if use_cbw:
+        if use_fleecing_filter:
+            log(vm.qmp('blockdev-add', {
+                'driver': 'fleecing',
+                'node-name': 'fl-fleecing',
+                'file': tmp_node,
+                'source': src_node,
+            }))
+
         log(vm.qmp('blockdev-add', {
             'driver': 'copy-before-write',
             'node-name': 'fl-cbw',
             'file': src_node,
-            'target': tmp_node
+            'target': 'fl-fleecing' if use_fleecing_filter else tmp_node
         }))
 
         log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
@@ -108,16 +128,18 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
                    target=tmp_node,
                    sync='none'))
 
+    export_node = 'fl-fleecing' if use_fleecing_filter else tmp_node
+
     log('')
     log('--- Setting up NBD Export ---')
     log('')
 
-    nbd_uri = 'nbd+unix:///%s?socket=%s' % (tmp_node, nbd_sock_path)
+    nbd_uri = 'nbd+unix:///%s?socket=%s' % (export_node, nbd_sock_path)
     log(vm.qmp('nbd-server-start',
                {'addr': { 'type': 'unix',
                           'data': { 'path': nbd_sock_path } } }))
 
-    log(vm.qmp('nbd-server-add', device=tmp_node))
+    log(vm.qmp('nbd-server-add', device=export_node))
 
     log('')
     log('--- Sanity Check ---')
@@ -150,16 +172,19 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Cleanup ---')
     log('')
 
+    log(vm.qmp('nbd-server-stop'))
+
     if use_cbw:
         log(vm.qmp('qom-set', path=qom_path, property='drive', value=src_node))
         log(vm.qmp('blockdev-del', node_name='fl-cbw'))
+        if use_fleecing_filter:
+            log(vm.qmp('blockdev-del', node_name='fl-fleecing'))
     else:
         log(vm.qmp('block-job-cancel', device='fleecing'))
         e = vm.event_wait('BLOCK_JOB_CANCELLED')
         assert e is not None
         log(e, filters=[iotests.filter_qmp_event])
 
-    log(vm.qmp('nbd-server-stop'))
     log(vm.qmp('blockdev-del', node_name=tmp_node))
     vm.shutdown()
 
@@ -176,17 +201,21 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('Done')
 
 
-def test(use_cbw):
+def test(use_cbw, use_fleecing_filter):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
          iotests.FilePath('nbd.sock',
                           base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
-        do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm)
+        do_test(use_cbw, use_fleecing_filter, base_img_path,
+                fleece_img_path, nbd_sock_path, vm)
 
 
 log('=== Test backup(sync=none) based fleecing ===\n')
-test(False)
+test(False, False)
+
+log('=== Test cbw-filter based fleecing ===\n')
+test(True, False)
 
-log('=== Test filter based fleecing ===\n')
-test(True)
+log('=== Test fleecing-format based fleecing ===\n')
+test(True, True)
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index e96d122a8b..da0af93388 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -51,9 +51,79 @@ read -P0 0x3fe0000 64k
 
 --- Cleanup ---
 
+{"return": {}}
 {"return": {}}
 {"data": {"device": "fleecing", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"return": {}}
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
+=== Test cbw-filter based fleecing ===
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
+read -P0 0x2010000 32k
+read -P0 0x3fe0000 64k
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
+read -P0 0x2010000 32k
+read -P0 0x3fe0000 64k
+
+--- Cleanup ---
+
+{"return": {}}
+{"return": {}}
+{"return": {}}
 {"return": {}}
 
 --- Confirming writes ---
@@ -67,7 +137,7 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
-=== Test filter based fleecing ===
+=== Test fleecing-format based fleecing ===
 
 --- Setting up images ---
 
@@ -82,6 +152,7 @@ Done
 {"return": {}}
 {"return": {}}
 {"return": {}}
+{"return": {}}
 
 --- Setting up NBD Export ---
 
@@ -125,6 +196,7 @@ read -P0 0x3fe0000 64k
 {"return": {}}
 {"return": {}}
 {"return": {}}
+{"return": {}}
 
 --- Confirming writes ---
 
-- 
2.29.2



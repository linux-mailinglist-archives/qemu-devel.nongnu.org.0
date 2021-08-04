Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB99E3DFEAD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 12:01:56 +0200 (CEST)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDil-000878-VW
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 06:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDNc-0006tr-Th; Wed, 04 Aug 2021 05:40:05 -0400
Received: from mail-eopbgr30127.outbound.protection.outlook.com
 ([40.107.3.127]:26086 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDNb-0006y7-5a; Wed, 04 Aug 2021 05:40:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5NnsjHRw8A3bGCLzmi0KlaFbT7SZm430o+oUL4PHjJ1zBoaJ+GsY4PBoNnyXsDK/JLzW/c+p4Rg5NEoXUO1H2Wn+Ybl4hC7uYtMdExerqayaZlsxL2YQ+KVI+YrNPm/MQuj4Kr/p1/LOoTv718Af8aM1wOPT2H0EEWvtEtkQPkhwVpcroLsKvES2/Be+PMBUW9J4gfBzHrJOVqxHDSm2Lychof/9uDZfFxfsAk1Kkbf8XLKoAVFBXGp/inzj0gnl7PbDqvJUuCCFx0/46IODp5cJX2/OuEnf61RCvVy3GATU3sw7ji7xsbkuC+WL1uQJatyuZrl6mXbYc7Fd6OZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5nciexShtPATulwjI+NVK3OnuPoB2K9ZiF+peWiDmg=;
 b=YtfxpWq0UIh72ZsBE4KfDgYL1NwpRpWlK9OhohN/PLbKWrm7m9+Ezdn/T4S7B24+84IfOSd5nDHw07RJYeUUMI8NNdHJAmdc94gW6dQA6Kyh8dfItu6IP3xsKyCF5uhokSanw6iFeMGlhHnt0UaCkICz/D6dS0crFQDW+JUJn5RTlcCBjFXdXNMep13lNJPhVTSgdXPXxau4pUwhNU7Q0cayl5EiKqvyaSKxHw7Q2LttB6sHfQjRY8LP3wwhtREwIl4Doej0Ylrcnu9XubyEYec1m0ctVim5rF9dWStpjb7tUfpW25XpZsTAJ7s+VWu8akPmm6RhwF+G5RP1Lw0MkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5nciexShtPATulwjI+NVK3OnuPoB2K9ZiF+peWiDmg=;
 b=uCA5XuM3BR/wdvDQc0mV3fQHk0Yv+iWP3i2Du+9sWB16+CFjV8zWukHgDgDp5F3OYDeUDsX35S52Z3P3Z3xuz8RILIiYJyIo7IS2M84ilIAokzOtkw/FjLdZ6uOFmHhwAybGxoLFZWW6JChI6yQzqLOWPPCVatPgaKwawXoewh8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 09:39:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 33/33] iotests/image-fleecing: add test-case for
 copy-before-write filter
Date: Wed,  4 Aug 2021 12:38:13 +0300
Message-Id: <20210804093813.20688-34-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9ac9c80-1bc0-444f-9182-08d9572bbf00
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB533680A3786545D22C68C181C1F19@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1SWc1kQqiOgRhHb3tMCzDfS2chrt36L6oC8T53Zbr8kBgAXN7bQDqoa/aJ5B3sfS/q7263JjvcA7QjxSAtGoG+bWdK3QnjvRNckBqVn8P4Bjl7d2TvcqRsQwJIwlWOJSopyc3wNSg1GszmpGXv68YhY2vMI1fcHUoBqn+63cLJvPngUdplKYGkkLbAc6vauI9k0ZJYwY9RcAaQPmx86VR1jfXsJhJIjOG20E4fzoUN1ApXF306dXadk2Mf/sVj9dxKl65MxYvAQLKmNRhI5HiOcHCgNAJ0+k1PrcenfCEvGTdt4ZwKkRC6uyek7U5WoWjeC2OMl0GZ1XNOpW7T/dUWEvEhcKL9Ljm4KHbP6W1XTL1nv6+1A4n1Iyl+IRBu8HFK18Tg/giyZ3I1xy9vn4Snlkpp57XBjTeBImqRxExmSlUzHyCRrV981t2qSEtMaMWfPnh0bAQ7UwPVYo8Q70EQFgm7p1ibGja/EUDn2MyuiuS4ALgWr4pE/HKkOFd+AFgBI5Y+Q8NyCAW6/zmQ+LkK+RDGRk0iW8evIYpBLeAZSO5yHGEcsB+7zgR7oi5v2coQAxMq22iAARaAkci70qJX5Xt+IDVys37xu5GkQjmvCIVtrJ/u+ob5AWIW1Aw2ozOU29b24NUj71PfBU0AyxX7gH9G4fpFDusDlBC7DeuFJUaK0SdXFwnk/au1wjCj1EstvaN9Uf8FJcS9W4IPzUCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39840400004)(396003)(316002)(36756003)(956004)(7416002)(2616005)(186003)(6666004)(38350700002)(86362001)(6512007)(26005)(38100700002)(6486002)(1076003)(52116002)(478600001)(83380400001)(2906002)(66946007)(66476007)(8936002)(4326008)(5660300002)(6506007)(66556008)(8676002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hs73SiadJ7gy5OOUhin8utFasdqtAQPiOGVvXx/3ATEajEwC8WpNlbXveGHx?=
 =?us-ascii?Q?3bpomGghlM32HvzbF8Qcg88Nj4ogGgiMTC12qjwf6pEMahM4adeJBjaKOais?=
 =?us-ascii?Q?waHZxNWs5ivbMI0f0E/5fLvR1lhB6IQBP7SsbZOyIhv1bnxssDKBHlue+9NY?=
 =?us-ascii?Q?soV87LmbA1gQUQBa9hBo3M8ZjJIhLEDKu0WgghEKB5HybvohJwAW3iZX1umI?=
 =?us-ascii?Q?JAoYjAObi013RBYh4cx0fnlEBm4uuvmbmzA2RrDFQpYjF4avyVOPsN4QILu9?=
 =?us-ascii?Q?3S7xGyevdnrnpiLwRIPzhXdNy0eU3zPsMxMoTu8WCW6Z3s+tuZws3w+KD1wV?=
 =?us-ascii?Q?eoF6SMdnc2Sg8cT7rGAZ97ncBKnNSY77U4BkW3F0r0tMVi3l+jS42j8fTpkc?=
 =?us-ascii?Q?kqxwLDSzVjdXhPH/dUDHvSatFfYGeT8OJV0kVo8JW0F0/nuCZD4cWJ5lW9hJ?=
 =?us-ascii?Q?3/JFpU70G+UaC0nHd9rZG0OP8Z7i0NzRDguYxq9j+wJRpgrsxJekALg8Ibx5?=
 =?us-ascii?Q?zgNmCmfpCAG0LKoDcRMhbHouqIVxWqj/uJx8QDml4oA1HSrUkruHSQxthSSN?=
 =?us-ascii?Q?j0YpkDdP8tKrZg64hjLywKWjFriniXVdHxfHCJxSuG8jZrhMlkNtWcWE1flH?=
 =?us-ascii?Q?KaMyVzZqGxKNyS4+xM/kgpA6E2zyMw4s+w7U3LVIBj6uJY+A2ks+lBfxJvof?=
 =?us-ascii?Q?tjAifyJo6Z1fjwk+C1XnVVvrQIXvXeA56YN+iLR/eFEvnfavjTkaOsqb3clc?=
 =?us-ascii?Q?FxPo6RmJbk0gRnTH2sQBj7kdYlngk1sfyeeCFP6eruzND7Kst7GOa4Dnp3cJ?=
 =?us-ascii?Q?A2iNDFOVNbdeu19gLFUMB0zgllRD9FN+xHyIqLJkGhTkjgEoVkZDbAzvrYIi?=
 =?us-ascii?Q?MM7li5wyr/5OYYZRZ2KNkb8Cv4WKtbDUh8uJ7MnFWJ6Wp4pxCutYkra4u3vw?=
 =?us-ascii?Q?zeSkjN3ObTRdKhwqYlb3RZm+zWtQWKCaC0MX05BwCOvBtKADrcJUaqjBopse?=
 =?us-ascii?Q?cNBZoNzQQtLxtdZDKTFX4ZNfgFSZBwU4aMcPaOQ+HLjfZFidaORBFJJpjDvM?=
 =?us-ascii?Q?FmeW253QFMGXzBEoY4nuARV31z9YRw7NoUUOjggtCt+68JJzuQ9n6WjJYNsF?=
 =?us-ascii?Q?TVdVe08PuP6p2r/Md+t/8H+DJ6aCV2OuH/ob1BjQgJuUCuWFG8vnKLIR7fvG?=
 =?us-ascii?Q?PuS4YWS7LrwnXaUwBVMDaGKxv7yNWLhhByk38AmuTHUD/HjU2TV0dWBtPdib?=
 =?us-ascii?Q?l18vuwYk8/qbqkBGSUp8tW0Bt2HIW/u8DP2a+uqjTUxzlIB6iQhvOzzMTy9x?=
 =?us-ascii?Q?xqxIrDb8RktOEY7GHwL/YZTb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ac9c80-1bc0-444f-9182-08d9572bbf00
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:25.0894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gjBw4FJrDob2uTl5U+a84DWNY+xOCayZGXl809W7+f3SY4vLaVl4pl9fvxa+YToyvn4oIY+VCGPhqB/Fdg7fD/rp3RMHB+JHUbpTBBceuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.3.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

New fleecing method becomes available: copy-before-write filter.

Actually we don't need backup job to setup image fleecing. Add test
for new recommended way of image fleecing.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 50 +++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out | 72 +++++++++++++++++++++
 2 files changed, 107 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index e210c00d28..f6318492c6 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -48,7 +48,7 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
+def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
     log('')
 
@@ -67,6 +67,7 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
 
     src_node = 'source'
     tmp_node = 'temp'
+    qom_path = '/machine/peripheral/sda'
     vm.add_blockdev(f'driver={iotests.imgfmt},file.driver=file,'
                     f'file.filename={base_img_path},node-name={src_node}')
     vm.add_device('virtio-scsi')
@@ -90,12 +91,22 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
         'backing': src_node,
     }))
 
-    # Establish COW from source to fleecing node
-    log(vm.qmp('blockdev-backup',
-               job_id='fleecing',
-               device=src_node,
-               target=tmp_node,
-               sync='none'))
+    # Establish CBW from source to fleecing node
+    if use_cbw:
+        log(vm.qmp('blockdev-add', {
+            'driver': 'copy-before-write',
+            'node-name': 'fl-cbw',
+            'file': src_node,
+            'target': tmp_node
+        }))
+
+        log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
+    else:
+        log(vm.qmp('blockdev-backup',
+                   job_id='fleecing',
+                   device=src_node,
+                   target=tmp_node,
+                   sync='none'))
 
     log('')
     log('--- Setting up NBD Export ---')
@@ -124,7 +135,7 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     for p in overwrite:
         cmd = 'write -P%s %s %s' % p
         log(cmd)
-        log(vm.hmp_qemu_io('/machine/peripheral/sda', cmd, qdev=True))
+        log(vm.hmp_qemu_io(qom_path, cmd, qdev=True))
 
     log('')
     log('--- Verifying Data ---')
@@ -139,10 +150,15 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Cleanup ---')
     log('')
 
-    log(vm.qmp('block-job-cancel', device='fleecing'))
-    e = vm.event_wait('BLOCK_JOB_CANCELLED')
-    assert e is not None
-    log(e, filters=[iotests.filter_qmp_event])
+    if use_cbw:
+        log(vm.qmp('qom-set', path=qom_path, property='drive', value=src_node))
+        log(vm.qmp('blockdev-del', node_name='fl-cbw'))
+    else:
+        log(vm.qmp('block-job-cancel', device='fleecing'))
+        e = vm.event_wait('BLOCK_JOB_CANCELLED')
+        assert e is not None
+        log(e, filters=[iotests.filter_qmp_event])
+
     log(vm.qmp('nbd-server-stop'))
     log(vm.qmp('blockdev-del', node_name=tmp_node))
     vm.shutdown()
@@ -160,13 +176,17 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('Done')
 
 
-def test():
+def test(use_cbw):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
          iotests.FilePath('nbd.sock',
                           base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
-        do_test(base_img_path, fleece_img_path, nbd_sock_path, vm)
+        do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm)
+
 
+log('=== Test backup(sync=none) based fleecing ===\n')
+test(False)
 
-test()
+log('=== Test filter based fleecing ===\n')
+test(True)
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index 314a1b54e9..e96d122a8b 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -1,3 +1,5 @@
+=== Test backup(sync=none) based fleecing ===
+
 --- Setting up images ---
 
 Done
@@ -65,3 +67,73 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
+=== Test filter based fleecing ===
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
-- 
2.29.2



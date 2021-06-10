Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9FE3A2ADE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:55:59 +0200 (CEST)
Received: from localhost ([::1]:59300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJHy-0001i1-To
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqq-0004Vn-56; Thu, 10 Jun 2021 07:27:56 -0400
Received: from mail-eopbgr20109.outbound.protection.outlook.com
 ([40.107.2.109]:37643 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqk-0004p6-Mw; Thu, 10 Jun 2021 07:27:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvyGtbIwCq+EGPV5sK5KtEy/BF5lGOAAFne/vz9tG6m4//X++X8su9vrZECzdy+MMNcwOlBRYRUNEaoftHJN9GqdYnhx3/vkeMivyaV1LXoye7dMr1+6gQ/r7ReFjASp22FoTZvHqPYvskkz0P2Uz/1h87CkqFWa9oqPQLVtv14S0mpg9kE4IKhf9KaGOhe2Kep1Es+jTA0e/jwDP76kLgzxw4sZ6TAEJ3lp/zpSCzLPXcUk2l24eSPiYXcVf8hfqLWxOZPJCqUCAVXWYmPI3fZquegsg90y4IRz8Fgzngt6dP6QYb5LMKxHKt6xIPnq5MacelqhYOSfkC3PDJJDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5nciexShtPATulwjI+NVK3OnuPoB2K9ZiF+peWiDmg=;
 b=UKFGlKUOQ235iOAQJP1y5xou2i+pfyg4W848qb/oryevATHMp8bHaTyzbrEbW3FhwePYA/FFezO7s+otbzPZt0pGu5NsSoKmRlRNryzlVHCxa6I/im+mJgKaiVUTEi824qKFi2AZjgT5P2zP3nCdr9uO7VOJa4IrZ6ZdPMi0VyPa1vKwHLZCfA7MZzyWfpZCBKAvHG27KTCPBdGMufLh54sT5Ndh70aAfQRVMmf5hlg2vvwmHzdJwYLlMGrtqoNW5hLMhhfHcqHrTLUTeT6ctjrge4aoW0y/+HBg+WEXJIAvEIh7v4+jwsq2K1/ZhL920F/XKSofEA49yOCMmWL6zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5nciexShtPATulwjI+NVK3OnuPoB2K9ZiF+peWiDmg=;
 b=ZJ9VZzo+jdNcnFCqU4lFZ0gYW3OK16j11jK6aNF07IpUPMnXGqelzyMaGTE8/UjU+9CESJ8ExSIr1ZkeFoCqLGxbh+dD0ljpi3laL/+veVRWHQX7x4x3TmHDI6YXBJA8yQJJRZFyUQ5Qcc6GbA3rwgvLx+cv8UtuI1sYWaLJaJc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1971.eurprd08.prod.outlook.com (2603:10a6:203:45::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:27:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:27:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 35/35] iotests/image-fleecing: add test-case for
 copy-before-write filter
Date: Thu, 10 Jun 2021 14:26:18 +0300
Message-Id: <20210610112618.127378-36-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:27:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c344145-dc25-416a-beb4-08d92c02b03a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19716D97CFC14A7CA30DC928C1359@AM5PR0801MB1971.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2PM9bbmI3Lcmv94lB2p5/keXI4E3f4UytGT1UGg7BGXjrheehYmpCcHr8XvXgfqy87ZTnekcQD93epeN+9CQ1t7mgJqx6KX/eMa9WImSQ9pqCLz0HcKjJvROaVsvYK8uCXygtacWuhlqorCQpeof7cBl9BxRXOzvyNOl4VJDUESZ7qIUgsFZ/fz6lo3sGemLaLzpiK4pEACLbpQ6otTFp3Zd49jvwuF/XvXNV11D/acN8uJmfLSCvLWNCmxmfhonSqGwDQJx8bz6UDQKzPmglAErd8J6mz2MCgiFNz1wOlVnBz8sv1FbRdOZSKabroOAzCKqpI0VWKi/aVwsbIC9vQARhEGtZOTmXlG8d3XxT/DgOz2mZkWREfllht9MwrwLvh7b6SdcXnpys/rpW5FT4NGcyjaQ3DecnIsL1bGNHqLWkbszwfxpn4gzT3UO/l5ViEk/jbqXAzshqUa0Wrdx9gVArkdGMiH8aTWmvC7L/yORcGOAHBqP1/0YSuiRHI+gVzgbWOK8A1cJRkCnFfX6c1Unrm8YM2LM3Mp+yExcJj5fZLhkAazywozTN3L/lQwbWfLIeYiJx+Gd0YUXC+bX1m4rZpRsGkrghfYqGtzD7FsdeZUFPOnMUw3S3AkxSMkRaA4XjZsksta/z1mXMjv4CsryWVghvMws/eZ8UP6wgTaj7+SThc6osVTiDImUF5Sk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(136003)(346002)(376002)(396003)(478600001)(6486002)(5660300002)(8936002)(36756003)(956004)(4326008)(316002)(66556008)(6512007)(6506007)(2906002)(2616005)(66476007)(16526019)(8676002)(83380400001)(86362001)(6916009)(52116002)(1076003)(66946007)(26005)(38100700002)(186003)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?G8oKkbf7i6BIpuFE1yTlTAGpQdg8betqI2BbmOWdv+Kid8EKRUMYCztuxcE9?=
 =?us-ascii?Q?0MfUemNekGKBXHjh2/1s+sJW9OIT9zu6fOjaIHpc6BWBaBKYUwOKraBqB9W+?=
 =?us-ascii?Q?9Zmk4O2JdUrsl+70DNhJ2jLFJVeq+rA/+TT16ZwCeRDAhCQXyP0CeIXJb2uD?=
 =?us-ascii?Q?BW8dqwfTk71e7uf2tEaeogf6VHfrERXdwaARkFHx6rm8SIvJ6bou+bniFNvZ?=
 =?us-ascii?Q?SttnCXf7D2xmIpqtGMBR+M/kNgNaJhjgwfbkGn4SvJdieDi6sCycNACOjPyy?=
 =?us-ascii?Q?tVcvqQC41GmReioxpNOMoJh4B8bGEGJdmPtrFdCVZL3U35R6fks112bdZgEb?=
 =?us-ascii?Q?blNevQsiu+9CfsxpHJHa8pV90pHKX1VF0RwO60IFqiqZ88JxklyHO/8e9SqC?=
 =?us-ascii?Q?oQrqIfEMO11eHUu7psTmKycpF/VxkIb9sroSrkZV8uZVBxp3xb1yDa0QNr0z?=
 =?us-ascii?Q?tqt8YqNCS7hm5GBrYwm4/fhb2mO2BWr+OFig5giundnbI5acg9HQ7EEqdsjm?=
 =?us-ascii?Q?zUYpLLFgAHHLrjwTEVYCELcgmLvBgIgK7IpnE4+6OP9oc7tJxRauAFbS++EI?=
 =?us-ascii?Q?vQmkikedR9LLKGGb2LdAdZjE/53J9BTpm9hl48n2AE2YcCKkCcbZuJn8mebS?=
 =?us-ascii?Q?sfTlZ9K45ZEKCsjAxIFEVn9JyF9zcA4ItPuYyuX7xha53pIJgbBCWbNsa6H+?=
 =?us-ascii?Q?Ai+kpBKTxPWqueTMVrmZebuvstPRvH9fovQxP1rDL58f62eMib6iSUk5NhEh?=
 =?us-ascii?Q?xeP1QHvVw88aGAFyzWMbHtL/vpuae9r3kPY8RdNFGW5D/4DevG2T1bTDfXii?=
 =?us-ascii?Q?Fl+t0//jK7NYk9JBQ56aw5pJo5OIPaC0C//pISIumgu4cCUQcKZLgAAb77ai?=
 =?us-ascii?Q?G33aE8I+K3mRiiJk5uzVGNloaDmXPY4O4pz5t6TK4Ksdp1ROD2Nr3inpPUQK?=
 =?us-ascii?Q?f4o7cE0FwdcJS37Y91WRZwCALRyv4xlWvxNkaLXe71NhCpT+AwFIN4d2BhNq?=
 =?us-ascii?Q?6HDtZM3xW1C4gbknQ1ZgtUR4oKcSxg1QRrtRgE6bpAL03fI5m8oCDGAuW+Gn?=
 =?us-ascii?Q?BYrM+/+U//0BkaIiQe9zNNLQgh9MhvAGltlsw7nmEu0R3oEn1CjOf278wN+w?=
 =?us-ascii?Q?INl9t4wkqMX+IRX67XmwkVfL5UvN8Bzadd7mxfZERprquiJDlFvIBa+nfkLv?=
 =?us-ascii?Q?g7BhVTeAVWDNk4Q3AS9Phw3lnIZmKMs+6BMY9UzYFdQMwuYoU0bW25jmKQT8?=
 =?us-ascii?Q?5yr1wpiq0NmIdlDsCCeMyaAWZtiz4gvWKyhyXpHpUb7Vsxf/YPNFrVHD3Gpf?=
 =?us-ascii?Q?6liwbXgS/aYdzl7pxp5pOjsO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c344145-dc25-416a-beb4-08d92c02b03a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:27:11.0530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuX+oBPAzVe98My0TWFebWgW+pIXR9EjGtjpTr5j48YvP8VNftgjg6w/8K+tbHPooPKeFhxEISC0e/RwItSS6tCrzpf0B1swZwAIZtRUnxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1971
Received-SPF: pass client-ip=40.107.2.109;
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5E13D0C81
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:41:09 +0200 (CEST)
Received: from localhost ([::1]:60260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69f2-00033x-AG
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6982-00005L-WF; Wed, 21 Jul 2021 06:07:03 -0400
Received: from mail-eopbgr40103.outbound.protection.outlook.com
 ([40.107.4.103]:3138 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6980-0002NL-SG; Wed, 21 Jul 2021 06:07:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qz2Dj1dMhpLXL0sFuuieWKjAviXNJEgPvSqi50DDvlWdsr6tAK/4gO8ixhxO5Dsczst+uNPQDd8XpZuQBSpMN+9AaHpIEAvXhjeF1Nc29ExwdqcihPgsp/VRltqLOZKUuDUKUKj9LUxwvEWHUUoicT8AY2appwZUK5v/n/UsdRqgO8UiVSVl/lav9hKBj7jEBcQje5P+b54e5aoKEUBG5oNlW+LWmnG7cnNAFG5zotvqGOEiC8Mo78sIoBP2UK3VqBeTH+wZRutTwYIAWE9d6wTxg3j/pTdtF/ABEQ3DvDGQNr9YGKz9IehJi6aEJ4+zCL7rWYV0kB1IhpH2ReYG/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5nciexShtPATulwjI+NVK3OnuPoB2K9ZiF+peWiDmg=;
 b=VtNOxbhne/34a2yQQJ9BVbQSxBxBSgflahFXU0BlM0Ru8GlLk3xSLWuiEbtkSpD1Vio0rTpQoHhJcrjz1slNk0Ft2/g+BQdb5MPQYg5KrmljF7a76MlUSP+Yn1vCeFFnEHqO8iFihtatkb2spIEHI777N2y7wB5eU4jwK2hlRR9lC1velKfIuae5Gr9NbJ4tAFHvBSZr7uzLzH0/ivRPMrYAOPzwzoKjbDRMgXpk/1k1sLExlUkrXJ2m9/Oh2aaflHkKxE0u5uBhyCaeEvjc8eyBlep9SKO8Qs6ivP78TkrDr6m0lFVe4Q2C3907k1UJO1t2aCFpMhCmSDgb3rFhHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5nciexShtPATulwjI+NVK3OnuPoB2K9ZiF+peWiDmg=;
 b=ccNbXICtjAPLyD8vWCdA4dKr/TU9iBZNpkl6nuQqvy9Nlk9UG7Rc09J07Xw7Ok/NeKUOAuDuekxpiLSR2ZpkksZUatSvzFCRTafWUsWylmTGocRTy/tVnQSdqLa/Cf1wYzB4ZXZt2MM5b6xDZ3746htzJXrCHahBo/hcdx2DBdM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 10:06:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 33/33] iotests/image-fleecing: add test-case for
 copy-before-write filter
Date: Wed, 21 Jul 2021 13:05:55 +0300
Message-Id: <20210721100555.45594-34-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdd6ddac-b220-4202-573a-08d94c2f4559
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5911DE1C902CA78354B1A38CC1E39@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nhWmOVctq6KgvAmLggPd4RiIOg2yEnrESlYSP1BHLK++15+FTaLbJVHbJBj+4WaJ0chdWbvYLqtSnzbE3o93V8Es86+krDran+UV9Fu839OVNNzmo+B8nvYs7IRz5XHhWF80DC1ztUatH8UOm/Kf+fwil7hBW/WzIgab7uhXcI8ekxMhTDhN9HEhMZa+ogqtyCoSw4AONo8+zkJdnd0XQhzf7LNmEPk7wuE62ZpOJ3PlB3f/6bqxus2RRVb/mzK0ApyWHOeJuz0qxA+2iOoGLbf/8SqydwlKfJQHGq39AzY1Qe8cNkRlCgYmTNaFak6ISZB5JsIGPmZ2ttGcSJuolV3rjNUMZP6FTSFhoDZkIpNfBRApTqKWLAzwk8rSzK0gTKK6dosbNUY4G9zoPyLsPZGubj7t6jJRmGItbIVsM7Jjgo0UxgdqzJJx+MUSKvTqFRKe9h4GH6Kl+sQ/RdHJPFP72SC8RJQfF0wbtmUDxhO4DNJ8y5APTZB/EVbCBQPf4ymasurCFQGFF5x3fy1J4dtHVB3BraRpUyFXkYqxJ5na0t/HeJFVegCwJ7s3VoZO2QIKUb3pE5PHtnXvtEqow5cX3uzI32hT9DMlH+s+eHTzqbvUJSUeolJIqMFnRfjlzPgUD11CPIPDvdDmRky14zagtmimQ8Ov7GptUUhYGwivHf0V2E/M6xq2WGTtqjm7dHvWz64eMEF6xTx2mK+Lew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(66556008)(4326008)(6916009)(5660300002)(7416002)(66946007)(6486002)(8676002)(6506007)(6512007)(2616005)(1076003)(66476007)(52116002)(36756003)(26005)(478600001)(83380400001)(86362001)(2906002)(38350700002)(38100700002)(8936002)(186003)(316002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rEmI6aWkgdGyNZR91WMwvjVUtMhoXT/Ob/ExzmVRwMT89Unxo2vwXK5bLMJv?=
 =?us-ascii?Q?rh/nhO3V7PU9h61iZJXSWfjF5QTVC1CWfCxH63N3xR2UOsHh1oQLHsyOcm3m?=
 =?us-ascii?Q?wYcf98rLCDP8Kn7h41HzGDyvK4/EHh33+gXqlxpv99j9n18f2/rl0zfyGYa8?=
 =?us-ascii?Q?2appmWwmJLOZnFQr1bk/C/H2IihN6ITivah1JN6WCJYhPDGtofwGXMj7lm0k?=
 =?us-ascii?Q?S1zJSFFSyHyfTdrKSzFcYcOMMpSErZQtf6NC3CI3j/5c1GtvtMZ9UxiIJ8Ui?=
 =?us-ascii?Q?fQGpx1DS/O2PQ15HNd8DP360+EnQ4/PA3/VYU9vmPWfYyWUwG32sqCNJIW8T?=
 =?us-ascii?Q?EJpi7lnbCODqX3s8dglBCUCYxeK2gc0+vkJyeB3eCT14wJeLHEjv8dpWp/Ei?=
 =?us-ascii?Q?9cmWglgIm1AHxkE6f88dC+BJ/vQxxCmjZ7l1kMuavqRvyvxnGoGFNX4XWvLZ?=
 =?us-ascii?Q?ozH8MXkC0pBDzJQIvbrdxPoo3CZj/Ypc91EfdOm1wHsFY1rDpKE6m4dnBioT?=
 =?us-ascii?Q?jm+vBfmeLJ15zTuogUogXYhcexIJzycT/mPKC+UdYBRWKtoJ1V+Dy1ppvm2X?=
 =?us-ascii?Q?D7RohastuRppPtTJ5qdQMVY66nxZYG1gkfBYMPDdzoCkIk56t2X6zZ7+L6YD?=
 =?us-ascii?Q?UZ8g1tnXfUapPZIL+haEwJrPlHUuM5kaCG4We0hux630p/HeB+tJUi0NYHNp?=
 =?us-ascii?Q?A5gmIFuS4AGsrJNR5KIS9pilfIaJzsPVGwM4aTx3bqae9VrAp73gS/p9526H?=
 =?us-ascii?Q?9gN+lXcISS/LJ/q88uVP1jT780Hm7kL22amw/xwfkNgMGGKuRNvfwVDI1p3W?=
 =?us-ascii?Q?O0XnygKj6T3KnWZyvSc8H4DHms/SGCzV7749C6XIwZacOdQZgTBPhDgIqJwm?=
 =?us-ascii?Q?bMF23YUb9LCli2D6EXSQDnwyCUO4kYTAcVl9SH324N/INbxd2yeqe6qKsS2k?=
 =?us-ascii?Q?XDB8zxV//SyOAfWClIup2evN+FNuR9FRE8Z71Zfq13XgKJs/mQwdMK7DRtQo?=
 =?us-ascii?Q?P6OB4sNFdSAQroyviKOwo5E/K+nMzzps6gy8fE+5wrf1rXbyrXMRK8vEk/KI?=
 =?us-ascii?Q?qAKtbOpydIhathqd8DFoL6zW5m30FPjZVZcJIkhqeO6D6NOcJPQffO91hJI0?=
 =?us-ascii?Q?Ijezbggy26AeiAWyZWQTyrtt+sZqrzEzs51A8534+ksWyo5RA+1FoeFkQXPI?=
 =?us-ascii?Q?/M0idDB+MyLKsRjWTQpjnvrSeBYJJ6uzvz1Of+7qPaexmONgTZEPEj400+nx?=
 =?us-ascii?Q?ad0pmQcbBbxvb4wT+LetWVDWwiNaxx5oSolDpNN3VxE3qTipZZ2eqtf7ETTN?=
 =?us-ascii?Q?Zk8C/eDCltVKHc9+Cv/Fs9DE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd6ddac-b220-4202-573a-08d94c2f4559
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:56.1537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yR4Z8Tit/vuFEX15TQrDf11t+Vul9DN4KqYTLW6xltCs2Mrtfvso80hZv027y0LErehP0UXlBj4kCrxBLQO24/Fan/rEXaBOz92dc2seXeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.4.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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



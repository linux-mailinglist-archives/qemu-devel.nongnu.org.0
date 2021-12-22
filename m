Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B5C47D610
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:51:56 +0100 (CET)
Received: from localhost ([::1]:49138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05mM-0000gy-Up
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:51:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bn-0001Ln-Sf; Wed, 22 Dec 2021 12:40:59 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:46561 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bl-0002Xs-TV; Wed, 22 Dec 2021 12:40:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPxcJTeGuJX4S5bEPhHiGmpypG+OvJ6BW3/M58S7T7OAFonCyNOEqh3YgEEIwK9RIGQ8NIMi9FnB+MLGYg97T8wzQEzTxvwmA/sDW58R6QNrF83V82LAVT7kWyh9wy/Bu0erLSxpevTLORtUKPkvTVGh/MYULk9xCoxmJZv2N5zHcdG1PO+lrBceePZXcXamZd4x6CkFwldx4Woq6CUu2L9lU2SwbcMwfFalkJkY92vNG9jOhQqgMJ//iZOMCfqhl0erj9Q7NljMNLBFxu7L5g/YJqHIvxWnMPSuTzYm0BqLWywLQHjL0J3fuPUZMeOKHD8QdsmXlRvT3o5jstHvuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JFv4Ywktgv9DuYVzG0rBqLdPov3WegBCIbYpmaTa28=;
 b=mK3tNV9TbY1nFcLhFdyR1lM9DHRlaUpbV6RH98s24ruWAm6pr+UqlgYr+aOHd/FVF/uFUtMzbQJKo04BP1Dq9+NF3pWhdcWM5eaHtssDNRPKkOYcROZdfl+fnb0o71Wo7vR4NTb+xu4XFfYbRYt4WoApb3MkU6l7y9txxnehkiNLOmOTJLXL8Mq+3tOvxZcZiMa+wPadijvWGahPgCuEkCnXEfIutccmoDSYzUhYxfqZkuhKt5mlOC1KdPy6xrFkAZ38mu1drCdtUXbrv2Uxby1RlMraElnE7ZW8z0zZNk6plEhLZUP6Tfv9z995RRR0hAaEZQneN/MLMisO8+2FfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JFv4Ywktgv9DuYVzG0rBqLdPov3WegBCIbYpmaTa28=;
 b=i71sw6Ba2ly/48XuOwtIX8FlRosKmOUsiJkpfghY09Q6Fv4TZyIOBySE20m3QULbZOjia4TCwZxjAhOu7ZXAkBuZGkkdHM0sf3eJoMuca8Vu52Pw71lwsCAwkPMlfbWa8+y1mcp2Vnzxm5D7FUpgjK8iRjwZwkxNE7Fd0r6xDTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:43 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 14/19] iotests/image-fleecing: add test-case for fleecing
 format node
Date: Wed, 22 Dec 2021 18:40:13 +0100
Message-Id: <20211222174018.257550-15-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7bfeef1d-2925-4da4-ddea-08d9c5722dbf
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB39642FAA133255EAF90B6411C17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:459;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ESWF+6AXwgqAhX9kdyGtvqKnHXPQW4b3Xie1Hsb4avcMiF1wwvaLQ/HVR4PZqsViW3dajhkKP1aMZp+CAcWGj7d/Gp1v9+4+Tqno+SNtqIVIk2kXF5KFZwoOvXWtaTgDn/5tIS2omue13e0+G5KOUgRaQyFpe9uJzChQZLQqdWL1rWGXVIqQcUEY/NZfznMfOJGCgwN3F04qqPxHfJa+92u1a3Vk0Efk/T/IcJx9pDgRwlHvs4+QSeE2C0ZLtW4y3IRp9/vC9Q1FJ7PNfcUGbOPe43T2euk/d4HbK+qyFDPGFAcdjbM4z7U0aPzJw8c0hP4ckHLmmaJRAW0M1U648FTX5PYYst+ZRRcc8v5ZuA5Y8Uzot+Pg7c/fYwM5lNZmKKQgbk+Ew2diRNZqTluCLX79RHsJh9Ka82KEV94iNDXMGhKtauRsDJXWDKViXN/eVe7PpJsCCNRS7h6e0mD3FAIj0siBDUhnIazveWdMSVmKIZQ1mLTb8ylKGiC3AJjFFmKE+a52PUi0ncQr4Jvmbk5SRcTWgWzkhuhRbesY2s5RqB1fP07rtWJmNSzr80bOgFVKOAzG8hiCtU8zrbFHqVqE68aebd/FJTeuNFgAByFIb+0HrMXOKNUjZDbDo3e/gYlvmcGptn+LKPb8ZvibPB0CgIcDqEUaijhHZPLcxEImT6PhIePZk7d1it3BSBXAjof2MEoYvw94qTAGA91U2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(52116002)(2906002)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uYQJ0i2kJl3saA8Q3mTKlGskfjIm0u4NYq1TV4D36sUpwBUFfxWJsym2WBfd?=
 =?us-ascii?Q?rRlFMHa6/AS6KMImyo4Q9nhWLV9fuO6w7HBKQs5HWAdnoMaY2KlGYlNNAUrA?=
 =?us-ascii?Q?iR7pYmBniQPsrUlve5CQPYUKEB4NCxRn0aFH76g49W8LEnYecuiT7KAfCRm+?=
 =?us-ascii?Q?XXh+7hCrRgIaJbbq3eGqCXocN0S0EDU6yTHX9fRcU0gSQgGLsKMZboz/FmpL?=
 =?us-ascii?Q?n2tvSBPTnve4mPRpCrw1ncoMmE24h/boUEWNx3f6tES22xkIlaPHQUHE5VH+?=
 =?us-ascii?Q?fkfw5M1+dCtws1+U2N0ItTTHFZE0cizhMUJDodvuBRjStHwWOQ1yVh7fRSj/?=
 =?us-ascii?Q?SS76hasBeyjP/ITOrl2WUQgBILzVnwQxgQCkjgGPdFF4ycfMND0PN9fVRcF9?=
 =?us-ascii?Q?LNi5to//Sw/AEaSwKnyO69HHRAIcVyKB8sDpkbmPaSB0l7dkPCjkwA0wMsGv?=
 =?us-ascii?Q?EGwg423TPgB/bURGAMzd3ys5uFLKAm2/0XUwRHAssgV+Ns+jofafdfk0iFQV?=
 =?us-ascii?Q?LiZNaxt0quv/D3e4eh9p3yGPJLZkJGm31VF9xrXmzbdJ9b6RbBSqLxbkuxuJ?=
 =?us-ascii?Q?z5CAFFNvN0RuaCwOnjRXZvVWitbaXkr22NiwcpPiLBGYKu1UXUUde6wV1hHT?=
 =?us-ascii?Q?SeEx3eT2nSpwO4FEn3U171+YS6SsC9Dnhj1KyFSd6fKXsde76iR87QK5nRcR?=
 =?us-ascii?Q?y/vsascnT3CMIS6hDybtnf0PKJn4KX+q27sQayJpBG67pKH9eLsUqMc2SibX?=
 =?us-ascii?Q?vqo6209k6DrDKg21eCrcMtwv7QooMf2CTq0ie04Ivd6lvAVz5tmQwhC82zdB?=
 =?us-ascii?Q?fhNCAnmgbI8qlcfxNQ3qqDSyYZkie/7fEdq08ffGikHWaBJ+liwPFRChgwpu?=
 =?us-ascii?Q?v8x6tT1zfhKJWtwvsCqJ/4T1qag+usQNNuTWTDy+IzjSlFx0MZume7AeXG6F?=
 =?us-ascii?Q?WlPKRXi0+8AEz+pdMXB8q9Zqw8OLH2/UHHGKPeTTYoE9GLO7quCVEX1/msZM?=
 =?us-ascii?Q?fK1QfQhPQIIYN4Vt2Nj4RdtqKRTL4+Ya2e1qHN5KwjGNqm8yGrbTFCIYnrfg?=
 =?us-ascii?Q?7gS2YHiOdiNm5eooizeb8NsNom3DbTcdaRF0qWyVENBAjHVpPsLWW18RRgvx?=
 =?us-ascii?Q?r+IbnVAbs1IqueyMNMQP14F8cSmwZNRNIFpxsi8vfLRrNOaZHaY/bqcGYXaa?=
 =?us-ascii?Q?6AvyY7qnv1639MgHaZmMHnoMX/opsiG5bVOMCels1nl0cVXGt1kMvLwoE09r?=
 =?us-ascii?Q?74GpBhQDKatXU7AY0lHr4KnV7645/kEHuzdZwCBUf+x5w3lKAlBtwuDq8Gw9?=
 =?us-ascii?Q?4vquSTPee8d0UlVWQeJ8HqH3QiJUQ6IKPcLwRcoXMqt16EMgLYPJ+gcDc/NT?=
 =?us-ascii?Q?3futHfIYY+PVZLVWPfUtlZJDJsEDG4RxNP32LEne8EDN8pQQeCyn2nVg5zvi?=
 =?us-ascii?Q?mTV+GlDLsb7pDEBmaBgv8t0/H5bDpTYgQgotSZvthBQa+MUG9q+0kwtV/5S8?=
 =?us-ascii?Q?0BBb1JkWwp1ueWdqF9tVaFa1IgpEkIRGC1fNBpHEvJv8xeDvdSBotpDEEkcI?=
 =?us-ascii?Q?OD8YfnsWx7PvwNLLekpDVpb2OEW519ZPSUm4wCbaLQHFpxxy2N9XfvMkfl6Q?=
 =?us-ascii?Q?4fUwcrmedrVqVvU8sUZ4I75zWfZIBLRqmwdxwK69dnSmcoVvRXEHszjmO45N?=
 =?us-ascii?Q?BEtAFivZ3Fud10Fc8RZPHeKFKXU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfeef1d-2925-4da4-ddea-08d9c5722dbf
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:43.5690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXD1IjenCiOIyA6mDmucmSDnIRdvtwlNxCjY9UEW7BB1xH2KBIy1NDJ/9nkmoGNLXMp2uEmlEzU1tc2BVHsr2eCeEBAyRg05pdi7dfv7fgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 67 ++++++++++++------
 tests/qemu-iotests/tests/image-fleecing.out | 76 ++++++++++++++++++++-
 2 files changed, 122 insertions(+), 21 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index a58b5a1781..2544782c28 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -49,12 +49,17 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
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
@@ -81,24 +86,39 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
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
@@ -109,16 +129,18 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
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
                {'addr': {'type': 'unix',
                          'data': {'path': nbd_sock_path}}}))
 
-    log(vm.qmp('nbd-server-add', device=tmp_node))
+    log(vm.qmp('nbd-server-add', device=export_node))
 
     log('')
     log('--- Sanity Check ---')
@@ -151,16 +173,19 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
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
 
@@ -177,17 +202,21 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
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
 
-log('=== Test filter based fleecing ===\n')
-test(True)
+log('=== Test cbw-filter based fleecing ===\n')
+test(True, False)
+
+log('=== Test fleecing-format based fleecing ===\n')
+test(True, True)
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index e96d122a8b..da0af93388 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -52,8 +52,8 @@ read -P0 0x3fe0000 64k
 --- Cleanup ---
 
 {"return": {}}
-{"data": {"device": "fleecing", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"return": {}}
+{"data": {"device": "fleecing", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"return": {}}
 
 --- Confirming writes ---
@@ -67,7 +67,7 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
-=== Test filter based fleecing ===
+=== Test cbw-filter based fleecing ===
 
 --- Setting up images ---
 
@@ -137,3 +137,75 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
+=== Test fleecing-format based fleecing ===
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
2.31.1



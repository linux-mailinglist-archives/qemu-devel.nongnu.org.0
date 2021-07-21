Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5BD3D10E4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:10:59 +0200 (CEST)
Received: from localhost ([::1]:42860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Cw6-0003GC-7w
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6CqS-0002e2-9V; Wed, 21 Jul 2021 10:05:12 -0400
Received: from mail-eopbgr80105.outbound.protection.outlook.com
 ([40.107.8.105]:17431 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6CqQ-0007Ca-8C; Wed, 21 Jul 2021 10:05:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QU1FJXyF+2tPzYlSGZESDceEUmF9UhQ0PCjnWCim1vn9jf70RV3mL2ocuMd/R3rtwy+wL1Sk6aanDazMumW1PCHGAyOHypuaOhQB86tSGUFn9mTO64YntbheEnru80C7yKoWAiaMPQXNQ36OFpOD7LS9iKePRpzWOMEG7/SxJS5D0vra/7wca+W/WD1riu93qBdkuo/A4QcBcA8DJhwwVorz6Mxiuf2pBx7rZzKA5JawiGmnjAAHfIJF2PvS2bycYOTYSFELKNxhbevm+rTKY9wMPbfAKESN9cK9cyAN5bB0zpCcCE+daKiqcXpr8gLqLCEb3Bb6q43Wg8dnPpIaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGm2uqLSxHsP3FsPqqvzoklSv0TGI8UcplfD7f9xkBg=;
 b=HJXE3AmQU1PceFXQjf6iKjIHPbidS2Knr5ELf1FOxZ7YpEh0jWDWzjEiHkaEl+/2RhiVQR/WpYMjOi39a5XjudtvEFZUeLPtiy1WQgEAFGO851AF/ibZd7T4Kfeq/c4ogdaZjtV3fWZ8aUqCQSZo+k4M6ulYDzB7tn0XvKw11R1J9dn5v5JvT5SdaTkufRo8MyVnzYvY5wNByZ7n6L7jsz+WmWSq7U7qoNkds4O6+7N3MIy9ONJPajr4Pk202P0WLamL894W39uCAnsTDqDZ7skjU5qCa6BGIWgvhVP1rQ+ISorlgCd8zj0EunJiRuHIP2VspEhcIvkWfsNW4V4dzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGm2uqLSxHsP3FsPqqvzoklSv0TGI8UcplfD7f9xkBg=;
 b=EC9m4TxgzakUJ4O3rYVxFXPyJ18FD3c1QxLp1O9AhyoUH5o4O+FCBj5/8SdY9dF8M6QckB6V7agwd6bxhA+E0smjqRbCPZAoD0UFvAtqINI5Et3FyOHK8R7QZiXkE+VsIh0qGHLlvy2zfewz9cyTrNxRsjYNv6Aj8Ow4HKfX7EQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 14:04:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 14:04:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v2 6/6] iotests/image-fleecing: test push backup with fleecing
Date: Wed, 21 Jul 2021 17:04:24 +0300
Message-Id: <20210721140424.163701-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721140424.163701-1-vsementsov@virtuozzo.com>
References: <20210721140424.163701-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 14:04:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6349621a-c8b3-46e1-65fb-08d94c507f6f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB637482AAF78588A6B9332EEBC1E39@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XQ3fVzLWT8dNngRsu79EqZ1Ve6wrixllUwpv6qJ/6Jy0hrhk6Jydn/4dkN+EkuJYXmFy03BnFRJYDFWtS+htBQo/g+eypVmLRFLLwPXoTzcZbrKf+NE/b0Fr/ozfgXg6e8cs/7Vt31NoACKBNqIc5UUFVhiWg8ITi4vqAEHQgCZ26fyc8LAfZnL667H2SRBWYLgOgD1S0pUU1+XZHx/l/9kcdpku4l/DaOQ3cmLCfcUonWrro3Gizbi+Yl+90Mjx7bDYwVJiCjHCyeDsqefYr6JO7gk/YZVEzDs6Uq17E6TSiXAYZKk87QLLM47AcRSiDQQ39U075U6lV81YKfWJ1/waKtDlp1pcWevgqIFO0axXrgNWljlymp/CX6wpeZOrCCfdBXWRsdRyGfgKqFFRWse4CPw2SipcISI4bGaKg3bnkOf43iJdZ95aZVENdPCswVQT0inOpSVxLZdp4tenA8u4fdGpawYJB4TVWN8/AWauX9BrspLxMlKBQK1z6Zr0qTp8C27DlDMItaHT9x9hFXMV3ZI/dijKnqEwj3o5w26x/17/8aciXxnuZRcx0JZbKay8dDHwdfntis9s8xMhnzNjpMDspv5E7WWylzqCTYoPyyMZDYKLCPhKRgYW6kVxtxM1sNggW7mraOHeC1iOIQ2yexco+uXuNBBj/WlRxuw0E+0hg1+Aw9DHU8ZI8MobIFK/1oSrZaW474A0/Dnuxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39840400004)(376002)(38100700002)(5660300002)(52116002)(38350700002)(2906002)(83380400001)(956004)(1076003)(6506007)(6916009)(316002)(6666004)(66946007)(66476007)(66556008)(478600001)(186003)(4326008)(36756003)(6512007)(86362001)(26005)(8936002)(8676002)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LOqedaxUBBsC3R2ZtOxwYphD4cc/Fu1wVMu/LIxgxNXs8VDySevp8BqsgW/n?=
 =?us-ascii?Q?7VlqAVQvlPO1GzzHAKIalI1n7TCCThI68WTwSL6bsck2ZudtQBr8HHzx+TK9?=
 =?us-ascii?Q?n+Pvx4TgfekMnEZ8jC2McSClM2/O88pj1XWE4LJ7ivqF+gThP4hoCT2a2aYH?=
 =?us-ascii?Q?DV9Tw0Lh4Oj+vSj54G8spvIBlVGH56DZ7j1M/JsYd9wVgVWGBvfq+SYyzvQU?=
 =?us-ascii?Q?ZaWVoOIcdIzDObFmmfhw+w4OgPD2vGrXJPR1VRa54wI6mpANnnvLHT3XQONf?=
 =?us-ascii?Q?BGXjDJhszbfMRNbxNybnS+gjctjk0unF7ORVbGfy/WbijogVtKOwN2x6KH+4?=
 =?us-ascii?Q?A7c6rMdKUfvs1DXSq9njbJolndfKlkanamVmm3C/KSHv5XZs6nkW4nBycFPV?=
 =?us-ascii?Q?9i0eKJgC5hFhDRGEVoOXIl8NwZueQslAetuo5hPmsL6yk+Bs5rpYvtxeLh2s?=
 =?us-ascii?Q?rC8zua29VxBrtt6CzGQ6MLKTK/Q+qjU0cBPbp5QOrcjgXA/1db6k9e8FqRa8?=
 =?us-ascii?Q?pem9oscC2ucFu2P20F1PJWAIElwQnZwaH71iXVd4gzBi3aiZEEW0QO6fbqGP?=
 =?us-ascii?Q?Fhv3HH2MU5qjHC/3ZeDkWFu450/FKIbstqJ+9uUQYVXSovm7j9D86N0x8tXU?=
 =?us-ascii?Q?inpd4yB0TSLDv9q2iiC5H5qft0wV6UA6esflUxyftHwsgADC4lNIvdAFvJdz?=
 =?us-ascii?Q?4j5A+KE0Y0luYzPp4xvyUu5ami6KV4+Sm11KrOsrc2BSAATVMckRy9rsHjeN?=
 =?us-ascii?Q?JASJAX2bYnprm/x7oE+RCC8U0OvnQE7ADX3cm5GgSQfY6DtTdGGv71ar6j+X?=
 =?us-ascii?Q?/hs+noI3Qx4gOfgK515WNFtNdY0tgtmls+Fcn+sH3s+Sj4HQXkt6VPwumhuy?=
 =?us-ascii?Q?PdkHWpe0XvwVz0+atkV+6t3iKylhpBgzK+Z1oCXWGWjDoBX/8/kLVpa/xhIF?=
 =?us-ascii?Q?nWf2SS6iGv1SfCbZwbXHhCf44lthRB9cqF+u/FjqEiG2c2VhVFNPZXn2RCj6?=
 =?us-ascii?Q?6W106VrrunQY7veWo4BIqCnBbR89qhc0TzPAGeFeem4U4UIFlwnbUYZ0TxI9?=
 =?us-ascii?Q?fNvI+JxsT71zkzjgG/QtMVlqn1jycvdgZXgW03qcV+nmiaq7/y5Go5srIYzs?=
 =?us-ascii?Q?lMwz91m8lf8gAi4lqQyrdLlCVFGeLadS+/WNjzHW2bD3FzHGAy43lUEKGf6I?=
 =?us-ascii?Q?snggn0Owj8pOX1a+5mcQTxy3zhD0DNcMMb/M5+FB7Fcnhrh6itcVv/VghCCK?=
 =?us-ascii?Q?UXKNxIcpZq0aSdcPh9j5ajSMy9dk93mkqI1tFV3gx6Mds9ONci+GzuqvM8sF?=
 =?us-ascii?Q?ALGsmswMjNxpxnWjeQqJbR1S?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6349621a-c8b3-46e1-65fb-08d94c507f6f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 14:04:47.0280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i32YuHWZ7UjN8RmAtZLpXSNxSMap3LPYNd9i6dz5EDP/oTN4YKKD5Ju81CvS6x16wvOW5nelnkOcjfv7yrMUhgEHtnA8Twaz0vIR1Xx4uis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.8.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Add test for push backup with fleecing:

 - start fleecing with copy-before-write filter
 - start a backup job from temporary fleecing node to actual backup
   target

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 105 +++++++++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out |  61 ++++++++++++
 2 files changed, 141 insertions(+), 25 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index f6318492c6..083cfacc6f 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -48,12 +48,20 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
+def do_test(vm, use_cbw, base_img_path, fleece_img_path, nbd_sock_path=None,
+            target_img_path=None):
+    push_backup = target_img_path is not None
+    assert (nbd_sock_path is not None) != push_backup
+    if push_backup:
+        assert use_cbw
+
     log('--- Setting up images ---')
     log('')
 
     assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
     assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
+    if push_backup:
+        assert qemu_img('create', '-f', 'qcow2', target_img_path, '64M') == 0
 
     for p in patterns:
         qemu_io('-f', iotests.imgfmt,
@@ -108,25 +116,43 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
                    target=tmp_node,
                    sync='none'))
 
-    log('')
-    log('--- Setting up NBD Export ---')
-    log('')
+    if push_backup:
+        log('')
+        log('--- Starting actual backup ---')
+        log('')
+
+        log(vm.qmp('blockdev-add', **{
+            'driver': iotests.imgfmt,
+            'node-name': 'target',
+            'file': {
+                'driver': 'file',
+                'filename': target_img_path
+            }
+        }))
+        log(vm.qmp('blockdev-backup', device=tmp_node,
+                   sync='full', target='target',
+                   immutable_source=True,
+                   job_id='push-backup', speed=1))
+    else:
+        log('')
+        log('--- Setting up NBD Export ---')
+        log('')
 
-    nbd_uri = 'nbd+unix:///%s?socket=%s' % (tmp_node, nbd_sock_path)
-    log(vm.qmp('nbd-server-start',
-               {'addr': { 'type': 'unix',
-                          'data': { 'path': nbd_sock_path } } }))
+        nbd_uri = 'nbd+unix:///%s?socket=%s' % (tmp_node, nbd_sock_path)
+        log(vm.qmp('nbd-server-start',
+                   {'addr': { 'type': 'unix',
+                              'data': { 'path': nbd_sock_path } } }))
 
-    log(vm.qmp('nbd-server-add', device=tmp_node))
+        log(vm.qmp('nbd-server-add', device=tmp_node))
 
-    log('')
-    log('--- Sanity Check ---')
-    log('')
+        log('')
+        log('--- Sanity Check ---')
+        log('')
 
-    for p in patterns + zeroes:
-        cmd = 'read -P%s %s %s' % p
-        log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        for p in patterns + zeroes:
+            cmd = 'read -P%s %s %s' % p
+            log(cmd)
+            assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
 
     log('')
     log('--- Testing COW ---')
@@ -137,6 +163,20 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
         log(cmd)
         log(vm.hmp_qemu_io(qom_path, cmd, qdev=True))
 
+    if push_backup:
+        # Check that previous operations were done during backup, not after
+        result = vm.qmp('query-block-jobs')
+        if len(result['return']) != 1:
+            log('Backup finished too fast, COW is not tested')
+
+        result = vm.qmp('block-job-set-speed', device='push-backup', speed=0)
+        assert result == {'return': {}}
+
+        log(vm.event_wait(name='BLOCK_JOB_COMPLETED',
+                          match={'data': {'device': 'push-backup'}}),
+                          filters=[iotests.filter_qmp_event])
+        log(vm.qmp('blockdev-del', node_name='target'))
+
     log('')
     log('--- Verifying Data ---')
     log('')
@@ -144,7 +184,10 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        if push_backup:
+            assert qemu_io_silent('-r', '-c', cmd, target_img_path) == 0
+        else:
+            assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
 
     log('')
     log('--- Cleanup ---')
@@ -159,7 +202,9 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
         assert e is not None
         log(e, filters=[iotests.filter_qmp_event])
 
-    log(vm.qmp('nbd-server-stop'))
+    if not push_backup:
+        log(vm.qmp('nbd-server-stop'))
+
     log(vm.qmp('blockdev-del', node_name=tmp_node))
     vm.shutdown()
 
@@ -175,18 +220,28 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('')
     log('Done')
 
-
-def test(use_cbw):
+def test(use_cbw, nbd_sock_path=None, target_img_path=None):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
-         iotests.FilePath('nbd.sock',
-                          base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
-        do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm)
+        do_test(vm, use_cbw, base_img_path, fleece_img_path, nbd_sock_path,
+                target_img_path)
+
+def test_pull(use_cbw):
+    with iotests.FilePath('nbd.sock',
+                          base_dir=iotests.sock_dir) as nbd_sock_path:
+        test(use_cbw, nbd_sock_path, None)
+
+def test_push():
+    with iotests.FilePath('target.img') as target_img_path:
+        test(True, None, target_img_path)
 
 
 log('=== Test backup(sync=none) based fleecing ===\n')
-test(False)
+test_pull(False)
 
 log('=== Test filter based fleecing ===\n')
-test(True)
+test_pull(True)
+
+log('=== Test push backup with fleecing ===\n')
+test_push()
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index e96d122a8b..4d132c4633 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -137,3 +137,64 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
+=== Test push backup with fleecing ===
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
+--- Starting actual backup ---
+
+{"return": {}}
+{"return": {}}
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
+{"data": {"device": "push-backup", "len": 67108864, "offset": 67108864, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"return": {}}
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6491847D644
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:09:42 +0100 (CET)
Received: from localhost ([::1]:37802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n063Z-0006WX-HJ
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:09:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05by-0001lT-04; Wed, 22 Dec 2021 12:41:10 -0500
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:36163 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bv-0002Zq-N9; Wed, 22 Dec 2021 12:41:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFJhPEqj9nL27xXv8cc2yiJgJefNR5tpWRLksywlaIqEMcTDVJPPe8ZwSYgTlJIwcK2QyUIV5YJzBYTNjI9H7VB/LHXRZGE6Zr+rM+fFNXTK7Kau/o1Ytm95QngtzFEG7x6noXDz2zT9pE20MmDfeBrjZyJmGJ7uraSYk/otz+XKzIafx4+ySQgGGNmMDsXQGFFrBPVm/KAS08v4nPkn6CD3d2P6v5hIdaEau6alM+ZuxXtJZ9Jav+U9xZYW5mIJKcl+tKtX7H1HDbelBaEL8MHRrapmQ6Y5YdfTfnXF5+cMfpH0aYUZLAa+6+GZDuQZq2ixlQZinzA5o7II0sc23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPwjRIVYM8sjXHMAQLSFxonXy5LKd26KIRqLHNniaMM=;
 b=iWIte64niKSm5HXqgnRT/+1You7BVTdmiJHlRPS8EJbkfM3RSGzylbj4FGFU2EzC0SDQNPVkZ4s+xEHequ5kBdkdYxx0UMcoYpyPrFrDDbdjrslRP6VFY2WbyTvRkMLOK+PatDZPOqrQrb/tpaEoTWQehExNc+Wsq1lKxK0OSEoheZOMFHXKTfSGKLHiHG2jqrZQ8xHX+/WpMemnDFHYZw/km0FF1L0mYYGKPJWdUs3YtX9QanhPpSMhS42LJPdO6Wc/hw7rEokvwBGz1N1DbQja8islMPNl4QPzf8j1sR6OoVlLV9Ao5fpKwh79WiQAw7q3c34OHtvu0a+OahSIRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPwjRIVYM8sjXHMAQLSFxonXy5LKd26KIRqLHNniaMM=;
 b=owdvmkUAGik/nvyAT+OIff4Z3mmuICLtaP36FQYIOWtlENiN2haP3r1cYQa3t3yjMSHhHN4vkrR3nXMibjLWxW1INlO2QKdnrehP3dqf+dDrcSrA5IySwGApWi4IQK0wIFMSvlztSyjPj1LzoDJNhmrkdWzJ1Kd0UzcGhZywly0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:48 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 19/19] iotests/image-fleecing: test push backup with
 fleecing
Date: Wed, 22 Dec 2021 18:40:18 +0100
Message-Id: <20211222174018.257550-20-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: bea803cc-b2f8-4ce7-3249-08d9c5723059
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB3964804D75D334C5815A1B83C17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 925fUrvJbXEVxPi4nGdnh97Qe5az+OGdnQkR1hiwtOa/n+h1rGkBIzRWPsSAIUlG8IAwwIMHt6v7xJyOw2djKY6DpunLmuh6lVEsKi/8/x4N2hcVUnaXKMx3T1gaw/1ZAYAOYFdLgtRupmhKuDJTxInW2mDMszZw5fq6R/l+dzuwBkursy90r01H7bnnqVHTZoNdj/GDtSsCbeOZMBiWGt6TEilF1C1libLCBYXA2Kgp1fGYWlN8KAevana0j9lSFPXhktCLr8xYJhUk5fnU+mpFF8W1PGQ66IpCWhe3NtLGLbKGra8jtVmjUJhqUsaRpTbyMLvlnsh3m491g3wGqQ/1BOmXAwwFXcJ48YGNLf+es6rMnZIxoB0oNqfKUwoNhm6tVvsda9/i2RnKudIGHI31rAVm+8qmWRfHL/bEbL1tRlZJ4DIA1GhH0QjCvu9th28yV8SuOUJevLyNyHGvLUFJJL3KmoKyzsWDr6iB6sfH4w77yfOeRW/OKy38ELtgOJR2QcNPzTKM+CY5x1N7qz+yGSERhymOjJMOhIfnQDaxCm2JqEUgs/Vkipf+axNZQ3EzgWfVA5P4USN2cFyhr2ERtT+GdvCxPiHn25F88TmSPx8XdzbeKcwJpFvO0ZMT7s5QzsCC8FM/+fYOpwP1sFrDjdYSGnIUd85Kttrepov/Kki9nCM2eMlBvwVW+BrWVq7X82RRZkwq8T+NtRQowA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(52116002)(2906002)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RvPrhMW3Qw/IVMYpdrjg6PlkEZ9W+Qtuzqyn1hhaGbtR7jpKVPjOruCmp1sM?=
 =?us-ascii?Q?VkWsmSZIlIz9AeRVu9fwA9lkYXmvJoGX2rANagaf6zQI5BDNbBNdna6dw9/x?=
 =?us-ascii?Q?4DhnqVLKz6CImm/Au7ykrHxeauS3R4o7cCKmGlH0wt82p3KXRxDsGDD60wUq?=
 =?us-ascii?Q?15YZc29q+D11EM4AfF5OORijEhcOtaw9w0BmgSVvmB/WtZPL7TBTZYD5CzR/?=
 =?us-ascii?Q?YOFD5E6IfyO1drbHHmDUKIsRlUpsH2hSMLoFn0pnRSWKPnFoxGV6p3LF8kgG?=
 =?us-ascii?Q?8dyTrv1OVyfggjL4PH6b092Ne7KRDhkOJeHvbV7gTbAi+yBmHzMqHNefxFAR?=
 =?us-ascii?Q?q8YLYVV18K7b+Iw1xUU0Ao6mGERNTEgnwRDjyzJctHjeGxd+LgvzzqoVZzWL?=
 =?us-ascii?Q?GP8ejYpsWCU/w+sUrxSxqi5/YTPkzzRw+WgyWuky+cQ4g6cpn7K2gdLo80bV?=
 =?us-ascii?Q?RjG+RQSsdqYfPPD8zNTPBhR/99w9vyuqGk0ujC8wcXUwzFwz0/vd7Xg/KC8g?=
 =?us-ascii?Q?kyO6VnU3uzg3Y5euFtHg8iz5CDf031cm4p7VWzJk2sV9JRXKTwcGnrZ0dR4Y?=
 =?us-ascii?Q?I1Z7QF1pONvIQrPeqLIhQwDju9LEcfmwHvRM4R0UVcV0JN7H0qNySR4m8nDT?=
 =?us-ascii?Q?HLvfv526fJO//Gq5IAebb1DVozKc8V6ubz6v99Z4xxGBgpqzgqfI1hdRORxU?=
 =?us-ascii?Q?b7I7dG5rQ5SGOvgMjIhTCQ42vh0Sb+CA1R7b1jRKdIAV6ak45c3/czAKZ/u+?=
 =?us-ascii?Q?X5g0Mqv/5ki7Hu+ZRf2YZ6pKMtQnQMlYJqqSH3+/jjCxMEx2wglf85yMaL0i?=
 =?us-ascii?Q?ir80dbDrdlS2rrYbEH6hFo3A+FA2zWfBXsRpc252e3tDWvzBwgvB+RzRHcjk?=
 =?us-ascii?Q?HkeRxb9FxhWNOw26EmG87uKEvtKpi2h0ha2YLBadB4MG6jtQPdZeJ/giXvtp?=
 =?us-ascii?Q?D5ZGPj2CiutPe2N0O8YkDy8HbfDCIvryHAaklAwepp3iew+kkiGCtx+IRFyo?=
 =?us-ascii?Q?Cuj8BKFBab9Oab5o0L5ztZDSUOaJ6rIOkL8v7eJzCnsuuySfPVzs3kAW5mWU?=
 =?us-ascii?Q?36ctuKmdYXu/aHNH0VBwBh9mCe3Ac42U723ue+RikfRe7scAxgTqJeGqBwBF?=
 =?us-ascii?Q?94cGnkx1Qk/WbRsGLTBK+vXSiYYZV4QNAqFm5AawfmfFHCCUYAN6kNP9aCL5?=
 =?us-ascii?Q?YtpbNJmFiJ/upJXWdNB84E97iWpKc3bH4Hj7gXvw0luz+PqRU1z6ty0hFIpc?=
 =?us-ascii?Q?Nj0/gsA+1THDrv8KadL+uYqCVOKvX7cpsMLFX/2qSS/UJA07HUUZIsH9QcmC?=
 =?us-ascii?Q?Zabycjw1T1wsXnBZHNFFG+3HTK17fHW/8Ysy+DFz+PuMGaA2gKpJq0Cj/zvs?=
 =?us-ascii?Q?xLhFoBvIQnb2+RJtVNAYofXWu2fbA/oKIV6qhsMQ7dfKTb/vstjLx0EuEwWM?=
 =?us-ascii?Q?44S7v8CGk6dFTbu1lUu8v2krGQwXDC+6XHecSWHmBUgtoKQrUlUU2w0VcL1r?=
 =?us-ascii?Q?gotOUH5PBFpvfZcbOod2e8FnYK6pubyjWciRgGjhtDUQLEEFRn3TYH1VnxEE?=
 =?us-ascii?Q?qUIabBETBEkIvTXt8Jfxa1vpDAhqIRcH1GwfC8RrU1963uBPmDxokNpEdGtL?=
 =?us-ascii?Q?WSmrW2a7bikxa9xxA00YCjM/521iYgSMHvao9SoOnzPefPpMoyahPo4auMug?=
 =?us-ascii?Q?nX47KA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea803cc-b2f8-4ce7-3249-08d9c5723059
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:48.0699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxXyq3+5Pz4OR9yY5b6NIJEchmAGIAvJ3JY+NP/vezAFU617fMRtVmf4zanGypWIWbjPwQ7vMB07ucht0e7O0oHQ2QMYQ114A68Icrxb5Nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.6.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Add test for push backup with fleecing:

 - start fleecing with copy-before-write filter
 - start a backup job from temporary fleecing node to actual backup
   target

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 121 ++++++++++++++------
 tests/qemu-iotests/tests/image-fleecing.out |  63 ++++++++++
 2 files changed, 152 insertions(+), 32 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 279047b19c..c72cfc70f2 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -49,9 +49,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-def do_test(use_cbw, use_fleecing_filter, base_img_path,
-            fleece_img_path, nbd_sock_path, vm,
+def do_test(vm, use_cbw, use_fleecing_filter, base_img_path,
+            fleece_img_path, nbd_sock_path=None,
+            target_img_path=None,
             bitmap=False):
+    push_backup = target_img_path is not None
+    assert (nbd_sock_path is not None) != push_backup
+    if push_backup:
+        assert use_cbw
+
     log('--- Setting up images ---')
     log('')
 
@@ -65,6 +71,9 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
     else:
         assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
 
+    if push_backup:
+        assert qemu_img('create', '-f', 'qcow2', target_img_path, '64M') == 0
+
     for p in patterns:
         qemu_io('-f', iotests.imgfmt,
                 '-c', 'write -P%s %s %s' % p, base_img_path)
@@ -140,27 +149,45 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
 
     export_node = 'fl-fleecing' if use_fleecing_filter else tmp_node
 
-    log('')
-    log('--- Setting up NBD Export ---')
-    log('')
+    if push_backup:
+        log('')
+        log('--- Starting actual backup ---')
+        log('')
 
-    nbd_uri = 'nbd+unix:///%s?socket=%s' % (export_node, nbd_sock_path)
-    log(vm.qmp('nbd-server-start',
-               {'addr': {'type': 'unix',
-                         'data': {'path': nbd_sock_path}}}))
+        log(vm.qmp('blockdev-add', **{
+            'driver': iotests.imgfmt,
+            'node-name': 'target',
+            'file': {
+                'driver': 'file',
+                'filename': target_img_path
+            }
+        }))
+        log(vm.qmp('blockdev-backup', device=export_node,
+                   sync='full', target='target',
+                   immutable_source=True,
+                   job_id='push-backup', speed=1))
+    else:
+        log('')
+        log('--- Setting up NBD Export ---')
+        log('')
 
-    log(vm.qmp('nbd-server-add', device=export_node))
+        nbd_uri = 'nbd+unix:///%s?socket=%s' % (export_node, nbd_sock_path)
+        log(vm.qmp('nbd-server-start',
+                   {'addr': { 'type': 'unix',
+                              'data': { 'path': nbd_sock_path } } }))
 
-    log('')
-    log('--- Sanity Check ---')
-    log('')
+        log(vm.qmp('nbd-server-add', device=export_node))
 
-    for p in patterns + zeroes:
-        cmd = 'read -P%s %s %s' % p
-        log(cmd)
-        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
-        if ret != 0:
-            print(out)
+        log('')
+        log('--- Sanity Check ---')
+        log('')
+
+        for p in patterns + zeroes:
+            cmd = 'read -P%s %s %s' % p
+            log(cmd)
+            out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
+            if ret != 0:
+                print(out)
 
     log('')
     log('--- Testing COW ---')
@@ -171,6 +198,20 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
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
@@ -178,15 +219,19 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
-        if ret != 0:
-            print(out)
+        if push_backup:
+            assert qemu_io_silent('-r', '-c', cmd, target_img_path) == 0
+        else:
+            out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
+            if ret != 0:
+                print(out)
 
     log('')
     log('--- Cleanup ---')
     log('')
 
-    log(vm.qmp('nbd-server-stop'))
+    if not push_backup:
+        log(vm.qmp('nbd-server-stop'))
 
     if use_cbw:
         log(vm.qmp('qom-set', path=qom_path, property='drive', value=src_node))
@@ -215,24 +260,36 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
     log('Done')
 
 
-def test(use_cbw, use_fleecing_filter, bitmap=False):
+def test(use_cbw, use_fleecing_filter,
+         nbd_sock_path=None, target_img_path=None, bitmap=False):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
-         iotests.FilePath('nbd.sock',
-                          base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
-        do_test(use_cbw, use_fleecing_filter, base_img_path,
-                fleece_img_path, nbd_sock_path, vm, bitmap=bitmap)
+        do_test(vm, use_cbw, use_fleecing_filter, base_img_path,
+                fleece_img_path, nbd_sock_path, target_img_path,
+                bitmap=bitmap)
+
+def test_pull(use_cbw, use_fleecing_filter, bitmap=False):
+    with iotests.FilePath('nbd.sock',
+                          base_dir=iotests.sock_dir) as nbd_sock_path:
+        test(use_cbw, use_fleecing_filter, nbd_sock_path, None, bitmap=bitmap)
+
+def test_push():
+    with iotests.FilePath('target.img') as target_img_path:
+        test(True, True, None, target_img_path)
 
 
 log('=== Test backup(sync=none) based fleecing ===\n')
-test(False, False)
+test_pull(False, False)
 
 log('=== Test cbw-filter based fleecing ===\n')
-test(True, False)
+test_pull(True, False)
 
 log('=== Test fleecing-format based fleecing ===\n')
-test(True, True)
+test_pull(True, True)
 
 log('=== Test fleecing-format based fleecing with bitmap ===\n')
-test(True, True, bitmap=True)
+test_pull(True, True, bitmap=True)
+
+log('=== Test push backup with fleecing ===\n')
+test_push()
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index 62e1c1fe42..acfc89ff0e 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -293,3 +293,66 @@ read -P0xdc 32M 32k
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



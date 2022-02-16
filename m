Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5041D4B9228
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:16:56 +0100 (CET)
Received: from localhost ([::1]:33518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQjN-0006lu-QX
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:16:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGi-00049S-IL; Wed, 16 Feb 2022 14:47:16 -0500
Received: from [2a01:111:f400:fe0c::710] (port=6627
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGf-0006Nc-UV; Wed, 16 Feb 2022 14:47:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoA99NSt5dj9I8XgSN5og+uD87bcXKa7vcu9kb1wElnwPbOKs7vVf5o9LrlvCo/8GKBhjUH6zNZv6ISJMZ9qU9a2rYPv03J/MQpONsMyLoQTehiyR++kG7Q13o0rDYzlTOhDzH6206qK+jreoogck7uKdwVRzNsOFR5mptRW5wI81qmFVRnLbGVRMVK74ka7hm5HCXxOvPjw41J7N6X5lW4eGpGsSwk/QxLr8ntS2i623xLzJuZkr7qW9AT+5SP+L/ofgPOqJS7VFvlpy+hDBWVPws/hIh33rRovo8pIeGgCXzNsKFrKNq+kyZo+2rY6WuHJbCU0kHEQ0HrKmZTcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FoFYGMddrGc+CMUYmTun1Gd52uC9HsURxCzDf+uuow=;
 b=A6+fEzmpyTGHm0piCNJ9PKZTRTLHMgrxdz+QEpbRffMXPgpty9JQMS2S7Rz2DlLBtk2HYHivHo54vILZ25gLIlrU7g2r8FIcCxXNOpu1Ez3YbF6Pbs+RdzCZ5gkUiaMOA+bbr35v2lGf6+MDnN9QpSMQxyaQDtfqxwpK2tL9CUNLc9qocFA5nm83V2N2sip4VekF9bnMTlULH66EMlOMyFWXUw4peob9A8NYVWgB6/Gmttvz8XJTS/X6t6IKZrfnpWWt4H8U7juOgDVrGVlWlHajXLKqvciZLTliFP22Q2L2CnkubcAqNr+8dxjQoeFwSf0mvF+2yyrz/QBuAeGW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FoFYGMddrGc+CMUYmTun1Gd52uC9HsURxCzDf+uuow=;
 b=CjStleWYujDQQzap5MHaFZjWETcjZR6pZdFO++T/BqNigLcByy6EgHJTi+5bSUelakYPCEe1s9oeW3QCzUdzO3lJnHWa+WK+7z4ir+R+LpOkNcxSljjtv4aEJTTSv4Du9fXnK+Y870qNfMoJ08LsRWxU3V6OnHFnOlLsZilB1Fg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AS8PR08MB6856.eurprd08.prod.outlook.com (2603:10a6:20b:351::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 19:46:44 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 18/18] iotests/image-fleecing: test push backup with
 fleecing
Date: Wed, 16 Feb 2022 20:46:17 +0100
Message-Id: <20220216194617.126484-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e006c310-83cc-484a-34c7-08d9f1850f72
X-MS-TrafficTypeDiagnostic: AS8PR08MB6856:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB6856C44B597DE92FB807E39EC1359@AS8PR08MB6856.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c9v8rFSXIaHI6lBX31ikKC5CLiMe3r+6+S9so6PULHgEUJsdQOeJiMEmXi1o7UsFQlfmGYPNg5joY2XK2cThzKKsfktBp0TUL7/NppEoU17DygMqsRNMWev0RUdMcQw64o/rkPnpNEZJNNC8D57ReZK76quSYCzHOPUUbmtRkGdj5d3jc6OKdOlJkEOz7xyCh48DTP7avSVn19BBEJ1JCUvwvnsSZdWi+YgCOkFA59u6J5xnpAoNXEfnP77zybT495XJ2J4ot5yunvZ11HnorUmxmHWeLtlWHKiUCwJwH4+Pl94FcVCCGQQxohfaM8VCE+hJ0/gps9nMl3kfkr0YJoiF6Oo9n80e02Qrarc/ade46g4gXm2Gd0TGXykgO9SxXnFJmGXBGLS7m+djUX+eaNoBtohjINYYSt2KIzmGqSwGeIvy7ylQoJ56gAprLJZu5CDyJLINl/IV2qAlGsRjI/J90Nbx36UvzfZvIiNkMUIBpgrs+LHXuqUKwC4PsKny1mqcrxR8X10Tui8Qb0t6Z/kX95HXJ+zo9Suc0aizUaOUGdUsV+QV1fZarynTBQm7G/FYAviltiPRqFXD7oLE+TFnL7/s09SkZZCgetqbgf3q2PWL3z3mLXuvrrpdxNa565kTzmNlwERz9u6JKc4PPq36GMjqm4yg5OqJ3l+6CCZJns0nGLT+sbYedbhMl0AdgqYP68YAhzFv3TGooDxUSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6916009)(316002)(4326008)(66476007)(66946007)(8676002)(66556008)(38350700002)(38100700002)(8936002)(86362001)(6486002)(5660300002)(7416002)(508600001)(6512007)(2616005)(186003)(6506007)(83380400001)(1076003)(26005)(52116002)(107886003)(6666004)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xhc6GBa7BUL4KywZ8V4+pg0ECPwSIif018de4BA5p6Du4temdWv8QZb85IAo?=
 =?us-ascii?Q?b9fTLgG1IMUXlU3l80cIoPAf68IYkDoFg+5ra+VTgyYc0qOwjiBdFpcNd9aW?=
 =?us-ascii?Q?YHzuamwZbaunvFsWdUd1aAvG51CT8lIPdDghIGBeSP9dLjxhY4mqxsXe41fo?=
 =?us-ascii?Q?IMwiDyckNuqxTXnBCv+NBbtU9HKQfdVepjurtMGhYqOe9VdlaanqV7+Qw9As?=
 =?us-ascii?Q?9tpcr1zfA60RZG2lhJHnn8SMuMbOMJT/v5Z1P3OjNjytz5K9FAfP5kAUXlm7?=
 =?us-ascii?Q?hKDONq7LXl0tYGHFdNGE5o6AX8YiLSByjCrzjjvzlFcGJQH7hwx9PQZBSHNd?=
 =?us-ascii?Q?k5Wgoqdo5ECFUfh+YCk4ZSFQk6wUUCq26S0415J0XhPuuofe7Co/aw0ntjSH?=
 =?us-ascii?Q?mbi8Ktf5+4Fa3iOiVqxQQCY6hOcL/V9DAaf9RQ3Ngb4WLDmusMXQes3FnvmH?=
 =?us-ascii?Q?o6caVTnx8FEHnr8svQEpNQHWvy0J6s5Tlb8iV/LeGnOfjo452d3ty4y9s/QM?=
 =?us-ascii?Q?7zlyyP2FPXBC0xQvmf8IsUYHXHFPhs1gP23mU3Kjf9htrDq7GXb643i8PCr5?=
 =?us-ascii?Q?X4MRfR71E4S2NqX9y0kDM/M8BRoSzVkGWIjEFCLlmePPoK6AmBuSI4X/HmDf?=
 =?us-ascii?Q?XEOaxuoO+lJoNyGoIfQrcLmRCz4MSPIuMIvmJvjqEcd4+dJ4pfWNrhuUK67E?=
 =?us-ascii?Q?Z9GAfy784IRc7qlLlhF4sKAPWgssrlNwLpzGtZbtiI6yGWFR0pPdMrqhGc5Q?=
 =?us-ascii?Q?6BoEM0Mox+Nk+Nd5xHuDXs48KkSA7213epsQ34JQrENHU7j+kH+zLyGoTZWY?=
 =?us-ascii?Q?FZe4DY7B+0yhYxK/uaqZPcQA/ut1lN+JZNFUCKWK8A+s+UW86JrqdqFxlaXy?=
 =?us-ascii?Q?r5AW9wErJaA25qDgMWPgARqYQj/nvxrHhicak7LtwK+J+HWcPV/uiMtF51kH?=
 =?us-ascii?Q?Pvgm/p0K34t3kZpG9BuXMNW6DRtD+HCnDezw/k3zMIFwpSDP+mK8vVDECMli?=
 =?us-ascii?Q?e+iGlLukfGSxcxahltcyNcwzrgKnAGkErX02gOrXFslSUc1wtD+uUEz3Xn4A?=
 =?us-ascii?Q?CCr680zFNpS2f+LW4+s3G7gF522QGpfKkC7goMuKaQSImsdYoz15ffSiIatP?=
 =?us-ascii?Q?EaYPAdt/Bb9IcRH8diIF9KP7x5yyj7Nj/oRjf7RcKfqMATByni+WxuXIoO1g?=
 =?us-ascii?Q?bGflkY7HkknJfWYPrjPU7tw7KhrbiXI6H3ZBLtVV67EYD/LwaHWsbpanM6d4?=
 =?us-ascii?Q?wYNGEDq5RnKy0Fw26EtbvWHoPLhXQWN/YKyjVKmySLtldRarkW2xkV9N0aos?=
 =?us-ascii?Q?Qmq6tAfpNv6nulDs99285WDCXcQA4tS6a2DxOs7baodpNNvYlaR5rIOiz7dF?=
 =?us-ascii?Q?FtkSVILAYRRK1tv0C0nOFudPBTHHLpcGezq/BdUbbMeyMc7UOxNl5pYl3qDm?=
 =?us-ascii?Q?6UBF0tFipZQrYUGEE5ZeYIi/xrTGXrevFKBU99aPwbbU/2Ltk55huzbe1Duk?=
 =?us-ascii?Q?luA8DNZl6DrQHhI/09g5OQzKBwB9qhpgUF1kfkRJFq1+onjcDQ5CGdE8xW0w?=
 =?us-ascii?Q?DGdOh52O+mQZjD4wQwYY+UKyrvmn+5EtDbZG4Xfv/wl9t3USFaCqLDnu9HnO?=
 =?us-ascii?Q?791ITYzLXsEM71tb57oz1HzA75/JQ9OiSvY+TdYY3J8uuYqAiFh9Rpi+L+He?=
 =?us-ascii?Q?YaCvZg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e006c310-83cc-484a-34c7-08d9f1850f72
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:44.2816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtV99nihyd2q1x8dASmvhZo74QfF1Ak4HNYQ2jOJ/6cnU+h0fdJrAeCWiwS3xb1xC2iUstBAfh35TnSlgBAUZsDjdX0kGvKoit0dnfR/UYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6856
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::710
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::710;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 121 ++++++++++++++------
 tests/qemu-iotests/tests/image-fleecing.out |  63 ++++++++++
 2 files changed, 152 insertions(+), 32 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 33995612be..903cd50be9 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -49,9 +49,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
-            fleece_img_path, nbd_sock_path, vm,
+def do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
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
 
@@ -65,6 +71,9 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     else:
         assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
 
+    if push_backup:
+        assert qemu_img('create', '-f', 'qcow2', target_img_path, '64M') == 0
+
     for p in patterns:
         qemu_io('-f', iotests.imgfmt,
                 '-c', 'write -P%s %s %s' % p, base_img_path)
@@ -139,27 +148,45 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
 
     export_node = 'fl-access' if use_snapshot_access_filter else tmp_node
 
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
@@ -170,6 +197,20 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
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
@@ -177,15 +218,19 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
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
         if use_snapshot_access_filter:
@@ -214,24 +259,36 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     log('Done')
 
 
-def test(use_cbw, use_snapshot_access_filter, bitmap=False):
+def test(use_cbw, use_snapshot_access_filter,
+         nbd_sock_path=None, target_img_path=None, bitmap=False):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
-         iotests.FilePath('nbd.sock',
-                          base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
-        do_test(use_cbw, use_snapshot_access_filter, base_img_path,
-                fleece_img_path, nbd_sock_path, vm, bitmap=bitmap)
+        do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
+                fleece_img_path, nbd_sock_path, target_img_path,
+                bitmap=bitmap)
+
+def test_pull(use_cbw, use_snapshot_access_filter, bitmap=False):
+    with iotests.FilePath('nbd.sock',
+                          base_dir=iotests.sock_dir) as nbd_sock_path:
+        test(use_cbw, use_snapshot_access_filter, nbd_sock_path, None, bitmap=bitmap)
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



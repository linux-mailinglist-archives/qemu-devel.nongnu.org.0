Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071133F9EE9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:36:37 +0200 (CEST)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgiN-0007uS-2a
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRQ-0001Nn-Ox; Fri, 27 Aug 2021 14:19:00 -0400
Received: from mail-eopbgr20112.outbound.protection.outlook.com
 ([40.107.2.112]:14422 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRN-0006cC-Gs; Fri, 27 Aug 2021 14:19:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVX6dQxRD8yS6AUxLm16Pl6Myyk1H8M+A7WhqB5sHCmpIRUPMxxDvIAikl5RsTPQR9jxfeTaU6E1FnTKULZHnKpkGOwtqoxjeY1ePw3YbYeP+483Vbo2/xzUfW+eMG8zOTUEpIxlWFWxwpBGLwdPi9w+CpnBnyHj8CJABgYRqD3UMCSg9b6+/ubMj+NqKW03d6ZlrtmhokbDIgMo81WuYkISphHLhVHHRWgBAekIylnAigz91H/cXxUHRAlWquZxrMsW2MSnmI/hB6j9/UAIrxO9hX1E3uEc87FOTumiTYNkcHOKEr+HRzDbzxhJx+qBjup5k7u+Zxl9kQ+iDiERBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIAV9rPRuG54n1EJskJ1OsHwMYQA+RAvEpN5U56jkic=;
 b=cmSknsQBzn5Sm+Aizl07O+6FBGHRsS3CmodnOSsiG7oI7s3Huyr6ZIpEDI6I84lR8O7pSXkaAPKlWNkJjDmw+EaqJ35DFyZYPAunDsvT7fEhHTIIMujfN4AyJQ5t06ri3sSrSY2vawiyp4CjrjxEkitIj/t8mxkIkeZVvSo5HFmAo9yNKWySSonCncaZVYYFXuUv4nAqVcZGBzUon3LWTLA583pXUmaSRq0QO+dmPt/n1A7dR+WXzje258IhJMWOaT59YcitE2Yhb6qWB4dU7zjbxbV0FkWc63Y01rK2L5iQAcVf7s6Mmtb8G3fSmQ5J6OOC0h2+sRF1+xeJDZBQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIAV9rPRuG54n1EJskJ1OsHwMYQA+RAvEpN5U56jkic=;
 b=IWSa8m9NO0VRNw+aPQ0evSvi9J0phe5JpJ/d7u+bGddGHp1tCLzUJAaiCIy9lEWQM6Wf28IC6VLKfVshG3Dm9X2aav+PSKwLk2nSgul/OPc6Hx84uRCBNw+SGmFtoSCy7PRzV/xZMSk0Nx5+Of1YOgT9ETA2DvBSi2VX2puiFfc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 19/19] iotests/image-fleecing: test push backup with
 fleecing
Date: Fri, 27 Aug 2021 21:18:08 +0300
Message-Id: <20210827181808.311670-20-vsementsov@virtuozzo.com>
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
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f8b6643-ff59-4b6d-9966-08d969871ccb
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3765F07F971CD8544D2F7A49C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WfMiNZ9lVuO5r0U08TrMQGEHl2gpQJNW2VEGkV5zanMBkHBAF8Y+fbgobnVCEmnGFOIzs9aZMEcm2L4b0t6u7TrOaQsushAjBObEJGt7Rk8MsUSnVCW9PJLW4PbUPmjj7Ao8dHdGH9HtDHNKi92yK4cJqGYmxvR5pY5f8XGIv0tTLNNLTfiTN9JVwXLZAYRk3bGRsWMYrwBMUkZx34VOkHrzfA5zzSc9kCpgP1ewk7zMGv6PJQD+xLPu+7mQ25Ux8/JzLVwYSzp8WIAqkPKHIwdKicR04eSOHpeeW3MSTUw1q/1+2JgQMFrpWmfiG1K74DMcG3jh8FMi1gDgQOtoSKorBF9ehVD2c/FQfwHhOU+6rsVwhbHuE0mjIxHgECXXTyubUSZazrw81r/BfgcztZd5kiBlg9qzk0oogmlLpX7Jp6aW+xvEe3+q6SBIA8b71zOqgguNqKOLobQDk1Zd0p9LKGD4ahTfLy7TdHpUFUgGzXTksYstge1Dpoi6nnJwIybKMZd5+3PgdoaulHdL6SSAQcKswmcJuKM5cVivrfrgXChs2sLNxzGr537WXMODKVBQzsMcRqs7UUlUpaWnn4ACqWJ0OuuYczSoY/EhuHL57OqCERXS7v+DxAmIG5vN9kXXGCvmj+wwfewvZ9OQ2Zq/I3cAlRFNJVXR0nLnpX9r/UEUB6uWGBbRGoWSvF5zDKPpzGagoC02VkUECTG3sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gQcQRLO4Mte77q14PH0WgotGUAdep9s2gQaoGKL2krGZ7DythDzxT1PaqmcE?=
 =?us-ascii?Q?eVYF81LXGaQdDgc67q4sVbf1aymDuZMDijYksTrX6bOKKxWe2YUCVpxV9jPd?=
 =?us-ascii?Q?Uvo2xH0LDVuY4EpUCNcREJYYJwORBJPUCQAUF/TzsVBJAEF9qbof6js9KM5e?=
 =?us-ascii?Q?joCPfe9mK95sNc19romuAU93Wxiozq7oF7ChWCriYtyFJ2fBn0oWU0kFUGmj?=
 =?us-ascii?Q?1MG0wOGkX4bDYul+NCcEm2I0M6SzV2EKYR+XGkxU4jsK0rXEn/SEensnqfy9?=
 =?us-ascii?Q?ar2FHPeu17LG0fbCrFPkdVIJIR6Fb7noYJEXebs6o4ypm4m2JwX2huEEK/Bo?=
 =?us-ascii?Q?nrYVphNf+Qok58BVOsePzHFcflVHoEKM7H/h4CF0TOMUncR3Gw+nHO81wJYr?=
 =?us-ascii?Q?nU0tiGQInhPkWFTJelSWMtB++j17m8ooxYlAey49HBCL1aX9QBgifOZKJS16?=
 =?us-ascii?Q?4GmV8Xe7Afp0J5I6YFSprosV827TlNVf1tM6VG/zQ+1WfXIh5ax8XVdDknzr?=
 =?us-ascii?Q?XZ9PJTNqZHGd8qQxWIMpK6616evAmMPrLkW+sfz4VCRNvFnHRWeQUaGBWwQb?=
 =?us-ascii?Q?Ykg+zhZi0tmaguPZtdUbliqQTvZbkJQeuU7vudXP+/aCwXgzfWedBuM+b2SL?=
 =?us-ascii?Q?9VxGiuAq7h6so62Wrg+E208uZk4CEGjE3B9ZePGd4OBiHdNE1ZrduUK0YfAz?=
 =?us-ascii?Q?7Y3hnI2Gdj70yI+QqlqeUwNZSmLXJNIVbtan8d3lL2wDyCRUS8R43hbtXS36?=
 =?us-ascii?Q?Jgn67VM0pXlWPm+OeeFC8KofJRI2qeAC9eoaeP0zV8a5XqO66YiEKew23SC6?=
 =?us-ascii?Q?1VAgbBkyH0uS/EdXHY1syrI0g9SxU5wvkup65w+xNL7XM+Hvq0lhz/lJ6v/+?=
 =?us-ascii?Q?eItqH0PnNM8oWoe7fl+BP3Yy5EfpyJ1tGDedAzb4sFxbBIPbiIQyCM2pyhIi?=
 =?us-ascii?Q?tPGhBjB0oMdjuWcfyqE+QcDLV0zusmpoQ5sjR+V/RougwBvMP8F/pj2qY9kn?=
 =?us-ascii?Q?vvZFnc+UQzPccw7EuakCOV8+kgwwWdER5ApVcpPDqCfrigbuvNNqnjstmw6H?=
 =?us-ascii?Q?U5OoklZJMzI8bB339lix6vDMV+YobhTgybqPKIjpflL9rOS0iVq0+cifUJUK?=
 =?us-ascii?Q?ZuP5TMetDYjSuL878WGkUlaG6xL7UaU1FdbbEZWJN1xl05KXM6eBuNHandXZ?=
 =?us-ascii?Q?oZSfV0X2/yDOSB0/5wyqBPDHaY2348L3E8hYL7Nb3PpdWxGL3Iz2ffuXIpd9?=
 =?us-ascii?Q?S416RAK0e/JxwZTR7mHZqNGAg3VilbgXNlIbev42FORulvn6yPu2NoS7gnkX?=
 =?us-ascii?Q?Mh4N2FaVog2s5WQpaBmSHt8j?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8b6643-ff59-4b6d-9966-08d969871ccb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:47.5616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmaFGsuNJX+7rwgQl865M/VTybfpLXIfGFliXHaJ2tkzkT6Ytl6DmefpwVVhLzLSYqtRCYllbBiXed3aG1+Jv6TVyCOBy/cAZSsMP3cQt2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.2.112;
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
index ab95e4960e..ed57358e5d 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -48,9 +48,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
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
 
@@ -64,6 +70,9 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
     else:
         assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
 
+    if push_backup:
+        assert qemu_img('create', '-f', 'qcow2', target_img_path, '64M') == 0
+
     for p in patterns:
         qemu_io('-f', iotests.imgfmt,
                 '-c', 'write -P%s %s %s' % p, base_img_path)
@@ -139,27 +148,45 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
 
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
-               {'addr': { 'type': 'unix',
-                          'data': { 'path': nbd_sock_path } } }))
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
@@ -170,6 +197,20 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
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
@@ -177,15 +218,19 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
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
@@ -214,24 +259,36 @@ def do_test(use_cbw, use_fleecing_filter, base_img_path,
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
2.29.2



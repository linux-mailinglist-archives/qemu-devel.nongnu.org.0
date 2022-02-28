Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687694C6B32
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:47:27 +0100 (CET)
Received: from localhost ([::1]:42540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeUw-0000vS-Ed
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:47:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeO0-0002se-Gh; Mon, 28 Feb 2022 06:40:16 -0500
Received: from [2a01:111:f400:fe02::721] (port=57446
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNx-0002MY-Bh; Mon, 28 Feb 2022 06:40:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfRvk7Ha9iKVyuhRhB3e94CQjHa66K8e0W+hUHvk6FTHxbP/CJ2voLqfHNMYfqEaFQo09hqWNEc+6cinCfdIV3GVusfPyhoOLzP5vsxJ+0eG0d6xI7zowCH6gY/HgZn2UURosBl4PtGwc7MXJk7K9G5+ByCzu78oX0wp2jS5Jp9Eo3QkecryFI9rJ3kPIVky75siNBvkhY8Va5eT+vN19enq5DsfCPtmEXCtz2xilVyYCmE17D70Ik3cVwYTLGoY01aqx8wCp2tdRwO7QrDj+iwD+eKm2rQXnuVgRYbXT81vQeHTuH/URxqxSxxzHXdKfEiQvKe+a7F/QystC92RoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwkEyUTnxCGv8lpRC6ypWSR3R7U4rDCMxjF0letaqpM=;
 b=j6jLitVz7mDD9BbPoxoZAEbKBKk0r7uPWKAXBeGHLIIJQQBOre11az/yUAJ9nrgqKv4MKEOANKKsU5oQ0TDw8YUJZ/HqLFDng6Vy/w6GeT3KPIY3Sd+ogo2YDu3syZ+uR6d2AbAhNwydiIlrP878/bPTA3hvqgyhVfNys9Sr+PpXTROcYj1bU/qXkbXU7p5KxMSTpLKJck3KRwGz+CSJ7Osl37WjXkda5ChGJqVd+y/nRnoSKgc6ZwRMUWrg+3k5LAWkIxAcY7wf/6nJcioOLpvb5x+z7FWfVEyxwnKmZDLpTPanta1kx7Qiyj5UkbGEH0dm6fxUHRUjLcT0mIww6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwkEyUTnxCGv8lpRC6ypWSR3R7U4rDCMxjF0letaqpM=;
 b=QloEId1XcBvetkly6TPFvpraozsyr+TzkWZqab3F3D5JDgAHT7fqD9LeWOkGE9Ox/qDPLu/2Q2sk7uHlzMQkLJ73Tr9BTvIUHgBYeZXsvU4fYlgTDRFwrTXjXFGo117Jboyoc4fDu46NYoze1bEzgOe9z3o/aBBZj/8DdzsjnBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:59 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 16/16] iotests/image-fleecing: test push backup with
 fleecing
Date: Mon, 28 Feb 2022 12:39:27 +0100
Message-Id: <20220228113927.1852146-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ce7eb34-82e7-4cb7-6036-08d9faaf0cf9
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB22720130259B618E18437833C1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EfFotAeQhBr26bjbAGw7qT6ie9NRT9aNufol/aFK6l6t/ioIJCMuytQoLm2ckT4c2H9yQCXvq+f9GQgc/EGMpMz7vXDJ7acvOcDSqAGj6VxqYfIUUEO8YxowSOeNFRQWBTw/EhFX35nsRKdLjykRX4cUdHXHN4oTJ52eHJ1D7piZG8oG8eqjhAASWcut5s5Yy/NCuiMtdkWdbcF/G7T8uWDGew5Zs3mZuOrwtUYIIzw6VVGnkpF45INIJnUo1uCGDE+Ol9J01rkULM0oQH7V/FyDfDNxNxNQXY5VtgElOm0fkkZQU5SM42K0xk/xa/xfpGGRb1PxSyoqATYTDZ6Fhgi2nr7FPya3jrzAQZane+yA4wHUW1UwzH3Nj11i0GxoiMdSkOTn1kFXYiELXqJDDVR+Cx42onMxxUVyA0X3qo4AIeqjkGgzVMUrxTrOKR/CDOAxXR0RMVjHvEs676z+YKeXx7u7/13zG4Ircw9P5HE51fsajv2k8b7wYM9jQnq+QOA5U0uGQ19C8rp3TpDMgy9SoHUNs3tsjaIbQvW3SDiSzuMfqekYt0oKiIYwT0LcwAANCY4sOVTvG+9+m61aKTZD8oJmsRTKVuERuLgOKzgIB4/zZwJhhz2MRh5Fxy9bIdLUTk1cyFtQqs0eeLku+Eqqb64/LFVxZnYXQpBDf8I5nFBnX28pTJOqsNUKKl1MmrRLL0SxQxO+W4neuwDCvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(83380400001)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qx0ja2kRRIRSJhTmsbAaxEjJKRuAABlAb5eLOsyCB8ICgMpzQe8nV/vKbNBG?=
 =?us-ascii?Q?wCj/vuiUo+0j1KvmQhe+IAAtP/jPyIhkdEbEVaeowXYOKnWcrM4dG6bPWpGE?=
 =?us-ascii?Q?bUIYHYxlPifjGMGk79T/gbLXF7o2zTe1CGkLn6TVRw6OYm9I5XADPJAQE3IW?=
 =?us-ascii?Q?WElotbPgv8h4ByXMh2S4dI5oHa4e709fr5bWSyVy3GdMGO2DiJSxf9A/n9Kc?=
 =?us-ascii?Q?ExwQJmxqZwvvK8hRCnEuyI6U8yI9SU/9yvcqnXSzO70Of6ShwtNUpMQ5i+i8?=
 =?us-ascii?Q?cC5Pzj2rOrYChigm9gqJuZAu6tbhY+IbAeXWyUgPO5AKGqrwx04ZkFuHILA/?=
 =?us-ascii?Q?KuDH2p8zXemAnijFpLatT2ddKBUiwqqYNMp+Cuz5aV2jRRtEFqconEGnkrnU?=
 =?us-ascii?Q?lXWXWB8dIHRV4JumYITpQr7efZNhbOaISC1UqvNK2UFgsIZdt0NjDNi2HGyC?=
 =?us-ascii?Q?8NIP8o3JvKCkHZSUoRMqobw3K/ivlFFN30PQgHOJqU4idrzxia4noRiUjMaj?=
 =?us-ascii?Q?Wewe7sBb1hjS7cZsQ1mn6GCeFIIxergjwNxvMmbbCcvZAJFlqVxhQxyZAS8m?=
 =?us-ascii?Q?+qVpxJVnGH2i0Wjx1m4C93Dm1cUeF1F9ByNkBpUDjSqgnzs/2nJusclxhnPC?=
 =?us-ascii?Q?ikjzU2XNkdDEfr8JA7sY3hyjzhZ9tMkcetXiuX210oy+7u2a27oVrohPR71H?=
 =?us-ascii?Q?MQDAvbZYbvN3NMKG1rqWuePKgoIsAMk8bS5IfpJWADD7gebyAf1E9fmXbMey?=
 =?us-ascii?Q?dPZf/o8Q6zVsPrCQ2H46q3bLMebdsLWHRjmy1/M8FwYQapvDZoM0JVrExr9H?=
 =?us-ascii?Q?mKqC/C6vbD9VX8EYykCK7pA7kyT1fkuCBSvS+nDxWg4nt2jrzVTetWLpdgY0?=
 =?us-ascii?Q?pMH+tR88soGCD3aZw/DvChGdVra9O/qc8iw30dAIgx1UlmqRKIhujtGOTZ4N?=
 =?us-ascii?Q?b5B5laJZ3BZY8xcN6WlJB5O3WCorM3qCh1+Vt1MjcqjJK/pnl7FM8h7F5gdD?=
 =?us-ascii?Q?UeSYxuOsy+E79iqMV8mlzcZ7ivnVhKOTSqLCtxmxxOGrqt1Jg/5uY90ET3Pl?=
 =?us-ascii?Q?tZ1X+/PSGhzpa/cFdUuYmWIBv+TlUq20E+urV3BFEEjA7iP30ggMDXgLvU9M?=
 =?us-ascii?Q?KZNzVUylalCTpH74VxUOWusy1cjUnngpTwUjQUQ+IstsCnbkO9NLN5aWTVsF?=
 =?us-ascii?Q?IidMW5Tw1gEkfG+0jOc28TI8USzkImWqrLMQqNb6sKhXXkh/WpLJeaeUMoXH?=
 =?us-ascii?Q?EJC7r9V5+4Muf2JkYUjmPBcLN73RIJJSCCGUr0Vq/JUqKVQtMxWtkk10ugUt?=
 =?us-ascii?Q?/setltZoKfbf/HZTB3cTLKdLGdZe8+GSMCYdPWbl0Kz2G1MvAXnDezzOITiC?=
 =?us-ascii?Q?S3bPOULELlSFZYfzrwlCTcUGrHgzTILhh7P+8vChRp6U/1hzWhMJSnrpDPHV?=
 =?us-ascii?Q?ReQEoytU7NIErl4pLYp1jTilKokqAdQghzryqilHxcA2k61l63/5+PtCdoEy?=
 =?us-ascii?Q?Xh/S1blsB2lSO/oE1vPahkFk5BIDNpW5UW/alWdPb1h4UagaqPXJKTVQ9WWH?=
 =?us-ascii?Q?K/ltMicRNoKn0axdsaLw4OQ3vhGMEVaQlLgs/I+lZ0cSapj8G3zB2VRVwkKB?=
 =?us-ascii?Q?saOw/ReNxDMoGubMrkHfblSbuTxHKHxKeozjCExdUMqqmwvj2lwen1CTBSzB?=
 =?us-ascii?Q?xZXYQg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce7eb34-82e7-4cb7-6036-08d9faaf0cf9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:59.8369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00MkREbBHq36YH16AbDeBzFV4l7klGhNFKdLf88fyK2yp2jCeDrezWVrQlG570F1pmc34T056s+AxbZeOyCaRUPbdHlcEllrwEDTWXPkwy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::721
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::721;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
 tests/qemu-iotests/tests/image-fleecing     | 120 ++++++++++++++------
 tests/qemu-iotests/tests/image-fleecing.out |  63 ++++++++++
 2 files changed, 151 insertions(+), 32 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 33995612be..89c79af698 100755
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
@@ -139,27 +148,44 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
 
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
@@ -170,6 +196,20 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
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
@@ -177,15 +217,19 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
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
@@ -214,24 +258,36 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
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



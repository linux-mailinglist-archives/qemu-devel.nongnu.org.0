Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2F74CC6A0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:55:54 +0100 (CET)
Received: from localhost ([::1]:41204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrYH-0008Qq-OR
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:55:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNI-00048L-8l; Thu, 03 Mar 2022 14:44:33 -0500
Received: from [2a01:111:f400:7d00::72c] (port=28672
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNF-0004Wu-Qs; Thu, 03 Mar 2022 14:44:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajXrxEdq9xfM0sOTBGPh+bWD88bPJ9+oD+ThOrRxlXgiD4Fz8bU0/8YxMpRYv75PDugRtBvdeJPP+6SVz8sQmzwyxBC4gIdEw7D+BnN9OyVgj7KtW4yfKkkIZLvI2WUkKUDZ5rQ72F93v6qBdlXeOCjrTrRzX0jqY8quYkaSmvBfLZH/7YuRwUxKSNluKjjHQrteUbMNv0SlZ97aUWuMzaBRYDqc5RF6F8MpTnjzYmDzg0QNP59w/df/cbL0h6P7oyi1DL4UklXAxz9f593TAy68zUoCihuZ6LcNVDibmKXxsOuutkoW+meU+iFQmDwVM31MWh4vgicWinx2HS7MGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPWq8WNPK3dD6vDdPAgUea/YC405nYdzt4CdrYSUjO8=;
 b=K4P4Kb2u7SXcwLxo9y6fBjeHGw5CT7t5+X72HpZFsfEOB1NiFHkwVoCbpvVKmMcKvVdxVhb1Q/eBIZKBbRYJ8W2hokPUW4SrPcPKUB28/R+hV0pDdpbc5SxVfMMyAWdr5jJAEGLMzraE+M43m3daZsUtRxTz24dFPT2bzNrJ9YlYUI0dddry7UIfZVLf4IL5T9GSewAwYcVOGLxAfp1N2saPAWb9BPsx2nBcXb3INCB0b/KQkDD0DlHuvfeeF6oHEinIyzYYEETjCyKpjv6V6f/rXPjFfXSxMQoFucjgfDuahn/qouPLY1g2vrjeEkEzSuvSbqWREaM+e7/lWF96Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPWq8WNPK3dD6vDdPAgUea/YC405nYdzt4CdrYSUjO8=;
 b=l547U+j0kO2q1WxfEvHwXbFTz/bpgnIsILuXxzdzB0mEzEYer7DURsFV2x0hOVcKDsc47hD5WwrHYJQXwfY+nXFrs/KVYpHO7Zqmr4/1U//RN3YiICMtSE3fvFYw04RUQdjsuFQEB1bAgArwBb46LT1VRpHRkolioHwW9dFxS6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:17 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 16/16] iotests/image-fleecing: test push backup with
 fleecing
Date: Thu,  3 Mar 2022 20:43:49 +0100
Message-Id: <20220303194349.2304213-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fb3ead7-7a4f-4c5a-c6b2-08d9fd4e33f9
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB473650445EE10DF4D8B6DC8AC1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0nGzzg3eL9rcLonKqhBIAkybog8QwXWk27x98urIHRjPdj87nxjJvw6IMIGErleF/4cDzn0nk/H7tgDbkg0HwL1iirlnK34xugHpPY5CYe3rSlSIcorL+RE4lmSsJrNs0g4iiGKU/qmdkp8jRvWlEl0FWj3c6NvpHcDNNCLMfNgceJ3XMDRSzjeDRcwLY/OeV74qAo7RtuO3MTVYNBWtK/4zdZmRkAvm25FMB+qsJUfouMJHQIwTNppiydtMQt6+vGPEeTid6MfsCeifa3ibg/n/uCyXO3OZSBYIBMaU67g9RKc+aBTtToZz4Wc+HQ72Akt9Bcre5A5kTCzLEUoe0IF+RHl83nssE6PFdel5yLDiDbxFekslJdAn7m045kUt75b0balCx0g4GizTZovRuxPGHnoCdOblny1oIj9qg32odvMFpTMO4JEtJ9JJcakUBpALWOnQ2fsXW3qtF7UbWyD5CTEUvojw0VAInwfPQ/l5nRAafqSZPC3r+AhOtGyo2CJRArOMtxJtOIRZ0RfH6BjuRFNy6qOCTSaUeV/LOpa/OlcQxLKwfVuzgzCuKAxLnF8tUDdvV92GwYkts8XzgNbzGRIlk6uB/0I61tQPN8bJuqbXzaPB/HMYDCdmxNHC4z+hOOyh1yykYi6NqzLvTfUGEhSCilfGuBU8aOevTI4zkJppAe+Xe2WRyhterRkLWHUxGYGXsYOkdQZ2cd+IkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BxdOWvjyzvoimWchdd/NWU6w7jFrvJdnDcEqBDrWrIMlFLUkdswz6erYTaSa?=
 =?us-ascii?Q?UeWQRk1Sp5yVDJ01N5l+KYCzhBcLlRBMrU0Fhqf+xvKrhH6wzHhmnqrEiPQ0?=
 =?us-ascii?Q?iEto6tD87+QcWDIotTHwlnWIW0qi79PjJIQmHVdo72NwzTIlAS9uu29IOOMy?=
 =?us-ascii?Q?gfIseSvXu/LMH+4fevaDwZiWsK8cMgeQo4DMecG/mjkKlddiQBwH24uLPtHw?=
 =?us-ascii?Q?3r3OenOP78WWctM+sKMu7cOXaKknJNOvn2/UkJqdVarrjuPCO1mPoCNqTicB?=
 =?us-ascii?Q?YbTBJ9eBRdp9n0OUVUVXXKd9aPeOxKkzHttHIMqmWcsEVgb5IdC7OIdird8Y?=
 =?us-ascii?Q?S6vYeVF1XmkZm/+sReFZC6jvE6biVVLTJgEx+l4uK77dLllqsm2Ydui318UH?=
 =?us-ascii?Q?PDj59RHAQwpgpUPvF8IIXtgRMo4KutBwy10mXd7PyMah7HiyfUIN8deq9klY?=
 =?us-ascii?Q?LSDEwpLhNlzIakEb1gHnnjT7CcIsZ9juPSp9NVBFVhjgpmuD4/zB4zwIksoy?=
 =?us-ascii?Q?UZIHFq59sLCDbWgCz3gXokYl6IMRl6OofSsenjvlMIp2177nwmh4SHvJ6i67?=
 =?us-ascii?Q?rUYxbraeyOh/RvxEJcO3Qbwz/w4TlCTq5C6pewq1lv4mqh5/yW9XBMnNIDR3?=
 =?us-ascii?Q?sM+5M5WIcdpuq3uD+gy9PSR2OZVo62e2F2Tn3JX17RNduAtWYKKyv91Moc1u?=
 =?us-ascii?Q?+cy4BQCVNa+ye9kiSpXC2+cXTYBupp8HJn68uOBzWL16faBuIIJ/nkQIB9nj?=
 =?us-ascii?Q?F8dockltN/2XpZ3W8Iijfr4q3ZxYbuAy8vil8zlZbi8JkcQE4JwVl9XXN0Th?=
 =?us-ascii?Q?uBrdormN5Zn5fXAK7gmL5oEUoWTJZYC/qpyMAP5nXazZgvDUJvlP6rfGwTkk?=
 =?us-ascii?Q?sIVIkA1WSB2nOyizRNJMgadpDZn4zfJ+/C1vcz0CVX8OJaWJwL6UI/u1Y2vX?=
 =?us-ascii?Q?YwWXhwfIxIInG/AI0k9OJcH1UQtRr1i3K9Sj5qDnjSP0zhs94Wd2R1AHQCtm?=
 =?us-ascii?Q?eTA/x/5mP4OXOoUiuyz1p5yC8GLGQ/VFKtkfszs+5B7VvkyboK1fxFDSGd+F?=
 =?us-ascii?Q?0M4kVkWB5DfIrn6haTeIFDoOLVfEhnkU0lknc1RFuuAcbvP5qk1Z5BQV8vow?=
 =?us-ascii?Q?RUvsdRT+6BzLTvezSUMpCE7Ku9uEYaLn/0IcTCYSP73+q8e3QuoSgaqLvqwH?=
 =?us-ascii?Q?EhAb+yavBq4UK25M6CSjZeAkOmvtx6NrZVpdFWDPQoMG1aNZ4IU0eYCIPGFs?=
 =?us-ascii?Q?Byt/Pw3LaloG0fjiZYqY8nqteh3sFyLeK1S1IASWKsgIYt8QdW0FVTecYWq8?=
 =?us-ascii?Q?D8wh6+pBuiRNlOzMVUXQIgrQTvYh+Tmm30Jl2MpkAvzfNkAYq2HB0JERGVj8?=
 =?us-ascii?Q?h1QeKt/xhTF/JW53QPVl9YR7PcBeT7bVLdPNqmYFlL2b4MQkkfEj/0uW+opy?=
 =?us-ascii?Q?Fym9lMkqpWvgg2jDC1MDvzX1X7Jwuss31oRUym8316zNX+S/J3s05n2wTJ/g?=
 =?us-ascii?Q?Ueo9mZkjvS2NiK8LHvDWxYWI1I5BL9PWl2QmZUNU669qszgDWNL7osKz7Vc7?=
 =?us-ascii?Q?rcVikw0GKExL5fzDc7cIXSzc6oHruViyfToCth8fJqnDJrYLVYh3CswCvWup?=
 =?us-ascii?Q?xfx9qIgV3mmS13uooDXWZhu4dKsmR3YuX5Si64xCrEpnN+M8k/ZWgj3SJhsG?=
 =?us-ascii?Q?81gYuQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb3ead7-7a4f-4c5a-c6b2-08d9fd4e33f9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:17.2013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kK12NazOddUJV1XdTB4MP6rKvevORldifmKT/dDEgtJOCBtOJQj6AhnAY8ONIQja67cmxE4G/tRLBlUfb18pRb6TjC7gL3OfG7E4eFJ4k+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 tests/qemu-iotests/tests/image-fleecing     | 125 +++++++++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out |  63 ++++++++++
 2 files changed, 156 insertions(+), 32 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index c9ffa6647e..c56278639c 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -51,9 +51,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
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
 
@@ -67,6 +73,9 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     else:
         assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
 
+    if push_backup:
+        assert qemu_img('create', '-f', 'qcow2', target_img_path, '64M') == 0
+
     for p in patterns:
         qemu_io('-f', iotests.imgfmt,
                 '-c', 'write -P%s %s %s' % p, base_img_path)
@@ -141,28 +150,45 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
 
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
-        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd,
-                                           nbd_uri)
-        if ret != 0:
-            print(out)
+        log('')
+        log('--- Sanity Check ---')
+        log('')
+
+        for p in patterns + zeroes:
+            cmd = 'read -P%s %s %s' % p
+            log(cmd)
+            out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd,
+                                               nbd_uri)
+            if ret != 0:
+                print(out)
 
     log('')
     log('--- Testing COW ---')
@@ -173,6 +199,23 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
         log(cmd)
         log(vm.hmp_qemu_io(qom_path, cmd, qdev=True))
 
+    if push_backup:
+        # Check that previous operations were done during backup, not after
+        # If backup is already finished, it's possible that it was finished
+        # even before hmp qemu_io write, and we didn't actually test
+        # copy-before-write operation. This should not happen, as we use
+        # speed=1. But worth checking.
+        result = vm.qmp('query-block-jobs')
+        assert len(result['return']) == 1
+
+        result = vm.qmp('block-job-set-speed', device='push-backup', speed=0)
+        assert result == {'return': {}}
+
+        log(vm.event_wait(name='BLOCK_JOB_COMPLETED',
+                          match={'data': {'device': 'push-backup'}}),
+            filters=[iotests.filter_qmp_event])
+        log(vm.qmp('blockdev-del', node_name='target'))
+
     log('')
     log('--- Verifying Data ---')
     log('')
@@ -180,8 +223,12 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd,
-                                           nbd_uri)
+        args = ['-r', '-c', cmd]
+        if push_backup:
+            args += [target_img_path]
+        else:
+            args += ['-f', 'raw', nbd_uri]
+        out, ret = qemu_io_pipe_and_status(*args)
         if ret != 0:
             print(out)
 
@@ -189,7 +236,8 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     log('--- Cleanup ---')
     log('')
 
-    log(vm.qmp('nbd-server-stop'))
+    if not push_backup:
+        log(vm.qmp('nbd-server-stop'))
 
     if use_cbw:
         if use_snapshot_access_filter:
@@ -218,24 +266,37 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
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
+        test(use_cbw, use_snapshot_access_filter, nbd_sock_path, None,
+             bitmap=bitmap)
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



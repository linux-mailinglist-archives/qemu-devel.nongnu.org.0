Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A4638CCC0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:53:57 +0200 (CEST)
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9LL-0005jT-UL
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9Ha-0005jb-Uq; Fri, 21 May 2021 13:50:01 -0400
Received: from mail-eopbgr30105.outbound.protection.outlook.com
 ([40.107.3.105]:26486 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9HZ-00065R-3b; Fri, 21 May 2021 13:49:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXRTq1ea8/vM0b/xorriRQDjJG9B1Zn83ALyASWhwlpNh88HKsebLFRTMAKIFsU0fB1F8+wrq+uPuoFLg3Bi1KM9+Gvvjw4OnfNkj2rkRN7sYPRYoIvR+YUF7gRWkqEYsejmWGBttLtOKEgw9bp4ZfcV135CUIbniM6OhRywz9lRxi3bNWSxZxZU7FM0O9IjiDJu50cjJi0BTenBzIbrGYK2+O0+e6Lt1e393C+wpgl2hiuiHD5HlHkhkAUoEqP/dy7gHODPPi0CMAutP8nbelzZ0hfxjjz3rre2sFLns177wvvBqz9ND10ENC6lrnDhTBmGz4pg9fBs+WTWUCp6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPR1ZX5PZ8JDk2OOGHKZ/gJ4icAEgNLQKgF7et72HCw=;
 b=nMEzeyt2A6y0tH2GBeDr0UjWFWyXsKadsKunqTrsr8hvDMctb6/JmS866hRvLKB1YdfczWFxgdLdbMacy5QcgYowOByHvwwhOaxQ3s1CavhGSyZzbVa7qcah7lxAnMM5LC8+LG+jyKVgZePTV2/kTUztn4HuuenADCIQkq85p0kKbTKaTOOXSUfkhFIIQXIYwNE6rvtQ1jjkMFqfcwOhuhfq+JfhYVrejqaEC2inPE2JVxnyAXRLNaNHE0Vq4/kUks1GCG4/cYVMogUNqGi/Ul5jyxr/V5dnAP9OlZeDk4RJssxt99CasGit09aEWdADCexJV7J4r4YFxTmxwRew7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPR1ZX5PZ8JDk2OOGHKZ/gJ4icAEgNLQKgF7et72HCw=;
 b=SIr7Axau1F0bsc73Sy4lYpVJFeYg6QBw7ElEP59224AHqi5dy8n87drT2qTGjhlgG/I/XRmE4C/ausPyMwRPqBA5IC86pQD3/+wFI4vTQN1sWVss9JJU7ujkhFDEUD7AB69t4ucaaqDvkbFtdFfTmlwkw9nufFJlFFAU/xUKTX0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 17:49:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 17:49:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 6/6] iotests/image-fleecing: test push backup with fleecing
Date: Fri, 21 May 2021 20:49:25 +0300
Message-Id: <20210521174925.62781-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210521174925.62781-1-vsementsov@virtuozzo.com>
References: <20210521174925.62781-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1PR09CA0083.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1PR09CA0083.eurprd09.prod.outlook.com (2603:10a6:7:3d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 17:49:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18404dac-e02b-463e-492e-08d91c80d1d0
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB591130AA441A001CBA7E0C79C1299@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /UUZYuACOq/b47tgfbZrDPFB/yjmoZZvIgwNGUCvZsoFQCHIebHFukF7nt1vG+yyN3CMVt9t8BhTKt/UTpObrSc+E9jjHhxqzvmoF/y3pNmVmPAbR6dAU86CcfFojo6YmHtFotLIhfaAhTddQUmulJjCUuGlZsIJiXXwu9MAQy0VCtF2/v565A80heIv+8rMdmyg0i0eLMBMgr6qT8QJ7/vOgTzftzIBVOj6EL4Tl2UlP1FwKCsUOC1RItr2NDyMALSsoOc3zbUEWVv3HLVTT0oshblldpW5iY6AMQwdkPR4aC8EE2OODCxfRPLpULTRxW5z3LayOl3Z3Oh4oaoKo0GtZvh1hblT5o2r5dfPPX1yv5p1aUGoHN5O+ovTGF0rZuQOmbrGfi74ETCX9pSwvK2Q7NB+SndyfNf+04eJImAsMAlwadQd/AZ8iD/iRRQoI9xhj1Oz2LzNyF1K/73lPs50x/gUP5iXhugyef1Cs1l/n+rH6+XpTvxOMKgXWDQ+UqIyTaGGK97MtTLkXH0bm4tVc0vxsgubfhRQ6FisKCOHJU9S2ZTQbX3t9CJVTnjTA5wq+yNXM4FVL9/rdQS7FttKa6ZIzPbV+ohM3ikhLhLg3W6oeZg6v9nXPdzSBs3/PnrYnA1OODqUi3IOhTXSnWUQ2AOFkd5xlhVPibHiWWKhMFEYEoQGTuuOn+5y1o9J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39840400004)(6506007)(38100700002)(38350700002)(6916009)(6666004)(86362001)(52116002)(478600001)(36756003)(316002)(2616005)(956004)(4326008)(8676002)(5660300002)(1076003)(26005)(83380400001)(6512007)(8936002)(66476007)(66946007)(66556008)(186003)(2906002)(16526019)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?55iBCwu8bqhUhCgJvItseA+3xfs/8cG579hIvqplcCFyHeOt+P/7cSHts5fz?=
 =?us-ascii?Q?Y2ghN/tcoyndFRDEVPcrujrn3AbyvCrgU8tuCWjn+ygzU+pEOOnIw6GodSRR?=
 =?us-ascii?Q?O/Pm8QTXslZmBb6TlZM0XLE7zQKvsIRP9JkumDNP1XxMTWjDcTNQCeUQOWDw?=
 =?us-ascii?Q?eEzmtvptDSc1N0sAbPxSBt4oLTocdiVBlcSOobHxURR0VWKOG6VsEqByoNrR?=
 =?us-ascii?Q?2WpUFwWI3/gk4+IXmeuHCKTXenXLK0Pn5WsaJVv1L6y1acEWGXx1htZGxMV3?=
 =?us-ascii?Q?6Mny3U1/aIoxQNT9NfNl70hGVmWjpnaSRVdR5eF8UkSZDXda4NO6wEl6s+WL?=
 =?us-ascii?Q?aNhRndgdP/RP+eBLnBfHmnpJjsuSZlTLpagLu7w9KmMjvHh5g5ZMiInvgMel?=
 =?us-ascii?Q?J1SV1H1qr1lT/MlTwJiPGtAlU69p/6NPfxPOPcCvECTm4Z/prPMN3uAPcbrV?=
 =?us-ascii?Q?rgyfqGrHUVaTNr6jZpqV9WTmudq46oZMRmwB+eEizdR0S3J4EfLGNxjHMbmF?=
 =?us-ascii?Q?S243pVA5UekID2AaIR8/VlrwM/X0SOFG7moOl+GSS32II9y2B12fx6eae61u?=
 =?us-ascii?Q?+5VEx68yvEd2TZcRQQ+UMq140jcozxB6rDVMf/dsiTBFIp+xPJrQqajqZCuu?=
 =?us-ascii?Q?eTFJoa4o/FWTgaqBA2kyF/qNNrMY8RO70nqt6tGBWJ21BbA4uGLwU4aYEJod?=
 =?us-ascii?Q?U9IxSwGSoim8hrWh+Tx5uHykWBm30ErT/0Ze0RPN56PF712U7Ip02VoYYc1x?=
 =?us-ascii?Q?/fHpudx4sJw3rEVkNCjD7jshCSOcBych3V8lD+lsm8fq1hKeUDjejtGMooFd?=
 =?us-ascii?Q?WJPd+k5g2ZukxvV/MOYiGYyriFILxuD2hVadsjXtG2Yt0jAkCzM91akv5sRG?=
 =?us-ascii?Q?i0IDKLZ+VzNlo8jRwzlJ9eUZDmLHv9Lc0iWaANVX5ak/e4ICaL+zuN+HTNm6?=
 =?us-ascii?Q?K3rzGDtKz5VVeJWFex04YKyNxQaYgA7T/RRZnRNd4kUNGjFCuLt1GV4pX5ZH?=
 =?us-ascii?Q?oM57dzMq4UEwi2kaJoI2Ildcvp0S48dorcGGmf+di+MRyA5NTUPGWVCL/EMq?=
 =?us-ascii?Q?bJ4px6vU/yd1C60zbdMovIxmrGmthbOckAwuzSgWjyr+CkXh93QcVVh0MsQI?=
 =?us-ascii?Q?FYQCJcpPEvEtl7Dx003oRlj5FwN1wegwnKeBehOupAY8eerNlsx/PBLutR7v?=
 =?us-ascii?Q?z3X7viYRECzp0JTLw7retEl+7TMtbd3pYjPmBNFHo7qj9ybHSopNrDik8+L0?=
 =?us-ascii?Q?GJ3UtnFPnH6cAm/2FvxlcFqV2845RGgmhqcgbWQeO+XTT3hw9ladPgIhcTVe?=
 =?us-ascii?Q?Gx0mfMHsXYEKNmSQ492+nYAO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18404dac-e02b-463e-492e-08d91c80d1d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 17:49:45.3007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBHJtZujCwfTj4SAJLOWAnGgxYK8AUAYICaPYA2Nq1U5W/iHlutG/CKVeNoecnrqzxQlsgX5ZxtAa+kIEE5jJgls2WH7sOOTEz00sSKm+ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.3.105;
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

Add test for push backup with fleecing:

 - start fleecing with copy-before-write filter
 - start a backup job from temporary fleecing node to actual backup
   target

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 104 +++++++++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out |  60 +++++++++++
 2 files changed, 139 insertions(+), 25 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 404ebc00f1..4c0cf2a088 100755
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
@@ -108,25 +116,42 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
                    target=tmp_node,
                    sync='none'))
 
-    log('')
-    log('--- Setting up NBD Export ---')
-    log('')
+    if push_backup:
+        log('')
+        log('--- Starting actual backup ---')
+        log('')
 
-    nbd_uri = 'nbd+unix:///%s?socket=%s' % (tmp_node, nbd_sock_path)
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
+        log(vm.qmp('blockdev-backup', device=tmp_node,
+                   sync='full', target='target',
+                   job_id='push-backup', speed=1))
+    else:
+        log('')
+        log('--- Setting up NBD Export ---')
+        log('')
 
-    log(vm.qmp('nbd-server-add', device=tmp_node))
+        nbd_uri = 'nbd+unix:///%s?socket=%s' % (tmp_node, nbd_sock_path)
+        log(vm.qmp('nbd-server-start',
+                   {'addr': { 'type': 'unix',
+                              'data': { 'path': nbd_sock_path } } }))
 
-    log('')
-    log('--- Sanity Check ---')
-    log('')
+        log(vm.qmp('nbd-server-add', device=tmp_node))
 
-    for p in patterns + zeroes:
-        cmd = 'read -P%s %s %s' % p
-        log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        log('')
+        log('--- Sanity Check ---')
+        log('')
+
+        for p in patterns + zeroes:
+            cmd = 'read -P%s %s %s' % p
+            log(cmd)
+            assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
 
     log('')
     log('--- Testing COW ---')
@@ -137,6 +162,20 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
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
@@ -144,7 +183,10 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
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
@@ -159,7 +201,9 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
         assert e is not None
         log(e, filters=[iotests.filter_qmp_event])
 
-    log(vm.qmp('nbd-server-stop'))
+    if not push_backup:
+        log(vm.qmp('nbd-server-stop'))
+
     log(vm.qmp('blockdev-del', node_name=tmp_node))
     vm.shutdown()
 
@@ -175,18 +219,28 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
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
index e96d122a8b..24f97bf7f6 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -137,3 +137,63 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
+=== Test push backup with fleecing ===
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



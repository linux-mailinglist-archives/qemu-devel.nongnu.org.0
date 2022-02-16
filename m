Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C6F4B9211
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:03:51 +0100 (CET)
Received: from localhost ([::1]:36034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQWk-0006jq-Ff
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:03:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGl-0004J0-5g; Wed, 16 Feb 2022 14:47:19 -0500
Received: from [2a01:111:f400:7e1b::707] (port=17600
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGi-0006Dk-Ko; Wed, 16 Feb 2022 14:47:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiUI6TkbS4xOa1xamq/Eg4LPbtBNQs4P0ulRDaULxpR1BoG8JLTrL6gpxiryGP1vhDegCt/4WE9KQkYJU9q89ShIoSM1i06hg0M44MOfzkvI0vjRo2D4kPy13bCNi2UUy6iO7d/jyu3Sdt870hMjLzO7954mWD3HYmrLnAIgJ/pKok77WrocRygGof4X5GHR3wJulLS6diK2Lx0M1a+1kdjkZndQnlWiZYXGRYE31YOR9ABTqTq9hOxZTJEIvw/2trflfBGun2lCQcY726/bRzAw4crjWMRpOvBqDjOC1gxhKhgka5imjYv1xZWBAQMerqmoc7IpKwVRn566WeJkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZl+Umi061k76sgBQrDNahljTxYMMdNE0wxhbC4RHRs=;
 b=a2tjG91ObeCpwLJfDVOUA2sLAT6a5tHZqYPt9LidA9Z1PgGTSQgJnBzjJfGxAtG90IUbFW5S+jqGeMeaI4D0WfX7onPQozHgkRHn0DUyUzLbQtXW2e/CGmRUN1stDwzKfFkWgQq6DmB8qATPRnE//MFULp0yBlN9YyixRhFxrVVxrCTxItIVSC6mll76EFnKMyNHJ5BtvOX3Ugm0CDWVUegN6gVGYw11M2NtSjspN+UXAZ0j8kxXogynce8nzUXJbLXErL5jCejth2I/QFZXMegv6dxp68ZQW2U/jFa0mAI9ntWC8V83FVzqF7Nq+0c0f3G4ZCmjHBdRX6tWUKT5bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZl+Umi061k76sgBQrDNahljTxYMMdNE0wxhbC4RHRs=;
 b=sk5It0mVm4q8zywC8HPT0m81ubKPdnLxX1OJ+4j893svgRpwZv+8TKJK4PoppxtnS9xHMlEbkSmKDz8YyLeLw6yXtMF97w2x6liGHdA288borRnZ7jn4LQOpKLNrgf306UatFlh7BaalO5sUQeqpF1p7WQNAfmySqlbLzCsQEkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 15/18] iotests/image-fleecing: add test case with bitmap
Date: Wed, 16 Feb 2022 20:46:14 +0100
Message-Id: <20220216194617.126484-16-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: facb36a3-44c3-43d8-82d2-08d9f1850e94
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB2851F04BD7311E3542F202A1C1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KbsHiJRK71IeIejZcPTpezGXJuuQy7pCRYAfVNtviv73VKmZlommx7aR+x0+5Lhm2XE9R1PW56c2cK8b900hhFSuOtJGrqekxdEdkXdmYyI8E0P6e3pCQyoOyZJojM9nAHKmRlhLq+RHQo49JvLT+IDB82las7swVMdG1IX8YKT5Q22+ZoEpZSUN4+6ufnVrzLc1YmOhpG8Tk4IOsRc2pOUZocqbH2VhIbFJ85rqYcKrHsqf8YuJosYZigEghk1YgKWTaHKY01pQKUqlcvokZhY+p/L7+UE+77ByNkfrQmA41u00kwKbqzQn/99SVfOw9BuJivD7hzfYGxnoTrqpPHN6nQVjPsni8JTgkKmwygLLjpVLRnc2hkVnaqMuzkhOazetcikWCRpAt6gubHLc5eyXtJ8Md8X61WCtWIR22+PgaVgKazbahTa41MB7wseWGt4w+73GotStORTUB903oXd5zJf2pWWpOAtSAGfnpJlydS16RnHd0/HRPRyn63W+k6tBUG0Ihp2C1InMu3RQaWaYAxQNkStTg9SCUWbbkfTAdMS2Hd/SAy1aF10yrUSaHShd90D1FJ3Gyb0z44LkkOk8mkTneZiJZy1tq3ulpfKpm1/AxCDj+ZjuN9aZt8dh/WfrlfFYvuDRUev8T5Ox7xeTfuT+8dGmHHBfUJxqohPCzo+VQxHD87n5MgNp0VdSqXmmm85q2ranoOPP09yxRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E2J8tRVN6hrpTqopHCLg8T/vVhQS+HEiGPhSdf2dYaTJH0GRRZRwkPLaEDFo?=
 =?us-ascii?Q?+BvJEDhOiRmzs3zRjn1W/fr/1chw+EGQDTUXxHhfGx4+DGEi0HnEtarmkVir?=
 =?us-ascii?Q?JVWbRW9pHPV9Y2En+kDM5oFDkIHdZbVHQLOHBcRtKXzVW77nJL+/4Nl0/Ulb?=
 =?us-ascii?Q?A2TqVDWKrZc+9js0OFr1Sbk8JBCLMODN078Z1vZKdk74VHl1MhqkeAdYdbqB?=
 =?us-ascii?Q?p9n6AoWrYfYNt56l+Sct6M//HZnseo7NGcAdBBJfJRDEP+TyC9s0ZJj1uHJF?=
 =?us-ascii?Q?IXEyWL1wnQPQDJ12hbN0kjfNUMtdLvnz2j/+X5WoGFfEGb21X23GcD8F/2fw?=
 =?us-ascii?Q?KFyNEHklW+pH1jjrCzOiWHimBoPr1/NFw47MTFOrDzUKO1rDnWFYNtnlBW/l?=
 =?us-ascii?Q?RiNpe1CeI8cNfDoCEaI1d6MbK8N+5UmvtvFaGkU6aY5Gwhgdo+JbO3rvQvx3?=
 =?us-ascii?Q?dVKPwKLGUfrlslsCSGinjr7wZiFYDvEFz5N/Tt3Z5S27P8KiDxy1GL4vfKyy?=
 =?us-ascii?Q?kerITZhCBDybGGQPcM3HXGHmqH3hnP8hGpX5Bv/0MLWfZTTA26L+4H7nSqYf?=
 =?us-ascii?Q?fcZSDsVPXUU4kcP+dSRLUmZjLWZF7oDvfpYApE0AoEHeew9BsuHMNI+W2B5U?=
 =?us-ascii?Q?daHwDN137Kezc6AkUrRdOoJWePwnXaxvbuQo2oqqF4+5XdIyjG4jFUkUUEf+?=
 =?us-ascii?Q?peWyA4fnZI0P+VfYvbvuhDdJaA5Y5ceLXDIoWm252LXaPFounaNCqln6tXe6?=
 =?us-ascii?Q?yqUiXk47X0o61o/TYzX+W9n/q4ukxeFExOhN3MiRkp6m7TFB5rLerTwgQKBV?=
 =?us-ascii?Q?VfojqFgLadHCDWPpZl5Ojn6nMlXL5UNJiQZJ3TDz5qCwT/UZKN17I6i6J57f?=
 =?us-ascii?Q?F8FuBOJlTlYF9iBGpNbPuUtA++RYnHzjJTWy5TfmMg/XDMyr1vn/lpEik4uj?=
 =?us-ascii?Q?KkwRE1jsmj+7u5Vk2M3AVOf4U0vbVE71I+DbbUlWifPRcOFs/SfM+7kdTLiI?=
 =?us-ascii?Q?0QCjKDpF6H0h41kO+d4PI3I9lifYBOGotyJW/rnNY1t4YuQYQCbR0a0XxC/k?=
 =?us-ascii?Q?PevH9iwWkxswudOt45wDDP6D0dJd27tCv1GromJx3Rc/QBEqPb+YdlnHVn4B?=
 =?us-ascii?Q?M7QyHiHPoXLPkvckw4SJ2IjAMAGiEfcjrh43beCuBVe4VZ47F1RtlkOdB5lE?=
 =?us-ascii?Q?Miv75Z4OBxJe4pdMgEYj3wa9YSiyBOFzR6qkgLp713hNpQ68qMh2eBB2BRMP?=
 =?us-ascii?Q?at4e/iiJbdP1jctelIH8Fr+ZHL/NfM9tHNdkY+aUQ2njyO384YpXdktiFw6D?=
 =?us-ascii?Q?RXUIXolVRzLov1JKyJDt2Ys5wcK4P1wkgs+ta4kdrbbGlHOaEWyA7L7FNMxO?=
 =?us-ascii?Q?NrWmtW/Wqu5PU6lozlSFlfofd8r0KYVQtky1+NV6KfrNU8liWYTAVeL6jdRb?=
 =?us-ascii?Q?wBkwYfZ0PiEqIDVaq/dvokAeWIg8OsbRjDOm9lbnHEvVT/Ubq4Wd5iwY8mke?=
 =?us-ascii?Q?m1dEe3S8LB/19reLUVkm1EAXTO+ZAr5pk7i/3OpnJftK9yNatL5dyEhdLi0y?=
 =?us-ascii?Q?CFo4/+jtyl2IG0aej7OTf1cKWOQayAFY7uHGd8z4A2fMnhXN8uuxp1MoWsEK?=
 =?us-ascii?Q?EegT7HuocQDFnaXPrmI/XbwWoRCOpNqdgyAB4M/aIFmwh33JQSfnoVOt9x6w?=
 =?us-ascii?Q?PkfmPA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facb36a3-44c3-43d8-82d2-08d9f1850e94
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:42.8443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nd/R2mQZCDsvMMue6u8J/dRVGkBmI1FuI+9XcxKhQz8krhNkt0IGLwzyStWzvoy0VHUkNWcrHfx2uHjn9XPVg4k9KoJ7ierd+k3dpB1fb48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Note that reads zero areas (not dirty in the bitmap) fails, that's
correct.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 32 ++++++--
 tests/qemu-iotests/tests/image-fleecing.out | 84 +++++++++++++++++++++
 2 files changed, 108 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 909fc0a7ad..33995612be 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -23,7 +23,7 @@
 # Creator/Owner: John Snow <jsnow@redhat.com>
 
 import iotests
-from iotests import log, qemu_img, qemu_io, qemu_io_silent
+from iotests import log, qemu_img, qemu_io, qemu_io_silent, qemu_io_pipe_and_status
 
 iotests.script_initialize(
     supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk', 'vhdx', 'raw'],
@@ -50,11 +50,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
 def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
-            fleece_img_path, nbd_sock_path, vm):
+            fleece_img_path, nbd_sock_path, vm,
+            bitmap=False):
     log('--- Setting up images ---')
     log('')
 
     assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
+    if bitmap:
+        assert qemu_img('bitmap', '--add', base_img_path, 'bitmap0') == 0
+
     if use_snapshot_access_filter:
         assert use_cbw
         assert qemu_img('create', '-f', 'raw', fleece_img_path, '64M') == 0
@@ -106,12 +110,17 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
 
     # Establish CBW from source to fleecing node
     if use_cbw:
-        log(vm.qmp('blockdev-add', {
+        fl_cbw = {
             'driver': 'copy-before-write',
             'node-name': 'fl-cbw',
             'file': src_node,
             'target': tmp_node
-        }))
+        }
+
+        if bitmap:
+            fl_cbw['bitmap'] = {'node': src_node, 'name': 'bitmap0'}
+
+        log(vm.qmp('blockdev-add', fl_cbw))
 
         log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
 
@@ -148,7 +157,9 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
+        if ret != 0:
+            print(out)
 
     log('')
     log('--- Testing COW ---')
@@ -166,7 +177,9 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
+        if ret != 0:
+            print(out)
 
     log('')
     log('--- Cleanup ---')
@@ -201,14 +214,14 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     log('Done')
 
 
-def test(use_cbw, use_snapshot_access_filter):
+def test(use_cbw, use_snapshot_access_filter, bitmap=False):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
          iotests.FilePath('nbd.sock',
                           base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
         do_test(use_cbw, use_snapshot_access_filter, base_img_path,
-                fleece_img_path, nbd_sock_path, vm)
+                fleece_img_path, nbd_sock_path, vm, bitmap=bitmap)
 
 
 log('=== Test backup(sync=none) based fleecing ===\n')
@@ -219,3 +232,6 @@ test(True, False)
 
 log('=== Test fleecing-format based fleecing ===\n')
 test(True, True)
+
+log('=== Test fleecing-format based fleecing with bitmap ===\n')
+test(True, True, bitmap=True)
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index da0af93388..62e1c1fe42 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -190,6 +190,90 @@ read -P0 0x00f8000 32k
 read -P0 0x2010000 32k
 read -P0 0x3fe0000 64k
 
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
+=== Test fleecing-format based fleecing with bitmap ===
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
+read failed: Invalid argument
+
+read -P0 0x2010000 32k
+read failed: Invalid argument
+
+read -P0 0x3fe0000 64k
+read failed: Invalid argument
+
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
+read failed: Invalid argument
+
+read -P0 0x2010000 32k
+read failed: Invalid argument
+
+read -P0 0x3fe0000 64k
+read failed: Invalid argument
+
+
 --- Cleanup ---
 
 {"return": {}}
-- 
2.31.1



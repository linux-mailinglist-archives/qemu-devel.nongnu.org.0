Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDE13A2AD1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:54:13 +0200 (CEST)
Received: from localhost ([::1]:52536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJGG-0004s5-JR
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqs-0004eV-PL; Thu, 10 Jun 2021 07:27:58 -0400
Received: from mail-eopbgr40102.outbound.protection.outlook.com
 ([40.107.4.102]:59870 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqq-0004oO-Ux; Thu, 10 Jun 2021 07:27:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZo+J2IB93viBIkjX6RqkcS5SD9Kqa86AKgf/TVjQD6UlnEOQrvxXF5qgcirVwUNuWE8ZHpV+DHqA/JS9gS4n1cPSfSyAIVOtyQsYVTCa1UJwK+6Y2s3sgKLhuoEpbUJZ6MfmArVpd0lLDXI3+Cv6jsUi+xq5J3RBzqhC0WJ/iVEP1vYA4aujh7J7GTA66X6AGsxPDVn5dFEdh+gqKZxA0alM9so+qTqkdeeHoLsQOb0tUncH/Xyy049Oj/W6hDzJdQzNtl4downvUDtJ2FbkMeg84xZtssJ5GnPUdFGINQpNBVXuHIDfCI10sNhDkStY9CWWJ8nJh61x3865LcwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R10eEY3SLa3JfenTqosr5rslG6Qb5NWVOLL6711tuGc=;
 b=dzjQM1cVKU6U8xCOrO7/WO7YHFSBtH3Y6S1+W9vySNzVNIz4ZmqK3jKGq5wMK2HNQ1pxVKErmY2pV/kJDmxD699hQowOqzBo4QC5QHdyIpnfZSkTjP7PiAraQMVqYmy9h9a3B5pYwvlgRrjWYM9CCQXhaAAFSud/Sccr06y0xggsqRILwT6WfKsyNOgBbjRwAHJN2RCDqzMyT9XB89hmr6ibSYOyY+fyytVaHh6zjMPEQjdursrNF3LeHDhQe9ESD8tu4sXnMeQYgXVr/XGOOJhsbxUzqkPd0mhE1EZccDC9ABTCbFXV5TrKIvCxqAoUm9xW++rKIcXtGuGelKSTdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R10eEY3SLa3JfenTqosr5rslG6Qb5NWVOLL6711tuGc=;
 b=oDJCQeLWJT2HLuveDowZi/kJQ+AolgzluAqHcwPNXfVsNcAmqr0kfkWiFiL0XegjI8lYbTmgpd2wbXv8uBj1TDU6jd7890q0PGkn2QpTJ4vHg0iprIvUxg3wuzCa29wyVqupERP4BFRpezXX9A4ds6Mev+RXxQOSELkdUFhNLyA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:27:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:27:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 32/35] iotests/image-fleecing: proper source device
Date: Thu, 10 Jun 2021 14:26:15 +0300
Message-Id: <20210610112618.127378-33-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:27:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7548ce7-cfdc-4206-8c74-08d92c02ae58
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381C9C266C82A0B206C862CC1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LJx8qIw7ToUozcNugCAPCSi7rWhuQRnpOpXSPX2+EJnu9Jb4Pn9I9xngEo3Ba1pgrjAqnHijChBGRIQGHtXmrLpQm/KbPfuTOj17ya6JCpeC7eZ/ML/hI746F7rIjmbyNSkgGzidc6SDdOjXPpYlebznsmFjRUqXQ2C7/9AQ7KincghRR1/g1Mf3sTG3AsZj098UBDPxwE9UtJxoq5helukD+okcZA69MFGyBqmoKKCitdtKMjPSTI+BNyhK3c4SAnTXx4TvRqMVgiIym3rSXMicd23oC/8BYIvhshyuvYHWbVJ3gWqvyMWdXfPc9kwr2qeUN07GKus4pRwNqMagch5v6xNt5thSXd05iPkWJObuPt7EBbaA4qhqh/60zsP2iuraC4Cy2F/BzhjieCnw1rwnrU/RBPfMSVjxY8af31Nvhe+qm50YO3d4hwcfoDDtZSNQHETE5h1HYDay3/XbYktgO0JicvBJdP9NqllHAzM7/5CGJSI32MRs5fM8X5jKpr5aaJUl3JnbEH7L8hQwH3eangtHn378E4TAFxbeukid/AzbA6AtYDAwqkium6MLZZ5suX3XEMjWXN3n9Ln4zgZxUcjM8rQ7xneODbAaoZXwA6xgdDKdrJ3jJM+GbMlSaqFehNaarvqfeJtERMpUTeTtJw0mNye670O+yV4V8KkyO2ScWMoZsDz47ktN3SUY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?K2dC7rgFEgu/laaYZjibKBDQ1rF3XkmaPq7HcrvaweWTWH0xkSijJ+l/alXK?=
 =?us-ascii?Q?AyGO+nrE90RTeyqGR50S5nLTREsbR7/SkMfF9IZJhiLL4BdbK5BxbGCT782w?=
 =?us-ascii?Q?tCWWrbofkzEAxMBJoc0L7tJ21WZeslBLOW35AlVi6W76sAkk1IRpaU5rcQfV?=
 =?us-ascii?Q?/f4BLn+yB7+N5hXOLF/8jlE5WBspaOwu+jrulDdEOYU+YTi9/Wsb/4JgJ2Cv?=
 =?us-ascii?Q?0/dpNo+mFl191Fl3Lu3uBg176uniHPCK2Vk7FnE8XAAesuOjSJpW7nZcZXBt?=
 =?us-ascii?Q?0S0qfFby1C0pQ8x8JaEfXQRLg1wT0uPFZzOS2dp+pcn4hpr/iIf5Xi49ro7R?=
 =?us-ascii?Q?9mOl6NVHfuPOTLWOq8Rl4y1wPmGwl2B9+JUnumrIE0LeNx5l2qvGZYATu8od?=
 =?us-ascii?Q?jy1as6eaPeAmyXjTawwcw/LdPIjaXJ6wuq+97pIGLJlWtpkGNG1yngCpdjno?=
 =?us-ascii?Q?X0tOnuLpfYe+KgBm2TwPOXzBIPDxOdLlzhOv3A3kgtUwnYlZpQS2gSMC7u7l?=
 =?us-ascii?Q?V+G2hyhYVK/l8gUNZkDqCbkMipTIboyJGtmcqhAnduRLEazDMKeDYb7O2SOV?=
 =?us-ascii?Q?5sU2l9kvDrSvQlpD26NVvLYH8xY2m97zwMgGP0MEIUxib1xf+ssx/Tbfrbnd?=
 =?us-ascii?Q?6a0qHA/7GAVI//aroHZtNJXMAH1WfnSRJ8YA4BQagWhcorgYRWQWNAchuFEB?=
 =?us-ascii?Q?+hfvpwMHxfbJiEfS8bwEFoHHFL+YBXZHbRlGtvRja/uXokT0J+2fP1jRLIrq?=
 =?us-ascii?Q?rHjqKMbifTpw6VNqyD9RzXF3D2jK/Oj8DTHEp13PVT1nuLu/Ld7cd90pjWCx?=
 =?us-ascii?Q?PioiUUEtpxamZqcBl7Z1Q2QI9A+qEpPh60xmMPH/bxq44MxW2Xw2V51PTsre?=
 =?us-ascii?Q?fv1MqvXHRiry5irSHDpQZPM+SaVJxJOuMh1E+KYEFsICQwKEcrSzRotYo7hH?=
 =?us-ascii?Q?KSbNf3aFoJAaD7c3i+7ki9Mm/ksXEbBhyj2zDoDE5tvah8hAEg9aH+NT8Nay?=
 =?us-ascii?Q?IBZrHoLTNhD3JYjxXLg0oONz0ak8NcodTIbf1pNRj0a6p9GNUS2SNmVzxsFe?=
 =?us-ascii?Q?xid86n4IFj9q6mXOguD0m/V7HgkLtdC945Wu9jKYV0tVTFsQPdD19K/bp7GI?=
 =?us-ascii?Q?ixsCyztEIFooRayVijEwhgofOctsCyzEyhRSHA6zO1oDjcDP7YGSGBc0eIOQ?=
 =?us-ascii?Q?z4p92e8ZYs57nleimcWKVVSCx77+8ZUeGLUhUr5y3gfUKeWFOxMnafCVBUCf?=
 =?us-ascii?Q?oOMXTh/KYwkBa/p3yvjvrX2Q0qYD8WIWR8gzZrTNoVKQQnwdtr4xzKtMkaYf?=
 =?us-ascii?Q?hiqFZYHOhyZhIsXAguSoOBFT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7548ce7-cfdc-4206-8c74-08d92c02ae58
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:27:07.8023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0IGlVB37dau35M6GMVTUBAQcqIlojvNHbug5kX4uT/ulAbimRbRc06bOw4ot0Ow2C+/tkUciYVE1LszyqpHbVo1iN7lIyF7Y9MFwzOk8pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Define scsi device to operate with it by qom-set in further patch.

Give a new node-name to source block node, to not look like device
name.

Job now don't want to work without giving explicit id, so, let's call
it "fleecing".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 12 ++++++++----
 tests/qemu-iotests/tests/image-fleecing.out |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 799369e290..961941bb27 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -70,7 +70,11 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Launching VM ---')
     log('')
 
-    vm.add_drive(base_img_path)
+    src_node = 'source'
+    vm.add_blockdev(f'driver={iotests.imgfmt},file.driver=file,'
+                    f'file.filename={base_img_path},node-name={src_node}')
+    vm.add_device('virtio-scsi')
+    vm.add_device(f'scsi-hd,id=sda,drive={src_node}')
     vm.launch()
     log('Done')
 
@@ -78,7 +82,6 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Setting up Fleecing Graph ---')
     log('')
 
-    src_node = 'drive0'
     tgt_node = 'fleeceNode'
 
     # create tgt_node backed by src_node
@@ -94,6 +97,7 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     # Establish COW from source to fleecing node
     log(vm.qmp('blockdev-backup',
+               job_id='fleecing',
                device=src_node,
                target=tgt_node,
                sync='none'))
@@ -125,7 +129,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     for p in overwrite:
         cmd = 'write -P%s %s %s' % p
         log(cmd)
-        log(vm.hmp_qemu_io(src_node, cmd))
+        log(vm.hmp_qemu_io('/machine/peripheral/sda', cmd, qdev=True))
 
     log('')
     log('--- Verifying Data ---')
@@ -140,7 +144,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Cleanup ---')
     log('')
 
-    log(vm.qmp('block-job-cancel', device=src_node))
+    log(vm.qmp('block-job-cancel', device='fleecing'))
     e = vm.event_wait('BLOCK_JOB_CANCELLED')
     assert e is not None
     log(e, filters=[iotests.filter_qmp_event])
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index 16643dde30..314a1b54e9 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -50,7 +50,7 @@ read -P0 0x3fe0000 64k
 --- Cleanup ---
 
 {"return": {}}
-{"data": {"device": "drive0", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "fleecing", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"return": {}}
 {"return": {}}
 
-- 
2.29.2



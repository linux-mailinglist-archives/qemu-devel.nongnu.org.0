Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA1438B221
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:44:30 +0200 (CEST)
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjuX-00016V-Q1
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjaR-0007nW-KG; Thu, 20 May 2021 10:23:43 -0400
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:23109 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjaN-0006BI-NP; Thu, 20 May 2021 10:23:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/zH+mhLnlAjtFHUpQt/uI2PYLfU7CSGqazLPqvVnkwee9Q6ZBRo1xrCiD1Prs0Z4GuZJAKmUhe+ctUMcut0r5it/+V5+P3mhHwOCpSJtnyJplsKL1m/+YFCuVbzcU4lOdtV9uv3mlClywLhil5XNGVBjKarsIpB2UwgYYo/3FuoGAqeIVWomfmxDekmuvoog5KnwKsbgZZDDrJkKLttbuy7EVEhRnvTHDV88v2IyyjGoUOn8Nm2Tn8XM2zakVRxRa8Lyof5UGAbGUVZGF+TJEYDBxQpsRPKLtqcmDb3RLB0ti8jSMyjXq1s0VNYERmumUKR/zaQVG615XryPgZHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dogY3lg63OFTAwwCEBSRCJZAmX9fzZcCoQad7tCD4U4=;
 b=bQ5D+NPVfhawITri5IsAee+YCC0PuftbHVNjMADAPwHeFPSXPuJ0r2aLiFqXfJUPWz9myNoxok/hn+Q7i/C9PHRdteLQL//OJyvuXbi4RkeB4Roj22zLpkzhhQ8Vf/KmEo7QGkdw9b2YTRPLkUhobwitMlbUMiMRKfgYLKapnBURdBJCEj/SeEa7mCqH5BuGHfMzjZpMmi2JhZuAQ/N6TezbTJ/ooGQnE0XqbaQ1/jT+Syls1uwhccS0Qs0L/FT0fEZSz6euogFCpERGjfEasVXLORA2S47Pvr809+oQ5yZDPbOZSBSv6jmOzaHQSM+Bz3Ff99LJ1HhxGYSrV0tJeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dogY3lg63OFTAwwCEBSRCJZAmX9fzZcCoQad7tCD4U4=;
 b=Y+PWkB7yGnWXPQhXOTM1QMRu2+7QbRxphEIPTGNJw9MNDQyvDOAVZVDstm5n+EK/0fHxuQHb9gM/jcdubpkEh58jJsoaCKiHvK6ZFuzVcUNQAvSAyb+19OgPu8Ku6BcykAlB/+BJAf9J3ZtEnzAOPPQpEH4rv5+xeh1/Uqet6/U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:23:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:23:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 30/33] iotests/image-fleecing: proper source device
Date: Thu, 20 May 2021 17:22:02 +0300
Message-Id: <20210520142205.607501-31-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:23:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8fc867f-fff2-40a8-9452-08d91b9ac8f1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB407285FAAFC2B46E5A39F7A4C12A9@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K7dYRdXWTqs3qyeLZ6WcQPPrVeK3eFgsaa3BbqmuFxCe24ULPTChKgAucYPf6lEeVYBhgmR0acuqTVWinULyMceEFkFthO8gSkw4BLBh+rkp4/IfD/Q0yB7R13XtoOaBJyixxaTIRtUU0E/JXtrk4xrs4jY8eRHbAskHJszjqgI4O7v0i3GeNQgRaeG+wNXIa5QZaAgQaSwmvCijffv7+gXi9XqixbuEU5imGDL4QYp2YuayTqgdbCBg4HXUpA8uO71mnBKqMgJUlyOb4LRwigPxNARrOWjxrVtoLfkvSSDoL5bENf3Wf6K37h08Jg7YiqQJW7ojT7mtqRXy0U0HF2miZbTotbF1YJqz21ZF9ix4wKpzNRxmmhpDgDihxrIfnMdoof6I05m6VIsYvzWPVwnjUGTKc5f2scuhaFESbK8a1l/DVd4H3HVCi2aV4vW48NuGEj8rBZdW4YxgbLioGpEMqyJYgJi5XJQnZ4Yn4UvmB4ukfK3EtUhEf+6z18OWNMrESQ4j62kxwTnJkjDLPkCBpolgil87/aQNLTx42slAmL/AYq+efze+yCTvZPVl2amKT2JD6RLijtecm1UZnMCOGMqHnl2YFqJIrH20YTISHH5etgMKssy0/6vryf1fBb/00PUMsqKBETU4CN1lDmaW8ItNphmxYmI0e/6Nt7ZhtXJItoL2DSRUBLhaPOxY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(366004)(136003)(376002)(956004)(6916009)(16526019)(66556008)(66476007)(8676002)(2616005)(6512007)(66946007)(107886003)(86362001)(7416002)(316002)(5660300002)(8936002)(83380400001)(2906002)(36756003)(38350700002)(186003)(1076003)(38100700002)(478600001)(6486002)(6506007)(26005)(52116002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eRw/Vizh5n9ZM8vKBWoJlxRTkT+k5LBghkyaL3ag6LCkDojghAxHu5vndDpg?=
 =?us-ascii?Q?Z347YkVShC8l5dJDWKlveFhuUnHns3eMgViA4ctQzZ6h2iK6tb4v7xZXwFGP?=
 =?us-ascii?Q?pfZxvME9T4Qh554KZLmHjQxI8RtQJ8b9QajLGa4pK3s7AIfoTtiUeGMFEFq/?=
 =?us-ascii?Q?DF7Gi4sc6MiDA6ZhwWBnfZ1iwwz9z5+KSixR1nRERQmzbPC0PTSotcYYNtEI?=
 =?us-ascii?Q?1J3bynrt68kb7Dcx750evqj5adUN65Mvua5wKOKGrENJpEV/DIbcGDLN+vqT?=
 =?us-ascii?Q?qR6Nwnv/VIBl4Kxm91Bsee1c93HyTmz8fDWm7sO33TbqKbIJm0/qkIhvC2fS?=
 =?us-ascii?Q?04ZdWVI1Ne88XLGxRqxxiVCAvxtVh3sa4oXj0AFuCzvriu3dLFoqb6WHfL4C?=
 =?us-ascii?Q?TxXdN9MOR8uZ6wGKizYTIWFDxKL2OB8N+oe8jkubTYLek5jxf574NdccFP61?=
 =?us-ascii?Q?rchZIAvJDUmZ4fo7R/KDuQRBAbsf9iSzhNwrBtDWuQcYswvAh2W9JPS01tNx?=
 =?us-ascii?Q?cBRuI3GFI7vSuHmaWNBNKCcMQUASlo5+UVOwDZiM+YKM6EkIdUb0q6mWkGlX?=
 =?us-ascii?Q?nOnpRKYibhU1ETIgc+E6uLPgyadWeEVpetnbYLxzYX83+74IfR8xCRf327Id?=
 =?us-ascii?Q?rNaj6MoAvWqzIRkw9N3Q2MMJAUPAgPwVMBUJj5pA6FE0S9fo7hElq48nZA03?=
 =?us-ascii?Q?JVR+tm2Z+zzYlq15p+ktYzLorgunmDFYJwSHbsb5O0+knSl4DzfANctjiXUL?=
 =?us-ascii?Q?wYYKix4fygY0Y+FyoOIqAbLl6J1LGXx12xuTEl3nSTQxY+9S9FYemSSj+8pO?=
 =?us-ascii?Q?MtPeMB55BhC1jrn1f8Aa24pD6I+trseqVTDBrV34gcauhKnEmjsymlJcp5or?=
 =?us-ascii?Q?vFtOLNsDgZ5MTgxkzB7CyUd2sY/Y/dDWfXiGBwc/EPHKaEhDtSNykPOUAH3V?=
 =?us-ascii?Q?908z1+aTxwpw6ujKeNwyQvhzT28uLUPORtEyrgPR/sf5o8SqlhaEuA7Y96o8?=
 =?us-ascii?Q?odgizy+b2FZk/t9hrjsjbWPUsp8JlKifsOB6XzofXY3PXKicEdeVtBp05pKg?=
 =?us-ascii?Q?Z8JbyHA1z/E6x2MbGXUOSs/+Kj/90tuYlzmyxsX80hsZi2jcy5pPUc2GYlQB?=
 =?us-ascii?Q?nzRYNS6hfnlIYKZy7XqfeobcENw7fH8K4OY36V4UN5npqW2M3+JnTzqmPxV7?=
 =?us-ascii?Q?sL9vbsXTPdE7SqtYi5pL0EAEu1tfmuX7sL6ANhQ0SOtaRJIq4pgprldLh/Sf?=
 =?us-ascii?Q?vsil3Nk4gL8CHDlWcX2ziucpKS1N4SkhhOtIC7JLgepEfpW/Gl9jOVt++TvZ?=
 =?us-ascii?Q?mIxOQEkPlHa2D3QwZapr80Oa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fc867f-fff2-40a8-9452-08d91b9ac8f1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:23:06.1079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uy4ydI8wAPg/1nKrYk0yAnmkdWBBBnmYa0FAjCOYs0EDeHzN4wH1ftneGCxK3loK19CooNOricWrdha0erQ8w68/SbJrGTOho4IRS+y1oiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149173DFE87
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:59:10 +0200 (CEST)
Received: from localhost ([::1]:51366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDg5-0003Lt-3j
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDNV-0006nn-SU; Wed, 04 Aug 2021 05:39:57 -0400
Received: from mail-eopbgr30127.outbound.protection.outlook.com
 ([40.107.3.127]:26086 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDNS-0006y7-Bs; Wed, 04 Aug 2021 05:39:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtzNUvclUkLxOaIN+ukTTHyp/Cffv561rFNBW6s1T9qMIGDRscTnkQOATO4KtWfnmFF46ZMviHushrKaqMor/mqbZnPCzXyuyL8iDIFgf+jNNYX4eWuJSrFqTb3LaWLZN2JeNTtJtjMfdgMRZ1wKZEeTfdfwvxi8gIcoQ00Gp6l9joOoWZOsdFJ6tFbUjqakiCoSKUPaniH3X0vrekSzEQ8FxN9Vo+Xo4vyWLPtNwEGIXGlM1p1WYqLVEs2fk2An2NmaNDadvvkyBAxlA8QPDPU93FaAMdW0anBANGLTN4x3OW6/zu7a6mRilDIBSObL4PowMcUGZB+7Afz2yVVjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R10eEY3SLa3JfenTqosr5rslG6Qb5NWVOLL6711tuGc=;
 b=U7Y1YU17sDDrqSNqxWzFG/oSOgZIZCCASrGynVt/f0OIr2r98tVn9hsdOB9ixl//jH1qHnIrFZqZlorOdrEI5eJ3hICCPbOo7GeQMldQfhhd/RAHsyNHceBrMq4YB1ZaufR7133UrtGCTj/TB2ygTe3ycNn8UaC+38lf95clFQ2gJ0P8UcshncePeNceW2H0WrRapQ4N4PXkwpH6HkCDIIRYj4zurWZB9bj/bIXuVG90iiZ1Wwndf1z0FMIDjXI6kcrnyP55umpD3r+uYII0kxyVaRNuSvkWZesXG9KkYPYqxC4Yu3w38gz3pAmkxnwZvfUZfoRCiNMBB77PtZouWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R10eEY3SLa3JfenTqosr5rslG6Qb5NWVOLL6711tuGc=;
 b=flF3E+FBpgGTunB2f3BBIas5INT23NE+BpK/LmwQBUneFMZCLCLgX2InphjaDk4JUfbHBUN/WnwDh7O/6pv/flFGElGpKZym1WEEFbqPIq1uf5LSXhAs5r3mjjaYE3IM0+KWs3j7g50OmhmhHo0rM8m6v/wjLX6vWPpEjifghh4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 09:39:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 30/33] iotests/image-fleecing: proper source device
Date: Wed,  4 Aug 2021 12:38:10 +0300
Message-Id: <20210804093813.20688-31-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4c0902a-7524-4320-67ee-08d9572bbc5f
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5336DDBF7ED9C223141943EBC1F19@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QVQ26UxlECSAW415Yq01UXDzL3cabsxB/RRnGznlPVc5D/LAELWzV3lkk0FWJ1JLi0rKrLfmq8K5Mp96OtOuP0Brk5UrehNVJbCr1J1sYFQWUphoQACGjHhHEA7DeWKiYuqOu8DegxGnFzs5/TpytMnKPuO4ufIfY3II7gMsaQa/w+ElkJypPknGTHYIwm0nptrkJQLgr129vzg0e6mT/iBQzAAneItd720RzxzdtU3b+M0/+5HAGFc2ta5znQ5BzSORvt4fajdclwdY4b91MoXfjZy4tDVQ5kF4UQH39FOg/iVts88Nw98cUskctJEFk48tDweSTITy/RszVJbpEJpdQFva6Qa5z8aZYLK5AG9cv4IEsLDqIf/0qnVmlKSiDtPDNZo+5ATX3RxsfrGT1Nbm4TuWGd+gYQzHjGyS3He8gK1jovhF5VqJ1ek/cGMu8oDqztMKIXhIwE2Pq9CCrIYgxwKiKOla5Q+ClIuV6M4RkjtIre22MoVB6X57hb+wJBuJb49at96f7cDOGrXAsDDLTFMUzwToq6nYs+78w9nH9Y4JG/RfUQLNy9RMRg1Z9Um9pNSUIekDAObuBV1NWrGGUwKa5krrhpXXsYAofs53GxRFjCa5XqUns6+2Bu1QJdITG0xs3jgUTAxtqhNaOaPu4OZ0+Qn73dmYC1V7FriDdWfzjRzhSEwa3LZXjTJqEH/kZGOQ1jJSLSnIbr8Q2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39840400004)(396003)(316002)(36756003)(956004)(7416002)(2616005)(186003)(6666004)(38350700002)(86362001)(6512007)(26005)(38100700002)(6486002)(1076003)(52116002)(478600001)(83380400001)(2906002)(66946007)(66476007)(8936002)(4326008)(5660300002)(6506007)(66556008)(8676002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/bvQNIkrC3ZIo3JhcZh50MdUofxZPQnk+faEy0mlPkbwzi3ajB80ZTarWP7K?=
 =?us-ascii?Q?yzOgBZKvpXiXKILWPAO+ADmRc80CuJ0EruN6yXPwYNxA05crrTAdoUOfjb38?=
 =?us-ascii?Q?kN6DxNOePHyVprK7BCpSIbZWXyUOXQGwJiOziL4yQRjISkoOyXg07VN8VD0M?=
 =?us-ascii?Q?GL79sFI+lZ62HDLJtANbPI4mOgG4T/sy9Vn0M39jrEwBJIik/AbbgI+S3PGQ?=
 =?us-ascii?Q?4ib/PqpQiFAvxmyILzyHfHG7OFAVByMfUiJAjoinkxdouNFLVVR2idFHEmSW?=
 =?us-ascii?Q?kFRxIBKWavw1fvY9g7RkiglFxWkX1ws1nGnPzd6ClX1pzkPCH4yw9Ns9G8ek?=
 =?us-ascii?Q?zLJx2c5A5VW0ZhLqGjPz7QTjSwBTg14tx4Kdzmdh/GEW9x4G9dlPZmH+S3lr?=
 =?us-ascii?Q?ABBcqZ6uQuBM6bHnbSjRJ3qtdYZadXZn8ToH3hneXKyeJEdHcEIBOaY0yA24?=
 =?us-ascii?Q?8F468mJXNykXpIMmL697lb3FEktoJp3WnYROZmojsMOW/umgLrG95lNJEYj3?=
 =?us-ascii?Q?cMckbq3YNDCRWq96+UTGHKE+DH2zhtz7Qjq05nz7sHDF1IvYarjEOEtHz7iw?=
 =?us-ascii?Q?PsNKvEI6I1MZwe0Ic/GbDqaFGB6JZv1UqkXE4cqRNWXmpvqlq7X+fR87biKC?=
 =?us-ascii?Q?+bE3pmsNNSvJ7lMY0vlVSQWngsBAMDJwrMmTq1elnrtGwbwwtiQ5sSIhL7c3?=
 =?us-ascii?Q?kzHpExxv14FwzKhnJj2Z0mbvannrQoeUd2Wc6kNd9/aGNDM6kmkm5JVD5+PO?=
 =?us-ascii?Q?i4h4bwONZGXAL1wchEUwSYKEs76pkdklZT6zd9R/4QmQXyZno+RqLgkNWRlS?=
 =?us-ascii?Q?wioJkBbMnJ+9rrF1yLnoxR5Id0wfRNgqoobJqsyr+DWWAYSp5vxxPxFxJnhW?=
 =?us-ascii?Q?VjYwwXQBJLsclB8TjY5oAU9zoejUm4capYkOXlf5xn6zx1NjbrGcTMooQe6l?=
 =?us-ascii?Q?YmUT7HoxM3KvajmqiU/YmcOo9HZqrNkB/Z5Y8UJHPOK1Cpo5IBpluIFRRZVb?=
 =?us-ascii?Q?xYPPFyEgOKvKcxwoj/oOgrMJooPf5vyC/i7uARibSEP21AG01jr9fPwKCqnX?=
 =?us-ascii?Q?Gux/XFeWz7Gp8MLU2JxMBdHDTbnNhIuB5ivBaTjcYNcaan1B4GKHaHWpXbNN?=
 =?us-ascii?Q?wzptLbAnyf1GSCJIcuf2+UwieQT8RSvybxEWbEv0y0vgSfWUPXvFW1qUQIZm?=
 =?us-ascii?Q?4IfgMGZqJmnvxlCwjDfeaVbNU+4wgz/JjVYGI3/T7LCku0+jsmaRCql5s6x7?=
 =?us-ascii?Q?sS64V0S5S9Lh/BVygU9gzK+l1eraciICi0hVikxmmqrwYGMkhsXzV6SfqNzj?=
 =?us-ascii?Q?04KkUMm914RFQEW/q35hvuis?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c0902a-7524-4320-67ee-08d9572bbc5f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:20.7146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnBNj6cWo/pwoFG0hXYHr+zxu61vU8of89fayQ0S5YT/5yQyPONkjWZyzREtfrhlSX5ekxY3Tts8To/TzYSItSCE0AyhD7QgiS7qkfMv0vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.3.127;
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



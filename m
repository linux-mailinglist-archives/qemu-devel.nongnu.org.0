Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF663D0C65
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:26:55 +0200 (CEST)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69RG-0004mv-Cl
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697x-0008QT-Cz; Wed, 21 Jul 2021 06:06:57 -0400
Received: from mail-eopbgr40103.outbound.protection.outlook.com
 ([40.107.4.103]:3138 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697v-0002NL-9S; Wed, 21 Jul 2021 06:06:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsGOaWjmKQX9St7CSHOjFE1+7QfNcMXheNxJiI8wuDN9NELrOoqWsmGUqzbsZZy8WzNO73GcMwOVtTfvGwwYklYKYIcly/GXsVN0K45JdcQ4PbzpgoChh+37POMQbhaY2CPBKzRh67kmGinl1HalBJE2nxZuNdSZDKTnXLgAJ6m/3Ghs9nxVVXn9jGihAhkdPd35013uooEQ2I0g5m+6CYFCmPSwhgShbGtegcEpwi0H48IwC5cLbnHLbQUuAQWAtalfRR1fxtC+UtUJra5cYQjdu90DlpYaLnA8XPJ8FBbudhtURixGUrkngiMYDRkWtCI3uLRfIFMhQQIHBxIsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfTynrtFoOtQlEZdXbg/sqJjKgrWrpnDM9PaHle0IOc=;
 b=KdWwHcjHivvWDXQfftDQnX1iJDLolJaey73lWJi+cPkdKEw/xXr+ro0gT3ya9pzG2E+WlYOWq3MHbeqnQC0FBJ8Lv/aOHrtDezY6vTT4RM6ggPZi6oKf7nY17CM6tUhCI6VBmIwykLEsNJopgPwN2iOcv+tL+oLaJuSBQ71QVRoaB2QbFdjnHbXOmNQ6AsU/4uRNFaqfQDd7CR0dbenPn5+zhJM6lbR83sku/TaccHcYkU2Gov5MEq48Dr1QdZ3sfxRA++CHowMJR45hLZFzGp2zQrtsErFNSDNd24bNWTlzXecf5iaSCwvmu+BIMi2ncSvwBrMoN+f5WA4eKX4J0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfTynrtFoOtQlEZdXbg/sqJjKgrWrpnDM9PaHle0IOc=;
 b=k9Wuh7sqW1qKAsg0bicT054/iOQJtz0cl/Pc0Me3B1s1ztSCI0QVgLtSrFl8M7OfCVe5UTyEsErIYdQt/YErnM4jvlfvbhXy7LR1bT7T+UmZ7YQW9kdfoS4s96H6+d6uq8ig/SWcQYBOpg29RgWWyhCHyVyKdG31KCkCADfm5V8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 10:06:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 31/33] iotests/image-fleecing: rename tgt_node
Date: Wed, 21 Jul 2021 13:05:53 +0300
Message-Id: <20210721100555.45594-32-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61e8fcd3-ac06-4156-036a-08d94c2f43b8
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB591133FA958A9F25315D1E2EC1E39@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VIgeO33Dl+tOAZKiwGhbVII0BwwSPs4bRgR1TNq4jWxM0ya9Mv8QkpU1oWzrzoSbb1CdDlVcviSalAWO5rcFb8UXuPgx08YRh2+Om2M/oDewAGyHa2eoAouuuz+TAIbFpnTwBhO6Zz3tkYo+ZoW8MQy9wWwe9dm9bDoJsvw2Dh/VMP788xV54sYjOPhagrRUGyJ1rzk4YujigCCAkyEEDZkEiDnz9AwvUFR5truyX0XOegzWygOiBIjUp9402Esd6XazQsTkySOxfM0YMW0SaKrkZLeHJoHoV+rCJASD1GsdhxvYrsn/jzDtyewwUbjqHvj8T2mez9wJxnsp1WTcL9KMA/kI8pTHMn+nvQaXHrPbmKa1iwJWXtciuhxnqhuUVx8UWoeM3/r3slPiMf1oYtcdyK0MMdtLDLfdv2As4Ak+TmT2Z48rkFOzulYLdaCNF8hGGoONxf2qJk0X6i1qmS2pnvV2Mn7b7GUwKKDM1bBw0pTBimHOUHEcSzHM8Kql85yJ8Vxo7o46JmPhWm+x+m2y+fdF+10MxkndXcw9/RCsHWe7aVnRn6qm6p4V5OGBuLQm0dJLUrC5pselUVzPoK32qMocsbjhVKQwtuAVxxd1WGusOTxkj99NcUCmlqa7UfBlyxmfYZJmgbzXd7rRwBQl2SFNYK/8YfZO2D12IkhPRWHeFjlyBcTx0h9O2gg556LaetEceibffuWyBweXjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(66556008)(4326008)(6916009)(5660300002)(7416002)(66946007)(6486002)(8676002)(6506007)(6512007)(2616005)(1076003)(66476007)(52116002)(36756003)(26005)(478600001)(83380400001)(86362001)(2906002)(38350700002)(38100700002)(8936002)(186003)(316002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fGQFYldKFqio4QSVd66lAy3dJ0PUeIrGzvEZGYppVF9CaCsbhXazbAWCHosk?=
 =?us-ascii?Q?kp5JyFPr1m8LU53WQfT2u2y4YN87FE1ZfP9TD9STyfiinn/xcGigl8f7nssE?=
 =?us-ascii?Q?3ZbBl79OYyfplaCGP2JUHNBHlx41hFGEP3gdg6JX8Ara5DACFPkcIwF4CG9A?=
 =?us-ascii?Q?H45VmrCMY8AzFRw1Zn8LO24vnZbh+jo+TlPV8bzYRRPWqrUmHKPbhcp3QD8D?=
 =?us-ascii?Q?bYeAAt9tbemQL1tjxfVUb2R7RbdB3+Mn3UTE44y/GaMJCzPI6UQTPcwCjE1b?=
 =?us-ascii?Q?GFUO8s6GBN3/uMGTRiWzX/BL1oOIZ+XKmZ60p3+5dxOzJkKoJHtwSPMRp2Q+?=
 =?us-ascii?Q?1gtqbZ6J5EIik8N0S4ImxD31A0regEwg0oRfjXrpRE0TaLom+N6019ujfkYa?=
 =?us-ascii?Q?v1TcgCjtB4xw9cp6Mvfumx6irmF7XcDWqFGNqV5YqPVyLB2DdpYgQGiwRtvS?=
 =?us-ascii?Q?h4VgsS/gtAyD/M4FlOfwzLnxlzD5xj6KZNS+qbUk18PIXR0PoICkVmqTcDcX?=
 =?us-ascii?Q?wKKYR2+Up8VtBg5pojW/qJC0DYHPoWThcGXH8OUrFpiuMTc2Z5l4WJJAcMJ/?=
 =?us-ascii?Q?fHwVgSaIWIKgPnpxWhPIakzDCJbIJU7gUOnj2bPyg1ffX8l/1eeCLVQa6+Pr?=
 =?us-ascii?Q?JevCPHUgUTX1pOVE/pi4JTYX8MxXDS68HwNeg/q73iVj2eWCtNST6I1EM5f7?=
 =?us-ascii?Q?O3OYNN4DcR8zU8mBLyo94RshBkY76P0AJ5uJbZHHvBilRTcbqd51XTFyQQj5?=
 =?us-ascii?Q?Oi+fDK64TPgjoIdDloYXn4ZICCliK0zUac+xJ/0yUdO/7M28WAJwR18ALoyp?=
 =?us-ascii?Q?/G+oxwZDOPYAI8gY3XD+8USTIXe1iL9fG9fpovqAkS/GZlNCs5whwwt8Qhq0?=
 =?us-ascii?Q?dPnVuZwaYr43wESl4SYE6AvF67nYt4i7SRppx6ytg4xg1YdtYvn85zFZEOrF?=
 =?us-ascii?Q?fzZpCu6RmFruPHD85QnRg5WoDUKD2GHby7l/8s+V/eyQMfMDGad3SZ/yj+6L?=
 =?us-ascii?Q?knYUtxsjA5j/JqPKj2rS0hQ6GPZpHAzFHnmqohl3Yov8lpGhydAYat28xE+B?=
 =?us-ascii?Q?7+8FlXkys4y5pd3ubHcNwJH3o+OsjdMPF3QDmRKt2HMyepf0Qw5DldWcl2tN?=
 =?us-ascii?Q?Znwex9HcXg/OdQoPL/rWhOQuEx6DVGUvYoAlZ/d7rbDk7Ibho/4HUPrWq61f?=
 =?us-ascii?Q?92qhCH+6eZobM7df/6WsfA/hpGEo5Vsz0JoA62ZB7FlXWZODjmCUgvCeE/8t?=
 =?us-ascii?Q?J/9HjCYw1IALjvWvHfm1HyzU+g3ptjdzKTagweqJ0QTP0i0NoH0CJGd335pi?=
 =?us-ascii?Q?dd0QwtUR0pKvBtPGdCUHcQiH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e8fcd3-ac06-4156-036a-08d94c2f43b8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:53.4187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMdp+CqTGrmk7a7E3Ix0kp05/6GEoP0EGvSfhVPUthUuHBzFN4jsfny+ADxEYsmpxsmW5LjQ3GDkYM+vYYOzXS9P9MEyQchHMHfQ1sptWE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.4.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

Actually target of backup(sync=None) is not a final backup target:
image fleecing is intended to be used with external tool, which will
copy data from fleecing node to some real backup target.

Also, we are going to add a test case for "push backup with fleecing",
where instead of exporting fleecing node by NBD, we'll start a backup
job from fleecing node to real backup target.

To avoid confusion, let's rename temporary fleecing node now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 961941bb27..ec4ef5f3f6 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -71,6 +71,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     src_node = 'source'
+    tmp_node = 'temp'
     vm.add_blockdev(f'driver={iotests.imgfmt},file.driver=file,'
                     f'file.filename={base_img_path},node-name={src_node}')
     vm.add_device('virtio-scsi')
@@ -82,12 +83,11 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Setting up Fleecing Graph ---')
     log('')
 
-    tgt_node = 'fleeceNode'
 
-    # create tgt_node backed by src_node
+    # create tmp_node backed by src_node
     log(vm.qmp('blockdev-add', {
         'driver': 'qcow2',
-        'node-name': tgt_node,
+        'node-name': tmp_node,
         'file': {
             'driver': 'file',
             'filename': fleece_img_path,
@@ -99,19 +99,19 @@ with iotests.FilePath('base.img') as base_img_path, \
     log(vm.qmp('blockdev-backup',
                job_id='fleecing',
                device=src_node,
-               target=tgt_node,
+               target=tmp_node,
                sync='none'))
 
     log('')
     log('--- Setting up NBD Export ---')
     log('')
 
-    nbd_uri = 'nbd+unix:///%s?socket=%s' % (tgt_node, nbd_sock_path)
+    nbd_uri = 'nbd+unix:///%s?socket=%s' % (tmp_node, nbd_sock_path)
     log(vm.qmp('nbd-server-start',
                {'addr': { 'type': 'unix',
                           'data': { 'path': nbd_sock_path } } }))
 
-    log(vm.qmp('nbd-server-add', device=tgt_node))
+    log(vm.qmp('nbd-server-add', device=tmp_node))
 
     log('')
     log('--- Sanity Check ---')
@@ -149,7 +149,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     assert e is not None
     log(e, filters=[iotests.filter_qmp_event])
     log(vm.qmp('nbd-server-stop'))
-    log(vm.qmp('blockdev-del', node_name=tgt_node))
+    log(vm.qmp('blockdev-del', node_name=tmp_node))
     vm.shutdown()
 
     log('')
-- 
2.29.2



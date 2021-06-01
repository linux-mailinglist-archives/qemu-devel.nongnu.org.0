Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BAF3978D1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:10:14 +0200 (CEST)
Received: from localhost ([::1]:49726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7uA-00088l-2E
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c7-0003bd-AO; Tue, 01 Jun 2021 12:51:35 -0400
Received: from mail-eopbgr80123.outbound.protection.outlook.com
 ([40.107.8.123]:45134 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c3-0002el-4B; Tue, 01 Jun 2021 12:51:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLlBP5bSmTJiWlHAuT4fZ3hrx+mRw9vgHSJ7T/AibgG3nMzpw5FCgQTYlPD8u71W9AfYfrKz6SVzkzUM6Bj7CO4wQ8wGCBAUxND9tVwB5mRyz/liTcrZTClxebsOg5rC8lBcdwRr14480NE4T43DM9yCZvot6csZeKiAticIudVG3MrKizciOmpa8bgMQbrj5Cx4iC5wI2RNB5Jr6jmDKlVA9hdW7YvrEF9FAkFeLJFK+CYs1pg+hv66ZqmE3n1dtDnB7LD2K2ptlrYMfTc+KKaLidZLSXGRMcri/SSrF3EKxruRPMw0HaKDBk+c3dW4/h9RcvRUD0vfE8XMZG82BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfTynrtFoOtQlEZdXbg/sqJjKgrWrpnDM9PaHle0IOc=;
 b=EJeFabu5VnbZhoCayXNGhbWvDxgPOUdiaqd7YY4vwjr8SnUG+UMWL4vAjQ58iQ7K6n09K3I9/aY5rVirxIEu3BIESmtmPn2fXP8JsfhYgT+VtYBkimHK1I4JIFv3zv1cocGJt06Tw7lxngVSlL0i6DcCWvBbiwW15ac7kK7U95+cZ0BUkUxCO83CyKl1eBf04L4SrcV7ii6tCZr93Q7a/KgT/0Ap/s+WhUTp5dynXshuIR5YRkt/QlH4UOqyy82ZdLKYa8J02nU1wABvYCr1rlVPCXVlRY8NORURleeUvvT5WvOra62crTf+EvB892Hi1ENIVhtsl2VU+aRe0c8MVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfTynrtFoOtQlEZdXbg/sqJjKgrWrpnDM9PaHle0IOc=;
 b=hW0lBonyCtz1uzDStcNPqwM6egSMXJH/n/9rKHNjexXeV7aqaxuTF6hqUjcll43b7Nylu9bcJJwJxKKqlpXz0DZ6Nxi5O5rfi4s8Q6JjvmYWTQclZ/9dT+evYQVfqrY4GXXaPnJb1Ez/fqVc+rUIZuKulqShAd3Di9Tg2MLVqMI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 33/35] iotests/image-fleecing: rename tgt_node
Date: Tue,  1 Jun 2021 19:50:24 +0300
Message-Id: <20210601165026.326877-34-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15399f4c-d6a3-43a0-275b-08d9251d7f8b
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652B4DBFBBEEA40C884C366C13E9@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 94XHCTSitqmbNIeWROgEL59oPCG6kz3S2NhYM/9zxHiV00hWyJro0AjYHs8ONfPuiqjjUvfEtdikdaxRYRBHltp1u4F3etwui+x8KocBrijgKumR1+oR9RqFxsytJrIoC+7gytt3WfVLrwxRUxw2JJDMHRZV5S6DV5Q5Wi8F7bi3OILhKN04uGvzNH12kRMdlorXFrNQFzPhBm21s5PgOs92lBtNAZscvI7Yaq4bniAzw/3GdZhhiRaxooivvIO+veYnKdaPLV+V7FO3tFhHfaWSl6DuQaOu6M5W+8tnrkZBlg36mzNcsmG3R2Rc4YwAEJz/jmELrRz324W0qKG7AcHazDqKGzVrbo8BgQrPyV59gdy7o64jt30FSeoZRN8eAn+ZHRFzFa2pV0sazb+1QU1ukt3EtILluNrCKvvpD3z0YflECFzCGlDhJNYOqToZ6Y51zLxuBhHkNLc4WWgoCjdKSjk0o4k1oLW2jl9oRouwQX7dH/v9cAVh5xPiruQwclB7+LCwNgBPhIihU60EPOIM0fF82J7Ke6nWSqlpLEdC7F+neHlWA3h7nXnucDmb8T9HY9rFi8M+ZMq1TB17Ham97dOIAGc0oWJU6KRKVPHrpciwgs8RjGg0EH2kNU0uCxg+8C/4/Tf4q72rl/zZCGlM2W0nem3DLVWXizdB+rWptvBjSrJo6jKJt2DHvXap
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39840400004)(52116002)(5660300002)(2906002)(26005)(6916009)(8936002)(1076003)(6486002)(7416002)(4326008)(478600001)(16526019)(186003)(38350700002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(8676002)(6512007)(316002)(38100700002)(6506007)(2616005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?82pkhlWb0vD7R/QKUJPNaKdriSqRFPvWZgWE5fwSPxkwftpxMM93uQbNkZH1?=
 =?us-ascii?Q?xF0Y++jkDFpqxI+XLQJcv6liWgB6/YsnRHwXl070A8wTTlD4Lg3C5RagtolQ?=
 =?us-ascii?Q?5LEtcAgUWgAW8oT2S7FyqklEaibHIwbTd7RBYK9wn86jGaqaUvPfnxX5a/2s?=
 =?us-ascii?Q?drM9umuWEbAHaWdJn/0isE4hBe8vVwbZXJWAwnGkGFiSu7ISX+pXkeWR6QO1?=
 =?us-ascii?Q?Cm2uNQEfPOk9zQK1QTjLeS1QjnnNhm/zbAxC9Vc6sM3IZv25AZrEPjiVvyGl?=
 =?us-ascii?Q?MwgYTYp5f7b1D1ZjIInLN2rCm5H9j9cFwXei2k92HGLLoLsunGq9nK01Dbv9?=
 =?us-ascii?Q?O3fVTi1+bXq+2QCl8w6/v/IeOdLM92NAMQn89ntc3rXGsI3dXVKu9IBYdqum?=
 =?us-ascii?Q?2s7aUz/yqsVi6R1EcSH5MVx/trcRBnpJNUTLct2/oq05XKDa4D28DR850xV9?=
 =?us-ascii?Q?AKJA1c9vvUV9rnrE4Bd9TfhDw4RVJaFQbvZapYEGes1jvq0jd6t+R8G8yfVd?=
 =?us-ascii?Q?bkDoJ60HzbeECCa0aytSHoDhm05IIM9r2iG/lzGdahjJdFuGKhwvN9zRHP8Y?=
 =?us-ascii?Q?PxshyqLs3B+MiN0g6BEbUOhd0+Ehvnh0AHLeWxtPWT4Q0bKym8liWXjzd7gT?=
 =?us-ascii?Q?58R+9M+FV75BHzTbcdcEPmvxgGk3zTzLnvZTBAn2lzLmbzDkrw7dSLv5naJk?=
 =?us-ascii?Q?59ghUepfxjc46e9f8TekZ7gTQ6H6F/xdEX/xAu6WjdeUg8/WWq1T8UhFxzjP?=
 =?us-ascii?Q?4ja0uqJKe43AWBg2Gx5RLK3nvkeDKBabKOoc8Dj/C5/28mIsBlFtZf6e+/Lw?=
 =?us-ascii?Q?CAEiaALa3szQDdY6G4+2v79Zu6DRbhWQieF99LYID3sU1w5n1sjTGhkqukgw?=
 =?us-ascii?Q?umZL5oN6vL2mqGJ/XUGN+6ngNHVpoGdxX+hryvMQi84GKTZXAryQlbxWi9om?=
 =?us-ascii?Q?GB7UG8S9awos3gQ3KILst+14B9JeNWrWFcc4iN/niuAaUYjyaqePwiCpHF+2?=
 =?us-ascii?Q?aVrxW29t/PoRaYUEp4FDwBRP1Y/mdd3K1SsWZ0xgq+Tqsx2eHyJbkqtT++FH?=
 =?us-ascii?Q?/9IX15YUi3x4s6EZRweus21CQ+XYINm9atrNb10GmM9NEkaXBTWoOEfxOYxb?=
 =?us-ascii?Q?tPnJpYArRaMOrFBq7GxZVWFUm4d74SzwV8RB6bDgUQLVcAw5/gWk/50pQfCk?=
 =?us-ascii?Q?yObw1FhldnF/7wOxqYRq6CeA0d1nMFH4FA7mclaDBDUml93B9NxwAVf6IuKY?=
 =?us-ascii?Q?VJ2iWjLTczOmhMOqsAM23mQrl0BJ+PaYyGt7bpjREj4OS7sPj6/nUi9MC/FM?=
 =?us-ascii?Q?4V5VYyFeubnWdttB7BxcT511?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15399f4c-d6a3-43a0-275b-08d9251d7f8b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:27.5055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kgUbHJ/IoWjX7C87DqWHt9Ja8//NMJ43N3b3cT6JTfcfJao5G2W+78EjE30xDyargpFiBII8XfSH4Kd6ascz6roRUW43nYZV3ykSXQ+CSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.8.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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



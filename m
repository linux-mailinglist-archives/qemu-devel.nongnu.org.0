Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABB238B240
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:53:05 +0200 (CEST)
Received: from localhost ([::1]:51780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljk2p-0003r4-HV
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjaU-0007tR-La; Thu, 20 May 2021 10:23:46 -0400
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:23109 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjaS-0006BI-KX; Thu, 20 May 2021 10:23:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMy9djxV4LjZ9HgNzEMdhg+La5tnC/wQ5qVzGGxJ4zSOv7TsmP4zLp3oT2Pvw683oZS+u3RmYI8Ug/qQl2Sk6mJNaXB30vqxkZXObsZyjlNNdhkLpc2SJwqEFQpVseeCbMgcOihipRW6DQNI+TkhSEob3QsFfLNmT1pBTmhGLgP3AM1X33BqQjyZbB6tzV3diSV8Qhub/2fn8AFFPKtA+G6+fzuHfbspu4nhTlTL09yDunvCjLBlrS3eguGkq9p3jl7yVDHOMEVUq/hgRT1SA4VJ5Ktn8ebV2yJmgFCP3AsQVqQU8BJDAlRhk8guNJoAra2XXpNIay3h+PIbYir18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlbMree13J2dxxmR7xUGpcyyLp/p3lTBbpgQcRzF7JQ=;
 b=g7NZLX7CM7ij6bffFi4PXgAAQi+QGi9yo7UfxNhMnYDxhY6fPcIJmwm3fY6V00Qvr7+HDCQ8LLgX4aykE1ViL2B4qpPWRNOKsIakdIYLlgZNKN1W8xNKeBWoE8iKomWJRq0Pw3fvT+ISRD7HrOXrNdIu3zzVfPBmgPhpfMN0NPX67qas6vYZVnmp76Rh+c+YyKnL5gRB+CqI/WrxPFhx4HtsEX2MgVM7LXyljWyIUDc+LyFy0zC/jIRN1nbBCwAxQ4+Uq0PpbcbQMvvPzNL//roKWYZbRgOev9A8phniwAiRWFzb65ZaecCNVM4OhiB10QmUHaNeL6hrTKzbpB3Mzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlbMree13J2dxxmR7xUGpcyyLp/p3lTBbpgQcRzF7JQ=;
 b=tNVpZZpn5Ebz3RJSM5yi84yFWpkr/29H/oiJF4xuGxqiZdZOpcfinl3kLQwjuQe1EZuyWYyrt/Pi20v7auk5dvb998M9BHw7AwQK0oZRaMBpymaN22yhREVXdGglMEvxfiiIi6EOyoj7wJ1GHj7ZgWQEN35Zpkd9dpBHmTI1FrY=
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
Subject: [PATCH v2 31/33] iotests/image-fleecing: rename tgt_node
Date: Thu, 20 May 2021 17:22:03 +0300
Message-Id: <20210520142205.607501-32-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:23:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 172089cc-b2a2-4fed-0da6-08d91b9ac9c5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072CAD94F1170190223E92DC12A9@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xx8SGsrMk3fyno8GlmM+nt1xbsTzjNBJHLh4UiwTJ2Daz4H3xwc1Jn5u5HeZRGd7QVhASIkWE5Jxv8h4O93JdIesbQWZILGC8uP74X3zzrORvRqiSK7KfA6U4kSC7XP4U/n/13rYAieS967evMBpcrBdmDLtXNrO9MDUAWfKRbLWjg81x32c0uJyqqwmJZcGMW917ABs1Ozl5hrH2RyPDYhBjsdpCW9npz2cooFixRpo9yNTft+oc9BOh70WMxP4ydeintojEbcP8t3iaR7qBLGJbi7uZYnN+5O2MThNvU/YfOyZAtz94CVsagqg053y8LMJTZ1oQz0ob6yEMBsRtZi+GU3H8wP16xA6O6mhtCLeKTOLt9ogWNJFsD5dxrvnwWAvWotc1y0lxG47CzL8lzL09DOPB9GadVUuUOGLaNgN9or4TFvYCGsNsqZ/gJZSsA8iNFyJ9AZ3PSvdkeQVcpd6M/7/U6VrTq9w3ToYriYBf4KY8nOugQIYe08oWm0uWzl0Q6u+I65LGJO0bFEAtU65qbvF0fQizbXO8rQ1SvVPuX6jwFOWEnigzlhxN3x372WCdIWW76tuHAtY5TnebxqJL7unwYf19DPMwfExaBL4Oo4L8aq7OhaKIjeGwQYbYxm1IQYBX9Epwr9kEjMpeOyh0mXoXI3GrDc8ZIGPnAfy1ZMO0F2b3ttIqdYDYMNz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(366004)(136003)(376002)(956004)(6916009)(16526019)(66556008)(66476007)(8676002)(2616005)(6512007)(66946007)(6666004)(107886003)(86362001)(7416002)(316002)(5660300002)(8936002)(83380400001)(2906002)(36756003)(38350700002)(186003)(1076003)(38100700002)(478600001)(6486002)(6506007)(26005)(52116002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EREnGuqgaWVi1u5bQ4UeY84LvHAxM17PjpbjFWiHzwb4zyOFitfDuYzFxkL+?=
 =?us-ascii?Q?OsI9yHIgYMlsjCrQJxcMFRDUHBrpnXXtZ+G3vlrPwalOw6cC+StL3yZpXr28?=
 =?us-ascii?Q?eZ/QayCG+EOYkecFhqOGce+krbETEkgsNjhN1mye5fPw3+jyr7lcjXfCI1Mg?=
 =?us-ascii?Q?Z/mclxcI3hW0p/8zvQvAqnwY6xdh9wzx77MTs436SfIk85xpd6wsUNpQF436?=
 =?us-ascii?Q?BPz1Wk0uIDh7px3v/IG3li9bPnG77+f+D0tCd4ux6kB9sxVpl2iLjRQmrodd?=
 =?us-ascii?Q?t54UxIwwXFWmwsRAyrF8F69Ch+Efohs7C9ljnEC7B10yD9n1trsD8vQRNEIy?=
 =?us-ascii?Q?/JqrHM7TrrxoFH53kEmFJqFVaf23QEALhsC60fnc4NNfZy2r/cajIDlTHl61?=
 =?us-ascii?Q?kNHr6maloTTFkj9NvSDPhxddMTIYYJ0FwXP97hno8goZ9URr5M1mjh2gOOdl?=
 =?us-ascii?Q?/xGsXpQLZGd5ngHXPhaJFk+LYr1MMdTVXw8hsht7vBBeneMJkmNI1rgVht6y?=
 =?us-ascii?Q?xbrHwLmL7SzoJe4b7r+AEuRIIPuu1oVrsVr/Bhv4OzEAJJUJ9THH4dYjx051?=
 =?us-ascii?Q?KdewlokC7JtHTp2tn9QLwANmZSom3FFaxym1/F2xNas9/rZ+ffEUFcc+2vbA?=
 =?us-ascii?Q?RRvv7EiAafNXrkn/BBTwQG2hAfO0hhc/BCw5wigS8FjJDfcwUGW6yXuOIOEO?=
 =?us-ascii?Q?o8DGr1sZDlzADuaGDCnEgWrMMjQqdfUy2yZxZzAdPofRYDz0DedG0tFXYHzA?=
 =?us-ascii?Q?6IEniVFNkrH+qNMN1UGW7dnZthPWsEb0Pgcoqxk/ghgY+ZjG1V/xpK/6Lh2T?=
 =?us-ascii?Q?zfHHAo9FYxzIvlWAkMiDW/WEYoPP33kOPuCTqzA7gyXjmy1bGVIkrswGJplF?=
 =?us-ascii?Q?lWIMrF4nIRDzPfdOVFDF+XK44InuW9bQSmDLXn60SWw6LrRMKbihbZGtVfxu?=
 =?us-ascii?Q?eSBOEI5tyvn2aTpi8aQ0vWCw9rLUOxjG0YTOolt+s0m6HkB48IVgXIYoHC6I?=
 =?us-ascii?Q?q44wrbCGUscRvDFeCQ6GOee8Stvr2wGQrD306oPV0vyS8RNTks3ExxidEEIF?=
 =?us-ascii?Q?rXCE9HdA0G4ok/OSI2cbho15oobmsBL3H9v4nT4eWpG9OJfudzQyo/P3f6n/?=
 =?us-ascii?Q?e7/mgQ4igS003uhN+/FWQVFhULZVs5CWfKJW+4FelCNEZQWcfhyI5OKyqdjH?=
 =?us-ascii?Q?TP2OXAwB4h47SK4i93O9Y2H+x66bKgr3KLxSFHf2mim9RnV7SfU9/VoD7s81?=
 =?us-ascii?Q?07hkUsEm0Kr04xA378JfJ7g0Fsy2WTAlSk0zELXAqghZ6qEcHPgFJ+mN66Sq?=
 =?us-ascii?Q?Jj36I1ZlGvxqL0D7QQLLQaiS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172089cc-b2a2-4fed-0da6-08d91b9ac9c5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:23:07.4848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qguaTs2fs1oydOoohV8PFHdPXabVaxXd229kT7HrZN6P3C0Alp7SBdxwlC+UWPETCRD1OELQG7uwsuC7qhvawSXflD6VTNe0eoIduSgZHAw=
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

Actually target of backup(sync=None) is not a final backup target:
image fleecing is intended to be used with external tool, which will
copy data from fleecing node to some real backup target.

Also, we are going to add a test case for "push backup with fleecing",
where instead of exporting fleecing node by NBD, we'll start a backup
job from fleecing node to real backup target.

To avoid confusion, let's rename temporary fleecing node now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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



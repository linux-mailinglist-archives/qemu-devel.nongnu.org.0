Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8513BBA0E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:18:51 +0200 (CEST)
Received: from localhost ([::1]:37274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Kkc-0005lv-Sz
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki6-00026V-4i; Mon, 05 Jul 2021 05:16:14 -0400
Received: from mail-eopbgr40109.outbound.protection.outlook.com
 ([40.107.4.109]:55110 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki4-0007tK-3Z; Mon, 05 Jul 2021 05:16:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IR0EswusXv75WtMah2PW/QydcnNoYTMUFztDVtlwAftuhKLXrceyWLsho97ThzCtWvVlac6C0jtknedC+VN/c2/jFMj4WzkUbMjX/08CfovQYySeloFQJdZZZWZ/2gZ+3BePQaEQqnegvqRoVQuFk2qFi3DIKy2UND9/Wz6q/dcyNANgEtGnt92pTvKNIW5qB26vOepGDmAaqRxH6n6UA073OArMLo4rnynclbId5fqMocqN7iMakSq4m4e1tK9Xv+1TdYVF/f1ehMxdyvcWt5BCHyY7tOeyxUIT6P/79nSU9nK4DqDhiucfUb3UuimTLAZXQ8Xhrx4w7mP8DWIlRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6quE5hHpYkk6WlTO465bSuSJvb7twXFdvnrcct0mFTI=;
 b=mpY9JD43rXB5Dh2JqjiBqZkW4I34w2j6tCADaHP7dsI5DtRkJLFqs1feN4Rm/2mZvX32An1Go8029SP5MuG4zRuoXzX2l4X/2ujvrrmZe4Ez/QLVvrIy7n2kScoUcVkJKJAQIZjz+g5kpQpZu4SIztGUGFFrGcbLkV8sZQ5oVGQD5DBY5v/ikWo0OlklqqxEJz0YnbT0UMiMGWGypVbSRr51pQHzaAcedhYJK+oZmRgc/D+RON3DX7onjUCt3FmnxWU2uQBEHCv080gnCqD0mvMzV3FZ9HyDFi+aIZxFmyE5NmZk+apWRPyLcQwU3lE8SDctr4vYlH/Dv3PCzAvDfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6quE5hHpYkk6WlTO465bSuSJvb7twXFdvnrcct0mFTI=;
 b=VKWllncZb8ImQb/VDQtqi9ujYMC1rDTJgDg0STgX8z/KIFfeFaCuMJ9HUeRUp2L1CzF+0j66GFILYUbWz+nkSK/gp5VxFeF3E9UtKH0BbA+FKKWKgGrFMsfX6LxiI3+dAv0mPV8dtA20exN8MPvbfWD2926cQubCCv8Vf4AEpVo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1714.eurprd08.prod.outlook.com (2603:10a6:203:3a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 09:16:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 01/14] iotests.py: img_info_log(): rename imgopts argument
Date: Mon,  5 Jul 2021 12:15:36 +0300
Message-Id: <20210705091549.178335-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02830565-41ae-419b-a7f1-08d93f958448
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1714:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17148B4315DA1681113A1C22C11C9@AM5PR0801MB1714.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aiX3lnVAM3a6uKHcURyt8rV56OXMWGcEsls+WVp0RMyFZt6D4NNhyRcFDZRW7D7YJrbWhX35kfbVwmeFxwAC3nhUb2CaWy5I1penZCnOBBoxLCdYNURkLhwqwTVIsIOENF3PocohQ5qZlNGNQGUSIZ/N5FYsYZ1oZCXhEogjOO67yEmqEXaMZZ1bZk6j8Bwa/mD0hgwnkgdCUncun9QVBkP/p8DQmYT8mgkWGSTE+zx9Lq88LVrq9gTr9yxuLSesmC8p3DkzQMqdkipvxntEepGg/qnGhe+ti60EsU9Xlhpimp06Zb2bRnos5eUKhmVBIjbQAnZ+78Uf9CAWxZ7nlsBtQVUMRGu0kOl10EIxvRJrxxJ6RZx8wSgcl5FVyV1Dyz8NaVLWWCAw996yxtG2EPPyOZ2VC12BIGSU2YWuuCjk0nEA+x/7NAIuvjI8/TA0gNygtSj1WMu56FdOsATpillakgMQCZGErA70orzFvsos4TLf+WS60fAWt1DKqA5EUeWSWJfileF9Vi4P5+azEJLM+lwCu2XT0x3kdiqrTeKug1AB4vQnSqTZtsO6xwaGT7vVw11HkKqnIGdPTw6AVWxfNaZrfBnGE9hEe0D4CfRbxj1RpNi+8JMRBjai+25RGoP8BFq1FF5M983UdFmu+ZhL9O74mc8OtiJQOXaWVlOzUkoJGYTSECT+Y+1ApZOi2QpT50byMSqmEFx9EdGB/m6Sq1uL/0nEtR2+OdUVZXEY/csfVSUoA8zth0ImB31u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39830400003)(366004)(346002)(376002)(16526019)(186003)(8676002)(5660300002)(8936002)(1076003)(36756003)(956004)(2616005)(83380400001)(38100700002)(316002)(6486002)(52116002)(478600001)(66476007)(6916009)(26005)(66946007)(38350700002)(66556008)(4326008)(2906002)(86362001)(6512007)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UszmeV88V8QXHYvzyS5r+WQ/zTiyva9k7oC9ci/vzUnwi3svERg9OcV/juR3?=
 =?us-ascii?Q?3GhAOWSsTZ+VrMxb0810NJPN2/06cA+vmTNPrqv6tAOZ1/UEVH2zmm4I/cie?=
 =?us-ascii?Q?tg6AYUNGZVqgtY5cGJxzNcyp6ESfSejMq33NSlC5EYjBJLIpzmK1NFNDy20I?=
 =?us-ascii?Q?SfOEI6NQMdLmLRNKuW4OJBTPN9EK3ZL89DgdVDwjl80pPt4SR+SVBIbQcZ4b?=
 =?us-ascii?Q?WKTTcAbEXUcXrjLfiSxQcTFmm85pLcY5aoSv7i6c0uv1m/xh0/tLrQFYcBxw?=
 =?us-ascii?Q?OfpGRzEWz+O6ZVWy16kByA82b+dkiQE9iDct3XkAPqfJmzAMaoOmDy+pPoQd?=
 =?us-ascii?Q?0tdlSO8ydnP7iHakxfb79l1xueM4mIqm8H5L7hIRk2RuI7wlAhjvH790H6gP?=
 =?us-ascii?Q?E9C/l+okzOh6EHJ/TVo55kY0rPJeGvRD017t2lsGbqlA/ax/pESmIZ32ZTZf?=
 =?us-ascii?Q?I0LkP2ngPOmAVoU7hvV6ApoG+T16U7R6CAjzQy7VtMr9NfG31+DDcQTPbNeR?=
 =?us-ascii?Q?dYJV6gFrzt9SgSP79qHXN+7M1QFF/SQpYC8YzgFNeF88E1XGqgDRLg9Pfyht?=
 =?us-ascii?Q?ePBpadNhWAmI+wND0cKEwmSAVdPyDMhUPm7gFdQ4toXEeZ96jtftsiizmb9P?=
 =?us-ascii?Q?4ZXLotfYAq8Urg/NKDOgPZnaOQF2Yy++1S4PIpr4HS40TZE/q34uixQ3g2LZ?=
 =?us-ascii?Q?yJXdEtJ+tsu3RCCciChRw1F83CiqGnP27zqDqRyECQVG3cuoM/NsXtSEIWDp?=
 =?us-ascii?Q?nOErv/8hiaT+oDKySxDzcDrNr9SZJvxCLQuwi53D7zE5nf2bBmzWoSFfYsSN?=
 =?us-ascii?Q?YYgKZxjtc+KHNcdBbxsb72wrtTkJH1R5ltBmjti5/8QMRt/1VcH0EQWaHK7C?=
 =?us-ascii?Q?gYsiGoXMeI4V6Kc7EG9VFfAql+6Pr+hYeGrsfJKjdVl/6XYLmj9BSQBm7XYs?=
 =?us-ascii?Q?KkrnSbNuGQ+AKWty5kJarQQp5RAnjC31yn7PrE+5ROKpbc6v5ey+kh0aozz6?=
 =?us-ascii?Q?LWcGwGM0+b19ebSpakI+3PMRnFdGQ6t+DEfHYThRUWqUcE0D+GoGc3tKRWml?=
 =?us-ascii?Q?JFRl7VH692y2bTBfAGc50sJyVmkYl69munmJXBkLQzz7jfGpUdsiqwLkMLw2?=
 =?us-ascii?Q?H3B80f53Sx1oTv9qoNnGuoW60kQQ3sZ9hpChidPPv5DcNvLE9gpfiqaI/SAb?=
 =?us-ascii?Q?c8OEK5WOiSBOqo/33EYFvDxKmST5uR/T9DzL5KbNeRZeCtb/1/cvcRN99oPu?=
 =?us-ascii?Q?TomfTeZDYjt5OKvo1vT8adQPh5ydvXSQIgqsCFWmv4npGHNcAuinMRPtX5Ic?=
 =?us-ascii?Q?VzTNdRdowBVZFJXGDEB6DbwM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02830565-41ae-419b-a7f1-08d93f958448
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:05.3757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6EHOawbIsdYR5XcAZK5xzNOdgeztI/DhaRmNW80Qc4RsBV49SPVizpZXiPZs0qmdoMK0faQFY6Sz1jsu0rjdKD5YwWP75tEAobg86nil6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1714
Received-SPF: pass client-ip=40.107.4.109;
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

We are going to support IMGOPTS environment variable like in bash
tests. Corresponding global variable in iotests.py should be called
imgopts. So to not interfere with function argument, rename it in
advance.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/210        | 8 ++++----
 tests/qemu-iotests/iotests.py | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/210 b/tests/qemu-iotests/210
index 5a62ed4dd1..79b4967225 100755
--- a/tests/qemu-iotests/210
+++ b/tests/qemu-iotests/210
@@ -62,7 +62,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Successful image creation (with non-default options)
@@ -96,7 +96,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Invalid BlockdevRef
@@ -132,7 +132,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Invalid sizes
@@ -176,4 +176,4 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 89663dac06..0d99dd841f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -187,9 +187,10 @@ def qemu_img_log(*args):
     log(result, filters=[filter_testfiles])
     return result
 
-def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
+def img_info_log(filename, filter_path=None, use_image_opts=False,
+                 extra_args=()):
     args = ['info']
-    if imgopts:
+    if use_image_opts:
         args.append('--image-opts')
     else:
         args += ['-f', imgfmt]
-- 
2.29.2



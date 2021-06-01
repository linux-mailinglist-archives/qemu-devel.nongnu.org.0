Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B73978F3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:20:00 +0200 (CEST)
Received: from localhost ([::1]:51484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo83b-0003p1-NF
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7cW-0004Va-0h; Tue, 01 Jun 2021 12:52:01 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:53678 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7cL-0002xm-4f; Tue, 01 Jun 2021 12:51:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4z0ktTKLnfSjwMLqwtsJHjPZ5PFp7/sulZXDF6HP23G6S47/gz3+rcORkdbuzOjMQDu5QmM3TfIexYcB6OvVGNGAE3Gquut2G2TfE54ZEi5LhdYfofgSDx4V8F22FWdJG5hQlfFxSwFN4hGjKEri4ysY/LlyowkOULtnpIuQjnpkfHs9CFA617ENJA04q6gOChRRuzbc4KYFKaN7qzvyknOayX/CoRarmATvwM2FvQgnOhMOZNnbVZuAyHZafRUY87ZoCISCFAQsnRysRPJF7X+Vft/QWUN5RlaCMjXVbh9+iTInMZfrixH+oMfyrSQhGTsPjisGiXeiO1Nj6tBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fdt/9kXHN1yQLBrMNRdUEjvnHhIP48yC5QLgDEN0ag=;
 b=PkR9k9hvWfQff4K9mp9Oy+8oPTiivHmgrwKMWAVOqknrXl02K06gIwuqgVFUaXxMWtiGOrnzQUDvDsLQkWksVhQuy0fyq5tGVPlWfmaRXanjAv2Xy/ST6KuLenGSjCx4MllhkFkFg0B4tPBFIicuZcsyPHWCbIrJk6t+EmcD0e5AHQp4bxSOqqZrx+SP7cznY9bzKI3O9RKT6lv+9rWgmeGQ0GfqxuKmoiqbCif49/nAmMrLAfyYQAcfbwbEtjfgAmvzycP6jw2VOEmCIkSAkiUxxDjCAC2MATxk2e4OdsV5W0JUTZTf2Kk2/g2OpBzM6c6ynUgPR70pjcEv6cc9Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fdt/9kXHN1yQLBrMNRdUEjvnHhIP48yC5QLgDEN0ag=;
 b=B33zWrmwAwJNDwEPwGPJ0CL40BA2T6FzYRScnp1DE2chEy5Kv6ZNKxXm6+4O1dMKPZBtQ9Qsq+kWLtQylVEV/3hfT17pKme8U73vuvLybgl/7N3hfQkfDIfikuuu0lUrIobMozo5tOD67dpxSfr9acyjGnqdlqWG2t6gw1tu93k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3864.eurprd08.prod.outlook.com (2603:10a6:20b:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Tue, 1 Jun
 2021 16:51:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 34/35] iotests/image-fleecing: prepare for adding new
 test-case
Date: Tue,  1 Jun 2021 19:50:25 +0300
Message-Id: <20210601165026.326877-35-vsementsov@virtuozzo.com>
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
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a718ec1-782a-491b-8638-08d9251d805a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3864:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3864EC8F1EDF2D3BDD4FEDC4C13E9@AM6PR08MB3864.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sRViLvUf4T0gWaoOntE3ddBsfYA62j9201A3Co9qgm/M5CvMUiei7Ev5xVgRp3yE+A9TImzR0yjnWzlnbEJziOa1KnLNWjRtYOaXJ1iej1T7/llGtrSO6KwRgfIMLns3YRrlcxQPOMB5zd7mc0pS4aCdh8Ka6/BxdyUHwz5QHsUMpwm3yeUF4xYdsxstraqhxTZVfDIU6FSqir8SKC4aoHo2cq68rfB/yC6dJ46MFwhE1xbXY3Rf3BAS7lBrmsZx8QkkrlIOLMKDL4jNd4mcFnS0pm8l5OUumQ6FVT9guswYaG7BrETMkf/jOfPrg9FEODxbCiA1gvyzLbx5ANfTJRkzXA5mYtT7TRFux+4OZzbnSHsq+09dwyqNWyhS64Rh84rmr0/iRrWphH+zqlzz4dF1is1Tfn8bi3GjvxtSv610qmGGnMqvq6vCUDpZ2MWAoBybr5CTs540afjJposZpe1rd3+43mJRKZXyH9g6lQU2g4Mi0gRuoUK2KZULJTvwZ9H7RYyF+YeS5Lwj3ZOr1oL3xl5v+xO10l39Qnuskj2g+hSJ4aCo1Tyk7CVlJLxh0cZn3k8eEcbgZbxTPuvEV4XSKkWmoasf3nQrgk/4/+ou7PgEbJxBTVCXh7G4Kv1+iVYr3wXMCKfwPDXGF4ngZPmwBIX9TuVCcB2xrQQMKg2GFxhePVr/NLvj4A4hcIQv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39840400004)(5660300002)(86362001)(26005)(1076003)(8936002)(66556008)(6486002)(83380400001)(478600001)(36756003)(8676002)(2616005)(66476007)(6506007)(38350700002)(6512007)(6916009)(7416002)(52116002)(2906002)(16526019)(4326008)(186003)(316002)(66946007)(38100700002)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZaiqVf2By4EB2n/GoCathWcDyTUdTyKlxMjLX84iisAqHlcJ0tM+Q3chefKm?=
 =?us-ascii?Q?RYzKEMXfnV0r5lKyj0z8RpnOgCy162YGpBiaj+kxg9ijU8HrAje6TZo2hfi0?=
 =?us-ascii?Q?EhWmXjlPVFuMTy7+f2Q7xFitBdEeIRW9eSu3evOgV4zw4ezktiuHuiAp+9JE?=
 =?us-ascii?Q?Ix17CrLTjtU3NZSp7tebly1fN9G8ZWtpyrot54Jrv8/IFZcVT7DSaB9zCfnz?=
 =?us-ascii?Q?wh4N+s/WQ2sIewZgUp1OJ1XDhh7iCaB0C1CG5eqrO2UFxMufMwPSv+xAE5WH?=
 =?us-ascii?Q?2HsHCvcItIMCg0uMnqNsmY9yR+lo7sVdtIixR/CUeTYVqyazi6N1xk6LBnwE?=
 =?us-ascii?Q?oJYd+zDiDDVxXrjz84K6NHR0bfNQxIScNGPv3KwhKfnKEfu/seiTgWXTuwUX?=
 =?us-ascii?Q?xGNZIXlcB4SLKtCsbXwTMuEfw72kE8MtIchXoNO6CBt4jSFfcmmV4go8CKoF?=
 =?us-ascii?Q?2PlDUePxaDxE9DxiAMhJjSoEIqLMu9JvgP74vK0kfm1mmC6H5VqcsSiXgdQz?=
 =?us-ascii?Q?ms9uobds3bbCsflMOL9JthArYkWh1JO0HEFNaUgySFaX3bm0buBp9MQC1UEg?=
 =?us-ascii?Q?G2Pi9RiIYxADD+bFK1H1lnBE0M6cOt8bmc+oAnlgHMNeFrDm75TLxjhUm014?=
 =?us-ascii?Q?w84tvlAWj5WgMnIbQUwcBnpABRaSYIdzHy78ItovXcFtPIMBBWGX66zWrbUW?=
 =?us-ascii?Q?m1i62NW2Jg/OE8xuxqykB96/T5TLIKl61vooCLQ3uP5wYuUP3YP6mV9br5OB?=
 =?us-ascii?Q?tHVVF4Lk4s2eMzHI6y5JmhqY39nYWCLqjRKddzbq3SkeEtyOISgdud0RcqKj?=
 =?us-ascii?Q?AAJvdPDbcePTC0D3d0ZA7NLToW+rxMx+I0pQTuGLvt/TMj2i2i9dx8v4iTxN?=
 =?us-ascii?Q?GGVrM4ssyhuHlsfCqyeUNlPxELpTYvPPGS2EVtXBmNF1fYWlbdtLaZ7U6bpY?=
 =?us-ascii?Q?a9JwoDeuURwxesE+m9YQXel16sNzj2Glr6yoMAETk7vMRMcyQLtTUpPomIVx?=
 =?us-ascii?Q?jYkN4/TNLIFN6YBQaVD9PorQc9zaZ36yA5cQv7ujLNyqyDXMzYiemFBSx7X/?=
 =?us-ascii?Q?YvK6iCF7DXPiVhYHpAKPMvaTsGLjsvDZmCMGCF4QUi34mPIpy1Ys0g+YHtsx?=
 =?us-ascii?Q?t6YV8LTF/XA2y2tcBVZfKb56m9C4zM4VOoozwmVf4E30s7dNPwd3nmDFY7KB?=
 =?us-ascii?Q?LK7RcCtOyyUBS+ue0N2eKhQhYnWtImQZfmsFadfOpNia6Hfz7XAnB///SM7G?=
 =?us-ascii?Q?iND0JR8C3nahWLNOLgpwXbnYKOiXg1W8picCAlQnnjJMIREdAJg+JWeYSIbG?=
 =?us-ascii?Q?J0baCTeiarckkn9joJCkSAIK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a718ec1-782a-491b-8638-08d9251d805a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:28.8476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KvM6wQhFWeyJs9NJxISpF0T1hqEF/cgseTBHGozR4xrzcGn81f3JFuycb2eqyjLtsENR1fX5tiz374NAP8dWj1gzgfNz2PNaaK5bswGdhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3864
Received-SPF: pass client-ip=40.107.8.111;
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

We are going to add a test-case with some behavior modifications. So,
let's prepare a function to be reused.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index ec4ef5f3f6..e210c00d28 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -48,12 +48,7 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-with iotests.FilePath('base.img') as base_img_path, \
-     iotests.FilePath('fleece.img') as fleece_img_path, \
-     iotests.FilePath('nbd.sock',
-                      base_dir=iotests.sock_dir) as nbd_sock_path, \
-     iotests.VM() as vm:
-
+def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
     log('')
 
@@ -163,3 +158,15 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     log('')
     log('Done')
+
+
+def test():
+    with iotests.FilePath('base.img') as base_img_path, \
+         iotests.FilePath('fleece.img') as fleece_img_path, \
+         iotests.FilePath('nbd.sock',
+                          base_dir=iotests.sock_dir) as nbd_sock_path, \
+         iotests.VM() as vm:
+        do_test(base_img_path, fleece_img_path, nbd_sock_path, vm)
+
+
+test()
-- 
2.29.2



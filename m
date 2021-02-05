Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E3310E3D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:58:53 +0100 (CET)
Received: from localhost ([::1]:54088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84RY-0003op-T9
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847K-0000LS-U6; Fri, 05 Feb 2021 11:37:58 -0500
Received: from mail-eopbgr20092.outbound.protection.outlook.com
 ([40.107.2.92]:26183 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847J-0002Vt-B9; Fri, 05 Feb 2021 11:37:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGnMlsgR8PGixJeFKx/dnyYvP98YTcIvJ6UWS6UbnTtUP0NC5FsKWtZOKOzoelc+KbTOqmCIpl3TPMMLZF20EUCoDU3yRuGMi7Rmucn7rj677wwV/BnIPmOk8t+w7VuBqAcNrkbzT94noIoSHJeLvAg2dNxP94pmyeEMjBndY5cOvUU07FI9eFfb0Et7hQvKvuhmtSU4N5A9WP7xd4p7owlbedH5uIoZkgKVyqpuNF/afyhjNp9m7s1f0SGljBYlDwyI2eLva7NhJf63JbCMhEVKrbmDB0+yJyRZUKbSzG2wg6cEz/lMGRpl51NFo5HEO8LKer8jh/zUrR5rjVXC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1eyboCeXTVqy6bsBtG2nRayt+GJxsFAmQotxqYVm/0=;
 b=Yv7h6mPyGqi7wBxeDqgTPWB2QuVU/vJ5L+1sPW6PC6DqWIkF3PiEMv8E2knsb37MnC/KkoXfHIlXNbtB41dnlC1qnij5gGfY2+b1xj0LYK+DlXFZO30IBgyfTEiPk3ZDq/IuB4NfqYRSEOi5Q/X2upeTsuBlRIhT/67LBvk4skSpVprKsVQg1X3x1iZlHU/J/ZU9YR+kgzmGutEXYDcGLHL9pXd7hY1GIUHP7U+iUdZrlz6xl07Z6I35p6eR9dfRqEtq8xwL5cDxN7zlrzEUvhP2NwViczpTkcr+KONtU8Kzz5sxtqfZf83qWCQmG/CgZR+nxmsQtKoH4qsFoz5Z8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1eyboCeXTVqy6bsBtG2nRayt+GJxsFAmQotxqYVm/0=;
 b=pZaAPpjttrwGZjL5dLrOGujHkSpYx+HplakM+t2FZ69t6xmAcfwiQU5jzYCktyCqTEpn/VEmZY/V5LRJ3znPKOHvhudDsjGafGbk1B0hi6RzdEKOOoPrBaY7QX9maj6lJqidK1FDbvnAWAcH9EYNG6faLFY6bzkG/W39x55JjVM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 16:37:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:37:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, den@openvz.org
Subject: [PATCH v2 09/10] block/backup: implement .cancel job handler
Date: Fri,  5 Feb 2021 19:37:19 +0300
Message-Id: <20210205163720.887197-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205163720.887197-1-vsementsov@virtuozzo.com>
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.213) by
 AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 16:37:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c6ffa23-fcf7-4091-d261-08d8c9f45bc5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4470B9BC8827745A468D0016C1B29@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TduRE37CLsau7u696gWkblMrFYap5Ig3ipw1syafBRD3reCVxE2VnXB0xbSJrLSLG7NzS3thFLddOcSlHMGrkrBDYZLcCcjhgY6mjtKCEXTJQStnU1MxQFmSXocaL0/ZDJkuxMzAxmnnNarxuQA3MVjDzFxXehO+Cj0ouQgiNxSQFmH8to4mmQHIYACEb719cyHPPLtbJUp1za8nlwYUgDqLey2ylv+Ar3u1ELcZXQo1OEfr6FADiyTbMsD6ti5vYfz/IFJADf6/1eyVcjFK2aNTWxIG/e/oGp14u44z9TpULP0g4F9kJtoWRFUJZL9K/EFh1nSGFtoGKn+hPlcH1LPE2eO21r7QOXabZQ9l7+mkLp9vyc+wnsE/gaPpdAbN3AX402ZoxN6b3+a5nV7P2ZxgfEo4gGyozYsXsKYRzd8acYVEOTJEj7PfGy5ljmjjV/73j0Jp8DudJf/AUcsQIzr1jtaSL6v5Xng4vtSB3D9pP6B2n2nE7rSMFx4Jg9TcIcZ+54FZtHjVOHQ3McNfMfV6+Fam+kNxyxl833xPH3tSeD3NYFaKdMt4UXqH12fyqPz74ifxTY8aT1bc4hx6oQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39840400004)(6916009)(4326008)(6506007)(478600001)(86362001)(66556008)(66476007)(8676002)(316002)(66946007)(107886003)(6486002)(83380400001)(36756003)(6512007)(956004)(2616005)(8936002)(26005)(5660300002)(52116002)(6666004)(186003)(2906002)(16526019)(1076003)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JpupxFhpL693KczEpDY93BecEZ/fe/4B/+rQuahG3bYUR6urOvQKgB1TTmhB?=
 =?us-ascii?Q?GyHqrNCsorh8CJrabtgNG7RwwEodcztn8fbkfKanyMrffvstkX7Um5RuIMRt?=
 =?us-ascii?Q?O8FIzSNzZToOPnQLATBIfI1Xqzs3NDVasfScQxzoaRGPavWQx/4P+Aw5Othr?=
 =?us-ascii?Q?v5EpSmgUPtcliOIkqe2ls7RWOCirxsK2dWmS3BIyvWaEGbwbueZt6CZRglpL?=
 =?us-ascii?Q?/7gUpdSz7iAOi/rAQtXrW011XwFCQIOMOvuRfkCpMKDdCACxIsgWrZcLK4A0?=
 =?us-ascii?Q?BySo5KgPtmzR8Y7YWMvSpxOy/Yttz59E03W2yC07Bo1osA/uwMXT6jTlEfp6?=
 =?us-ascii?Q?TjZN5tpfKugI1FT5GQ8A2ALxLcAfXNy/4RmjnxTo2dcGXiC07m5bvxaGGhL+?=
 =?us-ascii?Q?FDK7gZ0cSNeXoYzEiJvh5UZczjQB0j67ma98mKnu0phBnBk+t6JqzVCspbfE?=
 =?us-ascii?Q?DX9gYHzki8lFX5v10NuVJCZV4iNo5sLYr1mbKjhhwarVuKqZbeelV2uGX9r5?=
 =?us-ascii?Q?k9F/ai5utodI1YVvRAArp06iJeTjuM0WdqpXFJrHDY0kJUH3OBuXa7l8oSH4?=
 =?us-ascii?Q?eaeVcwTha1adCSLkhee0jMS7ohJdFPbauqRq76rgGDWBJjlxwxWqIPtkTgoz?=
 =?us-ascii?Q?AyUOuicijSH9SG5m5D0b+JPNg2ME+LQ9keTf0lwZlxPgXsm+NWpgjBGTXjNJ?=
 =?us-ascii?Q?+bYY1n8rNCk9lff/eorteuXA4tZGFtgO47IfGJlImlpPRAH6lTJzFdVJPeh4?=
 =?us-ascii?Q?8cENF2DNNJBkk32hVA/FiS/yi+s28wQofV0GZGEqTYdrgw8gVptwDC2UVSPU?=
 =?us-ascii?Q?jxFKbY/kH4A+TJX2TBbqZ2pjcFrjw9+ln/HITuldG3LzdlIBDYQ5a7gf8m5U?=
 =?us-ascii?Q?HlHsy8dlpkVmwCh6Jpo7W1kDnj0J/QtNmuF/NrfobNm2okqLVNmQp6tQe1/4?=
 =?us-ascii?Q?p+85DeyChT317B/FeE52QP4v9tUY7b7BtVM5xFV3UjzKAKPYhsuiXzoYzPb0?=
 =?us-ascii?Q?ZVaXiUMmQMkDJUeLCNeth8gYPif5y2FuhxQVZosLFbJPuI9a4Ao/UZEG88t0?=
 =?us-ascii?Q?sHu49Varzbbfddm+3vk5aaBrHzxkEt3ZfawNApTxMGuzfUHPQXkFOd7GvYDN?=
 =?us-ascii?Q?eXiXGFQQYlLbewP5vY3kTYrofV2O9dETgL+9Ukyqh4CclgiJIagb64qQtnOi?=
 =?us-ascii?Q?ityqDnakfSMzoL0fgt87NzjHDpnBPMEUkatl3X3YPI6egip5KRbljXw7/iGa?=
 =?us-ascii?Q?/LdL/QSBBh72+N+TcgqpsaQ9QMUEv9VuhnAOIP019MGbp6i0GcdRQA7Hi3sa?=
 =?us-ascii?Q?hHgbhUO1d7n/aR6hrlHxzzBf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6ffa23-fcf7-4091-d261-08d8c9f45bc5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:37:42.4846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flOaxuxQRyp3u7Kqestik5xVHKfqTsxa1Rb3OEcE2NDUZARES6gBmFGFge1/v4Z1+R5kgaSuSFNJgeRTSxDgXAHkoMEREWmElosMZyNTF8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.2.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

Cancel in-flight io on target to not waste the time.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/backup.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block/backup.c b/block/backup.c
index cc525d5544..94e6dcd72e 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -35,6 +35,7 @@ typedef struct BackupBlockJob {
     BlockJob common;
     BlockDriverState *backup_top;
     BlockDriverState *source_bs;
+    BlockDriverState *target_bs;
 
     BdrvDirtyBitmap *sync_bitmap;
 
@@ -329,6 +330,13 @@ static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
     }
 }
 
+static void backup_cancel(Job *job)
+{
+    BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
+
+    bdrv_cancel_in_flight(s->target_bs);
+}
+
 static const BlockJobDriver backup_job_driver = {
     .job_driver = {
         .instance_size          = sizeof(BackupBlockJob),
@@ -340,6 +348,7 @@ static const BlockJobDriver backup_job_driver = {
         .abort                  = backup_abort,
         .clean                  = backup_clean,
         .pause                  = backup_pause,
+        .cancel                 = backup_cancel,
     },
     .set_speed = backup_set_speed,
 };
@@ -528,6 +537,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
 
     job->backup_top = backup_top;
     job->source_bs = bs;
+    job->target_bs = target;
     job->on_source_error = on_source_error;
     job->on_target_error = on_target_error;
     job->sync_mode = sync_mode;
-- 
2.29.2



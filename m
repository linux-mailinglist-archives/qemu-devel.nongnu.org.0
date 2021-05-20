Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB30E38B1C8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:31:35 +0200 (CEST)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljji2-0006Wf-M1
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZm-0005qQ-RA; Thu, 20 May 2021 10:23:04 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:23648 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZV-0005Yx-Q7; Thu, 20 May 2021 10:23:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIHM9sUa+WBLDw97EM1yUTELVuDnRSzFlgW606hPizuSypDsQK418JskeP7DEMtEHZiEKnHsplk4bQaeWsNeHxAtkLMskCbM1wCzaDV8TRB6I1x8BqnqR4hLtxoqECMgeQUKQUa1i7xDsMP5hSv7GU5zNBXxTs1y2FbqysgmpPHBusGS2s/iTiL1GMSN5QRKIZMTG/XPn/8+Ab9BFU7mao+2/kJ2drKIlAwE/osjTZOq+0yJL+WkCDUtBnHqwDA+Gh5t8RNLngNJtwtozv5YNN+Bd8u1yE0Rw/ut3Bv2VRUvzk3sibs7BkilLRvJxukx8m/0BQmRsMZn3mit9yRKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4//p5N7ll/vHhmjY/CjreDZ/cNRAI1XT2jMBOZoiJY=;
 b=AMazi/dMCkvGbdAqt55Skx558alnZBmY1Rrqrl1drkadBUWeJ5XVdpG4rJqLThIrglC5ADHtOQfseEPA87R/7ORsGKOA0pJmaDbAmEUjFYxN4oYYmKQfwg6FsFBR+wV7uLO/o7UYJkaKTIBCE+/ZzZnf47IjNDYA79Xy4iUZhPCDWUVyZ1ig3mXIxXgKzfLwZM+gpEhkcEnxn2OkxVoldEg0UbfjW6nl5Z5L6ooGggwME96pGbgPiXwfQ28n2+jEFRYJg81+TWKUfungl7eHORisAsRTepaazYT47wnsBs4r82AEufn0ow03n05xaroRknJ/+QxkfvPqez18mMkz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4//p5N7ll/vHhmjY/CjreDZ/cNRAI1XT2jMBOZoiJY=;
 b=NuGamOgtbusweOzFB+rnouFYpWbIl+cFSrM9ZYyI/2i8t3pvfA9Nx7zCTPAv5ICSZyroTNx2pMy/A3bMyOq61PAi5lnu2NIIGdiPIAlYFbnQ/NXd5Ps2N5wmBaymEIuJZLvi7qqLAku3QQP/djunn0eShEc8j0Hj1IbUU7LERms=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7009.eurprd08.prod.outlook.com (2603:10a6:20b:34c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 14:22:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 08/33] block/backup: drop support for copy_range
Date: Thu, 20 May 2021 17:21:40 +0300
Message-Id: <20210520142205.607501-9-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 516be566-65ce-4fcd-a7b5-08d91b9ab5bc
X-MS-TrafficTypeDiagnostic: AS8PR08MB7009:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB7009697134DF6DFABDC028CEC12A9@AS8PR08MB7009.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZgIz3D/DhtfwMS68gdOm6J6pmCezRWD4YfpeRJ73/6spWu6YKCCV4DU8gCs0AUpcM5Bcwm4jcbUC9Tai3JfbPPuzSebwYYSj++9rqySCa7QsdUbsuDif03ja6kwux30U40aqgh5nuyzRuB/q4GEzj24qHCIIuiglqGvYKPYspuUPLrmz3NxG+VwhFLQcVdKQ+CN93yPSMFigvl60Apx+sIrXi+stQSNiPS2eJFhzZK1yiMtuO2vfQFL117D/6dxq8XarY93QjbmkX5IiIvcmDn7LeU8ezh3SQJ8XISDK/WrjrG7ZFgse7tmp0vjLksYesVkU2Y0pFuhRimX3VVYk0V9vBShDwnT0APG//b+ybEq6LF8jowtK76xfGCY2UOssCCnHTuPTv/L26jHvNbQNeFNZ7QlRMUYSeYk5IC3F9kR1GPOSGNfRgQu85GsPbl0pK6SdN7UiSCpgkfvPwL3vZgIVIK6aTIEFPSIXp8jRsefq3yNGxWzLS83fhTCOgY4vy3dcO2R0+HVJgDMewP2EQV1Z35ofA+LBW9/HFNXGM4B5s/Kv2Mmaq4npEH7qxDilo5BRl8PgrzeBgWRkPBT1MJiNFsYnmqWOh8TDFqaNksnoX7H2+f6NIV0Jdhx7UZgQ9RYfIyR2T6phoeKjhrHqHHoUvmi4dFXur+wtHHCi4cYp/2FDXEgPnUfjs+6BumWJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(376002)(346002)(366004)(38100700002)(38350700002)(478600001)(86362001)(6916009)(6486002)(36756003)(83380400001)(107886003)(8676002)(186003)(6666004)(4326008)(16526019)(316002)(1076003)(5660300002)(8936002)(26005)(6506007)(7416002)(66556008)(66476007)(66946007)(2906002)(956004)(2616005)(6512007)(52116002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?X1dAgxrOT/qw1mE15MKHul5mmWWGo7bj1YM+yK2VXz1NxfLGPF4uFL5uOLJt?=
 =?us-ascii?Q?8sp4X+37DrBWV7RwgTGar1yN7Sj2tJdo0cCnWFiSWPlGIm3Epi8DJdJewg5z?=
 =?us-ascii?Q?DRh8VF0Tu39FBMT6lmOhrINBYcpg6tBWfK82r4o58dTYIVFUeP0w4U3Aj3iz?=
 =?us-ascii?Q?j5oZXjNtGc/uJOw+QzK5pRXHkJIxXH9t1gO4gzvfDyaXR1vqNmYGeQxVk/K3?=
 =?us-ascii?Q?OU4z88RpIgFc3/Fjv+//FQ6K/eMa5jEWbL7Ve4B7xcvnufGtnSaQ8lYtbDxE?=
 =?us-ascii?Q?Tu1+XI3KtR+EEGq9pV3VMYhQ8igl/qrIrXcxIOc55tlSu1PckTFAKJtwywjX?=
 =?us-ascii?Q?NlCW6nA7DtifmNssa5zy3JhMS2JvWYeArhZ7tq+axecZt/IyJtPHb7/N93El?=
 =?us-ascii?Q?ANDzxzeneH4Isf+aTCZRfRPaIFBD2rDnF/77JEAiDh1vP/nWwaUlDJN3LPAR?=
 =?us-ascii?Q?1XTVcRVhnRz+2VNsbpfJYf+UGuUbo6GuWmQXY8bi5IjVq1eeZBDTZzrxaL8y?=
 =?us-ascii?Q?Onpq7aj8i+EeugpTKf6Mu8ZWpv5Idz0YA+PjFgeToIINtoLB4ofj/1yRytgQ?=
 =?us-ascii?Q?kWEIOYIyX/cTPmWFbbGypa19Ml9K9FVKF+Jx61pLUyE/D9NXnt3oQnHMRjS0?=
 =?us-ascii?Q?12feHAg5HnbUWToc6I+OuznLvSb/CuRs1B6GpqgPAcWFvcbV4Ae0+5wpV4b0?=
 =?us-ascii?Q?Hw1M8XwL66W8MJhvrVZah3V2lpNZojndbC9bHbRzz+XnYIyt4i/wykUKTlYR?=
 =?us-ascii?Q?jIqpVQLWxoKQy7iMJJEpRenwf1sZqmjQ/KVZ4nT6wXy1Eqmsbpotnehb7g9U?=
 =?us-ascii?Q?uVDFKgNzhNLb+sDgcsp3MzjU4vo+cHsOMCkhhcs7a93UdWRkNw5+TL7VnMRc?=
 =?us-ascii?Q?9zNeLFiGMWNFtc7kg44xji7CGJxsvQJak/VqCwMW2mF+TDZK0Ag59BotTc2m?=
 =?us-ascii?Q?w8JHioo/FgQcXWzejfb/ErzsN+TcHn4Ikk0DkNVFinJqihU0AsuLshui8uUx?=
 =?us-ascii?Q?8H4eXQadmHh9t+ZhBA9hceUEfO+R9kdq2joD0A26SUUr7R36FP8XBdImiBo3?=
 =?us-ascii?Q?HNuJ0hhJfJzFes/8JildanZgQz8h1P+CXpqzq1ZS3DkNmhsR+jpnha30GFj3?=
 =?us-ascii?Q?kOjDIteHr8jfbiMiKQUX0SBInh+0lRNIEHZKiIfuZCAGpbXrEJJ8D8OG+FSy?=
 =?us-ascii?Q?M4/WuSYGKxOmYiE+nZ8sieyxELioHz6wmEKyPoZ6/3lfEst3M0GBCeVinagx?=
 =?us-ascii?Q?SXtMYq89L0r+3rBXoHPO8Rx4DeZclcxTa98uQO1Hp0LAN1Z4u7WZSsdYzlQv?=
 =?us-ascii?Q?Ceh+Q/MsMN/GGakDDzoDqI+u?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516be566-65ce-4fcd-a7b5-08d91b9ab5bc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:33.8734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +j38BSq2kv+n//1ZZSgF6V5iLMsG2UQE1Qfgt8pUXYrRv/pBLAmLok3mtadUEh4rX8k42u4J9VScUwj/CiPw85naiQBX8ZTErJ2rNozI5Go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7009
Received-SPF: pass client-ip=40.107.21.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

copy_range is not a default behavior since 6a30f663d4c0b3c, and it's
now available only though x-perf experimantal argument, so it's OK to
drop it.

Even when backup is used to copy disk to same filesystem, and
filesystem supports zero-copy copy_range, copy_range is probably not
what we want for backup: backup has good property of making a copy of
active disk, with no impact to active disk itself (unlike creating a
snapshot). And if copy_range instead of copying data adds fs-level
references, and on next guest write COW operation occurs, it's seems
most possible, that new block will be allocated for original vm disk,
not for backup disk. Thus, fragmentation of original disk will
increase.

We can simply add support back on demand. Now we want to publish
copy-before-write filter, and instead of thinking how to pass
use-copy-range argument to block-copy (create x-block-copy parameter
for new public filter driver, or may be set it by hand after filter
node creation?), instead of this let's just drop copy-range support in
backup for now.

After this patch copy-range support in block-copy becomes unused. Let's
keep it for a while, it won't hurt:

1. If there would be request for supporting copy_range in backup
   (and/or in a new public copy-before-write filter), it will be easy
   to satisfy it.

2. Probably, qemu-img convert will reuse block-copy, and qemu-img has
   option to enable copy-range. qemu-img convert is not a backup, and
   copy_range may be more reasonable for some cases in context of
   qemu-img convert.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.h | 1 -
 block/backup.c            | 3 +--
 block/copy-before-write.c | 4 +---
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index 5977b7aa31..e284dfb6a7 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -33,7 +33,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BackupPerf *perf,
                                   BdrvRequestFlags write_flags,
                                   BlockCopyState **bcs,
                                   Error **errp);
diff --git a/block/backup.c b/block/backup.c
index ac91821b08..d41dd30e25 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -522,8 +522,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                   (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
 
     cbw = bdrv_cbw_append(bs, target, filter_node_name,
-                                        cluster_size, perf,
-                                        write_flags, &bcs, errp);
+                          cluster_size, write_flags, &bcs, errp);
     if (!cbw) {
         goto error;
     }
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 0dc5a107cf..bc795adb87 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -170,7 +170,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BackupPerf *perf,
                                   BdrvRequestFlags write_flags,
                                   BlockCopyState **bcs,
                                   Error **errp)
@@ -217,8 +216,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
 
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
-                                      cluster_size, perf->use_copy_range,
-                                      write_flags, errp);
+                                      cluster_size, false, write_flags, errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2



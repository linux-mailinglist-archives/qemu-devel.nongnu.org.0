Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329CB38B1DA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:37:46 +0200 (CEST)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjo1-0003DB-68
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZz-0006WI-2Z; Thu, 20 May 2021 10:23:15 -0400
Received: from mail-eopbgr00114.outbound.protection.outlook.com
 ([40.107.0.114]:2638 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZw-0005ik-CW; Thu, 20 May 2021 10:23:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkUM/kORkqyV3mnziivybqephtBYGjVELRqC1EkK9M3qk7dyjI23CfgzoaTY1hWOaXtBMiFmSaSuvLlw1WaWknOdI6dvkUcScqc0hNFnuHoV4kmxxDLQ8tU1y2EnQxu+pFAP67+oGmPXfNzWorDIFCPMIG5BZmAfSnprmn1HK1pOxZPVFt+MggYN+F/4XrqMMYiweuxxlgSdrPkGbxZOsqq83211hsxHyAmoBMIwT5KNu5KK6h7CJalanSw2SczIoaJpmp88DFsz3LsJyzAYxKOmvlxcrO0pZDwWK/Nay27TwButIBTyMuUd+cvFnUwlDZgJSANI6B3tvvTiVXMiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhWlz9yilLiDMYDqzAyAN8F6GaiOvA3qOvlK9zLe/Bw=;
 b=BO1bIylnYfJHsB4wjaeZiANenTQVRMzRnK0x0ZglFWTXpZxtordLDbW/ZNM+e2UaHU/PaseXMCnMh2NpY+1JD4l7rL+KEdKT/QlCaU1zRn6KUt4OCxtJZSB4zqKTU8mXuW9wPQH4+Pyk+lFA2JxMMz2vnYCcXdCmAyTe86wA5fRsVL7k/aZHvYVFPsydeLq1SSYVYE8YQ5AA/Nakh9NWUlHqiEZ9PduhPi5SyuDeeRMPfmwJQ5I7o09u6WjlJcoOUpDcI75NKYJEqsviaUv5qLI6ZDsUheqF0gY5vXKfe5AJxg3FFa3qJ4AvHMt4bZNISxhDBVx1wsd15FCFZStsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhWlz9yilLiDMYDqzAyAN8F6GaiOvA3qOvlK9zLe/Bw=;
 b=eddNyjT1jt+mtc3n3M5nwGV+FzL66EsAVIuEakDvcQISa2Ch0UKOKqWL8PjORKpZrcw/EQrDWfCAx0PqbQ5zqWojH9jpSQleWFbLoaRMQoYcckTKecK29uz6ec7MQNawTWn3MWKkHf7A4E4q7nWQ6E/ckkM2X89I9PFhE+Nx+RQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 19/33] block/copy-before-write: initialize block-copy bitmap
Date: Thu, 20 May 2021 17:21:51 +0300
Message-Id: <20210520142205.607501-20-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35eae6b5-8b03-490a-5a65-08d91b9abf38
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544E449365D0DC43AF3161FC12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3VSeTEn6Uida/ePTq7Fb4XSWj/EyP8c/DwvpIcxLsnM0gIyaDXuMPI+Nf/8IDmsYIpJS76NOwuprg6c5mweIZ92yQVclKSZSFecpN/pGzRCWaIBuzyeSnrZOKlMwU4Akuc9JmsVEwGkv7rjPW3nPUHkhAD8lzRo9gzrgSx0/vbcn7/YXoYMymJ4kUlsOYqXSdzI2U1tGoIck57LTzPG1pYf7oNmXWnAGb78xkXlePodoe5oeBfxj/mN8S4ruRwbhiUEXUi+TvSp/GS00TV27FmhFVzzg6fvoy95Iu2fnN87VBxwS5H1GAqnMSSm2tCZ+14L16shfh3tXKBs2rKUTaRYWcZabW8b10K4g3wJ8VsDG4QaGxRx+9CgdbGwy6XmKOJk59kU5HSUoLX/l34iAOMHQkTKw2yaD7ac8ccXEmtsdwVA5MdK2LHc5yX8lQK5WAT+b5Q41DlQnEVLflBLsf8ubyIaZDfwKKuMWvfYp2ahDKuZla4gBUfFw+pnT9U7Zau9gHy2B7P0siaj4MEVsi0zeyxwXcWzlkj09S/wBEZWRPEA3Z3b+ZccwwBjF59liKRdI0MQ3vN8M+BPfSQ0TEKwgER/4w0d0ugk+m72cYQuQ6qCKMRBeQkUSGwt/lIX54VlzSw+Do2LWuMxNevMSKXhw201qfT8Z/CbBDavnltRf081YKiKA7HkGpFgCYV1f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(396003)(136003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(6666004)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s9XbLtyhnr4hkPwlwWmiwgpvF4dhfYubQSN/LK5YHIO+LlRTbvn6QDYcGMAC?=
 =?us-ascii?Q?qjVwZWJEuDgJ89ALomVTjXOvZMWrcrJfS5Zpz28mqbbdDj7ubvx6FJuTbTd5?=
 =?us-ascii?Q?AVKvVkFTvTmebcdgMXwbvZdOCM22o0JGTGOAoProTpi1p2QbMaygbCYpva7z?=
 =?us-ascii?Q?XRXH4Jjk2DLUUVPpx85fcr71J+67RqO6AAaOz54HPhuHU0Lf4gO3zcz8EuwU?=
 =?us-ascii?Q?E1E2B4zD1Ln2yeYafk+vtxquCLrBPr8LlevW2wv6m2/QYpnm3wN5NXOeOLAj?=
 =?us-ascii?Q?bbLCshLyzuTmtou/npOZCniaae1LzMDMbzV5LbNaIohAH8msBrpGX/4XfZlR?=
 =?us-ascii?Q?t09dBN3v8qk3qaV1E9T80T9BXLy0u96a3SauL6rNDv6NmbzwYzU6Bd2cf4/p?=
 =?us-ascii?Q?Gs4HBZmQx4C9sX67w31f05L+XEfpX5Qs10vLxBmElNzFPkqWA5CsGIaOi9HR?=
 =?us-ascii?Q?zv9fECmOPuyuxUQqCLBd8P6S9JLCxXt+D6QGS46R7UXtRViqT8iEi6OT8/mJ?=
 =?us-ascii?Q?bBIbfeqHdsTp8d2aF8ys4pmqpGpMIBQ95pZwAM072TtRAFSPVp20Pr2thg2n?=
 =?us-ascii?Q?3SxgeW5GVjM4+YWDYBKnDlXByU/irMW3lW9SHxft/vs/F/LxLHRcKgS/5E30?=
 =?us-ascii?Q?iF7ot+4ge+asYCWz4OHBDeCcqNIzTurw0GeEq8KoQ4v2+rQiKD6jHTOMRfz4?=
 =?us-ascii?Q?iB7/hRNiQVLRMe0mBUC4Ro+02s9XraQ+1qydKgFEB9WyU/W05e7JC86m7iJk?=
 =?us-ascii?Q?76kb8BujLVLPUonJbbckOVmQla7e1RsiT5bg6gFYEnSkWjHIUP7EIVZY7raT?=
 =?us-ascii?Q?jpz9h47eTjdvPYiCzPraw+/Cw1gYoC5ww4hBfPhp2VxwkX8gmbTMnbAdM8ZI?=
 =?us-ascii?Q?tSJMj7vKEgyvMI4sSyYgicnRfXk7wLLoKSmNFsekw3bsV95+q9QpPeAkI19g?=
 =?us-ascii?Q?Nm4Rhyf4sKc9jokiAgZpNHQH4CD/Q+FZCTG/Fw4ffqVUQrxcPEFaTB0/B0D0?=
 =?us-ascii?Q?VPOKelI75HhvBAO8ciuSCV6cBxSYj5YYqUzoG8NchCDCpgQUlMRxiXLuPju6?=
 =?us-ascii?Q?7lX2xFpqXUpyVnd2Ah430oWsMU3YRzIWZo+aoBtDyn0DN2zTZMif1KU/ksAE?=
 =?us-ascii?Q?9pMn7ZpoBSUKLwb8CSD00agN3xS7wm/I2BAcwh5C2HA1icZygPSTy7XNowBu?=
 =?us-ascii?Q?PhYzRY8v6nspDHWeHgaVN9nV0+0Ux4nycuoQCWshiEbc8nV1Ctx5u+qezLCI?=
 =?us-ascii?Q?F6HcHsJ2avMmd7SXY3TIgGZ9uZX3a1r66uHg+O82T+JJPPCzbXD1PW2esDld?=
 =?us-ascii?Q?F5yg9YfvxxXmxPyXfIiVcjca?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35eae6b5-8b03-490a-5a65-08d91b9abf38
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:49.8164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/fuSlGhqUza/Dd60NC0yoGoryE0TPGcVTqpIyXI9pzO6eMBsmzmNq7UCWjQut+8oyLK45OyjPwudm43rUdnu5UMgIYkl/yq9SH3z+jOD2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

We are going to publish copy-before-write filter to be used in separate
of backup. Future step would support bitmap for the filter. But let's
start from full set bitmap.

We have to modify backup, as bitmap is first initialized by
copy-before-write filter, and then backup modifies it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c            | 16 +++++++---------
 block/copy-before-write.c |  4 ++++
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index af17149f22..14652ac98a 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -233,18 +233,16 @@ static void backup_init_bcs_bitmap(BackupBlockJob *job)
     BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job->bcs);
 
     if (job->sync_mode == MIRROR_SYNC_MODE_BITMAP) {
+        bdrv_clear_dirty_bitmap(bcs_bitmap, NULL);
         ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap,
                                                NULL, true);
         assert(ret);
-    } else {
-        if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
-            /*
-             * We can't hog the coroutine to initialize this thoroughly.
-             * Set a flag and resume work when we are able to yield safely.
-             */
-            block_copy_set_skip_unallocated(job->bcs, true);
-        }
-        bdrv_set_dirty_bitmap(bcs_bitmap, 0, job->len);
+    } else if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
+        /*
+         * We can't hog the coroutine to initialize this thoroughly.
+         * Set a flag and resume work when we are able to yield safely.
+         */
+        block_copy_set_skip_unallocated(job->bcs, true);
     }
 
     estimate = bdrv_get_dirty_count(bcs_bitmap);
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index e889af7b80..ba2466a328 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -147,6 +147,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
 static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    BdrvDirtyBitmap *copy_bitmap;
     bool compress;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
@@ -184,6 +185,9 @@ static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
         return -EINVAL;
     }
 
+    copy_bitmap = block_copy_dirty_bitmap(s->bcs);
+    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
+
     return 0;
 }
 
-- 
2.29.2



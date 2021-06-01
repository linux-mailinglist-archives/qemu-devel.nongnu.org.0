Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814DE3978D5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:11:28 +0200 (CEST)
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7vL-0002Mn-IL
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bt-0002ip-Fm; Tue, 01 Jun 2021 12:51:21 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:14240 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7br-0002Cd-M6; Tue, 01 Jun 2021 12:51:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ph+NJHlS8KWvMldwAAPQqz2gqseDNmdwRJ5JiaK4YNj6u/RW7EBNJK9/WOcuLdwmh/At/73RqU72Jo/KCfbJY6CKYS3n6Wd5FVHs8g3wQxYKdXKoJUCf6KKT2WVJQdaXhAR82Q2R3n2envn9zDTLL+5oTTBnDUaYWdJXhsTunD2s7+MSgqXUzm2fbIz6eWr1hIeeKuSZJg66sFmlrIlEhehFd1eUwpSGhkgN+3QOT26lxcMTZXWjna2s1dR/n2cQOne4Y6Wi8H0jYnHmR73yECU7BzSwKiekikjitoby+xBwls1dxk0k48xPeFCupxSMVECI8IlGNmOUae2tnNUyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=ASCjEA4HoUmRkGxrjs5ABv4fBqPOzXATIhxOJi6dLRzx+NiBCy35rkKWab4mxsEVUkEVncTPxDmfAaeha7f/3uROcjh5JvUaLefRVkrqGFCwBJQhbJEn7K2b0Ut8G7kU6KFsrYlAzJ4MXJsrNy2MaSryNWVU94bxSRvKGBQ2UzBmcb5C3pRWjnvu2mGO06FQIn27scRkJxjle4QgN6O7CFa4ok5eBIdi7gqki8/U00FnjHgfGaaLwjuFfeRjorKSfWc5YulUPdGr04PvuV+vs1DNgfV7nLM0sYKmRmz3dJIbCXCECFwXbE5L9JRtZXEIKvD4Hl2JhFOfmRlRSwV8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=uVvJkilDt0/z5/PWodRDl8AUUXglYTEbudJ08xDdfJVE/WwWI0YSgXS/LscTq3PY9fcmaTmP/4hqHJUPMsc+zXEhL7hUuMdM5dw0LO87ud0T7Dp1QDbzVa5Ji+hzSJPL1mTuYK6XWGCd7IXJmAnuw47ufcRYQEK4nQQmW3xa/i8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 18/35] block/copy-before-write: cbw_init(): use file child
 after attaching
Date: Tue,  1 Jun 2021 19:50:09 +0300
Message-Id: <20210601165026.326877-19-vsementsov@virtuozzo.com>
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
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb54856d-21ff-4893-5578-08d9251d7373
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19726C89B209D1C3A6CA5B61C13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2EVjIJct3MS1B/pAENY7k1q49fSZiyTY/hgEYiBmHtX9s6magoUbzOynrVOgLTMizkgkldi0shOTnBKag3syReZ3OXylpi0SP+ckuag1bDwWRn5H9vD5cnMKdAocJSlahcIYEvPdGGBX3m40nlI5ZpZ/U0Ay03agsLSQBqatSHxoLXb+5vX13/4zcg05/dCOSFSBjhZtXaSyiubvSIf4UdNqiqZ50VOaaoEYIAjB9/GNVJRzO8bblv1MCDRWJzBJ43r+0BJ6IVeiGM03usUIxA8Pkj+/krfN3sgwWo7UA4AN4D2WoFJv2oDm1NoyTp9GdTjFUHxM7Xr6nhSZNmFVZ+huMlo1xYTstdbm/jjgCr1qObPzjUiG5QWmFdVV1nMbmM3eU+bCIo74evi7kUZIbkftxfb2rrCq1s2Pra0vllTaSshqrXgQVfS5cNoClAXxerTKGNW6tHYumKJKVwYSJ39LbdhEOBNWagNZ5c2JhpEgefvXcJDKxeeMhsOIj6d2amM9wvK8NexyptgStypJ4BoebpqwuM3O8i5UvGWGD0yxJ6O/TslYviTKZ33GRT73D/ESbNhGAGLmO3oyqaZTo9YF/n9lalAQrrcgFOy0/kLxe4LBeQlpLxj7fMCqIaS4lW7eaEbq4Sao5e/X+vf0WYHlcrrAiq1B+ClJEuYnlMa4SOSinFmer9E3XWq4ujT8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(5660300002)(2906002)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(498600001)(38100700002)(4326008)(16526019)(186003)(38350700002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hKdJ76zgj+AbfZYgjpnmXNNW3TuffHQ8PTVYs2X3Q1h/vzBgeOeEV1D+wFmj?=
 =?us-ascii?Q?CD0ddxiTu/xJMJGM4wdI9iqZ+F7qjrRIaCc0OCxkoAPjcxYvFeItUFFNqefZ?=
 =?us-ascii?Q?c8e2jSLoL3oc4DQXGbHFPHqZe2VA6IfQ0P64HN+QCdaHZrzuJnROrLnrOWrW?=
 =?us-ascii?Q?DO3KVPEsBipZ/2qSK5kJnR7VKK/y4n4TsHatPw62Ns6gNrAlHE1edQj4rCmv?=
 =?us-ascii?Q?Bm/a4QlXtgRFAsGukyXl1k0D3wCjNjweN3DAEJXR2JsOovYTAwTqq5TUp2NX?=
 =?us-ascii?Q?x9WthryQ5rSSiAYNmqxhFAdK/lA/Da94M0OtDjmoAANcfN11sp7BeNvUq/Mz?=
 =?us-ascii?Q?0Aa1f2ikFzGOMY9LwcmpJ0iSW/uvySL7mlLSjU1IjhiOjaRwxNf+hSgXI7dH?=
 =?us-ascii?Q?P+Igsog5Md6rotKBtUphGzbBuXHei5puQUkOXxr3TYogdOwXpmJicoRjhAct?=
 =?us-ascii?Q?AEBDBiLQ3CoIDr7A4Oz7JRxgd03H5zhRAmIsck/v+HEn9ny7Y0bg7H1xJqxV?=
 =?us-ascii?Q?pLJuOGC8LzTOQbUiiuvlhLsIKAr6o2tkaN/JsowaClN2eNIlVlnO/a/spfdX?=
 =?us-ascii?Q?RI//YuiNtqmLWfSGoyB2NK6oXNTxC9JQxtcx0ASeoCi/ctQymj2516DJxga9?=
 =?us-ascii?Q?4twxoh+zoq8s8jNFdRBAOV2hKJH5akYiqI2CQ+DSwGKkt46IdUjM6cWsZyki?=
 =?us-ascii?Q?POHW3AlY649qTdXUpzklJnMPLAR9TXJoA39pgZ5r64G7cOfpbDvKM7y5NNG9?=
 =?us-ascii?Q?16vZmbVsVm1Bhc2ENlhkyJ7UphtACME+CmFjbZGYu2lP102AHiQiYSVqlyGI?=
 =?us-ascii?Q?U+InzxL+yzvbCXzZVwZyI8UKK0mPqk741Y+lsD9KfE9SjYVeixbInrw3bT+Z?=
 =?us-ascii?Q?nGdLoDvbpxo/zz8MSgLDnGKg5zRfuW6NsKTPL9dPXX/Ab4AUXZ2S/1PjmKQf?=
 =?us-ascii?Q?CyA35Lru7eUmxHiWkzPNYhWaKaDdvpqesJ3nCxRWQCIBD+od58DcUfJj8UYJ?=
 =?us-ascii?Q?GyXDbPs5+mcnq8+9HgF0cazps3UiKMSS/WAzT/AAiWliay1QXTKKBR4BnpNY?=
 =?us-ascii?Q?iUCp7x4JI4l4+nssfeLz1Kaj3U0EyVTgnY2JVOGYhhUsCGgD4oIqgvEjVxuL?=
 =?us-ascii?Q?u1891Prfq85Czp/mCY3mA+ba4jHDhhJXO8uxmc8i/qqvs849cCh6lDRtzEgK?=
 =?us-ascii?Q?szbhqubrN0F/nSSdZCxgbz2/+3zPgLp1NOiCDkEludEOw8gTfna+MquFt0YJ?=
 =?us-ascii?Q?Pd+mjoQuVLm+ffpxLQouuPphZ6lp/f6tjBtbNYFO3CkiGr/W3RNjLHTc/eyB?=
 =?us-ascii?Q?4nUqlJFXoBv5t32JDIskiRkT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb54856d-21ff-4893-5578-08d9251d7373
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:07.2098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEuM036EkrYxfOIpTKuYlbwTDLFlgMFiLvAPG54jklvR7B5k3nIHfddXYvFxIMmtVs/yMCkmNtZqF1eBnuxoamK1tLP6kmcMzhHg50SCAS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.22.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

In the next commit we'll get rid of source argument of cbw_init().
Prepare to it now, to make next commit simpler: move the code block
that uses source below attaching the child and use bs->file->bs instead
of source variable.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index d7f1833efa..4858dcf8ff 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -149,13 +149,6 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    bs->total_sectors = source->total_sectors;
-    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-            (BDRV_REQ_FUA & source->supported_write_flags);
-    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
-            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
-             source->supported_zero_flags);
-
     bdrv_ref(target);
     s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
                                   BDRV_CHILD_DATA, errp);
@@ -173,6 +166,13 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
         return -EINVAL;
     }
 
+    bs->total_sectors = bs->file->bs->total_sectors;
+    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+            (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
+    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
+             bs->file->bs->supported_zero_flags);
+
     s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
-- 
2.29.2



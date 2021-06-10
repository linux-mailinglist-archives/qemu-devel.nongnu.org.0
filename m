Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13C53A2A8C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:44:36 +0200 (CEST)
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJ6x-0003ms-MH
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIq9-00040J-Kw; Thu, 10 Jun 2021 07:27:13 -0400
Received: from mail-eopbgr40097.outbound.protection.outlook.com
 ([40.107.4.97]:58455 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIq5-0004QC-20; Thu, 10 Jun 2021 07:27:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhkJdsZzl8t1KUSvSZJ5FZnOl9MyHtUGtvKb2EyzBRC/QvAsK0iWrRTk+dx/f6/d8SbAtWM7PlVUxsEZ3eag7OOMoqTASQa2en/qgXmeYf/vrqLDIIJD7d6hDzLvr4ln6C9NKZorw22y6BU1fr7/lJ09J4zWkRK+3CnV0hNNH4P0GBanxIrbV9MeOKxuTjaO3e+ASR833O7SWVD4TMagzJssQ6LRzDyKxa+d79dtfVAZu6cA9QPsuGq03UI5PYRUPOntN3QQiDztx+NEkeHQrqNsJgfH6jdTbmbr7+fAWwCY3aUbp+M9l3pFH8/1zyAZAlb4NV+an/nUIj6wbYqlNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzEbTus52yZW9/K2jWF0Zh8FB09qCBl7UQJ9/5sI064=;
 b=IDHeP9225Fh0FpSKpAzz9oZaHTjmXHl7ldL4kF3rKNaL5xi8yvV+smNa/US2AZaqd9zknhKuOaP9+gCQPUwiHF14mTi1NaBb/SmoYsdZkVCOZvmCpblQDh4XfYXu/1dXQYMfJrasqXghn+C42NU6laS/WbHUc/InXRWOARykqeR/xuMWUj33n1EfuBs9C5HKpeMXixX2MRS6vcfVGJs0RC88I8YvPTQjYEsIWJtzWl4fTj3EjpkiD3psgCOzuyleGv1yUKs37lj7WflSLKQQIUR1drnZGmoMWk6sj9jxjW6G/DPbq26JML7cRLzOfjPzcI8QyDOYz/Hgwl1RyGvHLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzEbTus52yZW9/K2jWF0Zh8FB09qCBl7UQJ9/5sI064=;
 b=L1vfq5BmGCzzEWUQVlSMfRNtzturlp/bwiHAKN6WsNBdHuXFzVM9/6duII71gTPV5/pEYe9ZHJU8qRQUkgIAsf7nUyGVqQYl7HpHFsxcW4NjJ2LY1X6JMl07gjsw+6lpO4EAMthTSgRK5W9r+QatNCm9CvdlYAh4gc8PX9lP6ds=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 19/35] block/copy-before-write: bdrv_cbw_append(): drop
 unused compress arg
Date: Thu, 10 Jun 2021 14:26:02 +0300
Message-Id: <20210610112618.127378-20-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e90de93-48d6-4731-7f2d-08d92c02a61c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381A64729240B7BA8F4667CC1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x5Ufm+BfjvGoSrNi7kveHlDov3JU+nb10UJPYOI+2XxOeHWp/BxxmCND4fL9q4qfLGmeC8+e1Kjfu2i4mOq/7Jetk7iW0GkVjRp17SUqBVFIeqsaqLlwouprmP0GAraX9nOEyt32vU2WbantuZlWY9wAZpRNgCKhYiBxzcJGuGXg5y+GttIhQr1EdI7+gud2s6M9Sy/pb4/h8HpUV6e7FI4MGPkyLtmSATJbbHqydmy93bZD93HGzkepOHiHAh2cwSHCZhpzJcAswQrjLfgZzfDEnd2dUqFZVo5fQhsq1FL7dJp0mxiA0UvLwu3lyh1fylOnEHxIDJYoKDFRYDt5XaGOBP/7nbMsbwUiiOhVfE3CMMgb55CAi8m37pyJh08n5sItTxD9FbfuEbdlcwXciN0qtlielLl0Uxdx8gsL0pDkqU833DNOnB+JKtAiM8bZ26YozNWxdRd0RL6RFmfKOPZK3vUKHkNhkIhgyMUyYA4gwT3RIi5sb4GlumZqrsRDGbwmc7aJn+lSA9yEdTuSm4sk009sZFaX8H0mY/kQTUl6Ir5qakAzlKN/z3NE3GhfBnKRcUxN9BTpcJI+Y3knI6aeZzVf1VefUEdEivciJDeLNR0a3ihtDnyPv4Ce5xPq/5BbE+55i0UHxlf+H42JLmyF30lfTCj53ke0YFCvkswMe69dfHBT4FwQx/IMFBi2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Gk5AfQ/EN4a6Kq/ZOiCpt0ptynv+++aHmKrY1sPLHqBhW3k27P8xKbsQTaPp?=
 =?us-ascii?Q?yj2/nQW9I+R/43343xETQAobGkgHsYIcY73x8CAOLUHAu+IcLXxX+fojWuEb?=
 =?us-ascii?Q?8tpFiP/R+IlNMGDaMz0pHu9y0QyWVFoudtEjKXna593koY+Y5kZmmuuPuuCz?=
 =?us-ascii?Q?2RXNwFtbdApxZYWs/l27TpFFJvUVhJL/PDFQr/URK3MwqRBs7qPLIV/Frij0?=
 =?us-ascii?Q?fANjOjAt6sAVLOdJHm5evAl7DLnh60zI2R83iVT2XIU1fd3eSVfHniiFJA1I?=
 =?us-ascii?Q?SznPdOgMqPWnxd+BEOBaf9xIXgLncRwiee6LRzcJNsDUQJK+dMRRkxveA6Oe?=
 =?us-ascii?Q?tdJPMsQLR8Dq6k91LHbsDWdtFnzgk5gGG/yW0J9LLuAWbkI2hcvd4Byv6LHc?=
 =?us-ascii?Q?nFIxm2jD73KkUJ6YrCuXZ2/pbjlpmq6opubLra1xny6otVJgLoPp7BbjxxqA?=
 =?us-ascii?Q?N3RgghNRwswZ1RUZpAAjF4t6uhIMKYG7H8JADEe6ez9/HpPpnSf+4m8wW+z8?=
 =?us-ascii?Q?3M2iKe/kdGlV01RRWgaERNxQ9J3GvDRFForQ+0fcwLAqgLbrr7pzHCZD9Lkz?=
 =?us-ascii?Q?5mFbkgQuphfQVKh45e3PnfRAoRRXlOiEvJZo5jNH0tspv5m0Oy4zPWPUKeHU?=
 =?us-ascii?Q?IBUidKJbHY6S6eH9GoBieEXcWMJ1C4hManDWzfC8XPb/4IeONtdzpvFzxP5c?=
 =?us-ascii?Q?UFiOyOGqhyYViKrfWEU9NDT2jY5GUS5fy3rWIsoJb/Rwi3mZsqy6+eaybscy?=
 =?us-ascii?Q?tqOwEBKNAskuTFxsZdSTKIu95tVJKZn+YV7iQgcWCAZrM6l7CFmXZGViYjd4?=
 =?us-ascii?Q?Oay1MuScIUgXbyVQnenQn4Vs6JFgESPppXoLHTdf+G02F/w/sImi4BTm5+Ij?=
 =?us-ascii?Q?6vVcsy0GoeLdZZA4fVrJ91ZPAaKQAVC4TQKuc5P07fkJMTBbRAXFg0Ajwh+d?=
 =?us-ascii?Q?rf+xjWzFxLhVf6alv1zqCe9DxV0KWmbldN1ch1m/aQ8/FWjXbgQ6cbIsaYve?=
 =?us-ascii?Q?38RZQJ/fmaYnRXNM8LXwf4DDgD/c4Fi28HnlTD/vdG/1U0Kzg1H5fVZ1NlHv?=
 =?us-ascii?Q?WDj6acwC54wdLvnuX/UrdUGGgGUnnqOJJl953W1TAh2iGxKsZcq0g4aUakUW?=
 =?us-ascii?Q?s//ryyHFbKSFAC6P0Ah4YVPDv12eEiVUwy0a5YtGZBqAe4M+MCTdr9Pqdm3F?=
 =?us-ascii?Q?CK3EMFsVYeuwFN4aGu05YaHZWTpONhRZgdp9p0RW1g2uP6FG+W8tRxL2nf4h?=
 =?us-ascii?Q?jVvJ2H4OIISWNVEc8O22mI07oW5IJVlA1+hJd1ZV9pIcaCcRuW5Gyaypsm0D?=
 =?us-ascii?Q?la4MCutG46uM1A1V4hYxMDr1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e90de93-48d6-4731-7f2d-08d92c02a61c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:53.9511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pG4IUHdR4mvLkNELU0UcNDz75ltztQhTD5P5ogeJFNSz4FECbsr7URg+9fU2Dd+FeCYtg3OF7rpZdoTDtJoviUHdnQyjaOEMjc4T0lqJ04Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.97;
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h | 1 -
 block/backup.c            | 2 +-
 block/copy-before-write.c | 7 +++----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index b386fd8f01..51847e711a 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -32,7 +32,6 @@
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
 void bdrv_cbw_drop(BlockDriverState *bs);
diff --git a/block/backup.c b/block/backup.c
index 83516297cb..4869f1e5da 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -452,7 +452,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cbw = bdrv_cbw_append(bs, target, filter_node_name, false, &bcs, errp);
+    cbw = bdrv_cbw_append(bs, target, filter_node_name, &bcs, errp);
     if (!cbw) {
         goto error;
     }
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4858dcf8ff..1e7180760a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -145,7 +145,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
 }
 
 static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, bool compress, Error **errp)
+                    BlockDriverState *target, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
@@ -173,7 +173,7 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, false, false, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
@@ -202,7 +202,6 @@ BlockDriver bdrv_cbw_filter = {
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
 {
@@ -221,7 +220,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, compress, errp);
+    ret = cbw_init(top, source, target, errp);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2



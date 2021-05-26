Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974173921E7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:22:44 +0200 (CEST)
Received: from localhost ([::1]:44762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0zD-00050W-Kn
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lm0sy-0007RA-H1; Wed, 26 May 2021 17:16:16 -0400
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:2688 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lm0sw-0006kU-9d; Wed, 26 May 2021 17:16:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6hy3d6VtgojKcd5xvYxUKFLesKUggHV27ImLFYggNzAkDzpd99WXVYA+/OPfU8v/yWeol8ebGcgMRNTwW4l0rANle0kSjXWowJVG2+JUoxg2TNE/RvgSCv3A1fdmf6E4FlI11UKRQ3zQRDI74S8PFkamx4j4MmBTk4kP7KvL+ysLpgKYKbdE5V2VwDtICZt1ZS134BZ2ZqRsJSu6mcv/q3snDpAjKDzi58tgH8rwNmJrT+My0mtAkrhVwtpIpSyG5qwhoXbG9Cle3XXp0CKj8SakH7v9cLTZs5FA9Nn9Dt6jG45mVi8odu7NHphecO/T9fT5Walxefyg+4UrJcaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3i5Gq0Hug8eGIreRsj7c0H83hLpDuzAVfJysubM3cdo=;
 b=c8Kz/5e2tsy90N+iZTAg76mMsktc79CVyBMeJdIGu0n9Rj/1KT8620qdMyKBK7Uof+dRff2uG7D4cYoyWf/N5ZWH87WjnhJRJUwziSNpW8cvX4WqH99r9B9JdCzBqnpBimhFz07rtriRSdyH88QKVNpRTjK1fAqQjzxW0DJcZoxiuwWD6qGU89jeFWnTE5jQSXLs07hdiSo0v8hUiRVLjjDduqsBPY8gnsJxwveH1kv/sNuqXwnwZmevAU3lQipQRr5GKUq9jfUI9rCdMSVBy5JclxEPuxaCigYRJVvwDSJq46XX/lpgOL6yN7ZjmK48jExza/Gf2Dfdov2//0e3MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3i5Gq0Hug8eGIreRsj7c0H83hLpDuzAVfJysubM3cdo=;
 b=Fho5gIInOj+AZ+88tM4cc3utN8lSlRo/lmB3hAXv1zPpGV9mn8CREVjvESEkbEGDB20U6MR9bw8KlCCTi7OocP6/jaRJz726be8RQNhQZKz+QhGEzduH1dqysrhxkR7TBnRWN5h4KuWnolYN+KK/gvKbQ6ELDVpqju2Tgh09bRE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5382.eurprd08.prod.outlook.com (2603:10a6:20b:108::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 21:15:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 21:15:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, codyprime@gmail.com, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 3/3] block: drop BlockBackendRootState::read_only
Date: Thu, 27 May 2021 00:15:34 +0300
Message-Id: <20210526211534.524597-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210526211534.524597-1-vsementsov@virtuozzo.com>
References: <20210526211534.524597-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR0502CA0021.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR0502CA0021.eurprd05.prod.outlook.com (2603:10a6:3:e3::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 21:15:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc61b509-b34f-4783-3907-08d9208b7167
X-MS-TrafficTypeDiagnostic: AM7PR08MB5382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB538257EDBE5DBFD0A187F80EC1249@AM7PR08MB5382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D9+lJ4RT2NIfWllJ6ET2Jv5zJKLnkJUQ5GvXuhQT7xOA215p+URKleAmeJ6SXhCCEHLsygwFgqnY5aP7lzdUgAk5joFNbsu1dINyQALqBRQ/KCf1z2cdV1bZG8AWrjfw31uba+WtUXOwoHe6rmB/rBW1bsCI96FGMqFK+ugWQs1JTu8Zrrq4u4cNS3zyq77xe9sYsdH9/jSQ4QoS3TyUiZhmdrZ/yhvg6isRDot5dC675Etcwsqd1SPu2Hao2l4GucCe6f2sRj/tEtksWG4VrF7Hm7srWO4N8J7GD3PIKPY+33sxqD72K75LuDCpiOB8U7/Tas/M9RaDi/IbsR/zQCTaQrvmxXOhWXMeQsinhFuRG9XIjv97slwCq6WhXXBFbzxcstda2qZFGIckbRXHJmaNidXGZNOtRQ17rStKVpu8ZTu1Xu/QfAzdvCAKlw/Coj4+34YRFuHTXkhH5+HXiVe3DcuKIBIY5p7kvE2avQ3R/ZcZ16C+1CHTXgWR2y7rpo72OFBzQZ29u7ZQeQPrZWmL1Qw2pBRAlm5LHcmkA71vGDQk6BCQlpVA8IbscczVS0Zz87EEYvG3ZyIVxm9o/5ramW0BxY9kEfvWN5IknHbXYHb0OSBxJJ5pdh9o8YF1qxdfPoffgtnqhs/YL721ugerO3709NGwwJat5YaO5UKTxyZP4fLUQ0MJ/5ZtFBd9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(366004)(376002)(346002)(396003)(86362001)(2906002)(478600001)(38350700002)(38100700002)(956004)(36756003)(316002)(6666004)(4326008)(5660300002)(66946007)(83380400001)(8936002)(8676002)(6916009)(6512007)(6486002)(26005)(2616005)(52116002)(1076003)(6506007)(66476007)(16526019)(66556008)(186003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2tDLXlXJeSATtwcDFGZ7OF4R8MwjMp9ZfmjmlRk55tQshhg9Zq8+7fIALS/u?=
 =?us-ascii?Q?GwVRyEpgLaJ9++OmB0uUq1sS236/HNI1Xt5/UYbSggnlyJJPy58d8lWY2pik?=
 =?us-ascii?Q?aTeS1I9I/EoA+AE04WO/6kV0RazfXHhL6XSwwyhqyGTBf11HTH+GjdzefcQp?=
 =?us-ascii?Q?fTovA9U02ZOFFNOEUK9L1nX7QFVlkjtX4/GazNMgGnCY5ioJdj3IfZHlN79U?=
 =?us-ascii?Q?Rret7wqMh49AeYY5M03slBJriR4SCGWu1ivcU+Oj67eGbnNRDyHW2ObG3M3c?=
 =?us-ascii?Q?GsfmntvfYEX6pAXGncj5gIcTzUr6iASb8ST4s7pRpc+FlTLtmA5F5NIUb2Kt?=
 =?us-ascii?Q?nV+kWbPUeE89vpiICMaB1UsfTNwneh25ydu3ER9oZgvAll9f/MIxXcUNhGvw?=
 =?us-ascii?Q?QWgdnQyy1MvIrbivwZzdDYwIyAX4n+PzYzCtPZan0PCQDJq/x8FGmMO3Yqxe?=
 =?us-ascii?Q?6WEsqfLolfeq8rCfs4Add3orLK4v9t7soAPBKh/8qfUE0CgsiOgvHEzxFzbm?=
 =?us-ascii?Q?LISdQZl7/NE4IG3Qd+PWH2LUGJlEF8hlT41rQUf6dczfqFxz47D/hEj4CbEF?=
 =?us-ascii?Q?9RoK3ERoIjgZoThoNtUT73hy7EOEmxFGILtvNvozbPgHxLC/WQDl0XEY1rce?=
 =?us-ascii?Q?k59FvEGs1+8X5yF/kejKnEUClPU7N2qIV7zhYGwD6dP56ldKagMNZCcYeXic?=
 =?us-ascii?Q?9aBqr9I6WSD1cq5AeWDk9Eu57FOlCbmsgE++CeEjMeZG2HM65Zs4ZQK2ZIuu?=
 =?us-ascii?Q?zasdQjM0SgCudqhf6d9sq79o/Ut76wnOS4pXeOjzERyjp+gru2p3pu/he5TW?=
 =?us-ascii?Q?J/a/ye8jrgfYMBNVHFmOckMGfkFkxRYPEcCTIZkjK5W3/FWsSlJ/wi7WeEt4?=
 =?us-ascii?Q?dX91EjWD8J8au9v7mpezi9/dLnYMtEo6lmeKVkR0WHyb/0q1j1124jxpW0A+?=
 =?us-ascii?Q?d30NS7PMpDJUSaFAdFHVVfPXIJFu2bQ48bIVBhNLoOeFKmUt3pckZSdSSdYi?=
 =?us-ascii?Q?OQXaFcruQJtKW37dJ5WyRWgeQtqUERKe/TC3NYQ4wpnKQ9NCWLHFXsWESQMM?=
 =?us-ascii?Q?pdMhPxpa45uoV2n2M5D/J60HOssuEP8RKQ4T4YXW+uIE+V1YDR15ofbibaDc?=
 =?us-ascii?Q?y3gBwUOStqILqtLrm6fd4JOGcUS2np2uXuyhURcuYruyvPeM9MWX/Kd/func?=
 =?us-ascii?Q?ceeZWedUJM2NlTfqN1l6zSmqlpWIixjBGKAVU2Ukz8MsGXRID0ItQZavhOBJ?=
 =?us-ascii?Q?FpvTy1GE17R4QXXAK6EGrxttv/Mzsm9eLECsT6nAV+qYF4EkkOot110Plram?=
 =?us-ascii?Q?g5EantIeqj2yfEW/0MeW0RHn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc61b509-b34f-4783-3907-08d9208b7167
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 21:15:52.8592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4C8OgdY1X50Xrrl0FadPKeLuQT0+m7X7tcNZDCSLE6iDx7QorhpCuSLCaDrG4ojpGmGgG2JKHFG7kJcKeAUnIwLGEkANkYos9bU9KI60HR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5382
Received-SPF: pass client-ip=40.107.21.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Instead of keeping additional boolean field, let's store the
information in BDRV_O_RDWR bit of BlockBackendRootState::open_flags.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  1 -
 block/block-backend.c     | 10 ++--------
 blockdev.c                |  4 +++-
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 09661a134b..057d88b1fc 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1007,7 +1007,6 @@ struct BlockDriverState {
 
 struct BlockBackendRootState {
     int open_flags;
-    bool read_only;
     BlockdevDetectZeroesOptions detect_zeroes;
 };
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 21b834e9df..d1a33a2c8e 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1852,7 +1852,7 @@ bool blk_supports_write_perm(BlockBackend *blk)
     if (bs) {
         return !bdrv_is_read_only(bs);
     } else {
-        return !blk->root_state.read_only;
+        return blk->root_state.open_flags & BDRV_O_RDWR;
     }
 }
 
@@ -2269,7 +2269,6 @@ void blk_update_root_state(BlockBackend *blk)
     assert(blk->root);
 
     blk->root_state.open_flags    = blk->root->bs->open_flags;
-    blk->root_state.read_only     = bdrv_is_read_only(blk->root->bs);
     blk->root_state.detect_zeroes = blk->root->bs->detect_zeroes;
 }
 
@@ -2288,12 +2287,7 @@ bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk)
  */
 int blk_get_open_flags_from_root_state(BlockBackend *blk)
 {
-    int bs_flags;
-
-    bs_flags = blk->root_state.read_only ? 0 : BDRV_O_RDWR;
-    bs_flags |= blk->root_state.open_flags & ~BDRV_O_RDWR;
-
-    return bs_flags;
+    return blk->root_state.open_flags;
 }
 
 BlockBackendRootState *blk_get_root_state(BlockBackend *blk)
diff --git a/blockdev.c b/blockdev.c
index 834c2304a1..c36884c691 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -576,6 +576,9 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
     }
 
     read_only = qemu_opt_get_bool(opts, BDRV_OPT_READ_ONLY, false);
+    if (!read_only) {
+        bdrv_flags |= BDRV_O_RDWR;
+    }
 
     /* init */
     if ((!file || !*file) && !qdict_size(bs_opts)) {
@@ -584,7 +587,6 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
         blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
         blk_rs = blk_get_root_state(blk);
         blk_rs->open_flags    = bdrv_flags;
-        blk_rs->read_only     = read_only;
         blk_rs->detect_zeroes = detect_zeroes;
 
         qobject_unref(bs_opts);
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2541E5A4763
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:41:57 +0200 (CEST)
Received: from localhost ([::1]:46394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oScDM-00036H-12
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblX-0001JR-Eg; Mon, 29 Aug 2022 06:13:11 -0400
Received: from mail-eopbgr140108.outbound.protection.outlook.com
 ([40.107.14.108]:58593 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblV-00066e-VY; Mon, 29 Aug 2022 06:13:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LppWmxNpuQsjL/JYA7SHIbzkzG9TUNt7n6LpNUIX5H7VG1JfS4bVhuMyWXeAeZafkXAmj/K/+7dxEi64jiEyCQOUPJewygWGZmGo+saAV1+SlmLphDIs4+4a8C+6KLa+fJK63M/6alxHUOlwJkbvdxIbQeOK8110baBwoYIVFMcTiiaH+cc/KF1Sk0i6DZUznV9NqoM2u1BAGAc/FThMhg/9cQV5aLiCD5BaO8SuYtHxE26dOyTdVR0jYj7kyy6FoznQF4WdlSf73dOz/PQLc0xpF1cR6oSvEdsnFP5wZ0VmKOuKmn2C5RPu8ZYe5PNkRtR0ldaEV/r7nSWPujDp1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muZhga5Mtg2pyW235XbttJqM6vST9qzQe7PQGZbXvSg=;
 b=PzzQXRkZoNGDn+CvIFpcE5dAL6MxJtzwuGsgNKy9qI8uKp27AJft+i8RUfJO2c0GEYrERDcPoBRriPUKM0nGf1uiwL/Oj0CqULa7TD8YA46Vg6jRRHeRN+otybkPwMebqP4KXnRAdRjo5dmQFpQT66gjWwHazg4Z7qwo96Im7AdVrXp9hyjpRwd5owvwhgvgHaxlOFicbxXAup5VqM9Dp6tVsHuCj8IyQSS816vjI89fmGe1zROc4/OT2y+emvbnbucyfGrY30GuTTRTJsoYRAUsNNfiQepBb4ze37ILWdhaJJqzzO8qXqySY3tesWvzD1ZPGAhM7C7llEzvE5M0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muZhga5Mtg2pyW235XbttJqM6vST9qzQe7PQGZbXvSg=;
 b=nT7WJryjFZyZCDpFjBdRyBkcV9dojwHbOEnxA7D1RU2HpPN2i8rULmhOE94lwem2jC6GllDB7jRMOtftveNaxvnZKzXA5sNbzxqjOtSi0xlqK57hb44XEx525Q4A8n0O+Cb4slH7fbRZC/aQO0BaOg+M9Cz2YxQDca65pg7EH1nLI85GngCHyE1Oxtwo6sMhgSUxYZ+hoFKXENNG3LzOUlIwidfwKSoI/aQHEEh5DqNh6uTUYr+OBHNiZyShadHdtKoHSLyACWBlcYOdSopNPCZK4GJZWq1EVAbQKubVIdNtKbz8gXUWcNSA/bChl24GL4F9/rgAJ07RWzsXuWMZcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:13:00 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:13:00 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 10/10] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Mon, 29 Aug 2022 12:12:45 +0200
Message-Id: <20220829101246.343507-11-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
References: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 184a8a3b-0011-4252-a5ee-08da89a70d9c
X-MS-TrafficTypeDiagnostic: DBBPR08MB4725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VKWPbBWwJjARYKWVySnna1DsYsYoXPRNvnMj/kRiX7ZvL51ok6txonHD+nDpJRjM1BVdiy8D3RVJfAlcN7x2DQll/DOWb/ajRVdA+Y6sCW9pBMWt/pnTrZ1eETrUmjQj0xkZ0OoHTzHQ5kWbejZ9TSqoyd2kwlGyACoSZ5qCEBF//6srQtWC+lskH1iNuBbmCPvd5t64xEiwOoFlCjcrM97yb24BrEvGwDB4nXyElgDiZ2PG3qGorM12ukYVz05Phoa5Oa6Jmw8Hp7bw+1ZQCnwp3y/ektDy2RZzsJ8hGz3WApkAdVPmcavIEvBS1VazEOtjCCxheAR3CMwQx4z4SCGH2lKn+oFLqSKDnp5qI0GiaD8jy07CduRK6oXFuXolpCPuuIP5bnrcivxnCAmbKoNfhQVHak6HnqyMoPhzjKQ9iodoyiI6cxDHcU4Xv8weCVNLAxUE4SQDpddUs3rxSO9/QuSH35prQTfZJQGAdoHdcjwOzBGuyDmr8lcNl8M7IesNiVXT5FGQxPEAITd//RQRxiMAnjaI4+fNtaegbodvHpnKYFOe2fJVnKmK9Iiie3QuBHURFBYj45HZBk0WG/XgeykXN6b+buE2p5kuR9LaRWMozxZNOE0ZFcZCTUv1K6h1CY0Liw3W71Af4jNOPl+S387eFmVz3TBcCCqgQPSr2RAPfGvAB0ieu16g2JgjtBadFSszGAJuxUTtI4n7qp5N9cucIMsw87htqqOpLqMjsuoXwKggVhJkb2gOS7MY4kDfg+HSr6sDHHshR1Qh6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(2616005)(316002)(1076003)(36756003)(38350700002)(186003)(38100700002)(86362001)(6916009)(52116002)(83380400001)(2906002)(478600001)(41300700001)(6486002)(66946007)(66556008)(8676002)(4326008)(66476007)(44832011)(6666004)(6512007)(6506007)(5660300002)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4HLz/j2pEMXMiA/aFdrOnMAHElsG1c/OuVe5M4Nm1PAPVkSUQ/ioNgTiEzMi?=
 =?us-ascii?Q?gmCyiexmR9no8RJO/dYLeQ1uBL/hFXpQIjKgGwXMITMSOxHVS9Iqu2mBsdX7?=
 =?us-ascii?Q?C5RFZ3mVDu60iaZkp4lwWThlx7dCI7G+DHFBUCpJEEFyeupWAYc5JC19po3d?=
 =?us-ascii?Q?NG+7EVA2SRkcmhlRXA2HaA4DZ6avBy+7JfSeSQ3qqBdViLRRmQKKDoIf7KUk?=
 =?us-ascii?Q?u23E7U2jQuNGLiuum9doXuacARoOFqk73GD3pnyoxK1PDEDisFysni9ZZcD0?=
 =?us-ascii?Q?clz4I5xVg8SLqUF8ezrkd3WKDmyhNOKdtN7xmLrV1PsmcZ9pn4DtUCvDwi3O?=
 =?us-ascii?Q?YPBAS0rBHJ6Uk0pPIKh57+azw74AlG4JD/L9DvJ3dtzae7zqeVn/+gnWQx4A?=
 =?us-ascii?Q?a8ko1D5OrZlOmvRc2KRaQQFxN6HtESdPANLOt2SxsK415xopCdSd1zipbrj5?=
 =?us-ascii?Q?DqG7rQCEolJEzm7qR4QmguOXxcx2B0dVfhlIOa4h//vu+OANONLFCz8P+sSu?=
 =?us-ascii?Q?/KmUv6cuj5dernEtKSa08mEGgaHt5URVRinFMSXZSqEKgl4LhlM9aN26+lz7?=
 =?us-ascii?Q?EdsOkaTamNC9Y6uD81QsjqXcRnvdIXu3CFXdonZJO84QUXh3+kDJ1r+QxzES?=
 =?us-ascii?Q?0iJe7zD00P8wMeC5HRtwCzoVGcPczGHYKURFbMzNXi3QWRXHV22y1IlvCIx0?=
 =?us-ascii?Q?O7oCf7layRGffTDFpjCG80dE7487J/4G1GqU11OXH7alFgXMUKMNmUSkN9as?=
 =?us-ascii?Q?bGZbRoHOKRpM3mMdiOUpImygJEW5xCA1vWDDEjTglkeVTv87O+jhrMvIxstu?=
 =?us-ascii?Q?sVoslICR34ZTYHUo0mf4mvq5YjJiYVv4HHY1OQCYhpN09fnweV5QQXwgyDUb?=
 =?us-ascii?Q?aDqGxKlaihTW3voloMCsphntos6B3NQhcjfjkoyV67gJF42l45VLjURy5QZn?=
 =?us-ascii?Q?FUKJqI3YYOQDp4O7HdOeL/DXK+UeFiAWbgzrfIz4noJW3juUVhiHuXbPs++P?=
 =?us-ascii?Q?X86NtiQuEK2AotZZmrn8+MVogstwiu7lJsm8iFdeK18pJWyp9DYwkN6gBkO7?=
 =?us-ascii?Q?SG5pizrmp3tnCfgXIb5uDiFCUaHsgzGsBWkjwXQroxWLZKukEpqE1gEXVKUC?=
 =?us-ascii?Q?LsbmXRc9KM03DmsLW5WphRE/Sj0Y78/w7e5hIkSZ6ICD78oYE5eu+gWP3uLU?=
 =?us-ascii?Q?ACsVjzUBA1viAh/ul4rMiDL3iT10Zh8BWdjyWlAUprDNbVXAibOFAk27MYMb?=
 =?us-ascii?Q?58VxcHu1zfR/xhzE5yiwp2CqvwYB6nYDSpxWtdTCMVtB8grvnCftXsmShrSe?=
 =?us-ascii?Q?8DFnTFb74sLJn+WzrDtNNM9ua9AFdfqi4uyDzgbRxsnwyZDKA9sLhX0jYZRX?=
 =?us-ascii?Q?OiTvvFRzLZHiF2jf9wD5ytq9lZ76E9CMvMUtu48QFuOY8/t8gDy1ZUt3pBUM?=
 =?us-ascii?Q?pJS8ktHU/0tvoPufq11s3MEy7I/qp+4MIGTV3YABQqJGtKMhuo3vvpavzw9U?=
 =?us-ascii?Q?vvHwvOi3MV6DQM1uB8OITlnuj7H+OY6Xci233MH2rvxedQhkinODdzMUx7it?=
 =?us-ascii?Q?8en95GXvlvdVJHqFuwRGZB4zhcYm0bm0VUQgSatXXr3EDG21szcpbnLo7t66?=
 =?us-ascii?Q?u3z9Ke4CG6pl+9Bns1n5qLc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184a8a3b-0011-4252-a5ee-08da89a70d9c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:13:00.8353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5lF0rYWE4mvB0J+k2J7SoAdyIxAYJ+DbtPV6SjWjk5OEH5+HxPll6Vl/494974uRjDODl0BJfv9OaSgqmcX3ZbWB/S/uSiAXvxX9K/kS54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4725
Received-SPF: pass client-ip=40.107.14.108;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Replace the way we use mutex in parallels_co_check() for simplier
and less error prone code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index eacfdea4b6..8943eccbf5 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -561,30 +561,25 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     BDRVParallelsState *s = bs->opaque;
     int ret;
 
-    qemu_co_mutex_lock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        parallels_check_unclean(bs, res, fix);
 
-    parallels_check_unclean(bs, res, fix);
+        ret = parallels_check_outside_image(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
+        ret = parallels_check_leak(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
+        parallels_collect_statistics(bs, res, fix);
     }
 
-    parallels_collect_statistics(bs, res, fix);
-
-out:
-    qemu_co_mutex_unlock(&s->lock);
-
-    if (ret == 0) {
-        ret = bdrv_co_flush(bs);
-        if (ret < 0) {
-            res->check_errors++;
-        }
+    ret = bdrv_co_flush(bs);
+    if (ret < 0) {
+        res->check_errors++;
     }
 
     return ret;
-- 
2.34.1



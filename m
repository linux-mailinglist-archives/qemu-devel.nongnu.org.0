Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A259876A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:26:18 +0200 (CEST)
Received: from localhost ([::1]:60308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhPV-0003Ru-JG
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEv-0005pV-CI; Thu, 18 Aug 2022 11:15:23 -0400
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:61536 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEt-00071h-G4; Thu, 18 Aug 2022 11:15:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lq1r0UuPTAc0s9mUv+12tj5y+lE2j84b0xsiFlgbVdEgfNbPWEamEeWges7XMDurE0vdkYOM6JvUgtBOMZaxfKYaXL0Fq2LQuTnG2VuI7rMcxdtMeuwzy0w784gld34rP1vYV3uD3LPfZtwNickiIBPMn20zQeD48UDjUyQYjREl1pn1YHfGv5uPx5ulRrFdVQKNZr2iXteYCBn2E/9Ad9L9cniSEG9BLf16VcDZNALyFBO7RB2ewsmLhM5s+L3nt0TG27pfvM9NrXcsO5fEAhrs/tTiDFNZwFNE6Lh4WWisPAAHei2mXDfE3YGRjQo3JIoIJXNO3myqNYE3bxj7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFtQL/SOeXs1p3XSdkNaSBXF9WP6IOaq+YWROZWtD5U=;
 b=e3dDXIwAkPerciqvQmf6+4ij9A0pieMW2ezbbyznH9J/6ASR5CgrFEW8gfC3y6O9ZSAzvDuTVs7JX2CTm6g6SEfAOSi4XLaccrdKl5nA4PMGtff3r5TuDYMaXlJkS2WF+R3faV4qCnS40p204ncKJyAdzHg6gprGQjls4yoAxs9e2hsw7h5MQ6MguKfGZPnSHZgOAVOhX2gTtQeA3vWge0nRNzCzpJNPxpfZFTqzGXgq/MzUp4eS7euM8XGZ+4JMvOt+XD7eIFDtrddVC1M/Pk4gsUhi9yEWwFht/DrGPj2zX5UBpe9y9FMuM+TMDc1q3iEVyEY8OJKM/yoNHqLVeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFtQL/SOeXs1p3XSdkNaSBXF9WP6IOaq+YWROZWtD5U=;
 b=hMd4qM3beADVqBVEVgEc1GsLlvaUr03kYZ3qy48G5PWrvqPJV4gGS1sEY2XKoI6zCXGBVYr8dRyVIqf/e0j+/SHj0Fnq3e3T12kkegyLz5SRccILk4yQj1+/fzVIjJvTPf2bWR5Q9jZHRucetypdHSemzhjuWQTmITd8oos1Jf7/av+xQlaQfVYX+PeIVRBC4eI1b8iz0qGjwygZSqPmLzNvVJ68MSSh1hjYnrld+bG3W2tqfImqEzr9mDLKhcCdMXGrpUW+sFdjiBLBCuEJA+qaSL14E4dubfu7lhRDm9IuRANiCRhY2oY7HXrsE/FwWoonPYqpmfltGD15QhQSlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3715.eurprd08.prod.outlook.com (2603:10a6:208:10b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 15:15:10 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 15:15:10 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 6/9] parallels: Move check of cluster outside image to a
 separate function
Date: Thu, 18 Aug 2022 17:14:53 +0200
Message-Id: <20220818151456.2118470-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
References: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a84b30f-2eef-4b84-4b81-08da812c7103
X-MS-TrafficTypeDiagnostic: AM0PR08MB3715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FqFuuHzK3umqVa9SIvtbcjDfJk6HUjaCShm9uf2uPCoC+SD6uASGyo4DMigDlQtsMBWw3HCvqZE+wc2W3ZPuqXPKrNamhTJGiUt2Zsm16/KvtQPd6wd9S9WhLfycorsoxykcIkUZuyjO2PZ9zgVh5bJc/t9SFuiS4BdIOc+NiEIWVRyuCNJqjwzo1UeroRKathAo0TDATMxTRFdrQWrFtmawMRHAi3cG4OViaLKTA3cn/1yTLNCHXFBIGxiP8FrluQxRm4MoRpnBoR4MaUcpdrzq6iGDoA/xrw5YXbVoKz4LHNfKXQna7bI5Hg4hYSzCNldpDr0dH/YSVBS7Qg7NzOVUCeffEP69rmoZ9dXUAo35jZdOtVdoO3qq1cbZeVu+i/gAqmIByEjaNKBm0MqBsmuaV4qWRs3Skpj4CHbvHCQ5A0pAk9FQS3/enA8T/WLrLeRlhhn+9pM+oiVlAoT9NcEMV7oxQwsJ1PIO96WVapLVhSWr+U8cyjJoifpzBIHs0QDPs/o22y4n7tv9hDxOsehFsY/E7Otco1q+X6/eQc7YLrJUD6dvklZC2nMAuveN59mKs1EihDCtScNANic1H5Df4yxLyNE/MF2edZmswhGmqPuqDwez0PWBdc4SCFZPlZNs5WMnycsjb2bJtVfmosASZVNhPzCBbvGoQHenbagkpRQA3wmPvuqzYyH0wPrt07TpWbC8Gr26RNdI5ibsWv5H7S5C97C7N28SZjexnVKcxqBz5qNLMk2qxA96WOrIT5J/YNnB866IdLWmYNDO1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(83380400001)(52116002)(6506007)(6512007)(26005)(2616005)(186003)(1076003)(38350700002)(38100700002)(66556008)(4326008)(8936002)(5660300002)(44832011)(8676002)(66476007)(66946007)(2906002)(6666004)(478600001)(6486002)(41300700001)(316002)(86362001)(6916009)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pxlnpujuqfrwuITc93EFqrBGJW4UYIdn3QPJQJSV8Zp/ajaBGU1DjiBWL0sO?=
 =?us-ascii?Q?ptXFdy+wlmItP0Lp7rtPorGqswtkItENb6WP5Da1dJNxyH2nrL7u+mlVuwXv?=
 =?us-ascii?Q?wzveHLCV3cCfso94c6Ak1lHj9uD0EXvWKiMKPXGhrG5knss2P6vnVS5FFyGW?=
 =?us-ascii?Q?SnfRNAL0NNweGJFFLSrxz8ZuJJS7QFC8yVKvLBWi8+L1XcjCFqK7UDfAbDMi?=
 =?us-ascii?Q?pHZnlC6UTwak6EYQUOIEd9ZXTsWI2qmWbRmlEOFA7650JQWtDwZeDgx8+ksH?=
 =?us-ascii?Q?kL1CibggrESfq1dYU8yua82TjCRWvcWobotdSoPtJJzpCXR7ZLgEI1NtJsvC?=
 =?us-ascii?Q?rlidyyIJ/JvjhET1PBLTEj+0mXPENWhckZ1st/CRcDtBt/LiEqONOy+A8OVF?=
 =?us-ascii?Q?LiPrsCoj2MePfp0x1oJXIpp2nFislW11X/2VoyMAbAVGQ1puHTY7EQ19va8N?=
 =?us-ascii?Q?HmbDfD4q8eeeNKk+oVIvgKZF9T/RX2tIX2oq6d9++Unrq5/+75NTKBkau6PH?=
 =?us-ascii?Q?h52LA92mpE3TgML5wNmKgsiFJf1LH4uktFC3K+Wzyx+NSzXxMeLrlcIfhj24?=
 =?us-ascii?Q?RrYJ6wR/dIxO2R8VqKCwh1cviSXcnDjEdcEzte4nMvFohT+2kqTOfx2/mjI+?=
 =?us-ascii?Q?jXcguwaFp6xPsK5X8xIfB0eNdJ/MiRJ1U5Eop/GJ8fPABk9Ta+9PdArXvDG9?=
 =?us-ascii?Q?rq8f4zn3hDiKnZWY1Ta7XrNUu94pvR7wuOPGzAEuUtuSYTEp0NC9G+t/qRBS?=
 =?us-ascii?Q?RTCsjXN5ENVTwM4mg6wrkbFmsWixxDbUDcFtwBPwzAcp5T//clUFNu7k/vXf?=
 =?us-ascii?Q?jDDYH6bx55qW1/13X1vEvDDa7IoojD8ltkATQ/UPHBdT5tnn3ciHtkcvCiM/?=
 =?us-ascii?Q?CrVhEl/DJy0/w4tPs4D8zoYg3e64TMGkecIxvlx4jz2FUNcbW8NkZF8keQKE?=
 =?us-ascii?Q?VP1y3cFuneeXbS5QTRfX9s2h73z6gq/ZNNf0PuNVXDgKi+0+I+715xw9eHYQ?=
 =?us-ascii?Q?o1lk+6dYLoFaxNXGE21IDOCINFU9fKtIvF60aqaSd0dwIYox3Vz5hPnsC+tw?=
 =?us-ascii?Q?/diqx54BMR1+tRFDtQjD0B9Fn8mldfo9mNsVABcJXWKl+AmoUc+yZ/WBphBI?=
 =?us-ascii?Q?n33MN0GUkKhzzbSO3gWTedGcLEjfqp0MxoohATCZAnSc2vsHA2ylBM0O5Erg?=
 =?us-ascii?Q?uMTvrdyuU4t3ckqGyF+110v9DUekvig7SkKgDuR/XcPKdDOqcvN4nCuJSpkP?=
 =?us-ascii?Q?1sHed1b74+XUx35qmycS+Q6TeeK6OJgWvRmoQSD5R/iJksBlUErKkWF6T/v2?=
 =?us-ascii?Q?Ur8wpeJaz6U2pk9JjHgbRikNgKixmOIJCKoNd4P8x42Hyv/QY3dfafuU0eu+?=
 =?us-ascii?Q?UL5H1AK+dwS1/LynjqV5TAXOgt4fIbaS1LdJjlpESEs1Z8Uek9y0Ms0BFJOF?=
 =?us-ascii?Q?Agf7++vEhc/c6xqKKmwvK+VLm743E9k7+a2zj7W3SFwMYqq11JmZfp7sJKie?=
 =?us-ascii?Q?UPYwFlO44RCZiqhh12BmDKijyTIGLglvp2zwR8ysNT8L4uMbdRHMczprcj7I?=
 =?us-ascii?Q?40uTbZ6I6koKT+Ywl7i94WmA/pJ2P0Cd+PMRWKDqZ0pKPBxEarCpl9wVYl++?=
 =?us-ascii?Q?ozVPSJT/UPOSizFSt16dfm8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a84b30f-2eef-4b84-4b81-08da812c7103
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:15:10.2181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FmgXmluaWRYpFEvufKSbGcZS+I3z3M7m9hLLZtMGI3sYTktpbSVGnFx/PLO5dU7JCqFy8pCU+HtZ8dTVThl7KjvkXnZcg8m9jEUVVm6b3qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3715
Received-SPF: pass client-ip=40.107.21.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.
s->data_end fix relates to out-of-image check so move it
to the helper too.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 67 +++++++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 22 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 3900a0f4a9..1c7626c867 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -438,6 +438,46 @@ static void parallels_check_unclean(BlockDriverState *bs,
     }
 }
 
+static int parallels_check_outside_image(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    uint32_t i;
+    int64_t off, size;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
+
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off > size) {
+            fprintf(stderr, "%s cluster %u is outside image\n",
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+            res->corruptions++;
+            if (fix & BDRV_FIX_ERRORS) {
+                parallels_set_bat_entry(s, i, 0);
+                res->corruptions_fixed++;
+            }
+        }
+    }
+
+    /*
+     * If there were an out-of-image cluster it would be repaired,
+     * but s->data_end still would point outside image.
+     * Fix s->data_end by the file size.
+     */
+    size >>= BDRV_SECTOR_BITS;
+    if (s->data_end > size) {
+        s->data_end = size;
+    }
+
+    return 0;
+}
+
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
                                            BdrvCheckMode fix)
@@ -457,6 +497,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
     parallels_check_unclean(bs, res, fix);
 
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
@@ -469,19 +514,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             continue;
         }
 
-        /* cluster outside the image */
-        if (off > size) {
-            fprintf(stderr, "%s cluster %u is outside image\n",
-                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
-            res->corruptions++;
-            if (fix & BDRV_FIX_ERRORS) {
-                prev_off = 0;
-                parallels_set_bat_entry(s, i, 0);
-                res->corruptions_fixed++;
-                continue;
-            }
-        }
-
         res->bfi.allocated_clusters++;
         if (off > high_off) {
             high_off = off;
@@ -518,15 +550,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             res->leaks_fixed += count;
         }
     }
-    /*
-     * If there were an out-of-image cluster it would be repaired,
-     * but s->data_end still would point outside image.
-     * Fix s->data_end by the file size.
-     */
-    size >>= BDRV_SECTOR_BITS;
-    if (s->data_end > size) {
-        s->data_end = size;
-    }
 out:
     qemu_co_mutex_unlock(&s->lock);
 
-- 
2.34.1



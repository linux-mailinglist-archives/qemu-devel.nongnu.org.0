Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF2947D5F9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:46:54 +0100 (CET)
Received: from localhost ([::1]:36810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05hV-0000kL-TG
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:46:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bX-0000S2-9T; Wed, 22 Dec 2021 12:40:43 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:46561 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bV-0002Xs-8w; Wed, 22 Dec 2021 12:40:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAltX2xgJR3RtpsaMzeLLYF6aQGoo/DuA36hADqn9Iq+0gUWzD4wUg7tHAgpKzQln7HjCdDgOfsjCrne3uxRgMRpVe8Sf2LUZSn/QicNl7LD6k2ajq4RXRpTN282jQlmOJ1ZZODSQObSclJ5e30pueIye5CIOrFqgbOSYSwAxU7PB1bad7EpCH+oC03XehHTD7ii62kUdn9153bkxmx9d6nUlHjJM8fLvDNxt+liDZi5YQNAXY33A4y0W2aOfl5cofFcJJB2K/rE3eG7Mx1eMkN3wUxv2ma1xnvgtscui6vHfqkUDxVOC2NQ7VaP6cawZSE/FgxwIgu1UavuxgHc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xIkKyxGqeuiG9MnQOfs5KiTMK35rIKITsT89echrjs=;
 b=llncm8JyGyOMYKocZHAEoNS2WlbAnwm+QsY4xCBr1ExnXowjSI1OpJOG0AlDxfSAzIs6V3HeiEhd+SgGOLK6KDGyECIQYcfR0FYZTrLmtN1gc1UzUKvhh2IvtVQ+hqUHxV0lDLfxcAj50d+7nADqsa1qc/bRen6kLLo7XXvB1yn4evDRVM5uIRITOj0QsScirlv4+SY7gTEpxykKzy0VdLehDvh8LdMUvzvMrKOIDfsxZsIVHChZSTUxrR7dL41eF8D8ECJAr+cJ2yQSuX8ssNVPEYwtK0F1EEt3TWVkiCTuzXOGQ4b5I2s6xp2xOh7+VcHaWRU5d+UGNedo7z3nRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xIkKyxGqeuiG9MnQOfs5KiTMK35rIKITsT89echrjs=;
 b=H4hXbO554isvJzEDan10h4c8O0YIzC3WkWOZgxL2ZBI7c3hMjZIM+jeha9hJvWHXLwSFr5XIrlsAAqFrmI4Q98TK7iyQf5LJI4GWKp0+95iPTpu22/1Br5/peuS+ItDgsbdAmwH/XiSnlplwECq3/GbdfCjdbKs+M3kWZ5b82Mg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:38 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 07/19] block/dirty-bitmap: introduce
 bdrv_dirty_bitmap_status()
Date: Wed, 22 Dec 2021 18:40:06 +0100
Message-Id: <20211222174018.257550-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ad96009-9b2c-4215-8f8e-08d9c5722a3c
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB39647556560793C7E3BF1396C17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YC0EWv5EVNqFLQrG8FmveM+Ot97Cy+qcJsmt9xStod0i9LSNok8/M1OTt8ok5WJbAq/4HMcHhjZWuG1mushvAIFMIlMGSrpNTnG/kmqCKZ7tt2k7w+PSBHOHftEC1hh3pKd64T+yMf6cOd8jh1q03jGIWZTip56lrbp7/zNl9ZVNN5zcBZB34No9w7Ibvbxc+NwY6Tg7N7hDwyv03wY5NWmvbmTh5Em9pmsriciBeUkTJTMHyEmgX09GEN4gHkCxeUfSk51bAlMhB3cANszGKmd6yfMFXKoCGijgnOvJpDHpQGG1WA1+Qy2cn88Xd9wsbj7nE9XXClERghlSZkufhn0pQX3tCpDcbMYLVxuTxJax5wBy+QjhVgn11arWEdlkhQGWL581z7heKXnvP5za5Ksx+1vpbAdXX48vF67EK2kds1ATml7ULoHI+ywv4SqAY0gODRVmP7DOI0ZFBr1jZqpQ9gC2Tqz4kZt/H+yIlibyovwYMFlc848Tu6o2U/2MIl4LusPx06BbUk+acuAyS+wd8PR4CVPBCbXOp2Ag2JgwS9T5ucav5aVAJ1oSucLe4keltEMBros/s6T6cfPjQ0ovvAS8gpYBhmP1y8MQJYZfkdvaYeKPtyd6rwerkYZ+Cgz1IutnRiIMt9e+R2kGeBXg09gSStc3Y5W7ClIqajXk2vIDo/TTs4Gh9fAluavhPKFgkAXok9OHWo53ddqDhbL+1pYoKpjZYH7q5G440A4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(52116002)(2906002)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CJQroUCPvLHh1m5Ox7pz8qSRFnz38FR3lSm50Jtn7LMMcjzuuDRvIg5Z6TbA?=
 =?us-ascii?Q?pmqU2rBPueln1Qr4yS9M9mKdxGWyZXtLmhddtC7gcMHyiHGBRmf6Q/i2slSK?=
 =?us-ascii?Q?4FFNFbTZ2qsSEoo92hOneUvUO/8UKD9Jv4Vq+MWoaxwsqajrrS63jWLxVQFU?=
 =?us-ascii?Q?Q/uXLPgysahIZlpm8netao9fSS63F4cQUMs+T590YfdBjlVWyPiad0WCd/sk?=
 =?us-ascii?Q?3atetcy6LQVKB89/D8Y3NTuEdXm4oTyG2AYJ8lF9w5Sal782NtDNPUQnv0gD?=
 =?us-ascii?Q?1P0+DiVhcA4C4w07aBr5TBf8n8eNvx7QnjerssEp8GaIeJfIXRUNb+GYL5Nk?=
 =?us-ascii?Q?DkRsLPgVgADda4Ah4VaQtQYNGUCHC8gr/AvPrDxj044yPDOniGjXJZXax6Wo?=
 =?us-ascii?Q?wjKLrD5bkxzHZ94V4F0ZT1Nl4e34boLfSF+pAnq+RkzihPEgHplxhCjm6yol?=
 =?us-ascii?Q?CyOtI2yBJYlOv/bUU+W4vM153mLsaoaWLqUImCIc9DrjBQxS3y/bDdI8lyYe?=
 =?us-ascii?Q?KU2d7ixl4redwfA9u+y5TdYAh4IWn94zwpfdEDu97gLOQcJDyRNP2hwUuQgI?=
 =?us-ascii?Q?cvV0aioDUi59UaS90uiaLScRsEPgdayV76M+kChZbSfz/oc8S/NB7d87QVCw?=
 =?us-ascii?Q?Gl9huU4cjKX19m+pSf04+cHKdtfd48J1iF5rbxDLyp6M0G1QzIppFh3TPnKN?=
 =?us-ascii?Q?hlWjIbcIBP1QCkezPiyWdrp1xmmCLKHHPoE4zOKenbbUB1cTnRNEXvNrEsqf?=
 =?us-ascii?Q?BBqm1xPzYyGryvO8eY32VfSUCjUVLwHSBpUYXVv+jnyg3TOkMyH3iLIGeI7W?=
 =?us-ascii?Q?DPwKCuZN9UJKfyoED3qJ/LtDA3MBUYlcmPWsgvmCYSNBnAjSjm6k7ZwxF8ql?=
 =?us-ascii?Q?SGuBri3DUBE5tjjjUZfZhoyvT2VKiP89KwLeMU/ihIS3oMURsocPSMu9J3WT?=
 =?us-ascii?Q?syqHHegtPai2CGNHPkegC1b1cYqDmui1TpWwfGKJ6qXuIACOqkrUGHLjZ/Jl?=
 =?us-ascii?Q?/YLTVoSNmy6DybFj9AQ/T88FnuDwKjfyBSNCk5MA0pIQIknaZByU+USKDKnz?=
 =?us-ascii?Q?jxtd8vW3TkSafKDNkOBkJvqAZy/PE/t3hZwdrhCl5EgCJZqzqf+wJCd5p++i?=
 =?us-ascii?Q?PbGatIjObA9Xb+76TVz9qpHHvXRSYXQfdxWSGQE9rx1xZxmZMT+cjHtcrAIM?=
 =?us-ascii?Q?WqpCU01fOREpamhqxOY0hk3/MSGH3hPwALdoCHTOSPaStci4lsR+ScasxBBP?=
 =?us-ascii?Q?A+Ln42a86w0KX3lWdQNj657rqXcm2HMo6/5Pu3nQDfrBopfSnG45ATim3EpM?=
 =?us-ascii?Q?is8q2QJOavk336GaXvqgutAiN92gjcjudVJ7sNoHHS5R8dgbLM1z91UIuCQR?=
 =?us-ascii?Q?2Cnk0fEdUemMzK34p2DObDZQKhX/DdBUJ68gt8dSxL1SeHDPWJ8J1YtGPSWU?=
 =?us-ascii?Q?SWlu9NWPpFBMNHT702KVh5+5mAwX7rzBhWCFyz1/SLxA8yvHf9HpdhfTN+Zi?=
 =?us-ascii?Q?qL56BfZfinLLKGXXnIJ9Vt1llXoC+ExSmZVXdkmay6zyGQiW5NmBHW5Z3eVX?=
 =?us-ascii?Q?tO9eQ7FveG3QBxR8y5ju0Vnh83D6ker3y9TS0WWPhD1fZ80WCOa/18KmUCzn?=
 =?us-ascii?Q?0fba6JFwJ8H2oAjDmA3OBfzKYR3jAHLPIHSNrX/8UbZFvqYhMrByDmXBMuk7?=
 =?us-ascii?Q?MAYdIwqjd0LQe7y5OMXW1OuGjl4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad96009-9b2c-4215-8f8e-08d9c5722a3c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:37.8628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvwttW/aCG84HwLt3/BYPEy8zAeQK19yDfUvxYlPUsnHB8oypdoImz64IoEUKogcxFmEyj+ZY5Sz8LIKPRUNHBOLWM4NksLHTFmNYQ4gLjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add a convenient function similar with bdrv_block_status() to get
status of dirty bitmap.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/dirty-bitmap.h |  2 ++
 include/qemu/hbitmap.h       | 11 +++++++++++
 block/dirty-bitmap.c         |  6 ++++++
 util/hbitmap.c               | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index f95d350b70..2ae7dc3d1d 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -115,6 +115,8 @@ int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, int64_t offset,
 bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
         int64_t start, int64_t end, int64_t max_dirty_count,
         int64_t *dirty_start, int64_t *dirty_count);
+void bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
+                              int64_t bytes, bool *is_dirty, int64_t *count);
 BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap,
                                                   Error **errp);
 
diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 5e71b6d6f7..845fda12db 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -340,6 +340,17 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
                              int64_t max_dirty_count,
                              int64_t *dirty_start, int64_t *dirty_count);
 
+/*
+ * bdrv_dirty_bitmap_status:
+ * @hb: The HBitmap to operate on
+ * @start: the offset to start from
+ * @end: end of requested area
+ * @is_dirty: is bitmap dirty at @offset
+ * @pnum: how many bits has same value starting from @offset
+ */
+void hbitmap_status(const HBitmap *hb, int64_t offset, int64_t bytes,
+                    bool *is_dirty, int64_t *pnum);
+
 /**
  * hbitmap_iter_next:
  * @hbi: HBitmapIter to operate on.
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 94a0276833..e4a836749a 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -875,6 +875,12 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
                                    dirty_start, dirty_count);
 }
 
+void bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
+                              int64_t bytes, bool *is_dirty, int64_t *count)
+{
+    hbitmap_status(bitmap->bitmap, offset, bytes, is_dirty, count);
+}
+
 /**
  * bdrv_merge_dirty_bitmap: merge src into dest.
  * Ensures permissions on bitmaps are reasonable; use for public API.
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 305b894a63..ae8d0eb4d2 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -301,6 +301,42 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
     return true;
 }
 
+void hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
+                    bool *is_dirty, int64_t *pnum)
+{
+    int64_t next_dirty, next_zero;
+
+    assert(start >= 0);
+    assert(count > 0);
+    assert(start + count <= hb->orig_size);
+
+    next_dirty = hbitmap_next_dirty(hb, start, count);
+    if (next_dirty == -1) {
+        *pnum = count;
+        *is_dirty = false;
+        return;
+    }
+
+    if (next_dirty > start) {
+        *pnum = next_dirty - start;
+        *is_dirty = false;
+        return;
+    }
+
+    assert(next_dirty == start);
+
+    next_zero = hbitmap_next_zero(hb, start, count);
+    if (next_zero == -1) {
+        *pnum = count;
+        *is_dirty = true;
+        return;
+    }
+
+    assert(next_zero > start);
+    *pnum = next_zero - start;
+    *is_dirty = false;
+}
+
 bool hbitmap_empty(const HBitmap *hb)
 {
     return hb->count == 0;
-- 
2.31.1



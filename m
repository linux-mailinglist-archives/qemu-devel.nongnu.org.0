Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79D4CC680
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:49:32 +0100 (CET)
Received: from localhost ([::1]:51924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrS7-0004MW-Er
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:49:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNA-00042n-U1; Thu, 03 Mar 2022 14:44:25 -0500
Received: from [2a01:111:f400:7d00::710] (port=7585
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN9-0004Xj-9I; Thu, 03 Mar 2022 14:44:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFthBNjgUs3IN3zwTrSo7ZJhTOb9kiJe/HIqnV/PZoXHpNBcrtPsr7SAmvgm4D3549qh9BDT8UeV7Fmv5FOxFY+As9+uNUqbCRlYJSudqYcDoU73SvGhjgTUpgDCzPWxWsjA+9vdcE/eCT6mwLlSivUlEtJYvVDWfRFmz1xXoq6Wvv10DgTjyE1l5lOaRE/PiYFwXaZMTJoGsY0XhfhNXSJ1g/x2oMvWlEMpHNJk7LMyZQ0g5M5t7L4Msbcrd8EnWL/h0aINznp1wam6XLnu5IBs22LxaMq2dEuM757/zNl90dQRexUqF37XfC62OacgxjdnO1kqBSvAJjTb4wJpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwcI7D71CBJ848rjRlKBiBn8VxIYRQiF2qTE9/or4IU=;
 b=oTOzsyMuvXGbBa9uwosxXfyZpUQeU+5Gvtl5LekpEkAMGGnmVX37B+rrCW4eEkzAhGj2ndyq0FrVjw5BZDt4FoWrYxhiGWKXZiJ1DCJnw4YAba4bRabsGvfQHgtSLBRCYVq7bI+WAhkUgpyUMksjGYZ86w1E1+ez6nOpaShsBZ/3SRTwwYwtklJbD5hjPCybA0wnCls0Nv1iyduS6E6TSoerpV1idtt5Ol7jVrMJoqcP32a+6WEmhYSgBTEQXXDthnV8CAZrRULyc6Yfo61SBMR/hErDGGs8889NEnfDxNxnigvj4buEL1+jBp0vo4KI3r70wUHbY/aqzDcCAbZyRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwcI7D71CBJ848rjRlKBiBn8VxIYRQiF2qTE9/or4IU=;
 b=NOmlevVr2p2AKOe9kTQOnnGM8eI41U0FReB1w08qelGPH3QPccvJrN10tgID+Q2WHBwvzuXY/r36jnZwokFqf0G0GS0KiS+NXWj2of5ti3YQSIgBvUPodkne4394Tl4lmjtfef7QfLbf0rjuBp695VckGXwgrR6YOHgdesVK4e8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:10 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 08/16] block/dirty-bitmap: introduce
 bdrv_dirty_bitmap_status()
Date: Thu,  3 Mar 2022 20:43:41 +0100
Message-Id: <20220303194349.2304213-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efd4a457-088e-445a-73a3-08d9fd4e3017
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB4736ED601E187A0A97138608C1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nGf0XPgMSldWnjl2CYifDkG3CZ9kOLTb9O455vN7KAhSiiGg5xsQhJ0qBbGjnMPkYpnr/BGOMIddD4a5XeMSjc+G3W4A8CtIT6tIgIRioH8+x30axJbBIwt+ja0wx51QV00vyLB4b/cWgfbfOnMCWWIVDxod6DTgUMYe9nNDUfS5k3cvy5XSfFO1P74r2Ip9HN3VB9v5iSgyD38yrchbfeoX8KiyH70opdqAssq0p/jIOTxMmtkNJAwUqsw4KNP/7z1QbmrkwYkL9QOt47J34XyhVQ0s/qzj/d4MTJyuzNga8s37ZaKQMVzmLQ43DyZdfBh4/jyadgcUmgjIipDP/fIGU4oOJKRUqwZQr0+aYx974inxxmKj0DZpiBsqh2AuEEq37zQfjCmNEnhCvl/t8FAUb57Tm8v8RvlE/wT1DvNYDWuDDqKQSo3FWt/p0xamy0bo7U61l2CB/qMvkAAGmutv1KQzgcV7RgjuvbWATSsgttxdOWEDr6CBdND2XJQ/boYgodWhwCJSxWpO8N8JkjMiwcRVETH7r2k+BzLsqsGLpxWatlVR3nVmS07yAWNpMxCvPcinzGcWAV8fvUoLYUrzAcY/gVRU4S37+TL250tbnhGa2l/Ogb4HeWSY+YLMukxzvflq45XjEnwFNlE3480Ndm+zyBfXPqAMCYeda/ac8uawk5lWxci2AIkb0ngjW6jF3XTxFkS4H8usomRuUX+XLOpurcZD096KMxviAG0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JGqQM26wfLLeCj4eJPxoPoI/Ry+l+bAVyKo2qsXKUAaIE/mgQSr77tpO5vaP?=
 =?us-ascii?Q?UKxNinfienprAiJM4YQHwrTSs7KywTsmirzhOZp2Ud5avla7cnUv4QoTv/xN?=
 =?us-ascii?Q?BlUBD7PRtgQpzTYmbIEBgsamvnxFMAagTtOQ2jowJqrJTIW/52XJDra51k1a?=
 =?us-ascii?Q?HycpoolTW9xmtK6s8NOreRBtSXK7ryHww9vKMhp/LShGazv+mBudjoMnq8xx?=
 =?us-ascii?Q?vNwhx60et4faYUwzixP5cGjOZlxurBxBMDMSzCajp/i0ZyjAPjscDGHJ+Vmm?=
 =?us-ascii?Q?tLcPlCKaDxISQ0mcvzO2WuCdavtQq4NdR3+F+N/BcUhNIaAOC2nhrg6tT55E?=
 =?us-ascii?Q?Z780IVhJYt8jgpqbV9YqvXsxIYnZV6snUEls9W9/nuGCiC8OTc22H/bhNeMh?=
 =?us-ascii?Q?F5vxP7yjyUfuymc2YjQmBLtsC0keh0c0M1elscdiTShn/+/4/m7FYg7aFK5j?=
 =?us-ascii?Q?FCzFPepTG1k9J5Oep0BD3hU33qkhobSJ2P+u2nT3LoDTggmRfXTBPDM33YPs?=
 =?us-ascii?Q?xtGIwbylOd3h6DjLdhQZsOhs5O138z8xuJISVrmvmy58Ef+n2e8+OxSESQ1V?=
 =?us-ascii?Q?huX3MzyFK5X1UFFG0V15kUHftLVkJIEYtp2EBEF4U46w6wHmkGkZg77zgF/d?=
 =?us-ascii?Q?mAu4sMczdGsVOtprq20jZ0/HLFBYK+5ShlP+XzCfaE/8/Rj2tPBvpwZscU5w?=
 =?us-ascii?Q?Bxvl3cAJ5jBmKnbjT06NjQSroOTRETEihCvJf6HAZM2bW+MgwLjt8HuIasDL?=
 =?us-ascii?Q?pVheZRRGo9OgumZVqXXSYqkadgN/zap2JMM/ZUCS/fEe1mAyi9JKOgxa8qVq?=
 =?us-ascii?Q?E1LB9sle4qXCz3wCovx9T4Ih5RbIbIG8SZnPH7ZE2zV8xc6MMdhUiobfTLdq?=
 =?us-ascii?Q?HNN88aesV2GHjWY2PTY+4ia0ah2mUuP9/7WRvCSfBCv2XcXsfwCZ8ekPqzU+?=
 =?us-ascii?Q?YZelPvhtwaT/KcloMP9S4uyceIUVZoaTF/eU5vByHskLH6Gjxl37AMmw64pC?=
 =?us-ascii?Q?sq76MaJkBlnJTWy1xGh/7YY2lqQ5oc/NXm+Gj4j/jnu7IGkZQRaM+8jaRF2p?=
 =?us-ascii?Q?XowcQjG/xKf0hEmtgyOtbyrqaNcTDai130PavvAMmkqzuffwKSNyXEiYrd/8?=
 =?us-ascii?Q?YY1DAcFT60xAk8iLCGOiQeJmI4k06CMyMK67tLYGrsZPU/zm3AnQVdfBsiSj?=
 =?us-ascii?Q?UhtU3SxfdQJAdoJytcl3s0lA+0Tj4pabZx4tXS/dFIEIsSjaXKsOfgjibnYZ?=
 =?us-ascii?Q?i3EeFIazSRip1DOCDCIeqDC1OggfDfISO7/mbWBeWTDDz3f2YSPdse9p0AuS?=
 =?us-ascii?Q?svrS5Khbl9psA+D5awNaCSiS5oBaB5yIKVM+Cwz5iN8NqrLf7ayGLHcUEtW0?=
 =?us-ascii?Q?UWabP4TFCjBpRU0Se3TelLBn2yGzfZ4/it2hb1UGhAoJ215zH4Wzpo7y+NnD?=
 =?us-ascii?Q?eWfebAaPOZLw0ujWWQAP2aLZG3pLJSFGQcjozMn+Bh4OqImHkEJpGgyp50CA?=
 =?us-ascii?Q?Gep++sNQoVmq9OrihvtJiVZ1VNGDNxuF/NdAifplBNpDdgwIPvNHwXorPE/4?=
 =?us-ascii?Q?Dyb3EXUoYDnmNYJR1GBDQ/5aAVo0tRO2sH6zj7t4AEaMZhN93lDYhhVHM0gB?=
 =?us-ascii?Q?vaHT6OyzkgTFUsMEgL2LNwqpRyFGG3XvH4V8dIKe9moZp/Ap6UoYcBSexSwx?=
 =?us-ascii?Q?QGDsDQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd4a457-088e-445a-73a3-08d9fd4e3017
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:10.7017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvDN1I28Fqjj1Dw63VUdLPEahVw5EX177hE8zAIM+Aak9d8BQa0hLfmlwtDXboM5p4GUDJV6IQVvtBr/etjje0UEa9A+CKtunCUCumCjPQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::710
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::710;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/dirty-bitmap.h |  2 ++
 include/qemu/hbitmap.h       | 12 ++++++++++++
 block/dirty-bitmap.c         |  6 ++++++
 util/hbitmap.c               | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index f95d350b70..6528336c4c 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -115,6 +115,8 @@ int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, int64_t offset,
 bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
         int64_t start, int64_t end, int64_t max_dirty_count,
         int64_t *dirty_start, int64_t *dirty_count);
+bool bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
+                              int64_t bytes, int64_t *count);
 BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap,
                                                   Error **errp);
 
diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 5e71b6d6f7..5bd986aa44 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -340,6 +340,18 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
                              int64_t max_dirty_count,
                              int64_t *dirty_start, int64_t *dirty_count);
 
+/*
+ * bdrv_dirty_bitmap_status:
+ * @hb: The HBitmap to operate on
+ * @start: The bit to start from
+ * @count: Number of bits to proceed
+ * @pnum: Out-parameter. How many bits has same value starting from @start
+ *
+ * Returns true if bitmap is dirty at @start, false otherwise.
+ */
+bool hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
+                    int64_t *pnum);
+
 /**
  * hbitmap_iter_next:
  * @hbi: HBitmapIter to operate on.
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 94a0276833..08d56845ad 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -875,6 +875,12 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
                                    dirty_start, dirty_count);
 }
 
+bool bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
+                              int64_t bytes, int64_t *count)
+{
+    return hbitmap_status(bitmap->bitmap, offset, bytes, count);
+}
+
 /**
  * bdrv_merge_dirty_bitmap: merge src into dest.
  * Ensures permissions on bitmaps are reasonable; use for public API.
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 305b894a63..dd0501d9a7 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -301,6 +301,39 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
     return true;
 }
 
+bool hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
+                    int64_t *pnum)
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
+        return false;
+    }
+
+    if (next_dirty > start) {
+        *pnum = next_dirty - start;
+        return false;
+    }
+
+    assert(next_dirty == start);
+
+    next_zero = hbitmap_next_zero(hb, start, count);
+    if (next_zero == -1) {
+        *pnum = count;
+        return true;
+    }
+
+    assert(next_zero > start);
+    *pnum = next_zero - start;
+    return false;
+}
+
 bool hbitmap_empty(const HBitmap *hb)
 {
     return hb->count == 0;
-- 
2.31.1



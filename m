Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3235E592B2C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 11:19:15 +0200 (CEST)
Received: from localhost ([::1]:44482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNWFe-0004OX-Al
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 05:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzi-0000bG-03; Mon, 15 Aug 2022 05:02:46 -0400
Received: from mail-vi1eur05on2121.outbound.protection.outlook.com
 ([40.107.21.121]:60736 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzg-0000Mn-Aj; Mon, 15 Aug 2022 05:02:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUUSEdrVIghu0GDlIsRgadaaPOqh4aSKWmPKwHMNjN9VYgxyA/23FCL7HIlLb/SPMeOagMiK3l3kSE2Fs92lQn6U0JfG7P6YTyQhKkIIH5JXtgVvnX0xZigFtp1ALE9Te58XmFNuq3P2zz+OFynm6eW9X0khkdD628GDDg/AC8GThRdlNk8wp0SZG6Mn31YrAgFp+rHIVGY5xDYe0z9Y3CSBfkub/xArtEKvMSwLko4JGSfu5wjfc9ShZPvrnLO8zZBInh37fjFSndXIwfFcDikCxf/R05DrqXNCsBVAcLylXa/f0UG9iNL7OEQQoT998fr7YaregYAcwQhD5mGNpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlnS3YwwT/q9o+a7iMkABm/J6TZEZ26YVutpBiRSF7g=;
 b=MYxgghB3byyaBskuUs66l2y/ULY2XAigK2GRmrQVzdwlD48mcMDrqp/MldaAk3mmDC/RRygYBkLf433vicZ0Zfx6vrrq/+nuVF7gljfVsifjSJiAVjaVupu3+nT0rz6TH2ZwKF0eV/e/zKBZXowi6OPkCGLjq5/nr16HP8PlLtcGrBafiJsQNxHd8yNWay5IAg8isHtb1fmSEpm/o3WRy6FSUG8H8R6biXRxy+NGS4uGOKj3QmUnauuh2IaRTmmiUbIx+/pfDzrfjC1C/08shOfAN8vE8Hz2sSGCm5kMGg/ZYtFEMv+q75qy0bjbCEe63XNde3hEMr6ogsO0oVrPQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlnS3YwwT/q9o+a7iMkABm/J6TZEZ26YVutpBiRSF7g=;
 b=AwPxqIl5rIv6G0rLop4Aqeqs0nQ21nPeOqwnaaz2hCLemlN+ccVoo2yV07Bass/qDdHVXS8z0UZf2nGmRv4JVqXRrCg8brZHKhDvArLB9bswfOiGkPLZ/4ZBR9CUvjFEzGFFBw+Hkqa/aDHK0/OA95P86beq4phR64iaGdUxnFun/VupakaVF3gAitaLUcMi7hlHU9Mk/2sUDFmoPBsYBeyHONHogwhwS2QNo+I9fr/nUW6orZhRJ1M3tqySnCnbWMhWHa6hB95VsW08PSmorMqXryYYXv8FNI1WBzpKMnP+I+ktc/4/H6v/caclh5DVIZrKQZ8sUvVUJ86IJ3cRcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com (2603:10a6:10:2c6::19)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 09:02:31 +0000
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c]) by DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c%9]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 09:02:31 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 7/8] parallels: Move statistic collection to a separate
 function
Date: Mon, 15 Aug 2022 11:02:15 +0200
Message-Id: <20220815090216.1818622-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To DB9PR08MB7100.eurprd08.prod.outlook.com
 (2603:10a6:10:2c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57e6651c-ffc2-461c-dcec-08da7e9ce29d
X-MS-TrafficTypeDiagnostic: PA4PR08MB6032:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8gAFAYRcAAUQtRPj0r9l9Sr7oncHrdsoC3aCaG24p9WuSvVzfet50Cl69ORtTiUykPPfP5YwOGqgW1PdT+owpAwmP0WxkgzSlpKT465HJtOyAn3kOQgH1DDm8KV1KmlZhumdrcqP1N3cg3+jyIlBJKSox6kiauReXkYupSlrxQYoxwdWHoFzZzh8OjZnW1XM5lu6wWL9N41wR1qpaOcR3DmqFKXPf0zVM+LLXCqAY7ky1inSfU53tr3tnIwdKZktIjaY9QTTppuFXozNoIPSyW9Oi/4r5qPyj4cPYToIXg4UD1R2ZFQU0ZDQ1TyWmWWqbp0Dmx0XsEias0zhXE2fEOuw+m4sjXjls/WfjpA3EObtFb3hvwUSZYJlSXCf4vtYGgsyXmTO/GBW5XqnM18KhIsLspQucjFOCW8lUFg6UXmv/2+yu1BdO06axqB7d8Us8gcDI4lEXQnwdSQCn9LIqTAiwi9GUKTMF+yXR8IbWOEEGa3CgcJAILN3nr4MKtzTz984vOf5DHjvatHPlHtRyR3zpT87C7FW524KTinqvXDl8+SggJs1F5MEEgE2A84yf9cx9yfISl9cjzqPWp8X3Lzg2QVCUrjH/r7H1xsiVyushczrnYoxXl9fz9gKLlpYtLwJNjuCuSeYaleERtLXnPlP4azQMyj+2io1FTU96EwzRQgIlm0hXSe5nPeDBx7PB53qHMJt12dTKBVJ7JTJQWoUU0zdmfBNLfMDg1ZU51gVvECFmfygUP2CkhtCGWG476wIX6aI1tNOMsF0MUv/7MeS3mIDCoMQVNkZv/agAdY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB7100.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(39840400004)(136003)(346002)(396003)(83380400001)(86362001)(2616005)(41300700001)(36756003)(6506007)(26005)(6512007)(6666004)(1076003)(4326008)(52116002)(186003)(316002)(6486002)(478600001)(66946007)(2906002)(66476007)(66556008)(6916009)(38100700002)(5660300002)(44832011)(8676002)(38350700002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n9ZzvDnjsNQPaVwgd2nBWEyBBQW3LJeoYUp7IjaCgxXt/voE7BGJ5LWssx3a?=
 =?us-ascii?Q?X2zYG+z2UzGe5rJBdk45qUgCZLbmxvhhAeAZOdGODxb96Y3cYgBJiV+k/Wxg?=
 =?us-ascii?Q?iSy9WzCvSHYQ0bGmwmJ8YtEcceDNeDlHVcD5LIzUTlonRIAVfetP3+olZnVC?=
 =?us-ascii?Q?+Stjfc6PKN5f4onaqHCi+K2CdIw6Auzpj5BWjW4S9mMERg9XxRU/Y8X+/B3Q?=
 =?us-ascii?Q?fA1T2xP7LJwvzjnI513S5A6BGLsCMPAa0kDhqelO9OwsmTxtHB7qV6pD8bBH?=
 =?us-ascii?Q?jpwxijn55cGMrlY0dvHkkNgppXEfLzpfKX+AI8tP29zJlhx1tJPH5Ubvxjts?=
 =?us-ascii?Q?OSWc334V9T4brFSuO/XGr0rhfwAu/iyMP6BeWcmlZLt+tNQBKtBBJ1aBuJlM?=
 =?us-ascii?Q?VgS8gNAj1E8E5Gs5g55Jd1AX2m3t/pb8P9Ppdu6juIOqqf6qeXLfm+aiyoMs?=
 =?us-ascii?Q?AhxMG/q2Z/HqV0VR0GoEFYEUdvLEWbzxy88FWnjxz24RILKhuK52qKrZAR6+?=
 =?us-ascii?Q?07iGHJv3wrVTHaNAVsGq7cZjFYnbQDCRraz9hIwMhb45tJW46u42zj7WUu75?=
 =?us-ascii?Q?10GQ4nuH9hHEbdrW2DXhsdr3DDB5AXSH/5tjml0XhVxQnruFjhvc1ZrT+wGv?=
 =?us-ascii?Q?6Di5wbuwdzUSImQkwNyyIzcZwTC5o/BKNllcl42JnzlFZQtV7TO+G/SoC3hd?=
 =?us-ascii?Q?ne+R9zqf0YVdT07zly1eudr9K/w62MuyLFHIbVSlj9we7YSDC0FGwSoXMkDw?=
 =?us-ascii?Q?ZvepARnTiW3tbXCloC/OFLj9i2QWGwczH7s47heeRqMomlF9q+xA/zHk/BhJ?=
 =?us-ascii?Q?TEHHdeovNh6G1YQFJ6rg2Z2VWMteSBucj6wJIsYn5mGrPhD2LD+MEVOXvSSc?=
 =?us-ascii?Q?E1Z1dhPlxqCOya5/rDPr/m7xX2I3i+3JrGKPosI0cvvJ8vdD9QhWZ2d7bAOB?=
 =?us-ascii?Q?jejXf2WHBq64fV55SSVrjEHJWU+oyLDKLNc69/ZphhNqkVJ1T1243QvFVfPM?=
 =?us-ascii?Q?FFS7Z74tbaT3IfIODI+JNPU8Dbkedvf81mHs/3HGblJdZcG+1xyP0ejNwq2u?=
 =?us-ascii?Q?MpoT35XKUIpzBRdvDQ9zHruh+yR0G3wQMnRwPYmCLljcTnCL2PVSNPP9cdtE?=
 =?us-ascii?Q?vjYh4NQuweUsNviQT/eeqOrI1XC9F1sf+3XDC0cu+aEty+aneWATZrh2R8BK?=
 =?us-ascii?Q?sQbHMxdwMQNZ9qtLaP5qVTBbjsmHtnhRgSzaNaF6Qx5jnxwHYvGvWPnKLwsD?=
 =?us-ascii?Q?RfVghcvAX+m6i4zf0Wuqy8jZThTrbIhErdk6vS9Jp3sw0Vv++GN3L7HPA7p6?=
 =?us-ascii?Q?2BFKMDGiRV7Y+cx/YmlgUpBSACBziAh+g5vKYrAaqGkUlz7SzGKJrpvHDvUx?=
 =?us-ascii?Q?KqgBWXV1XJoSfwg3kQpwXhRMHv0trhWjjgmNHNOSAWwuLmAhMF++cRanWVp2?=
 =?us-ascii?Q?RCAmZ05FA0FpVdK33Uz4T4NaNE0NIScH3IEgzRaSMqek156s3LEBbgJkp52G?=
 =?us-ascii?Q?7vPyA2LEr4DVa7n5kA/i7f8C/cq922ys60+I3aKK7vWU5oTsrqyjdzMLVJ7a?=
 =?us-ascii?Q?heUJXXB7+BMsgmP8mstm4J3za4ee4UzUPJj3WMrkhkM6Sqjrk7pwwOv1I+Ui?=
 =?us-ascii?Q?eH1Q1wwdn2YerEpG2LdQ5NM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e6651c-ffc2-461c-dcec-08da7e9ce29d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7100.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 09:02:30.9746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfFH92Cb1hSLjZvwWAWzbggxvoPAVIUq9fXqQXBiQM2qjBKE4i/PRxggJsan7L2V6jAaVeyTNbRwFso6e7DQDBFlBlsfC4uraf3Iv5TfrWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Received-SPF: pass client-ip=40.107.21.121;
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

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
v2: Move fragmentation counting code to this function too.
v3: Fix commit message.

 block/parallels.c | 54 +++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 8737eadfb4..d0364182bb 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -518,48 +518,56 @@ static int parallels_check_leak(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static void parallels_collect_statistics(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t prev_off;
-    int ret;
+    int64_t off, prev_off;
     uint32_t i;
 
-
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off == 0) {
             prev_off = 0;
             continue;
         }
 
-        res->bfi.allocated_clusters++;
-
         if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
+
         prev_off = off;
+        res->bfi.allocated_clusters++;
     }
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
+
+    qemu_co_mutex_lock(&s->lock);
+
+    parallels_check_unclean(bs, res, fix);
+
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = parallels_check_leak(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    parallels_collect_statistics(bs, res, fix);
 
 out:
     qemu_co_mutex_unlock(&s->lock);
-- 
2.34.1



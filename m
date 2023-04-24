Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED346EC890
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:18:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsKa-0006gG-4k; Mon, 24 Apr 2023 05:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsK4-0006Q9-MU
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:26 -0400
Received: from mail-dbaeur03on2071b.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::71b]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsK2-00035C-PO
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Syj8fH/WLulPk6OpEi94sTZZmtH9hDHdzFANezdFvB1e+7rQsPVzNCTT8kFW8hQ3jqllc08alOrdISe6mwAov82yqTlCtCoNArlbiA4JTXphGY3pRqpeLGTQHwt/ukOCMg/o49en7orMw3R+Mg6Q72yuVTikZ3fgNA/3/8on2oJW2LimpwRCct5aKiJUlWZGymxYgGxkiCRq7RR+4ry1+v7tOYO30LNuJd90GG8W//jZxZV7GM7Q39+dl45dBu/hUVZYYw5MYGOZe3E2ke21awnALWjuCHIr7PrSGbjLIjEnqLTFNXXhLm9xWOKflLok5jC86d6VsZNVrxLwt7wofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zT8W6VkfskeNZk+bb6qA74Z5tZiFUW3i0tPgZQDqOfY=;
 b=DNFDJMi6nIhPtGHrw7c2EC5zeWR8xjfC+AOgxnuwsp4yebww1rGIIi6Lg844ZShK9maghgZxYNlQrSiWHhVY2PQ+BChojb4hZBX4o9s6gDigODAtdstrU2n9oQfarHful9Nzu4diipfui0YSoO7yjIRwIGtyGgz7XpayjwBJhognWeLpz4z5ne55Dfw4wxvBXlXLuqWEqAFKv1hBZDntTzJIjPQe7bJN1yNTYeth1rfluKnzVp98BDrsaTlcsZatlZdC4BAyJb2I1uYAzVqWbyCfo7r1f86jWTwhTEqWDN0qSNd5D18OVUmV4xdasZ1KhpBvXbNA5CTJNPCKysVFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zT8W6VkfskeNZk+bb6qA74Z5tZiFUW3i0tPgZQDqOfY=;
 b=ywaZTggiFKx4N+VRRaWTgScQvvDI3tHQtW3NjBg1VLl7HZyOWXEweQILXPtJJBasD5wz6Rr5vWGInk//wBhJMjPz9JjDuNl1IK65sVjOy1haop6qqplLKiPP6nM8ujRDfBeFDCCJA62HjxMPNcwmBySdqCBTzWprj824Jt+V8TsB/psLcEVVicLuqjYBdTHIvVA7zpFS5jG6WqqF//vp8XWoBLPzV06UCaYmZtFqg8AU0NtX4rMKERsnOWGzFjQxjq8Iizhw3uYqO9KCuW56Y/Nnbkcg6jCoN90HMlwGuZWVSvkhz7cxjUbSWkwisjU05uOZoJgI7bDgC3X2mkPgKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBAPR08MB5832.eurprd08.prod.outlook.com (2603:10a6:10:1a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:44 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:44 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 03/12] parallels: Fix image_end_offset and data_end after
 out-of-image check
Date: Mon, 24 Apr 2023 11:16:17 +0200
Message-Id: <20230424091626.195590-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
References: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBAPR08MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 56824d51-f826-47c1-17c1-08db44a49e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0vUt79JB4L+5201f964HlJyamdCrUH5vJNF4sbvsqKp18ORpx0wKjzJxTvB8NiKqkenLpkKOkte/OI2d5hX2sWIns2ivaw49HgdWAnhqdE0oOsGf8Yst3gcUBLdkbQC8G3abLIltuYLPMl1CbVUnuihDVQmx5liflZzBIVcXwJUOW4B083nT+EyNHAA2giwmJ7RZWKhGgkUb91K5av7PFp9MRFzWFE2dmWISd5u6GdmQ7s//1s2njaMrBakFfTcaXNU5UUoqq7puw7En/bm0gPofIaYfGFY86GwlKjxHT/8AUgPU2Wmm4AldkjpH7r4LbMzVbxeoy1exmzUp70Kg98q4+RPEkCxQWxs9zihwTUuU7kKtYrGKyoNsirOBmPwkJ7xmVsx4mTh+K8Pju+HMDn/JWRrB4OLq9R4OIwJ0EhWfCuPTvZL13J5/+BuaIIHbDzO39jRp8dJVrvhKnf+F2Zn9FHwSb67JLkFzJVAEZQJWFn3qwAmdFix14zW1e7uMGa8zhjElXrgitvQLNLy4nvuoLbjtMEQ9y2sIgJmtdjn1k7k3O8Js9dZSOBVryIlnJT11h6YBRxDrdxCdSvWhHwwW5v5yB/HDhW4yX/eQ9xZU0ITk+X1EzzBaAs23y1+0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(39840400004)(396003)(366004)(451199021)(5660300002)(44832011)(2616005)(86362001)(83380400001)(186003)(6512007)(6506007)(26005)(1076003)(38100700002)(38350700002)(8936002)(8676002)(478600001)(316002)(6666004)(6486002)(52116002)(41300700001)(36756003)(4326008)(66476007)(66556008)(66946007)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QTfHOCkTtzjiYtWtw1vr/KHA4qYslfGo0xwxJ3czTzcFWx+RJEJAalpvnFbS?=
 =?us-ascii?Q?q5Xbk76KQDyZx8fJEyat7pDl0bB352HD9axEVny3OOZvyPa9vcYg5og7kZjO?=
 =?us-ascii?Q?qxKjF/U4CVmQOzhyJSF5pwgaGK1o5Fm3a3U/HzXC5iG7S1blCBqqGSUfcm3T?=
 =?us-ascii?Q?DsBea/Q7gSVxGfPGJo+P0LFZdBLSh6Rxxyh6qA1WyRCGkPMMCkMVS67LNaG3?=
 =?us-ascii?Q?mfEt0GRDIEqd8xQAulUN8CX3SGtj9oF0EkQ1rWjaL4LOatfDStfzcR80Y05G?=
 =?us-ascii?Q?w882WMNr8RugT/tLNMuv+CdMpyfmVnJa1tTm84WYmHFLRNpCFuzDHdQOCF+G?=
 =?us-ascii?Q?6DNTeo39fYQEgTXXdH6bzmoH9e3jU58NSI7NKp3/tuxt2FAtGEPc+YC0x57k?=
 =?us-ascii?Q?FMFFo7NfIrKRzw7Xc4LtjnowOrFPwWtKfBQ1zkne+ZS/dxW+l0+80XPpeFNf?=
 =?us-ascii?Q?8sjdqi7Od+mAGAz5d1vEkBF40mHOLxurWAs42ZdnTW/rdezXKSWe6qOqVtS3?=
 =?us-ascii?Q?hGWcEnyMuIenyn34sGvg6kE7glN02RWS1gDGmlHENDLAkLjLbZEimRa8Is6P?=
 =?us-ascii?Q?mvr5bnXCzN8PedXmLVzyP96yc3wCCXiP9Z3ECWOcIYmmvWXk6Kb9jkaEvBi3?=
 =?us-ascii?Q?a6v55kljfreCsCWwGTgQfee6yz6E0mwJgEu7QC56+6VdrlTmdG9j9YNY/ghb?=
 =?us-ascii?Q?1dr+C6X1n4zY5ycA53NKu/ExhGl8xbXprpTd7/6bGdzbJToLIrgCsTVNFf3l?=
 =?us-ascii?Q?5X0T0ZL3D5VaGd2vhdHCFz7Ncn6jZGU1zjDF4L5gW4ujZWs7q8RyF0vpOkDR?=
 =?us-ascii?Q?52cXzfbh7+R5DLMLJnnljOVT0/QbrDFRBHPVf/pBQNpJdhGGa6IIboukX3U4?=
 =?us-ascii?Q?vM26cpfHEdvoVNT63VN/PJW6higOinT3GRehRPixZXdVElOYrn1dfl7zBuuM?=
 =?us-ascii?Q?hijdWlwdo1DQy+shyQv0IrYbHesZZFPjo2eg5PF5SOipb8GPEn/y98QJK2YU?=
 =?us-ascii?Q?1io1bJN2M8+/C3JlP/eqtUXhp5nGYUfR8CNthIVTASMjg5qvShkV2yJ48lUZ?=
 =?us-ascii?Q?4QKL8+VV13j303qJ/QM0+c+ZBzU/C0n8zMoAN8FITqDquVAuU41vCWNx77hy?=
 =?us-ascii?Q?Wt4j0kOE/W3DYTuBXey009961b2DTLngFi3xvYU9C5Kty+X87qq0Z+8/HM3+?=
 =?us-ascii?Q?GohaFTM7YiAHnPGT9Q/JGWeXtz9rHga4dP4zOL1ut/qf1R2p1pC3HIUPeTQL?=
 =?us-ascii?Q?hdbCCYrZDL7vRYf0JmHrT1eaRpHCKSq6lB3Cqv0Elqyr/LVUbUrtOB6dJL2j?=
 =?us-ascii?Q?HzoxwavB7zItIFysJy/UA2Vp+d+TbuHTuRMwPe319KInZ8Pxxpg5KmnRA3S2?=
 =?us-ascii?Q?keBqUU7N5qQRLP0oDVwLWmuzP/w7uhxvkDyq9WgdVQPBmp7ySOrYg10b9wT1?=
 =?us-ascii?Q?FGWmpum+LUzYl5KCStWiqPedfvL9wXLkyqQHJseimDCjwYSufo1tErJ7H6aF?=
 =?us-ascii?Q?YuhP1p3VKNN2lks9TBzKysg/ITZPCOlnhp+g1B9nfqV2JW32GBRRkgnYciWn?=
 =?us-ascii?Q?PWY9nECtjLKxz+kn15WJq3R8NFXuTOTjPM3Itx1Vcs49rb901qGAZUg9bcnf?=
 =?us-ascii?Q?1w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56824d51-f826-47c1-17c1-08db44a49e39
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:42.8846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9xnx4b/sOJ6uLQHqp5XgaCODScoWuEWca8VEzkcm66AMyZ9kMUVj1Z0lZq1AlcC4warJkp/x34CamaquclddLJ8wEx0o9S84zFoNeQcB2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5832
Received-SPF: pass client-ip=2a01:111:f400:fe1a::71b;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Set data_end to the end of the last cluster inside the image. In such a
way we can be sure that corrupted offsets in the BAT can't affect on the
image size. If there are no allocated clusters set image_end_offset by
data_end.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index 4d6284a314..dec4fe1f06 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -490,7 +490,13 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
         }
     }
 
-    res->image_end_offset = high_off + s->cluster_size;
+    if (high_off == 0) {
+        res->image_end_offset = s->data_end << BDRV_SECTOR_BITS;
+    } else {
+        res->image_end_offset = high_off + s->cluster_size;
+        s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
+    }
+
     if (size > res->image_end_offset) {
         int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-- 
2.34.1



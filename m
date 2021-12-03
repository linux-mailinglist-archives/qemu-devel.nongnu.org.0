Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAED467800
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:18:50 +0100 (CET)
Received: from localhost ([::1]:56610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8Sf-0003T7-7r
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:18:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8If-00027C-Jq; Fri, 03 Dec 2021 08:08:29 -0500
Received: from mail-eopbgr40135.outbound.protection.outlook.com
 ([40.107.4.135]:40808 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Id-00071Q-Dl; Fri, 03 Dec 2021 08:08:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+yJpJZeZuSC6dnbYC98n1dcObcGhUKpUBh1Tdj1bNDn1kwkBL81xGfU5FrwWypiiAnBl56Mx6harDwfi3VijTqgywBdddd2lDq0U1QI4fOtE+VyE1A3src1rWfDUwgFUjnkbH2gV3q4FFsEBR8e5YLh1NWBuRwspGoeiYqTffwUzY1edDbZrAmN/W2HAxfNq4tGiQBtnOjWfMXDTasbqjsNHJzMC/RkTJMHzBI4/KS/IHK+bXceCcajAaLXA9qSz/BzcoqF9Hj4lX8O1C6x5nKI6ppL89mtvyY6yvi0aWKpnY+Aoc4YpJlJ302mFXeM9akcYh/wuHRs3Ny9q8YhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZ9duRdLM1iFu9d6jG0ecjmGr53zpdW3ngUMGs3ybAI=;
 b=Z/6Y2kSojvKHLPfC3sLAW5XSY5hMy7+O/jzMKTdcxKZNxJaDl6UpQv8o0pnXxqLIcUiNMsEwpJVJPeB9a8PmdCSehIj/KqLkMb1zPyJtywt992GeCIP535bLBI04jBamXh1xNk0cWmaUvnTA7kkogMP3BRO1ed9qbjjyF3O9eMfHz0ZsWPc0jDCVmpZCAbfYw6ZxO1U6El4gmnEv9zXMRV10ZnOLmXaOgUNNDv+h0qI1ZvJd7AHt2droTGIRj5D0/snKu8wtfOQ+idFWZM5+WhLzv1ch/N8PJ3QWIX8zK0eQ13G6AV5Cw+CacJgCslC030E73RBg9dZcnJZKkpiqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZ9duRdLM1iFu9d6jG0ecjmGr53zpdW3ngUMGs3ybAI=;
 b=koOJ0CaB2MNhTmB2bR4KCuEX0rOBbAISKxJMmcJ2zOj78RgJz+JbuadQHqt2oUUKP4YWCZ4S8Yyq9l5cF4VVCfl88h/cy8J3TScn+X2htQ7N7JiEwUSNox8DnNR93g+in2ASzMd2WFycVM9xq0/Z4jwgH3uYh++1yUOxkzoj88o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:11 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v4 10/19] qcow2: simple case support for downgrading of qcow2
 images with zstd
Date: Fri,  3 Dec 2021 14:07:28 +0100
Message-Id: <20211203130737.2924594-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6191996-f52d-4f36-55f2-08d9b65df6f4
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4515F7370EFF264CA469FB22C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nnq+6Yfc/fDdVIpnKJFGEKLKJkNi2ZnNtT+U2rpd6zh58dTSCAh5+txDsasbLpsGwqBS+7muZAt4/e/Q1zDTxg52RdQ5o2F03qJOOnpXBdZ60P29KZ8qewoT6u54/F8qLHRasG8lJO3y0NceurJzoHmyVRVXoFoxTWHHM316ndozkkEvE3CK2HenAiHK/N84autF+e2veo3a1uacfq9yFNZat+1l3Sbvl5ThZwapkSls0+RhV8w0QbZEgjKPJrIKFkNak2P/dbbcDrxFXsLW2TL0JQjKCPydxGMeX6HMuTDq4mYVR747eG+PRY+bHkT+UwVS496LBK7vOBRxBtmDHrpXaq8Isv0ZnFs4YsaYC1WXbzKYlZ0XDFvhe9qzxOep1uSry4IBeZiUC33fRvyX97d/mFCBwKUIP8o5gM5NR2bCfaRy59ExDEkEZviKcwCgCtLQ7KCqZ25cNinMnJW2TBXcs4CB1PCYLm4RKIXjX6hLk6DpZZ1zeVb1bQi65ZHIGS2TX3a9Yv0SMntWcCkuFwZiWQozW0N0wQkPJzYnwlvqUL2MyIY68fi7HLBjf3W5hXzycolM/BcVdrILVP30Or9SNZNDkqXBlB/7rFPzQzh+FcW99WzvSLDzk12oTeO6tmggFHJq0W4Szeg+DrZvPGeO2pS9L6XJs8ffKnaiPS1bWVLQ/NJbkA1dC09tMrQz5ZX5z1zT6pVUtaOqJ2AIFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(6512007)(52116002)(6506007)(1076003)(19627235002)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FBvN7puNUcR0W3z9jMxv2WrxeqW6tm0dpKyCvQbjom1xIE6dQygwPaoeZYpr?=
 =?us-ascii?Q?bAe8kau5nx6vK47nBaGFGsRKrHDldRG51U9XwR7bM8jpjfAVEXgcncYRHLwI?=
 =?us-ascii?Q?TjST12i2vjGm1eElb93f78JlPJq1UhXQqs5vjj3tC38fyYDRMWDiEnWqHPR+?=
 =?us-ascii?Q?0v7ctaGCbsYuSNkioDexyNmErGPspk0DsXaroBj71o/J6GFgcmaBQlrk0dnH?=
 =?us-ascii?Q?A+7vMG9VhAXm0XgL2121Y/V6StJlCtQQ0C84sF/8G4aqzHm1beJfYB/buQ3x?=
 =?us-ascii?Q?1nF8otmyQgGII/6ZkofuymJJf4CNSRa7SB1u+8UVp+yz3BoJ+SVPjbeDsG/t?=
 =?us-ascii?Q?sFIBTnfv1bCNqoLGbI5FwvYraXtVetOsoywEm5AmiHIvRNvg9eZ+QpxH2Kck?=
 =?us-ascii?Q?nrXOcuzsQXFAvtrkpUhq6Wadpy4eM7sG9AtJHuDKb4OJI7G3P9iJy47ntcGe?=
 =?us-ascii?Q?XEnAniMv1ethsnYY6q7gICVYpOC5K3BzzNnD1FF9dk/yeWsDBeyV0JPI82cX?=
 =?us-ascii?Q?1ufPVkVmGbLPlZq9u/KsCTZfFjZ4KM5HjfOy3/ZJX1lbHSsKMDwOvu6uJLEO?=
 =?us-ascii?Q?P032RhFgs/53zvNiZhOsRKbyQHPUCLjyWaKn6CRTLlBMOU8KKfNsXKDKERmX?=
 =?us-ascii?Q?D/prcx/mx5tkaSt0Dje/Jj9VNyLaLxajRBo82IdUlPZx/uVNJu6MNzQLctH1?=
 =?us-ascii?Q?KVOYM7ZRmECAhx/YOlF6Tpo51beDQgBmWVl4RQdAImUCFIGNgu95UXcg8A8L?=
 =?us-ascii?Q?uuVAckhcyvKKXFEulewDm6lswbfx0ZNg/pyKTLhg4pvjUn0gKVVgUyPGaiet?=
 =?us-ascii?Q?vDNFPmuKnTqLO4Jqcjs0NYFBfgyRwdoqcDs2XoZYkZ65oZylxxj2en2ESrIN?=
 =?us-ascii?Q?vSa2m5s5+I94YwlbWMdKi7ktPFFSCulkO+gzpg9uhU5kTIo6lFMKILsFPBCy?=
 =?us-ascii?Q?pHtS7UWl3/A+oQYFQ1QClDXx9wYx/jjmRBqNnTVZLMASdGjrpglqNZDOXl6F?=
 =?us-ascii?Q?zyquCT6mA0jt5p/i9TqsARDysthQUQ/Z9+g2PriD/GpVtA+nJjLm4Qfsl+CE?=
 =?us-ascii?Q?jkHy2TZZUEqNBU5cNTAYglMZ4wPcTSHwMHkd8wR4jN26fZY9/dRSNC2JKHhd?=
 =?us-ascii?Q?LhcFMPmC4ULLuQ7NtbFNXbkJvNjmsaZVHWoORuFxDxUixzXAyacwaRnCMT3E?=
 =?us-ascii?Q?VO7sHHGDENyF5YMc7eyT0WGskBoVrLy6rFdKW14Xy8Qv66bQMNsoT/uE3obe?=
 =?us-ascii?Q?SNbNnERiivLuBS2udJW6fPOE6TyUQGya1946KYSg9KQ94vhUXvyOZYq2Fv/K?=
 =?us-ascii?Q?95vQL/spXIFlJt2Xsox56ZDdI1iF8vI7u8t5IWoE0bFqtws85kazV36Mt8IO?=
 =?us-ascii?Q?j3oS1Y1MpsGJ/lCWITJY/z5sFKc+sAWPbJ84J61Mi/7wahj0ysI9oU7gyKQj?=
 =?us-ascii?Q?1/sanpUXuFQKLpv28qrtExorvmlTZWSJFcoPu/Bvd1owX4FhuWDoljh3oJaa?=
 =?us-ascii?Q?8y0keWpFXcLYJc70zXk6ucR2ApFvZeKkzRQvZXyEwBMizQ2ZmZUHW1GbPwM4?=
 =?us-ascii?Q?jZHcXc8SFhPeGNygBLRWN4VWKwfA8vHShuUAgk1j0wpmWsyd4LktCoS0vjcw?=
 =?us-ascii?Q?4EhYLjQ8g3dpJwiSXVItSbwhfcJee2BEUGr6oeWbXi5zDIuGAlHSe+iUzhiJ?=
 =?us-ascii?Q?MyyBBw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6191996-f52d-4f36-55f2-08d9b65df6f4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:14.2312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8k4cz8hZcdS/Y0H4zrSYWlop25spstomW7oEWwYR0/VXO/UvXlODPvDqt69DyACJPaoYHl0waZZ8f2NhfmXuK3xpD/pn+NEpdBSbIYG39gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4515
Received-SPF: pass client-ip=40.107.4.135;
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

If image doesn't have any compressed cluster we can easily switch to
zlib compression, which may allow to downgrade the image.

That's mostly needed to support IMGOPTS='compression_type=zstd' in some
iotests which do qcow2 downgrade.

While being here also fix checkpatch complain against '#' in printf
formatting.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index d509016756..c8115e1cba 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5279,6 +5279,38 @@ static int qcow2_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
     return bs->drv->bdrv_co_preadv_part(bs, offset, qiov->size, qiov, 0, 0);
 }
 
+static int qcow2_has_compressed_clusters(BlockDriverState *bs)
+{
+    int64_t offset = 0;
+    int64_t bytes = bdrv_getlength(bs);
+
+    if (bytes < 0) {
+        return bytes;
+    }
+
+    while (bytes != 0) {
+        int ret;
+        QCow2SubclusterType type;
+        unsigned int cur_bytes = MIN(INT_MAX, bytes);
+        uint64_t host_offset;
+
+        ret = qcow2_get_host_offset(bs, offset, &cur_bytes, &host_offset,
+                                    &type);
+        if (ret < 0) {
+            return ret;
+        }
+
+        if (type == QCOW2_SUBCLUSTER_COMPRESSED) {
+            return 1;
+        }
+
+        offset += cur_bytes;
+        bytes -= cur_bytes;
+    }
+
+    return 0;
+}
+
 /*
  * Downgrades an image's version. To achieve this, any incompatible features
  * have to be removed.
@@ -5336,9 +5368,10 @@ static int qcow2_downgrade(BlockDriverState *bs, int target_version,
      * the first place; if that happens nonetheless, returning -ENOTSUP is the
      * best thing to do anyway */
 
-    if (s->incompatible_features) {
+    if (s->incompatible_features & ~QCOW2_INCOMPAT_COMPRESSION) {
         error_setg(errp, "Cannot downgrade an image with incompatible features "
-                   "%#" PRIx64 " set", s->incompatible_features);
+                   "0x%" PRIx64 " set",
+                   s->incompatible_features & ~QCOW2_INCOMPAT_COMPRESSION);
         return -ENOTSUP;
     }
 
@@ -5356,6 +5389,27 @@ static int qcow2_downgrade(BlockDriverState *bs, int target_version,
         return ret;
     }
 
+    if (s->incompatible_features & QCOW2_INCOMPAT_COMPRESSION) {
+        ret = qcow2_has_compressed_clusters(bs);
+        if (ret < 0) {
+            error_setg(errp, "Failed to check block status");
+            return -EINVAL;
+        }
+        if (ret) {
+            error_setg(errp, "Cannot downgrade an image with zstd compression "
+                       "type and existing compressed clusters");
+            return -ENOTSUP;
+        }
+        /*
+         * No compressed clusters for now, so just chose default zlib
+         * compression.
+         */
+        s->incompatible_features &= ~QCOW2_INCOMPAT_COMPRESSION;
+        s->compression_type = QCOW2_COMPRESSION_TYPE_ZLIB;
+    }
+
+    assert(s->incompatible_features == 0);
+
     s->qcow_version = target_version;
     ret = qcow2_update_header(bs);
     if (ret < 0) {
-- 
2.31.1



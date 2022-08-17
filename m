Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B19E597366
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:58:34 +0200 (CEST)
Received: from localhost ([::1]:49848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLRA-00057b-Rj
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLN8-0006fB-H7; Wed, 17 Aug 2022 11:54:22 -0400
Received: from mail-eopbgr60098.outbound.protection.outlook.com
 ([40.107.6.98]:6277 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLN6-0001Kk-SK; Wed, 17 Aug 2022 11:54:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehnu1VaxJZmV1g527XMi5t04TmK6ky08tulmu8kNFFbT3WqwLpKNdtf0PN8eIAw2nfPrOeKRKfWKvtR5/oxaCcas0P0TzIY0V2hnfvhYAMZPJb9t51VsSU0G/qPdzt/o+dHKHrUyGR/P0PJlIn0YQEZgiwP6Et/txl80JzeESmtuShKZwCALqscEr/OzeLblZ4mLVU6fVZRARd00750Pee40SKn2m0yttodbqUI+HmoBFJXgEx8MSHZJyVFxJUmmLvMXN6PVhZwCgAp3bO97D+53H0r+MPCOcTv7l/bZVGeoI+VKqz7yZ/4qgjiUdvuL1/TO6Wl4eEN6aQ4bUFk4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PD4nza3ucLUn2Vc1fnExtoFoGv04/vpL0DlNmzvipaI=;
 b=WRuWXKR8J7tWPUCewhIrtPeqrJYtAz8yS5Whm516RN1flzs2z9JYhRVAaZvavtEDmJnJP5XJZkAGKFNv3+L6OSGghQ9ZDHdTFf/iWz2YHiyKXvG992kotobhq1dPMVf/6k8Zw92oWtLHvdZnvdefWNOPt27Ye9Mx2ZZy874+RpKX7FQqEfx6WA94UphndQMEitlP51FTuGugIIkOkAArGrUQjyzeNmbfVwE/SYaUCuBdnZLwxoSZagMrf1UFxNeJ9pUzHeMHLuZ1nMRNfz2x5aF4zSudfVXneOtiG4RVngVX0L9BQXc5Wd6drwr0nDpD1A4F3lEnkOVlfm3+b3pvGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PD4nza3ucLUn2Vc1fnExtoFoGv04/vpL0DlNmzvipaI=;
 b=KxBGuvt8CiDa5HOef8PnVz2SwyNcew4YQgZt9YiYqadAmxlzyGK0f3fRU5BRhqQQ1J5sWDCrj2OBX+zAjhVNPGoY0HOZIP4vTwk/wRmEMKj+oBUJ0Bct9Ma59LApyw2bQU34mdLy/Scygps18oc3lDUPYQYQoTGU54kdU4S7RJ6OSCjhLb0ppFk/F+OZhOFGT80Ftegp+safeJ3QZseiDpnfPF9HkmmsGpuBonwa216z4/OsAaGR4rnZfEGovTi805nKQJu+Tjq03Ty395R0nXAo3yNe3wZVofmjW9ztJiWyEu3+nbSvzUJbNsu5tQVSbOqb+ugWUFRet0TveyDOCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6783.eurprd08.prod.outlook.com (2603:10a6:102:131::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 15:54:11 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 15:54:11 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 03/10] parallels: Create parallels_handle_leak() to truncate
 excess clusters
Date: Wed, 17 Aug 2022 17:53:54 +0200
Message-Id: <20220817155401.2045492-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
References: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0119452e-3104-4063-5a3a-08da8068ba43
X-MS-TrafficTypeDiagnostic: PAXPR08MB6783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8bKqPEw1FStnPMSQMYJkeILpiq72HHt1+cya2Aosb2jaWTVTgmvv889n1KHToIsvKveFkHZqXybxz3P2Q1l+MiI+Ovk+sXBAYRdGTjvPm1v7UNgxLb/ygU3EWOgi+zil0WWIoLo4gF95+UAXv875rksVsBvs7Wy5tvpDCyfo/RXLaNVQKtPUPmKBZ3aRMd6nH1Qv5BtipI99zap/vhnSf80r77Ax+ZMjg8gUR1Bw4sOT8ZlzYbDXlIjT73qWG9LnVWy1cHLTUuQlFurDO/s0fAsEcraYBZRJz8sdPHVf593M5M4+bJMBIMeMXwi29ORtl0/Pn3nIcuoup2swUVVLzmwiI5mS6nEffDw3xmrljlhlmqHRnOgH0VmpZ8p3UJJSCcRZWwpw8dYyg26VMOwW8/q1NpAVpckQ+FDIN6U1SMmTelxgZAZfKYeu3k1ICkTHezbQqYoR3C1Jb5Ub6KWSFSHvjHrUSYJ/+N3FjhHypv5JPOdRkcJS+8xMXTowMDEYCQjDt9QY/Pgn2iiaXKqDrMxteRraEJeC/YYgfXWBwOYHY62J/sHPbOnhBbRWwtJbGuxI9UbDp3znCe7R7JHM9qnO5nky9IQv7xBq2g81XmvaWIT1bnrbIxBUl4RinD3MotxcsrqCcBzrlQAU4pV6peB2mVtNsXl8pq33ibrIp0olmpNYD376HEePTvia2XDn3a5bkq9jFtMBZKZizKly0bK03RWggkDbnPeV3C1Ppn639k8KXU26mk4qfsy3km6SP/QjfjUXYzcQy+QCPS8NXSoEp3tkYE9smf/9Z3xwYd1uM2r4Xib0RnBLXxts6ydp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(66476007)(66556008)(36756003)(5660300002)(44832011)(66946007)(6916009)(316002)(86362001)(8676002)(6512007)(52116002)(6666004)(83380400001)(26005)(478600001)(6486002)(4326008)(38100700002)(38350700002)(2906002)(186003)(2616005)(1076003)(41300700001)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I7K8gUKGRUdxL1xQAT3R9QsrH5lZKlmPmACpHkwX0WVVZQgysMCcoP+DqIYw?=
 =?us-ascii?Q?m5yvRAYmiKSNH6XJvQNdrovFv55SkJbp7sU7iNyH7ujNFzkg4ZfN7t9mt9fk?=
 =?us-ascii?Q?VD2zBOVF3Ep2EHBumSnVijklVf6dJGuOsvxSnh0SE/kMW4lbq5j3SDegyRaf?=
 =?us-ascii?Q?loWOIhW3p+iJp8ZzdcIN7xaXUsilv3SUibHl4mWDX52RJjpyX2iWUNevmo9s?=
 =?us-ascii?Q?IsTrqMZhwET0o4QCUoUaygPkIzY7qVRHZlozu9OfsCiCCHlspUHyK7J1GyaZ?=
 =?us-ascii?Q?qHSv3TYzytuki7NMJGDmAGhiVO+8Pki+9woK+p8a/juOaeT7l7NYkn9z7BDR?=
 =?us-ascii?Q?BMIldgqTV3W+61zI4eumbiHTO+mkYvA/TnKwj2daD8t5uBxXsFBZPHVKK8s4?=
 =?us-ascii?Q?eH0M1pngPjoOrEGRfV0EeTl8WTI3SNgtRcvxwsL3D33FrHjKi2PYUzV1xAKO?=
 =?us-ascii?Q?pPpWeNLfeMDD/zA7FKynWJm9qYyfUogXtqSAuuSZpRF6uxwFHvFa9iT3m7+C?=
 =?us-ascii?Q?3uKOW+76m5mmBGrWkJv35DP6PVEfHvL+8TnMrXxzRTkStxBXFHY3sxMlvkRQ?=
 =?us-ascii?Q?PwQv+IIemo38wQuJT6jM80s+GrKCdr/Se2qYEePK6CSQI0v5D/GUIvXcZ9L7?=
 =?us-ascii?Q?UDVJPM30aezz8k0Sg2we62Wea4fSbI4I+gI86ugqyf6OdCZmoI2cdOiT5YW6?=
 =?us-ascii?Q?SeeqF5dHarUeNaXAfaVbAx4y9LHVwhLQBcv9fAnwTWZuk/kjI9bF2+QTASV2?=
 =?us-ascii?Q?a/TEn+DsNVSsvm5y6QTQYEadNpj9eW1XcrIbfENwtz419wfDJ9lzVbE2sLeF?=
 =?us-ascii?Q?37BK1jVhwGh4fdPm9CdX5nVfFxzwramlxwuryulM+wonvvWWvdG+iK0whHZg?=
 =?us-ascii?Q?n9GViM9heKOKaPrYAgo4fMKZ2WWiDxLCMZ+qam62tDEgPgZzaVRFv8H1ocgg?=
 =?us-ascii?Q?V1ZcsMm/1NAHXgWBAHkdBNV6yMwujI9u7sBSwf9pGXzhSsCdoMoUG2afYfIT?=
 =?us-ascii?Q?qyI+QZ1yzNOtvMuoOodObyFAgvF8IDZkAl53SP4O/zxsZcuNRIRjPUNJWl91?=
 =?us-ascii?Q?Jhy8tfZLh/JJkOt6E0kmcHUyrrhgNZlMRfG2r7QJQiro5GbVENvtX2+qotEj?=
 =?us-ascii?Q?HThtigmWs4osLBLgO1LgK/05Ayougle4NTlLoFbb4JuDhUylb4Y4LgxWTkOm?=
 =?us-ascii?Q?8urQoZ8ey3IGfPEuYlUVI+L8CofjlZCwEkPXN+/EJPfny01Cnv3kDsLSoRhT?=
 =?us-ascii?Q?PpyFULweifbsYOBV/hdjE8ViwLuY/KkqmfEHunb0l0eZ7yj7uogukm/Yu1Yb?=
 =?us-ascii?Q?iyj3TfaoqYbHnc6IqpUdbC7K77oEUI0Su2/ceXjB+z2FEHnCf4aXoR/nbJ2b?=
 =?us-ascii?Q?wJ6iXD0yRAe1M+UqukinTQMypWBIbXEke6HviEeGRWZ38uEe/ZBQeI7Zooko?=
 =?us-ascii?Q?a4d9oyhxYxYI6p21xXLSVGFKabWC2qU9fALthaWHyMGldAJqjT396IMQaF9f?=
 =?us-ascii?Q?vwM9mXbf6gMb8SgbvURZXMZH1vT8HkujBkb7LtLArerQOGnmfTgoujlZO2qk?=
 =?us-ascii?Q?Bmt08VzOtD3pGsSI8zGZmVyoIE2NdzzMBJmYHYPddHIaUhe/h5BkyAayi7BO?=
 =?us-ascii?Q?mEA6L3ZRiEQD5gaUXvgO7Rg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0119452e-3104-4063-5a3a-08da8068ba43
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:54:11.7526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suPgbuh/le63raWmKdHBaA0E9vjdui7SH1EPSu44DKV49WX+jF/b3g26AClGCgRYU3BZskTkqk0RuQw3Czk60P3TzSHQkv/J6us4z+F5nDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6783
Received-SPF: pass client-ip=40.107.6.98;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

This helper will be reused in the next patch for duplications check.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 83 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 30 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index ce04a4da71..eba064247a 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -469,19 +469,48 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     return 0;
 }
 
+static int64_t parallels_handle_leak(BlockDriverState *bs,
+                                     BdrvCheckResult *res,
+                                     int64_t high_off,
+                                     bool fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t size;
+    int ret;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        return size;
+    }
+
+    res->image_end_offset = high_off + s->cluster_size;
+    if (size <= res->image_end_offset) {
+        return 0;
+    }
+
+    if (fix) {
+        Error *local_err = NULL;
+        /*
+         * In order to really repair the image, we must shrink it.
+         * That means we have to pass exact=true.
+         */
+        ret = bdrv_truncate(bs->file, res->image_end_offset, true,
+                            PREALLOC_MODE_OFF, 0, &local_err);
+        if (ret < 0) {
+            error_report_err(local_err);
+            return ret;
+        }
+    }
+    return size - res->image_end_offset;
+}
+
 static int parallels_check_leak(BlockDriverState *bs,
                                 BdrvCheckResult *res,
                                 BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, off, high_off, count;
-    int i, ret;
-
-    size = bdrv_getlength(bs->file->bs);
-    if (size < 0) {
-        res->check_errors++;
-        return size;
-    }
+    int64_t off, high_off, count, cut_out;
+    int i;
 
     high_off = 0;
     for (i = 0; i < s->bat_size; i++) {
@@ -491,30 +520,24 @@ static int parallels_check_leak(BlockDriverState *bs,
         }
     }
 
-    res->image_end_offset = high_off + s->cluster_size;
-    if (size > res->image_end_offset) {
-        count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-        fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
-                fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
-                size - res->image_end_offset);
-        res->leaks += count;
-        if (fix & BDRV_FIX_LEAKS) {
-            Error *local_err = NULL;
+    cut_out = parallels_handle_leak(bs, res, high_off, fix & BDRV_FIX_LEAKS);
+    if (cut_out < 0) {
+        res->check_errors++;
+        return cut_out;
+    }
+    if (cut_out == 0) {
+        return 0;
+    }
 
-            /*
-             * In order to really repair the image, we must shrink it.
-             * That means we have to pass exact=true.
-             */
-            ret = bdrv_truncate(bs->file, res->image_end_offset, true,
-                                PREALLOC_MODE_OFF, 0, &local_err);
-            if (ret < 0) {
-                error_report_err(local_err);
-                res->check_errors++;
-                return ret;
-            }
-            res->leaks_fixed += count;
-        }
+    count = DIV_ROUND_UP(cut_out, s->cluster_size);
+    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
+            fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", cut_out);
+
+    res->leaks += count;
+    if (fix & BDRV_FIX_LEAKS) {
+        res->leaks_fixed += count;
     }
+
     return 0;
 }
 
-- 
2.34.1



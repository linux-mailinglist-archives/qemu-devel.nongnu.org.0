Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1385A13D5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:38:16 +0200 (CEST)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRDzr-0006yb-2p
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtP-0000Wh-Gl; Thu, 25 Aug 2022 10:31:39 -0400
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:64553 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtL-0004oN-MJ; Thu, 25 Aug 2022 10:31:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6EdXQFX1pzzo/2/UQBDNYC9crsLvv1LDVRjAAB5z9+rabb5FrEyJuTCT7K48hgAAg30NAPXrXXUdp89F1qeL/Qbu0sGRLjeglCHpzFjk2rIemUSQa2nUqAxXsgLvKXfYdO+mPcQmjN17C1iA5/KOlihzVZpapZo0pD8mzG1vXV/0v0fcXjHw9JoU0CVctH8Mego8HtkQHld6v2Rcdk/qiO/7oWF8X30rxDyZWUj3GldE6LhRaM2e+XYsuFOJkpCGjVONipFhtKQtqD1L6tlS69k2Wq4y9njbJ7SfRoitLMde62zxjF6VMkst8fSKkowGS6htVxBoiHeVKGfzjHTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHAtEScGJd+8SaeeRRtxf4JjrblIDlJicxwATC0GIGY=;
 b=CmnBHl5ysaxyIP8zjaJnAnPvekQl0vk6E2UlsBeQoBMQYqnsS66okV2CWGyKjpHOGmZbTJIUvlH7Z1lfFNtvfrm0K8wCOek5VfwI73eBnLeL8PM4bpz26ty4aa4kTv8+GCzIm+9B9omMTXCLaSonIqp1OLrWCcE6t7SRftAO5aeCYdh/uDhJejHXAg6Z+osJU12lXDOQkk++Qasc37yJs/hDTk6SP+wK5H0lYP2ZaAngGT9YG8prso0s1YalghwF+cPsJjmG5taKzf4aclsUjZBUPczcvT4ce/8ohdHGhAwHzlU2GLwvDvgz4iHWXBsvkdIoSaS8tZMmHB2Lx4gU7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHAtEScGJd+8SaeeRRtxf4JjrblIDlJicxwATC0GIGY=;
 b=Q0NszIFpIceeYZ4TzaLPZ1mHF0mRjH0vOKkl0CHI2gW/syHH8EobbFx8RJFhGl0YrjyQIj9xYs7RDxCS6kBmIWm4ap7hhuVGS71hIs/cGoGSoqgjxqQ0fsKy77VzIYzvDrEchTGiItuqcIo6n8ohC2/nhHJoMADhfRX2PMRMTmqPmakOv0JkZvKEVaTgACQHHRLKV/M8KnpCjoh5AxU8sBaDXXJjnA9M8BD07RWexVJo9zL1ulofVvB8W8QxVHVOrm7i9zB/xToAOJREfGgrE/QxPrzKY6CndJH3ct23Ozh7NS6nZhF5ASqs7B4Jfs5kJvEztSzhLseTwfBBMwSilw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3569.eurprd08.prod.outlook.com (2603:10a6:208:dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 14:31:21 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:31:21 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v6 06/10] parallels: Move check of unclean image to a separate
 function
Date: Thu, 25 Aug 2022 16:31:05 +0200
Message-Id: <20220825143109.176582-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::29) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb2e8dc2-318f-4e71-77c7-08da86a67b18
X-MS-TrafficTypeDiagnostic: AM0PR08MB3569:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5yYAciNxrCVDn/DHCnHY6am1KvezQ1HIw1eYspJ8DgJAXTMtVa+DKojg5inPBHXQ6D1biiO1O2nuMrcE2xvVdBn+MJ2nPLHg6swsjW+OBs/FBiWaEof4tnJ4IQe8BAzi8/o5tMEA52jZKGmTxlP6dopCeOg4r+gEbHCaJiqLfDJHHiIyVzq7LyX0VsSDV7FjRe6iTOZSu5/HYcxwpRZ/cokrhJrd/lattdDiSy8dHrOWW7FyFNPc1NCm8zQ06mZIqGHmmqaPKtM3fvPuYJeJMbjr6rujJdHLRX8IRm9VHhz99QtrVHZP7Rng1ng4kAHjeYisv7akjnUMay7xQ+HK7yA/jYMPpPoE2lus5LdXs6J0VWvjhVx2x0aneRr/toNXxYDJKlrt6dd65ZhM1R8j403m+aaiT7YKm58xh2i6GPSueFrxm9LbQzUYSItWIPdOLps9PaJ5nUdUmSKHZme4wlCM6DDq/Fraa0OUU95F/7366lIxg7yCWxoqPu78jC67N02/K3MCpD0qOxEYS0cGqsbPfQywgUBXZL8O4QG/uEZNEzIdkf0O4MByl5FExzp3penmW7JVK61FiD6e0afGT7wmlP2CSh9P8Zn7O66qFzToAqhkh1TGIpG5gZ1neBIg95FeGrgyCU80en2qMIXrwL61NmnBglBEt+/YXMshP67aKYyowx8vcd4pQUR03IzLnYNf5Yi3TXXbKETMYNZzqkANKmBGk3fSjHvxKgR3tH4eukd52ml4pxvaQN+SBdIEPqyhU3rcvadCUKTHmvN69g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(346002)(376002)(39850400004)(396003)(186003)(2616005)(1076003)(38350700002)(86362001)(66946007)(83380400001)(66556008)(66476007)(8676002)(316002)(5660300002)(8936002)(2906002)(44832011)(6512007)(478600001)(6506007)(6666004)(52116002)(41300700001)(38100700002)(4326008)(6486002)(6916009)(36756003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aVJl9c51VAo2gvDOHrtTlbRV0+LPEhh4HSQaq6wp/w7eLSxHzCBAw3miHedO?=
 =?us-ascii?Q?tmc1Rw1WJZwmtmlLHeuARjPuvp3u9fWNHhZFNmVdrbx9JL18mK7nY7dHNXgK?=
 =?us-ascii?Q?p5TfOS/A9LevGdzvcYJrbQmiGPSvEcyFl9z0AjccFu+J53sqy54uM0TSmChZ?=
 =?us-ascii?Q?MXJ0NbHHWWRSAT3YgehEMUabR69pMPM6nLYBGlKKzCH1UMxN6nlxSBAMpKK3?=
 =?us-ascii?Q?uwlQJ5ce/SnlqRkRxl/WYH79yskWhjtUurkSPACCcg8yJcUF3IF01t+5g5rj?=
 =?us-ascii?Q?VEMmSwYahyby7RzB+ihdNCM6hRFYqz29MjmyU6/EWWSrfskat7B9IJpfZ8Oi?=
 =?us-ascii?Q?09FYwZBAl19QldKqzp8ar/Vik5MbbyggDi+pniSdKfwD4IJ7Um3eF8IiGpkf?=
 =?us-ascii?Q?O/b+DsCoYbtU+LNkBKmACkVqR+zJZFVTdP5y3QCcy4g3Ui7T5h8C3VpjLD6m?=
 =?us-ascii?Q?yCkPJwaryMC+y6BfdeqH/XwYRIWukwJfM0k/am9Ab09mBlZE2UHTV0z/fl/H?=
 =?us-ascii?Q?maElizSDaWgwL7JnbZyHNqlNGP2hyUcHsHYceI9nZ5TrQ90wfBJjy7zAtdAM?=
 =?us-ascii?Q?kPS2TBrPe1nXAdcCAAw2amxmJUEtVF6Em1bWUVV+Ck3Z/A+hEKQmSDYwT0Jb?=
 =?us-ascii?Q?Zv5bweMRT1MmqwIZs8pp+nTrhtEUtH4eXRNpatrjBLRRzw4FpDTYFXtHTFbm?=
 =?us-ascii?Q?GTuXPJ4ZMagH6okt9uCFJUOhvB3F7rfSkXT/r5yie/yrf45ShMJY5p6FUIg8?=
 =?us-ascii?Q?o+jEY0kTPQwJ1og3M14NafAEAYo01SJk4XWa9FI9ctTHUIw+bjoSj6mBOmhk?=
 =?us-ascii?Q?pra85d/N//DkINqQ4UT8A1mhYwsc6aKgwSie5ZU81cJOQI4wqqJPbaRRuJ16?=
 =?us-ascii?Q?EEMQ3FLPMuQEaBweKYSHR/BEc8u8kiVjNbKZPsk8bsXMpDJkR4EaaQN0h4fi?=
 =?us-ascii?Q?B2Yl739bd0YnQJVXJ6Bo52k82WIs4B3zQGTOlDJvqrsknbMU5liCnh8NLdPP?=
 =?us-ascii?Q?KMOdDothBzvVuFLuKna45DYFB8h5b6WwrrjHBLW/xOrc6rxL5LC9ceRUi9Bh?=
 =?us-ascii?Q?Y6vXYtBE3Bhmd409eORebTo6nkG1yG3OwFHpLphlAIv0n9jm9JfvJck6FZST?=
 =?us-ascii?Q?Wi+wD6HAigFJlv7OxHyk4ZvTJyvE7uthjCdIPs1hX/VjBARz25YVvylhaN6x?=
 =?us-ascii?Q?O1eOdNG/OXPIp261ic1weBODgrn1IE+G0QsywXOYt51oWzZ36S2WT6GxyMS/?=
 =?us-ascii?Q?B2DbTKOGLsNTdXOj4EsRipWbNUhWGdTbB1Kp/dNjC7OdSe9r4QzrQvc1LGkh?=
 =?us-ascii?Q?lsirx5lD1biMbOa7CqIeUijuxsoVgU+2qxqCwY95NV0SktLfB28D9m3RXaTh?=
 =?us-ascii?Q?zPiszKvQRa+bHOZ60/3mtRAqBQjN89MmPhjxZZN/awMm48qNWsmV5Pes6lZw?=
 =?us-ascii?Q?Qts2m1OCxF04Kmkq+LCMSQARS+Le6p+FViMFD3PFfS4I3078kJILDZ8miOdm?=
 =?us-ascii?Q?THB9PgYvEyYdUVr9vN6Id/bqBLATUVEwf7MCOoAZQqhZc304BXS0ZpIjQ5Kl?=
 =?us-ascii?Q?XdM4ICpGuoueKjpxL/4BLspRX1eH6MIsPAUaLPBh4VqRp7VQSs2OQcpcyV+4?=
 =?us-ascii?Q?Owz3rrjDAoHiNLja7jXiy7w=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2e8dc2-318f-4e71-77c7-08da86a67b18
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:31:21.5490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JF45LKrGgl8qneQhAhn+ZrqONXAEqJpk/0N5gw4Z8LF06ENLYyWGDEmQdVUD/nBIQ1z2Qs9gXCX/vFFfQJfbZi72Fq9zJnRY4G/ukxdY3EY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3569
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index b4a85b8aa7..eea318f809 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -418,6 +418,25 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
     return ret;
 }
 
+static void parallels_check_unclean(BlockDriverState *bs,
+                                    BdrvCheckResult *res,
+                                    BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+
+    if (!s->header_unclean) {
+        return;
+    }
+
+    fprintf(stderr, "%s image was not closed correctly\n",
+            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+    res->corruptions++;
+    if (fix & BDRV_FIX_ERRORS) {
+        /* parallels_close will do the job right */
+        res->corruptions_fixed++;
+        s->header_unclean = false;
+    }
+}
 
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
@@ -435,16 +454,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
     qemu_co_mutex_lock(&s->lock);
-    if (s->header_unclean) {
-        fprintf(stderr, "%s image was not closed correctly\n",
-                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
-        res->corruptions++;
-        if (fix & BDRV_FIX_ERRORS) {
-            /* parallels_close will do the job right */
-            res->corruptions_fixed++;
-            s->header_unclean = false;
-        }
-    }
+
+    parallels_check_unclean(bs, res, fix);
 
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
-- 
2.34.1



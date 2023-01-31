Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D40682A90
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:30:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnrs-0003PU-ME; Tue, 31 Jan 2023 05:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrp-0003ON-NL; Tue, 31 Jan 2023 05:27:57 -0500
Received: from mail-he1eur04on0704.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::704]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnro-0006WH-5e; Tue, 31 Jan 2023 05:27:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLqicKppezCQrhLPHE3xMrCrwN/q7AeqZ0DutT0aoF0pusmDEhmhd0P2lRkdMo1AuYW2XsUk4HiV+0+dZ3UFQKF8sM7ApmxGbgR9PulflDHmy4DUH/6iSPAbYbJDw1icN+S6i7lFv641OkzDLnJqnfCxCywHpig3SuK2yroPdCjlAoxDDmIWaSlR5+rOhHOWydqfv+em/Tu4sl6IdQpHac5+3IRUYO9US4lsgHp7DlLmYAtspljchxKGfKwtpwzAYpS1zlBAi+Ti/aWbN1Y7iS7aKTcnALrYIS1uaxILNtL4TqMku8UPPDkAEPlDJty815yDRUrN6v9ucjRSdhLwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHHhH6GkEPcmWeaMwexhl+42aBznDOcUp1XNu338ZX4=;
 b=XoSSHvKC5QZxqZcFRHKLtlsBCt9vKzkwR4YyRv3I/Q64+Je4vS5huQdTQ38l8vFhJPctS1rW7ElA6YNKRfO9/rw6nzNI0/VPfBvqPzKOhTpAbJYrJsduppvA0U1VkrGU4uldW3w50hybxQJd0aujl5Gl2VOuNOIaCLNY5HRO9raKlZCZOncsNqprht9M0QF9LcAd0SuMDT+53qlGPh9PErYXIoSI3DUauTYiY5CdK/jhdnKkU5zEBKHRtyZjBS2WylkIah6m+bG9X4fr4Zpeh5+a9lNznFIRODr6chsEyTWP9MWScS0mktsUHFYEr+eEPz5kByih24QZabr8WrRpsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHHhH6GkEPcmWeaMwexhl+42aBznDOcUp1XNu338ZX4=;
 b=JxqqjBZ//Gl4udlDz2JcNw0TZuVMkvPD+PtVqUbS/RpBB5AbFpl7Bc8OnVeudPmu38gWdfR8PViYWEi0xyGDTP3CJk1L3J4VZlO5pznEtdzNn942kL3UoBavffQztpB9aJiqnT/qqBfxWpZKT/Bj2t/nwmIhniAaTWFGO3vQYWq0xWXVZLcmQ2BM7oIEvAT5M23rPdsbgXtnLtHiN9S3nLK3XCmc2jB4p/hGwRHwRkRA1cBI1AIpe1h1V4qS69ErMyjyvBkzDNTqJCNsQXLD8XL4SDykrZMp8oTuo/3/ligwsjgjWSMZeICJCSySDEcEZYcC/dEX2exi9uZiuklEdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB10217.eurprd08.prod.outlook.com (2603:10a6:800:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 10:27:50 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:50 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 06/12] parallels: Move check of unclean image to a separate
 function
Date: Tue, 31 Jan 2023 11:27:30 +0100
Message-Id: <20230131102736.2127945-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::26) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|VI1PR08MB10217:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a17aeb-d778-4074-f9fd-08db0375cd9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IrILjtLILb8J7pOYIS4UEqTtdmZBxStRCG5nLE31/2Wbfm/M4RRVtKNKgGwmQ/nDs4CWkJ5jnvTQgwnc/cGHFUee2Cum0QaTDHajS+dbBNTiBtOVmtc8cINqyV8r6AZmgEwdgXkqtB66HVXGcgyMK1C8dLmQagmtpL0b7WfymeXBCToQy1z4c9AbOTDTdzJwUw/qodS7MKcdqIjDx1wK2Rfvugj/jKln/v8GufV1tNVy7l88mnb1M57zhA5x72a0O8jXETcBydkZKy8D9XhcsXDQh/+etoj90jhl79JsvkhVX1DE978Scj/kpWDxnA6g9DaLo6zSUiKNySGM9kPv3m4/VPf83THv7VwH7uuipnlvRYSOB/J6bHbSb8ZjWYkdnTU0/UJAk66SI1dneMZspo5+Yfi0HCYtugRO+/TzoWPryfZYVnF9vYF7dEUOPByZsTGZ16vAPTvF2REiwgSefw/nY0x/KBSU/FH0/b/QQoOwyh82fMYya167nVgbUW+gWcfblqv90PB1zt5K4NyIQPwSKYxZd2EWIVMWdRNnFP3PodUEdV+hNczJkAE5p+EiDUW4fZlSspD9FnBMj4d9C0/uBzMpxMwEbW29UrAGCZNhpZ3ZMU8KoRrFSVz7P6yKjkOsLsEduQ06tbfXekQ37Gi6NHAGMeek0l+TBy8kjCZWSpsUipm5ogOgHvKGK+qe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(451199018)(478600001)(6486002)(26005)(186003)(86362001)(52116002)(83380400001)(38100700002)(38350700002)(2616005)(6512007)(36756003)(6666004)(1076003)(6506007)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(5660300002)(6916009)(316002)(41300700001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?73CmStJ+7eptBAVZKZvpOiiJTOBziqUmr536Jn/OO0d5KXsUgwGf+Vxcfsny?=
 =?us-ascii?Q?oJlDmN3LDhQZjGAmPjFMjXesVHCHipmC++hVOY5z/86wAhHN3Htp6yCj/bGL?=
 =?us-ascii?Q?HSM7w6yHk+deSgaTGy9jUMm2T1UEaKhZTBWrgMfmoKG2UbmHfmhU3sXOY7Wm?=
 =?us-ascii?Q?pR0IfwBOZ/1n48pG9NBMox84QmYoysw+5PZWcEU4YL+UalMMkmMwU11omD/i?=
 =?us-ascii?Q?EsgGVLA8O+kjqw65vKK0CyqD/fGl+qMidRoCcB6UPwNFurKkgKAOdw7UVBe+?=
 =?us-ascii?Q?/0rf8WYBYPg38/K9doLdCRVOEdbOSQK10nXWvlh9IWmmQLlwhyuYa1/u0WS/?=
 =?us-ascii?Q?/+ZLzYfPYRRgZiIwncuhETjDRRQ3OXgMT4ybU34NIE5Kl8zc9r9sC7pf6Q4x?=
 =?us-ascii?Q?Bk3GgXgXMaAPIgMkmhq7o5lsX8idqvJvHzYpxqVC6SF3i7NKNVRW2aosjlb0?=
 =?us-ascii?Q?zb7Qyuvwm38P8EzUgb/Oig9ByZ1Bl9KQV/oEEPDQDSPt0G602U1fhidkCO4o?=
 =?us-ascii?Q?dKtn+SGnGnWAMlViijtPt2F9BodogZ4kBbXc33yCqiuVbXj3lRFUqRKK/Gb6?=
 =?us-ascii?Q?sByuK1LZj81huy5VOBn1Gjn6WW7AwOZkkimYCQmzmHJMhWc7nWttIoAjYT9F?=
 =?us-ascii?Q?8gd/4bW5q4jDWTN8ihJl6+svf8hTYVRGjYYWWZeJPBFp0fqtats+AvyBj6XQ?=
 =?us-ascii?Q?eZ/CpUrBeWOitEReDFQVLaTaW7dLsh2PbGY4QSfvR7XiMi0YHWpxS2rgQqI0?=
 =?us-ascii?Q?IF6hoG468BkEDFntCIbuXseVzBF4eFvBxTIV15qbMR221cCzCEhqJrpwyYA0?=
 =?us-ascii?Q?boHQCBvmkLB4XyrnEyfqaFUmU9Vo0gKwa96w9kf+XB8Lg7f8J93cH1SwOGpK?=
 =?us-ascii?Q?WEeAxBtaU8FO6aUHGdPKtGygu7O1vQQSrm6+vwi60cix+R6dkcf6qRcRMwqR?=
 =?us-ascii?Q?K9EprfGVL9heelG4q6Z2QqmjvgiKWwUxW8IQu32ilZyjCYDg+I5XZQJgfO8a?=
 =?us-ascii?Q?fCLik29lVDh2RkVNRkT0CS4q2GgaYr9+eImLOd4HZFyshmS1YwNpQOn2GZHL?=
 =?us-ascii?Q?w8f9TNlZvRnwW0/U3lxe0j2mecoKpoC0ovhdbPYrJVBw2hYo6TdfpbSMOS2Z?=
 =?us-ascii?Q?REC/BcB3y/RifVLx9T9SaraAkDVG0srzyBbZN58c8s0Qusa7mqn6KGFrDE0q?=
 =?us-ascii?Q?zDh3r4n3u27ynN/xftLw01EVjbSjRE201X+Dy5J4YT8xKOh8ozMWX7OhbLgy?=
 =?us-ascii?Q?HAEFRxrWaXRFfpzjKsiDdWG1U+9Wy8FBUMPPirton/rZ/sF8wlmCm8YvcCU2?=
 =?us-ascii?Q?a9vfRNIEcMRmGWallduXX26fo0PsY/9apgQ0e0s2lQ0Q6NpmPj4e9Nuad0oL?=
 =?us-ascii?Q?Ygf4Vc0ZLsxGh80rbJ9drFLC8w855ohVauw89KP+B2cLi0wYHccllGMDkZQS?=
 =?us-ascii?Q?wtGMuxHK6EKhnKaj3tXmJ8lNYutt1qpELMRbjICni8/exFv7eSXkMP2u5ydj?=
 =?us-ascii?Q?4V0EK9TZ4PQ9ZLnH8TgvVExI3IZvLAFoK787nbXZ3ZUGCTkhX1pN4bHP3Wqi?=
 =?us-ascii?Q?V42tdflxN8mK365glQYrZwHZ2py+R7NAyVsk6wHbRkFucP0RNnyF/ldQ3ZuA?=
 =?us-ascii?Q?qTc4wS6pVbGB1L3toye6BBc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a17aeb-d778-4074-f9fd-08db0375cd9f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:49.9864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9T4vTU4xlRwyeRrG4ioQjMEHSn8VPsd+Xau5tdq0P5M4W9nmyEi5mcUaCSRUeW2B0rbnrjTD/Tcdgk0V91b8rdsbome+1cOKGcwZf6B5GkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10217
Received-SPF: pass client-ip=2a01:111:f400:fe0d::704;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index 63bfd7074c..02fbaee1f2 100644
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



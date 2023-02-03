Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467E36893AC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:28:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsLq-0000VS-Mc; Fri, 03 Feb 2023 04:27:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsLm-0000US-Ae; Fri, 03 Feb 2023 04:27:18 -0500
Received: from mail-db5eur01on072c.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::72c]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsLj-0005CS-HH; Fri, 03 Feb 2023 04:27:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ7SLQfSw2UtpuhVcNGcMzGYTtQn3irTFjeTM9USMarvus2uYgVq1O5Nc6dw+n8dvAXADoTeOlPhd68TrOuhnIBqcgVUx5Im/gvWSemMBx8imJhKlKoL3pz+dfvurNySAa9JkzR8R/gc8fBhH3EEO13UHYlK8ecvJRYV118EDZvJtX38GdHPU7F2M6iyY5JIwcVct8gEuXBZ5aWZjsFsQLok239k60lsCnZ/aSCL5oC5ovg4KCRdtn8hiMxdQ/qLgD3fWpBJwAcGEi542iT2ofDz4WHZkwhVTRKdI5DDrLBRqieq3nio9gnnXqiiavngf6EOmE72MZtGfDUP/rPL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hgb0Qz8EWKYzAjaziWPMPyl4oJlLJLofDiqmoqkahk=;
 b=XjunlhmBFGsBzhzVDG7yNjJ3ToTb85bVXE3wNBywUaEXi1aTZ0BNCadBaPtGX0XsLQsCKuPx/lw5JbgzmEBLZmy/rBGzjOKqGv/Px8fQhvmjEioxcE8tqSMtbecWgadZ6VlLOag11Is1YQIH8Jllybb1p4W9xrTEEcMHDVgDA50P7AJARzmnHgSe0QTRNlSj49sYXt6lz/gpYDImd1JQmZAxyGYXGrKFW2BB9mn3CB/Gdb5KgLls4zei2R7dT45SK0TYP+m8IorNQ203dNTkSkrAKU6FUSJAH5tJTpQMXUS5FXXpZMkt9ujDF3UxnXIba+w8YfqKqds9rs3EAmqfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hgb0Qz8EWKYzAjaziWPMPyl4oJlLJLofDiqmoqkahk=;
 b=C/jqV/8RGVhYi+7i8XJFeIn9bVZNfBfcZ3/kqwei2ofgBlAFclX0JH1LOD7ZK62Ny4VVANOKcyX0NxNZOydeBjlI5yh7bAbEbU3kzg1MOJ3S1AFqX8ED+rQHaxUvBR68zDqCQI55vkGcUcgKJucMyNnm68RC5pDyDHB2kato3RajluMzyeGDofs4XaO8ziSJEXOnc6WWbda+wdKgjWnK+kHcBshlA/iJgVL+/e0nacGMvE9eAeJqfaBrP9Zza2bWlejPURDqaRPY3zEtDPwlUJsskH+Q6d2mDYya7BF9icXJ3UfRc9qmuE41IOIpakV5L7Rzm7lIXrwCIU2xRLz7pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAVPR08MB9356.eurprd08.prod.outlook.com (2603:10a6:102:30f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Fri, 3 Feb
 2023 09:27:05 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:27:04 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 2/5] parallels: Split image leak handling to separate check
 and fix helpers
Date: Fri,  3 Feb 2023 10:26:53 +0100
Message-Id: <20230203092656.2221598-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203092656.2221598-1-alexander.ivanov@virtuozzo.com>
References: <20230203092656.2221598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0099.eurprd09.prod.outlook.com
 (2603:10a6:803:78::22) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAVPR08MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: c54bf7c6-3da3-4394-f18e-08db05c8d038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: afbKJhOwbug0hC2yOB0BVOoTAvla1+3pqRv+N9bXxgItTYz/ypbkEQwA0xTu9WgKkS3djF1TyI3SoYb1b8+XyxztqTzJGOt1/ZmZt4i6QOLbcCzvHZXt1ZOOBcjnAo+ZabI0bb3PZdm1lZuWrIMqICLlKMjR/hOJTC2Amm9oCIJPhyExN6hUlIbNQT21Uc+c2bPCsLIRwitz32DWC0R7ZMeJ7oBhk2eKWtOk2tIzuhCw3D+r2bMjEWbyzD0JycY/Q8NU7UOC4F4598q6AxNNPE/5MlkRccWUuafMuFEef1WVUG2qfTVEPhQ8tbErTZWnF5SqZ1WgDhglN57XLukHij27NGU3nUj+oFyE6qxhNwqfgWlpf/BItnOXHd3LGDEixAUzQprba4hVCopuK838see92qan5gnW2Xp5YypMVeergqh7WMWLl5tDcnAEU4sf9JCfJRhdcrvG5szr1MTnCFFCR4bATw1ZCKmTi30W5WBpx08TWE7ypYzeyHAAMgUYjJrcX2pFswiLspX2w06yWXiqNdsa4o/VgT8EiNGB446YxqPL6QS3Jm+A9FkTMY5JzkhX+0RskzwRKOWchEqutjUgvYMUS7nW78wrSB1agsbXGLkGdqfS0men00BEb5i23UQQqDuJxSrrwdZstVF/EkPHRDDa+Il/ntB1KD6tW9fd0OBqhqE8gEY7EIsWx44S8n5BouuhcpVNU0DZwNBJmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(451199018)(478600001)(52116002)(2616005)(44832011)(36756003)(6486002)(5660300002)(2906002)(8936002)(316002)(86362001)(4326008)(38350700002)(8676002)(6916009)(66476007)(6506007)(1076003)(66556008)(186003)(38100700002)(26005)(66946007)(6512007)(41300700001)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?daKwpQrznMaGD9udr9l4xhRGHb0ok0nz+ziV94nJkOlpU97zk5mRHNlRCLiR?=
 =?us-ascii?Q?nHa8xrEdqrPwdmxHIc/3UiIMQ60ykMT/ELMOzAm7aI0WRoZ4QD6rMUq7yGBY?=
 =?us-ascii?Q?WPpxNNb5lF5jDaNhuQKHRlLpSewU6VOWV5pEfi2lCiSeEs0RJDjB7roha7IG?=
 =?us-ascii?Q?KYeEjU8UZAcnm3xtK2Z4BlW7kYpldQpiUJnzXuv0OHR9ddtvt4xT78QsB0Rt?=
 =?us-ascii?Q?qi9kxQRDri7yWGfWMr1drZSsqu7Cc7cW3QZGGUhTi+UlmM6hsqVwsvcuZUOC?=
 =?us-ascii?Q?w5yFkCCAH+TaUYEp0UYpqsL0MeimwvxZTUz3G3w/kH4nfMo6peqLXCM9Gd1s?=
 =?us-ascii?Q?y3eKRp14D7pFiIwfmjYiYFbK5Wk6OjDAw3i/kAVlXb47l/ILwLH9s/Ub7St8?=
 =?us-ascii?Q?P0RtihgglCfMDlXgBA5d8VzjSjnn6HFBSAbsLOHqISuDGUO7WAHXTCCZ5/wo?=
 =?us-ascii?Q?Ilyx/uONnyD71XHuf4NpbontysANN2IBf2vrZz/yq2wvRo6VGDBo/GwC5Hh6?=
 =?us-ascii?Q?Q0rPEvPpwOabziLbA47DhsxSwXZIYOG5mdGBAzIPLBarRHSOdQ9QYWu9PqsE?=
 =?us-ascii?Q?krssbIKpKN3OH4FpU67KrhV7YZyXz7N4J3NaOgXyyDLwimh3dTSX+9GR0GuI?=
 =?us-ascii?Q?0PYmiYWA5F4p5olnK6NwCBuCqENWRyvBxkESv4R8QzWJ8Il1UhNSrp5XAq9k?=
 =?us-ascii?Q?lJnUXVr7yi1S2DPg2/8DXgFHQIycVfmfp0t9qztAfJ03ClEcph14XouaVj7a?=
 =?us-ascii?Q?40cKTvJaK/6nOY5sTWFSUTtP7rr3ux+PMiUGlpTlqzEe/FgMGy0E7D0Z4IXL?=
 =?us-ascii?Q?wbyvG3Vke5Ns7mq6QzQSNn4K6W3MvrIWhB2fDVVJdp8u5wMyIIwCZE+VTvFN?=
 =?us-ascii?Q?67wCb5onsyML4yKPbHHVY6bryVJHTrploBP96uqR0YgWjZnCMa7o3kw45l/0?=
 =?us-ascii?Q?KzqRbFxdqGLPRn5+tNcIAG81GHvT8/F7Lpc39vZ6UoY2U84JSpmcfIydhas2?=
 =?us-ascii?Q?0JV0n1fHaw7qXeCU6oYpa+36E+fikzt6ZIobuhBvbiCJbvn/wNBd8vBl1cfS?=
 =?us-ascii?Q?vYK3nXB8aTYQKNXOes5ddHGOzWQ7C2kRFKJsvdKWz5VVkjP9Fw2QWXDaqN8C?=
 =?us-ascii?Q?b0Duf6hVn3GSn/RXrM6jfzQA41ngMzyPyb/dkRPMhgAU8Upgd+o5PbvJwP6p?=
 =?us-ascii?Q?8kwSSYBgNLfc3rGirjJcHOzGsHE4BM/XfqzsS1dbbGoDKQXfWDPW76y5CFcl?=
 =?us-ascii?Q?Z45qIMiXijYCPkwU18r6W3SWrW9NrHF7J3b1KTZWLfIXlyhR99gIFAH28ga3?=
 =?us-ascii?Q?OSPeXJctp8e4rnhTjZAsakRg31MxKSdBZcx4/gWf7onHf8jsAwwoRpl4kIU/?=
 =?us-ascii?Q?5k7X44j4PwuDvwAucySAn5IhDf5Y32D/6qULxNzYyMBu7C81Vu3tl7DYq/MT?=
 =?us-ascii?Q?88VymY3ObMg0iDHvG8TBoaZz0pgmLILwhF10xCpiqCnrHFHxynBUU8Jp2pPt?=
 =?us-ascii?Q?n9bZ5c6dz5tf69sYMTrFd8BilGCCf2wCa00j3e+QgTEEa/Gm27Z4DBsNBym9?=
 =?us-ascii?Q?KY4fvEAzkLoaFIY7MKQX10Sz1145Y7fZPLmgplab+yBYiLSTihHZQtk13LcK?=
 =?us-ascii?Q?reRD5YJmols1Z/nfLoCyBcY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c54bf7c6-3da3-4394-f18e-08db05c8d038
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:27:04.9141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEFemsDa3JgFw54XFaqZNFV99uzrDfU7GJqxcck9BSyvvdwtt4BodPM8+gI73VVBWMnCfnfCMt1O+K/tZyQ9obXrAYA7xHPRVLfo7Cuo2Ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9356
Received-SPF: pass client-ip=2a01:111:f400:fe02::72c;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

We need to fix leak after deduplication in the next patch. Move leak
fixing to a separate helper parallels_fix_leak() and add
parallels_get_leak_size() helper wich used in parallels_fix_leak() and
parallels_check_leak().

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 86 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 61 insertions(+), 25 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 9b09022f06..d3053b33d2 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -480,43 +480,79 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     return 0;
 }
 
+static int64_t parallels_get_leak_size(BlockDriverState *bs,
+                                       BdrvCheckResult *res)
+{
+    int64_t size;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        return size;
+    }
+
+    /*
+     * Before any usage of this function, image_end_offset has to be set to the
+     * the highest offset in the BAT, excluding out-of-image offsets.
+     */
+    assert(size >= res->image_end_offset);
+
+    return size - res->image_end_offset;
+}
+
+static int parallels_fix_leak(BlockDriverState *bs,
+                              BdrvCheckResult *res)
+{
+    Error *local_err = NULL;
+    int64_t size;
+    int ret;
+
+    size = parallels_get_leak_size(bs, res);
+    if (size <= 0) {
+        return size;
+    }
+
+    /*
+     * In order to really repair the image, we must shrink it.
+     * That means we have to pass exact=true.
+     */
+    ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
+                           PREALLOC_MODE_OFF, 0, &local_err);
+    if (ret < 0) {
+        error_report_err(local_err);
+        return ret;
+    }
+
+    return 0;
+}
+
 static int parallels_check_leak(BlockDriverState *bs,
                                 BdrvCheckResult *res,
                                 BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size;
+    int64_t count, leak_size;
     int ret;
 
-    size = bdrv_getlength(bs->file->bs);
-    if (size < 0) {
+    leak_size = parallels_get_leak_size(bs, res);
+    if (leak_size < 0) {
         res->check_errors++;
-        return size;
+        return leak_size;
+    }
+    if (leak_size == 0) {
+        return 0;
     }
 
-    if (size > res->image_end_offset) {
-        int64_t count;
-        count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-        fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
-                fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
-                size - res->image_end_offset);
-        res->leaks += count;
-        if (fix & BDRV_FIX_LEAKS) {
-            Error *local_err = NULL;
+    count = DIV_ROUND_UP(leak_size, s->cluster_size);
+    res->leaks += count;
+    fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
+            fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
 
-            /*
-             * In order to really repair the image, we must shrink it.
-             * That means we have to pass exact=true.
-             */
-            ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
-                                   PREALLOC_MODE_OFF, 0, &local_err);
-            if (ret < 0) {
-                error_report_err(local_err);
-                res->check_errors++;
-                return ret;
-            }
-            res->leaks_fixed += count;
+    if (fix & BDRV_FIX_LEAKS) {
+        ret = parallels_fix_leak(bs, res);
+        if (ret < 0) {
+            return ret;
         }
+        res->leaks_fixed += count;
     }
 
     return 0;
-- 
2.34.1



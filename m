Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD262CF6A6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:16:09 +0100 (CET)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJN2-0000Dr-1X
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFd-0003KX-Gh; Fri, 04 Dec 2020 17:08:29 -0500
Received: from mail-vi1eur05on2136.outbound.protection.outlook.com
 ([40.107.21.136]:31968 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFa-00027F-AM; Fri, 04 Dec 2020 17:08:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPtPdKWrnnon/BDR4qE+Kxf/XwZdv1AU96QPpON6gWe7SlAbkWpPp38ee83b9vIrsEx6oVWQmt1u06Aq3+xLPBZ8Fn/CtS6ERrM1PEVBRbHe78eRP8JC+qEiJQm1dVh5T7ubflKS8KXb7x8yj8UA0oiwohfp5uUewVBGTzw5w3EYxVkprOyHn9EL7AQ7JCa5FchNHJ9Tn/wKHiPfH9wW8vA8cri0S4uBlqHOq2HrfYa38H+htbP2ZR+4My3iM2XDr8MW+/3NO5sKGlwrQyoCtL7KEw8NwYlss9aaSMFVLFl3GSSqU2LfzvFAq3FQjakFj12UWv0uduOvBtHyudMGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeZ0crB1VKq62DL+gKla+V76HsysFVyDg0MnRkS2amg=;
 b=iwGtvZojWwzimr56aHDeL2w0kHH0UaqUlzrdyR6NmZoVkS9VFApPpGxwogtbXTbB2VSQDXe+8GPJLS/uQ9d62RIjqGPm35+O/kW5A9n336G5cbVEfOwbs9MTluP6tT5JuEfLc1TrfHBl9iHj6dgGda3x9QeK6A75FsnCOXQCxozXNwJMOf+Jex3QUDM/geiE+6EgW4Ixj6LTbME6oPzBGLlfLECGBA3igP+y0EVMZ2BkiwQeNRBVFYxI2LLNfe96l9ZVdJPGBHb+mwuZMKnVgSr7BVo3IUsB9rG/CvgwgUZ5C+qxsI9cMNWy0qYcT1wZmgeacBjHEthJO+vDF1/7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeZ0crB1VKq62DL+gKla+V76HsysFVyDg0MnRkS2amg=;
 b=GrxrjA9iINuqmyO2ZAqN7ysxnlMDruePaLAS7d0CJOXFtsLQbCIpWr8HOx0K6R8pa+zwaUakmh9HTEKVEDHKAp/VJ/QjIw1RLRrQhUTRYdU7yNZsxBMDLZoeQY8EEtdXkF/iYYAVqX8Ur6CKgNgbdr/xKmEBMwmsOEX/zALPqRo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 02/13] block: add API function to insert a node
Date: Sat,  5 Dec 2020 01:07:47 +0300
Message-Id: <20201204220758.2879-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201204220758.2879-1-vsementsov@virtuozzo.com>
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76557c0d-b037-4fe8-b07c-08d898a11942
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40729B209D4DECF0D9BF3BC2C1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +13yUQPj+yc38AUkrsnArL/Rv/hmwGBZMDx6M5aPsPNrXgMrRANCMQnej8FPS9Fk+OePnhz6w6Oh+JtE4aJ3GPqfjmf1BHF7UrAWXCQuzvhI2FLrQIsO0NnFxsv0dM+4w+5zys0owSopNsdcYiL0A+eKLSgG4DyBoqhU6hiMVZ+b56EDgFqjCzXg0YCjkN3U0n8jTKd6AhkRHrIyADfjIwbCJf8maSAwbVafGINZeF3f899/+pAVrGefauAJTuKIsE7EYsVhky+EEEAtTJ5y6YG0YM9wRnoNm0ProEBJ6EyIYFVqJD5JCMMWJa1qKAjAZ4nCTb8DgtcR7rz+MZuO8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(8936002)(2906002)(6916009)(52116002)(316002)(478600001)(6512007)(6506007)(83380400001)(2616005)(8676002)(6486002)(956004)(5660300002)(6666004)(107886003)(66946007)(1076003)(66556008)(186003)(36756003)(86362001)(16526019)(4326008)(26005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?W7d9jB7/UrD/ufsnJC1r6QBajy29QlKX6JOKpS66f2iEThT8FMrhU2oX5AOH?=
 =?us-ascii?Q?l6HjdUI/B6zliu3PXlDjcEeyoV/dDAg2YuBg/DDRK63MueIFq/sfOixD1etz?=
 =?us-ascii?Q?TWGW3VlYr3HtElRiS8PCMYbqfkGmrCrxQ7hWgqi+UwWUP+5A8LwFPE6gM3r2?=
 =?us-ascii?Q?rqlvHS6EaH0KNWPS3eHTBk7LB9y9hVokgaByWXZ3o9m6v9g5A0U2OJOVx6yU?=
 =?us-ascii?Q?EpFdDJw6P1eJKz4de/JhTXecBN7GcmXdu+OHY61lACLoAt1fBt17QPnJZmE1?=
 =?us-ascii?Q?CGBYoV2bT8M4EwT5HKZrFS466QTgTU3RaxQ9KRD3S1Lnfw5PdS0q03UajLq4?=
 =?us-ascii?Q?TnqidbcorxFmtLLcadIea8UuB3y5IWqon5UwxUpFy5nCg5nm4W2snthAcbZL?=
 =?us-ascii?Q?f5v0B3JaPQHP0Oz2ZR90PJyrIwAB6+FnQW+P+ObVdwtTz9q3Jkr2UHe9yO1d?=
 =?us-ascii?Q?rqo2LWsU8mEcF1LJSV6KG5fTZ/+XvfdB912fmYIuTdgNCO/JpSO0Z1dQBhno?=
 =?us-ascii?Q?zNEPqvMm3iZh+viEkSCxIqk6U3PL+sBj3vB5h8O/rBJvN9sVj6aBMvt9rk0C?=
 =?us-ascii?Q?XfSywDluL/1wULVRwNhiEnsH/GjRKxLgZz/zQrzUob0TlwiKSNmLNfDXx1oA?=
 =?us-ascii?Q?BOdQ5fJQDKkCpkRX4P/RE/3ya5w6ZjU1I5dLAxVXO3Yhny0Qntsnygiuqd13?=
 =?us-ascii?Q?C45pF8KVWxar38XWMfcaygxTpgZHsH13xofVrltGkgxPNe+ZBzxboBK3xgCW?=
 =?us-ascii?Q?oyOq8tRqfk1+elp4V/kQK+wlvOatB0/D3V84Jvc6Vwi5bcFyuGyBRI0wKQji?=
 =?us-ascii?Q?hjyYWSxj9DGEYWuU8DRbrUKnWmqPgms2m+9ypH+3sDXo+pVtOH02zvSTXzNY?=
 =?us-ascii?Q?TzEeEZH+WDQE9YyHUxDTooaqBaj/A2yCLM2iPf0hLQdFLeG00Ruvedgn40Ry?=
 =?us-ascii?Q?1xkgJLNRRPuDKIYFGvk0NNp+uBtfEpbm0p3gGdGIAqHZ87xSQXEgRy+iut82?=
 =?us-ascii?Q?EouB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76557c0d-b037-4fe8-b07c-08d898a11942
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:15.5286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSldIwFldZBeLJ9l7d4qEBKWw5MCr9HDXHRfb/21c+WwXPhoqWIs+VQKfc3Bruxc0vbAr4Hr5D2LohCUxXUpAfmYewzqal7cD4nbpfw6Tjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.21.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
X-Mailman-Version: 2.1.23
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

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Provide API for insertion a node to backing chain.

Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  2 ++
 block.c               | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index c9d7c58765..81a3894129 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -350,6 +350,8 @@ void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                  Error **errp);
 void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                        Error **errp);
+BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
+                                   int flags, Error **errp);
 
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
diff --git a/block.c b/block.c
index f1cedac362..b71c39f3e6 100644
--- a/block.c
+++ b/block.c
@@ -4698,6 +4698,31 @@ static void bdrv_delete(BlockDriverState *bs)
     g_free(bs);
 }
 
+BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
+                                   int flags, Error **errp)
+{
+    BlockDriverState *new_node_bs;
+    Error *local_err = NULL;
+
+    new_node_bs =  bdrv_open(NULL, NULL, node_options, flags, errp);
+    if (new_node_bs == NULL) {
+        error_prepend(errp, "Could not create node: ");
+        return NULL;
+    }
+
+    bdrv_drained_begin(bs);
+    bdrv_replace_node(bs, new_node_bs, &local_err);
+    bdrv_drained_end(bs);
+
+    if (local_err) {
+        bdrv_unref(new_node_bs);
+        error_propagate(errp, local_err);
+        return NULL;
+    }
+
+    return new_node_bs;
+}
+
 /*
  * Run consistency checks on an image
  *
-- 
2.21.3



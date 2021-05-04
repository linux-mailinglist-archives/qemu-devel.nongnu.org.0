Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1299D37274E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:38:07 +0200 (CEST)
Received: from localhost ([::1]:45482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqZC-0008WO-5U
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqNz-000819-2Z; Tue, 04 May 2021 04:26:32 -0400
Received: from mail-db8eur05on2116.outbound.protection.outlook.com
 ([40.107.20.116]:45350 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqNv-0007Kk-2w; Tue, 04 May 2021 04:26:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APKJEc88U308/aPkxfuAYGvq40cKRWJRk+sDuxY2VFOOhYL0iolKo8l2ccDFprZrpw8vhKptw9u6BKKel7QQni5ZnIkk9O68SpLts6UZQ0UGQPH/+/tko7CwfCCT3WTu38HFGRinpO1kA0g4x3GRKhdyZEuhfN4KPSJ6fyjgqhFpni5q9a57PfsFsvEpv3/FxnxrulmK9hJIPcDTgxAC44bHUwytEs8x1dxf/6+AjLQOYrQd/vSxq9RXFFvmLpqKQ/X1dleRTEVezPj/ogzlywk1wT6J7EfS+kr/uBt7nVFM00GNrQTepj6nwWn9M30VgB6sxLRp6uMLm7M5hZk8Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbmWq0+M5WcdTHXFZZXKkkehyopOozqA61ekt6M5Bpo=;
 b=XtePKI4M5RPjh4KonrLlMWu1VW/q1hFJy0XfF+7Q+mec5qszNV+86UlZYaRrYoez3t/CF/LO1j8XY3maFDzPOgpTB5+rHfcck9o++L/uugOnqaH1gXtBZG3VBBTK8Vc93MENimn5QQDVVu5/AvNUHMcuZR7M5ttkNxdBWTAAcoaXxi8h6+F+Pr3nXQpRqezwV6ie20GOEUiaD8D0DSPyX42cnvDk+1ZjiP6M++SWzqY/eIHY0z19UBIJBex++oJIZpr/Tnu/2ixeQp3BH44k5HIDDItXQ6f7XoI8n3plJe9o+3JR4ahJMl8eE/2iHJ0LxcMZuDGvjJNg6OGntsGgnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbmWq0+M5WcdTHXFZZXKkkehyopOozqA61ekt6M5Bpo=;
 b=qvI6/jTf2deZFI7DqAoKYuyxLQIrj57IAOGKK2+HiDaDmedQo/7d41PENtEKsTTqrcP4cqJmYI9rVLBEkOlxS6kA9CvHKzg3aoLazO3AwkCwg8hp7KhcJ0u0xy6xV+ZqreZ8lkZXmbGJxVPBPO+KPC4+YZbrpPvR++/DB40tvoM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Tue, 4 May
 2021 08:26:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 08:26:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 4/9] block/write-threshold: drop extra APIs
Date: Tue,  4 May 2021 11:25:48 +0300
Message-Id: <20210504082553.20377-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504082553.20377-1-vsementsov@virtuozzo.com>
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 08:26:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8b0f78b-b08b-48af-05a4-08d90ed646d8
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381A5962E3C6D0FA744329FC15A9@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4XWZIqtVLug8wz4SVrOv4mrlPKWwylJCxvW9pYewSG4cMBQeWNPVhq4rhG8DiCtzlYJRBeLX9d5gNDNTCaf5TpRZa2Ve1C2Lbnp1KZ1L3ZY0+p5/soyi8IjrjUQPXV5NIFSPpfWP13xYuYKoNhpV4dRaV7DTs9eLhu8bgIofYHmX1JeUAcGR3FfWloAoKzKGhCvKVgnM/mevytPzMqKib6spGOnh53SVyICSP1EknKfmYVlnRkqFwF6uRc7GoycubYOsDqwXIn0s5CAT5rmqqqPhWIdSrXzccY2euYISyevBiY1sT0bEa7HX78SicREuB06ld722Ki9Mod10Dw2uo/CETYLhJhTRcj/JsGqqr8iRWfv9zru5xy60hyjoTMEVj/XXXgZ0AkWW44MFzx7ZqEFTd93YbivoJmaQPF6kAX8vHgG3+czpQ0x/M6RJ+i+vmg5dZAUgroDGdevt2Pkt9wcbDqydHTyYTpZFbGV1wm7tBAX7OIf6tvYKIgd9/LzX37YsPtpL4C567q3WQiPQjn21cMuRuhJ0YyQrB0FKxlq4GTHVSM08x6DT9Zcw6nyscLuUNsGp2GTcdj30qTYWKYMjj9xVxA2PC/LrP5wOv4YZHVQAturhHzduefOZ1lJMmqFB2UJJI4N5M1ZY6ATHoGX4nojIUjfy+NRwNqvey5Blu7X75fDvZo6hES1E5oYH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(346002)(366004)(396003)(6666004)(83380400001)(38350700002)(38100700002)(5660300002)(8676002)(36756003)(16526019)(2616005)(186003)(956004)(1076003)(2906002)(316002)(4326008)(6506007)(478600001)(6486002)(26005)(8936002)(6916009)(6512007)(86362001)(66946007)(52116002)(66556008)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FnsImJJIXio8hMNOp7jeT0vFecjy6SPlIl8t2zSx35sTGNcigTIOeZu0x0UK?=
 =?us-ascii?Q?+fPjfv8PlMYfqxFYiyUDUWXoFuXlzmVroVMZxxmugwB4QnBF1ZAouzRu77Zm?=
 =?us-ascii?Q?pt0utlPXWTrnsozYQ9wFGZtFnK4+pFkwRqZtBTcPUTtO6qt+1ThLDLfnj1il?=
 =?us-ascii?Q?hvNYP5bHabITe3uDpxvLdGKNaiucMHmlF6662Nv9LPaVA291BGL/6EBI4zwv?=
 =?us-ascii?Q?64Ua8du4hCX3loyJFeaQoQ17huanp38Nu7ykkC/VarbAGx1yDsD3h0RoBksK?=
 =?us-ascii?Q?bVcYHS2q1arLytRQP5y4sJO6MzqfmD2GfYB3eJ3vwQT0HLvIy2fZgMS7KJ8M?=
 =?us-ascii?Q?odfF+nk7r8fcRID7SrKX3GJKh7mkLXrVt7jcJu564A04IKBqIBTINIQdU/dv?=
 =?us-ascii?Q?Wn7d6XxRMHNDztcF+ZT6IMKY78dQqMNo2cfYzHffZ88G2k8/HH4JxJIZ+qQW?=
 =?us-ascii?Q?WDd0r0hpPxe3YI+hZikfSHVQVz9ftRiVde6WKZZSfaxixLAIv+xD0SUZSYmA?=
 =?us-ascii?Q?o3rkaqvs8imm6UTpsXK/VGHSdTFcGp8eZN52kOzO1A2qpvGVt1i/q2JuMrGQ?=
 =?us-ascii?Q?SaVkrju+HQ7iqbF+54Xx5nfH4wcVvTofI0d8qBY7QiDg0UYBWnXjrQkLlcCz?=
 =?us-ascii?Q?YzKWCfbhZw+UJmpF/O7h1XOXKAmsP+IXs9XQV1uSLjC1nhfo4VlOFjnniEMw?=
 =?us-ascii?Q?Tx4B9/RZ+T+Sre6mGmbY2f0Sdg6w0PU+nKjc5ZLva7hA/ZBkMByfINIGMKiG?=
 =?us-ascii?Q?ULkN90LnRIRQ/nFRg89p0IUDG25lp1D3ykXiR1Pz7rp3rmGQQi7OBqIZB0ZW?=
 =?us-ascii?Q?giZvviQszIet+y+W2MZQIRAIPkWp+hOWSK7lAhJDR1dD7SZy+53a6X+7+KQz?=
 =?us-ascii?Q?KT9YVbQUr58MsAUPkM+lnGuiEV0EN+1dppkwcWlHE17Tcy4NRHQuvHeWyooA?=
 =?us-ascii?Q?Xk0w76NQ8jHggSJEi67LGq5IRbDz/9IofDGePWOWuud/0zdflJJOE74ZzQCI?=
 =?us-ascii?Q?Dig7BYvoLkPWea5uO64Ayn1p3CKU3F7ESGCGGCobRCGsjl/7bB6wZeH19zVo?=
 =?us-ascii?Q?FCaKLRDS+JVljQcZDRSymJHhNQk4zxhvV0xwqGgCvfQXSeq/bSEN5Li9Msk1?=
 =?us-ascii?Q?BbM10Jj0oBulCE/A8sdKYA+xJbyfCp6rhMEP9PcRC8py+svR1t6WeadJPM40?=
 =?us-ascii?Q?3lXNXx2GhJsftyEwxJOVZzJHQ8ffZgyU0w/ATzlO+40mWnvnLj0UDf2Nny6/?=
 =?us-ascii?Q?a+J3NeARPK+EN2DD0QLbqBK3EtFpPEEdfYYvQkdD0McwJaWA/D66ePDNxJqB?=
 =?us-ascii?Q?LJuD9auTwupkoOFged5zUHxZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b0f78b-b08b-48af-05a4-08d90ed646d8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:26:12.5153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5D54Bf+HpWbrZDeTMJN9RnqJqM/doz7UYHFfFwhDES0j1kEqp5XSM9ZgQ5mGR7BilqhAfpyTFwkEAr/YS5yKrOA84TM/gq7AMcjKS4S9P80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.20.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

bdrv_write_threshold_exceeded() is unused at all.

bdrv_write_threshold_is_set() is used only to double check the value of
bs->write_threshold_offset in tests. No real sense in it (both tests do
check real value with help of bdrv_write_threshold_get())

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/write-threshold.h   | 24 ------------------------
 block/write-threshold.c           | 19 -------------------
 tests/unit/test-write-threshold.c |  4 ----
 3 files changed, 47 deletions(-)

diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index 7942dcc368..072bc8f286 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -35,30 +35,6 @@ void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes);
  */
 uint64_t bdrv_write_threshold_get(const BlockDriverState *bs);
 
-/*
- * bdrv_write_threshold_is_set
- *
- * Tell if a write threshold is set for a given BDS.
- */
-bool bdrv_write_threshold_is_set(const BlockDriverState *bs);
-
-/*
- * bdrv_write_threshold_exceeded
- *
- * Return the extent of a write request that exceeded the threshold,
- * or zero if the request is below the threshold.
- * Return zero also if the threshold was not set.
- *
- * NOTE: here we assume the following holds for each request this code
- * deals with:
- *
- * assert((req->offset + req->bytes) <= UINT64_MAX)
- *
- * Please not there is *not* an actual C assert().
- */
-uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
-                                       const BdrvTrackedRequest *req);
-
 /*
  * bdrv_write_threshold_check_write
  *
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 11152c60df..ae54ee05dc 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -24,25 +24,6 @@ uint64_t bdrv_write_threshold_get(const BlockDriverState *bs)
     return bs->write_threshold_offset;
 }
 
-bool bdrv_write_threshold_is_set(const BlockDriverState *bs)
-{
-    return bs->write_threshold_offset > 0;
-}
-
-uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
-                                       const BdrvTrackedRequest *req)
-{
-    if (bdrv_write_threshold_is_set(bs)) {
-        if (req->offset > bs->write_threshold_offset) {
-            return (req->offset - bs->write_threshold_offset) + req->bytes;
-        }
-        if ((req->offset + req->bytes) > bs->write_threshold_offset) {
-            return (req->offset + req->bytes) - bs->write_threshold_offset;
-        }
-    }
-    return 0;
-}
-
 void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes)
 {
     bs->write_threshold_offset = threshold_bytes;
diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index fd40a815b8..bb5c1a5217 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -18,8 +18,6 @@ static void test_threshold_not_set_on_init(void)
     BlockDriverState bs;
     memset(&bs, 0, sizeof(bs));
 
-    g_assert(!bdrv_write_threshold_is_set(&bs));
-
     res = bdrv_write_threshold_get(&bs);
     g_assert_cmpint(res, ==, 0);
 }
@@ -33,8 +31,6 @@ static void test_threshold_set_get(void)
 
     bdrv_write_threshold_set(&bs, threshold);
 
-    g_assert(bdrv_write_threshold_is_set(&bs));
-
     res = bdrv_write_threshold_get(&bs);
     g_assert_cmpint(res, ==, threshold);
 }
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C21361B43
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:23:54 +0200 (CEST)
Received: from localhost ([::1]:53460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJlZ-0003El-4a
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYL-0001hg-1s; Fri, 16 Apr 2021 04:10:13 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:43105 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYI-0007xx-3U; Fri, 16 Apr 2021 04:10:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZBXroVfdi/CBcZOxExxE8FfZfERV+U/+wP1Ngf1iBaL7+5baUBKBjkgv+SF5c7PXyB7m2mqiAq8UjHskXmERLDZ4Ux+7ShHunJg3FG1HfS10pc0n+LuhEbbiKyC117Zr9Eckx4/MKoKobuDpb7V0OZXWDr2PG6Q80yevJfLAz+tJh53YSvlp80DN3r+MKx0wRy87109CsxNhMZBWJM+opbLzC1jXGTRTrMrSZ+eE5cDYjBzeDoE3uOOl+HznlT63FEeaKOWwnMHqOaN+ch9Es2MTLRx536xLh1q2NgJjjwn+PwnAh6rdyVYvex8oDakohY1LA3ZmfJAgocQzoWNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3N4rWOaOPbcBIU9ESJdys2fZA7TE6DSpxJ9f4Jdfucg=;
 b=fleN8g/11FfMi4kZwu10RjK62VK5G1VwosD+jQWhTK/OLB59QCtHO89XivzrKpznfozn5O0eR8te9O+a+RdC7RTlNrS4jobo3N70Chz7v+7b9W3rd+XxqFhMu/mROgA3962dio5B18I9vLZEnnu7ijYLs1NdkSwLTMhpJ/68dG0QbO0h9dalIaGJuJfnFEbpWmbdMyDn7sDGcpOXujIrTiy2Yd1cwn+mBKlMuolk/0pw+e279yolCCg4a5+TZ0D8Atj7MX6ZKAtdaa8mgcmCcXlEY85zJiO37eQlgj2vrPwLM3FOuEkmB+5JxEi0Nqw86wr039xg/Uhlp5NYKAxUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3N4rWOaOPbcBIU9ESJdys2fZA7TE6DSpxJ9f4Jdfucg=;
 b=eeTqxUwpok8EUoNU9E6NFqgQmjNu7vJcy9Ux7WoFw09gxaWJ2U74HPIutP4Itgo1QQr7W3Z1eFj3+zJZqIYMspDmh4KYJ0wDkn44IiypWOb2Sq3Q2zHMaMXMr+CtFkhFRa6pGXrIBq/qzdiGQcbl5l5agX3OrC/Q9BqumZGhpLA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 19/33] block/nbd: split nbd_handle_updated_info out of
 nbd_client_handshake()
Date: Fri, 16 Apr 2021 11:08:57 +0300
Message-Id: <20210416080911.83197-20-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416080911.83197-1-vsementsov@virtuozzo.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a29cc7a-3b9d-4f61-2edb-08d900af036e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691F7D1337BCDE47F2737D0C14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0yX3tck+K6MWARSs2xWR//62GUQKakWpUJ9n7eS4DE4aAjU2ML1M/b5KwaVxLJ9nwSlaOYmnwNoN1GhkYS39LEqLZUJlv2/dIZTl/Os1CzpaS6QdSlIFyH7uI41i4SMxDErD8QxAYGukCkA+e2nKy5bXAsQIA2yIvpkvm2H+1xz4SIdKsiYtdhvD3EconJIdDzaUzheGv5u1MWSHhqUgNKX0lDmM9xNCV8KdPruTxowyB72QzTJVNjCDV2e/K+p8p8TnApWfGkc7f5jSGsFZQsJf+BQy9eJx2kO19K4IwoVluOSoQX2UYQZUiF2+2WWvMbfyDW7W+I1hN9dSvvxlfC/yVFc/nayofjnd2BPghHpWpMqp9BInLi2MUkT/Gbcfj7+pRRdISEOqGpFVi0zGz4s7yxAHo58mZxZ8CoNdwJtGXT3yJBqevLUCrQokJCbwJPwIGXoyzmn/nhtZbSrKTL5OUd3RupGS27i4umvN80dFSOjZB6vpS/3pf3Jg4YnmVE5PbI+h74UuOSvKzs3HX28o+GyyuHbopr911FmaS7+P4cqPVCyv6EVqd0Wj89f/oKYVLlGgcQ81N4asUhd/WJh2L9b6pYGdOL5AaUehqQNKgqFJoTW1GxzXboaD6CEySe0C/WPjnrMtscwwhalA/pWVngtf/z6dshiGaflaGne4LNO0mOlEE63XMXrngTq3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(107886003)(8936002)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(316002)(36756003)(38350700002)(38100700002)(6486002)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FOz3GCy6/eZBpPTxZOxG57b6Vi9bEJc81olfr62MU0cSB0VF2Wislpd7p81R?=
 =?us-ascii?Q?2WW26N0Rvk8QjdyMgth2+btTi2fok7yWsYGZ2SdQ4kPw+q0dVAir97lq8miw?=
 =?us-ascii?Q?uW6J/MlHI7wiCUqnQRsUWugFXDbSeVgpbkEN5XQIG4xrdjO/vOytcusLaKO/?=
 =?us-ascii?Q?ruaBH1kHuN3vGaUs3Jupf4sNIXTfsPVxeew7o6AvpT/FZDnDnYnqHIIud8MY?=
 =?us-ascii?Q?R0om76cEFsfG6K5+xz8C+hPCUzqehQZvzMqI5cZlC5MV3zP0ZrWS6+FDJeLy?=
 =?us-ascii?Q?ZKVuhgb1kEP7fvcoJU9FsKEsFLBLhgiTnJEY8+Om3f90JwC1x6awVDm8z1F9?=
 =?us-ascii?Q?vbtzRjGs5ch6R+IPYabzSHvy/0pU+dZ/TBGo5spMe5QT1wj19WVhqBTkucTU?=
 =?us-ascii?Q?JXRUpjhVNEtLu9r8KbEU4gfl/K62uOyJnbuYZzMSAKnSh+l7ZP07fcg0Seqn?=
 =?us-ascii?Q?TEZchYY9WBSCd6CaZjnTKi94gTh0NitXAcMxuhgW1DsJXe6dqfGVJeeF5r9o?=
 =?us-ascii?Q?RtSZi4n1v/7RiL5tmtwsrEO/YjrzrfTjPWPcjxml2AHZYSz115DniRjalID9?=
 =?us-ascii?Q?8Ry0+ZjUd43PfPyS9KUNSdX4XRdb7lvBYa+hilhc/50/QrAJNM87Tk6B37pF?=
 =?us-ascii?Q?axzhcQsvN3ayAbqTMlXwqzQSNRzmUUtDDntO2ELVUNI/TvYGnXEoRsgpohr8?=
 =?us-ascii?Q?GWQfqGuvPhPUs2vOAsxGYgM1lcL4/ozLfENzIerBbcybRGksLFgzMVM1ZOlP?=
 =?us-ascii?Q?T9F6EUhKnFOdT2C+r5uDuIlxXBfSDRMFijO65HVIzFT4ezFsg8E6V9Nf0XLV?=
 =?us-ascii?Q?DtYHQFeC8g+9zM/qaVn7+n4Ls4vfPlCUoz6A4vOOXLtz7uMx5m2Jk9Y4yPXD?=
 =?us-ascii?Q?nkzxalBUGyRTd73FuPcAVkkH6UyX3Tu/Kqoc6k0WHZOd/7XcgBbyeuQru7Td?=
 =?us-ascii?Q?e7+YOilUMilGn9oLBDfGLsDFmoliyB5jxqRW/epc5IWuTXAHrz84z6eq5g1k?=
 =?us-ascii?Q?0gn4FrSZg3BANcHri48+PxiyOwa0avMgvLwYiVOJk0vR5qUpME39pH7arrlP?=
 =?us-ascii?Q?pdas52F3psRVAHagiwTZ4O+gXI7nHifBd46AD7KRLOfP16dLDryMWfaKVVuk?=
 =?us-ascii?Q?7tyb4kYWuW0K974KZIbk8PaK3sr2sKwhlTVStesGZq+suRtQ4NnmcXFyDaO1?=
 =?us-ascii?Q?AqukyEhAcfu7XzhsGnN4N5nxgEa1cKs7H1jV3LcIUtB7TgeXqP1dq1PQl+fW?=
 =?us-ascii?Q?0WIIDc22c24xECVCt8crYRMjDLlrOTHthwPLzErlFTbp+MvgODT1W88wvsSe?=
 =?us-ascii?Q?otge81agrQq5nt0JAk3543RH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a29cc7a-3b9d-4f61-2edb-08d900af036e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:52.8108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYHJswj0LscFZpC8KZBmP/oR2+oE0uiHQFTFe/lVVYjTLO0+6BslgZc0dk4asF7+Cm5u1gVoXORSGyBifnsw6eZEaKA1UavKxneSEbfMMQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.20.123;
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

To be reused in the following patch.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 99 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 57 insertions(+), 42 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 5e63caaf4b..03ffe95231 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -318,6 +318,50 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }
 
+/*
+ * Check s->info updated by negotiation process.
+ * Update @bs correspondingly to new options.
+ */
+static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
+{
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    int ret;
+
+    if (s->x_dirty_bitmap) {
+        if (!s->info.base_allocation) {
+            error_setg(errp, "requested x-dirty-bitmap %s not found",
+                       s->x_dirty_bitmap);
+            return -EINVAL;
+        }
+        if (strcmp(s->x_dirty_bitmap, "qemu:allocation-depth") == 0) {
+            s->alloc_depth = true;
+        }
+    }
+
+    if (s->info.flags & NBD_FLAG_READ_ONLY) {
+        ret = bdrv_apply_auto_read_only(bs, "NBD export is read-only", errp);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    if (s->info.flags & NBD_FLAG_SEND_FUA) {
+        bs->supported_write_flags = BDRV_REQ_FUA;
+        bs->supported_zero_flags |= BDRV_REQ_FUA;
+    }
+
+    if (s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES) {
+        bs->supported_zero_flags |= BDRV_REQ_MAY_UNMAP;
+        if (s->info.flags & NBD_FLAG_SEND_FAST_ZERO) {
+            bs->supported_zero_flags |= BDRV_REQ_NO_FALLBACK;
+        }
+    }
+
+    trace_nbd_client_handshake_success(s->export);
+
+    return 0;
+}
+
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
@@ -1579,49 +1623,13 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
         s->sioc = NULL;
         return ret;
     }
-    if (s->x_dirty_bitmap) {
-        if (!s->info.base_allocation) {
-            error_setg(errp, "requested x-dirty-bitmap %s not found",
-                       s->x_dirty_bitmap);
-            ret = -EINVAL;
-            goto fail;
-        }
-        if (strcmp(s->x_dirty_bitmap, "qemu:allocation-depth") == 0) {
-            s->alloc_depth = true;
-        }
-    }
-    if (s->info.flags & NBD_FLAG_READ_ONLY) {
-        ret = bdrv_apply_auto_read_only(bs, "NBD export is read-only", errp);
-        if (ret < 0) {
-            goto fail;
-        }
-    }
-    if (s->info.flags & NBD_FLAG_SEND_FUA) {
-        bs->supported_write_flags = BDRV_REQ_FUA;
-        bs->supported_zero_flags |= BDRV_REQ_FUA;
-    }
-    if (s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES) {
-        bs->supported_zero_flags |= BDRV_REQ_MAY_UNMAP;
-        if (s->info.flags & NBD_FLAG_SEND_FAST_ZERO) {
-            bs->supported_zero_flags |= BDRV_REQ_NO_FALLBACK;
-        }
-    }
 
-    if (!s->ioc) {
-        s->ioc = QIO_CHANNEL(s->sioc);
-        object_ref(OBJECT(s->ioc));
-    }
-
-    trace_nbd_client_handshake_success(s->export);
-
-    return 0;
-
- fail:
-    /*
-     * We have connected, but must fail for other reasons.
-     * Send NBD_CMD_DISC as a courtesy to the server.
-     */
-    {
+    ret = nbd_handle_updated_info(bs, errp);
+    if (ret < 0) {
+        /*
+         * We have connected, but must fail for other reasons.
+         * Send NBD_CMD_DISC as a courtesy to the server.
+         */
         NBDRequest request = { .type = NBD_CMD_DISC };
 
         nbd_send_request(s->ioc ?: QIO_CHANNEL(s->sioc), &request);
@@ -1635,6 +1643,13 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
 
         return ret;
     }
+
+    if (!s->ioc) {
+        s->ioc = QIO_CHANNEL(s->sioc);
+        object_ref(OBJECT(s->ioc));
+    }
+
+    return 0;
 }
 
 /*
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B507361B4F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:30:27 +0200 (CEST)
Received: from localhost ([::1]:46536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJru-0003vw-1Z
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYU-0001nL-Ho; Fri, 16 Apr 2021 04:10:22 -0400
Received: from mail-vi1eur05on2098.outbound.protection.outlook.com
 ([40.107.21.98]:63928 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYI-0008Ex-Bp; Fri, 16 Apr 2021 04:10:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8hU5xAQWnxANTuNjBbYczCpKOCJ4A7CGDzx91czKavg2HE6Bj3XUqj4E77l0wjEZx1SYvlvU7cGl4xOsv6/PNsOp3uLPd/NvzlnKYraJhxBz1ywV94lAbGiRTbwWoW+a+2QftJw31wmE3Z2YCbtBKOFAbI4B0OpDbGG9cg4J4ave/CO0ASQxTEqn0kXpyBGP2b52UnZvNLW6ZbbXjWlOsCvrmOrPDOZjFRI/Mep7x13mHOdL1qfIcI47r0RXiF+GlpoiRpxqbIeOsj8pP7ItGAu6pBPQ8eH35K6RGGznRbO9QQo0RvguuxcPdC8EXqNP/vZ73QV6N6SIZWfycJZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IFOo/T6q/eD9kyJaPyChU2Jr602vQ+io7ui8mF32h8=;
 b=S7dHL+yN2KFlrd/odENZkPxENDkVRq+ZXffSWfdgTU7yjg3BlR+6Ce3I8mxUAc+IkKqOcwFM0hJZIo7wks4nW0rPCXXnZYJqpzUkyiDMPjmVWfjGmIiYlWShAqIvL1Mj4bhLGjMch08+m/o8W2VHVhB/ixogwD+sCVzRxgpOEN26UCJxXp0QAHvZCrVY8bk9qXXKO5l2OVREJh6QsQZtYaP4sLwYJbi0Rh6ZqOX9PmJVRjIR68od00fA2o5KG6THG38GtpWhTwqmYa7nstE5ab7o1FBI3Y8h86hz+gjIsUxwMEZiSwK8j982fAKyjVgppR4rch8+Cv9hYivZtVLKWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IFOo/T6q/eD9kyJaPyChU2Jr602vQ+io7ui8mF32h8=;
 b=EH17WPFMXDztMWC/Zrmv8tOYuwdiDA0acZBJW8WFfRLvhijknCAnXKLDCVXCNj2ICdop1w4tEs9oKEzTLQPxMHQogZHM8ty5EHSouQA2v5zOHlf51X4Gs+/7R6Wq92fvTRPnLdpweWPuuniDtrxsLgtX9d/JkaAGMrT1Yl3GZMs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5029.eurprd08.prod.outlook.com (2603:10a6:20b:e7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 08:10:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:10:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 29/33] nbd/client-connection: add option for non-blocking
 connection attempt
Date: Fri, 16 Apr 2021 11:09:07 +0300
Message-Id: <20210416080911.83197-30-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:10:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b771953d-7f21-4429-b885-08d900af0ba8
X-MS-TrafficTypeDiagnostic: AM6PR08MB5029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50297B3B013EA704749014A7C14C9@AM6PR08MB5029.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KxzLYc0miyBx6P1ye3IHtZKvHochC2615q5OUdeK0tD0OtUlYOVLoVA41wtnqYuEPNpL789qrYAwVbWfwR1Duu/PvKvUL7I/ObCl+RJ6KmhF0Cs3hUW9LIDAMqug2MPioiBOclv+is3M3cO35N2a3Bz6AajA0pVxJC8sv1FBBa9TPpeWUZ8TdyvX2h4mPUa3+Rk8W/vbY0SQxvf0RolQCfOOawIBcj+2k3OZMBjBCtpKrbb04U2LV12Vd+YQNbZvCY8zXze9UrFkRnEswkS4LQtn0EOled1XzEKCrnEac2EUr/TwmJN2hkq6IpinXA64WvmYsPH9zN0qYe1BCuI0s53cyPdyTRvCCtuwymOxtVpJtEpsrsr506QjmNI+EjrolvEBkoJ6tx8wpRN7iye7ydF6Rbs8443N4hk5RTTzIiDWfYAhCDtYveqnIpa5ctI7ZzEZZXCVdYcPS+V3p8FswDkRULHlH97H3v8CPbkCn5pO+BA/RxhXq564L/YeCStBoNMuBF2biQCFIyHY7OXEhgE07wuMvvQSW8l1uu3H2GRIB195znzKsEBQRd46ar/wjbuczROcfElnsNVijrmhgth22xkXIc89hmPiqWq3g//pbWyzFiVJof9GzrCke8GRk8cGnMsRGK+UeD9EFN7Bj69ED6JPjs0LjuB9rEtVIjA092q1HCb3GIqZ/3EtKyNM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39840400004)(86362001)(956004)(69590400012)(6506007)(478600001)(8676002)(36756003)(6916009)(5660300002)(8936002)(4326008)(16526019)(107886003)(26005)(186003)(52116002)(316002)(2616005)(66476007)(66556008)(6512007)(38100700002)(1076003)(83380400001)(38350700002)(2906002)(66946007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F8s1dH33iur7gOvCPK+/ZTeBOSNL+nyPlILbm3nNSB5fkeJVoASS3wjkSdJF?=
 =?us-ascii?Q?PhmEWSr4S0kJfvxX/CxDDAoWYFQ+ROiMciuukKqJDv4/OVIRq+VQUXGDkXBH?=
 =?us-ascii?Q?Cw7pSEgBSz7TCr3XODHSospVnEB5ufB5eDrb8U5ReATffjkuXA0d7kGdBHP/?=
 =?us-ascii?Q?/cmp7K/It0tjGiKI7XEeXusOAVOrNHU9IM7YdENPGSfRXKOrmEpXcDNMuvdT?=
 =?us-ascii?Q?HuLe717ZqRbZgw7URlDN1cF0ECOS0d0gLcxR/NT973Cwkr6Y7HNjg0gUC0jQ?=
 =?us-ascii?Q?8J4CZtBCu1IrTLuBs5Zk3n4GmgjdXeUjNCkyeFrjojku9QjIgXrKAr76y01b?=
 =?us-ascii?Q?hvwDoFWik2Yh2fvrSisE1DUIv3emlqYtwhttybFHlmloOy+l+hV1vNF7YPCi?=
 =?us-ascii?Q?EBDDxtAQjQvjQNoROr1D4zza7SwjIuKU6w2jeWFKKRXisbyY2rUsVPHCjPTh?=
 =?us-ascii?Q?yFpQWiaZLYA59kaiYZrfWKszjrj/g1zrCkS+0dBokoqBLGitDj0nHXVzupZ7?=
 =?us-ascii?Q?voCYlKWo547J8HgyPManu4XL6Gm4GwzbuRMXXiBvqviruLRqEBAiRA86O6Cf?=
 =?us-ascii?Q?jbHa29/sGlPNrOfg4Lu6T5H0vanHXewoWDu40/rGpMKyIOcGmqUjg+ClboqO?=
 =?us-ascii?Q?dbKrjPX2lsDilmMxasRrHm8kHbyQCf7yR1yRZw8d3PWw6XnVUT5ddMDNomZv?=
 =?us-ascii?Q?0R3w5V4UCfNldjJXgYPSdf7jacUCnYFOZv/gjVYRMnTufiA6Oc+NBoiLxdYz?=
 =?us-ascii?Q?RxNEvjZe3e8m2lm+/tkbKKb53p0/oIATh+IxGYRrtw/JT3b+4Nj7LTd61r4S?=
 =?us-ascii?Q?tuI+wJNOTFUF6i1zHPBUjpxHqAU+pkQnyBoFO/bm9txaCa5kW6Tk5kmh/hqq?=
 =?us-ascii?Q?R299AxczEponGZQbZNktPtXvSrwTkmzWnlLRRS6i6zCDRPX70vPJBjdCqKVj?=
 =?us-ascii?Q?gN3RS0ho0xAIOZLqyQSdKXIq50RhBAEOtBVS+CoSvuhevKeqLK5ClOoNZyzz?=
 =?us-ascii?Q?Ov/ibV24C3+WLdwmbgpPw9CLtSgFuEmFJhvw8DATasqxq9oEhl61jIxHDcKy?=
 =?us-ascii?Q?y5XEAMBRYbjR3T5Np6ttExBRHXTv6Rewi0FvGYsii3EuLza+AcPkeAwoFuip?=
 =?us-ascii?Q?ES/mWVawXHsPL3kyuYGdQV7eAabM8opUGcnaztBfwls9KW1nEfluHLWGsHJV?=
 =?us-ascii?Q?B0P8E6e3aj0Yd6c8QJLcdwmFYGTuN8UCeRQcGH8d7+wsfoxcgm4q2a/KHf49?=
 =?us-ascii?Q?EA5ArzDd6xAQBsvgq92IARdDI4izj8vCoHioq2xHd6gmKKlJ6wrlFQkDS6AQ?=
 =?us-ascii?Q?TDc0FKN03N2U9ePMh+8c6WXB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b771953d-7f21-4429-b885-08d900af0ba8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:10:06.6182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6HfIVoULX/gJZOH6M4IcPbaPUNNkmrzswSlJ/D3uk7npDQYAe8zZya7sdntZVMOs/83TUvT2m1Tnt35BJTHCpnPYIhJK3g9c03um3oylZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5029
Received-SPF: pass client-ip=40.107.21.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We'll need a possibility of non-blocking nbd_co_establish_connection(),
so that it returns immediately, and it returns success only if
connections was previously established in background.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/nbd.h     | 2 +-
 block/nbd.c             | 2 +-
 nbd/client-connection.c | 8 +++++++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 00bf08bade..6d5a807482 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -421,7 +421,7 @@ void nbd_client_connection_release(NBDClientConnection *conn);
 
 QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
-                            Error **errp);
+                            bool blocking, Error **errp);
 
 void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 
diff --git a/block/nbd.c b/block/nbd.c
index 59971bfba8..863d950abd 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -368,7 +368,7 @@ static int nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp)
 
     assert(!s->ioc);
 
-    s->ioc = nbd_co_establish_connection(s->conn, &s->info, errp);
+    s->ioc = nbd_co_establish_connection(s->conn, &s->info, true, errp);
     if (!s->ioc) {
         return -ECONNREFUSED;
     }
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 00efff293f..8914de7b94 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -251,6 +251,8 @@ void nbd_client_connection_release(NBDClientConnection *conn)
  *     result, just return it now
  *   otherwise if thread is not running, start a thread and wait for completion
  *
+ * If @blocking is false, don't wait for the thread, return immediately.
+ *
  * If @info is not NULL, also do nbd-negotiation after successful connection.
  * In this case info is used only as out parameter, and is fully initialized by
  * nbd_co_establish_connection(). "IN" fields of info as well as related only to
@@ -259,7 +261,7 @@ void nbd_client_connection_release(NBDClientConnection *conn)
  */
 QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
-                            Error **errp)
+                            bool blocking, Error **errp)
 {
     QIOChannel *ioc;
     QemuThread thread;
@@ -299,6 +301,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
                                connect_thread_func, conn, QEMU_THREAD_DETACHED);
         }
 
+        if (!blocking) {
+            return NULL;
+        }
+
         conn->wait_co = qemu_coroutine_self();
     }
 
-- 
2.29.2



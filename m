Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D533A2971
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:37:26 +0200 (CEST)
Received: from localhost ([::1]:38882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrI3x-00075O-N9
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcw-00069I-BN; Thu, 10 Jun 2021 06:09:31 -0400
Received: from mail-eopbgr60094.outbound.protection.outlook.com
 ([40.107.6.94]:1862 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHct-0005Hv-Db; Thu, 10 Jun 2021 06:09:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2w4M+0bG+kabWoJzJOD65DnILE7qvdgm39fooUdTiPkLsWBd17LB2IN/QYNHsgDdgoxRlelzB6dqabk33f6I4d0c9IeQn0+ZLYtXkJo3omjPr+1Pf+6Gxq0rGczB5dCKq0MGglm2cVqsUokPx24VuSVtc/CX9e39omJMm5MbnrZxctOjMezAioHi4UAhzNv0+ccMHX9lzOlWSMmWYkOeiYKLdoGoTXMRZJ1sgC/zo4lW9R898bRzJPD2aOTc7vtRre0vBBhmGA/ldRluqR97tg9AWItUZUlyJbi/7yYKwdzag0RzD4KBYK5K5RZ3BxbhHY83dp3H3n8rNXRb2cqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9oOutGUjSZi06WUdfl1JV61UYRFLcjmiqSpCbbGZr8=;
 b=edHvSjZRAb4qUvzhfL1bhj/uh6UEavsO0DURoqHJdGveS2nAUV+im5SJVhNLE3iK4YnV5L7+QozMqwnEKLvtroTok41ltCt8RHkjf+eBFi6TRaAkOen2+8oIduwiv4YvDLDDVYoRi4eAd9x2oMsD+dfpi08izqVINTqJa9APfUgPpbvTFN0M92oCUgu3bvZ96qb8uHTXf5+H13btNpo3RAmCx3cdnvowtcjndCqZqpbtYPgtnKlButMq6q0ckHPD7cfIW/UAFsfVCYVsuQ4Nir2bsKlkEOAukTus36gyTsZnIvEic7jugDgugHOriu4+rFsh8NUl6xj23anG0tIkGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9oOutGUjSZi06WUdfl1JV61UYRFLcjmiqSpCbbGZr8=;
 b=OsoPdACkTtAxdyG8hu5m2PCILjf3suU8fsA/61bYrKis2xpiyl0Qu41FFmQvQiYxmxmoeyDm3JAVbbjHgCCVbWtALfv+ImB47OOdccqTqUGzHacZ0ZP65PmzUhvtmEtKsZF8XA/UOzOmpazWBVOCJj2BikdkkYK1mdOIirHenl8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6806.eurprd08.prod.outlook.com (2603:10a6:20b:39b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 10 Jun
 2021 10:09:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 29/32] nbd/client-connection: add option for non-blocking
 connection attempt
Date: Thu, 10 Jun 2021 13:07:59 +0300
Message-Id: <20210610100802.5888-30-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610100802.5888-1-vsementsov@virtuozzo.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c399af7a-d31e-43ef-8805-08d92bf7cfdc
X-MS-TrafficTypeDiagnostic: AS8PR08MB6806:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6806529A832B4CF4317842E1C1359@AS8PR08MB6806.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Hbx346S+LjDXyb8yfU5mT2XgrucI9teNtlRho9xdLGNEacXUqWXfQB6MVQSKmajB8nuI3jA94Sk9a01jox/dnC6US8sA3rSPMipYBa1YRC6/pnKWXCkOSfcyikPIMZJ1bVeowELKNQI+owFqpfIVkfZ5YSAwJ5lAjzMzZtMiRqWCIgTQ2Et1hv3zmWtVg4pVAAkJ4YcVCjS2LI4a4ItfJc++ffA5/lbwSsVVdGmeKHaBZSUkdjXU/ihTO1XtN7FXjsgdCR/Dx5o7/yDui28IN2SPUk8Kp1oCbC/gtSi6+Km7wJRwTm2vI7fs/qsLy9LcBe3xFwGqiUO8ZRnk2tCCxYy+4Yn4G6RN1iud1F8+XRB4KKZ+RP0xoTW2/631IBV+HMGsQFD89xf5/xUb5lqjhgpSLdnUD9nZVy4XFHxEuSBkvvhGHCHkcVW+3b+v6EoDm6j2oaxdQvXRQPyy9Dzl78mBSj452NDn053sbjhhzpY0Jcdo71PXHhrXFDF9Aj/Uo6KqiiJ7fL45DsZw2h4A273uDCjYaJaHv9pTpXNCQgQRj5y+F7vTLQNyJ61JSrL4cB2e1AjG113EK67K6I+a4bVTc2VR7rVhzSQcHt1U3Uz8/m9wNBppkCxf0tMGEpV5M24xlyuzKYflM2iH1KCcfILBJTtcLuYo8/sqCz4HtAmtWQ1KwY4FevRgyEep93c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39830400003)(376002)(396003)(346002)(2616005)(2906002)(316002)(6512007)(5660300002)(8676002)(1076003)(8936002)(956004)(6506007)(86362001)(66556008)(38350700002)(16526019)(186003)(66476007)(478600001)(6486002)(6666004)(4326008)(38100700002)(26005)(66946007)(6916009)(52116002)(83380400001)(36756003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vWeXnytou9u0nBdNrQVEWVdyrx7LRNPLRspmeRJKMPpjZeQDTb5YKZHIQXOc?=
 =?us-ascii?Q?MepPhyuCoVLCMK6ogIfKF98JJPA5F/vH069b9uH2gwMXaCSxNg1nZDUYdHXf?=
 =?us-ascii?Q?BFIcQ7XUzRhXC27+imjx1NN760rtiAFnnb+Vcx6Re5D12mc2s5Wu62Y3H4Rq?=
 =?us-ascii?Q?mMKUwdVFUb5ZKIzsQ8l4a7/4S2bKSVJAAm0usLQ+zSJhVv5uDugVVgSdqC0P?=
 =?us-ascii?Q?6bkq8QcIl1fgo/pVSVH4i7VWtMnkqaz6TF/9T+kJk3J3sruXrLYXAukZ/0Dy?=
 =?us-ascii?Q?at3HeKmFC/5uJBF9N04OaQvTJ3cQXCboA6pgPpCxLVLiuWf7e1sYR0fTq0XW?=
 =?us-ascii?Q?mfAcileN+mL0aX9oj24tyNsnFMEQURqYBejM5/+5kUpzuyXHA8bAI4abcQ+P?=
 =?us-ascii?Q?rbDjkydUzmJZfsQp7bxo2PsMJL0pEbSWphfeYFK+cvfGpzPTVTemPrjoaV9W?=
 =?us-ascii?Q?wocLhNUg7cDKKEgWhOg4hMy7zqGoZvqF9/2isKjs55TfAhFNZX5VT2yb4btZ?=
 =?us-ascii?Q?SbBevPu1YQjJfS59VMo/7TNdU3MXiuM8TbaySNimTXiyxZojw4wBu6jDXcTd?=
 =?us-ascii?Q?cRFZk0Y8T/tN0kjM/5UNU0fv7EryWZH80zzSCNhpzshgm+aaxaFplGLGU1oL?=
 =?us-ascii?Q?Ih7oBWu5ZvqaEV12ZZAO+m+jooIOSQPRiOMaHfFxyohU8TcDCWdcwNf19aVB?=
 =?us-ascii?Q?BbRVFlz5DQLnoBURnmEx7rB+4/Fx+TSXZg8qC33K4Aw1u6JKyM8yQ+Danhk7?=
 =?us-ascii?Q?6e5pVv989G0PB3MR+kSPC1R5wlMdibZzM3QPhCjmLfZL8uQc7fOK5xR5vpYD?=
 =?us-ascii?Q?1xbmarePg1u/7F3en9ihCYIGT5WlYrUlgQRYC8gdoF8vG1VdtbVlIr2dWErg?=
 =?us-ascii?Q?+IApyUsy9WlDn5ZvKsn/7nhK5HKvBIeXGTPThlqOs1OZof2FHUInW3Bd9ZEm?=
 =?us-ascii?Q?NpEXxi8JJ+jwfAO1cv6aeR/YD2G1l1H9lq7B1ZhTkzRy9bTgQCc7eMvpiKXq?=
 =?us-ascii?Q?knrPgcSCMtnJM5R75bKB/VzTkW5w/MEOXzsBq/y68I8ob1N2bK21Jsgxtt8l?=
 =?us-ascii?Q?CPV5MXMWlMaiUj02VUCj4m+kzlaePf+eEYRI9CnBET8bR+FsVeyXjS7B2H6J?=
 =?us-ascii?Q?AvbW9yKsynGVSb/zIkXxWdUZVwuVWy4ZmVxi99UoAHHWMMSCVIwRCrW3k5+D?=
 =?us-ascii?Q?n7qNsHpnwOqVYb6YtlVib/ubmvhcTH5buX9GxT3B5/fu1FtnNbGzbUZxSwsH?=
 =?us-ascii?Q?m5vFHzwM2p+ZKmOoHD0JsSTrsNlFQyI9j6NnQ29GAeM9K/eklmRCqi85aZTe?=
 =?us-ascii?Q?CnB3LtZ7e/Cc69RxDiZallOJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c399af7a-d31e-43ef-8805-08d92bf7cfdc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:19.6218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGdNBDIcatEQ6z5ZVikQ0HEqquM83nM7VgoDvQiE0uFtTBIQTrGN8UnDTTXjEICoBgYhxmm0iiuTBvBJhBiiUmBWJ7upLghZqNyu3pf/fTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6806
Received-SPF: pass client-ip=40.107.6.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

We'll need a possibility of non-blocking nbd_co_establish_connection(),
so that it returns immediately, and it returns success only if a
connections was previously established in background.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h     | 2 +-
 block/nbd.c             | 2 +-
 nbd/client-connection.c | 8 +++++++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 10c8a0bcca..78d101b774 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -420,7 +420,7 @@ void nbd_client_connection_release(NBDClientConnection *conn);
 
 QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
-                            Error **errp);
+                            bool blocking, Error **errp);
 
 void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 
diff --git a/block/nbd.c b/block/nbd.c
index 8caeafc8d3..bf2e939314 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -364,7 +364,7 @@ static int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
 
     assert(!s->ioc);
 
-    s->ioc = nbd_co_establish_connection(s->conn, &s->info, errp);
+    s->ioc = nbd_co_establish_connection(s->conn, &s->info, true, errp);
     if (!s->ioc) {
         return -ECONNREFUSED;
     }
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 500b8591e8..250d094b4d 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -265,6 +265,8 @@ void nbd_client_connection_release(NBDClientConnection *conn)
  *   otherwise the thread is not running, so start a thread and wait for
  *     completion
  *
+ * If @blocking is false, don't wait for the thread, return immediately.
+ *
  * If @info is not NULL, also do nbd-negotiation after successful connection.
  * In this case info is used only as out parameter, and is fully initialized by
  * nbd_co_establish_connection(). "IN" fields of info as well as related only to
@@ -273,7 +275,7 @@ void nbd_client_connection_release(NBDClientConnection *conn)
  */
 QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
-                            Error **errp)
+                            bool blocking, Error **errp)
 {
     QIOChannel *ioc;
     QemuThread thread;
@@ -313,6 +315,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
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



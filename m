Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BAC400C1A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:27:28 +0200 (CEST)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYVr-0005or-96
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTX-0002QA-Sb; Sat, 04 Sep 2021 12:25:03 -0400
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:18546 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTW-0007GP-0f; Sat, 04 Sep 2021 12:25:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/6A1p9q85PkSSDeT5aiH4xvAaV7KDGQr6yfDo1LHkMnAcuwIhDlnzy8orflSBOrHE4buLdvmdVm3n7md0LT1YiA0g1C1aUxM7sFkPAryFtyC+Bqx9Zft173OugfMIxlGMQC4vCvi73NuYxN2UsACq/xCZrW2p2rEdFjGaye6UPK24gwZF4uEwCC/h8N2l0dnmE7mnGT4Mo3dh9J2e4K7WzXnaq7edT2xrFJf260S0POL61GsM3jXU86Y47bfYt9JaU7CKM6Y3zTp1uxbW0cLi0N5p7I+T/fBSot+7h2StbrI1/XJ8/bn9fWDeEfeXfYwGo6aSa8dv9dEow0bqYRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=I9Jtv1DP6rs/J+W8weW3o3sqgzZ1lyN4tEXcxtKx+lo=;
 b=Y5L9057N9iFnFw5aZFavjZCiBNMpKjFfMMI5QvCG/IVYd6KBCHFz9vO5kyhek/eEHPFYrYk2aJz8EHwbfB9IFsih+9NJKabemMYg0LRnAAAO7YTMp9EUCtcBg2VhryxDmz+2dXhrPSH6pCU+VdBuOZcNKKRgUh1SMBJn5hL0cNh6nVGvDsKejuWl9uOWiNLTbtJrrXdUc9hAD95r6sqZs0IUVBcJRSLAdOvKgLlaoAoGyaDg7Hs5VLQs4iHOnH+TheAFy64Fu/o4xqwQZFRGADjrsdKvLhkh/h476AkLx7/wO3AZPYAy++6qjnu+vn8aTBQHrnu3oEFjnMrjkr9oyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9Jtv1DP6rs/J+W8weW3o3sqgzZ1lyN4tEXcxtKx+lo=;
 b=A3ZtHutpuoWqmkP06Q78t3QcZ8S9Pj9/CU+bRXhQKKsskPI6NhEWwVPpAQRUDLzn6L3Xk7UYmYEDVWV9MzS0c2FrYOwxSuXm4gNaNn3PMrzFQqsB9Ofyhb1Di+FCxhpHTYyYF+jvIFnasdvBbQ9M3c21JskhcWyfUrl48dfeNpI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sat, 4 Sep
 2021 16:24:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.024; Sat, 4 Sep 2021
 16:24:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v7 02/11] block/reqlist: add reqlist_new_req() and
 reqlist_free_req()
Date: Sat,  4 Sep 2021 19:24:19 +0300
Message-Id: <20210904162428.222008-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210904162428.222008-1-vsementsov@virtuozzo.com>
References: <20210904162428.222008-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Sat, 4 Sep 2021 16:24:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 317200f4-0aed-4322-1d52-08d96fc087ea
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB69046F520C8A6663360FC25FC1D09@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1e+35RlfEiuQfku529SFvGUz8agJz3AvLAakcnkf4A+9bSyNFXl1NNctYx9nbYb5+3ojASPHXQNsRwAwKnbPCL99Yuc1kdqay3a9pfHLvTD/tZCNhSq6HUG3SlVvSFTykaORZpfKnyRcYllerWwpiUjPW15898XThr5qKPSZV1D0D4uYKza5L/daFSa5h1YZbULNEjpOgHpc9KftQqY9FI3Jpg/NM8mYI/Hz+G0PA+3a7s4RKqEOBRK+xe9u0hRBYh2y9wx3rocDlwPPC+dv9j1QIieWqYhrB2f5zJeOInzzwsAZnSkMLCFl6faEl1KvuHHDJ5YAEIzT1xHlW0IWIwcou3wfAOQ00rqsbORe3ZCpPDrUOY6LId71VoDw+W6rZvhGaXy0Rb1aAMoQwyFBKUahN7Bsg4rIR2T1SKWC4Ss6lug8JvT8yvAWxyzbHhwRRhHJatOHmvFE+I+MN4bSmzX6jtyYvxethAlJ7jjxrYKBYQzE+pLKlZsFNy1CSaI7b48RkgupYMEWcQ/d+sx8v5sZJ4+W+I/AuYiCjFgtX7fYffj7wMaJupFWZz8/um5GHbrqvzDws+dQT1FZy131TZ1PJqlUopzsrnrs90wejfKx0m2OU5Um8kq5kiWYmsEUbGworCwOaFHWwDRk/yAAqZxNEwM95puU5d0Ia7A73RVoCkxA2YvfkXskClOB3VimHaft/B0AEmFwprt/mrw6JA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(6486002)(66946007)(8936002)(52116002)(6666004)(83380400001)(478600001)(4326008)(38350700002)(186003)(38100700002)(4744005)(5660300002)(2906002)(1076003)(8676002)(6506007)(86362001)(6916009)(6512007)(66556008)(36756003)(26005)(2616005)(956004)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Viu39yUyFvQR3PJ9+eayftb9y5Ut6NnQkWcsTbE5FeMZmtQy4t/Ypv3JwH13?=
 =?us-ascii?Q?6hgBxhmU7B+3u+S3cleCsRa6fU80JdeElSL5iGZkaUihXBbuP68oMyHNSzSQ?=
 =?us-ascii?Q?nCedYFvqOLyill2F3uvAM1kuXnXEu0JWs+0XSDf3MahLGCTxE4xjh94HXcL+?=
 =?us-ascii?Q?d9/rGclxAWTwaX5XBzI+LBtwfqFyfMCN8W9Mg14t07f/T7Z8i+3qYnQQYogt?=
 =?us-ascii?Q?n5tFQPpOINLpT6o7eyUp1FcZeG8Y75444+fbJEPqeVSiqNdnYYXNVLC0ANI6?=
 =?us-ascii?Q?Y9Wzp1/fuC3cKOCUPX5HHo1/sUQIplKssnujK7uJtOvZRbmGIU1KfJ8G2TlK?=
 =?us-ascii?Q?wOJhJyYYkQIsekwZCeAbdLKeEN7xRwFrMnd0sxq0f7JbtJRZo2PwA5ZfPFPs?=
 =?us-ascii?Q?GkexLiqGTq01fmKrgMqDRt/AFqgb02ZUX6Mnp1BJ7ccXNKwDyCC8+JKtTY78?=
 =?us-ascii?Q?TO2s+hxjWS7d4MvT3rpU78U22cGEPhqOrMOtZ3Ma59gfCL0CFMDr/PN0/7JK?=
 =?us-ascii?Q?Ji946/T2b7wRpNp4NYsT57ElR1GqLUSP3Qk/MZ9j6Dvz3m79VIuDA/ZqZsPL?=
 =?us-ascii?Q?pxWYPdJHogB0BXMiwN36gCU/CpPgCohIuLLZRyBaXYmQ/QVnhDHQGGkRMwLm?=
 =?us-ascii?Q?mShshq8is0rjXtB7AgRliI2h6HCQdevCEcFmDIulcrN2s3GnaQHXbcxRQaK6?=
 =?us-ascii?Q?9xS/2rJUBXCad48A4u2TIXbZi+ac+Oi1eM5CwQENnv/sWCVZq8tduVqidEAA?=
 =?us-ascii?Q?s4qI5WJNC//eiLAvpfxQWwjcA39ki3+/oWrxUZz2/8R6I5bWMngDDN4m8eeJ?=
 =?us-ascii?Q?dZoPSuZgygZnU99sdKT7QvW+utMTF9R/O2NdkIgedo4bettfW1eCb3t7b3Dp?=
 =?us-ascii?Q?LSYCkymAmneAtyVSLK7+DbIp1Y/FVd8l8Eqt6XTHgI0WwaWN0VdBufEoly1P?=
 =?us-ascii?Q?oo+qBB5dphWxdA37UgGJVxutiLDYYBIK7UmbJDNyTfgqNSztd2iRnJqslOnm?=
 =?us-ascii?Q?tKagd3vNiYlOVZYH3jFhrzq2me5lZaFQ2wKF+WynxfOcvUR4bHQrz9MLplsn?=
 =?us-ascii?Q?slTi7y/9VadrqxwlrAjJ6AyWbfsa1GQRNjWKsPjMpqAi+muxnihNkI4U9/Il?=
 =?us-ascii?Q?HXz6fyQ/q+x1AvqOzg+08xcpLF0FAYOTj2047aFiZQ9wg0n2j4+L1vtbnGxb?=
 =?us-ascii?Q?W9yEEFQPe+e+1GYtbpjSBn6o+RVEmZTwfRo6K/N+xc1oPNfEKq1qRG33bWde?=
 =?us-ascii?Q?55UWv6jrkgwiAAjYNVlYHawn7gT4qQ4ZuTLA0VC6oKD3zeSKe2ucX1PX3B8m?=
 =?us-ascii?Q?m1GspC5DEI/nM2UbzlK2Ik1b?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 317200f4-0aed-4322-1d52-08d96fc087ea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 16:24:55.7871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esORg8TupAA3Q/UlwAZkkNduR6wq+eZEOcGFAmX2ts9SGmuwH3XbClRuMWMz8DYpMIMFENNUWHoSeugcnjAZLoLagXTxfeQstuKENQpUuIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.21.95;
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

Add convenient helpers for heap allocation of requests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/reqlist.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/block/reqlist.h b/include/block/reqlist.h
index b904d80216..32dc87666f 100644
--- a/include/block/reqlist.h
+++ b/include/block/reqlist.h
@@ -64,4 +64,24 @@ void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes);
  */
 void coroutine_fn reqlist_remove_req(BlockReq *req);
 
+/* Allocate, initialize and add to the list new request. */
+static inline BlockReq *reqlist_new_req(BlockReqList *reqs, uint64_t offset,
+                                        uint64_t bytes)
+{
+    BlockReq *req = g_new(BlockReq, 1);
+
+    reqlist_init_req(reqs, req, offset, bytes);
+
+    return req;
+}
+
+/* Remove request and g_free it. */
+static inline void reqlist_free_req(BlockReq *req)
+{
+    if (req) {
+        reqlist_remove_req(req);
+        g_free(req);
+    }
+}
+
 #endif /* REQLIST_H */
-- 
2.29.2



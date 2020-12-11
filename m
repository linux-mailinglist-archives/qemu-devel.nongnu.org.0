Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A392D7EAF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:52:26 +0100 (CET)
Received: from localhost ([::1]:54820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnWj-0006bS-2W
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKm-0006cp-TQ; Fri, 11 Dec 2020 13:40:05 -0500
Received: from mail-eopbgr70090.outbound.protection.outlook.com
 ([40.107.7.90]:11267 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKg-00089o-Mk; Fri, 11 Dec 2020 13:40:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzGHv/NbvSpuwf2OjSfARrG+Xb1GFHiJTMEPGKvfgSEMFdoMUPL9sQF+uJ+i2rm/wnsdlTmh6jKEs4PwhFIkOUasKt+9DUPAzagUnbvLLXUTMrOSZcDnZ3m/XsvYwVAt64RXJpwZ+KP8Qmi1mvvKKqMfpUpuQtNefwnkaQs+NyLrZbf+d0qJBOCqTnpn+eGDap8r6Z9Dib98KO+KNOttHSNRWwyiLNXo2vLnSYRhWPJfCmS1jhFGfQ2BG5tmLKk5L/rpfQyM4psucYsqOCvhgTii8At6ryyZ6Ez0DO/2hLAKV5/uPXy58PTlYkkyS5FQXHVzQZ7jneKFiMAp+wML/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmAeOA04vqFAyzZNmxOnYC8G07AXDfT0Ry230f2YoNU=;
 b=moF+VLrE3pTZPjy66WUbWjqtDmqWyREUh0si9HdcxdzLIcpk6sm5sAnktylJMZF1x1WHTwQ/7LRIkkB/2G4c0Ra/KLHqjobtPb6VZMtPece9ADRlPsObqI+e2sptuA6UN4LcLatGbDU+t47011ADi5a89uSbMPYriws+nPxx90YwizfbX0ukMYl93shvhzyBkEJVECB9KCYTJKP/yfw9SIVPk3d7q0vNregaw0unfaS6ozs1wcYQ/KCKyD2tsdfGuddUFnDanmpTwvjk06C4hIM4dVEz15QeDOAbZ9qkhL1Sg5e+6KO0pWJNhgmJW8CSYDgyd0Cs2pPZO5/2V+GfCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmAeOA04vqFAyzZNmxOnYC8G07AXDfT0Ry230f2YoNU=;
 b=DI4u4iVEIGQxtEILZTxIVDvyn2SNgGfdslVpLSRC7jjn0msnTa9xGTTBBwpOOZ3hF3f72GlVqW7wbatfLoi8xeN/cvQdEBGsNqIv12LLjT6WuzYPGvy40q4jxTwUHPdtVopap/tydvSQPTDSoGlmzZ9eYjwSoDhOWi1oXfRe/Uw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 02/16] util/iov: make qemu_iovec_init_extended() honest
Date: Fri, 11 Dec 2020 21:39:20 +0300
Message-Id: <20201211183934.169161-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201211183934.169161-1-vsementsov@virtuozzo.com>
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:208:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d63e1c9b-b548-4f17-0436-08d89e0423f4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4915AEDA2E8B81A48F5D7F3DC1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JpLc1VyJDfljAp5LXac/CLaZI3lNOuR3DMuOELN6mGnZQJCTykPL037KhvTfV/98j+S15KxPIFTvhS/RBSAs1n6xoj5ldtw0LCMrfIa0DPoUbwUVMg5wtxERvXKcRwjUopR6L03gqiMJpvyH43R4w8HTLsln2bEi6Y1hnVE0+yFXNVxHvVcam+F2tXdWRgseST7uEL+hM89r/q1uYB+F/4IQ4tSjNTDSAGgTztDz85fM4gLvzPcbbt1MJe0TskFt/99vGL70/sFV10uElnb6KVNI979FaU3cJk+RDdd9YKO0XYSmzQPW76EwfMOk+iGY+LBIFhCI903CCSg/WFG88WnP1aX/x0hlDE7ke6Br1+pf9/sU435irzAZ9rETFnND
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?K3rWXBivjUITgipC9bPUrBpc7FmUyJH2G80w3sAAiyHj4+NETnrB2WW4v9hC?=
 =?us-ascii?Q?aAqcCysUSbbr82CIZ7qd9fPqFcvQEZjHIQIAWN15pOLyfoqRNOTvkLe4zdQe?=
 =?us-ascii?Q?qCwO0CEwdJ7rrGvRyQvRPpHtrlWb3Sq1re0CtxCWt+CAkAipw8FHhoVG+BtQ?=
 =?us-ascii?Q?7Tkjfb+nKcuqBhnyBmseru/srk4paLyFdkai0cGhH1vWsyjMItObyZ85UdUp?=
 =?us-ascii?Q?uQBb0X489jISJTwdALtfybzQqTuURrDgJg655fniFSsIbArU00bPTfUQ+MYp?=
 =?us-ascii?Q?Rar8drTy5PInV4DqZdGyoedjuoS/XBRq/FjKLsNhFXj8CbPyoyMdqH2YUkaZ?=
 =?us-ascii?Q?T38VeONS1ffuo1FIPweVUvZHaeOadYPdaLwHNFD0iBcsOWbyFx7KY4QXUvIO?=
 =?us-ascii?Q?xhLMAUDxBVW/9mmmK+yexw+/XqUvvicwVxc8TDAr7vIynUofi8Or7nY0Ta7j?=
 =?us-ascii?Q?WDZVzuD4dz9xMR11pgF39Vug514q6x2/NH4V3UgmcHbY/l8vtFQI9CgvZPdB?=
 =?us-ascii?Q?IJzI5AND4OQ0EJVE4aQBJCyuwSemKS9y4OUEwa5OnegH5HK7/GVZC3tDabpf?=
 =?us-ascii?Q?fB5HzYDjJFcIWaU7+pLflAhyXx8vturvT4i6/G63TtS6iKIAIPVhvps8WoIV?=
 =?us-ascii?Q?cYcaAZrrmc1hZcpJxaXMllxO/7iHATgGiMhsI21UzXzkDxSPmcQjgkgVfXBK?=
 =?us-ascii?Q?YCHENklm0BS3wRWZR/pv0SyuBA7OnCLiDS/V3C6rIGZ808Zhdb7uLWmFaW9T?=
 =?us-ascii?Q?ohpDRWIcDr9EbQLy1YTTPWVlCevKFnMEJPDcMtLp6L1OT4dzZ+UWZIG2Lk8O?=
 =?us-ascii?Q?tzqUBAEiu3zqRvdwpGIw6JH/ZjFrDwxScH460aDl8kS1UIXZgbQkwqvMin4W?=
 =?us-ascii?Q?ecTAjIVbhYgAyF1W6hkjppf5Ir7zXkFgFB/n0LLC70BtZDntgPma958B6Khw?=
 =?us-ascii?Q?sUNYCUoSTIK8mtMrRfad6miq3Qhb4Il6kHgYuNIUgpGbBt9C3uWnBwfgjbbX?=
 =?us-ascii?Q?89za?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:49.1863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: d63e1c9b-b548-4f17-0436-08d89e0423f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4mf/dDil+97NKQ1CpW+/g3nTMolr0surUOia3n9w2dd/guRd2I6WqyZmCdT6p5if5I1O4TuRG/P6tqucM7xh/Tit0mTAMrLhOrcNE0397g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.7.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 berto@igalia.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Actually, we can't extend the io vector in all cases. Handle possible
MAX_IOV and size_t overflows.

For now add assertion to callers (actually they rely on success anyway)
and fix them in the following patch.

Add also some additional good assertions to qemu_iovec_init_slice()
while being here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/iov.h |  2 +-
 block/io.c         | 10 +++++++---
 util/iov.c         | 25 +++++++++++++++++++++++--
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/include/qemu/iov.h b/include/qemu/iov.h
index b6b283a5e5..9330746680 100644
--- a/include/qemu/iov.h
+++ b/include/qemu/iov.h
@@ -222,7 +222,7 @@ static inline void *qemu_iovec_buf(QEMUIOVector *qiov)
 
 void qemu_iovec_init(QEMUIOVector *qiov, int alloc_hint);
 void qemu_iovec_init_external(QEMUIOVector *qiov, struct iovec *iov, int niov);
-void qemu_iovec_init_extended(
+int qemu_iovec_init_extended(
         QEMUIOVector *qiov,
         void *head_buf, size_t head_len,
         QEMUIOVector *mid_qiov, size_t mid_offset, size_t mid_len,
diff --git a/block/io.c b/block/io.c
index e076236db2..21e8a50725 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1652,13 +1652,17 @@ static bool bdrv_pad_request(BlockDriverState *bs,
                              int64_t *offset, unsigned int *bytes,
                              BdrvRequestPadding *pad)
 {
+    int ret;
+
     if (!bdrv_init_padding(bs, *offset, *bytes, pad)) {
         return false;
     }
 
-    qemu_iovec_init_extended(&pad->local_qiov, pad->buf, pad->head,
-                             *qiov, *qiov_offset, *bytes,
-                             pad->buf + pad->buf_len - pad->tail, pad->tail);
+    ret = qemu_iovec_init_extended(&pad->local_qiov, pad->buf, pad->head,
+                                   *qiov, *qiov_offset, *bytes,
+                                   pad->buf + pad->buf_len - pad->tail,
+                                   pad->tail);
+    assert(ret == 0);
     *bytes += pad->head + pad->tail;
     *offset -= pad->head;
     *qiov = &pad->local_qiov;
diff --git a/util/iov.c b/util/iov.c
index f3a9e92a37..58c7b3eeee 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -415,7 +415,7 @@ int qemu_iovec_subvec_niov(QEMUIOVector *qiov, size_t offset, size_t len)
  * Compile new iovec, combining @head_buf buffer, sub-qiov of @mid_qiov,
  * and @tail_buf buffer into new qiov.
  */
-void qemu_iovec_init_extended(
+int qemu_iovec_init_extended(
         QEMUIOVector *qiov,
         void *head_buf, size_t head_len,
         QEMUIOVector *mid_qiov, size_t mid_offset, size_t mid_len,
@@ -425,12 +425,24 @@ void qemu_iovec_init_extended(
     int total_niov, mid_niov = 0;
     struct iovec *p, *mid_iov = NULL;
 
+    assert(mid_qiov->niov <= IOV_MAX);
+
+    if (SIZE_MAX - head_len < mid_len ||
+        SIZE_MAX - head_len - mid_len < tail_len)
+    {
+        return -EINVAL;
+    }
+
     if (mid_len) {
         mid_iov = qiov_slice(mid_qiov, mid_offset, mid_len,
                              &mid_head, &mid_tail, &mid_niov);
     }
 
     total_niov = !!head_len + mid_niov + !!tail_len;
+    if (total_niov > IOV_MAX) {
+        return -EINVAL;
+    }
+
     if (total_niov == 1) {
         qemu_iovec_init_buf(qiov, NULL, 0);
         p = &qiov->local_iov;
@@ -459,6 +471,8 @@ void qemu_iovec_init_extended(
         p->iov_base = tail_buf;
         p->iov_len = tail_len;
     }
+
+    return 0;
 }
 
 /*
@@ -492,7 +506,14 @@ bool qemu_iovec_is_zero(QEMUIOVector *qiov, size_t offset, size_t bytes)
 void qemu_iovec_init_slice(QEMUIOVector *qiov, QEMUIOVector *source,
                            size_t offset, size_t len)
 {
-    qemu_iovec_init_extended(qiov, NULL, 0, source, offset, len, NULL, 0);
+    int ret;
+
+    assert(source->size >= len);
+    assert(source->size - len >= offset);
+
+    /* We shrink the request, so we can't overflow neither size_t nor MAX_IOV */
+    ret = qemu_iovec_init_extended(qiov, NULL, 0, source, offset, len, NULL, 0);
+    assert(ret == 0);
 }
 
 void qemu_iovec_destroy(QEMUIOVector *qiov)
-- 
2.25.4



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F7A3FEC5B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:46:30 +0200 (CEST)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLkEo-0006Ar-0g
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLk7G-0004d6-RX; Thu, 02 Sep 2021 06:38:46 -0400
Received: from mail-eopbgr30115.outbound.protection.outlook.com
 ([40.107.3.115]:38273 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLk7E-0005xI-Vf; Thu, 02 Sep 2021 06:38:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXm1GC2PvhXRn95RdnrlkamT6pRHzLY/qv7KMvubCDHdvAwRo7exKjyESFy4W9Guif9KkXs1hwLiMwTAMc2lQGnEv4S/JJWSbn6Mw+dTmti8OycZyuMFQjvm21pX8IPzcB7BztQJT5WAonFWeobJ9mc6NDXYt0hsY9EAxytRRg+vqjegIrxgZt7LUCeluDqiZu04JX/PjxaUIp1RT92OoRz7m2iI6RRRSm4mvc/1P1kH1xYDX7JwM8geSoPZVWQ4/qP6dHafjONphx0A5eQosvXL7LXPgNRYoJPFFKGAmOpM7HxKBv+GORBO1z+q/w0MIvP/lW+H5N23miOaI0qTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=41fG26z6Y13c8eQ9Vjz254CYkrQZnvXTimV1p+MiFR0=;
 b=Z9yf2ryo6p9npF9NrS+3lfA8Cvj66HQMpW1JxvwTW8dGrJyQUZ6ZD7212px3ShGDdrJRFOXvmcUl1b8bNcpNY64PsEJpGYfRgpMVmcn0Zt5AZyLM8O58bLCYUXTr4wT/rYUIHnIkEbExg8xjoDMN5pv5se2Gk8Ta7WRnwmJ7JbI94Cr64mtBRbtPbKC4u8ywKOE11utsBqUmkLHO7Qhesrvh0O7RiOyTydb3+iYr46+meAkpWpPiFjrPREWxy/qIJFrUkHORCjQfwu7Lm/+iJ9BzPFaWLKJnED7aoP5oOsJedf6yt345tpnyqXsgOn3tQYA6XWd66fUHmzAyD4C3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41fG26z6Y13c8eQ9Vjz254CYkrQZnvXTimV1p+MiFR0=;
 b=Alz52g4IdG+fNXzocKRh1ClFjHVZ5x6+RUiBhZ/AAtCcB9rUWm0aV+IlgpEPdwlvHjPpesuG6rkU6Z1Ha4T5UYKgf2APFeW2Q4YNsrzVU/c/coDxy0F9GgJ0xIiUS8WczBcE7x14V03Po1DWml39GuwL5/zwFOVzCXCO0thz9Qs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4472.eurprd08.prod.outlook.com (2603:10a6:20b:bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 10:38:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 10:38:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rkagan@virtuozzo.com
Subject: [PATCH v6 5/5] block/nbd: check that received handle is valid
Date: Thu,  2 Sep 2021 13:38:05 +0300
Message-Id: <20210902103805.25686-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210902103805.25686-1-vsementsov@virtuozzo.com>
References: <20210902103805.25686-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0037.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR0402CA0037.eurprd04.prod.outlook.com (2603:10a6:7:7c::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 10:38:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab0e0faf-483c-4a6b-106d-08d96dfdcc84
X-MS-TrafficTypeDiagnostic: AM6PR08MB4472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44724038501487C2480B7C56C1CE9@AM6PR08MB4472.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8D27mNo8pYjPOQfmsoOMSAKcyJWhOEbW/tTFcGPgtmxd1HvxWMIT9XfbW3j9l6rcw7D4j7wU12daFxbbACBx+cgNZsRt303nxaoVvuo8DIfES+xgH4zc762OpIwCNEIeg8V5MRkgEsSWeScOKSdXJ8XxFsucIZVbB8AV8AOdV/rcLsWXvSCsyPE4UVnYzEUECbFK38Nk5lEbDO0JdzXLoy3tzMys67615rfB5oRIqum0T2OeJuHd9WZ0C15Eb3sNDt+SFvVraObgoW0fQbCfpFvRS5bLtb7ip7DTmxUjkVrcoEQHcORWUA57F1G4dcMq3mtCp0giKtBtjLh8XspJahLkqS8eUBfH3JyRf5cxK4XjIloumE1BZLamAUP0V9vXnLoPp77AIfdToqmHrTrKsr7Yfoq/G+frX/qSY9gWNN7XiipAZ1yZYZGddNAePnI1q+1xYL599VlY/rWW0oYPMkT3TdZba+N2J3BSd2Sd4LutcnHEJ9IvWEp9nTG+8DGH2RVp33tZPb3SC8Y+seyUB8X/wu4HmC4zFVds/0WqpRVSN/pOn3obd0eVEEGi/fDbk6qvpxoXll37vlbWMTSBTSsiSBTPshPK4qJTIDzCHCXyaH2lcfBA9SiqU+E0KSXWdf9cNlBF01gTfWgcr/7QaeQQ2FlD7CmVu5ykjtFqftcHXlwW8oVOP6gs32l+E0pkwu1RRJi1J3B8xh7RNgbXdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(66476007)(4326008)(26005)(6506007)(66946007)(6666004)(8936002)(1076003)(5660300002)(316002)(83380400001)(186003)(8676002)(6512007)(38100700002)(38350700002)(2906002)(107886003)(66556008)(36756003)(6916009)(52116002)(956004)(2616005)(86362001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OfGqQgWBShBc+z4jWnVaqF7gfaiyWSRWzOyWHj/cIb92lL+HZvC4heMDXJdN?=
 =?us-ascii?Q?kQwf5D0ClrOxhQv/4JxlWDC0kSIKa9UBjx0e3i2Oc3nXBFkv6l9qOP9/RLHx?=
 =?us-ascii?Q?qpAuBSsvzY7LeCSbXEyi5m2zmvKLr5PqmyDC2P/3IshXYBoZAFeEv8tzHGAC?=
 =?us-ascii?Q?ibPAv9U0s3z7aef0qBrmKpCc7kD/gnzWtQHwRX0UZ00apzsVojB47pR9XFJY?=
 =?us-ascii?Q?4QihlZgh9x2PsWxvfuSRC26Bbvyt9tiIazUxfER/NlIwbINva74HE7T4poW/?=
 =?us-ascii?Q?B8a3OdyvGSUoTB0220tWctZ+bD+abkvvpIVwgSMXduDLlRc+hCO6P9z2s/bf?=
 =?us-ascii?Q?74WplXC146NkFKcdA68gQqOtIf4A6o6qrzvRU4+MgxOyX8kOMJFwfbnkirqi?=
 =?us-ascii?Q?zxxRUXBeYuwtthmW1FpiAIrcYXaXEB7EiaNFioVb37osI2M8k/X8axcQkKR7?=
 =?us-ascii?Q?JyeG4uFBTxCJscANV6Lu42fGLgQj8QNAt6J4M9TqWozbMXG++DNzxN/q+q+i?=
 =?us-ascii?Q?IdO+sBPl7AcVjsQ+itTiPqkoG5yXsWWakxAxGfQoFI1BB/kio57tnne0Ypwr?=
 =?us-ascii?Q?w/736llZKPIuXjEUwC6TzJgL6QG0cW5w+kKPYxX1ekq4XCGZrGPUGSbCmX2y?=
 =?us-ascii?Q?zZXo0+uEZ4CtClBdPEWY/exjGLPwBSbhXlVUjcXJrMdgsVC4eUGl4pp4ZLA3?=
 =?us-ascii?Q?XKuJmZdfmqJr3gPj4Bg28ZBPaGKXRYnxNleSUqPqcOKptnkgdIGO1xoj1q+I?=
 =?us-ascii?Q?3t72S2gDQMNnJhnMY8gckbLs+fQlYbGMGx7QGveGWWiMYU2AQdrUYcC+ZLo7?=
 =?us-ascii?Q?Eul2jCTYGmeLvAzqYuP/OTqzqHoKJPQloBSjr/9Sba0kaSamPq5NDDljG6OX?=
 =?us-ascii?Q?wc2IftWH0cpOKSwonrJ5hN5Psue6w77QcUTcHs6nP4RU3QEmh7aW33jlRGLV?=
 =?us-ascii?Q?wrVCojP4HThQRrmcywgnEdpW0Akz7vYPGbrH8j+hbP6WwnEBGC4HZNr7RWm5?=
 =?us-ascii?Q?n9HcYUPLsQyUG8Qurl5zNc3wVe0av1DQ3QcMt2NY62vu/JMAJRFYCZS2FqxL?=
 =?us-ascii?Q?x3OqZwtn+35GZKouM9v1qbRlBdwOj/ld2eWxuKGprKYdterSgSY0OqZsXRy7?=
 =?us-ascii?Q?Z/hf71eMzwzT7Is3nHafiJ8vw8KLhFB3Oxu+hky/4A1afd4qQ4IHsOEj9BfD?=
 =?us-ascii?Q?d6QvDVaaAQSGOJylPxRw2Q/ZOvj8e1dKHyt334B81toBddDjLIW4Guv6BYD+?=
 =?us-ascii?Q?QZiFQy4YZWa6mvrEgaciuQtvea8EhzbYJgWoCQBc71JhhpVU5WLAP7EhEkMi?=
 =?us-ascii?Q?rnXZGA7s0EfL8prog7v+zeap?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0e0faf-483c-4a6b-106d-08d96dfdcc84
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:38:27.6270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJCE9AHc1XmY1CFiOiBEzb+fv/+fZtVFmF/Lg97JwoAQDknNwgOHRk5Q2ojlP6wa0CYxxaPTwuzQrNXmHAOcmULazSKP4/F0RmCg+9XYkHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4472
Received-SPF: pass client-ip=40.107.3.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

If we don't have active request, that waiting for this handle to be
received, we should report an error.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 170a8c8eeb..306b2de9f2 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -58,6 +58,7 @@ typedef struct {
     Coroutine *coroutine;
     uint64_t offset;        /* original offset of the request */
     bool receiving;         /* sleeping in the yield in nbd_receive_replies */
+    bool reply_possible;    /* reply header not yet received */
 } NBDClientRequest;
 
 typedef enum NBDClientState {
@@ -415,16 +416,11 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
             return 0;
         }
         ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
-        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].coroutine) {
-            /*
-             * We only check that ind2 request exists. But don't check is it now
-             * waiting for the reply header or not. We can't just check
-             * s->requests[ind2].receiving: ind2 request may wait in trying to
-             * lock receive_mutex. So that's a TODO.
-             */
+        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].reply_possible) {
             nbd_channel_error(s, -EINVAL);
             return -EINVAL;
         }
+        s->requests[ind2].reply_possible = false;
         nbd_recv_coroutine_wake_one(&s->requests[ind2]);
     }
 }
@@ -467,6 +463,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
     s->requests[i].coroutine = qemu_coroutine_self();
     s->requests[i].offset = request->from;
     s->requests[i].receiving = false;
+    s->requests[i].reply_possible = true;
 
     request->handle = INDEX_TO_HANDLE(s, i);
 
-- 
2.29.2



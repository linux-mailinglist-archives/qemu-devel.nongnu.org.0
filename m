Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437E9400C24
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:38:51 +0200 (CEST)
Received: from localhost ([::1]:37860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYgs-0000Td-Bp
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTl-0002yX-Dy; Sat, 04 Sep 2021 12:25:19 -0400
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:18546 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTj-0007GP-QG; Sat, 04 Sep 2021 12:25:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJHkxYeSPCABShQMrlpoSqkrC0FdbJtSvHjarYs5lC8gIgQ6ohLiB8bdhVLzXFJQA5duRF8QlQrL5Eof4r0Kk7ITCXNduzf2rBx39BPgdJEfTgGCTVEamDUgh+a3bWf6UEHMwQ13iHbdPqzCof0OWmCzMCV8LfmMQ/vJBWj8J1iAYufJzzxxMuOc7p+vE3/29XntVUbr2DDXCCUiNOAI56P50yXbXvtoBdzXvnZFBNnU0jkO6o68dJ71Z5OIcMjDOqFmQB7EW6vk/wu6QSoNQk2D+BixQoXFTBPIAcISAhqZuguAuN/L0W9U6rq5hoAo9wOknyJOOOr2ja9oIcHdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=BQIqyLQHn7c8zKqpQ8Z3De+R/cykjR0/AQ7Zv4NG0/0=;
 b=jFKUo8oL83McIw7eIAZoz1vL82YnJYraUEu+ZkcykPdm2CicfaiLJBNC8MLhyMLjn7WRAdOyAE676i52gOhnIYnZQC7yN9AKTjyx/oFepJG3fUU65d6c9wRxxVwXK16G1JgnrIoFcib9CC7NVdGdD5BwB1ZO1tocrFKJVzKElSEmjT0JHrKu+mlYQHRAMsW7zN0JL8QzU8hc3hWa47/p/RUPPpKYUShAzy/QQON97Ms304PAGd8HuXbbMa7ERR9DYVesy/SWJyPpv8WYzBUAIlHCaGNBg4NkKJQvjeuYSQaFpQSusb/Y1Imstx5u4ab0CJg7StmBc3KaXTy+acsCaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQIqyLQHn7c8zKqpQ8Z3De+R/cykjR0/AQ7Zv4NG0/0=;
 b=itb1+2FZGoCoQtxbwbkseBrTwEOj8jN/vVtNC1YGKOPuCU7nsKPC2Hauy29NBD4wpVLR76slGfhS0LuvHuXy8pNOGaJxCRRo50IvCDWd83yMk/QOplb89Aqy2kzgvW5JnyyaP+gUga2sUJDdOrVqBCCdInILzrlkrtLmIcn4LXY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sat, 4 Sep
 2021 16:25:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.024; Sat, 4 Sep 2021
 16:25:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v7 10/11] block/reqlist: implement reqlist_mark_req_invalid()
Date: Sat,  4 Sep 2021 19:24:27 +0300
Message-Id: <20210904162428.222008-11-vsementsov@virtuozzo.com>
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
 15.20.4478.17 via Frontend Transport; Sat, 4 Sep 2021 16:25:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 852aa6e4-2aef-4dbb-2012-08d96fc08d3f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6904C2DFAFE2691B95A7E25EC1D09@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sQQjyr1W4Cl4gACG4IKbwzZ0zKYmonSFa5zzLNz+/deBlN+VJ38Yg5rSZct/i2i/TutMgaRPgf5Uvo48mxNKhXaSp2KwaRF3UD1wLBLwbWv1y2awluJpxrGdWkcxJYLyQfopt+MPYrsL+qBIA60PqgGgS8pVTpNmBsBMvE7/xnGzIyU8bROz8yMrewsOMEOIvaj3xNvCl3lbtNXbkqrtR/g9e5WnQqAliHVJLPoOw8QHXu2WBU2HWVoJortmc4x3eEC1naul5YLyB6HQ3VdwNOshAXJsGRLfdm788UHGqc39tsHvaKxUgrb8R9p4y5KsoR5Ok4v394u+sn2jYD3VCPAdv3VK2hslzAP98PODSUyCidPYP1/9AUkE7CtO+1RdM7MORdOJ0oAKvZkYzOHGObqpQl1BE/BAR1suM1GwdCZ9O0S+/BRSw2SaBa79Wzk9/Lvb+swZpEFFGnjcWZhiE98uYId9mpHiqebEBaedjVC48/QdC/3Fpeaytb5HaZHLoyU8F+zLtCXBvzEx5mH7RLnkGEF4jQBfEVtPElom+/tzfY5AELD0Pxt8MOr576BrX4ekhK1SuIL9kx1+rqf0LlB7IpxRgx65zi9SL9Ud2NsVSFL/2zwhFvxRzcunXuj8AQlLEBg0fM12Szs1DaVCbbEob7zlocPjJ0NMN/OckPfQ1dhirSvywV83yMLO1Ivo7Hc85VruAYI0tc4b/vk5Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(6486002)(66946007)(8936002)(52116002)(6666004)(83380400001)(478600001)(4326008)(38350700002)(186003)(38100700002)(5660300002)(2906002)(1076003)(8676002)(6506007)(86362001)(6916009)(6512007)(66556008)(36756003)(26005)(2616005)(956004)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WxnqpQt5fwqlATgqh9tiElh3AGee903LbGw0jhAodRmf6LGmxlQ+hXcJpkD2?=
 =?us-ascii?Q?9RZG6LgWCKmyXCNn0dAi4wKQ/1eLCfsKEsjMnkyF9vJWFyXWvOguRJD58d/W?=
 =?us-ascii?Q?0CCYE90qN7pl8ntUUKX6kRz4D01pVLSkzbZKMcf1amKi002tcjWjbzyv3HYH?=
 =?us-ascii?Q?B9ZjV8qLcv70AxI+pxol3Rx+GC+M5ZIEJbf1Cky06eN02Gkdvx8pW3b6JIGM?=
 =?us-ascii?Q?P6q/1kIIjEW1QkNFfpBFG18uAEikjdEYDIaWUji1L3TXyxio817V9I/kXCwF?=
 =?us-ascii?Q?e52bxhd6fmvq30DSkIQ0QCxp6cj06fklJ7B1wIfDCHHueh39GnQ93sCGA4qq?=
 =?us-ascii?Q?L4EfJJqveIyhQusXbBeLJyPj3EYaTlwNJeSsS++a0IDX24SNdCOBp9x6SlQe?=
 =?us-ascii?Q?JFbpM0ftLRUTuCe96kwa7tUgo6j5ISOeKtvUfCupAs5DD4Fb7ffGgk2qSixR?=
 =?us-ascii?Q?JCEPCIrc65nPqGtF0yTtMJme6EEvVVxOP2blfjlHa1lQGBxxC1+S+NhPEePX?=
 =?us-ascii?Q?hE5bRJRMrjPn8Lls5N7084AX4dQ5VweG+etr4KfFEIlX8DwuTCS+vlvBme/u?=
 =?us-ascii?Q?ddEsaSmFK0YQrfrutLPqnmjchagg8W914yKhhPlJ8Ny6PNunvWM/RVs5eNs4?=
 =?us-ascii?Q?3w/1LRdXuiujJmA06HlOOM5FeMify6BL+PTUCShNfuvq4zHR+k+ftIEqMe1n?=
 =?us-ascii?Q?LYm5zQh001M7/NEnamqSzWX0MpelIHz60OVxwVz87r+DRwX1u3aMJMQxsqaQ?=
 =?us-ascii?Q?N5LO6QwAs0byZN6+KWm81H4y/ZSv/2VJjmvSzc+V05Lk3sibsZjXRUvg3Vgn?=
 =?us-ascii?Q?cNubWHwiP1CM9yigb07E6xuTf1v+xtPhf749raYsn8HIaltzpj4Y2pBU7wfX?=
 =?us-ascii?Q?FP61w0YODGZ3st6NF+KPPi4Zwjfl1n/+WxlxgZfkOq3PjdW6pIBoj/ckrbuE?=
 =?us-ascii?Q?OaBGHxrY4Nw8ou+Ec7SWfIEK4odE2Y09vWWMqQRk4It2qdXU14aq/Vnx90QV?=
 =?us-ascii?Q?ck7Jyr5RHvKx9xoIlSzS11ODK1E3mfa4VzkcOz1mA8jCtoT6fT46tLeqUnxl?=
 =?us-ascii?Q?ex2Pdhgb5Y+MFwvcBpOjUKHBjdtGkzANbG5/8+OG6S4Uk803yawLJcnnl18P?=
 =?us-ascii?Q?LksKrDJ0vQ8Wa6aCmPupdfWEyATjf5hWC34yOgzkEn1RS1faMb5Lq7Vaq6jj?=
 =?us-ascii?Q?gsDxrvQuLjZnUIL1eF131q8qo4ROcOLBveBQwTlFBrLMahGj/ECvLGh5FFlJ?=
 =?us-ascii?Q?ni176mcUdKY9deCpK+g2OEUXeF5EnkZlQu0LNRpixqF/bssN72JI/M/KFCbZ?=
 =?us-ascii?Q?Isebf/jFOuUFUKSMqc5gSO3y?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852aa6e4-2aef-4dbb-2012-08d96fc08d3f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 16:25:04.5954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VN+JYkdnU841Q+bp6pJXL+GM9EwZGZNiUQ3jauerJ+JkIIe4IUphd+eU8+eMfMMjm5kJLmwAROlxIUrsF/T+dKmwalfKD+fsGfuyZh0845c=
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

We do lock qcow2 s->lock only to remove request from the reqlist.
That's quite inefficient. Let's implement atomic operation to avoid
extra critical section.

So new interface is:

1. Instead of reqlist_free_req() user may call atomic
   reqlist_mark_req_invalid().

2. At some moment under mutex user calls reqlist_free_invalid_reqs() to
   free RAM.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/reqlist.h | 13 +++++++++++++
 block/reqlist.c         | 23 ++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/include/block/reqlist.h b/include/block/reqlist.h
index 32dc87666f..24d6d93a6e 100644
--- a/include/block/reqlist.h
+++ b/include/block/reqlist.h
@@ -26,6 +26,7 @@
 typedef struct BlockReq {
     int64_t offset;
     int64_t bytes;
+    bool valid;
 
     CoQueue wait_queue; /* coroutines blocked on this req */
     QLIST_ENTRY(BlockReq) list;
@@ -84,4 +85,16 @@ static inline void reqlist_free_req(BlockReq *req)
     }
 }
 
+/*
+ * Invalid request will be ignored when searching for conflicts.
+ * The function modifies .valid atomically and intended for use when we
+ * want to avoid using mutex.
+ * If you use this function don't forget to also call
+ * reqlist_free_invalid_reqs() sometimes, so that list doesn't grow endlessly.
+ */
+void reqlist_mark_req_invalid(BlockReq *req);
+
+/* Remove all invalid requests to free RAM space */
+void reqlist_free_invalid_reqs(BlockReqList *reqs);
+
 #endif /* REQLIST_H */
diff --git a/block/reqlist.c b/block/reqlist.c
index c580752db7..641307d80d 100644
--- a/block/reqlist.c
+++ b/block/reqlist.c
@@ -14,6 +14,8 @@
 
 #include "qemu/osdep.h"
 
+#include "qemu/atomic.h"
+
 #include "block/reqlist.h"
 
 void reqlist_init_req(BlockReqList *reqs, BlockReq *req, int64_t offset,
@@ -22,6 +24,7 @@ void reqlist_init_req(BlockReqList *reqs, BlockReq *req, int64_t offset,
     *req = (BlockReq) {
         .offset = offset,
         .bytes = bytes,
+        .valid = true,
     };
     qemu_co_queue_init(&req->wait_queue);
     QLIST_INSERT_HEAD(reqs, req, list);
@@ -33,7 +36,9 @@ BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
     BlockReq *r;
 
     QLIST_FOREACH(r, reqs, list) {
-        if (offset + bytes > r->offset && offset < r->offset + r->bytes) {
+        if (r->valid &&
+            offset + bytes > r->offset && offset < r->offset + r->bytes)
+        {
             return r;
         }
     }
@@ -72,3 +77,19 @@ void coroutine_fn reqlist_remove_req(BlockReq *req)
     QLIST_REMOVE(req, list);
     qemu_co_queue_restart_all(&req->wait_queue);
 }
+
+void reqlist_mark_req_invalid(BlockReq *req)
+{
+    qatomic_set(&req->valid, false);
+}
+
+void reqlist_free_invalid_reqs(BlockReqList *reqs)
+{
+    BlockReq *r, *next;
+
+    QLIST_FOREACH_SAFE(r, reqs, list, next) {
+        if (!r->valid) {
+            reqlist_free_req(r);
+        }
+    }
+}
-- 
2.29.2



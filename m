Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2226240ADC6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:34:51 +0200 (CEST)
Received: from localhost ([::1]:55176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7eE-0004St-6R
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VI-0001zi-OW; Tue, 14 Sep 2021 08:25:36 -0400
Received: from mail-eopbgr50116.outbound.protection.outlook.com
 ([40.107.5.116]:58241 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VH-00065R-0p; Tue, 14 Sep 2021 08:25:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhIhXTZSBgPcQrgVA9/jOmMjU9quh5B52KjEk1RMbSgcO37Ag0jWKKBeNAsHgAatHscFcJeT9NVdHlR3P4kuQAexkjmdxZqm3ZlZJiPCmh7NoLdTVdk3X0omnGiLoxhor6fAcxj44CNydXlVXl9aDliWMyuDWef9rVjaFmUT1aIL10WdAg6v9Ppz32YibZqmerwT99CsfihnB9k9kNNKriFDrqfay7n9qPrPtLeCzQH1Bad3490GW1Gql/ATl7dIdODLfa8aPo/Kbiiu5aN/jN/jaL6xB+paBf+Js568MrgMwGhMtyNjg9mgNd8uLGTmdz9r3vfAnO85K1wxbO1yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=C0q4bVkTdma+8RnVvD/WZadTsoKuSpYIff+f08Msc6w=;
 b=Uff/JQPB9NRgUax/A6jLuAKx+dzTnuPWlHLhmHyDxtfo4qMKkChQ4k36LlfluTweD8r4B9/O0VN+lvBSpDmBHfwmjGk3lj7PduZUm3SbUUZx3qe2tEprXC2/YTyqlDOAmZLTO64tNOGW05kb/GuD50eXwF26n4fVY0HzdTh2WnCwiUsN+qYrc5/zpsFE55QDuOK8jfeFWO9Lhk280dBOeyjBWgDyOUTyBZk6wSpYw6MJdCJmKvYLKX3Py4laGEE2w3gDfl89LzWOlapYHKTjVIiG6pdI8vPwxpVUqNqAuQ15mUip+a9mUxExnQBYC9MiaByAIR15STb9c3cWORb15g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0q4bVkTdma+8RnVvD/WZadTsoKuSpYIff+f08Msc6w=;
 b=wER/RY5LE/ardRlmdZbK6RkJXvV6p8LwKlImIvqFXm96drGURwT2oBz0jZsWVyGY3ESys8xw/0dbT8af2Q0qR7Ro0NgcHBYD/X3oT3qkalo+AWBVJoLsPFC+rAj0Sg5dDXDIVSFKzFYwM2N0R+mOPYU89YZpmf+GBOIB9gZnP1A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3158.eurprd08.prod.outlook.com (2603:10a6:209:44::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 12:25:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:25:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v4 07/10] qcow2-refcount: check_refcounts_l2(): check reserved
 bits
Date: Tue, 14 Sep 2021 15:24:51 +0300
Message-Id: <20210914122454.141075-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914122454.141075-1-vsementsov@virtuozzo.com>
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:25:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70f9d469-291d-4d2a-e9ee-08d9777abae2
X-MS-TrafficTypeDiagnostic: AM6PR08MB3158:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB31589C75F5EEBA88C5D6C143C1DA9@AM6PR08MB3158.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BlmeTCQGUdrhgk/Qh9VPAorOnAjYgoR3g/sFD420gxB/6Tcro3bwpQScc+rI5nMSOUuXKv9FTSw1E/tB3YtVx0RYMyIiqaqOr/sKW0ir69ec/9SmQNbl3zRm/Uzykz4TSxsx5pflsJzIQZOKqNpPNDvQ+c+RsFnn2D24FFxDgkn9qMgPAc9jGruW1pEfDI6WcDY17F9vMGlYtif4waIPWjzHGYGna6yZuD4yRZdl+YdQL5mxUNhNXeUJL9pySZbm9QSrpt01sy1vORaY4lHMHMMTuTEd/nTukyyMFzNymJgeQcRyI2yjxiLxizGp6f+QIyyX2qQVq6iq/ZQg/EDB5/mOZ2OtOFC3wED78I+ozElfUuJQsZQJH0L5grky2mC+3C3BbrMtBDnZznyeq7pyZuQXnUZ758SqBMjb6C/GhwKhsxegLQ4YMQMk6KJ0FkZI3pk5IJPaPgLYAzE52JjwTWSIqdbpTj4MHTxp+TirsHoNumF8xDSgwH1rso+NPJ9AMdKjM3jCn1cEnQzz7e1/Mk/WBsx3wou6XUi5Jmv4pkLs3ZeMWFfm4kkFNM0OhFsczBcOrlr4s0/44DIWvZJs/ordlbZ1NnGcVyhyKLrTcy8sBtu95reJR+PZRZKMYnvvUlwmNEmuPaJDIR93T9gzJdeCfHk6Qmp8LDrNwFaQSdPmfyQye8OOoiyJRhY5XDFM10c1zTgUM5BEFHYNTJsuRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39850400004)(366004)(26005)(186003)(6506007)(478600001)(36756003)(38100700002)(38350700002)(19627235002)(86362001)(8936002)(1076003)(2616005)(316002)(4326008)(6512007)(107886003)(83380400001)(6486002)(2906002)(956004)(6666004)(66476007)(52116002)(66556008)(8676002)(6916009)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q9EGmDYaJEfi6pKBIDvKMk/4brkZHpEFJJCp0T9nEcHvTeYpZIqpYXJkZlZ9?=
 =?us-ascii?Q?UMvW4quGq/7Wfz5kGMXFkTTiDXhmfe2yQmyH83gAMdOAsdXwPRHA4sgSFJdr?=
 =?us-ascii?Q?eO54qzquktZPNI15M5C6vw7E+GMBL9BkI8f0fJ6f1sHIZ1g54NJkMu9ScwwQ?=
 =?us-ascii?Q?W5H+20j3CnFNojdJq5debwazAEqmQ/BOFoonXuITrO/jX+tS4GEjKnmutRUX?=
 =?us-ascii?Q?MotEppRFaRLB8xR3etjji/dRr++UUhVvId4OAsICrbWJM2cT1am/lhxEm/e9?=
 =?us-ascii?Q?cBieaD3s8cVvpGUDYU9rnBMZyL0L2s7Dx1q59D6jlFFpB4vUwPhCe/k4jSXe?=
 =?us-ascii?Q?ikje7RW+MVTkswnPvsKofGrpokAo73BvYL2eeFAfFEhseQyDQqXuwFw44oot?=
 =?us-ascii?Q?uGtFZ94EpL9VnhMYZPGQFxvF9VvdbtuXDByJyM7aWkFpOHjyPThdC+u265WK?=
 =?us-ascii?Q?2Pr+p4BEUtzGA6W3EcE2mPV3a4SlU5zwesZqbLLJWJ/CB9rCvLfjO3HTN3+P?=
 =?us-ascii?Q?X3v1DKCUdl7mSjUSElzHAAhsLuup2UXslwpTRt7hc8ndvN5jC9yVm6jsf3u9?=
 =?us-ascii?Q?vCaX+l2LDP464gIGtkxMvvE5VPBgN7a6o+W3tU3Qs8J/7E1t6zvu/KiaLySA?=
 =?us-ascii?Q?/vtnWEhw3etrTT4x0mgsdjgsRFd4PeAH8HT8KMAS9PoVjmbstoFDzSd0FSjs?=
 =?us-ascii?Q?1WLU+DZt3irrYRsi1y2fSBHs6KWEzqp2k6/U4+eqVDTlSi7kbQuE6kO0I1S6?=
 =?us-ascii?Q?gxUhIyVrc71AZsQ7Qf5jTpB+NkSKK0kiyAadi99VLvVdOJAX8DsEAja5S0uE?=
 =?us-ascii?Q?EZnExASCO66mLTOnZk2IHcwTDI3296piiuzPfsdOpItF7OiDgyhBPIJ8DGCJ?=
 =?us-ascii?Q?ImcAvOkElJ5x/dIKfysdpdpEr+tqYFDanSsw1tlHvnaoqLag5LDzGD+6BYER?=
 =?us-ascii?Q?4NiyvHSDxYQTqbyrJ0/P0WQWyYZ/uIfoqS6BYy+aE3E5S2bXK1lF/tBE5ec+?=
 =?us-ascii?Q?Y7WtnZh9uus8b22b0rAsUmeAsthF6VqroGrLj/BSp4+VPcw9kEiWiMsiOcJw?=
 =?us-ascii?Q?XmFQb/afe8nr7lpQu9vfaV0kF89ZQveYo9qlquEwsG13CkWyzTq7AKLbX4cW?=
 =?us-ascii?Q?YEwi5FUCqQPa1tQlVr11uLOC+JnFqikB+icWBOwPcHqBdGN8dt3LKEWaoOdf?=
 =?us-ascii?Q?oubLspEAe6TJ427pbXxr0eclaAL3VQ32T6dr3QgU61EwTJDZukutlsPwKa01?=
 =?us-ascii?Q?jhGNDddvOSUSs7PiY+rf+uKMGjOzZlyroQsHo8wxUNoUGnx97ApjnPRPkUBt?=
 =?us-ascii?Q?a8i2supiSlNzlvVbq0CviGFV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f9d469-291d-4d2a-e9ee-08d9777abae2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:25:25.6447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1q9G496M72jiJYI6iLYLXqBeFpgex7zMppmTbAGWqJeSBA13FgiYYdXUbjv3hhg6D1pEdB/xd8UrdQa7Q8azsBblQFdXa83LWmY4dthEYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3158
Received-SPF: pass client-ip=40.107.5.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2.h          |  1 +
 block/qcow2-refcount.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index c0e1e83796..b8b1093b61 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -587,6 +587,7 @@ typedef enum QCow2MetadataOverlap {
 
 #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
 #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
+#define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
 
 #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 9a5ae3cac4..5d57e677bc 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1682,8 +1682,18 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         int csize;
         l2_entry = get_l2_entry(s, l2_table, i);
         l2_bitmap = get_l2_bitmap(s, l2_table, i);
+        QCow2ClusterType type = qcow2_get_cluster_type(bs, l2_entry);
 
-        switch (qcow2_get_cluster_type(bs, l2_entry)) {
+        if (type != QCOW2_CLUSTER_COMPRESSED) {
+            /* Check reserved bits of Standard Cluster Descriptor */
+            if (l2_entry & L2E_STD_RESERVED_MASK) {
+                fprintf(stderr, "ERROR found l2 entry with reserved bits set: "
+                        "%" PRIx64 "\n", l2_entry);
+                res->corruptions++;
+            }
+        }
+
+        switch (type) {
         case QCOW2_CLUSTER_COMPRESSED:
             /* Compressed clusters don't have QCOW_OFLAG_COPIED */
             if (l2_entry & QCOW_OFLAG_COPIED) {
-- 
2.29.2



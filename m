Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FC23E01E0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:24:57 +0200 (CEST)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGtE-0000yJ-B1
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmu-0002Ot-Sm; Wed, 04 Aug 2021 09:18:25 -0400
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122]:6733 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmr-0005TW-UA; Wed, 04 Aug 2021 09:18:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huOaABF/ALhXFSe7hou8SNha+WmkKEjqC+NGKQaHVbFGfKTOZaD+z/11NDfNFg/zKixlqG5moQ86OanKV9krx/teBjkZpcuuxoFxrJ/W7olRj8tRcSibpV6GjkI7Dp89RLemyg6EYxTK54D/UEbGY9G/bcVrLlq5p7U5oknvxhn9t0jeT321KI/FiLaRmrXTlpz5N+m+Vb1OrTkTHb+TRtDZOPBhlZNutEUEMU7ME/br04LpGOOPv5AqYa+r310Hs2IXbgdVnHEyqZpGTb7jQc3pbGk6QxGAAl/y0ZC6GM4EO1Vp/hfaD0ncMFvrwGTS6tPhhRLcpwRpxWOo9K6wcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULgZ+m3YI8Jwh+muF0D3jer2aRxqAT5hmZvlqSPO+yQ=;
 b=V3o4Od0VuRPykgmDSZ0zTgPJ/VrgvQWmibTUdEw9xeg47nRqC2jqEl8gwKU85VLLXQXzOeqQ6n7hXgS8JHapeQPpv2og1Cgx3xxFG98rq+l8A2cG++Rh4+LW3oPJVfuvdoJQqEGng0Gb6kcOlyZJToIHmGad9o1Vz7GMVfn4ouPi+YMMrBFnMyXdoBnWyB9jDnvcv66aY8Vmoz9ohiNxMflPfcVdbFl0p5b/2yQbHfgUyy+JDSsvEQFnpf9yNaR1QjFntvVH6Hfp9D2bNh56nNxI/Vmtf+GluE09Xymxn2QBMKHnfg/jdS0RSIkl65sFipZ8oubXpPrI9lxKvLnItg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULgZ+m3YI8Jwh+muF0D3jer2aRxqAT5hmZvlqSPO+yQ=;
 b=repWR37zqbR6xjEVR6NoXQH2CGwQWFQhoAgaqtL2sYYPxki5O8p1NOKoUB5BUq//rYWg8LVBMOC4xjlKiTHNF60o847u+hQjxHySMSZ89y9/LXW/KW1o2ZMD/19g1vRMH3wRhFxar4yG90SYUFb9TrkpaeL/bCnFl6V2Evd6xlM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 13:18:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 13:18:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, kwolf@redhat.com
Subject: [PATCH 10/11] block/copy-before-write: add cbw_snapshot_discard()
Date: Wed,  4 Aug 2021 16:17:49 +0300
Message-Id: <20210804131750.127574-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804131750.127574-1-vsementsov@virtuozzo.com>
References: <20210804131750.127574-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 13:18:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93a375a3-d08a-4f2c-fa21-08d9574a50e9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6216C6E4A3F1FE97F4D00AD4C1F19@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WxqBDg6KMb7D1Fgx/2rn/tufxTo10LK1XLug0z5sblxCTjfx5aXHOGBOWEsZE6O06G+VmBLm0ZAq5FTxqsqwJChY7KO4P4FDMVsxhXy9p4TXvYz6ba5+Xt3pXiKahQyb/H3E5uiG6ZXKYqSRwhT/EBNkFhe+GSxqqzG7yrk3DSN3isJ6xDFok3fvMoQWkwGQ/CJW4HYfHkLO4AkUWjD37o5m1wG5Nyd3MDVCZMoisUf6MZhsVCxsqbUIId3dICCh+362wiRA8TXU4YHZ68K/+GFlsoTDGbRWxGCoAtZLxN15Zlc8GcRkeiBo+8jyZirkVW/LQmNqEwnUdUNuGQCUQ46odsDPM7oyxefv8z/wCzItsG5bT+4f+jVThkFRwU/2TLIAlzAyhPcbRa1aYq8pKv2RMKqvckbquh0TRORiK/KWN6wD1iOjC8Mrf92pQ90f+hxRVzIcciEFgXYFWbejus6j/iWR5ODDCmVUo3rAMtBL0XVx9ZUB/b0MNmx/RkX3EHCs6EP8OP2ZX2y2/myvQTVkvKwjJIwOBahmWM05SA0TL/RWDiMsRtsHRRyD0/81ifpBGpiljDJa2N2v/XvxIhbnXb/kqRbNQlauJYpXG5G1P/P84NGzDunqzSYz8rKWuc/jijPOM2KQceG5D/GandehYeX6zpgjVs6QOpQHCmCo+jg0JtCZy4xGPJcXOZcQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39830400003)(396003)(136003)(478600001)(1076003)(8936002)(6666004)(36756003)(66476007)(86362001)(316002)(4326008)(6916009)(6512007)(52116002)(2906002)(38100700002)(5660300002)(186003)(26005)(38350700002)(2616005)(956004)(66556008)(6486002)(6506007)(83380400001)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/nawtxjwIw4uJrYsqnhl5LbwmEtZzKTIAKn2aq7EqNI5jneo9DPXnd0YrMjH?=
 =?us-ascii?Q?jm1z1UYlAkfE/bQwrpaTliOx+elCB5RkFc0PMpnZvaJESNzAedzLr6z0AWE6?=
 =?us-ascii?Q?eyUldtbfIbO9GUY08ENeZ35GCXxzVrkiP+3vaLdEfExzctH8lLwHulh0+ymJ?=
 =?us-ascii?Q?9wxwF9uCZr39lv+qZsv1Hm1Mm0xrkeqfiU+vH62sMIEBfJx1LOJsnUqto8Kj?=
 =?us-ascii?Q?licUW01DHJQWV1JcMPlLWWemTJyAqWDHBBmtQH7YDysSrMuE7fdLs+HnQBGp?=
 =?us-ascii?Q?xDtpaRdxH2N7iJDA7FAB35A/niFncNKkOfmdKVjshWE6Yn58jBGdIdMri8Fd?=
 =?us-ascii?Q?bR5YquIByDfRWN4uRgm8MsT1YlyY06yMWn/imgiAyc7uRgc/Ho+E1pdEqUtr?=
 =?us-ascii?Q?GSH0Pgw96Au4CWojPcusuyK2AmRKcg36NbQs58GpU8An1buMAri03yR8BHAX?=
 =?us-ascii?Q?JwE3JUnSX7YQ/0VNJ3Mdn4n1q+j+oybH/K9PeQIYQBmjD2LRfNIb1HdFRLCN?=
 =?us-ascii?Q?Z976/TSr4IpCTsRpHX6J9Fzuq6M3AMZlZe27UCEHjT+RKaULrcA3bYIItStx?=
 =?us-ascii?Q?8tQbEtKu7AxBA9kU+sRnuxCkW0ZDo1XepoJMHiVvcnxO0PT5gNDJyWE3sQyQ?=
 =?us-ascii?Q?v/o4E1NTGzqgw2CMc3cwsb0KshAnWlrGMLwLBixRmdxhNznguOUyBp9VHxth?=
 =?us-ascii?Q?TU/ELEzRSEKiXFuHXI5h7xOKEBIme5+aFUNX3eTVCyjKUgIw8LSw1o4NGad0?=
 =?us-ascii?Q?oOvsMPYKk408kLETJycTlxf0ge6zsW2SJY1IB63fkYjavmsbYQnPAzdeLFvl?=
 =?us-ascii?Q?YQwcrSqwFbbOifmZ1QsJoMB+Z9RJbOXciCHt14ZxifYwi1p2tKOjwkaV+1If?=
 =?us-ascii?Q?j4aIzHoTlOLtUtAbGEU9FfDL5QMq2CCtm9lATEx4n9VZLJfoweKvbcwpFbAG?=
 =?us-ascii?Q?/efQ84aeqg5EPIiKRQmd3mcAo9vpvy5o8hJrrKHxtkxn+YOGhFcXTi+DKewn?=
 =?us-ascii?Q?++jenLLxR77tZ9o6eK/mGVTqzJxdez3xl0KTHZEkf9ujETXNIEac3Y+VK2ma?=
 =?us-ascii?Q?RFg+DUObEIA4r47czwwa5bLnEPByL0xyrJ9f2LVYAw1W/1+iW9DKjZFXaZOr?=
 =?us-ascii?Q?sJC43Ae3R4+p3hbyFjVzMYyAfM8e1jRko7GPRo2rbIkQ05aUQClz0q4p/x9I?=
 =?us-ascii?Q?ppAs/bUE1c5p8QhE5w+Ii+dSoiPVEy3e/JpYnrfWGJCZ+wJUc67jlbf88q/H?=
 =?us-ascii?Q?3fhU4Vz8O/tFBBCHWz2Ytfrj/fPYIzySkrHphQsbvwsOmfTZjv6EDYh2Ghsd?=
 =?us-ascii?Q?TyhwFLDBbBGMNWc4Ux7Y+OQj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a375a3-d08a-4f2c-fa21-08d9574a50e9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:18:14.8036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VHiV/m9zWMDcG9kIPLa+GKzPv50fq/vuZKC6jDvfzbpaWp0j3wvrn6bpBmPiznMKbCaHfDC1DGEfGvpPFXn+o20nLOe4qy+/6yVTvUQgN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.6.122;
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

To be used soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h |  1 +
 block/copy-before-write.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index a7e286620c..5809ffc7d0 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -40,5 +40,6 @@ void bdrv_cbw_drop(BlockDriverState *bs);
 int cbw_snapshot_read_lock(BlockDriverState *bs, int64_t offset,
                            int64_t bytes, const BlockReq **req, int64_t *pnum);
 void cbw_snapshot_read_unlock(BlockDriverState *bs, const BlockReq *req);
+void cbw_snapshot_discard(BlockDriverState *bs, int64_t offset, int64_t bytes);
 
 #endif /* COPY_BEFORE_WRITE_H */
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a96131358e..a9fc8e34e9 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -103,6 +103,17 @@ void cbw_snapshot_read_unlock(BlockDriverState *bs, const BlockReq *req)
     drop_read_req(s, (BlockReq *)req);
 }
 
+void cbw_snapshot_discard(BlockDriverState *bs, int64_t offset, int64_t bytes)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        bdrv_reset_dirty_bitmap(s->access_bitmap, offset, bytes);
+    }
+
+    block_copy_reset(s->bcs, offset, bytes);
+}
+
 static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
-- 
2.29.2



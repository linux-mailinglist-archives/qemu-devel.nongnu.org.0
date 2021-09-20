Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BDF4113DD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 13:58:56 +0200 (CEST)
Received: from localhost ([::1]:49976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSHwl-0002aX-PN
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 07:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHu8-0007RS-J9; Mon, 20 Sep 2021 07:56:12 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:7297 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHu7-0005GK-0g; Mon, 20 Sep 2021 07:56:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aP34MzCX6ICAigns2LSDjO28hTGCSEgV7ql8AwAWWdcbfA7s/0byumMHolKlHsRwL/TsbYPmijnCaGLh3GURwVqULyix/MMNjegpp1bYsnN1w7mdKfYo6fIXRbwt2wgKyPdNPj7FCghUXgwkNXCw8IyM+0UxgpTEEUrqvRUeYzGzKe5pMjbqmCpFPWNvj1BuoKtfKxCNMYtL8w5DAMG1lf/QjlyxtqJzpM9sMlcbp6S2Z5dlR3A4KdyeSjRYl6CO4Q6R82qgiDSpC/PdXnsTTavT1nlq+Qhe7xI2fv6vvmFQSDR+M8GJwNdNPnn9CCOyShPydKxkQ/MKqoyfBqg/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9zAA1LaVO/PEC5GghPw4KcgTkjyxfm/nMzVS9qb9meI=;
 b=RD+/MYoDVlCWIpQYeykqq6kZarKT74yEH/tXOZxisTz3QG39zK5uqOIjVqc7HEN12eNVpK3N/pNRC/b6X93ICFKg9MUgPVNkfusNhX8Ezm7a5csdOndmkzYqfeiLShbSQfdNibIzphBhH7zbVoVQ8h+/DL80jtrE8BKhjy2K2saMg7yIPsbVyOhR6FyFpspcxHg/2eVTdLwMVg8MPFaPQK6Bbl9nfHjoCqrNJvXszSkF38kSA5vntDqcGHIMXU5ZFRNX+PnE7khiMEf3ecYNJXsDTkLEFmruH3/gjwH0xZ98Tuy4sk4R6moy2UcV/W9NYyx5z3JvuE+aUTYg8KNRCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zAA1LaVO/PEC5GghPw4KcgTkjyxfm/nMzVS9qb9meI=;
 b=pMei9Ct/41uYBb6V9KkXW0GQQUVQtfRbjCa/+j29fSme7rIx6BYNgJ2nufBBEPX13Qa5eAcQmk2JvLQ7ToYVtKH3Z8TF2JAFGa9v46R1WiSQ8IokIAHrcNdvVBJXtAYXE6EqWHnFGV7RoKDg/EdhkaK6lzzly/Hv/qJOcEga+CM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 11:55:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 11:55:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 2/5] block: bdrv_insert_node(): fix and improve error handling
Date: Mon, 20 Sep 2021 14:55:35 +0300
Message-Id: <20210920115538.264372-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210920115538.264372-1-vsementsov@virtuozzo.com>
References: <20210920115538.264372-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR09CA0082.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR09CA0082.eurprd09.prod.outlook.com (2603:10a6:7:3d::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 11:55:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c295cf1e-530b-4fe9-5c8e-08d97c2d9b8c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB66312D16CBDC544A260B6F03C1A09@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +xjmOrBtwVzm8FOXCPPmOdynTXTi+dwMj/u58rujjGcESgX1dnL/SKk8mFCiSipBo4K/5GrgqFgn4YxPYYFrUSQZaPIDK7K57bQzFzctZ9AZsJ9JcPmP5uL1b0oIw2ATNw60K8F1YgoDtFUSgDHDVYfQxt367yVmj2xKKwW8qQI/R4GpxBnY5i1Agj3rMuP5ofW1VvYNy+8vLdC1dJI4bRbjE3yxlmt0FIjK93Y3thzH+uHcisOv01y5PtOLxtwsgtGBFqC3p4VChF9wUD3kG8QFEgw01wBVzfU1kIKuHSUqzm0u83TLIQ58gVFf+PWt+5sT0Q8YIyg9GZ+Th1wrjBCiKq4pn0NFWNm1Bipu1z9S2gKFMpzFbdYd0xtB7MhNHj+Z1Bv/TYsfktNn0B0ubeYsIMflKkGqkElpMEQijnG6JOU33ITIjtCG9ryTzstIww39L83EcjotvT58K+UK/7XLVmBt6kPO42HHG1AWqLudl+bWQof6AGLdB3pWzAaranTe11pVl2Uyu7magV1i31ILZDkIdoKBtbepkJEqL/7LExLQ4hsxl1wdYwrgkL91qREhVNrvATzCKqYvI2BTLaZEeciivHt7VwiQ3pJoErH5vz8N8KJem6em838gtcY2YW0NAeLESdtI+lfeBg7Aq7vjvsqRA6LF5m+epEBa4nqN28zqvcQ3FiaqYdhVR0aMpWnHvCVHx3YMircmpmKalQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(346002)(366004)(2616005)(956004)(66476007)(478600001)(66946007)(4326008)(83380400001)(66556008)(36756003)(107886003)(8676002)(8936002)(6506007)(316002)(6666004)(5660300002)(2906002)(52116002)(1076003)(38100700002)(86362001)(186003)(38350700002)(6486002)(6916009)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wr7B8q8a2FpP+OQWotmV710qoUDIIn6JD7Z02dWlRGhI2k0gjUftuH9IYgXw?=
 =?us-ascii?Q?e8O/UdQcsRRvHmgtwnIpHfG/GU3vYK3hTLv18dYy4kYpAW9z1lEEdKsnXmys?=
 =?us-ascii?Q?xvBvOJcWBGxoDiKokexZU19GR/58cHI+W32p0n8Ha+YeNof0qbp0Mo589ORY?=
 =?us-ascii?Q?CY6cmWOaNIX4UvE3sdD99IgamVX1kpvToE/36Y3k9Zuz5bDVcaNj6GL8BVdW?=
 =?us-ascii?Q?DWTB829HdNN5g9dm44ppC2Rp588UnWfIBEGiuRa8nB+fqww00oqD/L7Iq1iu?=
 =?us-ascii?Q?UOzdqUnCnpH9BC1LnKDtFZwn7nUhQibabgrKkeYw/w020l2nGJwTkR+m1B+L?=
 =?us-ascii?Q?eW4IyOwqzkjQtGG2D8IiszpyARDJvLsheWR+e6hbeg0v48MNapCQ+Rb3nQqx?=
 =?us-ascii?Q?ylNyei+HFZZ1muW309IK1Qgn3UpoJ3zfEGqomFD210iu5W3CO3qmgubq3Nmo?=
 =?us-ascii?Q?qlK0uq9o7AC8jwTLOENU1cQVDjTGE3hQfbxMCqyg7E24RxDXnK35b6DOTOEJ?=
 =?us-ascii?Q?my7k44KM+9Qv5nc+b12/ritG/wVKEHRtg/6IaF9ZjXTS+CLRf3pDDUJHIxc3?=
 =?us-ascii?Q?qbgPrasxAo6fQniUkcnzZR2Fhz2/emw3UTeNveBgS5Uv2lcS7idBefR5Hqml?=
 =?us-ascii?Q?6SVvJNH+GzTSI/78kJR/nxGC5/9a+YH7dIX9q7Z5cnYvE4l9yde6teYQ0hdx?=
 =?us-ascii?Q?kwt7/9zepjbL7KNpKpRFxRmTWH/vzki6im9wM5NEtD098pYJTPEFb/AnbwPA?=
 =?us-ascii?Q?gLXbX0ATT4mo93DTabUj4nY1V0Wcd5tm8GCqKZbYA++xPeZE2XL1xNopMFTz?=
 =?us-ascii?Q?WNhMhDz42MbNx0fMHdKknCu6X014yF9R24t2WsWp/5O5tKU36AQIi16aYSEX?=
 =?us-ascii?Q?LJ5O9odJTXpCne6YGjsa/vLUhfcQnyCn0ZAKsK3/Mz/0yZVCudnhboWEBTC8?=
 =?us-ascii?Q?rKc1kAua+1oDwr1AHNVrdqkWsqfxJQrRUpxhHzzXXeGeiWlSM1Uzt3+Uij6J?=
 =?us-ascii?Q?ShJ8r7nXPO23MN1+vKjWC+LlDvq7nhrHeGKI75CAKLZ9W8L1L0X1w++uaPJ7?=
 =?us-ascii?Q?PfqrTFNP7JYi6VhSHltGVee99ecTMAZXf/6FWjwuAUpH4XqUfSWxoOG/0xta?=
 =?us-ascii?Q?KBg0/JNADWaPs85Mk83FkEJeNUxHvtTfcX8crn1vZVwG+uQ2lmu+xahSp0jR?=
 =?us-ascii?Q?9wR5TXu6t3iU4uew/6h1z+JT3tVt7uYAttBLyzPlNcpZkSvNrsh2NmG/ajEU?=
 =?us-ascii?Q?hWITIt/8eYAyMB136nL+7VTxPGEqjL6wzC5wr1oTC83GwddYE6qBFB68fjPA?=
 =?us-ascii?Q?ntNdAB4AbHDU46MMZdZxxcDR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c295cf1e-530b-4fe9-5c8e-08d97c2d9b8c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 11:55:57.6034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCreAa5HC5iD+lnE/W3SRLs2aLFOgbZjeo9yHMykjVWhzCU4yY9ttIPNMxp8t3lUJO1xssckzPhaDI/PxYRKLc8RdZXXA35vF8G1VGQSJcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.22.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

 - use ERRP_GUARD(): function calls error_prepend(), so it must use
   ERRP_GUARD(), otherwise error_prepend() would not be called when
   passed errp is error_fatal

 - drop error propagation, handle return code instead

 - for symmetry, do error_prepend() for the second failure

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 917fb7faca..5d49188073 100644
--- a/block.c
+++ b/block.c
@@ -5122,8 +5122,9 @@ static void bdrv_delete(BlockDriverState *bs)
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp)
 {
+    ERRP_GUARD();
+    int ret;
     BlockDriverState *new_node_bs;
-    Error *local_err = NULL;
 
     new_node_bs = bdrv_open(NULL, NULL, node_options, flags, errp);
     if (new_node_bs == NULL) {
@@ -5132,12 +5133,12 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
     }
 
     bdrv_drained_begin(bs);
-    bdrv_replace_node(bs, new_node_bs, &local_err);
+    ret = bdrv_replace_node(bs, new_node_bs, errp);
     bdrv_drained_end(bs);
 
-    if (local_err) {
+    if (ret < 0) {
+        error_prepend(errp, "Could not replace node: ");
         bdrv_unref(new_node_bs);
-        error_propagate(errp, local_err);
         return NULL;
     }
 
-- 
2.29.2



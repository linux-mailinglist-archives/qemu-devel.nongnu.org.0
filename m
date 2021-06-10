Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F37B3A2A33
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:30:30 +0200 (CEST)
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrItJ-0007jE-Dk
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpk-00033Z-9f; Thu, 10 Jun 2021 07:26:48 -0400
Received: from mail-am6eur05on2103.outbound.protection.outlook.com
 ([40.107.22.103]:32352 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpi-0004Na-Cy; Thu, 10 Jun 2021 07:26:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmZl9dOGpfELexTalVwmOuYds0o3A9FH0nkjSfUqJoDVBtRPYfFOAwgfEiiMJhpxHgyUzxtKGUSKxD9EKThtecJTMeggNSmS2BMorOv3iUFieU4XdnUez69ar0filrOxOszeTdfkGYfdH6swxLbA4gjeq+c2dPZwlTrqDcNShHCTao9TVKRSgZGPn9qVuFZqqxJL4mBEpzNt/dxnHpoGhbNNwxcahqNT6wUdZIF+Ijklr4l/wTLIOab5yNi1jwpw+TFgxlu1f8qSa2lSwi/shfwp4tJKAJWecefmYesRMjJPS905OIr5jm4cEjfhBqF6/0ctcMvPDttVG8L1vlgQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZL1atromED1QE5mDCQjohgPAZ8+7OhQsQ9fiQ1H2O0=;
 b=YWCwxmzQX1MF7I/oRybgXlj9MhgQl7oEKb4FVTs6HXar/wgQZtR0bHvZKTXPmYcLZhZhKTpz1wNEyIgsdURFuHv4BDW7GPlzIi1HI+Ef00y2zdgiGlxAx2ZZ+s2mAZHoJb10G6umiN0WqQss9wripKNvlmOq2FwrKGf7y1dp7dVxMjBrbcjxbkwcOImDe8JkdCV3ePQF6qh1iizTlQZ4x6m0aC+znXM0teVqHvfgq05UZwZZV4Sf7Hf/a3OOKBTSVt9ZWwNy9s+dnIIG/+lEsJpsfqGqSgwUaAQdyW2v+9UMO7rmYWHv86mjdmFpR1DWDIJd89wtjFsoUiV1BOqWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZL1atromED1QE5mDCQjohgPAZ8+7OhQsQ9fiQ1H2O0=;
 b=kORiInxTbGOpSIK7sfP+HwO/wCzpGlp2z/ZU4MhhRC/HJLYn1n9JNTYJgaBXs6J6R0oTuespp1qNUfBA9lDFvP9bzzOCDBfF70prd1WboG/aaT5QbwmCygbOPMRlsAZKqU70Q779RLokPJhOEpDL+DKVDIOSmUGCQRF8+qjcVyc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3960.eurprd08.prod.outlook.com (2603:10a6:20b:ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 11:26:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 03/35] block: introduce bdrv_replace_child_bs()
Date: Thu, 10 Jun 2021 14:25:46 +0300
Message-Id: <20210610112618.127378-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 044f6f50-26f8-4f57-66bb-08d92c029bfe
X-MS-TrafficTypeDiagnostic: AM6PR08MB3960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB39601C441714072A61BE546BC1359@AM6PR08MB3960.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQf8aE+aaxJWkuaeZjdxzWhgk+KfBRFGNiQKohRzKdJSABxYbsKtDIMBkMYKMaXhTLsnxLOXaJ6nuxCoAszSApKBxHO7N+tPlAsw0uBIU4/CPjCXYHtUGwECpLD3I6Q8ian8Z2FPo+aA2YHvMJyFV7bXuZTuBkSTS9WOaBnIcn7I9mXz67R0NI/ZMoG1rsAlL7cnK9VunkP9mPqp94oFwe4UD264r3lgXRjDJfdG/+1DoljYoAN33H5C6DZz0x9OWqvcHb8LQtPK9wFMhLxi54NFDVtAtfmAr/to6eCNXN+PbxQWpGuaMbMFAk+1+pDYRYrKi4yrCkmyDLGudgBPdSRUREQZyeYhAd8OcJzWmKJdRR54QDIq6Ro7ss8q9yaANM+nLat5uDU1p5eCi3TCax4BnsAb37XTGh/rSYNOmU8CmCkh5aR2J2UCgJvUsYQ5A1hyytR8Q9BFjlZ+GvtHzGQJBrJMhmDPLjQ7ttE1InBTXC0kPjesTRSzjvckGWnIQALset+JpgsEz161uyDm6EAij++zjupNHxtxKbGvSluGOqGB9wO6rLw05o4hiseBLTbRVaCF48SvqsgA7IImxZckM41MdwaBhicu8NdeJMRnQEqG8NJfZE42HBmtKn1LMqAqvON31IecthlqvaA8eAFx2Tguq0Zt6ImRUkMuUUXc2twwsV+TWxkovdydyxzr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(2906002)(8936002)(2616005)(86362001)(316002)(478600001)(6486002)(16526019)(4326008)(36756003)(8676002)(66556008)(66946007)(66476007)(83380400001)(38100700002)(52116002)(38350700002)(6666004)(26005)(1076003)(956004)(6916009)(6512007)(186003)(6506007)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ixSH6Ndf+XQE4H4QslYfHzVK9qUsnDiBkkgDUpU+gstOIR0y9d8BY0Xsx5kO?=
 =?us-ascii?Q?3NkJNkcxzDh7rUIySCWUqZNYNLgX91ojnfuNvEjhjGh42elo9GywZYOLPvcd?=
 =?us-ascii?Q?ynBffNglA4uftxashb7Gk8/ynbAwd/G/ems2ASI5N5dGyhtjwPQybf02xvMM?=
 =?us-ascii?Q?KnY8zhc+Gr2QYiznZGw+HLLLRcscuZWs/HQoR5+iHCS2SYoR45c1Yb5AkPrW?=
 =?us-ascii?Q?uP8fYyIVZwMraS97Ka/3c9v2Hcjn5OEGqEtuxj9dh2Gz8a8K+ywHpXYVRxHe?=
 =?us-ascii?Q?S2e8tc/RI8iio9XtaZr/Rh/5niJMtsu2ejiY9c3RWNwB3sGlOt8Kr471pl1X?=
 =?us-ascii?Q?/xUbXUV8vHXJU9t9c1oHh0e9pMelgKqJgC5X8bYGzvVoZDK5RfRsYJZapNWu?=
 =?us-ascii?Q?oBugS1QL4DuOoo95ewVrOxPqF7s1JbgRfqg/qOWO2JfI5Uwczlbb5X7UWk+f?=
 =?us-ascii?Q?6dLNHi9r2nHXa0FGWZNQ1L8sy6sktiAAo+MlVDwGb+G2GlOPp2S1ylsgu4zr?=
 =?us-ascii?Q?wsM7acQDq7fbsUAitGGN15GH3xioUQP/bKEmhf+SRvuZ4Rm23Lpv4QDlr2CE?=
 =?us-ascii?Q?bMgtgCl8pq+Ssr4OtTJQwwDQ8Vwqz9Q7SwfUtEhjKkbzB/Ikr88phYtR/xnu?=
 =?us-ascii?Q?JKxYI89owaCPYB/lGeN3GR+DFxlRG5x9KTuvEZfl2weunrNAKw1EYC9xsDb3?=
 =?us-ascii?Q?1wwHuGJNfQz2q/avQjC4bG9NrlZCm3xS5t6OsfeHHUeuXCv0hgJa/T8vbfEh?=
 =?us-ascii?Q?kBIgsxGJdssPqdYCa4MgfXrA0xmXR9FqxhgdiRD3Kf2IC1V8exp7bni1Dvww?=
 =?us-ascii?Q?c4O0atNxbtJdr/VpXjjlRGYMmFbD/orFcUQEK58xX5XfUMe3zVyupiTGayn8?=
 =?us-ascii?Q?zTEfXUaTsZm0N/bkoit9uZYJTQALUkTEpxzsMkdsWo0THbuuBRKwpjtoWBPs?=
 =?us-ascii?Q?6Xpe8D/H4aVwSVb39Fh8nfeEYW6D+zfH/Sf7rxxIHY3jyGmlum8PvQoaKZ2f?=
 =?us-ascii?Q?9NC78qVn6WroiakT2jKttjArSNNljxciTOLtyhOey9cj5oEd8ihhkKnauMBv?=
 =?us-ascii?Q?E59Apnc03RU+pzCLpsJXKhltHaigm8UZZAWHuZyylc2wwDp2H+eGNRiw/gQS?=
 =?us-ascii?Q?q4yso1j/pCFGN3jo0OcRynWFzw8CIUUwOIvXomnSPIGB5DTpDpf55wgpZ2Rj?=
 =?us-ascii?Q?X+/SaavIKtvsElU0Vldkfk/MOGdEweN9D0T6SwKDMjXyKNf0qMEiltbdHZ10?=
 =?us-ascii?Q?JspaKfWC9KpINZgAGHakCQEC1V4fOl/QS/mimgKrAlFHvy0Gd4NBlCxnycHp?=
 =?us-ascii?Q?OI2KInpknNd3KcD0csUdnzRL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 044f6f50-26f8-4f57-66bb-08d92c029bfe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:36.9757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTHkiucHrVYgREZIz8R9HcI0rRHTM8hRtKonEP0aSw+h6v26AxUDSO54B2I0io9aLJxjbdN0YJFfhtpoK1qkvlGFbrFa+Iueyg/SejLPpRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3960
Received-SPF: pass client-ip=40.107.22.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add function to transactionally replace bs inside BdrvChild.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block.h |  2 ++
 block.c               | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 8e707a83b7..3a16ca341d 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -361,6 +361,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp);
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
+int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
+                          Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
 int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
diff --git a/block.c b/block.c
index 98673e788a..b6658381e3 100644
--- a/block.c
+++ b/block.c
@@ -4987,6 +4987,37 @@ out:
     return ret;
 }
 
+/* Not for empty child */
+int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
+                          Error **errp)
+{
+    int ret;
+    Transaction *tran = tran_new();
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
+    BlockDriverState *old_bs = child->bs;
+
+    bdrv_ref(old_bs);
+    bdrv_drained_begin(old_bs);
+    bdrv_drained_begin(new_bs);
+
+    bdrv_replace_child_tran(child, new_bs, tran);
+
+    found = g_hash_table_new(NULL, NULL);
+    refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
+    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
+
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
+
+    tran_finalize(tran, ret);
+
+    bdrv_drained_end(old_bs);
+    bdrv_drained_end(new_bs);
+    bdrv_unref(old_bs);
+
+    return ret;
+}
+
 static void bdrv_delete(BlockDriverState *bs)
 {
     assert(bdrv_op_blocker_is_empty(bs));
-- 
2.29.2



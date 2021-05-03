Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19571371478
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:47:13 +0200 (CEST)
Received: from localhost ([::1]:55836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldX2e-0002ZX-74
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqN-0008Sd-PO; Mon, 03 May 2021 07:34:31 -0400
Received: from mail-db8eur05on2096.outbound.protection.outlook.com
 ([40.107.20.96]:36951 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqL-000054-TJ; Mon, 03 May 2021 07:34:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdWtT1Y6CguRgJ5bqUZ5VWfiB1E0MfyMnauQ1THqyt1n7n7XGY/HTK9o5Dhu+J9uwZZcxI5RFXecGImcSD2DrJPQg1vSxhqQPh6aYDWc3fJ7+OuCQrxU1wciTEf/DSYWAMoKNjA2RVLZ0h90AicjMtLLWHgRoRElubdXIcIEBPfFyBC8EtWkGvh6xZbiSTCvcx3DGSFekg8sLy43tJ/eKmKXkKBr9lCbi90H/3pTvVXeBYN4iY1wmcVkkXvaxCUkaoqIfuFWt0Ls2VJB+PJg4NlDvNx42JvMi1w8uSFnvi7FfaXIKEfZNdpu3c+AN8M8gu4YNEYIZ0JY9sdod0dZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QK9vVa+K8cAS1MJK6V2WdLwD4F30KMQ2bmnDznMSRVQ=;
 b=Ov5qyvm9unvCxDCPIvwL3NaacjxV/nkfedJuPsrVp8G+oSXiyHJOeDttLSkFgvv9l04NWLlipf3k/7imcpBAZtSbJXGvEsxpMjnVxfVgvCenIcN8wj8jpI0iD9nJ18egCjwLOs2iQuqUN8ExFxG2JhAd8zpcrpy9wDuhs+n6hj9z2OhTgMnzhGyRtnoC/BhZyF9A1uEiisVtxkSVa0DQb5yd7yfjeG2q65AOlUy3DjcJUFkdw8oVuu1uvHGzWBwr4hN3G1JhQB87qqhvXiHnRJTrMA0RqUEhzeUFdopCTOGorIuH75Gu+7uuDkaYM4yRT5NbN+63JC/Fvt8WAbIieA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QK9vVa+K8cAS1MJK6V2WdLwD4F30KMQ2bmnDznMSRVQ=;
 b=QDCkhAwjP4NhVOEZk1ypVRDPGxXizRsjgHSfkVwErKUj55kXfrRWTKtSnQdxPx0bcoxfVzjfCyaCb85Amgb1Ey6/5K46kYCTlU6RQQx+06nrR5dK61VUFqWxVmsHdWG2DwytQy9yxcw9WsDWJP+fRlZF/uO/wnY+J3qciiE2cRo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Mon, 3 May
 2021 11:34:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 11:34:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 4/6] block: improve bdrv_child_get_parent_desc()
Date: Mon,  3 May 2021 14:34:00 +0300
Message-Id: <20210503113402.185852-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210503113402.185852-1-vsementsov@virtuozzo.com>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR05CA0255.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR05CA0255.eurprd05.prod.outlook.com (2603:10a6:3:fb::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 11:34:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47014a6d-f3e0-40a3-a3ee-08d90e276415
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1713FBF1AA89918679EAC1E9C15B9@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j71cRbjD91aauYt55tXZYXJG1PxEJOBhnaIdZ4/ughFGHPx7dKHSwQ/A0SklstXevDLG/ybNSkRPP4dUgwelkHi0ppteMtpkeiLT9fFLWSRchtx4U0UxYZL39MHighcruTwO8S7NDE9r8Z2xD7/uwldY9Lk0ITQQMedRy/oFX35nd+cMciRAM4zEXFilIb6Kl16v8vuy6FWxrzPBfwkmO05vXh700odww3iXMtak61Tu2SsxfWlNE7DnFgJVatnaUHdKGPqFi5Ofeejb2Trh1yBjUIeuXMP5Bas6yYuCklHYAzQybp/3PWfyUpffYfnLDMefTy13Gi2PnlkKvSPtGWbt99toeHcnVuG6Gd8VPvuTxdsyKKptL0eVu/P9KbeI4IH2uIrg4sHclPaG2DF+0Mq+xmsU6j24+D6bNl9EC9sBNwWigCrsliJJMp7I47QcF9A3NLAphwg/vfIcovLmntmnjEn2MhCXdFoa5x46bPtEVMIPCcp/ewwcxDKpJAjijRph24jruAia2QXPYqq0e3yjeV1cmveuCYcGIxxK/S9tffRZZp9i0bhtTSVcI8a3NQnYwe/YsYL7ErmbhyymGrUjRupyPjBqQwDDrqhv1XY+jUPf2bk+EcDNwPHQVYxWW3n9xVv8Iy6m3Wy13vCaGljvHfXbT7cA7Y5fWbtd0WVjUSuz8AN+mO9lNGKI2Xpk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39830400003)(346002)(396003)(107886003)(5660300002)(6506007)(956004)(1076003)(2616005)(6916009)(6512007)(52116002)(4326008)(16526019)(2906002)(186003)(36756003)(38100700002)(83380400001)(66556008)(66946007)(66476007)(86362001)(6486002)(8676002)(8936002)(478600001)(26005)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?o76XH44xRtnQWIh3A+FLpbB+0l+NcjF5VD7IBQvuOMxUieOOHHFad6q+qHHr?=
 =?us-ascii?Q?AaTHUji76QS9zWtVTNtksqrcSPSqWQJLFimYeI3hyOa3+vUgKIB825wmsyvA?=
 =?us-ascii?Q?iKl+Qi3xPcx3YQ5yBXwpmcvOlhS7/kcjJ9TurgMTpeGxtD0S0OLwCuxTN6Yi?=
 =?us-ascii?Q?wB0oTmR/VTAF0JyxhWrnlWgBGEvX/JNUT2ATo1W0icICMw0W6Ya8LQz3HE4N?=
 =?us-ascii?Q?IR3HKDptXaUbGsyk3BdEKgMdXkROit9M1EUViE2FHrJ8F0RlbVhqA11CGfmA?=
 =?us-ascii?Q?A/7k7PGcH+DqhHrQ9emGHCp5MTZtnF11A8gpZ1DAcZtuGUsjjOfxu/8PVdnD?=
 =?us-ascii?Q?ncY+5dgT+oOCx0vTDQKXlqfvACdacGI+T1wyzqNu+fnY9Znj78xpiz2vIaTy?=
 =?us-ascii?Q?R1DaDOZzUMoUsSeYrP+UmWlgL3ii1EYelwQLcaJSzWPI+srMkRoWUrdR3UL3?=
 =?us-ascii?Q?mLtwna76AXMUxF+9gEGBH5hMMcisIhwYUMj1QSD/7ly6sTezxKyIJOBAZxKo?=
 =?us-ascii?Q?68ABF/zKph5eAQogN6a1LuQNXSC5aLSFH4T9Jm+ZcSpNa2+qhu++tFa8hy6i?=
 =?us-ascii?Q?CQw/wR3YYWcYGs65c4EDpHUdYcXKxJUU5m4rK0bzhHSD/EA5LNnOt7lkAutS?=
 =?us-ascii?Q?dWwVE6SxR0FS1EADdHWzhx+rgxleE6KBjwTcU/9sjio3HcuHozzLpHCg6y7s?=
 =?us-ascii?Q?JXso+T/rExsOX48qdDa2eoC/zhgl8RaqUBZIkg+A5S2Ur1/v5ywsRsPYjJLu?=
 =?us-ascii?Q?eklyQPuq4NSot/e31yQSM5n/Gjd1yJV0fUgkFDKK716Ey1Y1zIfK30L2ToEC?=
 =?us-ascii?Q?3ZzrOt5t/NZyCbfIxhMMGkBqDSXv4/pAAb/eD2AFirrD3pwV2WvccMMczbgU?=
 =?us-ascii?Q?FsHIT9seA9ZOjE3FeDLMvq0wdd3RYoNt1uKhXd3PO8TmP1LpklcRPSQBibdG?=
 =?us-ascii?Q?0sKq2eMl+17qQY5T+YMuYoGMYIvYiBuJXNiEpTm3a5b4EF60sRiV8TTEG10H?=
 =?us-ascii?Q?d69Ywzge27TiJT/dBP7wO8c9fFbRTJ05/wIUjYbPqevgE/flkXRrvPA6+3AF?=
 =?us-ascii?Q?BqlxxpG8A9FCxGlftmPdUoNZ+r5HfmKDHBXJI5Lx7v0ekEoOUuqUQJPu0KjG?=
 =?us-ascii?Q?WhceBHxrZ6zzlOsWvPpbWQ/a8/WsxQaChC/Vxu31GdQtecz+xrBxqGXrTgJI?=
 =?us-ascii?Q?em0RjWdN9gbmW/44+KnZePWKJeGmmbqiB+yANzuEDPQWbYPz/f1sm4GXc2/D?=
 =?us-ascii?Q?Lx5rEDShUdIw23GeoHWsMHjfUovbXOR2uXdjPxYC84nCTWhd2cM62Ad2A5by?=
 =?us-ascii?Q?y7QxXBcAZXam9TTBddwlhLM7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47014a6d-f3e0-40a3-a3ee-08d90e276415
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:34:19.6643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vW/Hesgaapa//IUrMwoBDBV4V71ZHiXDm4T7bDj6gTnAAaIDrBLemjR9jjz1n0p1PfNl9pkbSUnkGxHdDLQ2lSpw4XqSz9w30+sE4BiE0R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.20.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We have different types of parents: block nodes, block backends and
jobs. So, it makes sense to specify type together with name.

iotest 283 output is updated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                    | 2 +-
 tests/qemu-iotests/283.out | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index c4023ab4f4..1de2365843 100644
--- a/block.c
+++ b/block.c
@@ -1160,7 +1160,7 @@ int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough)
 static char *bdrv_child_get_parent_desc(BdrvChild *c)
 {
     BlockDriverState *parent = c->opaque;
-    return g_strdup(bdrv_get_device_or_node_name(parent));
+    return g_strdup_printf("node '%s'", bdrv_get_node_name(parent));
 }
 
 static void bdrv_child_cb_drained_begin(BdrvChild *child)
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index 97e62a4c94..c9397bfc44 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by node 'source' as 'image', which does not allow 'write' on base"}}
 
 === backup-top should be gone after job-finalize ===
 
-- 
2.29.2



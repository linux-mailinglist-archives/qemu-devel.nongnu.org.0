Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8F44C6B56
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:53:30 +0100 (CET)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOean-0003AA-Pt
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:53:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNo-0002KV-44; Mon, 28 Feb 2022 06:40:04 -0500
Received: from [2a01:111:f400:fe02::721] (port=57446
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNm-0002MY-CY; Mon, 28 Feb 2022 06:40:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heJzbB+mRSGAkiaPTvwCF1zL+VBqABwzy7E0euZ4KQia8196TAe3E7ntvbR6VoYtEVWq9HiDTMmsddnulPedqRKe2bh7VoYnIPqyB1qdm8dxqK5NgXedrX9GL/qiq4l1uADhHtAnPAw6AUHFslx4o7Ug3s/PWtAqHQGjSXduGVqWNec7YyKDXEVDuZqv3Ip5ZZ9i6JCwDGfEoKJ02t5QQPX3kYWd/hzDAnol/+caA294orgaFlmY79wWjwY7nlXdT3Lj+VE9cIXmIhMletI5kgLNBN9KzJB4qUmcBzQu7wBlNpOGFesgfIxTvniSE6PbH4/j2mRbCsto4Hp+U9PGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwtkRFZsupCHj5xg46xDbUv6v3iJOt4sHv5qvsVGsLU=;
 b=JtdGXZTZCA55Otqpi8aIcXhU/xj7DtABBHugWYHl43pjc3NtOR/2LgwNfbnnOs8LIxL2+cp1SyctW85fCDGHXazDDA6wnLKnpU0Xo+gFE4Ecicdjnou1ft8gBm6ajCu7/i3kOUEbwLJ/remqRpRjKHDAAdtB2eyKrjvNJgxNg+0uFCSQJdAeHCslUx6B/WcjMUBqIBHK9J5jN6T+UPcp4sJPXDl4R/HBgZILPP3Zx4GNgBaG3Ailh1JN/269HyKHezuPDnvcEBIi3EouAl2NcXsVOY7tCLBUxSqz1OKtu2kncFT+isrPJobtiDy7Cj2X+3Gz/Apu74J6nIHgskQIIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwtkRFZsupCHj5xg46xDbUv6v3iJOt4sHv5qvsVGsLU=;
 b=dfB2NrXrQMq5sxRFK5vMIa/QoUrGGAMWa2FLBn4H2ysIgqV/wgbVqXW2XUz+I/FDEe+9LPkSG1zcODwbXeFV+Ltyjjb2QP7XJWVKHkzinvi0rLcJwxJ+wQ/l82HdWSgHogA+Srhdhple+ZPa7p76angDCSMgbbSAl/o3UaT1IdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:53 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 09/16] block/reqlist: add reqlist_wait_all()
Date: Mon, 28 Feb 2022 12:39:20 +0100
Message-Id: <20220228113927.1852146-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93d713d5-79f8-4cd1-a40e-08d9faaf08e4
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB22725BEBF4362A8CB2BF0C7CC1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0iAdgcytaN99XSRbfnCSz9hE+hLvH39FDUomewL9dh9rOfxbg+as/K7NXwzFwh8p8DE7F0H5BxkdZT3cOfpZmwCg2MpwX0PT05nDqHX4WyPcpvUsHlvOi3IHyI7ucRrI0SXUoa/c6xmrUTKiR5KAlfFiHV0Rx3MGXs3bTSyfns+Qaz9wG1iFDMYX8byei13wMX3/NdkR8OAvrglvD4DZfLNwvmZUUpKtYHFJX4iZXIyWLHLCn4yTfisUsOJOJsRTtZRJLrd8jb1I907k+6TWo48vWMBcipjXG2Ju6yWkMp/Bf4Q5rvaGN1jgXnupZlpFnXl7RYp3DBJpbNdU8dLpjwrGQ2es0oZOJMsCPyeWPgSXs0GGgG1NWE1ge9yDITn+mxxcovFBtMPh2i9la//cx9AvzdMmooYzIxgNnOY3a1QjtYzUnwUNEZsxhs2pk1gjmEk4LiFahcc0qUvsarkZishAucyNnGZwzzlb4i6RMTH94s3AvifowblFNslf4MNXTE6KPgT6ADIAzrzutdofnqOXWN/EBXnZ/wAWNrwydv6TltIWEhH8/AQwRLVPRPijqVGqNz5XulR+CV5dUlPwWFpnORW9sx4jrqzV6BG23cdBEMZoX83y2gCg3tpGY006n6LEqtg7JhSBf9u+V9wUV0mb82SenArKVYCsQ/cPNtois6Kn3JzK/IBOv0UKIeVJGeafSpNnH0jVoLhqoDR1ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(83380400001)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LnezNUYFWhtvCmYRwv9PkNzexXVhxP+iGDOqZXb09nvuUVOpdXpgk4csJCa7?=
 =?us-ascii?Q?0xvcOGGDVWFj44N1Oh46mZde4fKEG7Hd6f290nZ3yWL9J/tRT0T5JlFU8QQ7?=
 =?us-ascii?Q?gE7EOmFpJpuhqglL0bhzrI+6yCHKpIfrLeeyfc9KRCJylgLMmCuPg30W2iJi?=
 =?us-ascii?Q?J3YB7xhWaD45T9RyqZEmYTARzZb4vbvOhkelWNmDnw1SKU+yZwxCAC6TZYO8?=
 =?us-ascii?Q?DFDnFLAvSRPlHCTXEYrnqwhybGI0ys4IoB/KviXJWJ5JFD0z+9tKwyojTd2L?=
 =?us-ascii?Q?DAftB66yjPckxOWxMa2Hiz+7kJEr7QY8qNvffxSHFGdiB4qPm9hKVgA4hkYK?=
 =?us-ascii?Q?ryslTor8UMJy0KjvKjYk+XSMby8RK7ChuKDAWcuSoeYWRkW9v3G7z73IAhHf?=
 =?us-ascii?Q?oC6Q787bO4XfKfdPPCrsNW5YyXieIKMC9TB4uu0u8na9v7uYCFnMW9MdujIh?=
 =?us-ascii?Q?wY50jSJouhVgggYmmCt/9U2wtrxKBGgBet4FuYUqno3/+GBpU9hQRKDlDmOW?=
 =?us-ascii?Q?FnKhcdXEt75ucpZivk2YP4BuKpcpJmJl3uX48NKhefucwqCNFdu6Al74PLUp?=
 =?us-ascii?Q?X/SFWoDAGKQi6jO3tK85OiGT38bmu+sUm9sA3wq8bucQ8besSkQELpRmiXNA?=
 =?us-ascii?Q?vhsoyUkNzfPhbyDL6QNvXpPuMguxLXXmdba2osdhkRectjsIsH/DJo50PCAE?=
 =?us-ascii?Q?khzgWh9ECrRmNmkYvahvFoP+foS51a2Jckfu8AYZYDXwmNTLYGUfA37nvsqP?=
 =?us-ascii?Q?jqTCnCN2YdOsjBacsmeKFuItLz3jpRK5FTTqkPJXxSbhA+T2fo0IHZdSOvJs?=
 =?us-ascii?Q?mywdvLXwgcEYO9WKukRKPXbHNx3OAvwCkkcqOV+eVHEMyLxjPxgbit3llxvY?=
 =?us-ascii?Q?wT1lwA/UAyyAVERKvwAtVC1Hkh6xGvDJU0UppCAKaKWE3mv2Y/5zblL7xAoE?=
 =?us-ascii?Q?YXvOte2+oGZXvXp0oarXWGghMUrc1eSP6DtkYU1GAo048fmIzZFW+mRxNcqS?=
 =?us-ascii?Q?WB//VtR4CIYdlDjcc5SG1qH4qWG0x6EY0ldci2GjzQS6Cq0vTv27uBYpYUlu?=
 =?us-ascii?Q?tDCJ0RkaewZlyDcmGUhg3tugdanC2cMg4m9CBJXCzOKS3P76PJ1X9T4nb9fH?=
 =?us-ascii?Q?R80tZXqhxLq8ZdqwBjK5oHjjRmPow8trOCEoxCOsS8SQpx6FWsTYvz10xXTS?=
 =?us-ascii?Q?ATLXufBOL1jTX/V+XGH9oYSBbRE1vWm85cgotYhVZETue6GLn09mXKTwTp6G?=
 =?us-ascii?Q?m5/4oqfKATaadrUfcVnikN9i73oNDjytQTWqErv5SnViVKMqk482Ec3ZT7Cv?=
 =?us-ascii?Q?bOVpuvyU47S+q+/BH58oG8G6fd2b0g4Zg4IlgEeDqhtv7Vj3a6L1E+Gixqxl?=
 =?us-ascii?Q?cfZCN98QP3IauSVQzT2bN1bSdiUEng6uhZVIVeWO4lpoSgjyFzgifCTr5FB/?=
 =?us-ascii?Q?BDlMTNXbVJkpItDf4Clgmqem/QghB101I1Q4/IE3vFI214GyIifhqKLxXYRN?=
 =?us-ascii?Q?P5mLTjBTTJBtdhwDCadIgF9pBOsaZe28TusEbR0xv8twPGHhNEDPiyg2GKpn?=
 =?us-ascii?Q?gJ/uxFEnT4B3NWE6P7cknQ0LPtVsmtoj3WV+mj2XB4yc784AHyH8YsJSFPBG?=
 =?us-ascii?Q?RQnUx8wMlVNQiBNIFLOGJvf97JLivA0hithZbpFRWhKoVSN22B3ctB+KNF7A?=
 =?us-ascii?Q?35DM3A=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d713d5-79f8-4cd1-a40e-08d9faaf08e4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:52.7102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQYVxH+w4etiVkSK3wMlffz1MqrW+GLFAUDSvhIlGVBBynIpJcRJ1VrRH0E1+txwzTskMbzWZCCKWbxwwE9uiv8eHxXzoIxppCgEVxWuSro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::721
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::721;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add function to wait for all intersecting requests.
To be used in the further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/reqlist.h | 8 ++++++++
 block/reqlist.c         | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/block/reqlist.h b/include/block/reqlist.h
index 0fa1eef259..5253497bae 100644
--- a/include/block/reqlist.h
+++ b/include/block/reqlist.h
@@ -53,6 +53,14 @@ BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
 bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
                                    int64_t bytes, CoMutex *lock);
 
+/*
+ * Wait for all intersecting requests. It just calls reqlist_wait_one() in a
+ * loop, caller is responsible to stop producing new requests in this region
+ * in parallel, otherwise reqlist_wait_all() may never return.
+ */
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock);
+
 /*
  * Shrink request and wake all waiting coroutines (maybe some of them are not
  * intersecting with shrunk request).
diff --git a/block/reqlist.c b/block/reqlist.c
index 09fecbd48c..08cb57cfa4 100644
--- a/block/reqlist.c
+++ b/block/reqlist.c
@@ -58,6 +58,14 @@ bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
     return true;
 }
 
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock)
+{
+    while (reqlist_wait_one(reqs, offset, bytes, lock)) {
+        /* continue */
+    }
+}
+
 void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes)
 {
     if (new_bytes == req->bytes) {
-- 
2.31.1



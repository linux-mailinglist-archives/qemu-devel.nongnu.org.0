Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65A7368513
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:41:39 +0200 (CEST)
Received: from localhost ([::1]:50810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcOY-0008IN-Q9
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEV-0007My-QA; Thu, 22 Apr 2021 12:31:16 -0400
Received: from mail-eopbgr40129.outbound.protection.outlook.com
 ([40.107.4.129]:3204 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcET-0003yB-CT; Thu, 22 Apr 2021 12:31:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWEvKv7z5YQG4Qp0lkzXdMuSGUv/6XbvHMittULCoWTXWSL5dYlqXrrFGNVo3PglzydiYrk6KhEI5aDpQoKNwB2K1RUu8v1bcL7JaSDHEW2cIIYO3mn3DFlppnPFFwObcJVjD71YJUXl2j3aas1yP4yPV56tu4ofjCkJIdeKTAZD9pwtFQJ9AP3K17Dp7TtVrfhQzBzy9TB2OTxllnSUJPAlQtQN4jKZ4SgfpYCNncRdPTqTxMiSqpTTGNA71DzW+dpaG+xJ12yfcqyibQIy2RWhnffe5gars9fxdHTpZUUYzfW5qt9E48KJ9prNDqiq4WfThWkbk7R3sByK11FzPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqjR0mTXFjFvP0QqJzujV2aBCbF5nfVUnPA5uiK8img=;
 b=kchnl1XKTwzMLpvKuI4jAOsjtgBV5BVg0VkQ9eX7OWB4NL/0VlnRbk56sAHnUp1bdb6QBggMxXLJ4tF3hJs2XdXtKf/Fq27VZPVlw9zm1SO8zqvqtfsYyPjfMoKh3N+ErhDXMFc6EpxqHf7Snebb+ylAcKMrStfiZ8gD5ieRgMqlQcs1j6Oq/firo2LNEI8EyS1emXC9xTlrEYSe/UPd11oxFcDmEP4Cw4f2cmJQz5llRO/fVOR9Yy+UsQ8UO5LiSjhP8WYQYBGTCcDrQlxkgqLAYavaisrep8QtfQHfavG8pbw4LG6uAaqW2Z0OEJvbGp4FdD4o8HkFaKg5q93vbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqjR0mTXFjFvP0QqJzujV2aBCbF5nfVUnPA5uiK8img=;
 b=W4Vfv2lAFTxAJHWxDEaLgtMKhXspmX09LsG7bNhH61pvInmmm1xowAqrldROieVuXFwuPslnG+vilJG37HiQRF0coXnJTKtLiHZkgTz0ZGwFpT8vbYsOOPIpKKZPbNv/sw1bQl30l0eZPRgEynENdCr03j2SInINxJlFD+ylx7g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:31:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v6 04/12] block/qcow2-refcount: rename and publish
 update_refcount_discard()
Date: Thu, 22 Apr 2021 19:30:38 +0300
Message-Id: <20210422163046.442932-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210422163046.442932-1-vsementsov@virtuozzo.com>
References: <20210422163046.442932-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0501CA0006.eurprd05.prod.outlook.com (2603:10a6:3:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1e138c2-6683-4539-273a-08d905ac069f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38611FA794D392F4835BE4EEC1469@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:231;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAY95FT0SmdUgzqOKAY17VPUckjHWm86osswek2EG8asr7HBZul+SiVLg2AKW1H35j+ZYTFX+7O40mQ//j3Gqjd1ZbO4YPq7uLWHWM7OLC6M7eyKnHNTe6S9dvpaUJp6NtlS6uqp4g5QKQjuDiQ4yz/QeGLsbNtt73gNvfvQ0uwxohYsNboc+DcbIsmMaCytwi/PoKj4tXixpwjwGpZkNiagjh4rYLIDWXF+pDj7cIyUOtsJo5/FhFwSDO+AtuIKJSvOh1Q3ZsytslJVFDcfnnOYrlWF0Bp5ITnpIbCJF0jqyV+bTOX4wgmBEjXCABsNYLHG0soIHtclx+TUpbGzb+bL7RkLCY88l1g83MFS0FYmayFcIYUI9bNpCDkoI5iRgC5bxDecNVyPzqHxqOnKB3MV1iw3GmBcdMLQxLWXdKvUOSi+2UxzUFRcVp1hUuS504ewq+GXz5MpQmbyWcCbkgcDs3ES7IHgoDCnVwUVfc3STczGuwIrGdShgUJ/Xw3LVfC6Y9WeavdJFaGkgejpf+YVe6K8IlSbmq7wsHz4y+3QsqpxVGeEIETkUUccSaFdDPjMYlAHoRYSvHCgrH0vlPj6xNhEnz2OFhjLsOT31NbdLNBVRBWvkwXT+qcTx3pcpxLN5Yd/oI1MekzZq5G29gHmk53Yo+MrCchWoOeYGo++hujcz20k5V7kTlobLENv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(6666004)(4326008)(19627235002)(107886003)(26005)(6486002)(956004)(2906002)(83380400001)(2616005)(52116002)(316002)(478600001)(8936002)(66476007)(15650500001)(6916009)(66556008)(66946007)(38100700002)(1076003)(38350700002)(5660300002)(6506007)(8676002)(186003)(6512007)(16526019)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TcapIHQEywc3YGscB+63MYgX2jFAl1zR8O2w54t31xRCJupT/8tINMoKUfHG?=
 =?us-ascii?Q?DNOYx0amQtPN6iIWu6OFaArZep1hZMWrj/eDUwbO0tIkwB/mlb1GKYNcMv4+?=
 =?us-ascii?Q?8D0AQFIPLQZVB3N+DakKfasO4Oq/Nhv4lOOAXOvh2JG4MbHuoRwVgn+Kmr+C?=
 =?us-ascii?Q?il7yVb6rlu4FZgYspnpuNUTkubwgSrxzoAQMMf2X8/QK3Ns9rkpYON4rnQmq?=
 =?us-ascii?Q?cNSmCbEsOOm5//m7s8Jz0Cc8no4bgtjXyoH7/0K29OyWSot3thVzOvuNksKC?=
 =?us-ascii?Q?A30SDa8KxjP1Oq7Wm2q6szlOWkjmZdP7dVIpAnwZskTMQad2DTwbzEvl2fde?=
 =?us-ascii?Q?aRsxVT6Yd2fSGHbmFQGvjDkx6fAWDYddw3JZfeD6rMI818TTi1/6IyLtOm4V?=
 =?us-ascii?Q?+g5c7SbCXjr0wEozX1NruWmMZ55RgECgZQlvtTBODfRao5DeBCmWKeJhQY1x?=
 =?us-ascii?Q?THCxfPFM8yB0XbcbQDmjBYHuKJfi2MXPGbAMYeBMovBBTLL7stzCpjOEMTsx?=
 =?us-ascii?Q?x42YX84ywCKZ9sidbYgMhBF3LIf7kA+GGET0VYXNL2sQPEL0oGpwxkh7ndwi?=
 =?us-ascii?Q?Fc1B1dMfFo40Q40z44pAhxGqlRH32sYXW0HD1Zico+YPMb6f7u+yGH6wR7Ug?=
 =?us-ascii?Q?3weM2Y8VzKXqeCJ7cOTchJpPrZ73dD7wa7R6aP0geCKkFypVgSgy3PBTZrK9?=
 =?us-ascii?Q?oARWsALA2y0PEwbeMGwQ420JJKrfegQOTlsagHcbZxp8A+Kasry7OrG1QFkJ?=
 =?us-ascii?Q?PAzjQQszjn1Tge+DXKjXjinUJ8gj8UOV+8sNcwXotZHs/lJAC6DOVEfDPB2W?=
 =?us-ascii?Q?x2c7fdgH2yg8i6i0lq6hDCvywWG1jQ5BJPX/TCveMc4MdnGP2+p/VlNZvcjv?=
 =?us-ascii?Q?GCBo9TC2U06ISF0NAyCRX1ZnELevIxYOtL/nJjvbX6XCkd7+9JzwXxm6w53K?=
 =?us-ascii?Q?TteyTpMOSwxke4/fljS7pRaS8Vyj9r4U6g1w+PqHcuqX/ZlgTmeTQZ2sZ3qY?=
 =?us-ascii?Q?6dpvX9Vur/CEOZa2DgRgi5dpn9yp5Ek+9+/RZ9+j78gUFDhFFr56RKWExiVc?=
 =?us-ascii?Q?sn+Zuh7Px8LM9qxJ4lcydWEbbEFq3zikcXIMYqmSfBO2KQL7vJ8BRUdhYF7s?=
 =?us-ascii?Q?facI5+aqfseeyiohNSZX+bCBwam3jlOKS8M34qNSdAGfFt0Q51CQTGdIq7PM?=
 =?us-ascii?Q?NSO8xVcxZx3DZb75xSsuNYWAOeotycsHbSXzLLr7c/YkFwxl2H4rG34FMMpW?=
 =?us-ascii?Q?2IWbnZs5iDEYV+J018JClfTlRzfOchJIrtV25SsqddukeM3z+vpfSGHXS+Aq?=
 =?us-ascii?Q?A95bLoOMJu2FOFa/s5YTW96F?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e138c2-6683-4539-273a-08d905ac069f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:05.4791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Hm7RdoSLnuM9LeJgURwqvwQo5hH9Q0jMSYuVlJSs/wd84Og9WMTTVCSMIvBRtXpYGTHY1v/PwBP9ym0CBPnCQnYo20vXA5pnHp/JV+iERg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.4.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

Make the function public to be reused later. Make it's name to show
what function does instead of where it is called.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h          | 3 +++
 block/qcow2-refcount.c | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 0fe5f74ed3..95119876e1 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -896,6 +896,9 @@ int qcow2_shrink_reftable(BlockDriverState *bs);
 int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
 int qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 
+void qcow2_cache_host_discard(BlockDriverState *bs,
+                              uint64_t offset, uint64_t length);
+
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
                         bool exact_size);
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 543fcf289c..ad021aab7a 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -749,8 +749,8 @@ void qcow2_process_discards(BlockDriverState *bs, int ret)
     }
 }
 
-static void update_refcount_discard(BlockDriverState *bs,
-                                    uint64_t offset, uint64_t length)
+void qcow2_cache_host_discard(BlockDriverState *bs,
+                              uint64_t offset, uint64_t length)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2DiscardRegion *d, *p, *next;
@@ -901,7 +901,7 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
             }
 
             if (s->discard_passthrough[type]) {
-                update_refcount_discard(bs, cluster_offset, s->cluster_size);
+                qcow2_cache_host_discard(bs, cluster_offset, s->cluster_size);
             }
         }
     }
@@ -3369,7 +3369,7 @@ static int qcow2_discard_refcount_block(BlockDriverState *bs,
         /* discard refblock from the cache if refblock is cached */
         qcow2_cache_discard(s->refcount_block_cache, refblock);
     }
-    update_refcount_discard(bs, discard_block_offs, s->cluster_size);
+    qcow2_cache_host_discard(bs, discard_block_offs, s->cluster_size);
 
     return 0;
 }
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E6940ADB0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:28:54 +0200 (CEST)
Received: from localhost ([::1]:43298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7YT-0004mD-Fs
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VD-0001oy-Mg; Tue, 14 Sep 2021 08:25:32 -0400
Received: from mail-eopbgr50116.outbound.protection.outlook.com
 ([40.107.5.116]:58241 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VB-00065R-0j; Tue, 14 Sep 2021 08:25:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwShODzvgDxQoGnqJlmD3XjJ4vICcVzaalr7vAx87FIMEfvPG50O+ghjUoRYXzVbzqWAzfeT+h9gKwmgvS1Agt6+YPRcWonHctzcdEhIQIMRNfUShv8+qrFgkuI63gGyNH63YntEmgjAq3Vgp8M7QsJRc3jkO99Y+k/AUzMhCeMKCwIzgEFdLoykgrqojmpS7GYREd1AYpLUebews31JcsnhTNxzyfn/eTUh67iXisUCJr1q2qvrwgBbB6P/vQ8OYIiwxN61muXGpQxXWaV4hpIB2x6Y4xlLn/F6SeZQtoykWRcrB4OS2qS3ADp7LQNHbQ/OsH9ziawwjOn547B1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ywiWkJe2B1CPMO0ZMwLB/2a+ZwE2xpwlJy1GjXMWDGo=;
 b=GtZjm6924KdWwfMveqvG+7mG6G0pWhbS6+0FMMxoIIN+QlRutrAVTFb0L/OZR7lPBJ1IUQyADC1g2t1rCW+x8ABGVwxu5VEy4xiFzsPgRjMVLhaO3HirZqGzcUNRluw4Ne4B/FFnFCw3vr4KzIJI/aOLmawB9QnZaObWJIr4TyxNZK95W/XbosRn8Fq00S+X/MBP9GBp2KtLFXbMkvkHdnsMvpabr8sAw1WtwLSyy7FMbk+txRiV/uHfGXrywbO5eTToViSg++qe/Al20SDlTI8qGpXC1hv+8HIuNqc3zL/VteXoUkqef8T2padS+8aHwJW0XDcnlEvBED7IuvYWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywiWkJe2B1CPMO0ZMwLB/2a+ZwE2xpwlJy1GjXMWDGo=;
 b=Y/vOvnj0HPiLuGuBhGgCblBABi+1uS24uujfnxZKm3VA+kKXbYCbYFdC6UqL5gp+qwabTQ7NnL0h2DwdYwgjV1JF+er61qMpPrf0BJ0HqokETPsi/Dh1/q3Kxz3DXLReqJqSnPXViWAX34VYbqZGaE/oOk3jiTtDldJz1kdU7xI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3158.eurprd08.prod.outlook.com (2603:10a6:209:44::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 12:25:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:25:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v4 05/10] qcow2-refcount: fix_l2_entry_by_zero(): also zero L2
 entry bitmap
Date: Tue, 14 Sep 2021 15:24:49 +0300
Message-Id: <20210914122454.141075-6-vsementsov@virtuozzo.com>
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
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:25:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d584efaf-83dd-48c8-fb7f-08d9777ab958
X-MS-TrafficTypeDiagnostic: AM6PR08MB3158:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB31589AB240C10435563C5532C1DA9@AM6PR08MB3158.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YCqiMFC6Ecx6OZis8ZcwdwbbsrrkfcRxreBbSFGPNKEkYgIALXCp+Ly58XypCUhCw0LP5aATZqhDn2INiBz8B/RLy+OXkdYgAcD5ZpwOAZ3UPtgq2UbUnUvTMKJmoH2cj1b/wgiYWp15sgQfjMLPO4GnXd9s25i2Av1pWdaIOb3kBx59wIDu+QROVQhGHYK7vs9eh/K5I2E04+KNDZpQ7sF9tnr8aNC8T1KGpQeHrXZFUOt5MSLPc8vcik54N2OhAfg2N/H2/UqfU/VRdElxefstM0HAmyby3Or+iIVDKzR+o/htqSQdkAYzVl8/0/v52HNO0Dk+2mpVJTMjrHngj0O765PHE+qiXtyRVydtiPoRQ0iv5bpw5dVlauGpCsWjM5uZA7BqJ/cQcunP+8PUADYDfbsNC8yvMSChPBjNHzmd7MK906jFlsTF/Kt8ag82cHMTQG/wiAWe8hm2JLkaLhkx/Py68E7WdjgUbACKHHOCOZRrlFEiLUeDpvWchBPd8RvC3aC1YAEa+19pG8K8VVz+Ql5ChYoHaAcFcuNaIwMlRPGF+qGBvDyb9bLIunkGLq+dVOr3Fu2KM5JJV7z5Pcu0rPtnmRGg1wfXVLjlCOMTQoytYKfdhU2bGHmN6zQ8KpgcCmfYeOoSPyT1+3i/MFelMu+M4JXjLrbsYgLyuQRrlYzLjjNNi+evj25sxdzdwjPyEiavQsDhdL35rauZjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39850400004)(366004)(26005)(186003)(6506007)(478600001)(36756003)(38100700002)(38350700002)(86362001)(8936002)(1076003)(2616005)(316002)(4326008)(6512007)(107886003)(83380400001)(6486002)(2906002)(956004)(6666004)(66476007)(52116002)(66556008)(8676002)(6916009)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KYOYExy3FVAP8CuyfqsJzGJBGqmb5dwLvfMyGy6mbz4FBJkrbHYzhQxMTVX1?=
 =?us-ascii?Q?1OgkgwhRbMaIJyWM1kELWPq/Oomz29KgIt6hEY+bmWnWG8kfJlJIcWyKb8WS?=
 =?us-ascii?Q?hEtovGEdN3CpFEeljPJ9oCe8n3v9SumSU9VfQdy4kzQLyftUsqalWxCY7yjl?=
 =?us-ascii?Q?NAH15Xptu/+jY92+1Nwama6ZH+m5ngC2pngXnHvwuv1h+lz8rVWEgYA54TqQ?=
 =?us-ascii?Q?Woxc2WYuRxFjp7lV+ks0n1dNYtgGP1A21PM/kwCg//fYoohW3jY/wnE0O0Ch?=
 =?us-ascii?Q?iwYzdcuJfywhbpWkbdx5jpnMzyjTudPMZL1zsW19xYzGZyezHLnSqziivoa+?=
 =?us-ascii?Q?KNPDxv0zxg+86SDJUTcDDUu4KT59sUBdsSoP2Ko/vBz123Fk5ckxAe7VPbUi?=
 =?us-ascii?Q?S8Up5G0xJMxhQfzq8Zm2v+yLJ5JVNoX7x17gQbV5quKVA+SUWiVLr44KUK2p?=
 =?us-ascii?Q?Ky2RyVWU/oU3B0lJ0eaT5j+EiPvPRTo+etDUVbsgTZ24olr/mMBehEIsn8O3?=
 =?us-ascii?Q?cZqaNjnCBEBUd+9XSckBbDhzC+ASKy7eXLZSXTRTpBifFYkJqmBFc52P2/5r?=
 =?us-ascii?Q?4xKAHGn0zJycYTItLMfUjCEK7BTKOBt7U9vo0a9B5TxO8nUHcZBZ6Gm2IQHE?=
 =?us-ascii?Q?D6+riNu3DCyKTYYXsQK5hphShwpPqpmrLhst9WlszpArf8xyEe6svLZIYWNh?=
 =?us-ascii?Q?YI7uqAOvIXe65rLnC10klByPXJ+uDpQ73i/uEhzM2yuS1XJSVrM7zhiGa35f?=
 =?us-ascii?Q?NmTmLnflEmNbBm5ULawgkhCqEVLAQykR5FutYNH+ddcFju3+lFnMbRhQKrso?=
 =?us-ascii?Q?ae02SRPoHuksbdesadhTyV8UpftDRTOlTzSDJ0GavEESAk+mBXhqA2jWkItN?=
 =?us-ascii?Q?cKr+BmAmN080j3uiVhu26A3iHI0V/3yFqYll3E4394FfzYe3d92Sui+2zptk?=
 =?us-ascii?Q?JtfDLmfVDiJ+Xoob43wprLOmOQbjDisUXSWww32rPnr4synJ/8ViutJg5NNE?=
 =?us-ascii?Q?b2wmi5YChgV3JvWTn/cJGbxnMevJ+Nsyx2tbuNrD4xddpz+ZFKsXaBReh329?=
 =?us-ascii?Q?ttbRNCUhsNvPrSMoJfP9F2q2qUEYvMdXUeLAHI8SyBYjczJcrEP+KBo9rVSW?=
 =?us-ascii?Q?YUYTTUDP+LV4+wW+a0Q0b7aGI0lxUzK69tU+dcIWmZAJI+UA3GUmVrTZU3Md?=
 =?us-ascii?Q?Arm8PF7WOvN+6KuwhuhX+ZuVJJdlJR1wy5mnmOmc4U2EzJmnLh3jwZ17d+o0?=
 =?us-ascii?Q?Dt730LFpk30E1cO+3s1P42m72hKcQGPM8PwkdfFSRxek6L/unhedcylTN6vX?=
 =?us-ascii?Q?1bYJq8O51DpUG/2LX2xpuJc4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d584efaf-83dd-48c8-fb7f-08d9777ab958
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:25:23.0401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Emi1lU/6LJiBZfOu7Tyx52HcNdrP7PmkMySUoQZpkM1AfwT7yosDluxfS8c056Tw78NFnMapii/L/eTYXT0gcY2dtIM3Lc+fWhXmxM/ldqE=
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

We'll reuse the function to fix wrong L2 entry bitmap. Support it now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2-refcount.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 184b96ad63..f48c5e1b5d 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1588,7 +1588,8 @@ enum {
 };
 
 /*
- * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN.
+ * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN (or making all its present
+ * subclusters QCOW2_SUBCLUSTER_ZERO_PLAIN).
  *
  * This function decrements res->corruptions on success, so the caller is
  * responsible to increment res->corruptions prior to the call.
@@ -1605,9 +1606,20 @@ static int fix_l2_entry_by_zero(BlockDriverState *bs, BdrvCheckResult *res,
     int idx = l2_index * (l2_entry_size(s) / sizeof(uint64_t));
     uint64_t l2e_offset = l2_offset + (uint64_t)l2_index * l2_entry_size(s);
     int ign = active ? QCOW2_OL_ACTIVE_L2 : QCOW2_OL_INACTIVE_L2;
-    uint64_t l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
 
-    set_l2_entry(s, l2_table, l2_index, l2_entry);
+    if (has_subclusters(s)) {
+        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, l2_index);
+
+        /* Allocated subclusters become zero */
+        l2_bitmap |= l2_bitmap << 32;
+        l2_bitmap &= QCOW_L2_BITMAP_ALL_ZEROES;
+
+        set_l2_bitmap(s, l2_table, l2_index, l2_bitmap);
+        set_l2_entry(s, l2_table, l2_index, 0);
+    } else {
+        set_l2_entry(s, l2_table, l2_index, QCOW_OFLAG_ZERO);
+    }
+
     ret = qcow2_pre_write_overlap_check(bs, ign, l2e_offset, l2_entry_size(s),
                                         false);
     if (metadata_overlap) {
-- 
2.29.2



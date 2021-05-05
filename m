Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52986373550
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:03:04 +0200 (CEST)
Received: from localhost ([::1]:41506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBYl-0001VX-AL
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWH-0007tr-2N; Wed, 05 May 2021 03:00:29 -0400
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:51520 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWF-0005wK-1r; Wed, 05 May 2021 03:00:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zww33MbwRRPyOcwwu/5jv0+tfdAUPzf7fOv4e+LJnRELb61B6+la5dgRHI5+UlVPouJv/SyN1diJ9TcpQilWG+aqBTcNN/9ghKjgJsSD1yD3K6is8tPEXLecG5yYxH4rrXI8PMm51Ckpk4c4oszppzGk6E+HdhfLO/Qaos6Dboue9o+mUjDK3Y2tVM2JHflm0Ri0iL6dR6wY1g0ns4GU31IN1aWykKAfBSdBv9sHrBjUaVlW41rsJy3aVJH/6Y6OqOtKt9Gp9LirDzzp1MpSRQjFDdfVzLUx/GEK3g0VYityA3aCXOMMMX3Ivdt52QqMJEFTZTOh7Zd6zSyltyQqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJSAqSMQChtTeR2gMDl2jR+cz13jXFGwW7pDat7i1tE=;
 b=UYjRror4pRJaCgP1PuPaEPcwV+QTfKs+DiVpl3LXFWZdkn/fBmNXWTp1fIhY6p+88Q1Y+h7qeO/x1gP6QaDTRutNOIzlH6BFYxADpdDworv/GREAfD/9qVakYxtjq4IkzTr9VrlTf0kL9CrTOIIGJjaVi3jJZf+I1nwuJFKQmvtIUKqfGhlHaV7sczrtem4bmraLJvCV7AMx8Jr58oJlNIBU/HyOiyEjfzSvpuDQlwOwOtnA8ZXjPfzhiXM6WgHlt/OgIcPY74FzOvffctB4L2MMo8AMHJy0e7Ss0sE/6zHfFs8LovYH6uzmFyuhVF3tjokJeJGVGc8Z+gsO+zQYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJSAqSMQChtTeR2gMDl2jR+cz13jXFGwW7pDat7i1tE=;
 b=S2DugQcXFa7e7XLIm/nSaTtyMDB5LZ8w04Olawm4W4RIQ/QkqSvxT1HexzbBX064IFpmbsPntvmGvcVZ6qLTCvjoKrz8K2sMEbG1s8jf5pYAja9Dg8LJ86EeDXjfbr5NC/CniP7cDQXjSDyO0ORNb102+ns24BRAAUp9v/vXcdI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:00:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:00:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com,
 eblake@redhat.com, berto@igalia.com
Subject: [PATCH v2 05/10] qcow2-refcount: fix_l2_entry_by_zero(): also zero L2
 entry bitmap
Date: Wed,  5 May 2021 09:59:50 +0300
Message-Id: <20210505065955.13964-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505065955.13964-1-vsementsov@virtuozzo.com>
References: <20210505065955.13964-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR0101CA0013.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Wed, 5 May 2021 07:00:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f6a7416-8065-4e52-f6b8-08d90f936fe0
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB165213377F0285EA57D0F784C1599@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: THKD7Dh1miY0zQrHTuJXZ1oS3vlIVpu1h7APhlTkTZDxeTC7Dncig4og5Ftt5mNvUUF6MEAeWbUECHPdo5aj8myhOxAnMp1atQ6g6hQpoOYTSZaupGr1FRTDYacldfNrjslH1a70dP7cYI3mY4XKpl1DjJ/1AypTJULy0W15HsHY/iW6Dye8AxqCgsjY0W83QDlxwuIdofO5iKgyMkB0bcauuY80K0MQqyNGmUjQtKtTSG8rGVQhLb8WlDBPDBjgXRVSF16C6lH8mLLNxr61ps0hAi/Nh9tjGxZozc4Dp1pft6jpH328yHulwRwLbi8UNjOeOZoTTuVWUKZ2O1ER0vaNzwn50FwcwQVr4Uit67ZcvGIjZRyH9sSe1wmr61AJLj3MRzAj0l06CFKXPo/IZ+ZGRvC23jxHGAHOHkyH6jTsOn78E8nLSGTPKE9TRs/q5PPLrOrLbCuwaFKm35h870iPZY7AzC1FS+ie00K12pB5hbvzjRkPKdzhWyfmeCgUrD/x6UlkmCd6DtgUUH271LiQYxifY2G0bqRWCKUyaqQoKh9ZMx5RBX4MiDaYwRUTbGa7dDGq/JYagVni/D/SCT7fYa6U+OHx6xU8KxS686kUa9/O0qtXvcB0Vddh4MLdgHElw0YG2ZM4njqqAQX92G0JFECWhM2p2w2HUFlbcJDPh5s9JKtt/jBoCI37FJu4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(136003)(346002)(376002)(2616005)(2906002)(956004)(36756003)(66946007)(6486002)(8676002)(8936002)(6916009)(4326008)(6666004)(16526019)(186003)(6512007)(1076003)(316002)(38100700002)(86362001)(38350700002)(83380400001)(66556008)(26005)(6506007)(66476007)(5660300002)(52116002)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xdeJ4WzIZWnDUvUwTXlCK3CSQ3nhM1weCNDjXnDJ9NPb/dT19iGRHodjucmN?=
 =?us-ascii?Q?bSxCt4xFwALsV6BlfRZwPZkwXz/Kc8TmJDpVN176QadVytdlgX0hCS+GdiIi?=
 =?us-ascii?Q?ef6lUxunspOcgiDxI2V2eRk1hoBChyk1QQyDguV0XsrvNJox8Xc7Rk7xqAu1?=
 =?us-ascii?Q?wSwdFs46hcrWo6YPbDqLumGr+DzOpnV0t3oR2NReL4pa081KsEadzEEr/MuU?=
 =?us-ascii?Q?KAk+DntYMFG23XhYH7WqtD++8+5hwUq449/8nkcHoAYW3tBz9apRtvemp787?=
 =?us-ascii?Q?Y8yilT+a2GBNpOGQ8j0wYmi1LgU7wZg+aS2lox5MuZQxqF6tYwcbztRfvlkL?=
 =?us-ascii?Q?qiQlYt/5JPBctpc82ZinsLm/vBYi8MN2+9Kr0AYFCb4DpAoPlSQAgB304CFH?=
 =?us-ascii?Q?3RyrgKQ8+TGji48HPxy9olIYIBhVHrNLYxGmabPnzL3Thh/k4M6pzuOw9n/Y?=
 =?us-ascii?Q?+IUJlDKLw7NX7D2Wd0Me+USq4zhUgHiISxsquVZU3LfNOTVrW2UVAJiuqsjl?=
 =?us-ascii?Q?BED/05zfCU0ZDY3HjPC/KV4EfBIWYUGmMFE7O4taIyhvOvgqSJ6eHgdBQDSV?=
 =?us-ascii?Q?qP0RznBiYPKIin+e3WG72VSSHKoj8MDf3unNKmp9h3qsN9FuOeT9nEii0hQK?=
 =?us-ascii?Q?s+hUiR+kP3jPegE0giwibv5+3SkvP46NQJkJYa3m/sUmiK1fhikHGXmOVIOM?=
 =?us-ascii?Q?KRsZ6Ew4sZwY0GhDA64NUzL6uYNVEHJ0eRG9tqMoT7rEL5gjLUtIu4NRpmZx?=
 =?us-ascii?Q?TVguwwveznApRCvhqNBtt4Hw+xyEzTaZaKYIeGIFuasd0kxELtr2GKaDKh38?=
 =?us-ascii?Q?XbH66FuhDVLD/LEzsdtAWrUQAkAOn4ziElFD8KEKCckEzuAklqE+ebpsrtBq?=
 =?us-ascii?Q?gIH7wJhNIh2Xnx5gTFGLHhH+s836gtW9PZ6KqKXxSEF06WG8dVLfMcKMZSdN?=
 =?us-ascii?Q?hgWk1LBiYW49dkmwzBtK2a+yoDlkI9KHXq8783oJDne1P/fA8xYZZq9V5uea?=
 =?us-ascii?Q?JkPcn2uPUnLJk7zXnO7DFMaC66T49lbNIZpiJ51DfVrrjqm9DXNainJOvaHJ?=
 =?us-ascii?Q?R8JOJrPYkNyu2n/Vi3wf1+tTVe6CkEopur16cGJWhPeo7x3qPdazfefd5NkU?=
 =?us-ascii?Q?7xgea3xYXt66vTVTJiAn/M15pBeFlUWpTGA8s62WV8bKM5CRJRu9wqkqL0UH?=
 =?us-ascii?Q?OVtwWyXN4EgDfvNSTZDcEOdDrvxocbEQLA0thKNKoZzBfuxHVBExoggZJl/t?=
 =?us-ascii?Q?x2/18ZzZt5mIvmFbC5Y6Li3j/TD4VGEUaE7ncctAJE9hYpxz5+UcOQqcINkz?=
 =?us-ascii?Q?FMh/5wlM84Izk5ZWBzv6W70I?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6a7416-8065-4e52-f6b8-08d90f936fe0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:00:16.2732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmDkJ9oLQW0UP1QqhKrGtO7HVB83RYJaUlw0wzxjQPlUx/cB0O9aGnydgS+TkIQnAd7qJPebgQI2mWJyuwcGjd0qsXeHlkOn+9we/ZGTmks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.7.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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



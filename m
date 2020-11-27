Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629242C6849
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:57:20 +0100 (CET)
Received: from localhost ([::1]:41826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifBX-0005s6-Ag
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:57:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0x-0001Bv-Si; Fri, 27 Nov 2020 09:46:25 -0500
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133]:13377 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0u-0003DS-5m; Fri, 27 Nov 2020 09:46:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBuQimanSLYibCDJuCaD6dX1blXXFlqWW/vL5VUY8PQ0iDBey+yq/VKUVz4Mefn8urUj3kXeHPhM1bzfb1HzKsH5g41HX8PmSlrRvwkb9IIOzva+h9nO+Tc0ruMiGwKYne0kZN19Hq5ao4WyEgX8HUID7pb3SkppLIYKu/Pv/q48Ttmo2Hq+RT8ZQqBOpnm/Sf+Fdyktc+aOiWL6W/DuO/BFQw0twBD7OrC/4BfVsYuH4UHqBXbOkvULYih/TaBxkD/plHgjKeJAt9ix8oM8aYogBhndgiMr3jEfp/POVcrnMR9xumc38jPCJGSyrwN4jSyXSgz474ynkR3RPAyWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heqiku75SA07ndjxJXFWuYz4E46lMrqwqr2xAKf5j3c=;
 b=RA4i1BT0QHHbY6tYN2BRKaIvOOGavujFGF3r9NMtfeCGMayaSwQDoSEgXbVj+2nSjUC6S+3LmBYIPWps1IxXlDzwZy98bia2AOciEhu4mQdFwtngg/rcHrheDYB30LFg/X9Itud+ahRTfCs5o8ocJs9QHbhoqPRCU5Qa/2jCT5goLyihnE+cjO8w16gLsUD76w9P4rp60NNCcZQpc+DaX4LGWXVv/jaEFR5VuyffN1afcqyrpMhrybuEM+ujyD/rywT4onedSfW9KfZDkxW48IIaKsvhjCqoeF1DSfxVi4uAVYP6X8s80GeJgM7PrnANZUQJumJxNn4MKNELQ5pU5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heqiku75SA07ndjxJXFWuYz4E46lMrqwqr2xAKf5j3c=;
 b=dbddukptJ5HkCL2UOhqxOElHaMO2VPfJVyOkzMp2RAq3n9kb7TiKfRpyuMSoEJK6T1pZV0nKdUrhI9scu+Wzf5AgDYYkCS+KmA1eZrJYBabfH3JhFC7y9SAqIAk+5fusgDZipfJSZuId66BlThRdsqIrGaIP+XIhuQ8HYAORl9I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 14/36] block: inline bdrv_child_*() permission functions
 calls
Date: Fri, 27 Nov 2020 17:45:00 +0300
Message-Id: <20201127144522.29991-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a6d8ed4-6007-4b3d-fbf1-08d892e3208d
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB507840C3B482C1BB239B0FD0C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:45;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h1vm/6TkDgy8UJ89EfXqvFxcOYqFxCUAxA0y7LZ7YJtD4hPCa5i9e5JJZLBR4Irvcgrej2xAfO+e2iiF8uy8I+GvlUf4nkKhvCpUuqEQJA3nxcymxn2r4Yza5l0PgXeNdc4pUvZpfVD9FidzDBnV1H7p1cgGgjyk/xQ03xEK+p+3zQU7AQh+IFqeP33puIYWEpO2WwmvcGNj3qRPoFauxpecnAUhcpb2XtezryAGzvhYLjSJrJpoeDL1Yk0KfhsESPSq4PCJk4remvdhp8iLpAfJPTiEPSriMple020h1VuCag3SmJiH07si/tv+Xl5Jju6r9RoVlzTxAwitsNS4ovtG0f/kVkG5xzJCvd1flvS6QMIzhi59c3+c4Lyf1Bv6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GkFlecHRpvwYVFcSXXgv+cuVhHziyrVkaVYQPxvweIZ6SmpjeCG47+ASQ+tY?=
 =?us-ascii?Q?aPc6DrZBqmNpuU3CxCiuW2CnlGmTW0pU/2+8mrkqoDaKWmJSwXZ/X/6A4iq2?=
 =?us-ascii?Q?WiAKLedkF49UwRAHus01H9JAN6zgybXB/4vIGonfobJ+LYi5O12TjsR62fUw?=
 =?us-ascii?Q?tEyQD5ctP/dISIwgqa/n2fNAkCrEfnz9wxC4OkMi8YlFDpd67W0HsXflqiED?=
 =?us-ascii?Q?EOfRcUJEgdS+kbF5Yv8ID/kmNZ9XlmQscbnt/G/Bu0IejTH+ojoskqSWigRl?=
 =?us-ascii?Q?/diyrCKqfp2bWGZ47DKCus27SRGpc1xp+PsoruRCgLyHhGOxr6q1sZtFIVFQ?=
 =?us-ascii?Q?8k0jVsrFMTzwaoE207Mu69CXkhdwF2hiJWz6KKUf6gof/vaO5Fb5Q6ArQgq4?=
 =?us-ascii?Q?Vu3dYye6sqj2cIQeyVJCckW1PF6sPXD+o9uk/DX7g26COmY2PEV09175bKBI?=
 =?us-ascii?Q?GzBU4rd14ypXIwaXv2XyobFwkqztefughF7XFTW7aCpAa8iEpO+aPU+XBa7G?=
 =?us-ascii?Q?ZhOtSdiBetQ22IIRI8wByfqmI5yFiqbU7rWgv58YC0RCyx0WXNVURHO/NUs6?=
 =?us-ascii?Q?D00cpYCujygQ8xg1XwDQl3CPRMFv3oURJd7iyXukfQOFz+JVR7X7kTQQvl9c?=
 =?us-ascii?Q?Jr98DrlsEOHmFGaGDuKw8WDAIJT9E2yVImkibqvDEnhrLt67bFDDPmMw6umQ?=
 =?us-ascii?Q?Jief22H1O5p5lDm6zrkoPJITDVXrDQaK9gv5kZ5maQz6vMdzRgN0QEMzooGM?=
 =?us-ascii?Q?gWHCnKM4Dx5JyMxu8CPjNsqGxlsjb/9yT5oylOe3HjWYd4rwsR6Cw6pHvmCc?=
 =?us-ascii?Q?pgu04BKVwdTOeYeR8mlaBRsPnrOyDMg2Gv8x5zL3HUTq9/S79I7bfMeO2Tbq?=
 =?us-ascii?Q?dxcuskyI2ytX7qfTGUgFHUj52Znh0ooZvZt9dQyHsM05TN0yvdH48qTu1BQj?=
 =?us-ascii?Q?k0YbkC72Anv4b0LSTz3oFk1d8PJ4jU19OGTWLFjh1wL/dabcF318zKbNC44T?=
 =?us-ascii?Q?L5iT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6d8ed4-6007-4b3d-fbf1-08d892e3208d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:47.5915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8nvzr+v/P1XDX/yYNwlK2r39AuoJzrnissWswuUI9AbL8voriejF4Tu2sokcXqpdXiSb9grJLi89878Y+yfDpu4wSO648c1bxmZriz0Lu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.133;
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

Each of them has only one caller. Open-coding simplifies further
pemission-update system changes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 59 +++++++++++++++++----------------------------------------
 1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/block.c b/block.c
index 82786ebe1f..92bfcbedc9 100644
--- a/block.c
+++ b/block.c
@@ -1914,11 +1914,11 @@ static int bdrv_fill_options(QDict **options, const char *filename,
     return 0;
 }
 
-static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
-                                 uint64_t perm, uint64_t shared,
-                                 GSList *ignore_children, Error **errp);
-static void bdrv_child_abort_perm_update(BdrvChild *c);
-static void bdrv_child_set_perm(BdrvChild *c);
+static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                                  uint64_t new_used_perm,
+                                  uint64_t new_shared_perm,
+                                  GSList *ignore_children,
+                                  Error **errp);
 
 typedef struct BlockReopenQueueEntry {
      bool prepared;
@@ -2166,15 +2166,21 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     /* Check all children */
     QLIST_FOREACH(c, &bs->children, next) {
         uint64_t cur_perm, cur_shared;
+        GSList *cur_ignore_children;
 
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
-        ret = bdrv_child_check_perm(c, q, cur_perm, cur_shared, ignore_children,
-                                    errp);
+
+        cur_ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
+        ret = bdrv_check_update_perm(c->bs, q, cur_perm, cur_shared,
+                                     cur_ignore_children, errp);
+        g_slist_free(cur_ignore_children);
         if (ret < 0) {
             return ret;
         }
+
+        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
     }
 
     return 0;
@@ -2201,7 +2207,8 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
     }
 
     QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_abort_perm_update(c);
+        bdrv_child_set_perm_abort(c);
+        bdrv_abort_perm_update(c->bs);
     }
 }
 
@@ -2230,7 +2237,8 @@ static void bdrv_set_perm(BlockDriverState *bs)
 
     /* Update all children */
     QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_set_perm(c);
+        bdrv_child_set_perm_commit(c);
+        bdrv_set_perm(c->bs);
     }
 }
 
@@ -2338,39 +2346,6 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                            ignore_children, errp);
 }
 
-/* Needs to be followed by a call to either bdrv_child_set_perm() or
- * bdrv_child_abort_perm_update(). */
-static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
-                                 uint64_t perm, uint64_t shared,
-                                 GSList *ignore_children, Error **errp)
-{
-    int ret;
-
-    ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
-    ret = bdrv_check_update_perm(c->bs, q, perm, shared, ignore_children, errp);
-    g_slist_free(ignore_children);
-
-    if (ret < 0) {
-        return ret;
-    }
-
-    bdrv_child_set_perm_safe(c, perm, shared, NULL);
-
-    return 0;
-}
-
-static void bdrv_child_set_perm(BdrvChild *c)
-{
-    bdrv_child_set_perm_commit(c);
-    bdrv_set_perm(c->bs);
-}
-
-static void bdrv_child_abort_perm_update(BdrvChild *c)
-{
-    bdrv_child_set_perm_abort(c);
-    bdrv_abort_perm_update(c->bs);
-}
-
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
 {
     int ret;
-- 
2.21.3



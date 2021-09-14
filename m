Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DC40ADC2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:33:58 +0200 (CEST)
Received: from localhost ([::1]:52786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7dN-0002ok-FO
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7V8-0001mc-AJ; Tue, 14 Sep 2021 08:25:28 -0400
Received: from mail-am6eur05on2131.outbound.protection.outlook.com
 ([40.107.22.131]:32082 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7V6-000628-6l; Tue, 14 Sep 2021 08:25:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrYJ8i+QkKstSTA33umv24MZP3JTbGNn0XD8rCMXatTslW0296U3P6OkBt5UJjxGyuNpRk2AmqUUfzMXFmWqF2tDz0M34pWrQHMJgm4QIl8UlL6JIMcHufsQM0iLEOFoyn/U28cL3lLY0liykdu9NJ4Tl1VbIsBNMgHFMZii6kcnnfL/fVUVFRzWUKsO0OPEyGFQKC26mV2h0s8AxKyr6mflSWrC8CnZCSYDqeRSB/e35njF5Fj74NL0DOp9o2iR2Z/7IAqwvhCIhoKPC6G8gxn+0wIgOHjF5xtuElFJl4ImJZtRZ1mG0EMXQcAkONf39vSinb+3gkiBp3u0gvP2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=6QG/g/QYMS4kzSJh7+QPY7k5GWusMi3mZda7IANnMwk=;
 b=Who9BoyZ1neWqDUDppEjY7MSCjFrgtd4pAvl0dF3pR25dMoavyMUd1EEhTLJ1a9NqUQpUNdqoD7hthZIv2Kt+TD1Lg8OxTPxBPoApXD4tv/m6fxUtRkKoJQL1P6Dcn7geuJA/iJnO1CTn0Qp+iXDZsofRaE6UgUqcZnOUfYs3HEoiDRvEpIrGs+zlZcWPVbwusejBsgB7rnqqV5sSaKGaFIB2ItugCKz4S+jN/eNEtIvOubcoRkWJr3HPWT/CObbgNyn+CUU/YS5d8tCUs0lCFDcY5a5ulF6jpkZP1Xd5GN2zpOPC2n9v9uXZbV6y4LuLRjNOYBXS7b9rB7vuNWvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QG/g/QYMS4kzSJh7+QPY7k5GWusMi3mZda7IANnMwk=;
 b=Ls4TFryEEFIFrCiSFgqQLBUSMMawVRZIdtvWmDrvJzLxrtgSTXSY095kUTSKJ8bq0BLnotC4EssrokYMiFx5QlXzeO/lzBOGet9ajormW7FSbqWhzQ8V5MUG1/NwSSRqwJRm6McEfPHUacwoBKVkeTfPIs07eO5xw5lYCSfYp/E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 12:25:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:25:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v4 01/10] qcow2-refcount: improve style of check_refcounts_l2()
Date: Tue, 14 Sep 2021 15:24:45 +0300
Message-Id: <20210914122454.141075-2-vsementsov@virtuozzo.com>
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
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:25:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e21cdbd1-c892-4a10-d2e6-08d9777ab625
X-MS-TrafficTypeDiagnostic: AS8PR08MB6946:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB694620494B804FFE28E2A9C4C1DA9@AS8PR08MB6946.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 23jkMUAcBZBbMhXgNKJQXT8zxz0iowo4yYACviWhoHZaWxwTNRaGB2cCx1hJgKG2z5ln/i0x6s7A9tgya9FnwnAn8f3qqhOBDTzh/OWiizPh91OvrGwUw8bvsHC0B7Ym+rN15o98Eh5TEzMpKv7Jz1Tmrit3vFW0X4qxlotSTJ0sv0fkkcckdEJT71NNA3uuMoiL89/jTBtwlNIl3oAnBa2qdGkCW6i7I35xQR7VP8kvAodDyknkq73LWeI6Ubr9yWhqp1oqBtANTd2y8saPKa5+EHZlVZJcfffi78yKv3ik9xh76MAgRolvDox4jZoHWKQCgdRIZmyS5Py1RB3XhGDno/OvSUoX64H+C3TY2S9EwmMXwxn2NLxV18/0j/EKGIwMe4BuE9Wwb56WWW9HMNBxxHlqGUUhpB0FNhJvcvAIwkXLYH/YD/1Go67oE8/cFUmhyThTb5Jx/FSvX7KpmJkZdIOz+1okVrt1YE9DSzVnY3JgvbMRusj25MAP4iyaxQqRHEVT6+dHGpqVdL3K8RVm/zdnocxhyMhkWarhTgi5RmgbmyR3VPYOhZeskvFF95x3LHD+Ub6ZpHScwIw2ddIfp3/t6mzZJDpFrtP4dGI8gSHcjFLyWQvSn5ERREuR2B3jmzQf+PtyakAY/DEnCdGtDFUPId3SAqVhL0HkJvbeWel4vaff/hWitkCeQMML4OS8/OduN6FG0cMyJy8zeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(66556008)(66476007)(2616005)(38350700002)(26005)(86362001)(107886003)(2906002)(6916009)(66946007)(4326008)(508600001)(186003)(5660300002)(6512007)(316002)(6666004)(8936002)(6506007)(6486002)(36756003)(8676002)(83380400001)(52116002)(1076003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lvxo20LWk0rLiTB/yZp+ReMoiR7gbcV/pE9wlEHxkkKP/+ua1KN+psH39rNN?=
 =?us-ascii?Q?BS0W5uiLSXo/7VRpc/eBSdgiIU1+qWhpCtbruIvPRAUemU8XSBxfOF0jLC7a?=
 =?us-ascii?Q?RCHqcWT3Mf6jz/0kWXEpkD2Hxu4oP7FSusrphKAc94WljiIOWDlz/oHVix5F?=
 =?us-ascii?Q?DsyRJHfskTrJYC8fIdi+tFjACmfd9FEaL3R+WuD5JXxgDLZJxOztFxJvkwtn?=
 =?us-ascii?Q?phrG01WQx7fOi1Lm2EQ04+2kPLRarhVvtcTjpp4ATHOnDbbXikPNSFjH9pRU?=
 =?us-ascii?Q?E5lrHG0dMEFm4UFbgNM5su8QyvPMI6B1Log7fvIgqQG5qCdSONxHEENnmUX5?=
 =?us-ascii?Q?zZg5eTJBpPZyLG0TBtf0P0/AYGt7k+ZxYKIQpAxkM7VzLe4NLdLuxgwio56T?=
 =?us-ascii?Q?9zwp2dsGZ0v6FVq/wOXSUeR4CWydryKcUKkB5tUXJW3djqbNW+9mqZTtYSSu?=
 =?us-ascii?Q?A7WAoHdFLwXlheyyKEr+BRWA0tDLFuHlRFCJbqr1Re6Lk79Pnx3fFoUdvlJj?=
 =?us-ascii?Q?Jq6kVNC7+UeCkIsul+GAMzPEBkT7l4BDqrkTnmP/nu+D9A9gghr5R9OB8EDZ?=
 =?us-ascii?Q?3eI22amRFvOu0akIkAlvNgCndqLUqm3/OzbOlMSlBDGHvg42Uai9tadm18ql?=
 =?us-ascii?Q?XCl/h8zjkA5d+gnucLa3ZDitGFjwYepTe+eDWBIOoKJY0QfajmCJIYd2oPF3?=
 =?us-ascii?Q?7oxU12ODcgM+VCIwwe3nL7BewThubVykEzMWHAUU4wuSMhR7s/G+3NfI1+oT?=
 =?us-ascii?Q?7MBo6dlpGJhFyuFdgx1umdAzQK7wccTvTKA9xpJjwmmiAzA65tza4StbiRTh?=
 =?us-ascii?Q?NzAa6UAJUQeZJgCsojimrh+bt0nUE/qhUpl7D9kFaF/cWN+z323kdpPAkEan?=
 =?us-ascii?Q?rGQtVglxfFzE2vUvLmxk9U5TdTmr9Zf/XxGWoI4yxY9Em3H5BBKwNQRGRv5j?=
 =?us-ascii?Q?UPpjUZp+Br4bekU2WkBJ6NGer/0O995STItt8a1lj1KawDJ52FMIcTyxbbIF?=
 =?us-ascii?Q?hTEBr/KQ1IDkezlXEHb8xlG4a1dgAL2ZuwuEa0DBzJNkaQaa4ouCKAVOpEj1?=
 =?us-ascii?Q?4ES0dh4nTFXZmSO+RzPKQrXo7RS3Ik13t/Z+MPdsTVDtnaU47qza3zZiS+tC?=
 =?us-ascii?Q?vncKP3kQ4DzG8ftX4d1ZAZyZzVyuHE+Jh+kifi+I6hyAkIqnTQ5khFs9EVnz?=
 =?us-ascii?Q?UEmfQ7ezdvHn++2t6AvlP8gP5sfu1XYQdvV4YDWpZXQsbPYewY2Xep/sAUSh?=
 =?us-ascii?Q?BVnLNq7N2qM0C8kw+0T4DoGI3tYiDJfSrkHc3LM5gjXdXsgjZRlb8/lNhwxg?=
 =?us-ascii?Q?QPW4bc9qwUbZjXBn7IyUba5H?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21cdbd1-c892-4a10-d2e6-08d9777ab625
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:25:17.6826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHEKVUjMnlx39olKmkcUQ1B6zFchtK6MqX9kNcDduKrzZVDU2IoGM/iaauP1YVhHcouUmX2CwZJwKFrLuf9B7DEfJfM2W3vzqPgY3XuwOJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6946
Received-SPF: pass client-ip=40.107.22.131;
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

 - don't use same name for size in bytes and in entries
 - use g_autofree for l2_table
 - add whitespace
 - fix block comment style

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2-refcount.c | 47 +++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..2734338625 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1601,23 +1601,22 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                               int flags, BdrvCheckMode fix, bool active)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t *l2_table, l2_entry;
+    uint64_t l2_entry;
     uint64_t next_contiguous_offset = 0;
-    int i, l2_size, nb_csectors, ret;
+    int i, nb_csectors, ret;
+    size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
+    g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
 
     /* Read L2 table from disk */
-    l2_size = s->l2_size * l2_entry_size(s);
-    l2_table = g_malloc(l2_size);
-
-    ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size);
+    ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size_bytes);
     if (ret < 0) {
         fprintf(stderr, "ERROR: I/O error in check_refcounts_l2\n");
         res->check_errors++;
-        goto fail;
+        return ret;
     }
 
     /* Do the actual checks */
-    for(i = 0; i < s->l2_size; i++) {
+    for (i = 0; i < s->l2_size; i++) {
         l2_entry = get_l2_entry(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
@@ -1647,14 +1646,15 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                 l2_entry & QCOW2_COMPRESSED_SECTOR_MASK,
                 nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE);
             if (ret < 0) {
-                goto fail;
+                return ret;
             }
 
             if (flags & CHECK_FRAG_INFO) {
                 res->bfi.allocated_clusters++;
                 res->bfi.compressed_clusters++;
 
-                /* Compressed clusters are fragmented by nature.  Since they
+                /*
+                 * Compressed clusters are fragmented by nature.  Since they
                  * take up sub-sector space but we only have sector granularity
                  * I/O we need to re-read the same sectors even for adjacent
                  * compressed clusters.
@@ -1700,9 +1700,11 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                         if (ret < 0) {
                             fprintf(stderr, "ERROR: Overlap check failed\n");
                             res->check_errors++;
-                            /* Something is seriously wrong, so abort checking
-                             * this L2 table */
-                            goto fail;
+                            /*
+                             * Something is seriously wrong, so abort checking
+                             * this L2 table.
+                             */
+                            return ret;
                         }
 
                         ret = bdrv_pwrite_sync(bs->file, l2e_offset,
@@ -1712,13 +1714,17 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             fprintf(stderr, "ERROR: Failed to overwrite L2 "
                                     "table entry: %s\n", strerror(-ret));
                             res->check_errors++;
-                            /* Do not abort, continue checking the rest of this
-                             * L2 table's entries */
+                            /*
+                             * Do not abort, continue checking the rest of this
+                             * L2 table's entries.
+                             */
                         } else {
                             res->corruptions--;
                             res->corruptions_fixed++;
-                            /* Skip marking the cluster as used
-                             * (it is unused now) */
+                            /*
+                             * Skip marking the cluster as used
+                             * (it is unused now).
+                             */
                             continue;
                         }
                     }
@@ -1743,7 +1749,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                                                refcount_table_size,
                                                offset, s->cluster_size);
                 if (ret < 0) {
-                    goto fail;
+                    return ret;
                 }
             }
             break;
@@ -1758,12 +1764,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         }
     }
 
-    g_free(l2_table);
     return 0;
-
-fail:
-    g_free(l2_table);
-    return ret;
 }
 
 /*
-- 
2.29.2



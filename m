Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6484A37354E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:02:51 +0200 (CEST)
Received: from localhost ([::1]:40676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBYY-0001BA-Fd
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWE-0007pZ-Rt; Wed, 05 May 2021 03:00:26 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:64516 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWC-0005yd-KN; Wed, 05 May 2021 03:00:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVNoXReqGQ7kGf3Wm16KbaglblYH6iW/3xbLVET+uxh8jaJLloctS0IDLu40795lqr+ZfG4dsj6vJkNZXIzzxByxsW8m10i3Jh4il4GlmEVD+YQdnHChi0j2fsRfsSDxB9LCL7hflZs3QwBSsbrLzTfBtRgICBV4PAoYfGm4TiXEzXRLaHDJvAxSEShCwqURwQIEraVaq1lruWvo0iTkbnGuBHGxSC6kN7E30H/5wzJPpeXKzXZVF7tMvAAnqKqb8T6JN/vyWeX5fiEzg/Mb1RYNvrzg6x+2I5dz3T0rkNjL1GIPSqnDDlTL9h6IZfBXDo8oBTYhII/hSXSZP+BBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ5wxpZjo6CWp8sO9JbQAwX3ht0ArKOrRW9o8GTApMU=;
 b=T2znpbT+iJ+HqLJHEOMs+96yYtFc1ag8sanRn37ZsJ4h7sc71sNcNE0gNYaSlmYVX1s1C1IowEwVJg6yqDckCRoHUbPkfhrHZFkf8Y+halsjhUc9GpELpUeuOL9d5ZYPH+HRwCrAZIgLLRTq46a9FfAQ/LUuihm+D2yG8ub8ecYh8GyNqts0j9rJ0GXJthyPMKM6B6cWN5Ms0UEznHcmVElmZx4VQjgkfh+K4JkqsRh4a+aX3qOony0O9BtOpI4aXRk7IL0hrx6iOLyMcx3UQ9Vh/bTfRdgNHTcXoIh6RGoZZNWh2wl5MYaeltB7dYjs3zOe106ev0PZgZ6whSwObw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ5wxpZjo6CWp8sO9JbQAwX3ht0ArKOrRW9o8GTApMU=;
 b=Omc2uFSEloxkQj0zYiRTrPCyJ1P6faseHKejXDRG8oUgEhP3c+J64+y+FBwkvNg/6tDZhOQVzQxPAXpX2VC33+1A+NsM6y5vt/fBOP2oG6X/s+JWEym7UnmCe7l07e2sdI6EupW6e2FrSHPOEIUL80QRTrvzzWuE7Y98BQi1E3A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:00:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:00:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com,
 eblake@redhat.com, berto@igalia.com
Subject: [PATCH v2 04/10] qcow2-refcount: introduce fix_l2_entry_by_zero()
Date: Wed,  5 May 2021 09:59:49 +0300
Message-Id: <20210505065955.13964-5-vsementsov@virtuozzo.com>
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
 Transport; Wed, 5 May 2021 07:00:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9a54e2c-8331-4627-79ed-08d90f936f08
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652162FA993CD4CF93F325EC1599@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jSblhS1GDhCflRlRIitfX5qPYe1PNRAVCKIYxM8Jk6zEJxEZB9cxE14XYUPQ6j6wGtVAJFP9vLXHlFDtrpIcz75K+/Z7FwpPsjUnJMfeDqYiBcps1q0kQTS4uw/WRrHsG+E62Nog5bcX5BvaGnBaEsNdtMB5DDXqC70PqEA8BOyZrv+WU/rScNvjOSVIGtGDaryHI0bVTqXuplJbtlHqmNqPZ+iVro9eLJW69j8JlBzTjXiQX4SzOZjv91AT0TangcVotPZWBGnsKVp06EE70zbeBwPj3M39Gay2W1uL061Piu+tSerS7TxVaaHok+IG31Drjk3D/AYdpLGO50WY/I3xbKIcjffRPKyagNp2//StObnBURngKY7zsxFSbgWCFmetYVh9rBHUzYYg1vv8vJzVqvUta1wqSujMD7YwDACqT2ER6ryDa0iC8pEh3O+3voU95Vwe9chnYuaxQJKeXMjuJ1soHqs65PLbSlPfxDwMXuyBE0AtGQL51H9bwGbb/oHOIvPqHQHOCjQGC+Hn3yDCiQi2UGS+7KamsALL1Li+D09TzkbTCcQP8tVz8iBLpX4IzJXoTOndcybzHPJvASArPbyRzwfXLIK5NgvPhWe07qWiwykLpI03Odh0dT+kO11r9UWcu36isF/I9xrXaMih0uozZur0tEEoIy0ndLZ63nnynnue+B/qejeuhlAG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(136003)(346002)(376002)(2616005)(2906002)(956004)(36756003)(66946007)(6486002)(8676002)(8936002)(6916009)(4326008)(6666004)(16526019)(186003)(6512007)(1076003)(316002)(38100700002)(86362001)(38350700002)(83380400001)(66556008)(26005)(6506007)(66476007)(5660300002)(52116002)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Pzqv8tkakPVIunxBsitoVzops9FDhyQAjFb9TCYP99/zwTXUguMPZHdkngu2?=
 =?us-ascii?Q?lJalfAQuyMQwRDl2lOqU8dnNiB2rFBwx3bBhPtnQy31mYqWGId33bv1NiZb9?=
 =?us-ascii?Q?ph5tgQX4rMUHZaNWk7voaNXsJcXCZZdCWsfG9un8TyRq6/vYT7b8VwAMFo4B?=
 =?us-ascii?Q?GNV/BjCKt8s64eqzIUnprc+8WkL9Vdju7/jdSV5MxBLBcO0loK+MlTF8wI6w?=
 =?us-ascii?Q?N1Yxr69ZnitreJ79DbAjuyoOQqe5tIxZrzi5lXJOVdFyjfkxv4QnNc8W073G?=
 =?us-ascii?Q?uPTJPrNuj8GD8Eh93D57ambGwup78cn0SyzbXnQxZCloc+F8yFX3BXJDxQ9k?=
 =?us-ascii?Q?wOBm3s39/Vfc0eLl7zwM5uXgAGaxvjo4ZCGBYq7wWXoTcavfTu2VlbcOKl2U?=
 =?us-ascii?Q?ZZKXruh34XQEvI4nzomfAMuG6P0qZI636Tq3MstREBMZkrLiUmTnBR04wjub?=
 =?us-ascii?Q?UadVIjg9vCiUy6UWv7oMrTCEOXluDku9013jUdmeXcc5z0tU1nIZmBy0xE/Y?=
 =?us-ascii?Q?rO0FiMyEbZYQVZ7FAF/FJOpcQnlSZXhvjRNIkRNyG59JtA5arvABSpRawkZz?=
 =?us-ascii?Q?1jbtpHwB4UcZG9iikJfVM6KI+/rtaUWpEQ/8W1C6YYfeRM/3+oANXGTFP8HI?=
 =?us-ascii?Q?q+bjrofVOYr2b4E47Grs2fIUCpgzFnaOPfOApaUPloxz6XGV92nItyVVwlcK?=
 =?us-ascii?Q?Idq4qMTDg36i6yoQyBYm8vmRkO2OK0AVLI10frKLQl9A0XcH5InZM0Y9Rb65?=
 =?us-ascii?Q?N5sKbiE0dBYUm6TcHJoxvaduSZw0NA2h5fbUjgMneRonfiqavSJyOLqoB5aX?=
 =?us-ascii?Q?6oHmo4wIuFRc4sMEhqrxS5dJ+NMxfQcocvvSYLQRgiEQ6gobfFrW65gbXDqy?=
 =?us-ascii?Q?owiUevxXgdj+pSDkhECM3WuuMVrQIC4hFPjcWw71gzJjfm/n7jn1L+HYB/Zl?=
 =?us-ascii?Q?mzbiKRWwTBV78aV6k+tNA/312qDBtnfPO7j0W4Ftoqf1dX0M8/7RKWFWSrOQ?=
 =?us-ascii?Q?Rg8LfOUp7GYeULguHBEPtY0TAuNrUxbgkOkA0fu27MwSvlyGjIdN/r9Gdn85?=
 =?us-ascii?Q?Lx+UQdQWOudQcMEJ1uwLFTQ5dAPJUB/nLJZKjctwQGD+JOBIgrC6Z4II7p/u?=
 =?us-ascii?Q?EB49sO0TOhVv538WB+fLK6zzBHUhXCpLjGXdPxU8KZqW9/XBAi7BLmnWtcs/?=
 =?us-ascii?Q?qS1IlVPMLqJMMYTzYA51rTVMKJ1u44SVLJVMZai3+fX0+LONEjpLGsvygOXe?=
 =?us-ascii?Q?5VE5qQG1c2EjCrsNMc1M9SWUq4Hc/1b97ErBrbnIR8gtkXsoB+j085FZ9okk?=
 =?us-ascii?Q?dUIr0+DCAN9pBiMFtVxpTl0o?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a54e2c-8331-4627-79ed-08d90f936f08
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:00:14.9002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYC/2rts83GRgJHQciDzHQnkAboxJZNk+WPFNWqDXMSLdfRvry/uGOULZfL3IXrS0zY55hBI9ghMxYuwwPJx8Ex7zjPO851IseUJmo+52S0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.7.118;
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

Split fix_l2_entry_by_zero() out of check_refcounts_l2() to be
reused in further patch.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-refcount.c | 87 +++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 27 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 66cbb94ef9..184b96ad63 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1587,6 +1587,54 @@ enum {
     CHECK_FRAG_INFO = 0x2,      /* update BlockFragInfo counters */
 };
 
+/*
+ * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN.
+ *
+ * This function decrements res->corruptions on success, so the caller is
+ * responsible to increment res->corruptions prior to the call.
+ *
+ * On failure in-memory @l2_table may be modified.
+ */
+static int fix_l2_entry_by_zero(BlockDriverState *bs, BdrvCheckResult *res,
+                                uint64_t l2_offset,
+                                uint64_t *l2_table, int l2_index, bool active,
+                                bool *metadata_overlap)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int ret;
+    int idx = l2_index * (l2_entry_size(s) / sizeof(uint64_t));
+    uint64_t l2e_offset = l2_offset + (uint64_t)l2_index * l2_entry_size(s);
+    int ign = active ? QCOW2_OL_ACTIVE_L2 : QCOW2_OL_INACTIVE_L2;
+    uint64_t l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
+
+    set_l2_entry(s, l2_table, l2_index, l2_entry);
+    ret = qcow2_pre_write_overlap_check(bs, ign, l2e_offset, l2_entry_size(s),
+                                        false);
+    if (metadata_overlap) {
+        *metadata_overlap = ret < 0;
+    }
+    if (ret < 0) {
+        fprintf(stderr, "ERROR: Overlap check failed\n");
+        goto fail;
+    }
+
+    ret = bdrv_pwrite_sync(bs->file, l2e_offset, &l2_table[idx],
+                           l2_entry_size(s));
+    if (ret < 0) {
+        fprintf(stderr, "ERROR: Failed to overwrite L2 "
+                "table entry: %s\n", strerror(-ret));
+        goto fail;
+    }
+
+    res->corruptions--;
+    res->corruptions_fixed++;
+    return 0;
+
+fail:
+    res->check_errors++;
+    return ret;
+}
+
 /*
  * Increases the refcount in the given refcount table for the all clusters
  * referenced in the L2 table. While doing so, performs some checks on L2
@@ -1606,6 +1654,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     int i, ret;
     size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
     g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
+    bool metadata_overlap;
 
     /* Read L2 table from disk */
     ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size_bytes);
@@ -1685,19 +1734,10 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR",
                             offset);
                     if (fix & BDRV_FIX_ERRORS) {
-                        int idx = i * (l2_entry_size(s) / sizeof(uint64_t));
-                        uint64_t l2e_offset =
-                            l2_offset + (uint64_t)i * l2_entry_size(s);
-                        int ign = active ? QCOW2_OL_ACTIVE_L2 :
-                                           QCOW2_OL_INACTIVE_L2;
-
-                        l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
-                        set_l2_entry(s, l2_table, i, l2_entry);
-                        ret = qcow2_pre_write_overlap_check(bs, ign,
-                                l2e_offset, l2_entry_size(s), false);
-                        if (ret < 0) {
-                            fprintf(stderr, "ERROR: Overlap check failed\n");
-                            res->check_errors++;
+                        ret = fix_l2_entry_by_zero(bs, res, l2_offset,
+                                                   l2_table, i, active,
+                                                   &metadata_overlap);
+                        if (metadata_overlap) {
                             /*
                              * Something is seriously wrong, so abort checking
                              * this L2 table.
@@ -1705,26 +1745,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             return ret;
                         }
 
-                        ret = bdrv_pwrite_sync(bs->file, l2e_offset,
-                                               &l2_table[idx],
-                                               l2_entry_size(s));
-                        if (ret < 0) {
-                            fprintf(stderr, "ERROR: Failed to overwrite L2 "
-                                    "table entry: %s\n", strerror(-ret));
-                            res->check_errors++;
-                            /*
-                             * Do not abort, continue checking the rest of this
-                             * L2 table's entries.
-                             */
-                        } else {
-                            res->corruptions--;
-                            res->corruptions_fixed++;
+                        if (ret == 0) {
                             /*
                              * Skip marking the cluster as used
                              * (it is unused now).
                              */
                             continue;
                         }
+
+                        /*
+                         * Failed to fix.
+                         * Do not abort, continue checking the rest of this
+                         * L2 table's entries.
+                         */
                     }
                 } else {
                     fprintf(stderr, "ERROR offset=%" PRIx64 ": Data cluster is "
-- 
2.29.2



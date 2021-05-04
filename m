Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD12372CE9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:27:18 +0200 (CEST)
Received: from localhost ([::1]:49534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwxB-0000YY-4e
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwro-0003hv-45; Tue, 04 May 2021 11:21:44 -0400
Received: from mail-eopbgr80102.outbound.protection.outlook.com
 ([40.107.8.102]:61999 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrm-0006zb-4c; Tue, 04 May 2021 11:21:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2YezPd39p4DtrAw3LLkDDHKCQUT/f4B9XkQHHS9PM2E0oaAWVlM86CfFOg+eNRPs3dIwNFWM6gg4jzSwY/TdO+vNxBxrbtoAs+GNS3q9tdRkmPcMB2c3sp3WA+3iLWNz6fFnSlNS4i+l6YIcP9wDE7CgUZIlx23ne+syHW06Wejy4U4hIY7FgFWq6N2pjKgewzUJeMhaBeCD47lXaXO66H4ylIHQOuFb1T53iFyVEmp2/qYHPxjpaJVbcfsj8lt3AB4gB01NIPc+ob3R/hdWdfdsqNyaec+PKP3hfvHjdMoofYD34E0XX+jVYPr6nnThGRwOY++aSRQZDewd9niuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPNwmU4cGPIBfHqHmUWd4hamlMdVtRoFn8ns1B3tP6A=;
 b=cZ1+7r7x2OiogRljYR4l7wowE5z1BOQLUlA0GFOGrlKPobIMpm/r2qN+84fNUWRcU9duvdhZa36f0lsI7W3xG+j0qsHU2uezZbm51ond1Ahbism0XEeppANMCu6nQtmIg6z/XK7OKuOEs+i/qTEzunCYzwpYNDuF0LLidELTFXf+NouwkK+Pb70ON+Ji7+Dj4hWgOyHCGWeri2R7N8MsUoRbFLapGQJzay0jagzPOMPQia8SkGWJ1wVFjTm0FNdEjg8L5Ot5SJCCOvdRhMZNS/n61HDSYQtbtTk6emXcOTyUc/0YVO8Nco7BxXk8tBhZReW8kncqTBTvFOgBqkZYyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPNwmU4cGPIBfHqHmUWd4hamlMdVtRoFn8ns1B3tP6A=;
 b=N2ns5TQCqPqmf30wqRs9/H1ofzpOCoYxjpEpw+ocRcffp1akR37EwRLZNA5j0nvkW4izGrj93BkqgOt90vl7b/4nQk26e0QReIxD0ZrPomKtQqPiBlozm8u4cEiJtWederxWD6YjSB+KZbuPSdlWhvzwuVQQntqLHHDTAnwLfqE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 15:21:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 15:21:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com
Subject: [PATCH 04/10] qcow2-refcount: introduce fix_l2_entry_by_zero()
Date: Tue,  4 May 2021 18:20:17 +0300
Message-Id: <20210504152023.322862-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504152023.322862-1-vsementsov@virtuozzo.com>
References: <20210504152023.322862-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR0901CA0052.eurprd09.prod.outlook.com
 (2603:10a6:3:45::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR0901CA0052.eurprd09.prod.outlook.com (2603:10a6:3:45::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 15:21:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4499860-8dde-462a-643d-08d90f104b89
X-MS-TrafficTypeDiagnostic: AM6PR08MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB49168EC384EA3CD4AB1B46C2C15A9@AM6PR08MB4916.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2lxnuJqiCMql2TpIddIXfW8qybWPuwEnQ0eBcZA6+xF1uZGocVIJMwXowsEnIVY7ZQAA2ud/oTOQCYbdNwl5RUQHBEf4OKT1ghTqkGzyCjKuetHRoFe/xmCmlYsYr/PtM15lM7eqmGDhXtSt8xtSG1ucLCuYrixlMhbF/mmO4jFUSsoTzGkyPOjUYBDcEl8J4LqIpNKxHiP3Z3b2KLDmbcoNWuV4s5gbQ0SojeuE84q29Vzr5+q43ginV6fAWOBQ+smbBZcO84YwW90mYuuwW2cTjQjSgvJqMrgEV83Mqp+HnkR5dXt3M3oepzdKpoiv7+/fiaHiSzAOzd43y0z6V3nh9X2M9VGi7ftE5M+4RB/+u2vz/XRsmS4xHTAmWMrQp82GlXl5oIUAuP4CcIld8WtS2FbPtr3H/WZof+wpishHO8sSWOtkKhFh++5otYAaGbQrw/iZUya1Vfcm2sKvxQGoTLdqsT7OWNJzoB41OjNBmDa+pKwcNhN7dhDWRlRIFrarEZlh/v3RD4h154yEWAewEMWKfzjU0xKkhWR3s662LMDchxB+DO0AFbo+Eoys2ZmZgVoaYep8sO9zjX3wZk3WJiDYT8bWdJNRQ+OU82kO9nSAYOtdf5NZPaCEQcbpvrLIcrmfUiKq8Q0epkM/eawefX1NQjCcHhpLLtPr1KBHP56i35y/MDZD6k1rDAGP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39830400003)(66556008)(52116002)(6506007)(66946007)(16526019)(66476007)(5660300002)(107886003)(36756003)(8936002)(4326008)(2906002)(6486002)(86362001)(186003)(26005)(956004)(478600001)(83380400001)(6666004)(8676002)(6512007)(316002)(2616005)(1076003)(6916009)(38100700002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OUG0n8XLL1uOqpfRHcEDOkMN8+E5X9P7cgwxAZe/Ut4tWEBaAJMqyVgnG3yX?=
 =?us-ascii?Q?v4Ia3EUAEf0N7xa5xu2KVZCfTMs4+BE97GMRpBOa3z4SZqeen5zvOpfLYqln?=
 =?us-ascii?Q?HNp+mYSnzJcB26ag4TyHVwSDaHEL8cEBOn6/0y9p8DapDuEulR6WKNXAytbU?=
 =?us-ascii?Q?l899hRDvLfelK07AjrUAFQskMHZtNq7ilCrs9hUHv5yAuqsjNgMdkN7Dt0Ze?=
 =?us-ascii?Q?39PsDzH2+J90lVPEgHWADfzDXL5T2l9nrsuUIF7l/IeBseZz0XwoIxxsf+jo?=
 =?us-ascii?Q?dB5S8SV1lXyaNIywHkaiimIb/jz1S3vpJuOpkWtCldZWQslm3gkhJQf+gpEW?=
 =?us-ascii?Q?LAycKlm7Yl3kGQxV0aJN1zgsohJpHqy51+JuOgpHHC091Bf5KdcOlp4D+BnP?=
 =?us-ascii?Q?nCkpSGTPDam9bm+fdRS7FA/7903NP986aqgcG315PSu/9c3yYx+W6LQWGAb3?=
 =?us-ascii?Q?EqgLsikdQNNtHw76FqHXPA91iFtyldszclBQAneYLrDyz35Osx4JIm2HzNP2?=
 =?us-ascii?Q?/5CtVAnaXH5xGeV2muzZAo5168lNVBiTIh/pjun53pjVJ1FjrSxYrzFePgkF?=
 =?us-ascii?Q?FzYAEZ50gxNKNQ/HNtOhu6s7K5TNFuqlj9mw968fuWSqPf+lJCeE31BSk5Dl?=
 =?us-ascii?Q?v/GPRSUVuW8RiIC4sDMdADGpZGDjEOvXEXJtZfc6Fjry5OugKQZvpQy2ARb9?=
 =?us-ascii?Q?LQQlN445atLfsSv4bccI2HQR0xW//4SJ3/A8csMz7t7BugntjI35I/KumT4M?=
 =?us-ascii?Q?V68WzTLCDFzYjVydAJXfYrc9GC1jL0eC2ztQ2YxnvKYS8LNKRbGCpxuTNZ1H?=
 =?us-ascii?Q?Mf0ewpsqjuPVxpdItZlhHwz5umEra/UpFQHNAUp7wsSLybqSOiu6t0cogM++?=
 =?us-ascii?Q?IRjRrCiaJlOOyn8JmZt7kcXP1+ITFd8zLqFEhTp3+0MRZ6YCXTLtSbcNa1+6?=
 =?us-ascii?Q?7Up8Preem5hHfnP6cXuwBZCmeqiHPaF4oTDMeeW5jy5IfxWisDhEJbKOLWTY?=
 =?us-ascii?Q?I74FwYyTCNRgiPIES0/WVX80wnUVhm/o5zPre/Tqx7R0phHmQxtd+ZrD95Lg?=
 =?us-ascii?Q?D5DgKhfN9ahXrw75HaG0WPuZVRYubKNTrlGSoj3HaDz/jCYzNB7Dydariu97?=
 =?us-ascii?Q?D18BTa1JLHJzOZpVk2uCoSBIc1GSPiqr+ZDGhpC58SgqrrfsqcuJ1dmJHkDq?=
 =?us-ascii?Q?QUpPRuVTexMAM2rA3RwbUmiNQUfyH9yzcKRKM+J8jsXUSHa1jdr3vCf2q9gL?=
 =?us-ascii?Q?T6w3qW4ARFkA8Mks/PkwUwOLpU7UoYof4VpmVlSQy5bMYlZBFwcWlH+PuaWw?=
 =?us-ascii?Q?idsOznqI82RT8lLafpPyc/EH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4499860-8dde-462a-643d-08d90f104b89
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:21:31.2088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coDJ8PpcJRXQTkeVwU/4UqdECTIFQr/f25IZlN325Zm6qaTfnVD/EgDEIx/9VsLbl5BIiqng9T8cIp1+Sxd6RWISuNWTaz1kSTE2zSohGyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4916
Received-SPF: pass client-ip=40.107.8.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
---
 block/qcow2-refcount.c | 87 +++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 27 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 66cbb94ef9..f1e771d742 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1587,6 +1587,54 @@ enum {
     CHECK_FRAG_INFO = 0x2,      /* update BlockFragInfo counters */
 };
 
+/*
+ * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN.
+ *
+ * Function do res->corruptions-- on success, so caller is responsible to do
+ * corresponding res->corruptions++ prior to the call.
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



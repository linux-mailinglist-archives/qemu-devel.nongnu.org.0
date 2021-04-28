Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3436DC15
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:41:28 +0200 (CEST)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmJb-0007rt-Kr
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyK-0005si-FN; Wed, 28 Apr 2021 11:19:32 -0400
Received: from mail-eopbgr30098.outbound.protection.outlook.com
 ([40.107.3.98]:58735 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbly4-0001uH-V1; Wed, 28 Apr 2021 11:19:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdM5A9GjTtOLmDtSJm7pmDzBc2Jk3pGyQvZHnhc9c0/wplesbWyI9VuNx1E4lTYgXiu0OaIzEz87FTFFNwHgsTnKi+iN+fGxQm5izUQw0x0iXj02xcL7VIvMON/SnU0hGnuoW/aDlC9190US6m8MhKnnpYFVgSS7MeTVqfIb3tjgL2t3gHa1UsMgzBrobH74JPWrmZdBhRUeOLo/zOXyVUJOIUbNAn7lfQhNJuGvPuAnjJT3J9LpM90uLypumCVpL60B62CzeJD+M++a7KvohciRI4EtNZFJePDpB8M6pp7BXes4UHuBhBHl3eIyeo7/sHC6RjdoXG83HbOkVAbfsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/opdM+2EjB91gHAiFYBXDAsXHoG1SMM8aWWllXuo/g=;
 b=h/ha5gxKDbU3lmlwd42xZEAbjmfvYC4gM7L8P7dYfAehojSLfbncHR9K1859RwbuOFgczG0WzQhYaDu+SCICPUXKYwYUyR626JtCH59ofNiKhUzymrEgkrso3NUbANHHnEhSkFUL/YrkmrNxdvm7IGH8GmWcMr9AbheZfeGfR+6KHZrx05gAuasfhrqTagNtLkgZ7Jk8fid+jd6Z37IfktGqMeN7YajGU1uP3y/+ceENj709EBXuRBo6ETL1Riemb7mlPz++IVSx0NLlrrt1EqlcVtzoaqnvdFCmlJIWuA7eCu0S7BdRqCYKZHFxkfzTQLY7uiF0Q+wMegA0HpKBAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/opdM+2EjB91gHAiFYBXDAsXHoG1SMM8aWWllXuo/g=;
 b=WYwcW0FE+ii4H7W8uuxGJIJizeujfuGb8FUqKsqiDCEzUz1iW5svL93qtmBmR7AwInYkyBb103l79TX32TlmyelkXpmGXQOqc4kbKCKzDEhP50AXTdAx7qX5+pUUhqJypoWGOOKC3UC5DhIZaDQxXjxN0unu+ZVEetpke5zincM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 19/36] block: add bdrv_attach_child_noperm() transaction
 action
Date: Wed, 28 Apr 2021 18:17:47 +0300
Message-Id: <20210428151804.439460-20-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec2d00bd-d607-4e64-caff-08d90a58e965
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61516C1EECF17C63FDAE657CC1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gKRqPl/dB6QtcsmwRqzip62vkfi92cLuRIRrgGH7qtVuZGgw9cycBBxRcKxWMqF8c8NNl4yhI7E4kD5ZgAEMeOgqQam15ruIgsxsCyPJ2xXWRBHrffN79AsAK5k5HPR6VybbB6GTA3M1r3s/DNipAe5vhcFDRCqZghcWvieQOebKgbTmVO0vzQ1lBnQLNat/PTc4jeocYPxBiuhZnt49DIvoCC7WeckhGr9TpOCcKPXyZq1tvRr2mekv8Ik+5IrnWjVYKIrIcNa7jTt/hP6w9JjxZr04MfE0+7vhuETq5kbAGutf2sVqXAhyQzdj87NdKA2h8lbvDpsh1M8XRfHK2Ui8/t9GQBQBrP3kFJQizAxYrmjcr4YGPo+bKNmVT+WKwmJiHIY8uoBwGuG/mXwuSvqnGUFuVZLT8Pb0hz7kE/Ev4pHHu72B+0ttLCFBO+PMK5ychyJhtEGC3w42dtrIH4oNWC+9clFj5veVmpm3QETmYcpThrPUwBPfqmVSVcaIqgGt5m8tI83NXSls9pwZ9BZ6ZrgtxvE0TkfF+c0ALBj90BINboYEV/OWcDckxWQuFZaLKv2aNjKdL4GTyGOuoCw166MQWz6iTX3xPOZ4t9GTrJx0VtCu8Ps4oUYZ98yOoJnjpFleVuKY1AQH9CYsEsI2u4j3mTcPjXBrkKc4aqtSzodL/bpXMm0ca4G82UA2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bsOyldFqh3TJTjAQON/ZHOkjJz0G2iUwYJwExTTpGuBTuvtPtM5jEYrO+ft0?=
 =?us-ascii?Q?yYkn8PkBXmM7S0wUwj3QcUmC7uxVITsfuIP48q8kfUwfagBHkWpJAEdftQUc?=
 =?us-ascii?Q?FLC+0cx5cqmjRoPJ0qTIsDoMPRv01GzA47bpKkxqBaEe654VZE6n57L8mrkT?=
 =?us-ascii?Q?oRn6Y2PnDG/6LFisFFNV1ufPP0/pPMhfanfsq4sZDWGjEiJSqtQhRGcnvp20?=
 =?us-ascii?Q?sgNghBJ2rVCE5eSXg6ww/AxDIUT1kUl66f7UoSsPgEjxsjM20mrZZjV+0wFD?=
 =?us-ascii?Q?e2gvdfQbp0q8KsxInsb+Va920EXVdYCjls31Hq9kzHyLxcWtegU0abzg29x6?=
 =?us-ascii?Q?QrxG1gMJHDlnFX4lw8Ub7G8wcTQrpEFwv1PP0BvOgVZGeXawemYcvXb1v2fG?=
 =?us-ascii?Q?W2alCsTDGkwsrGFZKyljgBVi0czInADTl2djjF5OWUmJpTPjENZnYVENoEtR?=
 =?us-ascii?Q?tS7c3qrTNRpbiZvzUwh7mWvgfVsXbt1oZOg7ifH8qHq1XC3FCLILRrvgGuiE?=
 =?us-ascii?Q?eswuFNn5Tb3mfBNEdtO0Ptcp2XUiFhiQRPjEseJqnSt87jJAy4VY0mjZLY1N?=
 =?us-ascii?Q?HudmBc3IXz8Gwj/CouGMkza0S2CU+CZ21S/4WEqqlWtCsXA7HQzLkYp5zJkK?=
 =?us-ascii?Q?DYhQWag9PF7nEt0tncmCoVrmQPpq/cb2ppuE66+R2hfKlH5JT+iFdR5DCTIE?=
 =?us-ascii?Q?R2U2b4q1Fqwb/5FsM/nHDTOy6ajDXWSasH2bJKkeKu26XtSgAK8I1d3+ze5i?=
 =?us-ascii?Q?dus2VVhxrmAUsSsZMka5atC/1NaSllgFh2La68L6Bg+x+kmG5aTFtfOa79bG?=
 =?us-ascii?Q?a2xXQUBwo4I7I841NOrG4SJssg2h45/uKlyDyQiyi6nfrCJhoIjvPAaonl9p?=
 =?us-ascii?Q?RRzxmQPBLzIV7mJI7vApirf3VfxJGt11ybMqI7OfqHOuuaDpKzcIJapaqPuD?=
 =?us-ascii?Q?hoccTaZCRguI1ngdvp9f0i0U7q9E9W4FXSx8tVdCXoT0K8GY+6swWmwebnUx?=
 =?us-ascii?Q?yWpyqcpjw0MdEOm2ds2WPGt05B3aCsodR5IpI5c9Xt3Fj7TucGXfDURxzR9u?=
 =?us-ascii?Q?1652DN6CCud49gw395aqfebQKFEULW2u0dAKNjybLxby1QVosdZXgwCgp55/?=
 =?us-ascii?Q?D/NMQrT0pUOQ6lGYcCbXu/NzjfzSec/Uvm8miRdnLk+Uc/X6A5Wcn1/GnAJo?=
 =?us-ascii?Q?yAnRIImfyR+KkNG5VrPgjXGbqCYwdyz0PQ3wqkiNu23V8NbKPFogyqmezqaM?=
 =?us-ascii?Q?b6eMplIaVivxr+FRKPYRwCK//QAb3D9zquBDBBj2+MuzdrQZmSUHXfKGoAVZ?=
 =?us-ascii?Q?iK+m3JSjPlHYquEBQLlm/ylV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2d00bd-d607-4e64-caff-08d90a58e965
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:43.9943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tr0ZfVI/81PGmhsAnuYc9Xs1W1l70rn9rO24OeyKjMAeYNt1AaMj/Gx9k2wInd2uMoWMc+8UrctqiQemQ7nsbeI6WlltSWP/Ml92XlZWfvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.3.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

Split no-perm part of bdrv_attach_child as separate transaction action.
It will be used in later commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 13 deletions(-)

diff --git a/block.c b/block.c
index 4d5c60f2ae..c74e6e7cc1 100644
--- a/block.c
+++ b/block.c
@@ -85,6 +85,14 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
+static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
+                                    BlockDriverState *child_bs,
+                                    const char *child_name,
+                                    const BdrvChildClass *child_class,
+                                    BdrvChildRole child_role,
+                                    BdrvChild **child,
+                                    Transaction *tran,
+                                    Error **errp);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
                                *queue, Error **errp);
@@ -3079,6 +3087,40 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     return 0;
 }
 
+static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
+                                    BlockDriverState *child_bs,
+                                    const char *child_name,
+                                    const BdrvChildClass *child_class,
+                                    BdrvChildRole child_role,
+                                    BdrvChild **child,
+                                    Transaction *tran,
+                                    Error **errp)
+{
+    int ret;
+    uint64_t perm, shared_perm;
+
+    assert(parent_bs->drv);
+
+    bdrv_get_cumulative_perm(parent_bs, &perm, &shared_perm);
+    bdrv_child_perm(parent_bs, child_bs, NULL, child_role, NULL,
+                    perm, shared_perm, &perm, &shared_perm);
+
+    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
+                                   child_role, perm, shared_perm, parent_bs,
+                                   child, tran, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
+    /*
+     * child is removed in bdrv_attach_child_common_abort(), so don't care to
+     * abort this change separately.
+     */
+
+    return 0;
+}
+
 static void bdrv_detach_child(BdrvChild *child)
 {
     bdrv_replace_child(child, NULL);
@@ -3139,23 +3181,26 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              BdrvChildRole child_role,
                              Error **errp)
 {
-    BdrvChild *child;
-    uint64_t perm, shared_perm;
-
-    bdrv_get_cumulative_perm(parent_bs, &perm, &shared_perm);
+    int ret;
+    BdrvChild *child = NULL;
+    Transaction *tran = tran_new();
 
-    assert(parent_bs->drv);
-    bdrv_child_perm(parent_bs, child_bs, NULL, child_role, NULL,
-                    perm, shared_perm, &perm, &shared_perm);
+    ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name, child_class,
+                                   child_role, &child, tran, errp);
+    if (ret < 0) {
+        goto out;
+    }
 
-    child = bdrv_root_attach_child(child_bs, child_name, child_class,
-                                   child_role, perm, shared_perm, parent_bs,
-                                   errp);
-    if (child == NULL) {
-        return NULL;
+    ret = bdrv_refresh_perms(parent_bs, errp);
+    if (ret < 0) {
+        goto out;
     }
 
-    QLIST_INSERT_HEAD(&parent_bs->children, child, next);
+out:
+    tran_finalize(tran, ret);
+
+    bdrv_unref(child_bs);
+
     return child;
 }
 
-- 
2.29.2



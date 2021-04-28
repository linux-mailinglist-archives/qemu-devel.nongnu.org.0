Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D85636DC2D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:43:09 +0200 (CEST)
Received: from localhost ([::1]:38704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmLE-0001ld-CW
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxy-0005oZ-2o; Wed, 28 Apr 2021 11:19:13 -0400
Received: from mail-eopbgr70127.outbound.protection.outlook.com
 ([40.107.7.127]:16352 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxk-0001nK-HW; Wed, 28 Apr 2021 11:19:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yd7YXKSVHlXBZ+k711pXFZWuZZzVWpNkkp7QGx4CmhAFlLXaUBJdh2Tx+DxANFri3oyLoxoBvjmw4KMSxKzhEFaowE2tYcNJVISLFGdZg4MOKEPzHj9KnZA/LfzALlRDwPh1DUM3CYc9LUlgl+muF/YVv5xVUraOh+neQUS6fv/0nle4P43Z2yMiIVDmAAXAy5tyQYVanH8dWzbSH+Q7pJoZUsZAfNrpsskKMQ0+zjY8UYmQzCItaBunQkxXnj3M+iz1PnmfF0+hI7uJLDJpkp8FRhhYry0PPn89aV84IQ3maIsPfZaqzigGG8qmEakPlfeCFl5TsIOdwjci+BB/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0b4lqLnamQjHkw9DFm8n3jCG/9OfGl6ntPBs3klQTRA=;
 b=Qn5OyBT0ebfYl44I54a6p/6Js40k3hm2Alz/hYBnCa9otLwKS5Ek24UcvKrWHcMz6pDphWUld1D3wxnTJIazfPoMk5SReMfKKRJDysoXrJMtdQPVFLDtcUHW3mozX47tPSoZl6yKnifHFHPK0BXoXIi00mDTycBWLDljsFcUGnzgGmca7zTl+dqb4mI1fLNGq6CRlyvWs3PlkeuSfFwSBnkQEieCC0AnYKZchs9fK8MtsqYHjS/dt0H600iyPvDSCV34ox+uGZb/KZ3gxerk/qoySTzp9ZAfkRHj5GfLX1chUzPJChuxst8Cy/Szv3FiXZc+f+OTkQKuCVRntBjang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0b4lqLnamQjHkw9DFm8n3jCG/9OfGl6ntPBs3klQTRA=;
 b=IIJjr0xvpaWiz3kLo2qOtmpD70pIX18V6aqmHGvF8wqKm/FiVzOJFfZ9sMDJw1xM7ZjJ+wIf2CJq4CrqihbZFXyDQURnO4r29aT8CnT+OZHEvteNBKXpUmsSE/20km6BA/7Vg0SLwUKZLrMzl0FGvco01B913UWVYokA8GtwH80=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, Alberto Garcia <berto@igalia.com>
Subject: [PATCH v4 09/36] block: bdrv_refresh_perms: check for parents
 permissions conflict
Date: Wed, 28 Apr 2021 18:17:37 +0300
Message-Id: <20210428151804.439460-10-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb6cb577-da89-4a11-344c-08d90a58e27d
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5909063C85BB440B7D0275F2C1409@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1QRfqMBov75t8IrC2sMiejHHsxUXGWOfIttR4cHwdlMSB/pcbv6h2rA9GK2Fhle9J9OrC/jOhmwdJDOTxqkcxjJQ/g5B362y7P7xCzem12OoEl13Dst61wFoTNkoO84hL/wkqkCdq1bFvSpEMobYC2MCT26enVnOrfxRU6axEs7apPT42nXf5ZDMWtem71YebNQxgwnYqoNRnxNgLWyw8KTppJrpUNKl59UL9PQrt3v6EfOsGKAOldP69hiIV6aNH3win+wVRp33Uv4Xhqm/xRClARo3Mys84J+tSQzGmi0wBv93Og56l9HTlJTRBqIsuEjxuI0ztZNIHZm1l+W+x3HjzGy+d1ZdLFmDGe3kGdzMcV2gnrFGhn8gTOdMrGFg2/XDPPxdz0AUTJXPyeKV+eeuRxAdX723OjrUUF0zHpxVDpmkgbu3b7EL5YTD6+9pSZFfBMfv9uwNLNOFzUm3TzpHP1UWB9/EoNhsxL1xKNU1+MxM1bXYdSFO1SR/RX6XztVFTLN7djJwWlnTifEPyTF/j+o/2J367AZYxRJL5iuH+x0KPxwnfvQ7ynjmw395aZIs7faGp5NAIa3I35thUCFiFXIWevw2Q3boAOLJP5SgAl5HLyQ6/9IhsgKHkdDyR3GCNH+Sz5H3Stqe6uITv61wxzm4QB6YXSntgJ+uYv/d5Ng9nlDGRqIYD9sVi+2A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(396003)(366004)(136003)(8676002)(478600001)(83380400001)(8936002)(36756003)(5660300002)(4326008)(6486002)(52116002)(6512007)(2906002)(6506007)(66946007)(26005)(86362001)(38100700002)(186003)(16526019)(6916009)(38350700002)(66556008)(66476007)(316002)(956004)(2616005)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1MxTotvgFGirxs4hOODzBxWFtTFV15036AN1F66AN1aYIwd6zCXQl4UzojIj?=
 =?us-ascii?Q?i4WxiQWJz/m/lkleWR9ol6gh+6lPJ+QY7oek6RlgIScDHxE6lMVfj2ESopka?=
 =?us-ascii?Q?olb8vq/I5dgqwzIi7P8TEyG6sSfUkehmPkHZ2s4Ikc7JsZm/ACA7BqFeYWSi?=
 =?us-ascii?Q?aNL372gwn+7JuZx7VwX8o2rPsibATEv10hj0w8i8VUvbVu3y/asm7Va+JNlk?=
 =?us-ascii?Q?n421NmYcGOajnHTn0dWKyIZWe/+k442LQzc3yOS0Jm3jbCzV1zYX7CV9h2kz?=
 =?us-ascii?Q?jd2e2JWUqlghOWgqcQz1wm0QpJz/2I+MRj2otmisU6kb4OoImNsYRaH4orc7?=
 =?us-ascii?Q?aANunZzLNU8xjn3tUmfxngbTXfKGPB9f7VCncwx9ydUPXCbasNdyVahxR2+Q?=
 =?us-ascii?Q?piNZEzxU5SoJltju/yJIkP5Rp6pbjgTvJSU4GVOODUNCHwzC1JI5sRUsF6ZK?=
 =?us-ascii?Q?RufjSCdv6h5I/Koo/yIROIr8GSUeGsA+YagZZ0m1AbKIuuPLoFEYTd6+cAYZ?=
 =?us-ascii?Q?6/Cf1/bmt7/GzSOwhX1aMNZNVbH21GaeRiPh0Jv8qSjPy1K8nBZCXEvtuVHq?=
 =?us-ascii?Q?ArsddYDjNCTn1j9BLdzKFas5JjzxwFYRQFfyhFNQ6evE+pnO6M78b+a2VANe?=
 =?us-ascii?Q?+l/F/yto1REg8XaOZzzv2kDp+hWwydUJ8d3hJkdGe5ROFdEjrAEaVfqQ7MTG?=
 =?us-ascii?Q?FnLltJ34BjzICqD24bjP05QyWMnPSsHKII91HO0pqs9Z1UIxmA+kaO14Hr0h?=
 =?us-ascii?Q?Pv3EKZuzA6dFlIkEDq62j2mA7Y4MVeJMcKYXWiKgf+FVG/KgcpaClriCHuiE?=
 =?us-ascii?Q?U9fvTECwGvxIqj0pm6rUoTf0yP5QqIViSBqdMXVQkavbOuu846mpH1e9AehB?=
 =?us-ascii?Q?pIhaVN5ABvS0xElaVcZr5X5mr68OReYlA8Wu6Zi6xzrOKI+2863okRVGXrqA?=
 =?us-ascii?Q?2nvAuBnrEPzOOHr396cSHwyTp0PBggPADsNnFNKy2gcEKim7367BkFJLQP8s?=
 =?us-ascii?Q?Ug8AxnXRMoLe9DsymVKqCDgJZ14v7NTp16FAEI2A2mDgQRFHMKUEEOtvWcyj?=
 =?us-ascii?Q?COe3fPhRE5kt8PHVzysOtD6aMu7BBmKqD0cFhByaoKqVvYewwUZ/COmIomII?=
 =?us-ascii?Q?BypNUpqUEjC678EUABEl1KK2n6vodKz86EhujmrNglH9Z4oyuGiSXWEwojAj?=
 =?us-ascii?Q?c8r9NfjmA5zxgDAtkhMFkrqGTsGDYFJEclRsprW4u0LL+nkzCdK0KZIBE1UV?=
 =?us-ascii?Q?wQVdfT++wqEnO52D1rixoSBanyMd6J/xfW10R39BhVrRSGn5ugooxw+Xzb1L?=
 =?us-ascii?Q?2b+80yTYZ+CDOQZWccVFxLPp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6cb577-da89-4a11-344c-08d90a58e27d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:32.4245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXhUWMlaO9oWMScxw1vaujwWyl2t4riwdGo4KYAdOTYYe7n3ZQfwD7rH23sZR6EtUwboNWMbWVBUeQD6dkTc7J+0BAvD1O4upEJEld0CKn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.7.127;
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

Add additional check that node parents do not interfere with each
other. This should not hurt existing callers and allows in further
patch use bdrv_refresh_perms() to update a subtree of changed
BdrvChild (check that change is correct).

New check will substitute bdrv_check_update_perm() in following
permissions refactoring, so keep error messages the same to avoid
unit test result changes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index 34c728d7e4..fd621f0403 100644
--- a/block.c
+++ b/block.c
@@ -2026,6 +2026,57 @@ bool bdrv_is_writable(BlockDriverState *bs)
     return bdrv_is_writable_after_reopen(bs, NULL);
 }
 
+static char *bdrv_child_user_desc(BdrvChild *c)
+{
+    if (c->klass->get_parent_desc) {
+        return c->klass->get_parent_desc(c);
+    }
+
+    return g_strdup("another user");
+}
+
+static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
+{
+    g_autofree char *user = NULL;
+    g_autofree char *perm_names = NULL;
+
+    if ((b->perm & a->shared_perm) == b->perm) {
+        return true;
+    }
+
+    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
+    user = bdrv_child_user_desc(a);
+    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
+               "allow '%s' on %s",
+               user, a->name, perm_names, bdrv_get_node_name(b->bs));
+
+    return false;
+}
+
+static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
+{
+    BdrvChild *a, *b;
+
+    /*
+     * During the loop we'll look at each pair twice. That's correct because
+     * bdrv_a_allow_b() is asymmetric and we should check each pair in both
+     * directions.
+     */
+    QLIST_FOREACH(a, &bs->parents, next_parent) {
+        QLIST_FOREACH(b, &bs->parents, next_parent) {
+            if (a == b) {
+                continue;
+            }
+
+            if (!bdrv_a_allow_b(a, b, errp)) {
+                return true;
+            }
+        }
+    }
+
+    return false;
+}
+
 static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
                             BdrvChild *c, BdrvChildRole role,
                             BlockReopenQueue *reopen_queue,
@@ -2203,15 +2254,6 @@ void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
     *shared_perm = cumulative_shared_perms;
 }
 
-static char *bdrv_child_user_desc(BdrvChild *c)
-{
-    if (c->klass->get_parent_desc) {
-        return c->klass->get_parent_desc(c);
-    }
-
-    return g_strdup("another user");
-}
-
 char *bdrv_perm_names(uint64_t perm)
 {
     struct perm_name {
@@ -2355,6 +2397,9 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     uint64_t perm, shared_perm;
 
+    if (bdrv_parent_perms_conflict(bs, errp)) {
+        return -EPERM;
+    }
     bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
     ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, errp);
     if (ret < 0) {
-- 
2.29.2



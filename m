Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC92C6836
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:51:43 +0100 (CET)
Received: from localhost ([::1]:52458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kif66-00075q-8l
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0q-00019U-0P; Fri, 27 Nov 2020 09:46:21 -0500
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133]:13377 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0o-0003DS-6O; Fri, 27 Nov 2020 09:46:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FInYyMMAAYEMcFEzmZ2rOdQSvP90+QlHkCn/hFTRlSM7AAmwjsp3coI+zMA1Ffe1RJc1Jn4EHH5gByfSy6ztrmf9wFBZ5SUDuVgBTKrVLWKWA2kVWGaVjcTW8nudFH0ZZMaINWkJW253iWa7vspt7BdWq2qtFkI2c0Fszp+wPz868O6TovSVYf02zCYFFhXS+IvLxAjD01S4/YMiHm1FxaLfmT9ONWaOQQIr7bwN2U7l1K+nG5RiMexVyFY6FmkjC6ThgFo2slwcGd7WnMg5PZ/G7v2n1EO6IvKI6mtENeKogidGVJGnD+Cmvq8wyS7DdwAcp+KJj4is4CEb3intyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+nwm6BiwGwz7n5xFL+ZhtE6i+uFSKOf84EMaTTGtrA=;
 b=MJfkV/TcK8W0Jb3ma6FlO9Z87/Q8N7DRR3MCyd/BDDMryNjkboL4NU886uaVpEeWtPlCqXk2LJPsu27ZBQAvmT/5oYnabInKetTQ4wh7ElYp1UjTJhvT9JzeN0S9a3BUl4ajH1+vNQDSMXG8Jph8iKpWrqEmsnWlUlv9RVthvlOHXVFCmsMueNqdH19B4906r2kVvzJYD51+S147TTgjrh/JOANoaWDE66+U4daNYps27uQqsgpwczbQIH815qRkw7lJGTSgQURYmsSw16pJCtxrXVon7BD5Nhh8Q4Gb5mDjZXfwG0XSc5v0b4RzfSLRL8CG0VM3mdhml0pyUETzpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+nwm6BiwGwz7n5xFL+ZhtE6i+uFSKOf84EMaTTGtrA=;
 b=aqxxRnms7L8bAyqaV/hf60tPMU6MyMI9Zh3x7sTn+bVTP4fSXr7tHsLldz1uZk8yNktXnhpljG2HZ26XsYKtDWp0azyYIVpsH2yDojKnZWwV+14JYI2MLWxwt1kQsSh5pBz0HqjPNpyQJqNJSN436bXSyH1Qa7LElDC8K3b2q+E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 11/36] block: bdrv_refresh_perms: check parents compliance
Date: Fri, 27 Nov 2020 17:44:57 +0300
Message-Id: <20201127144522.29991-12-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70c98a9b-a6df-4fc0-c0fa-08d892e31f33
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078D0403D9394F2727245D2C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hCKsAY30Vbrou4EQaFu1/F59l5vMsysYNXut5LJaReWCm3Pe3UohMH5865JRpXNUrx409QO/8q7RpD/SLC4w/7g/1hOy5DzzlQVxzlQEET/M4B9Pj2ACw8OPSSsWZHyvve7FYfPmDcaH/6lICZh8Rq64vdfW5/DYl6FQVdZrKI4ImoGGqbaIzNnbDFXlv5erRt5BeJmhmLpQP7VazofXfaQw3CUc2moIoRRDVFvfzd7Vg8ND3JLfgdY0G75b0KaavvBsiPKJxijLdTHlL/X5ikUGzIWJtKvbyCrt5fwEFL/luwd2CE3M9hGOXaHplEXvHYt4K0V2hMjZe4Zbc8GjPBTaccAtD2E7KAkWfs7r8DEfQh5etDWQRTl7H7DjdV+Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AF5IWRzARvBZnIBYgpewVAkJsDW49/gNcGLGVpTtANmof2J1w+TIIBCdVXNh?=
 =?us-ascii?Q?QUd/SByZTLKbv8u3HnU+7EE+UbM0U5M0YZilnBgY0i/9mgem9xLomlIWRanF?=
 =?us-ascii?Q?p6vP/5aM0Hp0mD3ChoC0RlnfK21FsoQicXa87c1HBtmGnYeEDYZj8vUZRxZS?=
 =?us-ascii?Q?67t3vvrfRPynBsDlv8geeDkA4rcNqZIG058kTyYXpQza34LksJTkR0i6OUzU?=
 =?us-ascii?Q?2uVZ41JPdr4KSpmTVs1JAuqZoGt5Sg4hhzNfDomLnAVnw+MA+ej0WYHm2nZ/?=
 =?us-ascii?Q?G1UzCpSIZtBvsXqu5IzqkSpEVFiznYAd/gsBpk1I59mYzV4jEUxU5DosG+Sw?=
 =?us-ascii?Q?lh5yungtNfKQVDWd6QOfI11096Ae0aLdcJCCVR/q0Q8Nv/Wq0f+j9WPe2hK2?=
 =?us-ascii?Q?m+Cgy/U8KCyj+A6+th3EWyWjSbuOLVnGVh5PoiD4ETpIMohLz9abrTKp96FQ?=
 =?us-ascii?Q?FjOx9s8iPXf3YxvG6CJD67SroJajjbo+TYtEvWdRcIkjd7TblbTFiJerizWy?=
 =?us-ascii?Q?I9Rd/dR132+6Hwyf/cEbNZGip91NB9nVWJCWBwOVRj1Bd+V2h5vQP0Rs2Ev5?=
 =?us-ascii?Q?O6RHVitKNZW4oCXYVWVKB9yclwWZhwgKJH3HxoeUiATBRm+oM0vrdeXj1klf?=
 =?us-ascii?Q?r2A7xu32yvuRxsGhroAG0QBoXZoNS+g+joRt7+w1vYB69V7TxXr5RjQH04R7?=
 =?us-ascii?Q?ShSzYvloOVEBEZd66I74FTtRIYtpY5+fIb3hEGeqsrs0uJYCsKQBboa/yd8E?=
 =?us-ascii?Q?wHyGTgqp4JQiXSlz90yRyWPoLqmMXIzUq4UfiblpwpOFZY1Xc4fds8nvIqJG?=
 =?us-ascii?Q?Z/nRcT/gFiimH3yxy+d8rB80Fj7GIWrWMXyTfg6Ig/WZ4fvLWxKls8vPwka4?=
 =?us-ascii?Q?B8tqkscN0i2ZC9hj9rfkpPkjnd4s0VvnW3GOteemyr2Bsi/kOeMzY2UWKl+e?=
 =?us-ascii?Q?ghhmLgosAF6l2kNr45SKqNED6O5Ae/hdxYOR+jyg/In7/LfTm0fT6BRaTTda?=
 =?us-ascii?Q?LrTt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c98a9b-a6df-4fc0-c0fa-08d892e31f33
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:45.3135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEsq1JX1vgrxrB91O76glpePHxq1mjsKSpmDYCSEduxioCrz4NqchNrePgt0vIegNgGuC1G20PmHleuFHmrXp/9VPFPp0Wy9j14SqKT5QK4=
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

Add additional check that node parents do not interfere with each
other. This should not hurt existing callers and allows in further
patch use bdrv_refresh_perms() to update a subtree of changed
BdrvChild (check that change is correct).

New check will substitute bdrv_check_update_perm() in following
permissions refactoring, so keep error messages the same to avoid
unit test result changes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index 29082c6d47..a756f3e8ad 100644
--- a/block.c
+++ b/block.c
@@ -1966,6 +1966,57 @@ bool bdrv_is_writable(BlockDriverState *bs)
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
+static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
+{
+    BdrvChild *a, *b;
+
+    /*
+     * During the loop we'll look at each pair twice. That's correct is
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
+                return false;
+            }
+        }
+    }
+
+    return true;
+}
+
 static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
                             BdrvChild *c, BdrvChildRole role,
                             BlockReopenQueue *reopen_queue,
@@ -2143,15 +2194,6 @@ void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
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
@@ -2295,6 +2337,9 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     uint64_t perm, shared_perm;
 
+    if (!bdrv_check_parents_compliance(bs, errp)) {
+        return -EPERM;
+    }
     bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
     ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, errp);
     if (ret < 0) {
-- 
2.21.3



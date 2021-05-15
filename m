Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D85381935
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:55:15 +0200 (CEST)
Received: from localhost ([::1]:57316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhul8-000846-Tp
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhudo-0006gs-8p; Sat, 15 May 2021 09:47:41 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:8323 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhudl-0003EQ-Kr; Sat, 15 May 2021 09:47:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7mCcAKN6uzQEN5Cq/PUaFitopIEOQPBMUeRrjVC4fuMMwU45JVgsu96Pr13BhQ6rHwQyIfWS2DYON6AuqaqzRvmMNGN4M8XkvWNGX72xXzCpNNJESCikWdz0f9fjzQi/U73H7Rje05u8IvjOx6RlorVndZCEgERQi6ZP7LBeyPFQrcDnCMy9sWNEbQNqG5XdwepX6SoI+hN+fV9xoEQVQeOafle2e2R1/gvoD9YTfkKefv1kNwr3JzbpWIvX1cFdOKvuxyeP2f9wvoLPXHKC10PRjZ4fKEjm/0nEcsZDiF7P9Mp8lxnFw3aeu2owS+9xxK7lmHr9W+WI0E0fHYLLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RApT55dbQlcsx/Tg3sxzzoaJSDnAczHakZpEfREpong=;
 b=VahxpANGwi72MMlv8XDoZv4QEHu5GJnENrwta9HiHS3B/K/PF2yuZjqhtnbBF4P/gdVzkt0/EtmNC0TPYNszJQ2yh9PqFZ5RAK311PGArCR6/2UUlOujfDuXUlS7pdaT07JzfIWKaUnRrDHUcYdz7zXtBwttgNJQRSQC6tc8GEJCSrei1JLtfkGUi/TjSBJ8KNmms494UJDDgOxwwvdn6VmgMSRppWfySbm6taSeiLUH+lGfpPkekOsJjfG4OZSGyeBydvn6LqdSp3hFGisxhre3PnM91Eeq7u9m9lycaFI6gSm5LS86HRlAKS+CSPt8bkVZbGON3KrlIBzupWRCRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RApT55dbQlcsx/Tg3sxzzoaJSDnAczHakZpEfREpong=;
 b=RhDQhWDSpzpKY07wl4AFgE9hBmmWMN9cdCzwzXJBYumj4kVKtSxXO3XDpqRzcLh1kRqrQ0GUSUkqprmpS/Y3lV8MvtdPcu0uMOd0vKurHTy05pO11d5pRByFPnH65SGbADPJWouH5GW7cupOQN1mlr29Ef8NjAh6fUxD38wSWJ4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Sat, 15 May
 2021 13:47:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.029; Sat, 15 May 2021
 13:47:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v5 2/9] block: introduce bdrv_set_file_or_backing_noperm()
Date: Sat, 15 May 2021 16:46:58 +0300
Message-Id: <20210515134705.433604-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210515134705.433604-1-vsementsov@virtuozzo.com>
References: <20210515134705.433604-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: HE1PR0101CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0101CA0003.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Sat, 15 May 2021 13:47:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b80e662b-77c8-48ac-dab0-08d917a7f930
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB520630A951358CEEA724DDA7C12F9@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lLv4H/q1Scn//kSLfVhdQx0bg9HMVFXjCSlA1knCR+in+C1enI/ZF4Ljk4Mrf2MYpu60td1lf01G2eRyK26mz3iEeClwTO8b4+jK1Lwmllt16A0MVbI200QsSu7WTkzGZZS4xP4LIn3Xs8/cRM29ycdfj6cdkTrwVt2krf65z+5j4PAErlk3xu4Hl2fIbECidqTCiJkgwKolIXKdZmtIMtH5np81w/WSo79dOXLv0Ics/2qAdiMXIu+Sd9VjZz93hRYKNilAO0mcKNnO6yEWittLyooyurbs3vYjeFev2gaSeXUR4b7CGxvEa9APwbC1DGjHMJuSczNQF2+SuuS0kixnuJD8VW49N5ul8YZCWAOQ5fKl1fztb46HIDSLqTYc9vB68bglHVAMarCavau7lme1j5/35xjcJuyGFCVQts1GKKNfYLbBKlS8LeiH+Et47Wu4sYzWOk0iqu+u/F60unRzheL+oZ26vbtzbVb5wCR92LQHkygQuV88MarrDLdyoF1jktnfuQj8AOLHJWFSnNIVgd131yygniFGqgi69pQ90KoWykkJXJy/0PmYoqIDQB8X80dp14xETw5E9XYKPGDdweojtHI8NWnlR2IrULL9gwfELiFhJeniFqP9YEKnhAcT0vhHLBjopRq7jFLzz8bpbj00QcaFownMuF3mzb9ISZzvWNZqYPzmE1XqddyU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(136003)(376002)(366004)(6666004)(316002)(6512007)(26005)(66476007)(66556008)(66946007)(6916009)(2906002)(38100700002)(186003)(16526019)(478600001)(107886003)(38350700002)(956004)(52116002)(36756003)(83380400001)(2616005)(86362001)(8936002)(6506007)(1076003)(8676002)(6486002)(4326008)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?do6xMoIFC3BxUauGe2nQvnWp0T73VvBo29fwvBbgW5qzwR0uV7TrnXEKNfSU?=
 =?us-ascii?Q?eQcA56XujzabvL4op9juDluxZLrn+qxZIIXNKmuRrpNqszp7ISxt9+jVGill?=
 =?us-ascii?Q?BenTkFnCI/wCx9SdXk//0u4GhrDiRZA8LOq7G65IihxystXOWEeLsYnfJ8v9?=
 =?us-ascii?Q?QrEbgSugMKYcPwBkHDYAh67SKIhxwMmp8t4HJVfVDoyyCsjJWyVDd/ke4reA?=
 =?us-ascii?Q?Tn3zS7c0OsW6ZUa2h9wO5AoklDjVQF3vAHIK9Z4trjKRLe88X2l8V9hv3uCh?=
 =?us-ascii?Q?n9r1uqI/E+lIok4x9aYqU4CqQ/EHs9iiH3cidVu9fpvIqbPgebj/3Nfmm46v?=
 =?us-ascii?Q?iXkVJmjNzaiHnib7zLca+E/ldNPZX+U97Qb6OUHu81yHvRBIA48hvZwY3mZs?=
 =?us-ascii?Q?WZLSFoiBp/Amph9WBEvbMnUq2InU3Kp0SFCnquEz9VrEsOQ/IORAnnY9c427?=
 =?us-ascii?Q?fRxz8o7zoa2Fh1h8eFWTiRYpzGR+IETe5T+pn0dSE9PJqyoopeGtXAixFkEj?=
 =?us-ascii?Q?E7ZdGZlLK5gwLvaQeYHFYISjmjD7RNd1dNfz/sooUhNCVxIJ+YJic/nkn7PO?=
 =?us-ascii?Q?4DgXEWAm5DsDsouWZnYWh/kA/e9FP7pjUh67j4XVanN11CzLCRSvdHZjJbah?=
 =?us-ascii?Q?wCE7qyDyjR7afGRwcdSNRQZOvXFkfZxPN/4eEGOzQIBDm+fDQTnktz5e9A+j?=
 =?us-ascii?Q?ypa4XCU/rK3Duk6p7iquBuXHlBEj/YMrhDqrsXvxd4q4mBEsS6eVShHlTtfH?=
 =?us-ascii?Q?GWAXzoUu1gEhbeeyy0/pCqWl7EN9Noc4wmpGgnvbA5C99kPx3IVbom8BVCDD?=
 =?us-ascii?Q?Qms4jKcmPASZn1iHcs+emaEDMc6Kt99G22p+ThxjwU7mQ3Nne87knui4gcZq?=
 =?us-ascii?Q?WGWksE3t/nobuhVg1d3Y9GGvMj6JI8LiquJWNKct8iej3GALV5n4k4NMjviD?=
 =?us-ascii?Q?yaBzqLjbznKAWIfNIlUwZLUt80JNtV4QmpjjbhmRS9PVKO2mI30vl5nmYXdJ?=
 =?us-ascii?Q?3XjRwV5IK4sPNWUpI5yLeE3nBJOFhkZgfInOci/kE3mluBeqkLnEFAE5OeLC?=
 =?us-ascii?Q?zLOD8vMVe+hwYQI09B8u2hYFySkRtP0e035rFMNhBxUZiPly7+x5Q3vpTfWP?=
 =?us-ascii?Q?HgmlAWSpKgRiOCxuvqp4zme66wfUDkAUE9YxoQotFVaGj4mMTbC57UJCt/nY?=
 =?us-ascii?Q?KFvenCXL2QUbOeeYYiZAIlVgN43uByQKrBabGYOuVKb4jcH+CkmmMV81/bPM?=
 =?us-ascii?Q?j4wr/U+CVds/BGCJy68GqSfr7h+y7k2mKxSU/W2w0xG0REpEYCIXgCjtNVrp?=
 =?us-ascii?Q?mNM9y9iVlOmgaNF4ZyHSkOR8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80e662b-77c8-48ac-dab0-08d917a7f930
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2021 13:47:25.8675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMOkgHmQxivEQ4Dsm7ayuof4Oq+Gl5s47HRKha9Qr39WyYTP309LCSewBvNHHk4MOmoSdRszlr2qL/RT151BGXUZEicnjXLUfi1V8EkfUjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
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

To be used for reopen in future commit.

Notes:
 - It seems OK to update inherits_from if new bs is recursively inherits
 from parent bs. Let's just not check for backing_chain_contains, to
 support file child of non-filters.

 - Simply check child->frozen instead of
   bdrv_is_backing_chain_frozen(), as we really interested only in this
   one child.

 - Role determination of new child is a bit more complex: it remains
   the same for backing child, it's obvious for filter driver. But for
   non-filter file child let's for now restrict to only replacing
   existing child (and keeping its role).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 83 +++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 63 insertions(+), 20 deletions(-)

diff --git a/block.c b/block.c
index 75565ce4d4..5141c04815 100644
--- a/block.c
+++ b/block.c
@@ -92,6 +92,9 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BdrvChild **child,
                                     Transaction *tran,
                                     Error **errp);
+static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
+                                              BdrvChild *child,
+                                              Transaction *tran);
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran);
 
@@ -3094,54 +3097,94 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
 }
 
 /*
- * Sets the bs->backing link of a BDS. A new reference is created; callers
- * which don't need their own reference any more must call bdrv_unref().
+ * Sets the bs->backing or bs->file link of a BDS. A new reference is created;
+ * callers which don't need their own reference any more must call bdrv_unref().
  */
-static int bdrv_set_backing_noperm(BlockDriverState *bs,
-                                   BlockDriverState *backing_hd,
-                                   Transaction *tran, Error **errp)
+static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
+                                           BlockDriverState *child_bs,
+                                           bool is_backing,
+                                           Transaction *tran, Error **errp)
 {
     int ret = 0;
-    bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
-        bdrv_inherits_from_recursive(backing_hd, bs);
+    bool update_inherits_from =
+        bdrv_inherits_from_recursive(child_bs, parent_bs);
+    BdrvChild *child = is_backing ? parent_bs->backing : parent_bs->file;
+    BdrvChildRole role;
 
-    if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
+    if (!parent_bs->drv) {
+        /*
+         * Node without drv is an object without a class :/. TODO: finally fix
+         * qcow2 driver to never clear bs->drv and implement format corruption
+         * handling in other way.
+         */
+        error_setg(errp, "Node corrupted");
+        return -EINVAL;
+    }
+
+    if (child && child->frozen) {
+        error_setg(errp, "Cannot change frozen '%s' link from '%s' to '%s'",
+                   child->name, parent_bs->node_name, child->bs->node_name);
         return -EPERM;
     }
 
-    if (bs->backing) {
-        /* Cannot be frozen, we checked that above */
-        bdrv_unset_inherits_from(bs, bs->backing, tran);
-        bdrv_remove_filter_or_cow_child(bs, tran);
+    if (parent_bs->drv->is_filter) {
+        role = BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY;
+    } else if (is_backing) {
+        role = BDRV_CHILD_COW;
+    } else {
+        /*
+         * We only can use same role as it is in existing child. We don't have
+         * infrastructure to determine role of file child in generic way
+         */
+        if (!child) {
+            error_setg(errp, "Cannot set file child to format node without "
+                       "file child");
+            return -EINVAL;
+        }
+        role = child->role;
     }
 
-    if (!backing_hd) {
+    if (child) {
+        bdrv_unset_inherits_from(parent_bs, child, tran);
+        bdrv_remove_file_or_backing_child(parent_bs, child, tran);
+    }
+
+    if (!child_bs) {
         goto out;
     }
 
-    ret = bdrv_attach_child_noperm(bs, backing_hd, "backing",
-                                   &child_of_bds, bdrv_backing_role(bs),
-                                   &bs->backing, tran, errp);
+    ret = bdrv_attach_child_noperm(parent_bs, child_bs,
+                                   is_backing ? "backing" : "file",
+                                   &child_of_bds, role,
+                                   is_backing ? &parent_bs->backing :
+                                                &parent_bs->file,
+                                   tran, errp);
     if (ret < 0) {
         return ret;
     }
 
 
     /*
-     * If backing_hd was already part of bs's backing chain, and
-     * inherits_from pointed recursively to bs then let's update it to
+     * If inherits_from pointed recursively to bs then let's update it to
      * point directly to bs (else it will become NULL).
      */
     if (update_inherits_from) {
-        bdrv_set_inherits_from(backing_hd, bs, tran);
+        bdrv_set_inherits_from(child_bs, parent_bs, tran);
     }
 
 out:
-    bdrv_refresh_limits(bs, tran, NULL);
+    bdrv_refresh_limits(parent_bs, tran, NULL);
 
     return 0;
 }
 
+static int bdrv_set_backing_noperm(BlockDriverState *bs,
+                                   BlockDriverState *backing_hd,
+                                   Transaction *tran, Error **errp)
+{
+    return bdrv_set_file_or_backing_noperm(bs, backing_hd, true, tran, errp);
+}
+
 int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
                         Error **errp)
 {
-- 
2.29.2



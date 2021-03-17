Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9066233F3BA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:54:23 +0100 (CET)
Received: from localhost ([::1]:54232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXZ0-0007gg-Ga
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI0-0004qV-2S; Wed, 17 Mar 2021 10:36:48 -0400
Received: from mail-eopbgr60091.outbound.protection.outlook.com
 ([40.107.6.91]:41454 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHs-0006rZ-91; Wed, 17 Mar 2021 10:36:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NidSdjwQe3XwCzbc+ECvM1WRNBJJW06q+oQ7QsS9NaIjlyfHN0/ro+p5NInL75g7Kh44grxsZQluK5Cil33R/LlZQ2yICE2ZH3gxO4pSCTyvDjwIyUCgYVvqgS1X503SfvCtufDu9qSqTMC7Hmf7vt4KZ1dGetuYQk/6Mdu+eJuRHrwRteeHdFJ8c+4pJO480aHiz6WKQbyrus92kfsYTJjl96lnJIrvqucUMRGkgYrQi0FINtqEOYc5Ey04l0cMh+ZLklQqM+qLJ34Dk46OcQ2/IAZeGcq5Q+RwYcCHvLCBlHTF3bJ/HQwqqkFHTR1EqiY+TuU435GTWGhFpEDj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4Fs1WuSS4BueqdtQrH1FaySCtsWpZsegFxdtZdJCj4=;
 b=JV01A9Z+UK3r3lHvP7/lUNEIoAHgdUfs6tULgEA3d+eBsXTsBOFLDPWJfniTFKJvNJ+5TS3moGh2OsrdrRwnolMGpcJ0u0mRrR2rPosY3eKvZpveHMhc7KIE9xrnilPPcHk+/odoEfimvtCKnFOMMI+vgQp+X38PPUqhnSgdaL9rUF200YN+aD18gqfR9zLIDcPG1Gs2r4TaukhvL1laGxc5TwKsfo3AZoxVRqdK/1vonSkLSfTI7CHiDTbKtyFoO9NiBKSzTXAlUE8Xf3UKb26zTRMEenibI8//AS6vb2AoJreh1sqEq7TY6J5D9wl5nu0F5OSbfNzxb4Qp4B74kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4Fs1WuSS4BueqdtQrH1FaySCtsWpZsegFxdtZdJCj4=;
 b=cBfgy467q691c1pTpknnFcMMklQNUy3pTQiC5g8X/8M3dyVyd72/8A0OOtOZhxZsOSe/0RbxOddHKOo/FONiVGvdsPHbVxtdkdJPL96Goe2bV4M61lehi2clm90petCFIVugZfi/XqGMM75ZY8wlRc8+kF68Sv8ISV32QHMsWcs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 20/36] block: split out bdrv_replace_node_noperm()
Date: Wed, 17 Mar 2021 17:35:13 +0300
Message-Id: <20210317143529.615584-21-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4882080e-21e6-44c4-6388-08d8e9520ec9
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35448E52E2E01CF678C2163FC16A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gL6uNR51ddtxDGPewYO6wH52OS1qT217pKpoKkGkn1/miTw1xy1jIkISx1xD4RpX+Y2qcpy8qXvrjQ7T9814Nbnw0gXyR0Qu7pKu7Pvk+A/AihAZUuZy4AJvQ2QJCjr78RK1YqH9dAC4D5uqjntaOsHKHztDh7ejEwRwmx+td1pWvKl026QPEB/LVq6kBneehN62TQv/VbAAQWaYPtuXzM5Sb4zUn7kXhfpobPklEggSjGz7djTGn8OCxwv3goynIBRQOfAC9zX+/6UsTeHkblCG0XTLO4wQqOoQVywItSaQGJ1SK4TYsqEMaGorXQfcOjY3s0jTq5oBGmM8pufyzXxiCHW+Wgf6O2ZmIk0MbeTfsEK065tr1SbrQBXPp+N3tt/Z8JSTf04c0zWDxpB5MLyeS0AsFsjXftSTSzWmPxmFJyGdoZccKs5mE3Ju6Efz2VG4QF1wEYZ8f8wGgMQgKgxV7XO946cjgWkAfTro670wBdbc285TtNrwl4oSPvyYcZU6TEX8wlhas0fIWFOcTfDa4exwOpCShLOz9Ne9nzcrYmj9FNw3aT0uZfxYFpfoqkNVLQ4nyJKYaZWPcy9QXz482251JZCUG5eN4DwPpLCOU3cbwqQ+q4ordR/VmVbq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(186003)(8676002)(16526019)(26005)(86362001)(1076003)(52116002)(36756003)(6916009)(66476007)(6506007)(4326008)(6486002)(2616005)(5660300002)(8936002)(66556008)(66946007)(83380400001)(2906002)(478600001)(956004)(6666004)(69590400012)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?O/NnEd+GzwA++Mnq2f7nfydxeGuAdamUf+fSuuo3+nX01tJSSUaxUa1J9r76?=
 =?us-ascii?Q?nSe5C+VhUizE49wHl9eGSNgRJ4w39WDEeFchxleRwlvxIjU96L70YNxy/BGU?=
 =?us-ascii?Q?x5zTYG53DSAQnytbrk+W8bdmVl1RrkZsNbyvT+muvvPWWV8SZPexPf8TDLLo?=
 =?us-ascii?Q?M3GFLf7N+8LTo5sZBp6UGYkYyyNygLKSyjukf5k64tj2LbCe7Wk7QGoBcHvM?=
 =?us-ascii?Q?Gz+DJOeZMol2npCAkQgL5wQiCoJ0l+aGJ/XmfQSpoUR3VC0J+VEERGrzK3Ft?=
 =?us-ascii?Q?LgKvA/0hUDXddlZYubdcqumUOyM5mYhpPCmR4evNbN+bqU5zys7wZOT9ItVv?=
 =?us-ascii?Q?0FHVtJwWnx5VvfBQIe/KwSKtJmnKoipPVppfHH1yNW+7aGxUZrlPPeCarb3Y?=
 =?us-ascii?Q?h/eZre5N4NEcZyv5xlPye3lBSU2yYx/1MgP99pU5sMnyqlh2gznpCJelHUzI?=
 =?us-ascii?Q?9MmzdW5lcZdJO4HQeJfwMOzRpNes0Il4HAnNPmRLNl5cV0fcN+6cSS3NOscW?=
 =?us-ascii?Q?vpVe1cvTxsl61inFrtKpfEbRtfjfA88jShAuR96tuA0fqNKyAjhbqKuU6D1F?=
 =?us-ascii?Q?wXidZeo/oXHhB7VLc50/9BMPQm0FaOaFIVCx77hMB1YtNY/FTABrPD29Agup?=
 =?us-ascii?Q?OyCviEicGZw467Gw4jO34N6Hs0WC8ys+qdNRFzAFzSkyNrX7/kvDXRfD4Myj?=
 =?us-ascii?Q?IhI9aVdGl6Sd7aA1DlyQHDej+U1rX5O50fsmF/CVl9RiTRB3boqXzuZ0KfeX?=
 =?us-ascii?Q?diGE8EWb4YLhKQRGtnwWiACkXl9Rsar9cCaFG6Be0d/Os0cKDLQSjUEvYKGv?=
 =?us-ascii?Q?KowZcVoJDyeB1V5cYy0UpaG3ENg/4bJM/w+f6CJnUpM4XSL1Pbm9ucirBJP9?=
 =?us-ascii?Q?JFB2jbBN0BIp60p71+FC362W3rVvPxqHD5O5o2yPNKC+yzHV1R4k59441Pz2?=
 =?us-ascii?Q?QUFrDYMyu/lenlVYDK5E9MUCZEKyEzHWmFMUAuaxnyNolo/Bx5VSh+IFJPTn?=
 =?us-ascii?Q?O5ktJzvTOO6aqLkBVzYsUMwSgdmO1/fY9tr+q83Uj27dNzNS5DNhB9RlGl9x?=
 =?us-ascii?Q?anxDYkmJsVYvHFwbVBgWe0QHL16o910JGWJF+44EI0tfR/t0qzd6hxfmvRiL?=
 =?us-ascii?Q?6gTr5vlHZPNa+dBTybVloeVfj5Aa+N/P7ZRsnivzxCnDL3E7JSjeGGcEBBM8?=
 =?us-ascii?Q?GJEKJtoLvSgEpp5dBj3aFn0dO8ioc/l7HhY+4rnwhBCJwVy6sTPn0yyG0/4f?=
 =?us-ascii?Q?25ft1AE4DSWieOj9e838iB0wg5XNwVd365fStkC7wUzCHmvUohNnnm4162vS?=
 =?us-ascii?Q?dvY9nvi2NfOqBduzh/Ni6pdS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4882080e-21e6-44c4-6388-08d8e9520ec9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:31.9267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5i+w/KVhnMZtikRN0SXxmD7lhJU69f+fx9XMicQ6PJHSOnXzvW7GcVGkPQ2IubxpJu/9NgiUC5R7Bu9Fu1r656s6sD9gUCY/umPW1d3I3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.6.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Split part of bdrv_replace_node_common() to be used separately.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 50 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/block.c b/block.c
index d810915684..433cae1181 100644
--- a/block.c
+++ b/block.c
@@ -4956,6 +4956,34 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
+static int bdrv_replace_node_noperm(BlockDriverState *from,
+                                    BlockDriverState *to,
+                                    bool auto_skip, Transaction *tran,
+                                    Error **errp)
+{
+    BdrvChild *c, *next;
+
+    QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
+        assert(c->bs == from);
+        if (!should_update_child(c, to)) {
+            if (auto_skip) {
+                continue;
+            }
+            error_setg(errp, "Should not change '%s' link to '%s'",
+                       c->name, from->node_name);
+            return -EINVAL;
+        }
+        if (c->frozen) {
+            error_setg(errp, "Cannot change '%s' link to '%s'",
+                       c->name, from->node_name);
+            return -EPERM;
+        }
+        bdrv_replace_child_safe(c, to, tran);
+    }
+
+    return 0;
+}
+
 /*
  * With auto_skip=true bdrv_replace_node_common skips updating from parents
  * if it creates a parent-child relation loop or if parent is block-job.
@@ -4967,7 +4995,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Error **errp)
 {
-    BdrvChild *c, *next;
     Transaction *tran = tran_new();
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
@@ -4987,24 +5014,9 @@ static int bdrv_replace_node_common(BlockDriverState *from,
      * permissions based on new graph. If we fail, we'll roll-back the
      * replacement.
      */
-    QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
-        assert(c->bs == from);
-        if (!should_update_child(c, to)) {
-            if (auto_skip) {
-                continue;
-            }
-            ret = -EINVAL;
-            error_setg(errp, "Should not change '%s' link to '%s'",
-                       c->name, from->node_name);
-            goto out;
-        }
-        if (c->frozen) {
-            ret = -EPERM;
-            error_setg(errp, "Cannot change '%s' link to '%s'",
-                       c->name, from->node_name);
-            goto out;
-        }
-        bdrv_replace_child_safe(c, to, tran);
+    ret = bdrv_replace_node_noperm(from, to, auto_skip, tran, errp);
+    if (ret < 0) {
+        goto out;
     }
 
     found = g_hash_table_new(NULL, NULL);
-- 
2.29.2



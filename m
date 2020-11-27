Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ACE2C683C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:53:28 +0100 (CET)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kif7n-0000ch-UG
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1B-0001Jb-A2; Fri, 27 Nov 2020 09:46:37 -0500
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133]:13377 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif19-0003DS-Dj; Fri, 27 Nov 2020 09:46:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoGilyvn5h5gDwYvd/zVB4VUq6TrJA9HLXaiF/qqCjtm/8aF0CBHT1D1ziEwmSw7r92V2Ehy77xIbmv2ZkMgjAuGa1OWuKJYrr6gn1EubCfsNBuvGtAebGEtN7ejESZaR7wpk1WogNHKYthT0OgS/53dAJ7IGZ6CaYxblXbUhXifWHFhsJwFUmqYrFUIGNMSBo92lqqy/9zhcHyic1Z8h5lmb7N7IUsNTHvtRfPaWYiJ8ARHMIToW/+2p/PKqVRAk8CBRaJHMQzJg4ZSijPXftzZ1hgaM4FZhcg8/OVQWM/5o+8l54KYlJ7wMAs5enZAuO1yhQ+nCTR1S1Y39iJ4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKN9yECXmDsEndmbuaFlWwWXnSInIwqhze3MZouyOac=;
 b=gGyqoo0KcajIHs3/yR7s+74MWLOC0RBWo0PIlPm2FhzW+oZ/Gga6je/BamQt4X8DJ4Y9wcQrbwi+TzIHvNbFFMj4iNl7MqDMCO8+DM4mlTa5rb5E1OD5qDUjyJCM7jNQJ21iscihaUHlXy8yV3nE4uZH9zbdUAyPaPEaMhhkZnukO+wtGKvGJwU8KELYwySlrRTIdNHZm4oGbkt/lKnbv3X6S5GG8bgCG+AauxM64XItZV7xnSz99E7pR5MvzvrETEmCIqHVCa+/4e9xg0AuE28tHAqImvP7u61axz/kCKLwW/2MgSKnitYwE+iD/GnC5cJ2cckyjOc6nr+G7TmzyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKN9yECXmDsEndmbuaFlWwWXnSInIwqhze3MZouyOac=;
 b=KF3VxJPMrN2zedZqkNFogyVEz9rrzGdIcNiqwrKjlNZ/iO/+gB9yW3csN0SUAwtq5gD+WAquwHbSjFj/I+MUoPuSWHCM4Yb13A+wDVE/n2cxd+xh+a1NRr1PgGLjauNg31UUbJgO62gAchp+1k/gxlCS/AtetKMyAd4b7Op/gVc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 22/36] block: split out bdrv_replace_node_noperm()
Date: Fri, 27 Nov 2020 17:45:08 +0300
Message-Id: <20201127144522.29991-23-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64b6143d-9113-4559-6901-08d892e32450
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50788CBFC5536E3728D0B073C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ED0AdNS7FWxHDAN7s0GBZ+QujZTcKNiLrOhaWHense6F+ENZiv0ax7pgWsVn2zAiB7NLBedQ1ctM4/naSrS0wWXRAPc37eL4IITohxAeYiKmYYg5as6BKq3Lfx580gRxchZ+kMHbl0OmssvJnjG1iQMx1voBe5i4K5GSWrKK4MMF1IJ1z6m40eXy+Ebsu0keDw3dBg+EoKOvr6hf6jDELeeyKWC3LKCBaL0WE8nD/vboNxaIF6Oao2C1JL76UcmFH3kgIYKy65DHz0QnkIPd32kXFAge2QZZJ4zEmzAEW5snNc+MhgiovbEKd6UCQ/bGIf6Ef46HRRsCdeHG8Y2ZlridJ3dWfhofCPKcW1Kl0IQwzHTb7XexUMJ3ZHvfcl/a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QwpG2OYIYA+McHJHb09AZRaqBrynsvBgg/lW6KR8qZBL4WAkkWfBgBVEs5T5?=
 =?us-ascii?Q?UAOgUbR6dkWL/KtqtKPjnR62S7C2u+1wv5W88OlRuVvmMceUFe7Jy6a7+xCz?=
 =?us-ascii?Q?DM2clVxIz3QZ6nYgQG5l0gmXYJXCdBUTSAR2ovWda2aE/yFhvZXie1izjJlv?=
 =?us-ascii?Q?PEmRcNf2my+Q/uaaR6Iz17HVIgP4Xg63NE0hRTwHAxyYONkc5U6tif4F27lM?=
 =?us-ascii?Q?EiRl8es4lY9Ki8a/DtHuhD+ZTLl/NnyObzYtQPIQT8djk3ofBhtW+jatd6fq?=
 =?us-ascii?Q?iVXFYKjQr520n458F9Pc7gfTx1uhTEokv/UtgfzYyymC69VI7oi2iARO+nMn?=
 =?us-ascii?Q?zevcjd0d2+qFQTOfcA4+QMh3LUjSAHAbvyuHSqbTT2XRknYnr6TqvXciquvp?=
 =?us-ascii?Q?RiUak6vf18xyGw1CI4BgIxgMqR5JWTuHyEePzBUIRR0Hh7HalgS8momhzPp9?=
 =?us-ascii?Q?hT4BXBglIeeevZpeCm1RlqBf6YVOmnXYWLyyEWpjsCORnRUGKKIs8WOh5g0L?=
 =?us-ascii?Q?U7tX2bUtEN9KAmogSdpsmVNCCzAfsthJiZX6PbIMxn22HlSZ0pKUE561fvkh?=
 =?us-ascii?Q?CUEBBCdSiTHZ31K+82gRDY8HPH9CzQAE4xECVZgG9CvGvq64FHgYAC+jFyd8?=
 =?us-ascii?Q?sX1GE3QDwUBxeoKYWb9ODxGJRBPjCjtgsQdRPcPE26xaYwzhhhdlMIM8k8Xf?=
 =?us-ascii?Q?WR4283ZLnY8waXDh3qnhptFa9fnk0eguQBKyJiUDMzPL3MbQGGkq2lpykzix?=
 =?us-ascii?Q?useZZsUya4CkIqnLNB1UlmnD87e8k3taIsxDzAlKLvg0i90Ib0Tu+zxx8e+z?=
 =?us-ascii?Q?6BHItIaNc2rz/R2QKZrRh506z8/qyuC4yuZE+yjqEY6Csw+SRvTYBnZtpLEY?=
 =?us-ascii?Q?qyO2gP6dZb0Gef9AmfdXr8KsB1UGomRb5Bwa6aTWbFbsfg6hD5vqBrPUTyfG?=
 =?us-ascii?Q?q/TguuVsE+OmPHJp3gysmLHnhTLN0LS93xMeAHyl4jpxGElm7Zc/lMudlagt?=
 =?us-ascii?Q?rGVc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b6143d-9113-4559-6901-08d892e32450
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:53.8909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2vcsij7/feogZLaG2q9LnaV58UUtZGGnHu0NoutPyJ0LTD0a/mr3ZPoVeFWhqt1Ebp4QxTFbHLq5LuUbjNvy3bnygcGqBc/xoRZTP7QkFs=
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

Split part of bdrv_replace_node_common() to be used separately.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 47 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/block.c b/block.c
index 162a247579..02da1a90bc 100644
--- a/block.c
+++ b/block.c
@@ -4897,6 +4897,33 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
+static int bdrv_replace_node_noperm(BlockDriverState *from,
+                                    BlockDriverState *to,
+                                    bool auto_skip, GSList **tran, Error **errp)
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
+            return -EPERM;
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
@@ -4909,7 +4936,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                                     bool auto_skip, Error **errp)
 {
     int ret = -EPERM;
-    BdrvChild *c, *next;
     GSList *tran = NULL;
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
@@ -4928,22 +4954,9 @@ static int bdrv_replace_node_common(BlockDriverState *from,
      * permissions based on new graph. If we fail, we'll roll-back the
      * replacement.
      */
-    QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
-        assert(c->bs == from);
-        if (!should_update_child(c, to)) {
-            if (auto_skip) {
-                continue;
-            }
-            error_setg(errp, "Should not change '%s' link to '%s'",
-                       c->name, from->node_name);
-            goto out;
-        }
-        if (c->frozen) {
-            error_setg(errp, "Cannot change '%s' link to '%s'",
-                       c->name, from->node_name);
-            goto out;
-        }
-        bdrv_replace_child_safe(c, to, &tran);
+    ret = bdrv_replace_node_noperm(from, to, auto_skip, &tran, errp);
+    if (ret < 0) {
+        goto out;
     }
 
     found = g_hash_table_new(NULL, NULL);
-- 
2.21.3


